---
title: QR code tracking overview
description: Learn how to detect QR codes, add webcam capabilities, and manage coordinate systems in Mixed Reality apps on HoloLens 2.
author: qianw211
ms.author: qianwen
ms.date: 4/14/2022
ms.topic: article
keywords: VR, LBE, location based entertainment, vr arcade, arcade, immersive, QR, QR code, QR code detection, HoloLens 2, QR code tracking
---

# QR code tracking overview

To access the GitHub repo for the QR code sample:

> [!div class="nextstepaction"]
> [QR code tracking in Unity](https://github.com/microsoft/MixedReality-QRCode-Sample)

With HoloLens 2 and immersive headsets, you can detect QR codes in the environment around the headset, establishing a coordinate system at each code's real-world location. You can also render holograms in the same location on multiple devices to create a shared experience. Once you enable your device's webcam, you'll recognize QR codes in the latest versions of your projects. For best results going into production, we recommend that you review the [best practices](#best-practices-for-qr-code-detection) section.

In this article, you'll learn about:

* [Supported devices for QR code tracking](#device-support)
* [Supported QR code versions](#supported-qr-code-versions)
* [Best practices for QR code detection](#best-practices-for-qr-code-detection)
  * [Quiet zones around QR codes](#quiet-zones-around-qr-codes)
  * [Lighting and backdrop](#lighting-and-backdrop)
  * [Size of QR codes](#size-of-qr-codes)
  * [Distance and angular position from the QR code](#distance-and-angular-position-from-the-qr-code) 
  * [Managing QR code data](#managing-qr-code-data)
  * [QR code placement in a space](#qr-code-placement-in-a-space)
* [Troubleshooting and FAQ](#troubleshooting-and-faq)
  * [What capabilities are needed?](#what-capabilities-are-needed)
  * [How do I make the QR Code Tracking Feature work on HoloLens 2 devices?](#how-do-i-make-the-qr-code-tracking-feature-work-on-hololens-2-devices)
  * [Where do I find the API plugin files?](#where-do-i-find-the-api-plugin-files)
  * [How do I prepare a UWP to use Microsoft.MixedReality.QR.QRCodeWatcher?](#how-do-i-prepare-a-uwp-to-use-microsoftmixedrealityqrqrcodewatcher)
  * [How do I prepare Unity with the Microsoft.MixedReality.QR.QRCodeWatcher?](#how-do-i-prepare-unity-with-the-microsoftmixedrealityqrqrcodewatcher)
  * [How can I make QR codes?](#how-can-i-make-qr-codes)
  * [If QR code tracking doesn't work in general, what do I do?](#if-qr-code-tracking-doesnt-work-in-general-what-do-i-do)
  * [What's the accuracy?](#whats-the-accuracy)
  * [How close do I need to be to the QR code to detect it?](#how-close-do-i-need-to-be-to-the-qr-code-to-detect-it)
  * [Why can't I read QR codes with logos?](#why-cant-i-read-qr-codes-with-logos)
  * [The QR codes are detected, so why am I getting no data?](#the-qr-codes-are-detected-so-why-am-i-getting-no-data)
  * [Are QR codes saved at the 'space' level or app level?](#are-qr-codes-saved-at-the-space-level-or-app-level)
  * [How does that work with the underlying platform? Where do they persist?](#how-does-that-work-with-the-underlying-platform--where-do-they-persist)
  * [How do I debug the app in Visual studio when I receive the "`Microsoft.MixedReality.QR.pdb` not found" error message?](#how-do-i-debug-the-app-in-visual-studio-when-i-receive-the-microsoftmixedrealityqrpdb-not-found-error-message)


## Device support

| Feature          | [HoloLens 1st Gen](/hololens/hololens1-hardware) | [HoloLens 2](https://www.microsoft.com/hololens/hardware) | Immersive headsets         |
|:------------:|:--------------------------------------------------------------------------:|:---------------------------------------------------------:|:------------------:|
| QR code detection |                                                                         | :heavy_check_mark:                                        | :heavy_check_mark: |

> [!NOTE]
> QR code tracking with immersive Windows Mixed Reality headsets on desktop PCs is supported on Windows 10 Version 2004 and higher. Use the `Microsoft.MixedReality.QRCodeWatcher.IsSupported()` API to determine whether the feature is supported on the current device.

## Supported QR code versions

The following table lists the supported and unsupported QR code versions:

| &nbsp;   | QR Code versions  |
| :--- | :--- |
| Supported: |  <ul> <li> QR versions 1 - 10 </li>  <li> Micro QR codes M1-M4 </li> <li> All encodings </li> |
| Not supported: | <ul> <li> QR Codes 10 - 20 (these may work, but are not guaranteed) </li> <li> QR Codes 20+ </li> <li> Tweaked modules, for example: circular modules, reflections, inverted (black/white). </li> <li> Logos </li> <li> Structured appends </li> <ul> |

## Best practices for QR code detection

### Quiet zones around QR codes

To be read correctly, QR codes require a margin around all sides of the code. This margin must not contain any printed content and should be four modules (a single black square in the code) wide. 

The [QR spec](https://www.qrcode.com/en/howto/code.html) contains more information about quiet zones.

### Lighting and backdrop

QR code detection quality is susceptible to varying illumination and backdrop.
 
* Under normal lighting conditions, provide enough contrast for the black/white modules for better performance.

* In extreme lighting conditions with bright lighting or dark backdrop, you can try to reduce and adjust contrast which could improve QR code detection rate. The white background within the QR code can be reduced from 255 downwards.

### Size of QR codes

Windows Mixed Reality devices don't work with QR codes with sides smaller than 5 cm.

For QR codes with sides ranging from 5 cm to 10 cm, the device must be fairly close to detect the code. It may take longer to detect the code.

The exact time to detect codes depends not only on the size of the QR codes, but how far away you are from the code. Moving closer to the code will help offset issues with size.

### Distance and angular position from the QR code

The tracking cameras can only detect a certain level of detail. For small codes (less than 10 cm along the sides) you must be fairly close. For a version 1 QR code varying from 10 cm to 25 cm in size, the minimum detection distance is between 0.15 meters and 0.5 meters. 

The detection distance for size increases linearly, but also depends on [supported QR version](#supported-qr-code-versions) or module size. The higher the version, the smaller the modules, which can only be detected from a closer position. You can also try micro-QR codes if you want the distance of detection to be longer. QR detection works with a range of angles += 45 deg to ensure we have proper resolution to detect the code.

Other detection considerations:

* QR codes on curved surfaces aren’t supported.
* In-plane orientation is supported. Out of plane should be <= +-45 looking straight on to have better detection.
* The physical size of the QR code should have modules of at least 2/3 pixels. Note: Higher versions of QR codes will have smaller modules.

For the tradeoff relationship between distance and size of the QR code for optimal detection, see the following graph:

<img src="images\module-size-vs-detection-range-chart.png " alt="QR code size distance chart">

> [!IMPORTANT]
> Always make sure you have enough contrast and a proper border.

### Managing QR code data

Windows Mixed Reality devices detect QR codes at the system level in the driver. When the device is rebooted or the driver restarts, the detected QR codes history is cleared. QR codes redetected are treated as new objects.

We recommend configuring your app to ignore QR codes older than a specific timestamp, which can be specified within the app. The QR Code API specifies the time that last detection happened. Most app developers will use the system time when the app is launched to determine the time a QR code is detected. 

QR code data aren’t app-specific. Upon app launch, there will be a list of available QR codes being provided. The app developer will determine which QR codes are relevant to this app.

### QR code placement in a space
For recommendations on where and how to place QR codes, refer to [Environment considerations for HoloLens](/hololens/hololens-environment-considerations).

## Troubleshooting and FAQ

### What capabilities are needed?

You'll need the **webcam** capability added to your manifest (checkbox in [Unity Capabilities](../unity/recommended-settings-for-unity.md#capabilities)). If you're building as a standard UWP project, it’s also in the `package.appxmanifest` in the solution project.

Request access by calling the following function:

```
#if WINDOWS_UWP

async QRCodeWatcher.RequestAccessAsync();

#endif
```

The access status should be `(status == QRCodeWatcherAccessStatus::Allowed)`.

If access is denied, then the feature will return access denied when you start the `QRTracking`.

This API should be called before you construct the `QRCodeWatcher` object.

If you're running the project from Unity, you also need to ensure that you're calling from the UI thread.  Otherwise, the API will always return denied. For more information, see [AppCallbacks class](https://docs.unity3d.com/Manual/windowsstore-appcallbacks.html) in the Unity Manual.

For more information on setting up your project for Unity, see [configure Unity for Windows Mixed Reality](/training/modules/learn-mrtk-tutorials/1-3-exercise-configure-unity-for-windows-mixed-reality?ns-enrollment-type=LearningPath&ns-enrollment-id=learn.azure.beginner-hololens-2-tutorials&tabs=openxr).

### How do I make the QR Code Tracking Feature work on HoloLens 2 devices? 

QR tracking is automatic on HoloLens 2, and you'll need the "webcam" capability added to your app. 

### Where do I find the API plugin files?

All the required files and documentation can be found here.

<https://www.nuget.org/packages/Microsoft.MixedReality.QR>

### How do I prepare a UWP to use Microsoft.MixedReality.QR.QRCodeWatcher?

* Use the NuGet pack to unpack the required files.

* Add a reference to the `Microsoft.MixedReality.QR.winmd` in your project and start using the API.

* Add the correct architecture versions of the plugins and use them accordingly in the build.

### How do I prepare Unity with the Microsoft.MixedReality.QR.QRCodeWatcher?

Use NuGet for Unity and point to the NuGet pack above.

### How can I make QR codes?

Check out any QR code generator--[here's one example](https://www.the-qrcode-generator.com/).

### If QR code tracking doesn't work in general, what do I do?

* Is the QR Code version a supported version? We don't support the high-density versions like version 40. Nothing above version 10 is guaranteed; versions above 20 aren’t supported.
* Are you close enough to the QR code? See [distance and angular position from the QR code](#distance-and-angular-position-from-the-qr-code).
* How is the lighting? There’s a known issue where detection becomes difficult when the QR code is on a dark environmental background--the QR code will appear washed out to the camera due to high contrast. For more information, see [lighting and backdrop](#lighting-and-backdrop).

### What's the accuracy?

When detected in a single frame, the size is expected to have at most a 1% error from the actual size. For example, a 10 cm code might be up to +/- 1 mm off in measured size. Under continuous detection, a code's position might drift around by up to +/- 2.5 mm. Once you’ve moved out of detection range, a previous detection's position is up to the mercy of the map error.

### How close do I need to be to the QR code to detect it?

The distance obviously depends on the size of the QR code, and also what version it is. For more information, see [distance and angular position from the QR code](#distance-and-angular-position-from-the-qr-code).

* On HoloLens 2, for a version 1 QR code varying from 5 cm sides to 25 cm sides, the minimum detection distance ranges from 0.25 meters to 0.5 meters. The furthest these can be detected from goes from about 0.5 m for the smallest code to two meters for the bigger.
* On Windows Mixed Reality, these distances for the sizes are halved.
* For any codes bigger, extrapolate--the detection distance for size increases linearly. For any code smaller, detection simply won’t occur--4-5 cm is the smallest we can detect.

### Why can't I read QR codes with logos?

Currently, we don't support QR codes with logos.

### The QR codes are detected, so why am I getting no data?

* If the platform can’t decode the QR code, there will be no data.  You can use the stream and interpret the data using open-source code. 
* Some features, such as structure append, aren’t supported.

For more information, see [what QR code versions are supported?](#supported-qr-code-versions).

### Are QR codes saved at the ‘space’ level or app level? 

QR codes are saved at the system level in driver session, or boot session on HoloLens. For more information, see [managing QR code data](#managing-qr-code-data).

### How does that work with the underlying platform?  Where do they persist? 

Detected QR codes are persisted in memory by the driver.

### How do I debug the app in Visual Studio when I receive the "`Microsoft.MixedReality.QR.pdb` not found" error message?

Symbol loading for `Microsoft.MixedReality.QR.dll` was skipped because it isn’t specified in the included modules list.  

#### To reproduce

Follow the steps to reproduce this behavior:

1. Install Microsoft.MixedReality.QR (NuGet) and MRTK
2. Try to debug

You should be able to debug the app with Microsoft.MixedReality.QR.dll, but the DLL isn’t found:

<img src="images\mr-qr-pdb-not-included.png" alt="Microsoft.MixedReality.QR.pdb not found error message">

#### Recommended solution

We're working on adding symbols to the next release. In the meantime, you should still be able to debug your app by excluding the DLL in the Visual Studio options: 

<img src="images\exclude-dll.png" alt="excluding the DLL in Visual Studio options">

For more information, see [Configuring Visual Studio’s settings](https://devblogs.microsoft.com/devops/understanding-symbol-files-and-visual-studios-symbol-settings/#configuring-visual-studios-settings).

## See also
* [QR code tracking with native C++ and C# samples](../native/qr-code-tracking-cs-cpp.md)
* [QR code tracking in Unity](../unity/qr-code-tracking-unity.md)
* [Coordinate systems](../../design/coordinate-systems.md)
* [Azure Spatial Anchors](/azure/spatial-anchors/overview)
* [HoloLens 2 Locatable camera overview](./locatable-camera-overview.md#hololens-2)

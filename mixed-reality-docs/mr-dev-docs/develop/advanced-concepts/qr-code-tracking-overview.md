---
title: QR code tracking overview
description: Learn how to detect QR codes, add webcam capabilities, and manage coordinate systems in mixed reality apps on HoloLens 2.
author: qianw211
ms.author: qianwen
ms.date: 1/24/2022
ms.topic: article
keywords: VR, LBE, location based entertainment, vr arcade, arcade, immersive, QR, QR code, QR code detection, HoloLens 2, QR code tracking
---

# QR code tracking overview

To access the GitHub repo for the QR code sample:

> [!div class="nextstepaction"]
> [QR code tracking in Unity](https://github.com/microsoft/MixedReality-QRCode-Sample)

HoloLens 2 and immersive headsets can detect QR codes in the environment around the headset, establishing a coordinate system at each code's real-world location. HoloLens 2 and immersive headsets can also render holograms in the same location on multiple devices to create a shared experience. Once you enable your device's webcam, you'll recognize QR codes in the latest versions of your projects. For best results going into production, we recommend that you review the [best practices](#best-practices-for-qr-code-detection) section.

In this article, you'll learn about:

* [Supported devices for QR code tracking](#device-support)
* [Best practices for QR code detection](#best-practices-for-qr-code-detection)
  * [Quiet zones around QR codes](#quiet-zones-around-qr-codes)
  * [Lighting and backdrop](#lighting-and-backdrop)
  * [Size of QR codes](#size-of-qr-codes)
  * [Distance and angular position from the QR code](#distance-and-angular-position-from-the-qr-code) 
* [Troubleshooting and FAQ](#troubleshooting-and-faq)

## Device support

| Feature          | [HoloLens 1st Gen](/hololens/hololens1-hardware) | [HoloLens 2](https://www.microsoft.com/hololens/hardware) | Immersive headsets         |
|:------------:|:--------------------------------------------------------------------------:|:---------------------------------------------------------:|:------------------:|
| QR code detection |                                                                         | :heavy_check_mark:                                        | :heavy_check_mark: |

> [!NOTE]
> QR code tracking with immersive Windows Mixed Reality headsets on desktop PCs is supported on Windows 10 Version 2004 and higher. Use the `Microsoft.MixedReality.QRCodeWatcher.IsSupported()` API to determine whether the feature is supported on the current device.

## Best practices for QR code detection

### Quiet zones around QR codes

To be read correctly, QR codes require a margin around all sides of the code. This margin must not contain any printed content and should be four modules (a single black square in the code) wide. 

The [QR spec](https://www.qrcode.com/en/howto/code.html) contains more information about quiet zones.

### Lighting and backdrop

QR code detection quality is susceptible to varying illumination and backdrop. 

In a scene with bright lighting, print a code that is black on a gray background. Otherwise, print a black QR code on a white background.

If the backdrop to the code is dark, try a black on gray code if your detection rate is low. If the backdrop is relatively light, a regular code works fine.

### Size of QR codes

Windows Mixed Reality devices don't work with QR codes with sides smaller than 5 cm each.

For QR codes between 5 cm and 10-cm length sides, you must be fairly close to detect the code. It will also take longer to detect codes at this size. 

The exact time to detect codes depends not only on the size of the QR codes, but how far you're away from the code. Moving closer to the code will help offset issues with size.

### Distance and angular position from the QR code

The tracking cameras can only detect a certain level of detail. For small codes - < 10 cm along the sides - you must be fairly close. For a version 1 QR code varying from 10 cm to 25 cm wide, the minimum detection distance ranges from 0.15 meter to 0.5 meter. 

The detection distance for size increases linearly, but also depends on QR version or module size. The higher the version, the smaller the modules, which can only be detected from a closer position. You can also try micro-QR codes if you want the distance of detection to be longer. QR detection works with a range of angles += 45 deg to ensure we have proper resolution to detect the code.

Other detection considerations:

* QR codes on curved surfaces are not supported.
* In-plane orientation is supported. Out of plane should be <= +-45 looking straight on to have better detection.
* The Physical size of the QR code should have modules of at least 2/3 pixels. Note: Higher versions of QR codes will have smaller modules.

For the tradeoff relationship between distance and size of the QR code for optimal detection, see the following graph:

<img src="images\module-size-vs-detection-range-chart.svg" alt="QR code size distance chart">

> [!IMPORTANT]
> Always make sure you have enough contrast and a proper border.

### Managing QR code data

Windows Mixed Reality devices detect QR codes at the system level in the driver. When the device is rebooted or the driver restarts, the detected QR codes history is cleared and will be redetected as new objects next time.

We recommend configuring your app to ignore QR codes older than a specific timestamp, which can be specified within the App. The QR Code API specifies the time last detection happened. Most app developers will use the system time when the app is launched to determine when a QR code is detected. 

QR Code data are not app-specific. Upon app launch, there will be a list of available QR codes being provided.  The app developer will determine which QR codes are relevant to this app.

See also [How to clear the codes from my app?](#how-to-clear-the-codes-from-my-app-it-seems-once-you-find-a-code-they-tend-to-persist)

### QR code placement in a space
For recommendations on where and how to place QR codes, refer to [Environment considerations for HoloLens](/hololens/hololens-environment-considerations).

## Troubleshooting and FAQ

### What QR code versions are supported?

We support the following QR code versions:

* QR versions 1 - 10 are supported. We cannot guarantee nor support higher version QR codes, but it is possible to detect versions 10 through 20. Versions above 20 are definitely not supported.
* Micro QR codes M1-M4 are supported.
* We do not support logos.
* We do not support tweaked modules, for example: circular modules, reflections, inverted (black/white).
* All encodings are supported.
* Structure append is not supported.

### What capabilities are needed?

You'll need the **webcam** capability added to your manifest (checkbox in [Unity Capabilities](/windows/mixed-reality/develop/unity/recommended-settings-for-unity#capabilities)). If you're building as a standard UWP project, it is also in the `package.appxmanifest` in the solution project.

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

For more information on setting up your project for Unity, see [configure Unity for Windows Mixed Reality](/learn/modules/learn-mrtk-tutorials/1-3-exercise-configure-unity-for-windows-mixed-reality?ns-enrollment-type=LearningPath&ns-enrollment-id=learn.azure.beginner-hololens-2-tutorials&tabs=openxr).

### How to make QR Code Tracking Feature work on HoloLens 2 devices? 

QR tracking is automatic on HoloLens 2, and you'll need the "webcam" capability added to your app. 

### Where do I find the API plugin files?

All the required files and documentation can be found here.

<https://www.nuget.org/packages/Microsoft.MixedReality.QR/0.5.2032-rc>

### How do I prepare a UWP to use Microsoft.MixedReality.QR.QRCodeWatcher?

Use the NuGet pack to unpack the required files.

Add a reference to the `Microsoft.MixedReality.QR.winmd` in your project and start using the API.

Add the correct architecture versions of the plugins and use them accordingly in the build.

### How do I prepare Unity with the Microsoft.MixedReality.QR.QRCodeWatcher?

Use NuGet for Unity and point to the NuGet pack above.

### How can I make QR codes?

* From any QR code generator, see <https://www.the-qrcode-generator.com/>

### If it doesn't work in general:

* Is the QR Code version a supported version? We don't support the high-density versions like version 40. Nothing above version 10 is guaranteed, versions above 20 are not supported.
* Are you close enough to the QR code? See [distance and angular position from the QR code](#distance-and-angular-position-from-the-qr-code).
* How is the lighting? There is a known issue where detection becomes difficult when the QR code is on a dark environmental background. When there's a dark background, the QR Code will appear washed out to the camera due to high contrast. For more information, see [lighting and backdrop](#lighting-and-backdrop).

### What's the accuracy?

When detected in a single frame, the size is expected to have at most a 1% error from the actual size, for example: a 10-cm code might be up to +/- 1 mm off in measured size. Under continuous detection, a code's position might drift around by up to +/- 2.5 mm. Once you have moved out of detection range, a previous detection's position is up to the mercy of the map error.

### How close do I need to be to the QR code to detect it?

The distance obviously depends on the size of the QR code, and also what version it is. For more information, see [distance and angular position from the QR code](#distance-and-angular-position-from-the-qr-code).

* On HoloLens 2, for a version 1 QR code varying from 5-cm sides to 25-cm sides, the minimum detection distance ranges from 0.25 meter to 0.5 meter. The furthest these can be detected from goes from about 0.5 m for the smallest code to 2 meters for the bigger.
* On Windows Mixed Reality, these distances for the sizes are halved.
* For any codes bigger, extrapolate - the detection distance for size increases linearly. For any code smaller, detection simply will not occur - 4-5 cm is the smallest we can detect.

### Why can't I read QR codes with logos?

Currently, we don't support QR codes with logos.

### Are Micro QR codes supported?

Yes, Micro QR codes are supported.

### QR codes detected, but why am I getting no data?

* If the platform cannot decode the QR code, there will be no data.  You can use the stream and interpret the data using open-source code. 
* Some features such as structure append and micro-QR codes are not supported.

### How to clear the codes from my app? It seems once you find a code, they tend to persist?

QR codes only persist in the boot session. Once you reboot your device (or restart the driver), QR codes will be detected as new objects. QR codes are unique and persist within the driver session.

You can ignore the QR codes older than a timestamp if you want. Currently the API does not have a way to clear them as multiple apps might be interested in them. At the app level, you can ignore QR codes not updated recently. A logic can be added to ignore the ones not updated, for example time `t`.  It's app-specific, and up to the app developer to decide on what to do.

#### How do I get the time stamp from the `QueryPerformanceCounter` QPC ticks?

```
long EndingTime = System.Diagnostics.Stopwatch.GetTimestamp();
long ElapsedTime = EndingTime - (long)qrCode.LastDetectedQPCTicks;
double ElapsedSecs = ElapsedTime * (1.0f / System.Diagnostics.Stopwatch.Frequency);

QRTimeStamp.text = "Time:" + System.DateTime.Now.AddSeconds(-ElapsedSecs).ToString("MM/dd/yyyy HH:mm:ss.fff");
```

#### Are QR codes saved at the ‘space’ level or app level?  It seems to me it is beyond app? 

QR codes are saved at the system level in driver session, or boot session on HoloLens. For more information, see [managing QR code data](#managing-qr-code-data).

#### How does that work with the underlying platform?  Where do they persist? 

They only persist in memory (ASIC/SOC).

## See also
* [QR code tracking with native C++ and C## samples](../native/qr-code-tracking-cs-cpp.md)
* [QR code tracking in Unity](../unity/qr-code-tracking-unity.md)
* [Coordinate systems](../../design/coordinate-systems.md)
* [Azure Spatial Anchors](/azure/spatial-anchors/overview)
* [HoloLens 2 Locatable camera overview](/windows/mixed-reality/develop/advanced-concepts/locatable-camera-overview#hololens-2)
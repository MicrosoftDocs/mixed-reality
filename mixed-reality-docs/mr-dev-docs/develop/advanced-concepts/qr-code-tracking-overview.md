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

With Windows Mixed Reality and HoloLens headsets, your app can detect QR codes in the environment around the headset, establishing a coordinate system at each code's real-world location. You can also render holograms in the same location on multiple devices to create a shared experience. Once you enable your device's webcam, you'll recognize QR codes in the latest versions of your projects. For best results going into production, we recommend that you review the [best practices](#best-practices-for-qr-code-detection) section.

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
| OpenXR         | | :heavy_check_mark: (with OpenXR Runtime version 113 and OpenXR [XR_MSFT_scene_marker](https://registry.khronos.org/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_scene_marker) extension) | |
| Mixed Reality Unity Plugin   | | :heavy_check_mark: (with OpenXR Runtime version 113 and Mixed Reality Unity Plugin [ARMarker](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr.armarker)) | |
| Legacy QR SDK  | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |

> [!NOTE]
> The following is specific to the legacy QR code APIs. We recommend using the OpenXR implementation for QR codes instead.
>
> Using the legacy QR code SDK, QR code tracking with immersive Windows Mixed Reality headsets on desktop PCs is supported on Windows 10 Version 2004 and higher. Use the `Microsoft.MixedReality.QRCodeWatcher.IsSupported()` API to determine whether the feature is supported on the current device.

## Supported QR code versions

The following table lists the supported and unsupported QR code versions:

| &nbsp;   | QR code versions  |
| :--- | :--- |
| Supported: |  <ul> <li> QR Code versions 1 - 10 </li>  <li> Micro QR Codes M1-M4 </li> <li> All encodings </li> |
| Not supported: | <ul> <li> QR Codes 10 - 20 (not fully supported) </li> <li> QR Codes versions 21+ </li> <li> Tweaked modules, for example: circular modules, reflections, inverted (black/white). </li> <li> Logos </li> <li> Structured appends </li> <ul> |

## Best practices for QR code detection

### Quiet zones around QR codes

To be read correctly, QR codes require a margin around all sides of the code. This margin must not contain any printed content and should be four modules (a single black square in the code) wide.

The [official QR code documentation](https://www.qrcode.com/en/howto/code.html) contains more information about quiet zones.

### Lighting and backdrop

QR code detection quality is susceptible to varying illumination and backdrop.

* Under normal lighting conditions, provide enough contrast for the black/white modules for better performance.

* In extreme lighting conditions with bright lighting or dark backdrop, you can try to reduce and adjust contrast which could improve QR code detection rate. The white background within the QR code can be reduced from 255 downwards.

### Size of QR codes

Windows Mixed Reality and HoloLens devices don't work with QR codes with sides smaller than 5 cm.

For QR codes with sides ranging from 5 cm to 10 cm, the device must be fairly close to detect the code. It may take longer than average to detect the code.

The exact time to detect codes depends not only on the size of the QR codes, but how far away you are from the code. Moving closer to the code will help offset issues with size.

### Distance and angular position from the QR code

The tracking cameras can only detect a certain level of detail. For small codes (less than 10 cm along the sides), you must be fairly close. For a version 1 QR code varying from 10 cm to 25 cm in size, the minimum detection distance is between 0.15 meters and 0.5 meters.

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

Windows Mixed Reality and HoloLens devices detect QR codes at the system level in the driver. When the device is rebooted or the driver restarts, the detected QR codes history is cleared. QR codes redetected are treated as new objects.

We recommend configuring your app to ignore QR codes older than a specific timestamp, which can be specified within the app. The QR Code API specifies the time that last detection happened. Most app developers will use the system time when the app is launched to determine the time a QR code is detected.

QR code data aren’t app-specific. Upon app launch, there will be a list of available QR codes being provided. The app developer will determine which QR codes are relevant to this app.

### QR code placement in a space

For recommendations on where and how to place QR codes, refer to [Environment considerations for HoloLens](/hololens/hololens-environment-considerations).

## Troubleshooting and FAQ

### What capabilities are needed?

To enable QR code tracking in your HoloLens application, add the webcam capability to the application’s manifest. If you are developing in Unity, you can configure this from the player settings.

Additionally, users may be prompted by the permissions dialog to grant your app webcam permissions. This only happens once over the lifetime of an app. In cases such as the app explicitly requesting webcam access, the dialog will not reappear.

For Unity apps with the WebCam capability, enabling [ARMarkerManager](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr.armarkermanager) in a scene can trigger the webcam permission dialog to appear.

For native OpenXR C++ apps, initial calls to [xrComputeNewSceneMSFT](https://registry.khronos.org/OpenXR/specs/1.0/html/xrspec.html#xrComputeNewSceneMSFT) with `XrNewSceneComputeInfoMSFT::requestedFeatures` containing `XR_SCENE_COMPUTE_FEATURE_MARKER_MSFT` can trigger the permissions dialog.

> [!NOTE]
> The following is specific to the legacy QR code APIs. We recommend using the OpenXR implementation for QR codes instead.

You'll need the webcam capability added to your manifest (checkbox in Unity Capabilities). If you're building as a standard UWP project, it’s also in the package.appxmanifest in the solution project.

In the legacy QR code SDK, request access by calling the following method:

```csharp
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

Applications should use the HoloLen’s OpenXR Runtime for detecting QR Codes. OpenXR for Windows Mixed Reality ([113.2403.5001](https://github.com/microsoft/OpenXR-MixedReality/releases/tag/113.2403.5001) or greater) provides QR code support on HoloLens devices.

For Unity apps, QR code support is provided through the [`ARMarkerManager`](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr.armarkermanager) component provided with [Mixed Reality OpenXR Plugin](https://www.microsoft.com/download/details.aspx?id=102778).

For QR code support in non-Unity apps, use the OpenXR [XR_MSFT_scene_marker](https://registry.khronos.org/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_scene_marker) extension.

> [!NOTE]
> The following is specific to the legacy QR code APIs. We recommend using the OpenXR implementation for QR codes instead.

All the required files and documentation can be found here on NuGet here:

[Microsoft.MixedReality.QR](https://www.nuget.org/packages/Microsoft.MixedReality.QR)

### How do I prepare a Unity app to use ARMarkerManager to detect QR codes?

In Unity apps, the [ARMarkerManager](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr.armarkermanager) component is used to handle how QR code detection within a physical environment is represented in a scene. ARMarkerManager provides:

* Events for notifying subscribers when a detected QR code has been added to the manager, updated, or removed.

* A collection of [ARMarker](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr.armarker) trackables for QR codes under detection.

* Methods returning data for QR codes as specified by trackable ID.

To use ARMarkerManager in your app, you first need to run the Mixed Reality Feature Tool ([download](https://www.microsoft.com/en-my/download/details.aspx?id=102778)) and install the Mixed Reality OpenXR Plugin as indicated below:

<img src="images\Mixed_Reality_Feature_Tool_Mixed_Reality_OpenXR_Plugin_Feature.png" alt="Mixed Reality Feature Tool OpenXR Plugin Feature Selected">

See [Welcome to the Mixed Reality Feature Tool](https://learn.microsoft.com/windows/mixed-reality/develop/unity/welcome-to-mr-feature-tool) to learn about the tool.

The general procedure next is to:

1. In your Unity project, create a prefab and attach the ARMarker and ARMarkerScale components to it as shown below:
  <img src="images\ARMarkerManager_Prefab_Configuration.png" alt="Prefab with ARMarker and ARMarkerScale attached">
1. Open a scene you want QR codes to be detected when running.
1. Attach ARMarkerManager to a GameObject in your scene and set **Marker Prefab** to the prefab you created.
  <img src="images\ARMarkerManager_Prefab_Specified.png" alt="ARMarkerManager attached to GameObject and Prefab Selected">

For an example of how to use QR codes in your Unity app, see the [QR code sample scenario](https://github.com/microsoft/OpenXR-Unity-MixedReality-Samples/tree/main/SampleScenarios/Scenarios/MarkerSample) on GitHub.

### How do I prepare a non-Unity app to use OpenXR to detect QR codes?

QR code detection in OpenXR is provided through the [XR_MSFT_scene_marker](https://registry.khronos.org/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_scene_marker) extension. This extension allows multiple QR codes to be tracked and can provide size, position, last detection timestamp, UUID, and buffered QR code data for detected QR codes.

To enable QR code support, both the XR_MSFT_scene_marker and [XR_MSFT_scene_understanding](https://registry.khronos.org/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_scene_understanding) extensions must be enabled.

Typically, the next steps would be to:

  1. Verify whether marker detection is a supported feature.
  1. Create a scene observer handle.
  1. Compute a new scene and poll its state once completed.
  1. Retrieve a handle for the scene.
  1. Get detected QR codes from the scene’s components.

For a more detailed step-by-step, see the [XR_MSFT_scene_marker](https://registry.khronos.org/OpenXR/specs/1.0/html/xrspec.html#_overview_22) extension overview in the OpenXR 1.0 specification.

For an example of how to use QR codes, see [Scene_QRCode.cpp](https://github.com/microsoft/OpenXR-MixedReality/blob/main/samples/SceneUnderstandingUwp/Scene_QRCode.cpp) in the [SceneUnderstandingUwp](https://github.com/microsoft/OpenXR-MixedReality/blob/main/samples/SceneUnderstandingUwp/) sample on GitHub.

### How do I prepare a UWP to use Microsoft.MixedReality.QR.QRCodeWatcher?

> [!NOTE]
> The following is specific to the legacy QR code APIs. We recommend using the OpenXR implementation for QR codes instead.

* Use the NuGet pack to unpack the required files.

* Add a reference to the `Microsoft.MixedReality.QR.winmd` in your project and start using the API.

* Add the correct architecture versions of the plugins and use them accordingly in the build.

### How do I prepare Unity with the Microsoft.MixedReality.QR.QRCodeWatcher?

> [!NOTE]
> The following is specific to the legacy QR code APIs. We recommend using the OpenXR implementation for QR codes instead.

Use NuGet for Unity and point to the NuGet pack above.

### How can I make QR codes?

Check out any QR code generator.

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

QR codes with logos are not supported.

### The QR codes are detected, so why am I getting no data?

* If the platform can’t decode the QR code, there will be no data.  You can use the stream and interpret the data using open-source code.

* Some features, such as structure append, aren’t supported.

For more information, see [what QR code versions are supported?](#supported-qr-code-versions).

### Are QR codes saved at the ‘space’ level or app level?

QR codes are saved at the system level in driver session, or boot session on HoloLens. For more information, see [managing QR code data](#managing-qr-code-data).

### How does that work with the underlying platform?  Where do they persist?

Detected QR codes are persisted in memory by the driver.

### How do I debug the app in Visual Studio when I receive the "`Microsoft.MixedReality.QR.pdb` not found" error message?

> [!NOTE]
> The following is specific to the legacy QR code APIs. We recommend using the OpenXR implementation for QR codes instead.

Symbol loading for `Microsoft.MixedReality.QR.dll` was skipped because it isn’t specified in the included modules list.

#### To reproduce

> [!NOTE]
> The following is specific to the legacy QR code APIs. We recommend using the OpenXR implementation for QR codes instead.

Follow the steps to reproduce this behavior:

1. Install Microsoft.MixedReality.QR (NuGet) and MRTK
2. Try to debug

You should be able to debug the app with Microsoft.MixedReality.QR.dll, but the DLL isn’t found:

<img src="images\mr-qr-pdb-not-included.png" alt="Microsoft.MixedReality.QR.pdb not found error message">

#### Recommended solution

> [!NOTE]
> The following is specific to the legacy QR code APIs. We recommend using the OpenXR implementation for QR codes instead.

We're working on adding symbols to the next release. In the meantime, you should still be able to debug your app by excluding the DLL in the Visual Studio options:

<img src="images\exclude-dll.png" alt="excluding the DLL in Visual Studio options">

For more information, see [Configuring Visual Studio’s settings](https://devblogs.microsoft.com/devops/understanding-symbol-files-and-visual-studios-symbol-settings/#configuring-visual-studios-settings).

### Is there a limit of how many QR codes can be scanned in a session?

There is a limit of 100 QR codes saved at the system level in the driver, within 10 minutes.  

### Has QR code smoothing process changed?

QR code smoothing process changed after 20H2, from pose smoothing to size smoothing. To revert behavior to the previous smoothing process, one would apply a smoothing algorithm if the new QR code pose data is detected within 5 seconds or 10 cm of the previously detected frame. The transform data is blended via a weighted ratio of 90% of the current frame with 10% of the previous frame.

## See also

* [QR code tracking with native C++ and C# samples](../native/qr-code-tracking-cs-cpp.md)
* [Coordinate systems](../../design/coordinate-systems.md)
* [Azure Spatial Anchors](/azure/spatial-anchors/overview)
* [HoloLens 2 Locatable camera overview](./locatable-camera-overview.md#hololens-2)

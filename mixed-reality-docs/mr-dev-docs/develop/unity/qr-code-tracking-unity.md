---
title: QR code tracking
description: Learn how to work with QR codes in Unity mixed reality apps on HoloLens 2.
author: v-zlayne
ms.author: zacharylayne
ms.date: 06/11/2024
ms.topic: article
keywords: vr, lbe, location based entertainment, vr arcade, arcade, immersive, qr, qr code, hololens2, tracking
---

Before continuing, we recommend going through the[QR codes overview](../advanced-concepts/qr-code-tracking-overview.md).

HoloLens 2 headsets can track and detect QR codes that can be used to provide holograms and other AR features. This topic will walk you through everything you need to know to start using QR codes in your Unity app.

## Configuring your Unity project and app

Your Unity project and app must be set up and configured properly to enable QR code functionality. This requires:

* OpenXR for Windows Mixed Reality version 113.2403.5001 or later.
  > [!NOTE]
  > This comes with the OS and is updatable through the Windows Store. However, please be aware that users may have earlier versions installed, and their devices will be unable to work with AR markers such as QR codes.
* A project compatible with a supported version of Unity:
  * Unity 2022.3 LTS (Recommended)
  * Unity 2021.3 LTS
* The Mixed Reality OpenXR Plugin.
* Webcam capabilities enabled for your Unity project.
* Webcam permissions granted to your app.

The following sections will guide you through this.

### Getting the Mixed Reality OpenXR Plugin

The [Mixed Reality OpenXR Plugin](https://assetstore.unity.com/packages/add-ons/mixed-reality-openxr-plugin-275111#releases) package contains [C# APIs](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr) you can use to access QR code functionality.

To import the package:

1. [Download](https://www.microsoft.com/download/details.aspx) and run the Mixed Reality Feature Tool.
1. Install the Mixed Reality OpenXR Plugin as indicated below:
  ![Install Mixed Reality OpenXR Plugin](images/Mixed-Reality-Feature-Tool-Mixed-Reality-OpenXR-Plugin-Feature.png)

The Mixed Reality Feature Tool also simplifies package management and can be used to find, update, and add the Mixed Reality features your app requires. See [Welcome to the Mixed Reality Feature Tool](./mixed-reality-openxr-plugin.md) for detailed instructions on how to use the tool.

### Adding WebCam capabilities and granting permissions

To detect and track QR codes, your Unity project needs to have **WebCam** capabilities enabled and permissions granted.

To enable **WebCam** capabilities:

1. Open your Unity project.
1. Click **Edit** in the Unity editor’s app menu.
1. Go to **Project Settings > Player** and select the **UWP** tab as shown below.
  ![UWP Tab Settings](images/Player-Settings-UWP-Settings.png)
1. Enable **WebCam** in the **Capabilities** list.
  ![WebCam Capabilities Enabled](images/Player-Settings-WebCam-Cap.png)
1. Exit **Project Settings**.

**WebCam** capabilities are now enabled for your Unity app. However, the app must still be granted webcam permissions.

#### Webcam permissions

If your app has **WebCam** capabilities enabled, users are prompted to grant 
The permissions dialog prompts users to grant or deny your app webcam permissions. However, the dialog is only shown to users once during your app’s lifetime. If it hasn’t, it can be triggered the first time an [`ARMarkerManager`](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr.armarkermanager) in a scene has QR code marker support enabled.

![Permissions Dialog](images/*)

### Building QR code detection into a scene

QR code detection must be built into every scene you want to use QR codes. This requires:

* A [`GameObject`](https://docs.unity3d.com/Manual/Hierarchy.html) with [`ARMarkerManager`](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr.armarkermanager) attached. `ARMarkerManager` is solely responsible for creating, updating, and removing `GameObjects` for detected QR codes.
* A prefab with [`ARMarker`](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr.armarker) attached. `ARMarkerManager` uses this prefab to instantiate `GameObjects` with.
* Specifying `ARMarkerManager` use the prefab when creating `GameObject` instances when a QR code is detected.

### Creating a prefab for AR markers

To use QR codes in your scene, you need to create a prefab for AR markers. `ARMarkerManager` uses this prefab to create a `GameObject` from whenever a QR code is detected.

To make a prefab for AR markers:

1. [Create a new prefab](https://docs.unity3d.com/Manual/CreatingPrefabs.html) for your project.
1. Add the `ARMarker` component to the prefab, located under **Script > Microsoft.MixedReality.OpenXR > ARMarker**.
  ![Adding the ARMarker Component](images/Add-ARMarker-Component.png)
 This automatically attaches the [`ARMarkerScale`](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr.armarkerscale) component, which contains the field `markerScaleTransform` that is assigned the transform (cube or quad)....
******#TODO******

You now need to add `ARMarkerManager` and specify for it to use the prefab when it creates a `GameObject` to represent an QR code.

### Adding `ARMarkerManager`

[`ARMarkerManager`](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr.armarkermanager) is solely responsible for creating, updating, and removing `GameObjects` for detected QR codes.

To add `ARMarkerManager` to your scene:

1. Place a [`GameObject`](https://docs.unity3d.com/Manual/Hierarchy.html) into your scene.
1. Add the `ARMarkerManager` component to the `GameObject`, located under **Script > Microsoft.MixedReality.OpenXR > ARMarkerManager** .
  ![Adding the ARMarkerManager Component](images/Add-ARMarkerManager-Component.png)
1. Set the `ARMarkerManager` **Marker Prefab** field to the prefab you created in the previous section.
  ![Marker Prefab Field Set](images/ARMarkerManager-Prefab-Specified.png)
1. Expand **Enabled Marker Types**, then choose an element and set it to **QR Code**.
  ![QR Code Marker Type Enabled](images/ARMarker-Manager-QR-Code-Specified.png)

### Tracking changes

`ARMarkerManager` contains the [`markersChanged`](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr.armarkermanager.markerschanged) event which provides subscribers read-only lists they can use to track which QR codes have been added or removed from detection or updated pose data.

### Last seen time

Use the [`ARMaker.lastSeenTime`](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr.armarker.lastseentime) property to get information about when an AR device tracked a QR code it detected. Time is measured in the number of seconds since Unity started your application. This can be compared to [`UnityEngine.Time.realtimeSinceStartup`](https://docs.unity3d.com/2023.2/Documentation/ScriptReference/Time-realtimeSinceStartup.html) to determine the amount of time, if any, tracking for a QR code has been lost for.

### Trackable ID and state

QR codes are [trackables]https://docs.unity3d.com/Packages/com.unity.xr.arfoundation@6.0/manual/architecture/managers.html#trackables-and-trackable-managers), which are anything an AR device can detect and track in a physical environment. Trackables derive from [`ARTrackable<TSessionRelativeDataTTrackable>`](https://docs.unity3d.com/Packages/com.unity.xr.arfoundation@6.0/api/UnityEngine.XR.ARFoundation.ARTrackable-2.html) that provides an ID, tracking state, pose, and other data.

A QR code's ID can be passed into several `ARMarkerManager` methods in order to retrieve the QR code’s properties, raw byte data, or decoded as a string, and set the transform mode for the QR code. This allows you to retrieve data for a QR code without having to hold on to an `ARMarker` object for it.

### Obtaining QR code pose, size, and center

An [`ARMarker`](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr.armarker) object provides a QR code’s pose data, size, and center position. To use the `ARMarker.transform.position` and `ARMarker.transform.rotation` properties.... ##TODO

### Reading QR data

The [`ARMarker`](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr.armarker) component is attached to every GameObject that [`ARMarkerManager`](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr.armarkermanager) creates. `ARMarker` provides two methods that return QR code data:

* [`GetDecodedString()`](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr.armarker.getdecodedstring): This method gets the QR code's string representation, such as a URL.
* [`GetRawData(Unity.Collections.Allocator allocator)`](https://learn.microsoft.com/dotnet/api/microsoft.mixedreality.openxr.armarker.getrawdata): This method returns QR code content as a byte array, allowing fine-grain tuning on how the array is allocated. Use this method in hot paths and other situations where performance is critical.

The following demonstrates basic usage of `GetDecodedString()` and `GetRawData(Unity.Collections.Allocator allocator)`:

```csharp
void OnMarkersChanged(ARMarkersChangedEventArgs args)
{
    foreach (ARMarker qrCode in args.added)
    {
        var text = qrCode.GetDecodedString();
        System.Debug.Log($"QR code text: {text}");

        var bytes = qrCode.GetRawData(Unity.Collections.Allocator.Temp);
        System.Debug.Log($"QR code bytes: {bytes.Length}");
        bytes.Dispose();
    }
}
```

## AR marker sample

The AR marker sample bundled in the Mixed Reality OpenXR Plugin package provides an example of a scene with QR code detection built-in and scripts showing basic usage of ARMarkerManager & ARMarker.

## See also

* API Ref
* Overview
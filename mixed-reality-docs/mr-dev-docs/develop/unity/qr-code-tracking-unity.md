---
title: QR code tracking in Unity
description: Learn how to work with QR codes in Unity mixed reality apps on HoloLens 2.
author: v-zlayne
ms.author: zacharylayne
ms.date: 06/11/2024
ms.topic: article
keywords: ar, qr, qr code, ar marker, hololens2, tracking, armarker, armarkermanager
---

# QR codes in Unity

This article will walk you through adding QR code detection to your Unity app, describing the important components and concepts you'll need to use. You'll also find information about the [AR Marker sample scenario](https://github.com/microsoft/OpenXR-Unity-MixedReality-Samples/tree/main/SampleScenarios/Scenarios/MarkerSample/Scripts) that demonstrates of a QR code-enabled scene and example scripts.

Before continuing with this article, we recommend going through the [QR codes overview](../advanced-concepts/qr-code-tracking-overview.md).

HoloLens 2 headsets can track and detect QR codes that can be used to provide holograms and other AR features. This topic will walk you through everything you need to know to start using QR codes in your Unity app.

![Tracked QR Code](images/QR-Code-Tracking.png)

## Configuring your Unity project and app

Your Unity project and app must be set up and configured properly to enable QR code functionality. This requires:

* OpenXR for Windows Mixed Reality version 113.2403.5001 or later.
  > [!NOTE]
  > This comes with the OS and can be updated through Windows Store. Please be aware that users may have earlier versions installed, and their devices will be unable to work with AR markers such as QR codes until updating to version 113.2403.5001 or later.
* A project compatible with a supported version of Unity:
  * Unity 2022.3 LTS (Recommended)
  * Unity 2021.3 LTS
* The Mixed Reality OpenXR Plugin.
* Webcam capabilities enabled for your Unity project.
* Camera permissions granted to your app.

The following sections will guide you through this.

### Getting the Mixed Reality OpenXR Plugin

The [Mixed Reality OpenXR Plugin](https://assetstore.unity.com/packages/add-ons/mixed-reality-openxr-plugin-275111#releases) package contains [C# APIs](/api/microsoft.mixedreality.openxr) you can use to access QR code functionality.

To import the package:

1. [Download](https://www.microsoft.com/download/details.aspx) and run the Mixed Reality Feature Tool.
1. Install the Mixed Reality OpenXR Plugin as indicated below:
  ![Install Mixed Reality OpenXR Plugin](images/Mixed-Reality-Feature-Tool-Mixed-Reality-OpenXR-Plugin-Feature.png)

The Mixed Reality Feature Tool also simplifies package management and can be used to find, update, and add the Mixed Reality features your app requires. See [Welcome to the Mixed Reality Feature Tool](./mixed-reality-openxr-plugin.md) for detailed instructions on how to use the tool.

### Enabling WebCam capabilities

To detect and track QR codes, your Unity project needs to have **WebCam** capabilities enabled.

To enable **WebCam** capabilities:

1. Open your Unity project.
1. Click **Edit** in the Unity editor’s app menu.
1. Go to **Project Settings > Player** and select the **UWP** tab as shown below.
![UWP Tab Settings](images/Player-Settings-UWP-Settings.png)
1. Enable **WebCam** in the **Capabilities** list.
  ![WebCam Capabilities Enabled](images/Player-Settings-WebCam-Cap.png)
1. Exit **Project Settings**.

**WebCam** capabilities are now enabled for your Unity app. However, your app must still be granted permissions to access the device camera.

### Granting your app camera access permissions

If your app has **WebCam** capabilities enabled, the permissions dialog will prompt users to grant your app access to the device camera.

![Camera Permissions Dialog](images/Camera-Permissions-Dialog.png)

This dialog is shown to users only once, typically when entering a scene containing an [`ARMarkerManager`](/api/microsoft.mixedreality.openxr.armarkermanager) with QR code marker support [enabled](#adding-armarkermanager-to-a-scene). If camera access is denied, users can go to **Settings > Apps** and enable it through the app's **Advanced Options**.

![App Advanced Options with Permissions Enabled](images/App-Advanced-Options-Permissions-Enabled.png)

### Building QR code detection into a scene

QR code detection must be built into every scene you want to use QR codes in. This requires:

* A [`GameObject`](https://docs.unity3d.com/Manual/Hierarchy.html) with [`ARMarkerManager`](/api/microsoft.mixedreality.openxr.armarkermanager) attached. `ARMarkerManager` is solely responsible for creating, updating, and removing every `GameObject` for detected QR codes.
* A prefab with [`ARMarker`](/api/microsoft.mixedreality.openxr.armarker) attached.
* `ARMarkerManager` configured to use the prefab when creating a `GameObject` when a QR code is detected.

### Creating a prefab for QR codes

To use QR codes in your scene, you need to create a prefab for QR codes. `ARMarkerManager` uses this prefab to create a `GameObject` from whenever a QR code is detected.

To make a prefab for QR codes:

1. [Create a new prefab](https://docs.unity3d.com/Manual/CreatingPrefabs.html) for your project.
1. Add the `ARMarker` component to the prefab, located under **Script > Microsoft.MixedReality.OpenXR > ARMarker**.
  ![Adding the ARMarker Component](images/Add-ARMarker-Component.png)

You now have a very basic prefab to work with. You likely will want your app to visually represent QR codes that have been detected in the environment. Continue to the next section to learn how.

### Adding Visuals

In the previous section, adding `ARMarker` to the prefab also automatically added the [`ARMarkerScale`](/api/microsoft.mixedreality.openxr.armarkerscale) component. This component is used to match the scale of a QR code's visual representation to its physical counterpart.

To do so:

1. Add an empty `GameObject` to the prefab you created in the previous section. This represents all visual *marker content*.
1. Add a child 3D `GameObject`, such as a `Quad`, to the marker content `GameObject`.
  ![Add 3D GameObject to ARMarker prefab](images/ARMarker-Prefab-Marker-Content-Visuals.png)
1. In the prefab's `ARMarkerScale` component, set [**Marker Scale Transform**](/api/microsoft.mixedreality.openxr.armarkerscale.markerscaletransform) to the marker content `GameObject`. This ensures the 3D `GameObject` you chose is scaled correctly to match real-world QR codes.

## Adding `ARMarkerManager` to a scene

[`ARMarkerManager`](/api/microsoft.mixedreality.openxr.armarkermanager) is solely responsible for creating, updating, and removing every `GameObject` for detected QR codes.

To add `ARMarkerManager` to your scene:

1. Place a [`GameObject`](https://docs.unity3d.com/Manual/Hierarchy.html) into your scene.
1. Add the `ARMarkerManager` component to the `GameObject`, located under **Script > Microsoft.MixedReality.OpenXR > ARMarkerManager**.
  ![Adding the ARMarkerManager Component](images/Add-ARMarkerManager-Component.png)
1. Set the `ARMarkerManager` **Marker Prefab** field to the prefab you created in the previous section.
  ![Marker Prefab Field Set](images/ARMarkerManager-Prefab-Specified.png)
1. Expand **Enabled Marker Types**, then choose an element and set it to **QR Code**.
  ![QR Code Marker Type Enabled](images/ARMarkerManager-QR-Code-Markers-Enabled.png)

## Keeping track of QR code changes

`ARMarkerManager` contains the [`markersChanged`](/api/microsoft.mixedreality.openxr.armarkermanager.markerschanged) event which provides [`ARMarkersChangedEventArgs`](/api/microsoft.mixedreality.openxr.armarkerschangedeventargs) to subscribers. Use these event arguments to track which QR codes have been added or removed from detection or updated pose data.

The following code demonstrates subscribing to the `markersChanged` event, using its event arguments to iterate through the `ARMarker` objects `ARMarkerManager` is handling and writing to Debug whether they have been added, removed, or updated.

```csharp
using System;
using Microsoft.MixedReality.OpenXR;

// ...

private void Awake()
{
    m_arMarkerManager = GetComponent<ARMarkerManager>();
    m_arMarkerManager.markersChanged += OnQRCodesChanged;
}

void OnQRCodesChanged(ARMarkersChangedEventArgs args)
{
    foreach (ARMarker qrCode in args.added)
        Debug.Log($"QR code with the ID {qrCode.trackableId} added.");

    foreach (ARMarker qrCode in args.removed)
        Debug.Log($"QR code with the ID {qrCode.trackableId} removed.");

    foreach (ARMarker qrCode in args.updated)
    {
        Debug.Log($"QR code with the ID {qrCode.trackableId} updated.");
        Debug.Log($"Pos:{qrCode.transform.position} Rot:{qrCode.transform.rotation} Size:{qrCode.size}");
    }
}
```

## Getting the time a QR code was last detected

Use the [`ARMarker.lastSeenTime`](/api/microsoft.mixedreality.openxr.armarker.lastseentime) property to determine when the device last tracked a detected QR code and the amount of time, if any, tracking has been lost. Time is measured in the number of seconds since Unity started your application and is analogous to [`UnityEngine.Time.realtimeSinceStartup`](https://docs.unity3d.com/2022.3Documentation/ScriptReference/Time-realtimeSinceStartup.html).

## Using a QR code's trackable ID

QR codes are [trackables](https://docs.unity3d.com/Packages/com.unity.xr.arfoundation@5.1/manual/architecture/managers.html#trackables-and-trackable-managers), which are anything an AR device can detect and track in a physical environment. Trackables derive from the type [`ARTrackable<TSessionRelativeDataTTrackable>`](https://docs.unity3d.com/Packages/com.unity.xr.arfoundation/api/UnityEngine.XR.ARFoundation.ARTrackable-2.html) that provides an ID, tracking state, pose, and other data.

The trackable ID for a QR code can be passed into `ARMarkerManager` methods to get the QR code’s properties, raw byte data, and string representation, and to set the transform mode for the QR code. This allows you to retrieve data for a QR code without having to hold on to a  to an `ARMarker` object reference.

You can pass a QR code's ID into the following `ARMarkerManager` methods:

* [`GetDecodedString(UnityEngine.XR.ARSubsystems.TrackableId trackableId)`](/api/microsoft.mixedreality.openxr.armarkermanager.getdecodedstring)
* [`GetMarker(UnityEngine.XR.ARSubsystems.TrackableId trackableId)`](/api/microsoft.mixedreality.openxr.armarkermanager.getmarker)
* [`GetQRCodeProperties(UnityEngine.XR.ARSubsystems.TrackableId)`](/api/microsoft.mixedreality.openxr.armarkermanager.getqrcodeproperties)
* [`GetRawData(UnityEngine.XR.ARSubsystems.TrackableId, Unity.Collections.Allocator)`](/api/microsoft.mixedreality.openxr.armarkermanager.getrawdata)
* [`SetTransformMode(UnityEngine.XR.ARSubsystems.TrackableId, Microsoft.MixedReality.OpenXR.TransformMode)`](/api/microsoft.mixedreality.openxr.armarkermanager.settransformmode)

> [!NOTE]
> For the  `GetRawData` parameter `allocator`, passing [`Unity.Collections.Allocator.Temp`](https://docs.unity3d.com/2021.3/Documentation/ScriptReference/Unity.Collections.Allocator.Temp.html) is sufficient for most scenarios.

## Following the tracking state of a QR code

Because an `ARMarker` is trackable, it inherits the `trackingState` property which is set to one of three [`UnityEngine.XR.ARSubsystems.TrackingState`](https://docs.unity3d.com/Packages/com.unity.xr.arsubsystems@4.2/api/UnityEngine.XR.ARSubsystems.TrackingState.html):

* `Limited`: Indicates that the QR code is being tracked but limited information is available or is of poor quality.
* `Tracking`: Specifies that the QR code is being fully tracked.
* `None`: Indicates that the QR code is not being tracked.

To monitor tracking state for a QR code, subscribe to the [`ARMarkerManager.markersChanged`](/api/microsoft.mixedreality.openxr.armarkermanager.markerschanged) and iterate through the [`ARMarker`](/api/microsoft.mixedreality.openxr.armarker) marker collections provided in the event arguments passed to your event handler.

The following code demonstrates using the `markersChanged` event to iterate through `ARMarker` objects for newly detected QR codes and writing their trackable ID to the Debug window.

```csharp
using System;
using Microsoft.MixedReality.OpenXR;

// ...

private void Awake()
{
    m_arMarkerManager = GetComponent<ARMarkerManager>();
    m_arMarkerManager.markersChanged += OnQRCodesChanged;
}

void OnQRCodesChanged(ARMarkersChangedEventArgs args)
{
    foreach (ARMarker qrCode in args.added)
    {
       if (qrCode.trackingState == UnityEngine.XR.ARSubsystems.TrackingState.Tracking)
           Debug.Log($"Fully tracked QR code with the ID {qrCode.trackableId} was added.");
    }
}
```

## Reading QR data

The [`ARMarker`](/api/microsoft.mixedreality.openxr.armarker) component is attached to every `GameObject` that [`ARMarkerManager`](/api/microsoft.mixedreality.openxr.armarkermanager) creates. `ARMarker` provides two methods that return QR code data:

* [`GetDecodedString()`](/api/microsoft.mixedreality.openxr.armarker.getdecodedstring): This method gets the QR code's string representation, such as a URL.

* [`GetRawData(Unity.Collections.Allocator allocator)`](/api/microsoft.mixedreality.openxr.armarker.getrawdata): This method returns QR code content as a byte array, allowing fine-grain tuning on how the array is allocated. Use this method in hot paths and other situations where performance is critical.

The following demonstrates basic usage of `GetDecodedString()` and `GetRawData(Unity.Collections.Allocator allocator)`:

```csharp
using System;
using Microsoft.MixedReality.OpenXR;

// ...

void OnQRCodesChanged(ARMarkersChangedEventArgs args)
{
    foreach (ARMarker qrCode in args.added)
    {
        var text = qrCode.GetDecodedString();
        Debug.Log($"QR code text: {text}");

        var bytes = qrCode.GetRawData(Unity.Collections.Allocator.Temp);
        Debug.Log($"QR code bytes: {bytes.Length}");
        bytes.Dispose();
    }
}
```

### Obtaining QR code pose, size, and center

An [`ARMarker`](/api/microsoft.mixedreality.openxr.armarker) object provides pose data, size, and center position for the QR code it represents.

To use the `ARMarker.transform.position` and `ARMarker.transform.rotation` properties....

## AR marker sample scenario

The sample provided with the OpenXR Plugin package contains a QR code-enabled scene that provides an example of how  `ARMarkerManager` and `ARMarker` can be used.

![AR Marker Sample Scenario](images/ARMarker-Sample-Scene.jpg)

The scripts used in the scene in the [OpenXR Unity Mixed Reality Samples repo](https://github.com/microsoft/OpenXR-Unity-MixedReality-Samples/tree/main) are located here:
[/OpenXR-Unity-MixedReality-Samples/tree/main/SampleScenarios/Scenarios/MarkerSample/Scripts](https://github.com/microsoft/OpenXR-Unity-MixedReality-Samples/tree/main/SampleScenarios/Scenarios/MarkerSample/Scripts)

The scene is located in **Assets > ARMarker** as shown below:
![ARMarker Scene Asset Location](images/ARMarker-Sample-Scene-Location.png)

## See also

* [Mixed Reality OpenXR Pluging API Reference](/api/microsoft.mixedreality.openxr)
* [QR codes overview](../advanced-concepts/qr-code-tracking-overview.md)

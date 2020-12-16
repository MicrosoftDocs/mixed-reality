---
title: OpenXR plugin Supported Features in Unity
description: Discover the features OpenXR supports for mixed reality development in Unity.
author: hferrone
ms.author: alexturn
ms.date: 12/15/2020
ms.topic: article
keywords: openxr, unity, hololens, hololens 2, mixed reality, MRTK, Mixed Reality Toolkit, augmented reality, virtual reality, mixed reality headsets, learn, tutorial, getting started
---


# Mixed Reality OpenXR supported features in Unity

The **Mixed Reality OpenXR Plugin** package is an extension of Unity's **OpenXR Plugin** and supports a suite of features for HoloLens 2 and Windows Mixed Reality headsets. Before continuing, make sure that you've installed **Unity 2020.2** or later, **OpenXR Plugin version 0.1.1** or later, and your Unity project is [configured for OpenXR](openxr-getting-started.md).

## What's supported

The following features are currently supported:

* Supports both UWP applications for HoloLens 2 and Win32 VR applications for Windows Mixed Reality headsets.
* Optimizes UWP package and CoreWindow interaction for HoloLens 2 applications.
* World scale tracking using Anchors and Unbounded space.
* Anchor storage API to persist anchors to HoloLens 2 local storage.
* Motion controller and hand interactions, including the new HP Reverb G2 controller.
* Articulated hand tracking using 26 joints and joint radius inputs.
* Eye gaze interaction on HoloLens 2.
* Locating photo/video (PV) camera on HoloLens 2.
* Mixed Reality Capture using 3rd eye rendering through PV camera.
* Supports "Play" to HoloLens 2 using the Holographic Remoting app, allowing developers to debug scripts without building and deploying to the device.
* Compatible with MRTK Unity 2.5.2 through MRTK OpenXR adapter package. <missing link>
* Compatible with Unity [ARFoundation 4.0](https://docs.unity3d.com/Packages/com.unity.xr.arfoundation@4.1/manual/index.html) or later

<!-- ## Holographic Remoting in Unity Editor play mode

![Screenshot of Windows Mixed Reality features window open in Unity editor with features sets highlighted](images/openxr-features-img-01.png) -->

## What's coming soon

The following issues and missing features are known with Mixed Reality OpenXR plugin **version 0.1.0**. We're working on these and will release fixes and new features in upcoming releases.

* **ARPlaneSubsystem** is not supported yet. **ARPlaneManager**, **ARRaycastManager**, and related API like **ARAnchorManager.AttachAnchor** are also not supported on HoloLens 2.
* **Anchor** isn't supported by Holographic Remoting yet, but it's coming in the near future.
* **Hand Mesh** tracking, **QR Codes**, and **XRMeshSubsystem** aren't supported yet.
* **Azure Spatial Anchors** support is coming in a future release.
* **ARM64** is the only supported platform for HoloLens 2 apps. The **ARM** platform is coming in a future release.

## Troubleshooting 

When you suspend and resume a Unity app on HoloLens 2, the app can't correctly resume, which leads to 4 spinning dots in the HoloLens view. 
* Set **Depth submission Mode** to **None** in the OpenXR project settings as a workaround

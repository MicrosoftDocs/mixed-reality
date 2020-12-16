---
title: OpenXR plugin Supported Features in Unity
description: Discover the features OpenXR supports for mixed reality development in Unity.
author: hferrone
ms.author: alexturn
ms.date: 12/15/2020
ms.topic: article
keywords: openxr, unity, hololens, hololens 2, mixed reality, MRTK, Mixed Reality Toolkit, augmented reality, virtual reality, mixed reality headsets, learn, tutorial, getting started
---


# OpenXR plugin Supported Features in Unity

The **Mixed Reality OpenXR Plugin** package is an extension of Unity's **OpenXR Plugin** and supports a suite of features for HoloLens 2 and Windows Mixed Reality headsets.

## What's supported

The **Mixed Reality OpenXR Plugin** package requires: 

* Unity 2020.2 or later
* Unity’s "OpenXR Plugin" version 0.1.1 or later

The following features are currently supported:

* Supports both UWP applications for HoloLens 2 and Win32 VR applications for Windows Mixed Reality headsets.
* Optimizes UWP package and CoreWindow interaction for HoloLens 2 applications.
* World scale tracking using Anchor and Unbounded space.
* Anchor storage API to persistent anchors to HoloLens 2 local storage.
* Motion controller and hand interactions, including the new HP Reverb G2 controller.
* Articulated hand tracking using 26 joints and joint radius inputs.
* Eye gaze interaction on HoloLens 2.
* Locating PV camera on HoloLens 2.
* Mixed Reality Capture using 3rd eye rendering through PV camera.
* Supports "Play" to HoloLens 2 using Holographic Remoting app, allow developers to debug scripts without build and deploy to the device.
* Compatible with MRTK Unity 2.5.2 through MRTK OpenXR adapter package. <missing link>
* Compatible with Unity [ARFoundation 4.0](https://docs.unity3d.com/Packages/com.unity.xr.arfoundation@4.1/manual/index.html) or later

## Holographic Remoting in Unity Editor play mode

![Screenshot of Windows Mixed Reality features window open in Unity editor with features sets highlighted](images/openxr-features-img-01.png)

## What's coming soon

The following issues and missing features are known with Mixed Reality OpenXR plugin **version 0.1.0**. We're working on these and will release fixes and new features in upcoming releases.

* When you suspend and resume a Unity app on HoloLens 2, the app can't correctly resume, which leads to 4 spinning dots in the HoloLens view. 
    *  Set **Depth submission Mode** to **None** in the OpenXR project settings as a workaround
* **ARPlaneSubsystem** is not supported yet. **ARPlaneManager**, **ARHittestManager**, and related API like **ARAnchorManager.AttachAnchor** are also not supported on HoloLens 2.
* **Anchor** isn't supported by Holographic remoting yet, but it's coming in the near future.

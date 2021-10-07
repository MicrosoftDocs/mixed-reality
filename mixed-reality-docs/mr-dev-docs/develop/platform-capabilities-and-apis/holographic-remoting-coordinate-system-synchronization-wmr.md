---
title: Coordinate System Synchronization with Holographic Remoting and the Windows Mixed Reality API
description: This page explains how Coordinate System Synchronization with Holographic Remoting and the Windows Mixed Reality API works
author: vimusc
ms.author: vimusch
ms.date: 09/07/2021
ms.topic: article
keywords: HoloLens, HoloLens 2, mixed reality, MRTK, Mixed Reality Toolkit, augmented reality, virtual reality, mixed reality headsets, learn, tutorial, getting started, holographic remoting
---

# Coordinate System Synchronization with Holographic Remoting and the Windows Mixed Reality API

With the Windows Mixed Reality API, the user coordinate systems is wrapped into a [SpatialStationaryFrameOfReference](/uwp/api/windows.perception.spatial.spatialstationaryframeofreference).

> [!TIP]
> A simple example can be found in the remote and player samples inside the [Holographic Remoting samples github repository](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples).
>Uncomment ```#define ENABLE_USER_COORDINATE_SYSTEM_SAMPLE``` inside the SampleRemoteApp.h and SamplePlayerMain.h files to enable the sample code.

## Set and Update the User Coordinate System in the Player App

To set and update the user coordinate system, call ```UpdateUserSpatialFrameOfReference``` on the player context and pass a [SpatialCoordinateSystem](/uwp/api/windows.perception.spatial.spatialCoordinateSystem) into it.
A [SpatialCoordinateSystem](/uwp/api/windows.perception.spatial.spatialCoordinateSystem) can, for example, be a [SpatialStationaryFrameOfReference](/uwp/api/windows.perception.spatial.spatialstationaryframeofreference), [SpatialLocatorAttachedFrameOfReference](/uwp/api/windows.perception.spatial.SpatialLocatorAttachedFrameOfReference), or a [SpatialAnchor](/uwp/api/windows.perception.spatial.SpatialAnchor).

> [!NOTE]
> With the sample [SpatialStationaryFrameOfReference](/uwp/api/windows.perception.spatial.spatialstationaryframeofreference), ```UpdateUserSpatialFrameOfReference``` has to be called in a regular interval to avoid drifting after loss of device tracking, even if the user coordinate system has not changed!

## Get the User Coordinate System in the Remote App

To access the user coordinate system, call ```GetUserSpatialFrameOfReference``` on the remote context.
```GetUserSpatialFrameOfReference``` returns a [SpatialStationaryFrameOfReference](/uwp/api/windows.perception.spatial.spatialstationaryframeofreference), which represents the user coordinate system.

## See Also
* [Coordinate System Synchronization with Holographic Remoting Overview](holographic-remoting-coordinate-system-synchronization.md)

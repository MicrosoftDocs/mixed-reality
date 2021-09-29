---
title: Coordinate System Synchronization with Holographic Remoting Overview
description: 
author: vimusch
ms.author: vimusch
ms.date: 09/07/2021
ms.topic: article
keywords: HoloLens, HoloLens 2, mixed reality, MRTK, Mixed Reality Toolkit, augmented reality, virtual reality, mixed reality headsets, learn, tutorial, getting started, holographic remoting
---

# Coordinate System Synchronization with Holographic Remoting Overview

Starting with version [2.7.0](holographic-remoting-version-history.md#v2.7.0), Holographic Remoting supports coordinate system synchronization.

Use coordinate system synchronization to synchronize spatial data between a custom player app and a custom remote app.
With that it is possible to express spatial data within a common space even across different player and remote runtimes.

This can be used, for example, to align content which was rendered by the player app with the content rendered by the remote app.
Furthermore, this allows the custom remote app to correctly align sensor data from the player device which was retrieved e.g. by [HoloLens2ForCV](https://github.com/microsoft/HoloLens2ForCV).

In general, the coordinate system synchronization consists of two parts:
- The player app sets and regularly updates the coordinate system (hereinafter referred to as user coordinate system).
- The remote app gets the user coordinate system in a runtime dependent way.
With that both the player app and remote app can transform spatial data into a common coordinate system.

>[!NOTE]
> Coordinate system synchronization supports only a single coordinate system.
> To synchronize data from multiple coordinate systems you can always transform the data into the user coordinate system!
	
## See Also
* [Coordinate System Synchronization with Holographic Remoting and the OpenXR API](holographic-remoting-coordinate-system-synchronization-openxr.md)
* [Coordinate System Synchronization with Holographic Remoting and the Windows Mixed Reality API](holographic-remoting-coordinate-system-synchronization-wmr.md)

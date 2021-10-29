---
title: Porting overview
description: An overview of the various porting options for bringing your existing applications to Mixed Reality for HoloLens and VR.
author: hferrone
ms.author: v-hferrone
ms.date: 10/29/2021
ms.topic: article
keywords: porting, unity, middleware, engine, UWP, Win32
---

# Porting overview

If you need to port or upgrade your existing projects for Mixed Reality, the process is determined by whether your app is built with Unity or Unreal Engine and also whether it targets HoloLens (1st Gen) or HoloLens 2, or SteamVR. This overview page contains our current recommendations for each platform and device--be sure to check back as these processes are always changing.

First, set up your project target based on either our [Unity](#unity) or [Unreal](#unreal) recommendations, and then follow one or more of our porting scenarios:

- [HoloLens (1st Gen) to HoloLens 2](#hololens-1st-gen-unity-apps-to-hololens-2)
- [Immersive VR headsets](#immersive-vr-headsets)
- [2D UWP apps](#2d-universal-windows-applications)

## Recommended project targets

It's important to keep your projects up-to-date. Refer to the engine-based resources listed below for our current recommendations.

### Unity

For up-to-date guidance on the recommended Unity and MRTK version, see [Choosing a Unity version](../unity/choosing-unity-version.md).

We recommend OpenXR as the path forward in Mixed Reality development, so be sure to visit our [OpenXR overview](../../native/openxr.md) and our [guide for migrating a Unity 2019 project to Unity 2020 + OpenXR](migrate-a-unity-2019-project-to-openxr.md)

### Unreal

For up-to-date guidance on the recommended Unreal and MRTK versions, see [Setting up your Unreal project](../unreal/unreal-project-setup.md).

## Porting scenarios

### HoloLens (1st Gen) Unity apps to HoloLens 2

If you have an existing HoloLens (1st Gen) Unity application that you'd like to port over to a HoloLens 2, follow the instructions in our [HoloLens porting article](./porting-hl1-hl2.md).

### Immersive VR headsets

If you've built content for other VR devices, you'll need to retarget any vendor-specific VR SDKs and (potentially) input-mapping APIs. You can find information for both Unity and Unreal porting scenarios in our [immersive apps porting guide](porting-guides.md).

For SteamVR experiences that you want to update for Windows Mixed Reality headsets, refer to our [SteamVR updating guide](updating-your-steamvr-application-for-windows-mixed-reality.md).

### 2D Universal Windows applications

If you have an existing 2D UWP app that you'd like to port to either a Windows Mixed Reality immersive headset or HoloLens, follow our [porting 2D UWP apps for Windows Mixed Reality](building-2d-apps.md) instructions.
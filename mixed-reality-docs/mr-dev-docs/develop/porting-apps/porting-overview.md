---
title: Porting overview
description: An overview of the various porting options for bringing existing applications to Mixed Reality.
author: hferrone
ms.author: v-hferrone
ms.date: 10/02/2020
ms.topic: article
keywords: porting, unity, middleware, engine, UWP, Win32
---


# Porting overview

When it comes to porting or upgrading your existing projects for Mixed Reality, several scenarios may apply depending on whether your app was built with Unity or Unreal Engine, HoloLens (1st Gen) or HoloLens 2, or SteamVR. This overview page contains our current recommendations for each platform and device - be sure to check back as these processes are always changing.

First, choose a development setup based on our [Unity](#unity) and [Unreal](#unreal) recommendations, then follow one or more of our porting scenarios:

- [HoloLens (1st Gen) to HoloLens 2](#hololens-1st-gen-unity-apps-to-hololens-2)
- [Windows Mixed Reality headsets](#windows-mixed-reality-headsets)
- [SteamVR apps](#steamvr-applications)
- [2D UWP apps](#2d-universal-windows-applications)

## Recommended development setups

It's important to keep your projects up-to-date, whether or not your porting an app to another target device. Refer to the engine-based resources listed below for our current recommendations.

### Unity

Our current recommendation for Unity development with Mixed Reality is **Unity 2019 LTS using the Legacy XR package**. If you're project uses the Mixed Reality Toolkit, double-check that you're on the latest version, which is currently **MRTK-Unity 2.5**.

> [!IMPORTANT]
> While the XRSDK is available with this version of Unity, Azure Spatial Anchors is not currently compatible with this setup. This recommendation will be updated with the release of a future Unity version. If you're currently using the XRSDK in your project and want to use Azure Spatial Anchors, uninstall XRSDK and reinstall the Legacy XR package to revert your project settings.

### Unreal 

Our current recommendation for Unreal development with Mixed Reality is **Unreal Engine 4.26**. If you're project uses the Mixed Reality Toolkit UX Tools, make sure you're using the latest version, which is currently **UXT 0.10**.

## Porting scenarios

### HoloLens (1st Gen) Unity apps to HoloLens 2

If you have an existing HoloLens (1st Gen) Unity application that you'd like to port over to a HoloLens 2, follow the instructions in our [HoloLens porting article](../unity/mrtk-porting-guide.md).

### Windows Mixed Reality headsets

If you've built content for other devices, such as the Oculus Rift or HP Reverb G2, you'll need to re-target vendor-specific VR SDKs and potentially input mapping APIs. You can find information for both Unity and Unreal porting scenarios in our [immersive apps porting guide](porting-guides.md).

### SteamVR applications

For any SteamVR experiences that you want to update for Windows Mixed Reality headsets, refer to our [SteamVR updating guide](updating-your-steamvr-application-for-windows-mixed-reality.md).

### 2D Universal Windows applications

If you have an existing 2D UWP app that you'd like to port to either a Windows Mixed Reality immersive headset or HoloLens, follow the instructions in our [porting 2D UWP apps for Windows Mixed Reality](building-2d-apps.md) article.


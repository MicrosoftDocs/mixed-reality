---
title: Porting overview
description: An overview of the various porting options for bringing your existing applications to Mixed Reality for HoloLens and VR.
author: hferrone
ms.author: v-hferrone
ms.date: 12/9/2020
ms.topic: article
keywords: porting, unity, middleware, engine, UWP, Win32
---

# Porting overview

When it comes to porting or upgrading your existing projects for Mixed Reality, your porting journey depends on whether your app is built with Unity or Unreal Engine, and targets HoloLens (1st Gen) or HoloLens 2, or SteamVR. This overview page contains our current recommendations for each platform and device - be sure to check back as these processes are always changing.

First, set up your project target based on either our [Unity](#unity) and [Unreal](#unreal) recommendations, then follow one or more of our porting scenarios:

- [HoloLens (1st Gen) to HoloLens 2](#hololens-1st-gen-unity-apps-to-hololens-2)
- [Windows Mixed Reality headsets](#windows-mixed-reality-headsets)
- [SteamVR apps](#steamvr-applications)
- [2D UWP apps](#2d-universal-windows-applications)

## Recommended project targets

It's important to keep your projects up to date, whether your porting an app to another target device. Refer to the engine-based resources listed below for our current recommendations.

### Unity

Our current recommendation for Unity development with Mixed Reality is **Unity 2019 LTS using the Legacy XR package**. If your project uses the Mixed Reality Toolkit, double-check that you're on the latest version, which is currently **MRTK-Unity 2.5**.

> [!CAUTION]
> While the XR SDK is available with this version of Unity, Azure Spatial Anchors is not currently compatible with this setup. This recommendation will be updated with a future release of the Azure Spatial Anchors package for Unity.
> 
> * If you don't need Azure Spatial Anchors, you can [configure your Unity project for XR](https://docs.unity3d.com/Manual/configuring-project-for-xr.html) and [get started with MRTK and XR SDK](/windows/mixed-reality/mrtk-unity/configuration/getting-started-with-mrtk-and-xrsdk).
> 
> * If you're currently using the XR SDK in your project and want to use Azure Spatial Anchors, uninstall XR SDK and reinstall the Legacy XR package to revert your project settings.

### Unreal

Our current recommendation for Unreal development with Mixed Reality is **Unreal Engine 4.26**. If your project uses the Mixed Reality Toolkit UX Tools, make sure you're using the latest version, which is currently **UXT 0.10**.

## Porting scenarios

### HoloLens (1st Gen) Unity apps to HoloLens 2

If you have an existing HoloLens (1st Gen) Unity application that you'd like to port over to a HoloLens 2, follow the instructions in our [HoloLens porting article](./porting-hl1-hl2.md).

### Windows Mixed Reality headsets

If you've built content for other devices, such as the Oculus Rift or HP Reverb G2, you'll need to retarget vendor-specific VR SDKs and potentially input-mapping APIs. You can find information for both Unity and Unreal porting scenarios in our [immersive apps porting guide](porting-guides.md).

### SteamVR applications

For any SteamVR experiences that you want to update for Windows Mixed Reality headsets, refer to our [SteamVR updating guide](updating-your-steamvr-application-for-windows-mixed-reality.md).

### 2D Universal Windows applications

If you have an existing 2D UWP app that you'd like to port to either a Windows Mixed Reality immersive headset or HoloLens, follow our [porting 2D UWP apps for Windows Mixed Reality](building-2d-apps.md) instructions.
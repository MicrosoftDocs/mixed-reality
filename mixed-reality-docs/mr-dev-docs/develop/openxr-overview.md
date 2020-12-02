---
title: OpenXR overview
description: Learn about the future of Mixed Reality development with OpenXR in Unity, Unreal, and DirectX.
author: hferrone
ms.author: alexturn
ms.date: 12/1/2020
ms.topic: article
keywords: openxr, unity, unreal, directx, oculus, steamvr, htc, minecraft, blender, hololens, hololens 2, webxr, mixed reality, MRTK, Mixed Reality Toolkit, augmented reality, virtual reality, mixed reality headsets, hp reverb, epic games launcher
---

# OpenXR overview

<!-- Could use another hero image here -->

> [!CAUTION]
> OpenXR is still in the experimental development stage. If you haven't decided between Unity and Unreal as your development engine, we recommend starting with the [introduction to Mixed Reality](development.md) and come back to OpenXR when you need an API to build engines. New release information will be added to this page, so check back with us!

With OpenXR, you can build engines and apps that target HoloLens 2 with the same API that you use to target PC VR headsets, including Windows Mixed Reality headsets, Oculus Rift headsets and (currently in developer preview) SteamVR headsets.  OpenXR lets engines write code once that's then portable across hardware platforms from a wide range of VR and AR vendors.

![Screenshot of minecraft being played by a user wearing a mixed reality headset](images/openxr-minecraft.jpg)

*Minecraft's new RenderDragon engine is building its desktop VR support using OpenXR*

Microsoft has been working with Unity and Epic Games to ensure the future of mixed reality is open, not just for HoloLens 2, but across the full breadth of PC VR, including [HP’s new Reverb G2 headset](https://www.microsoft.com/mixed-reality/windows-mixed-reality?rtc=1).  For more information on developing for HoloLens (1st gen), see the [release notes](https://docs.microsoft.com/hololens/hololens1-release-notes).

To learn how you can get started with OpenXR in Unity, Unreal Engine or your own engine, read on!

## OpenXR in Unity

Today, the supported Unity development path for HoloLens 2, HoloLens (1st gen), and Windows Mixed Reality headsets is **Unity 2019 LTS** with the existing WinRT API backend.  You can jump into [OpenXR with Unity](unity/openxr-getting-started.md); If you’re targeting the new HP Reverb G2 controller in a Unity 2019 app, see our [HP Reverb G2 input docs](develop/unity/unity-reverb-g2-controllers.md).

Starting with **Unity 2020 LTS**, [Unity will ship an OpenXR backend](https://forum.unity.com/threads/unitys-plans-for-openxr.993225/) that supports HoloLens 2 and Windows Mixed Reality headsets.  This includes support for the OpenXR extensions that light up the [full capabilities of HoloLens 2 and Windows Mixed Reality headsets](develop/native/openxr.md#roadmap), including hand/eye tracking, spatial anchors and HP Reverb G2 controllers.  MRTK-Unity support for OpenXR is currently under development in the [mrtk_development branch](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/mrtk_development) and will be available alongside that OpenXR preview package.

Starting in **Unity 2021**, OpenXR will then graduate to be the only supported Unity backend for targeting HoloLens 2 and Windows Mixed Reality headsets.

## OpenXR in Unreal Engine

As of **Unreal Engine 4.23**, full support for HoloLens 2 and Windows Mixed Reality headsets are available through the Windows Mixed Reality (WinRT) plugin.

Unreal Engine 4.23 was also the first major game engine release to ship preview support for OpenXR 1.0!  Now in **Unreal Engine 4.26**, support for HoloLens 2, Windows Mixed Reality and other desktop VR headsets will be available through [Unreal Engine’s built-in OpenXR plugin](https://github.com/microsoft/Microsoft-OpenXR-Unreal).  Unreal Engine 4.26 will also ship with its first set of OpenXR extension plugins enabling hand interaction and HP Reverb G2 controller support, lighting up the [full feature set of HoloLens 2 and Windows Mixed Reality headsets](develop/native/openxr.md#roadmap).  Unreal Engine 4.26 is available in preview today on the [Epic Games Launcher](https://www.unrealengine.com/download/creators), with the official release coming later this year.  MRTK-Unreal support for OpenXR will be available alongside that release as well.

## OpenXR in other engines

If you’re building your own DirectX engine for HoloLens 2, Windows Mixed Reality or other PC VR headsets, we recommend using the [OpenXR API](develop/native/openxr-getting-started.md).  HoloLens 2 and Windows Mixed Reality will continue to support apps that target our previous WinRT APIs as well, although new features may not be available in these APIs.


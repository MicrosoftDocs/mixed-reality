---
title: Choosing your engine
description: Get introduced to the engine choices available for Mixed Reality development for HoloLens and VR. 
author: qianw211
ms.author: qianwen
ms.date: 11/10/2021
ms.topic: article
keywords: mixedrealitytoolkit, mixedrealitytoolkit-unity, mixed reality headset, windows mixed reality headset, virtual reality headset, unity
---

# Choosing your engine

There are several development paths you can take through our documentation. The first step is finding the technology that's right for you. If you already have one in mind, go ahead and jump right to its respective tab below. If you're on the fence or just starting out, take a look through each one and understand what they offer, the available platforms and tools, and start creating!

> [!IMPORTANT]
> Take a look at our **[porting guides overview](porting-apps/porting-overview.md)** if you have existing projects that you want to bring over to HoloLens 2 or immmersive VR headsets like the Reverb G2. We have guides for projects that are using HTK, MRTK v1, SteamVR or were developed for immersive headsets such as the Oculus Rift or HTC Vive.

## Engine overview

* **Unity** is one of the leading real-time development platforms on the market, with underlying runtime code written in C++ and all development scripting is done in C#. Whether you're looking to build games, movies and animation cinematics, or even render architectural or engineering concepts in a virtual world, Unity has the infrastructure to support you.

    >[!Note]
    >Please avoid Unity 2020.3.21f and 2020.3.22f, which cause flashing and strobing effect on HoloLens 2. For more information, see [here](https://forum.unity.com/threads/flickering-issue-affecting-hololens-2-projects-in-2020-3-21-and-later.1200199/). 

* **Unreal Engine 4** is a powerful, open source creation engine with full support for mixed reality in both C++ and Blueprints. As of Unreal Engine 4.25, HoloLens support is full-featured and production-ready. With capabilities such as the flexible Blueprints Visual Scripting system, designers can virtually use the full range of concepts and tools generally only available to programmers. Creators across industries can leverage the freedom and control to deliver cutting-edge content, interactive experiences, and immersive virtual worlds.

* **Native** developers with experience writing their own 3D renderers can build a custom engine using OpenXR. OpenXR is an open royalty-free API standard from Khronos that provides engines native access to a wide range of devices from vendors across the mixed reality spectrum. You can develop using OpenXR on a HoloLens 2 or Windows Mixed Reality immersive headset on the desktop.

* **Web** developers creating compelling cross-browser AR/VR web experiences can use **WebXR**.

## Features and devices

<br>

| Logistics | Unity | Unreal | JavaScript | Custom engine <br>(using OpenXR) |
|---|---|---|---|---|
| Language | C# | C++ | JavaScript | C/C++ |
| Pricing | [Unity pricing](https://store.unity.com/#plans-individual) | [Unreal pricing](https://www.unrealengine.com/download) | Free | Free |

<br>

| Device features | Unity | Unreal | JavaScript | Custom engine <br>(using OpenXR) |
|---|---|---|---|---|
| Device/display tracking | ✔️ | ✔️ | ✔️ | ✔️ |
| Hand input | ✔️ | ✔️ | ✔️ | ✔️ |
| Eye input | ✔️ | ✔️ | ❌ | ✔️ |
| Voice input | ✔️ | ✔️ | ✔️ | ✔️ |
| Motion controllers | ✔️ | ✔️ | ✔️ | ✔️ |
| Plane/mesh hit testing | ✔️ | ✔️ | ✔️ | ✔️ |
| Scene understanding | ✔️ | ✔️ | ❌ | ✔️ |
| Spatial sound | ✔️ | ✔️ | ✔️ | ✔️ |
| QR code detection | ✔️ | ✔️ | ❌ | ✔️ |

<br>

| Hardware | Unity | Unreal | JavaScript | Custom engine <br>(using OpenXR) |
|---|---|---|---|---|
| HoloLens 2 | ✔️ | ✔️ | ✔️ | ✔️ |
| HoloLens (1st gen) | ✔️ | ✔️ | ❌ | WinRT (Legacy) only |
| [Windows Mixed Reality headsets](/windows/mixed-reality/enthusiast-guide/immersive-headset-hardware-details) | ✔️ | ✔️ | ✔️ | ✔️ |
| SteamVR headsets | ✔️ | ✔️ | ✔️ | ✔️ |
| Oculus Quest/Rift | ✔️ | ✔️ | ✔️ | ✔️ |
| Mobile (ARCore/ARKit) | ✔️ | ✔️ | ✔️ | ❌ |

<br>

| Tools | Unity | Unreal | JavaScript | Custom engine <br>(using OpenXR) |
|---|---|---|---|---|
| Mixed Reality Toolkit | ✔️ | ✔️ | ❌  | ❌ |
| World Locking Tools | ✔️ | ❌ | ❌  | ❌ |
<!-- | Mesh | ❌ | ❌ | ❌ | ❌ | -->

<br>

| Cloud services | Unity | Unreal | JavaScript | Custom engine <br>(using OpenXR) |
|---|---|---|---|---|
| Azure Spatial Anchors | ✔️ | ✔️ | ❌ | ✔️ |
| Azure Object Anchors | ✔️ | ❌ | ❌ | ✔️ |
| Azure Remote Rendering | ✔️ * | ❌ | ❌ | ✔️ * |

> [!NOTE]
> * Azure Remote Rendering is currently supported in apps using the legacy WinRT APIs (Windows XR plugin in Unity). ARR support for OpenXR apps is coming soon.

## Next steps

[!INCLUDE[](includes/tools-next-steps.md)]
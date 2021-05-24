---
title: Choosing your engine
description: Get introduced to the engine choices available for Mixed Reality development for HoloLens and VR. 
author: hferrone
ms.author: v-hferrone
ms.date: 04/22/2021
ms.topic: article
keywords: mixedrealitytoolkit, mixedrealitytoolkit-unity, mixed reality headset, windows mixed reality headset, virtual reality headset, unity
---

# Choosing your engines

There are several development paths you can take through our documentation. The first step is finding the technology that's right for you. If you already have one in mind, go ahead and jump right to its respective tab below. If you're on the fence or just starting out, take a look through each one and understand what they offer, the available platforms and tools, and start creating!

> [!IMPORTANT]
> Take a look at our **[porting guides overview](porting-apps/porting-overview.md)** if you have existing projects that you want to bring over to HoloLens 2 or immmersive VR headsets like the Reverb G2. We have guides for projects that are using HTK, MRTK v1, SteamVR or were developed for immersive headsets such as the Oculus Rift or HTC Vive.

## Engine overview

* **Unity** is one of the leading real-time development platforms on the market, with underlying runtime code written in C++ and all development scripting is done in C#. Whether you're looking to build games, movies and animation cinematics, or even render architectural or engineering concepts in a virtual world, Unity has the infrastructure to support you.

* **Unreal Engine 4** is a powerful, open source creation engine with full support for mixed reality in both C++ and Blueprints. As of Unreal Engine 4.25, HoloLens support is full-featured and production-ready. With capabilities such as the flexible Blueprints Visual Scripting system, designers can virtually use the full range of concepts and tools generally only available to programmers. Creators across industries can leverage the freedom and control to deliver cutting-edge content, interactive experiences, and immersive virtual worlds.

* **Babylon** is ...TBD

* **OpenXR** is an open royalty-free API standard from Khronos that provides engines native access to a wide range of devices from vendors across the mixed reality spectrum. You can develop using OpenXR on a HoloLens 2 or Windows Mixed Reality immersive headset on the desktop. If you don't have access to a headset, emulators for HoloLens 2 and Windows Mixed Reality headsets are available.

## Features and devices

| Features/Devices | Unity | Unreal | Babylon | Native (OpenXR) |
|---|---|---|---|---|
| Language | C# | C++ | JavaScript | C/C++ |
| Licensing | TBD | TBD | TBD | TBD |
| HoloLens 2 | ✔️ | ✔️ | ✔️ | ✔️ |
| HoloLens (1st gen) | ✔️ | ✔️ | ❌ | ❌ |
| [Immersive VR headsets](../discover/immersive-headset-hardware-details.md) | ✔️ | ✔️ | ✔ | ✔ |
| Oculus Quest | ✔️ | ✔️ | ✔️ | ✔️ |
| Mixed Reality Toolkit | ✔️ | ✔️ | ❌ | ❌ |
| Mesh | ✔️ | ❌ | ❌ | ❌ |
| Azure Spatial Anchors | ✔️ | ✔️ | ❌ | ✔️ |
| Azure Object Anchors | ✔️ | ❌ | ❌ | ✔️ |
| Azure Remote Rendering | ✔️ | ❌ | ❌ | ❌ <!-- (End of May) --> |

<!-- Dig into specific features like Speech SDK, etc... -->

## Next steps

[!INCLUDE[](includes/tools-next-steps.md)]
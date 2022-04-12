---
title: World locking and spatial anchors in Unity
description: Learn how to use World Locking Tools and spatial anchors in Unity mixed reality applications.
author: sean-kerawala
ms.author: sekerawa
ms.date: 02/09/2022
ms.topic: article
keywords: Unity, spatial anchors, anchor store, HoloLens, mixed reality headset, windows mixed reality headset, virtual reality headset, world locking tools, holograms
---

# World locking and spatial anchors in Unity

![World locking tools hero image](images/wlt-img-01.jpeg)

Getting your holograms to stay in place, move with you, or in some cases position themselves relative to other holograms is a big part of creating Mixed Reality applications. This article will take you through our recommended solution using World Locking Tools, but we'll also cover manually setting up spatial anchors in your Unity projects. Before we jump into any code, it's important to understand how Unity handles coordinate space and anchors in its own engine.

## World-scale coordinate systems

Today, when writing games, data visualization apps, or virtual reality apps, the typical approach is to establish one absolute **world coordinate system** that all other coordinates can reliably map back to. In that environment, you can always find a stable transform that defines a relationship between any two objects in that world. If you didn't move those objects, their relative transforms would always remain the same. This kind of global coordinate system is easy to get right when rendering a purely virtual world where you know all of the geometry in advance. Room-scale VR apps today typically establish this kind of absolute room-scale coordinate system with its origin on the floor.

In contrast, an untethered mixed reality device such as HoloLens has a dynamic sensor-driven understanding of the world, continuously adjusting its knowledge over time of the user's surroundings as they walk many meters across an entire floor of a building. In a world-scale experience, if you placed all your holograms in a naive rigid coordinate system, those holograms would end up drifting over time, either based on the world or relative to each other.

For example, the headset may currently believe two locations in the world to be 4 meters apart, and then later refine that understanding, learning that the locations are in fact 3.9 meters apart. If those holograms had initially been placed 4 meters apart in a single rigid coordinate system, one of them would then always appear 0.1 meters off from the real world.

You can manually place **spatial anchors** in Unity to maintain a hologram's position in the physical world when the user is mobile. However, this sacrifices the self-consistency within the virtual world. Different anchors are constantly moving in relation to one another, and are also moving through the global coordinate space. In this scenario, simple tasks like layout become difficult. Physics simulation can also be problematic.

**World Locking Tools** (WLT) gets you the best of both worlds, stabilizing a single rigid coordinate system using an internal supply of spatial anchors spread throughout the virtual scene as the user moves around. WLT analyzes the coordinates of the camera and those spatial anchors every frame. Instead of changing the coordinates of everything in the world to compensate for the corrections in the coordinates of the user's head, WLT just fixes the head's coordinates instead.

## Choosing your world locking approach

* We recommend that you use **World Locking Tools** for all your hologram positioning needs.
    * World Locking Tools provides a stable coordinate system that minimizes the visible inconsistencies between virtual and real world markers. Put another way, it world-locks the entire scene with a shared pool of anchors, rather than locking each group of objects with the group's own individual anchor.
    * World Locking Tools automatically handles all creation and management of spatial anchors internally. You don't need to interact with **ARAnchorManager** or **WorldAnchor** to keep your holograms world-locked.
* **For Unity 2019/2020 using OpenXR or the Windows XR Plugin**, you need to use **ARAnchorManager**
* **For older Unity versions or WSA** projects, you need to use **WorldAnchor**

## Setting up world locking

[!INCLUDE[](includes/world-locking/world-locking-setup.md)]

## Persistent world locking

Spatial anchors save holograms in real-world space between application sessions. Once saved in the HoloLens' anchor store, they can be found and loaded in different sessions and are an ideal fallback when there's no internet connectivity.

> [!IMPORTANT]
> Local anchors are stored on device, while Azure Spatial Anchors are stored in the cloud. If you're looking to use Azure cloud services to store your anchors, we have a document that can walk you through integrating [Azure Spatial Anchors](../mixed-reality-cloud-services.md#azure-spatial-anchors). Note that you can have local and Azure anchors in the same project without conflict.

[!INCLUDE[](includes/world-locking/world-locking-persistence.md)]

## Sharing coordinate spaces

If you want to share a world locked coordinate space, check out our comprehensive [shared experience documentation](shared-experiences-in-unity.md).

## Next Development Checkpoint

If you're following the Unity development checkpoint journey we've laid out, you're in the midst of exploring the Mixed Reality core building blocks. From here, you can continue to the next building block:

> [!div class="nextstepaction"]
> [Spatial mapping](spatial-mapping-in-unity.md)

Or jump to Mixed Reality platform capabilities and APIs:

> [!div class="nextstepaction"]
> [Shared experiences](shared-experiences-in-unity.md)

You can always go back to the [Unity development checkpoints](unity-development-overview.md#2-core-building-blocks) at any time.

## See Also
* [World Locking Tools introduction](/mixed-reality/world-locking-tools/documentation/introfaq)
* [Quickstart guides](/mixed-reality/world-locking-tools/documentation/howtos/quickstart)
* [Tutorials](https://microsoft.github.io/MixedReality-WorldLockingTools-Samples/Tutorial/01_Minimal/01_Minimal.html)
* [Samples](/mixed-reality/world-locking-tools/documentation/howtos/sampleapplications)
* [Spatial anchor persistence](../../design/coordinate-systems.md#spatial-anchor-persistence)
* <a href="/azure/spatial-anchors" target="_blank">Azure Spatial Anchors</a>
* <a href="/dotnet/api/Microsoft.Azure.SpatialAnchors" target="_blank">Azure Spatial Anchors SDK for Unity</a>
* [Experience scales](../../design/coordinate-systems.md#mixed-reality-experience-scales)
* [Spatial stage](../../design/coordinate-systems.md#stage-frame-of-reference)
* [Tracking loss in Unity](tracking-loss-in-unity.md)
* [Spatial anchors](../../design/spatial-anchors.md)
* [Shared experiences in Unity](shared-experiences-in-unity.md)

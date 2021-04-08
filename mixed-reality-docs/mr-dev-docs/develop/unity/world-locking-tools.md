---
title: Introducing World Locking Tools
description: Get started with everything World Locking Tools has to offer new mixed reality developers.
author: hferrone
ms.author: v-hferrone
ms.date: 03/23/2021
ms.topic: article
ms.localizationpriority: high
keywords: Windows Mixed Reality, tools, SDK, HoloLens, HoloLens 2, mixed reality headset, windows mixed reality headset, virtual reality headset, cross-platform
---

# Introducing World Locking Tools

![World locking tools hero image](images/wlt-img-01.jpeg)

World Locking Tools provides a stable coordinate system and adjustable camera that minimizes the visible inconsistencies between virtual and real world markers. Put another way, it world-locks the entire scene with a shared pool of anchors, rather than locking each group of objects with the group's own individual anchor.

## Coordinate space and anchors in Unity 

For perspective on the problem that World Locking Tools solves, let's take a look at how Unity implements its own global coordinate space and spatial anchors. Unity's *coordinate space* provides a stable frame of reference, where holographic objects are fixed in relation to one another. While objects in this space behave consistently in relation to each other, consistency with the physical world isn't guaranteed or provided. This inconsistency with the real-world becomes a problem when your users are moving around during the mixed reality experience.

Unity's *spatial anchors* can maintain a hologram's position in the physical world when the user is mobile, but at the sacrifice of self-consistency within the virtual world. Different anchors are constantly moving in relation to one another, but are also moving through the global coordinate space. In this scenario, simple tasks like layout become difficult and physics simulation problematic.

## What comes with World Locking Tools

World Locking Tools keeps an internal supply of of spatial anchors it spreads throughout the virtual scene as the user moves around. The tools analyze the coordinates of the camera and those spatial anchors every frame. Instead of changing the coordinates of everything in the world to compensate for the changed coordinates of the user's head, the tools just fix the head's coordinates instead.

What this means for you as a developer: rather than having an anchor drag a hologram through Unity space to keep it fixed in physical space, the entire Unity world space is locked to physical space. If a hologram is motionless in Unity space, it will remain motionless relative to the physical world around it. More importantly, it will also remain fixed relative to the virtual features around it.

Obviously, it's more complicated under the hood than that. For example, spatial anchors move independently and don't always agree with each other. The underlying FrozenWorld engine arbitrates those disagreements and comes up with the most perceptually correct camera correction in every frame.

## Adding World Locking Tools to your project

We recommend installing World Locking Tools using the new Mixed Reality Feature Tool at the link below. When your project is ready to go, use the [basic quickstart guide](https://microsoft.github.io/MixedReality-WorldLockingTools-Unity/DocGen/Documentation/HowTos/UsingWLT/JustWorldLock.html) to get a world-locked scene up and running. For more advanced usage, see our [other quickstart and tutorial links](#see-also).

> [!div class="nextstepaction"]
> [Install with the MR Feature Tool](https://microsoft.github.io/MixedReality-WorldLockingTools-Unity/DocGen/Documentation/HowTos/WLTviaMRFeatureTool.html)

## See also

* [World Locking Tools introduction](https://microsoft.github.io/MixedReality-WorldLockingTools-Unity/DocGen/Documentation/IntroFAQ.html)
* [Quickstart guides](https://microsoft.github.io/MixedReality-WorldLockingTools-Unity/DocGen/Documentation/HowTos/QuickStart.html)
* [Tutorials](https://microsoft.github.io/MixedReality-WorldLockingTools-Samples/Tutorial/01_Minimal/01_Minimal.html)
* [Samples](https://microsoft.github.io/MixedReality-WorldLockingTools-Unity/DocGen/Documentation/HowTos/SampleApplications.html)
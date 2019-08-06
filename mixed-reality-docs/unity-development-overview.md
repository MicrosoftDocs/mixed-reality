---
title: Unity development overview
description: Getting started building mixed reality apps in Unity.
author: thetuvix
ms.author: Yoyoz
ms.date: 04/15/2018
ms.topic: article
keywords: Unity, mixed reality, development, getting started, new project, porting, capability, camera, simulation, emulation, documentation
---
# Unity development overview

The fastest path to building a [mixed reality app](app-views.md) is with [Unity](http://aka.ms/HoloLensUnity). We recommend that you take time to explore the [Unity tutorials](https://unity3d.com/learn/tutorials). If you need assets, Unity has a comprehensive [Asset Store](https://www.assetstore.unity3d.com/). Once you have built up a basic understanding of Unity, you can visit the [tutorials](tutorials.md) to learn the specifics of mixed reality development with Unity. Be sure to visit the [Unity Mixed Reality forums](http://forum.unity3d.com/forums/hololens.102/) to engage with the rest of the community building mixed reality apps in Unity and find solutions to problems you might run into.

To get started building mixed reality apps with Unity, first [install the tools](install-the-tools.md). 

## New Unity Project with Mixed Reality Toolkit 

The easiest way to develop in Unity is with the help of Mixed Reality Toolkit. It will help you setup with project automatically, and provide a set of mixed reality features to accelerate your development. Please check out [Mixed Reality Toolkit v2](mrtk-getting-started.md) to learn more and get started. 

## Porting an existing Unity app to Windows Mixed Reality

If you have an existing Unity project that you're porting to Windows Mixed Reality, follow along with the [Unity porting guide](porting-guides.md) to get started.

## Configuring new Unity project for Windows Mixed Reality

If you'd like to created a new Unity project without importing Mixed Reality Toolkit, there are a small set of Unity settings you'll need to manually change for Windows Mixed Reality. These are broken down into two categories: per-project and per-scene. See here for step by step guide to [Configure new Unity Project for Windows Mixed Reality](Configure-Unity-Project.md)

## Adding mixed reality capabilities and inputs

Once you've setup MRTK V2 with your project, or configured your project as described above, standard Unity game objects (such as the camera) will light up immediately for a **seated-scale experience**, with the camera's position updated automatically as the user moves their head through the world.

Adding support for Windows Mixed Reality features, such as [spatial stages](coordinate-systems.md#spatial-coordinate-systems), [gestures, motion controllers](gestures-and-motion-controllers-in-unity.md) or [voice input](voice-input-in-unity.md) is achieved using APIs built directly into Unity. 

First, review the [experience scales](coordinate-systems.md) that your applicatioin can target:
* If you're looking to build an **orientation-only** or **seated-scale experience**, you'll need to set Unity's tracking space type to [Stationary](coordinate-systems-in-unity.md#building-an-orientation-only-or-seated-scale-experience).
* If you're looking to build a **standing-scale** or **room-scale experience**, you'll need to ensure Unity's tracking space type is successfully set to [RoomScale](coordinate-systems-in-unity.md#building-an-orientation-only-or-seated-scale-experience).
* If you're looking to build a **world-scale** experience on HoloLens that lets users roam beyond 5 meters, you'll need to use the [WorldAnchor](coordinate-systems-in-unity.md#building-a-world-scale-experience) component.

All of the core building blocks for mixed reality applications are exposed in a manner consistent with other Unity APIs. They are also available through the Mixed Reality Toolkit.
* [Camera](camera-in-unity.md)
* [Coordinate systems](coordinate-systems-in-unity.md)
* [Gaze](gaze-in-unity.md)
* [Gestures and motion controllers](gestures-and-motion-controllers-in-unity.md)
* [Voice input](voice-input-in-unity.md)
* [Persistence](persistence-in-unity.md)
* [Spatial sound](spatial-sound-in-unity.md)
* [Spatial mapping](spatial-mapping-in-unity.md)

There are other key features that many mixed reality applications will want to use that are also exposed to Unity apps:
* [Shared experiences](shared-experiences-in-unity.md)
* [Locatable camera](locatable-camera-in-unity.md)
* [Focus point](focus-point-in-unity.md)
* [Tracking loss](tracking-loss-in-unity.md)
* [Keyboard](keyboard-input-in-unity.md)

## Running your Unity project on a real or simulated device

Once you've got your holographic Unity project ready for testing, your next step is to [export and build a Unity Visual Studio solution](exporting-and-building-a-unity-visual-studio-solution.md).

With that VS solution in hand, you can then run your application in one of three ways, using either a real or simulated device:
* [Deploy to a real HoloLens or Windows Mixed Reality immersive headset](using-visual-studio.md)
* [Deploy to the HoloLens emulator](using-the-hololens-emulator.md)
* [Deploy to the Windows Mixed Reality immersive headset simulator](using-the-windows-mixed-reality-simulator.md)

## Unity documentation

In addition to this documentation available on docs.microsoft.com, Unity installs documentation for Windows Mixed Reality functionality alongside the Unity Editor. The Unity provided documentation includes two separate sections:
1. **Unity scripting reference**
    * This section of the documentation contains details of the scripting API that Unity provides.
    * Accessible from the Unity Editor through **Help > Scripting Reference**
2. **Unity manual**
    * This manual is designed to help you learn how to use Unity, from basic to advanced techniques.
    * Accessible from the Unity Editor through **Help > Manual**

## See also
* [Mixed Reality Toolkit v2](mrtk-getting-started.md)
* [MR Basics 100: Getting started with Unity](holograms-100.md)
* [Recommended settings for Unity](recommended-settings-for-unity.md)
* [Performance recommendations for Unity](performance-recommendations-for-unity.md)
* [Exporting and building a Unity Visual Studio solution](exporting-and-building-a-unity-visual-studio-solution.md)
* [Using the Windows namespace with Unity apps for HoloLens](using-the-windows-namespace-with-unity-apps-for-hololens.md)
* [Best practices for working with Unity and Visual Studio](best-practices-for-working-with-unity-and-visual-studio.md)
* [Unity Play Mode](unity-play-mode.md)
* [Porting guides](porting-guides.md)

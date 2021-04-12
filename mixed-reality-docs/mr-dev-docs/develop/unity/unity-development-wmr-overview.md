---
title: Unity development for VR
description: Getting started building mixed reality apps in Unity for VR and Windows Mixed Reality immersive headsets.
author: hferrone
ms.author: kurtie
ms.date: 12/11/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unity, mixed reality, development, getting started, new project, porting, capability, camera, simulation, emulation, documentation, mixed reality headset, windows mixed reality headset, virtual reality headset, what is virtual reality, what is augmented reality, MRTK, mixed reality toolkit, voice input, locatable camera, emulator, Azure, tutorials
---

# Unity development for VR and Windows Mixed Reality

![Unity banner logo](../images/unity_logo_banner.png)

If you're brand new to Unity, we recommend that you explore the beginner level [tutorials](https://unity3d.com/learn/tutorials) on the Unity Learn platform before continuing. It's also a good idea to visit the [Unity Mixed Reality forums](https://forum.unity3d.com/forums/hololens.102/) to engage with the online community building mixed reality apps. You never know what cool assets or solutions you might find out in the wild. When you're ready to get started with MRTK head to the development checkpoints below!

> [!IMPORTANT]
> Take a look at our **[porting guides](../porting-apps/porting-overview.md)** if you have an existing Unity project that you want to bring over to a Windows Mixed Reality immersive headset. 

## Development checkpoints

Use the following checkpoints to bring your Unity games and applications into the world of mixed reality. 

### 1. Getting started

There are a small set of Unity settings you'll need to manually change for Windows Mixed Reality and VR development. These are broken down into two categories: per-project and per-scene. By the end of this section, you'll have the tools and project settings to start creating your own apps!

|  Checkpoint  |  Outcome  |
| --- | --- |
| [Install the latest tools](../install-the-tools.md) | Download and install the latest Unity package and setup your project for mixed reality |
| [Configuring your project for WMR](configure-unity-project.md) | Learn how to build applications that render digital content on holographic and VR display devices |

### 2. Core building blocks

After starting a new immersive project, you'll need some basic building blocks to develop immersive apps. All of the core building blocks for mixed reality applications are exposed in a manner consistent with other Unity APIs. You might not need all of them at once, but we recommend exploring early on. After diving into the core building blocks listed below, you'll have a toolbox full of features you can integrate into a VR project.

|  Feature  |  Capabilities  |
| --- | --- |
| [Camera](../unity/camera-in-unity.md) | Fully optimize visual quality and hologram stability in your Mixed Reality apps |
| [World locking and spatial anchors](spatial-anchors-in-unity.md) | Solve stabilization issues, camera adjustment, and integrate a stable coordinate system solution || [Motion controllers](../unity/motion-controllers-in-unity.md) | Add spatial actions to your Mixed Reality apps |
| [Gestures](../unity/gestures-in-unity.md) | Use hand gestures as input in your Mixed Reality experiences |
| [Spatial sound](../unity/spatial-sound-in-unity.md) | Enhance your apps with immersive 3D audio |
| [Text](../unity/text-in-unity.md) | Get sharp, high-quality text that has a manageable size and quality rendering |
| [Voice input](../unity/voice-input-in-unity.md) | Capture spoken keywords, phrases, and dictation from your users|

### 3. Advanced features

Other key features that play a role in immersive applications are available through Unity APIs without any extra packages or setup. After diving into the more advanced capabilities that Unity offers, you'll be able to build deeper, complex VR apps.

|  Feature  |  Capabilities  |
| --- | --- |
| [Tracking loss](tracking-loss-in-unity.md) | Handle scenarios where your device can't locate itself in the applications world space |
| [Keyboard input](keyboard-input-in-unity.md) | Get input from real-world and Mixed Reality keyboards in your apps |

### 4. Deploying to a device or emulator

Once you've got your holographic Unity project ready for testing, your next step is to export and build a Unity Visual Studio solution. With that VS solution in hand, you can run your application on real or simulated devices. By the end of this section, you'll be able to deploy your application on a device or emulator that fits your development needs.

* [Windows Mixed Reality immersive headset](../platform-capabilities-and-apis/using-visual-studio.md)
* [Windows Mixed Reality immersive headset simulator](../platform-capabilities-and-apis/using-the-windows-mixed-reality-simulator.md)

## What's next?

A developers job is never done, especially when learning a new tool or SDK. The following sections can take you into areas beyond the beginner level material you've already completed, along with helpful resources if you get stuck. Note that these topics and resources aren't in any sequential order, so feel free to jump around and explore!

### Porting

If you have existing apps that you'd like to port over, the articles listed below are your next stop:

* [Porting VR apps to Windows Mixed Reality](../porting-apps/porting-guides.md?tabs=project)
* [Updating SteamVR apps for Windows Mixed Reality](../porting-apps/updating-your-steamvr-application-for-windows-mixed-reality.md)

### Additional resources

Before going out into the world of mixed reality on your own, we recommend taking a look at the extra documentation below. 

* [VR enthusiast guide](/windows/mixed-reality/enthusiast-guide/vr-journey)
* [Unity Asset Store](https://assetstore.unity.com)

## See also 

* [Recommended settings for Unity](recommended-settings-for-unity.md)
* [Performance recommendations for Unity](performance-recommendations-for-unity.md)
* [Exporting and building a Unity Visual Studio solution](exporting-and-building-a-unity-visual-studio-solution.md)
* [Best practices for working with Unity and Visual Studio](best-practices-for-working-with-unity-and-visual-studio.md)
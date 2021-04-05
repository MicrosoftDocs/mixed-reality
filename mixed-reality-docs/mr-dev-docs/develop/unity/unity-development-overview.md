---
title: Unity development for HoloLens
description: Get started building mixed reality apps in Unity and HoloLens with our curated checkpoint journey.
author: hferrone
ms.author: kurtie
ms.date: 12/9/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unity, mixed reality, development, getting started, new project, porting, capability, camera, simulation, emulation, documentation, mixed reality headset, windows mixed reality headset, virtual reality headset, what is virtual reality, what is augmented reality, MRTK, mixed reality toolkit, spatial mapping, voice input, locatable camera, emulator, Azure, tutorials
---

# Unity development for HoloLens

![Unity banner logo](../images/unity_logo_banner.png)

The fastest path to building a HoloLens [mixed reality app](../../design/app-views.md) in [Unity](https://unity.com) is with the Mixed Reality Toolkit. If you're brand new to Unity, we recommend that you explore the beginner level [tutorials](https://unity3d.com/learn/tutorials) on the Unity Learn platform before continuing. It's also a good idea to visit the comprehensive [Asset Store](https://assetstore.unity.com) and the [Unity Mixed Reality forums](https://forum.unity3d.com/forums/hololens.102/) to engage with the online community building mixed reality apps. You never know what cool assets or solutions you might find out in the wild. When you're ready to get started with MRTK head to the development checkpoints below!

> [!IMPORTANT]
> Take a look at our **[porting guides](../porting-apps/porting-overview.md)** if you have an existing Unity project that you want to bring over to HoloLens 2. We have guides for projects that are using HTK, MRTK v1, or SteamVR.

## Development checkpoints

Use the following checkpoints to bring your Unity games and applications into the world of mixed reality. If you haven't already explored the [Designing Holograms sample application](https://www.microsoft.com/p/designing-holograms/9nxwnjklrzwd), we recommend downloading and using it to familiarize yourself with the basics of Mixed Reality UX.

## 1. Getting started

The easiest way to develop in Unity is with the Mixed Reality Toolkit. MRTK will help you automatically setup a project for Mixed Reality and provide a set of features to accelerate your development process. By the end of this section, you'll have a basic understanding of the Mixed Reality Toolkit, a properly configured development environment for Mixed Reality apps, and a working MRTK project in Unity that you built yourself.

|  Checkpoint  |  Outcome  |
| --- | --- |
| [Introducing the Mixed Reality Toolkit](mrtk-getting-started.md) | Begin your journey by getting acquainted with the Mixed Reality Toolkit and what it has to offer |
| [Understanding World Locking Tools](world-locking-tools.md) | Solve stabilization issues, camera adjustment, and integrate a stable coordinate system solution |
| [Install the latest tools](../install-the-tools.md) | Download and install the latest Unity package and setup your project for mixed reality |
| [HoloLens 2 tutorial series](tutorials/mr-learning-base-01.md) | Dive into beginner level MRTK tutorials for HoloLens 2 hardware |
| **Optional** [Download the Mixed Reality Feature Tool](welcome-to-mr-feature-tool.md) | A new developer tool for discovering, updating, and adding Mixed Reality feature packages to your Unity projects |

> [!IMPORTANT]
> If you'd like to create a new Unity project without importing Mixed Reality Toolkit, there are a small set of Unity settings you'll need to manually change for Windows Mixed Reality. These are broken down into two categories: per-project and per-scene. Take a look at our [configuration guide](configure-unity-project.md) for the step-by-step process.

> [!NOTE]
> Once you've setup MRTK V2 in your project, standard Unity game objects like the camera will light up immediately for a seated-scale experience. You can find instructions on changing the experience scale of your application on the [coordinate systems](coordinate-systems-in-unity.md) page.

## 2. Core building blocks

All of the core building blocks for mixed reality applications are exposed in a manner consistent with other Unity APIs. These building blocks are available as standalone features and through the Mixed Reality Toolkit. You might not need all of them at once, but we recommend exploring early on. After diving into the core building blocks listed below, you'll have a toolbox full of features you can integrate into a Mixed Reality project by themselves or through MRTK.

[!INCLUDE[](../includes/unity-building-blocks.md)]

## 3. Advanced features

Other key features that play a role in mixed reality applications are available through Unity APIs without any extra packages or setup. These features can be added to Unity projects with or without MRTK installed. After diving into the more advanced capabilities that Unity offers, you'll be able to build deeper, complex Mixed Reality apps.

|  Feature  |  Capabilities  |
| --- | --- |
| [Shared experiences](shared-experiences-in-unity.md) | View and interact collectively with the same hologram at a fixed point in space using spatial anchor sharing |
| [Locatable camera](locatable-camera-in-unity.md) | Capture photos and video content in your Mixed Reality application |
| [Focus point](focus-point-in-unity.md) | Provide HoloLens a hint about how to best perform stabilization on the holograms currently being displayed |
| [Tracking loss](tracking-loss-in-unity.md) | Handle scenarios where your device can't locate itself in the applications world space |
| [Keyboard input](keyboard-input-in-unity.md) | Get input from real-world and Mixed Reality keyboards in your apps |

## 4. Deploying to a device or emulator

Once you've got your holographic Unity project ready for testing, your next step is to export and build a Unity Visual Studio solution. With that VS solution in hand, you can run your application in one of three ways on a real or simulated device. By the end of this section, you'll be able to deploy your application on whichever device or emulator fits your development needs.

* [HoloLens or Windows Mixed Reality immersive headset](../platform-capabilities-and-apis/using-visual-studio.md)
* [HoloLens emulator](../platform-capabilities-and-apis/using-the-hololens-emulator.md)
* [Windows Mixed Reality immersive headset simulator](../platform-capabilities-and-apis/using-the-windows-mixed-reality-simulator.md)

## 5. Adding services

At this point in your development journey you might be looking to add services or for a helping hand with commercial deployment. Integrating [Azure Cloud Services](../mixed-reality-cloud-services.md) and Dynamics 365 features can level up your projects in a major way. We've compiled a few starting points for you to explore and expand your Mixed Reality knowledge.

[!INCLUDE[](../includes/unity-cloud-services-d365.md)]

We also have a [comprehensive list of support documentation for additional Azure services](../mixed-reality-cloud-services.md#standalone-unity-services) that you can add to your Unity projects on a self-serve basis.

## What's next?

A developers job is never done, especially when learning a new tool or SDK. The following sections can take you into areas beyond the beginner level material you've already completed, along with helpful resources if you get stuck. Note that these topics and resources aren't in any sequential order, so feel free to jump around and explore!

### Porting

If you have existing apps that you'd like to port over, the articles listed below are your next stop:

* [HoloToolkit/MRTK to MRTK v2](../porting-apps/porting-hl1-hl2.md)
* [Porting guide for immersive apps](../porting-apps/porting-guides.md)
* [Input porting guide](../platform-capabilities-and-apis/using-the-windows-mixed-reality-simulator.md)

### Tutorials

If you're looking to add specific Mixed Reality features to your applications, we have several curated tutorials that can run you through the process from end-to-end. Our most popular HoloLens 2 and HoloLens (1st Gen) content is listed below, but you can find the entire collection by visiting the tutorials overview.

[!INCLUDE[](../includes/unity-tutorials.md)]

### Additional resources

Before going out into the world of mixed reality on your own, we recommend taking a look at the MRTK-related documentation listed below. These articles are great jumping off points for understanding how MRTK works in greater detail and will give you insight into making your app more performant.

|  Topic  |  Description  |
| --- | --- |
| [MRTK Architecture overview](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/architecture/overview) | Get a deeper understanding of how the MRTK SDK works in your projects |
| [Settings and performance](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/performance/perf-getting-started) | Profile your app, update your Unity settings, and get the best hologram stabilization performance available |
| [Getting started with MRTK + XR](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/configuration/getting-started-with-mrtk-and-xrsdk) | Transfer over to the alternative XR pipeline provided by Unity |

### Unity resources

In addition to this documentation available on docs.microsoft.com, Unity installs documentation for Windows Mixed Reality functionality alongside the Unity Editor. The Unity provided documentation includes two separate sections.

|  Resource  |  Description  |
| --- | --- |
| [Scripting reference](https://docs.unity3d.com/ScriptReference/) | This section of the documentation contains details of the scripting API that Unity provides and is accessible online from the Unity Editor by clicking **Help > Scripting Reference** |
| [Manual](https://docs.unity3d.com/Manual/index.html) | This manual is designed to help you learn how to use Unity, from basic to advanced techniques, and is accessible online or from the Unity Editor by clicking **Help > Manual** |

> [!div class="nextstepaction"]
> [Explore MRTK](mrtk-getting-started.md)

## Have feedback?

You can find us on the [Unity Forums](https://aka.ms/unityforums) by tagging **Microsoft** and a combination of the following tags to help us understand what plugin you're providing feedback for:

* HoloLens 2 
* Windows Mixed Reality
* OpenXR
* XRSDK
* Legacy XR 

## See also

* [Mixed Reality Toolkit v2](mrtk-getting-started.md)
* [MR Basics 100: Getting started with Unity](tutorials/holograms-100.md)
* [Recommended settings for Unity](recommended-settings-for-unity.md)
* [Performance recommendations for Unity](performance-recommendations-for-unity.md)
* [Exporting and building a Unity Visual Studio solution](exporting-and-building-a-unity-visual-studio-solution.md)
* [Using the Windows namespace with Unity apps for HoloLens](using-the-windows-namespace-with-unity-apps-for-hololens.md)
* [Best practices for working with Unity and Visual Studio](best-practices-for-working-with-unity-and-visual-studio.md)
* [Unity Play Mode](unity-play-mode.md)
* [Porting guides](../porting-apps/porting-guides.md)
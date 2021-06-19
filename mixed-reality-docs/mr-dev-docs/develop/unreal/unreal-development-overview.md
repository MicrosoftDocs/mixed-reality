---
title: Unreal Development Overview
description: Get started wit mixed reality development for HoloLens and VR using Unreal Engine 4 with our curated checkpoint journey.
author: hferrone
ms.author: v-hferrone
ms.date: 12/9/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, streaming, remoting, mixed reality, development, getting started, features, new project, emulator, documentation, guides, features, holograms, game development, mixed reality headset, windows mixed reality headset, virtual reality headset, OpenXR
---
# Unreal Development Overview

![Unreal banner logo](../images/unreal_logo_banner.png)

Getting started with <a href="/windows/mixed-reality" target="_blank" title="Mixed Reality Docs"> mixed reality applications</a> is a big task. New concepts, platforms, and cutting edge hardware can seem like barriers. However, if you're an Unreal developer you're in luck. Unreal Engine 4 has full support for <a href="https://www.microsoft.com/windows/windows-mixed-reality" target="_blank" title="Windows Mixed Reality Docs">Windows Mixed Reality</a> (VR) and <a href="https://www.microsoft.com/hololens/hardware" target="_blank" title="HoloLens 2 Docs">HoloLens 2</a> (AR) devices.

[!INCLUDE[](includes/tabs-unreal-features.md)]

If you're new to Unreal development, don't jump in blind. Explore the Unreal <a href="https://docs.unrealengine.com/GettingStarted/index.html" target="_blank">tutorial series</a> and look for assets in the Unreal <a href="https://www.unrealengine.com/marketplace/store" target="_blank">marketplace</a>. You can also find support in the mixed reality <a href="https://forums.unrealengine.com/development-discussion/vr-ar-development" target="_blank">forums</a>. These resources are your links to the community of builders and problem solvers in today's mixed reality market.

> [!IMPORTANT]
> Take a look at our **[porting guide](unreal-reverb-g2-controllers.md)** if you have an existing Unreal project that you want to bring over to immersive headsets such as the Reverb G2.

## Development checkpoints

Use the following checkpoints to bring your Unreal games and applications into the world of mixed reality. If you haven't explored the [Designing Holograms sample application](https://www.microsoft.com/p/designing-holograms/9nxwnjklrzwd), we recommend downloading it to familiarize yourself with the basics of Mixed Reality UX.

### 1. Getting started

First, you'll need to install the tools for HoloLens 2 development. Next, go through our tutorial series to get a basic understanding of the Mixed Reality Toolkit, a properly configured development environment for mixed reality apps, and a working MRTK project in Unreal. As of Unreal 4.26, you also have the option of developing an OpenXR app for HoloLens 2.

|  Checkpoint  |  Outcome  |
| --- | --- |
| [Install the latest tools](../install-the-tools.md) | Download and install the latest version of Unreal Engine and setup your project for mixed reality |
| [Set up your project](unreal-project-setup.md) | Get the latest version of Unreal Engine and MRTK |
| [Creating your first HoloLens Unreal application](unreal-quickstart.md) | Start off your Unreal and HoloLens development journey by building a basic Mixed Reality application |
| [HoloLens 2 tutorial series](tutorials/unreal-uxt-ch1.md) | Get set up for mixed reality development in Unreal, build your first app with MRTK, and deploy your app to HoloLens 2 |
| Get started with [OpenXR](../native/openxr.md) in Unreal | Install and enable the following plugin from the Unreal Engine Marketplace:<ul><li> [Microsoft OpenXR](https://www.unrealengine.com/marketplace/en-US/product/ef8930ca860148c498b46887da196239)</li></ul>Ensure the Microsoft Windows Mixed Reality plugin is disabled.<br><br>The full list of currently supported features in OpenXR is [below](#supported-features).|

### 2. Core building blocks

There are a number of key mixed reality features that our tutorial series doesn't cover. These building blocks are available as standalone features and through the Mixed Reality Toolkit. You might not need all of them at once, but we recommend exploring early on. After diving into the core building blocks listed below, you'll have a toolbox full of features you can integrate into your Mixed Reality projects.

The [Mixed Reality Toolkit for Unreal](https://github.com/microsoft/MixedRealityToolkit-Unreal) is a set of plugins designed to speed up your development in Unreal. Each plugin includes components, samples, and documentation for setting up immersive experiences.

* [UX Tools for Unreal](https://www.unrealengine.com/marketplace/en-US/product/mixed-reality-ux-tools) is the first plugin to be released and is currently only supported on HoloLens 2. The plugin includes C++ code, Blueprints, and example assets of common UX features for input simulation, hand interactions, surface magnetism and more.

* [Graphics Tools for Unreal](https://github.com/microsoft/MixedReality-GraphicsTools-Unreal/) is a UE game plugin with code, blueprints and example assets created to help improve the visual fidelity of Mixed Reality applications while staying within performance budgets.

[!INCLUDE[](../includes/unreal-building-blocks.md)]

> [!NOTE]
> You can dive into the **[UX Tools for Unreal GitHub](https://github.com/microsoft/MixedReality-UXTools-Unreal)** repository for more details.

### 3. Advanced features

Other key features that play a role in mixed reality applications are available without any extra packages or setup. These features can be added to Unreal projects with or without MRTK installed. After diving into these more advanced capabilities, you'll be able to build more complex Mixed Reality apps.

|  Feature  |  Capabilities  |
| --- | --- |
| [HoloLens camera](unreal-hololens-camera.md) | Capture Mixed Reality and real-world visual content from your app running on a HoloLens device |
| [QR codes](unreal-qr-codes.md) | Render QR codes as holograms using a coordinate system at each code's real-world position |
| [WinRT](unreal-winrt.md) | Create a separate binary with WinRT code that can be consumed by Unreal’s build system |

### 4. Streaming and deploying to a device

If you want to test out your application on a HoloLens device while still in development, you can [stream it directly from your PC](unreal-streaming.md) by using either the Unreal editor or a packaged Windows executable.

If this is your first time deploying an Unreal app to HoloLens 2, you'll need to [download supporting files](tutorials/unreal-uxt-ch6.md#packaging-and-deploying-the-app-via-device-portal) from the Epic Launcher. Once you have those files installed, you're ready to deploy from either the [Unreal editor](unreal-deploying.md) or the [Device Portal](tutorials/unreal-uxt-ch6.md#packaging-and-deploying-the-app-via-device-portal).

### 5. Adding services

At this point in your development journey, you might be looking to add services or for a helping hand with commercial deployment. Integrating [Azure Cloud Services](../mixed-reality-cloud-services.md) can level up your projects in a major way. We've compiled a few starting points for you to explore and expand your Mixed Reality knowledge.

[!INCLUDE[](../includes/unreal-cloud-services-d365.md)]

### 6. Low-code alternatives

[!INCLUDE[](../includes/unreal-low-code.md)]

## What's next?

A developer's job is never done, especially when learning a new tool or SDK. The following sections can take you into areas beyond the beginner level material you've already completed, along with helpful resources if you get stuck. Note that these topics and resources are not in any sequential order, so feel free to jump around and explore!

### Debugging

If you're looking to debug the application while it's running on device with Visual Studio, follow these [instructions](/visualstudio/debugger/debug-installed-app-package#remote).

### Performance

Developing for mixed reality comes with performance checkpoints that depend on the platform. A HoloLens 2 app must run at 60 frames per second for holograms to appear stable and responsive. Luckily, we have [performance recommendations](performance-recommendations-for-unreal.md) for upgrading performance in your Unreal applications.

## Supported Features

| HoloLens 2 Feature | Earliest Supported Unreal Engine Version | Supported in OpenXR (4.26+) |
| ----------- | ----------- | ----------- |
| ARM64 support | 4.23 | ✔️ |
| Streaming from a PC | 4.23 | ✔️ |
| Spatial mapping | 4.23 | ✔️ |
| Hand and joint tracking | 4.23 | ✔️ |
| Eye tracking | 4.23 | ✔️ |
| Voice input | 4.23 | ✔️ |
| Spatial anchors | 4.23 | ✔️ |
| Camera access | 4.23 | ✔️ |
| QR codes | 4.23 | ✔️ |
| Spatial audio | 4.23 | ✔️ |
| Spectator Screen support for streaming | 4.24 |
| Planar LSR over streaming | 4.24 |
| [Sample apps](../features-and-samples.md) | 4.24 | ✔️ |
| Mobile multi-View: Performance hits 60 fps | 4.25 | ✔️ |
| 3rd camera render | 4.25 | ✔️ |
| Streaming from a packaged desktop app | 4.25.1 | ✔️ |
| Azure Spatial Anchors for HoloLens 2 | 4.25 | ✔️ |
| Mixed Reality UX Tools support | 4.25 | ✔️ |
| Developer docs & tutorials | 4.25 | ✔️ |
| System keyboard | 4.26 | ✔️ |
| HoloLens Media Player plugin | 4.26 | ✔️ |
| Azure Spatial Anchors for iOS and Android | 4.26 |
| Microsoft OpenXR plugin with Microsoft vendor-specific OpenXR extensions | 4.26 | ✔️ |
| Streaming from Azure to HoloLens 2 | 4.26 | ✔️ |
| Windows App Certification Kit compliance for packaged apps | 4.26 | ✔️ |
| HP Reverb G2 controller support | 4.26 | ✔️ |

> [!div class="nextstepaction"]
> [Install the tools](../install-the-tools.md)

## See also
* <a href="https://docs.unrealengine.com/Platforms/AR/HoloLens2/index.html" target="_blank">Unreal docs for streaming, deploying to emulator and device</a>
* <a href="https://docs.unrealengine.com/Platforms/Mobile/Performance/index.html" target="_blank">Unreal performance guidelines for mobile devices</a>
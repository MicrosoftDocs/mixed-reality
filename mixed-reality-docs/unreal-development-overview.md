---
title: Unreal Development Overview
description: Overview of mixed reality development using Unreal Engine 4
author: hferrone
ms.author: v-haferr
ms.date: 7/10/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, streaming, remoting, mixed reality, development, getting started, features, new project, emulator, documentation, guides, features, holograms, game development
---
# Unreal Development Overview

Getting started with <a href="https://docs.microsoft.com/windows/mixed-reality" target="_blank" title="Mixed Reality Docs"> mixed reality applications</a> is a big task. New concepts, platforms, and cutting edge hardware can seem like barriers. However, if you're an Unreal developer you're in luck. Support for <a href="https://www.microsoft.com/windows/windows-mixed-reality" target="_blank" title="Windows Mixed Reality Docs">Windows Mixed Reality</a> (VR) and <a href="https://www.microsoft.com/hololens/hardware" target="_blank" title="HoloLens 2 Docs">HoloLens 2</a> (AR) is now included in Unreal Engine's newest <a href="https://docs.unrealengine.com/Support/Builds/ReleaseNotes/4_25/index.html" target="_blank" title="Unreal Engine 4.25 release notes">release</a>. This update includes:
* Mixed Reality UX Tools plugin support
* OpenXR support
* App Remoting from a desktop app
* Better performance
* Mixed reality capture
* Initial support for Azure Spatial Anchors

If you're new to Unreal development don't jump in blind. Explore the Unreal <a href="https://docs.unrealengine.com/GettingStarted/index.html" target="_blank">tutorial series</a> to get up to speed and look for assets and support in the Unreal <a href="https://www.unrealengine.com/marketplace/store" target="_blank">marketplace</a> and mixed reality <a href="https://forums.unrealengine.com/development-discussion/vr-ar-development" target="_blank">forums</a>. These resources are your links to the community of builders and problem solvers in todays mixed reality market.

## Mixed Reality Toolkit for Unreal

The [Mixed Reality Toolkit for Unreal](https://github.com/microsoft/MixedRealityToolkit-Unreal) is a set of components designed to speed up your development in Unreal. Each component includes plugins, samples, and documentation for setting up immersive experiences. 

[UX Tools for Unreal](https://github.com/microsoft/MixedReality-UXTools-Unreal) is the first component to be released and is currently only supported on HoloLens 2. The component plugin includes code, blueprints, and example assets of common UX features including:
* Input simulation
* Hand interaction actor
* Press-able button component
* Manipulator component
* Follow behavior component

You can dive into the [UX Tools for Unreal](https://github.com/microsoft/MixedReality-UXTools-Unreal) GitHub repository for feature details and information on setting up your project.

## HoloLens 2 platform support
If this is your first time creating or deploying an Unreal app for HoloLens, you'll need to [download supporting platform support files](unreal-uxt-ch6.md#packaging-and-deploying-the-app) from the Epic Launcher.

## Tutorial

Building something with your own two hands is the best way to learn a new skill. Learning how to [build and deploy a simple chess app](unreal-uxt-ch1.md) for HoloLens 2 with the UX Tools plugin is a great way to start. 

The end-to-end tutorial series provides hands-on contact with common interactive UX components and scenarios. You'll work through the project setup, adding interactions to the scene, and deploying to a device or emulator. All you need is Windows 10, an emulator, and Visual Studio 2019.

## Debugging

To debug an app running on HoloLens 2 with Visual Studio, follow the instructions here for [debugging an installed UWP app on a remote device](https://docs.microsoft.com/visualstudio/debugger/debug-installed-app-package?view=vs-2019#remote).

## Performance

Developing for mixed reality comes with performance checkpoints that depend on the platform. A HoloLens 2 app must run at 60 frames per second for holograms to appear stable and responsive. Luckily, we have [performance recommendations](performance-recommendations-for-unreal.md) for achieving this in your Unreal applications.

## Guides to specific features

There are several key features of mixed reality development that our tutorial series doesn't cover. Check out the following guides for details and practical applications: 
* [Hand tracking](unreal-hand-tracking.md)
* [Eye tracking](unreal-gaze-input.md)
* [Spatial mapping](unreal-spatial-mapping.md)
* [Spatial audio](unreal-spatial-audio.md)
* [Spatial anchors](unreal-spatial-anchors.md)
* [Voice input](unreal-voice-input.md)
* [HoloLens camera](unreal-hololens-camera.md)
* [QR codes](unreal-qr-codes.md)

## Supported Features

| HoloLens 2 Feature | Earliest Supported Unreal Engine Version |
| ----------- | ----------- |
| ARM64 support | 4.23 |
| Streaming from a PC | 4.23 |
| Spatial mapping | 4.23 |
| Hand and joint tracking | 4.23 |
| Eye tracking | 4.23 |
| Voice input | 4.23 |
| Spatial anchors | 4.23 |
| Camera access | 4.23 |
| QR codes | 4.23 |
| Spatial audio | 4.23 |
| Spectator Screen support for streaming | 4.24 |
| Planar LSR over streaming | 4.24 |
| Sample apps ([HoloLens2Example](https://github.com/microsoft/MixedReality-Unreal-Samples) and [Mission AR](https://docs.unrealengine.com/Resources/Showcases/MissionAR/index.html)) | 4.24 |
| Mobile multi-View: Performance hits 60 fps | 4.25 |
| 3rd camera render | 4.25 |
| Streaming from a packaged desktop app | 4.25.1 |
| Azure Spatial Anchors for HoloLens 2 (beta) | 4.25 |
| OpenXR support (beta) | 4.25 |
| UX Tools support (0.8) | 4.25 |
| Developer docs & tutorials | 4.25 |

## See also
* <a href="https://docs.unrealengine.com/Platforms/AR/HoloLens2/index.html" target="_blank">Unreal docs for streaming, deploying to emulator and device</a>
* <a href="https://docs.unrealengine.com/Platforms/Mobile/Performance/index.html" target="_blank">Unreal performance guidelines for mobile devices</a>

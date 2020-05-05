---
title: Unreal development overview
description: Overview of mixed reality development using Unreal Engine 4
author: sw5813
ms.author: suwu
ms.date: 5/5/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, streaming, remoting, mixed reality, development, getting started, features, new project, emulator, documentation, guides, features, holograms
---
# Unreal development overview

Unreal Engine 4 now fully supports development for both Windows Mixed Reality (VR) and HoloLens 2 (AR) devices! If you're new to Unreal development, <a href="https://docs.unrealengine.com//GettingStarted/index.html" target="_blank">Getting Started with Unreal Engine 4</a> is a great page to explore. If you need assets, Unreal has a comprehensive <a href="https://www.unrealengine.com/marketplace//store" target="_blank">Marketplace</a>. 

Once you've gained a basic understanding of Unreal development, check out the tutorial in the next section to learn how to build and run your apps on HoloLens. Be sure to visit the <a href="https://forums.unrealengine.com/development-discussion/vr-ar-development" target="_blank">Unreal Mixed Reality forums</a> to engage with the community building mixed reality apps in Unreal. It's a great place to find solutions to problems you run into.

## Tutorial

Learn how to [build and deploy a simple chess app](unreal-uxt-ch1.md) for HoloLens 2 by following our end-to-end tutorial. This tutorial uses the UX Tools plugin to accelerate developing apps with interactive UX components including a button and a manipulator. For more information about UX Tools plugin, see the next section on MRTK. 

## Mixed Reality Toolkit for Unreal

The [Mixed Reality Toolkit for Unreal](https://github.com/microsoft/MixedRealityToolkit-Unreal) is a set of components, in the form of plugins, samples, and documentation, designed to accelerate the development of mixed reality applications using the Unreal Engine. The first component released as part of this toolkit is the [UX Tools for Unreal](https://github.com/microsoft/MixedReality-UXTools-Unreal), a plugin that can be added to your HoloLens 2 project to provide UX features for HoloLens 2 applications. Documentation for the Mixed Reality Toolkit and UX Tools for Unreal can be found in their respective GitHub repositories. 

## Guides to specific features

To learn how to use specific features in Unreal, check out the below guides: 
* [Hand Tracking](unreal-hand-tracking.md)
* [Eye Tracking](unreal-gaze-input.md)
* [Spatial Mapping](unreal-spatial-mapping.md)
* [Voice Input](unreal-voice-input.md)
* [Spatial Anchors](unreal-spatial-anchors.md)
* [HoloLens Camera](unreal-hololens-camera.md)
* [QR Codes](unreal-qr-codes.md)

## Performance

A HoloLens 2 app must run at 60 frames per second for holograms to appear stable and responsive. To achieve this in your app, we highly recommend following our [performance recommendations for Unreal](performance-recommendations-for-unreal.md). 

## Supported Features

| HoloLens 2 Feature | Earliest Supported Unreal Engine Version |
| ----------- | ----------- |
| ARM64 support | 4.23 |
| Streaming from a PC | 4.23 |
| Spatial Mapping | 4.23 |
| Hand and Joint Tracking | 4.23 |
| Eye Tracking | 4.23 |
| Voice Input | 4.23 |
| Spatial Anchors | 4.23 |
| Camera Access | 4.23 |
| QR Codes | 4.23 |
| Spatial Audio | 4.23 |
| Spectator Screen support for streaming | 4.24 |
| Planar LSR over streaming | 4.24 |
| Sample Apps ([HoloLens2Example](https://github.com/microsoft/MixedReality-Unreal-Samples) and [Mission AR](https://docs.unrealengine.com/en-US/Resources/Showcases/MissionAR/index.html)) | 4.24 |
| Mobile Multi-View: Performance hits 60 fps | 4.25 |
| 3rd Camera Render | 4.25 |
| Streaming from a packaged desktop app | 4.25 |
| Azure Spatial Anchors for HoloLens 2 (beta) | 4.25 |
| OpenXR support (beta) | 4.25 |
| UX Tools support (0.8) | 4.25 |
| Developer Docs & Tutorials | 4.25 |

## See also
* <a href="https://docs.unrealengine.com//Platforms/AR/HoloLens2/index.html" target="_blank">Unreal docs for streaming, deploying to emulator and device</a>
* <a href="https://docs.unrealengine.com//Platforms/Mobile/Performance/index.html" target="_blank">Unreal performance guidelines for mobile devices</a>

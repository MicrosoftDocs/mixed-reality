---
title: Unreal development overview
description: Getting started building mixed reality apps in Unreal.
author: sw5813
ms.author: suwu
ms.date: 09/04/2019
ms.topic: article
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, beta, streaming, remoting, mixed reality, development, getting started, new project, emulator, documentation
---
# Unreal development overview

Mixed reality support for Unreal Engine 4 is now in beta! If you're new to Unreal development, we recommend that you take time to explore the [Getting Started with Unreal Engine 4](https://docs.unrealengine.com/en-US/GettingStarted/index.html) page. If you need assets, Unreal has a comprehensive [Marketplace](https://www.unrealengine.com/marketplace/en-US/store). Once you've built up a basic understanding of Unreal Engine 4, you can visit the [Microsoft HoloLens Development](https://docs.unrealengine.com/en-US/Platforms/AR/HoloLens2/index.html) page on the Unreal Engine documentation site to learn how to build and run your apps on HoloLens. Be sure to visit the [Unreal Mixed Reality forums](https://forums.unrealengine.com/development-discussion/vr-ar-development) to engage with the rest of the community building mixed reality apps in Unreal and find solutions to problems you might run into.

## Installing the prerequisites

To get started with building a HoloLens 2 app in Unreal, you'll need the [HoloLens 2 Emulator](using-the-hololens-emulator.md) or a HoloLens headset. You'll also need to install the latest version of Visual Studio with the workloads and components listed in [HoloLens 2 Prerequisites for Unreal](https://docs.unrealengine.com/en-US/Platforms/AR/HoloLens2/Prerequisites/index.html).

## Building and running your Unreal app

First, [package your app for HoloLens 2](https://docs.unrealengine.com/en-US/Platforms/AR/HoloLens2/HowTo/PackageApp/index.html). Next, choose where you want to deploy your package:
* [Deploy to the HoloLens 2 Emulator](https://docs.unrealengine.com/en-US/Platforms/AR/HoloLens2/QuickStartEmulator/index.html)
* [Deploy to a HoloLens 2 Headset](https://docs.unrealengine.com/en-US/Platforms/AR/HoloLens2/QuickStartDevice/index.html)

## Streaming your app to a headset via the Holographic Remoting Player

Streaming your app from your desktop to the Holographic Remoting Player app on a HoloLens headset has two main advantages: 
* Speed up development- there's no need to repackage and upload your app each time you make a change
* Leverage the power of your desktop- render as many polygons as your desktop GPU allows, without being limited by the compute available on the headset

To get started with streaming, check out the [HoloLens 2 Streaming Quick Start](https://docs.unrealengine.com/en-US/Platforms/AR/HoloLens2/QuickStartStreaming/index.html).

## See also
* [Unreal performance guidelines for mobile devices](https://docs.unrealengine.com/en-US/Platforms/Mobile/Performance/index.html)

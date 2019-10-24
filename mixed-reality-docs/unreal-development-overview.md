---
title: Unreal development overview
description: To get started building mixed reality apps in Unreal.
author: sw5813
ms.author: suwu
ms.date: 10/24/2019
ms.topic: article
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, beta, streaming, remoting, mixed reality, development, getting started, new project, emulator, documentation
---
# Unreal development overview

Mixed reality support for Unreal Engine 4 is now in beta! If you're new to Unreal development, <a href="https://docs.unrealengine.com/en-US/GettingStarted/index.html" target="_blank">Getting Started with Unreal Engine 4</a> is a great page to explore. If you need assets, Unreal has a comprehensive <a href="https://www.unrealengine.com/marketplace/en-US/store" target="_blank">Marketplace</a>. 

Once you've built a basic understanding of Unreal Engine 4, you can visit the <a href="https://docs.unrealengine.com/en-US/Platforms/AR/HoloLens2/index.html" target="_blank">Microsoft HoloLens Development</a> page on the Unreal Engine documentation site to learn how to build and run your apps on HoloLens. Be sure to visit the <a href="https://forums.unrealengine.com/development-discussion/vr-ar-development" target="_blank">Unreal Mixed Reality forums</a> to engage with the community who build mixed reality apps in Unreal. It's a great place to find solutions to problems you might run into.

## Installing the prerequisites

To get started with building a HoloLens 2 app in Unreal, you'll need the [HoloLens 2 Emulator](using-the-hololens-emulator.md) or a HoloLens headset. You'll also need to install the latest version of Visual Studio with the workloads and components listed in <a href="https://docs.unrealengine.com/en-US/Platforms/AR/HoloLens2/Prerequisites/index.html" target="_blank">HoloLens 2 Prerequisites for Unreal</a>.

## Building and running your Unreal app

First, <a href="https://docs.unrealengine.com/en-US/Platforms/AR/HoloLens2/HowTo/PackageApp/index.html" target="_blank">package your app for HoloLens 2</a>. Next, choose where you want to deploy your package:
* <a href="https://docs.unrealengine.com/en-US/Platforms/AR/HoloLens2/QuickStartEmulator/index.html" target="_blank">Deploy to the HoloLens 2 Emulator</a>
* <a href="https://docs.unrealengine.com/en-US/Platforms/AR/HoloLens2/QuickStartDevice/index.html" target="_blank">Deploy to a HoloLens 2 Headset</a>

## Streaming your app to a headset via the Holographic Remoting Player

Streaming your app from your desktop to the Holographic Remoting Player app on a HoloLens headset has two main advantages: 
* Speeds up development, so there's no need to repackage and upload your app each time you make a change
* Leverages the power of your desktop, so you can render as many polygons as your desktop GPU allows, without being limited by the computer available on the headset

To get started with streaming, check out the <a href="https://docs.unrealengine.com/en-US/Platforms/AR/HoloLens2/QuickStartStreaming/index.html" target="_blank">HoloLens 2 Streaming Quick Start</a>[]().

## See also
* <a href="https://docs.unrealengine.com/en-US/Platforms/Mobile/Performance/index.html" target="_blank">Unreal performance guidelines for mobile devices</a>

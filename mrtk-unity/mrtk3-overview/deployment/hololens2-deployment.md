---
title: Deploy an MRTK3 project to HoloLens 2
description: Mixed Reality Toolkit 3 for developers - HoloLens 2 deployment.
author: RogPodge
ms.author: roliu
ms.date: 6/3/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, HoloLens, Deployment
---

# Deploy an MRTK3 project to HoloLens 2

## Testing Methods

There are two methods for testing MRTK3 Projects on Hololens 2

1. [Holographic Remoting](https://learn.microsoft.com/windows/mixed-reality/develop/unity/preview-and-debug-your-app?tabs=openxr) for fast iteration and testing

    2. Runs in editor, requiring no build and deploy

1. Deployment of the Unity project with MRTK after the device setup is complete

    2. Requires compilation, but runs smoother and lives on your device

## Deployment Pre-requisites

To add MRTK to your project, please refer to the [setup page](../setup.md) and ensure your [project settings](../setup.md#5-configure-openxr-related-settings) are configured correctly to use the OpenXR pipeline and MRTK's feature set. **These features are required to deploy your project onto your Hololens**.

This page describes how to deploy your Unity Project with MRTK onto a HoloLens 2 after initial setup is complete.

## Holographic Remoting

1. For rapid iteration and testing, We **strongly recommend** using [Holographic remoting](/windows/mixed-reality/develop/unity/preview-and-debug-your-app) on HoloLens 2.
2. Without the need to Compile + Deploy, Holographic Remoting cuts down the time used for testing on the device.
3. You can also play in Unity directly with the PC's current OpenXR runtime, including [Windows Mixed Reality](https://www.microsoft.com/p/openxr-tools-for-windows-mixed-reality/9n5cvvl23qbt), and [SteamVR on OpenXR](https://www.steamvr.com/). See our complete list [here](../debugging-and-testing.md).

## Deploying to Device

1. After you have the project configured, proceed to [Build the Unity Project](/windows/mixed-reality/develop/unity/build-and-deploy-to-hololens#build-the-unity-project).

1. Once built, you'll need to deploy the project through [Visual Studio](/windows/mixed-reality/develop/advanced-concepts/using-visual-studio?tabs=hl2).

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

This page describes how to deploy your Unity Project with MRTK onto a HoloLens 2. To add MRTK to your project, please refer to the [setup page](../setup.md).

> [!NOTE]
> We **strongly recommend** using [Holographic remoting](/windows/mixed-reality/develop/unity/preview-and-debug-your-app) for rapid iteration and testing on HoloLens 2, which allows for instant testing on the device without the need for compile + deploy. You can also play in Unity directly with the PC's current OpenXR runtime, including [Windows Mixed Reality](https://www.microsoft.com/p/openxr-tools-for-windows-mixed-reality/9n5cvvl23qbt), [SteamVR on OpenXR](https://www.steamvr.com/), or even [Quest Link](https://www.meta.com/help/quest/articles/headsets-and-accessories/oculus-link/). See our complete list [here](../debugging-and-testing.md).

## Deployment Prerequisites

1. Ensure that your [project settings](../setup.md#5-configure-openxr-related-settings) are configured correctly to use the OpenXR pipeline and MRTK's feature set. **These features are required to deploy your project onto a HoloLens**.

## Deploying to Device

1. After you have the project configured, proceed to [Build the Unity Project](/windows/mixed-reality/develop/unity/build-and-deploy-to-hololens#build-the-unity-project).

1. Once built, you'll need to deploy the project through [Visual Studio](/windows/mixed-reality/develop/advanced-concepts/using-visual-studio?tabs=hl2).

---
title: Mixed Reality Toolkit 3 Deployment on HoloLens 2
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
> We **strongly recommend** using [Holographic remoting](/mixed-reality/develop/unity/preview-and-debug-your-app) for rapid iteration and testing on Hololens 2, which allows for instant testing on the device without the need for compile + deploy. You can also play in Unity directly with the PC's current OpenXR runtime, including [Windows Mixed Reality](https://www.microsoft.com/p/openxr-tools-for-windows-mixed-reality/9n5cvvl23qbt), [SteamVR on OpenXR](https://www.steamvr.com/), or even [Oculus Link for Quest](https://support.oculus.com/airlink). See our complete list [here](../debugging-and-testing.md).

## Deployment Prerequisites

1. Ensure that your [project settings](../setup.md#5-configure-openxr-related-settings) are configured correctly to use the OpenXR pipeline and MRTK's feature set. **These features are required to deploy your project onto Hololens**

## Deploying to Device

1. After you have the project configured, proceed to [Build the Unity Project](/mixed-reality/develop/unity/build-and-deploy-to-hololens#build-the-unity-project).

1. Once built, you will need to deploy the project through [Visual Studio](/mixed-reality/develop/advanced-concepts/using-visual-studio?tabs=hl2).

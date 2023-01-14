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

This page describes how to deploy your Unity Project with MRTK3 onto a HoloLens 2.

> [!NOTE]
> - We strongly recommend using [Holographic remoting](LINK) for rapid iteration and testing on HoloLens 2, which allows for instant testing on the device without the need for compile + deploy.

## Deployment Pre-requisites

- To add MRTK to your project, please refer to the [setup page](../setup.md) and ensure your [project settings](../setup.md#5-configure-openxr-related-settings) are configured correctly to use the OpenXR pipeline and MRTK's feature set. **These features are required to deploy your project onto your HoloLens**.

- This page describes how to deploy your Unity Project with MRTK onto a HoloLens 2 after initial setup is complete.

## Deploying to Device

1. After you have the project configured, proceed to [Build the Unity Project](/windows/mixed-reality/develop/unity/build-and-deploy-to-hololens#build-the-unity-project).

1. Once built, you'll need to deploy the project through [Visual Studio](/windows/mixed-reality/develop/advanced-concepts/using-visual-studio?tabs=hl2).

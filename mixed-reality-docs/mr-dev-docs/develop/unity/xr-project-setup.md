---
title: Setting up your XR configuration
description: Stay up to date on the latest Unity XR configuration recommendations for HoloLens application development.
author: hferrone
ms.author: v-hferrone
ms.date: 04/22/2021
ms.topic: article
keywords: mixedrealitytoolkit, mixedrealitytoolkit-unity, mixed reality headset, windows mixed reality headset, virtual reality headset, unity
---

# Setting up your XR configuration

When you start a new Unity project, you have three different options for handling your XR needs: 
* OpenXR plugin
* Windows XR plugin
* Legacy XR plugin

[!INCLUDE[](includes/xr/intro.md)]

## Setting up your project with MRTK

The easiest way to get your Unity project set up for mixed reality is with the Mixed Reality Toolkit (MRTK).  MRTK for Unity is an open-source, cross-platform development kit designed to make it easy to build amazing mixed reality applications.

![MRTK](../../design/images/MRTK_UX_Hero.png)

MRTK provides a cross-platform input system, foundational components, and common building blocks for spatial interactions.  With MRTK version 2, you can speed up your application development for Microsoft HoloLens, Windows Mixed Reality immersive (VR) headsets, and many other VR/AR devices. The project is aimed at reducing barriers to entry, enabling everyone to build mixed reality applications and contribute back to the community as we all grow.

<br />

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4IkCG]

[!INCLUDE[](includes/xr/mrtk-next-step.md)]

To learn more about the Mixed Reality Toolkit, check out the [MRTK documentation](/windows/mixed-reality/mrtk-unity).

## Manual setup without MRTK

While Microsoft and the community have created open source tools such as the [Mixed Reality Toolkit (MRTK)](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/Installation.html) that will automatically set up your environment for mixed reality, some developers may wish to build their experiences from the ground up.

[!INCLUDE[](includes/xr/manual-setup.md)]
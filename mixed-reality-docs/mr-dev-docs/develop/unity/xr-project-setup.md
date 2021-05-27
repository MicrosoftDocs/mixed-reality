---
title: Choosing an XR configuration
description: Stay up to date on the latest Unity XR configuration recommendations for HoloLens application development.
author: hferrone
ms.author: v-hferrone
ms.date: 04/22/2021
ms.topic: article
keywords: mixedrealitytoolkit, mixedrealitytoolkit-unity, mixed reality headset, windows mixed reality headset, virtual reality headset, unity
---

# Choosing an XR configuration

When you start a new Unity project, you have three different options for handling your XR needs: 
* OpenXR
* Windows XR plugin
* Legacy XR

[!INCLUDE[](includes/xr/intro.md)]

## Setting up your project with MRTK

MRTK for Unity provides a cross-platform input system, foundational components, and common building blocks for spatial interactions. MRTK version 2 intends to speed up application development for Microsoft HoloLens, Windows Mixed Reality immersive (VR) headsets, and OpenVR platform. The project is aimed at reducing barriers to entry, creating mixed reality applications, and contributing back to the community as we all grow.

> [!div class="nextstepaction"]
> [Try out our MRTK tutorials](/windows/mixed-reality/develop/unity/tutorials/mr-learning-base-02?tabs=winxr)

Take a look at [MRTK's documentation](/windows/mixed-reality/mrtk-unity) for more feature details.

## Manual setup without MRTK

While Microsoft and the community have created opensource tools such as the [Mixed Reality Toolkit (MRTK)](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/Installation.html) that will automatically set up the WMR environment, many developers wish to build their experiences from the ground up.

[!INCLUDE[](includes/xr/manual-setup.md)]

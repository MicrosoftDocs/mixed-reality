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

MRTK for Unity provides a cross-platform input system, foundational components, and common building blocks for spatial interactions. MRTK version 2 intends to speed up application development for Microsoft HoloLens, Windows Mixed Reality immersive (VR) headsets, and OpenVR platform. The project is aimed at reducing barriers to entry, creating mixed reality applications, and contributing back to the community as we all grow.

> [!div class="nextstepaction"]
> [Try out our MRTK tutorials](./tutorials/mr-learning-base-02.md?tabs=winxr)

Take a look at [MRTK's documentation](/windows/mixed-reality/mrtk-unity) for more feature details.

### Using MRTK with OpenXR support

MRTK-Unity 2.7 release provides better supports for the Mixed Reality OpenXR plugin.

Open the [Mixed Reality Feature Tool](welcome-to-mr-feature-tool.md) again to install the Mixed Reality Toolkit, if you haven't already. OpenXR support is in the **Foundation** package.

See the MRTK documentation for [more in-depth information on migrating to OpenXR](/windows/mixed-reality/mrtk-unity/configuration/getting-started-with-mrtk-and-xrsdk#configuring-mrtk-for-the-xr-sdk-pipeline).

> [!NOTE]
> When upgrading from a previous version of MRTK older than **2.5.3**, ensure the following line is in the **Assets/MixedRealityToolkit.Generated/link.xml** file:
>
> ```xml
> <assembly fullname = "Microsoft.MixedReality.Toolkit.Providers.OpenXR" preserve="all"/>
> ```
>
> This line will be added by default if you started with MRTK 2.5.4 or newer.

## Manual setup without MRTK

While Microsoft and the community have created opensource tools such as the [Mixed Reality Toolkit (MRTK)](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/Installation.html) that will automatically set up the WMR environment, many developers wish to build their experiences from the ground up.

[!INCLUDE[](includes/xr/manual-setup.md)]
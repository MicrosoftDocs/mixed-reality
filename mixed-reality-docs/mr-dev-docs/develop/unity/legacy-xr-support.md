---
title: Using the Legacy built-in XR support
description: Learn how to setup your Unity projects with and without MRTK using Legacy built-in XR support.
author: hferrone
ms.author: alexturn
ms.date: 03/26/2021
ms.topic: article
keywords: Unity, mixed reality, development, getting started, new project, Windows Mixed Reality, UWP, XR, performance, legacy, mrtk
---

# Using Legacy built-in XR support

## Setting up your project with MRTK

MRTK for Unity provides a cross-platform input system, foundational components, and common building blocks for spatial interactions. MRTK version 2 intends to speed up application development for Microsoft HoloLens, Windows Mixed Reality immersive (VR) headsets, and OpenVR platform. The project is aimed at reducing barriers to entry, creating mixed reality applications, and contributing back to the community as we all grow.

> [!div class="nextstepaction"]
> [Try out our MRTK tutorials](/training/paths/beginner-hololens-2-tutorials/?tabs=wsa)

Take a look at [MRTK's documentation](/windows/mixed-reality/mrtk-unity) for more feature details.

## Manual setup without MRTK

If you're targeting Desktop VR, we suggest using the PC Standalone Platform selected by default on a new Unity project:

![Screenshot of Build Settings window open in the unity editor with PC, Mac & Standalone platform highlighted](images/wmr-config-img-3.png)

If you're targeting HoloLens 2, you need to switch to the Universal Windows Platform:

1.	Select **File > Build Settings...**
2.	Select **Universal Windows Platform** in the Platform list and select **Switch Platform**
3.	Set **Architecture** to **ARM 64**
4.	Set **Target device** to **HoloLens**
5.	Set **Build Type** to **D3D**
6.	Set **UWP SDK** to **Latest installed**
7.	Set **Build configuration** to **Release** because there are known performance issues with Debug

![Screenshot of Build Settings window open in unity editor with Universal Windows Platform highlighted](images/wmr-config-img-4.png)

After setting your platform, you need to let Unity know to create an [immersive view](../../design/app-views.md) instead of a 2D view when exported.

> [!CAUTION]
> Legacy XR is deprecated in Unity 2019 and removed in Unity 2020.

1. Open **Player Settings...** from the **Build Settings... window** and expand the **XR Settings** group
2. In the **XR Settings** section, select **Virtual Reality Supported** to add the Virtual Reality Devices list
3. Set **Depth Format** to **16-bit Depth** and enable **Depth Buffer Sharing**
4. Set **Stereo Rendering Mode** to **Single Pass Instance**
5. Select **WSA Holographic Remoting Supported** if you'd like to use Holographic remoting 

![Screenshot of Project settings window open in unity editor with Player settings section highlighted](images/wmr-config-img-9.png)

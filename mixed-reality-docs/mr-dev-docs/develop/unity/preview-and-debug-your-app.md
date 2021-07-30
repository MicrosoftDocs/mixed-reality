---
title: Preview and debug your app with Holographic Remoting and Play mode
description: Use Holographic Remoting and Play mode to preview and debug your app
author: v-vtieto
ms.author: v-vtieto
ms.date: 07/29/2021
ms.topic: article
keywords: openxr, unity, hololens, hololens 2, mixed reality, MRTK, Mixed Reality Toolkit, augmented reality, virtual reality, mixed reality headsets, learn, tutorial, getting started, holographic remoting, desktop, preview, debug
---

# Preview and debug your app using Holographic Remoting and Play mode

This article explains the following use case for Holographic Remoting: 

1. (Unity only): **You want to preview and debug your app during the development process**: You can run your app locally in the Unity editor on your PC in Play Mode and stream the experience to your HoloLens. This provides a way to quickly debug your app without building and deploying a full project. We call this type of app a _Holographic Remoting Play Mode Preview app_. Inputs from the HoloLens--gaze, gesture, voice, and spatial mapping--are sent to the PC, content is rendered in a virtual immersive view, and the rendered frames are then sent to the HoloLens. 

To learn more about Holographic Remoting, see [Holographic Remoting overview](../platform-capabilities-and-apis/holographic-remoting-overview.md)

Note that you can also use Holographic Remoting if [you want the resources of a PC to power your app](use-pc-resources.md) instead of relying on the HoloLens on-board resources.

## Set up Holographic Remoting

To use Holographic Remoting, you need to install the [Holographic Remoting Player](../platform-capabilities-and-apis/holographic-remoting-player.md) app from the Microsoft Store on your HoloLens 2. As explained below, after you download and run the app, you'll see the version number and IP address to connect to. **You'll need v2.4 or later in order to work with the OpenXR plugin**.

Holographic Remoting requires a fast PC and Wi-Fi connection. You can find more details in the Holographic Remoting Player article linked above.

![Screenshot of the Holographic Remoting Player running in the HoloLens](images/openxr-features-img-01.png)

[!INCLUDE[](includes/unity-play-mode.md)]

## See Also
* [Holographic Remoting Player](../platform-capabilities-and-apis/holographic-remoting-player.md)
* [Use PC resources to power your app](use-pc-resources.md)
* [Migrate from previous Holographic Remoting APIs](migrate-from-previous-apis.md)
* [Write a Holographic Remoting remote app using Windows Mixed Reality APIs](../platform-capabilities-and-apis/holographic-remoting-create-remote-wmr.md)
* [Write a Holographic Remoting remote app using OpenXR APIs](../platform-capabilities-and-apis/holographic-remoting-create-remote-openxr.md)
* [Tutorial: Getting started with PC Holographic Remoting](../tutorials/mr-learning-pc-holographic-remoting-01.md)
* [Tutorial: Creating a Holographic Remoting PC application](../tutorials/mr-learning-pc-holographic-remoting-02.md)

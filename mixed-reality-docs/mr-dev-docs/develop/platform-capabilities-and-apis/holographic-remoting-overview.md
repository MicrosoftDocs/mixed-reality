---
title: Holographic Remoting Overview
description: Learn about what Holographic Remoting is and how it can benefit your development process.
author: hferrone
ms.author: v-vtieto
ms.date: 07/30/2021
ms.topic: article
keywords: openxr, unity, hololens, hololens 2, mixed reality, MRTK, Mixed Reality Toolkit, augmented reality, virtual reality, mixed reality headsets, learn, tutorial, getting started, holographic remoting, desktop, preview
---

# Holographic Remoting Overview

You can use Holographic Remoting to stream holographic content to your HoloLens 2 in real time. There are two main uses for this, and it's important to understand the difference:

1. (Unity only): **You want to preview and debug your app during the development process**: You can run your app locally in the Unity editor on your PC in Play Mode and stream the experience to your HoloLens. This provides a way to quickly debug your app without building and deploying a full project. We call this type of app a _Holographic Remoting Play Mode Preview app_.

1. (Unity or C++):  **You want the resources of a PC to power your app instead of relying on the HoloLens on-board resources**: You can create and build an app that has Holographic Remoting capability. The user experiences the app on the HoloLens, but the app actually runs on a PC, which allows it to take advantage of the PC's more powerful resources. This can be especially helpful if your app has high-resolution assets or models and you don't want the frame rate to suffer. We call this type of app a _Holographic Remoting remote app_.

In either case, inputs from the HoloLens--gaze, gesture, voice, and spatial mapping--are sent to the PC, content is rendered in a virtual immersive view, and the rendered frames are then sent to the HoloLens. 

Holographic Remoting is also available for Windows Mixed Reality (WMR) immersive headsets. This could useful if, for example, your WMR headset is connected to a backpack PC and you wish to stream your app from a more powerful PC to the backpack PC.

You add Holographic Remoting to your desktop or UWP app via a NuGet package, and the connection is made using standard Wi-Fi. Additional code is required that handles the connection and renders in an immersive view. A typical remoting connection will have as low as 50 ms of latency. Your device displays the streamed content using a "player" app that can report the latency in real time.

## See Also

* [Holographic Remoting Player](holographic-remoting-player.md)
* [Preview and debug your app with Holographic Remoting and Play mode](../unity/preview-and-debug-your-app.md)
* [Use PC resources to power your app](../unity/use-pc-resources.md)
* [Migrate from previous Holographic Remoting APIs](../unity/migrate-from-previous-apis.md)
* [Write a Holographic Remoting remote app using Windows Mixed Reality APIs](holographic-remoting-create-remote-wmr.md)
* [Write a Holographic Remoting remote app using OpenXR APIs](holographic-remoting-create-remote-openxr.md)
* [Tutorial: Getting started with PC Holographic Remoting](../unity/tutorials/mr-learning-pc-holographic-remoting-01.md)
* [Tutorial: Creating a Holographic Remoting PC application](../unity/tutorials/mr-learning-pc-holographic-remoting-02.md)

---
title: Holographic Remoting Overview
description: Learn about what Holographic Remoting and how it can benefit your development process.
author: hferrone
ms.author: v-vtieto
ms.date: 07/26/2021
ms.topic: article
keywords: openxr, unity, hololens, hololens 2, mixed reality, MRTK, Mixed Reality Toolkit, augmented reality, virtual reality, mixed reality headsets, learn, tutorial, getting started, holographic remoting, desktop, preview
---

# Holographic Remoting Overview

When you add support for Holographic Rendering to your PC app or game, it enables the app to stream holographic content to your HoloLens 2 in real time. This is a great way to quickly debug your app without building and deploying a full project. Gaze, gesture, voice, and spatial mapping input is sent from your HoloLens 2 to your PC, content is rendered in a virtual immersive view using the greater system resources of the PC, and the rendered frames are then sent back to your HoloLens 2. Holographic Remoting is also available for Windows Mixed Reality immersive headsets.

You add Holographic Remoting to your desktop or UWP app via a NuGet package, and the connection is made using standard Wi-Fi. Additional code is required that handles the connection and renders in an immersive view. A typical remoting connection will have as low as 50 ms of latency. Your device displays the streamed content using a "player" app that can report the latency in real time.

If you're a Unity developer, you can also use Holographic Remoting by running your app in the Unity Editor in Play mode.

## See Also
* [Holographic Remoting Player](holographic-remoting-player.md)
* [Writing a Holographic Remoting remote app using Windows Mixed Reality APIs](holographic-remoting-create-remote-wmr.md)
* [Writing a Holographic Remoting remote app using OpenXR APIs](holographic-remoting-create-remote-openxr.md)
* [Tutorial: Getting started with PC Holographic Remoting](../unity/tutorials/mr-learning-pc-holographic-remoting-01.md)
* [Tutorial: Creating a Holographic Remoting PC application](../unity/tutorials/mr-learning-pc-holographic-remoting-02.md)

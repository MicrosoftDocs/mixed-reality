---
title: Unity Play Mode
description: Learn how to use Play Mode in the Unity editor to preview your application changes on a device without deploying an app.
author: jonmlyons
ms.author: jlyons
ms.date: 02/25/2021
ms.topic: article
keywords: Unity, remoting, holographic remoting, holographic remoting player, HoloLens, mixed reality headset, windows mixed reality headset, virtual reality headset, unity play mode
---

# Unity Play Mode

A fast way to work on your Unity project is to use "Play Mode", which runs your app locally in the Unity editor on your PC. Unity uses Holographic Remoting to provide a fast way to preview your content on a real HoloLens device. Play Mode can also be used with a Windows Mixed Reality headset attached to your development PC.

## Unity Play Mode with Holographic Remoting

With Holographic Remoting, you can experience your app on the HoloLens while it runs in the Unity editor on your PC. Gaze, gesture, voice, and spatial mapping input is sent from your HoloLens to your PC. Rendered frames are then sent back to your HoloLens. This is a great way to quickly debug your app without building and deploying a full project.

[!INCLUDE[](includes/unity-play-mode.md)]

Holographic Remoting requires a fast PC and Wi-Fi connection. You can find more details in the [Holographic Remoting Player](../platform-capabilities-and-apis/holographic-remoting-player.md) documentation.

For best results, make sure your app properly sets the [focus point](focus-point-in-unity.md). This helps Holographic Remoting to best adapt your scene to the latency of your wireless connection.

## See Also

- [Holographic Remoting Player](../platform-capabilities-and-apis/holographic-remoting-player.md)

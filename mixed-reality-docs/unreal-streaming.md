---
title: Streaming in Unreal
description: A guide to streaming in Unreal to HoloLens 2
author: suwu
ms.author: suwu
ms.date: 6/8/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, mixed reality, streaming, PC, holographic app remoting, holographic remoting player, documentation
---

# Streaming in Unreal

## Overview
Streaming from a PC to HoloLens provides two major advantages which can be useful for certain use cases: it enables your mixed reality app to take advantage of the computational power available on the PC, and it helps speed up development iteration time. By downloading the [Holographic Remoting Player](holographic-remoting-player.md) on your HoloLens, you can stream your app directly to the remoting player on your HoloLens from one of two sources:

* The Unreal Engine editor
* A packaged Windows executable 

When streaming, you have access to almost all the same HoloLens capabilities you would as for an application running on device (ex: hand joint tracking, spatial mapping, spatial anchors, etc.), except for this [list of limitations](holographic-remoting-troubleshooting.md). Note that streaming quality is highly dependent on the quality of your wifi network.

## Streaming from the Unreal editor

A major benefit to developers of streaming from the Unreal editor is the ability to instantly test your app on device, without needing to first wait for your app to build and deploy.

See the last section of the Getting Started with Unreal tutorial for instructions for 
[streaming from the Unreal editor](unreal-uxt-ch6.md#device-only-streaming).

## Streaming from a packaged Windows executable

As of Unreal 4.25.1, you can stream your app to a HoloLens 2 device from a packaged Windows executable. 

1. In the Main window of the Unreal editor, go to **File > Package Project**, and select **Windows**. 
    * Choose a location to save your package in and click **Select Folder**.
2. Once your package has finished building, open the Holographic Remoting Player on your HoloLens 2 and make note of the displayed IP Address. 
3. Open the command prompt and run the following command: 
```<App Name>.exe -vr -HoloLensRemoting=<IP Address>```

## See also
* [Holographic remoting version history](holographic-remoting-version-history.md)
* [Writing a custom Holographic Remoting player app](holographic-remoting-create-player.md)
* [Establishing a secure connection with Holographic Remoting](holographic-remoting-secure-connection.md)

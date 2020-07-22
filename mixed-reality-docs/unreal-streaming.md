---
title: Streaming in Unreal
description: A guide to streaming in Unreal to HoloLens 2
author: sw5813
ms.author: suwu
ms.date: 7/10/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, mixed reality, streaming, PC, holographic app remoting, holographic remoting player, documentation
appliesto:
- HoloLens 
- HoloLens 2
---

# Streaming in Unreal

## Overview
Streaming from a PC to HoloLens provides two major advantages: 
* It lets your mixed reality app take advantage of your PCs computational power. 
* It helps speed up development iteration time. 

To get started, you'll need to download the [Holographic Remoting Player](holographic-remoting-player.md) to your HoloLens device. This allows your app to stream  directly to the remoting player on your HoloLens from the following sources:

* The Unreal Engine editor
* A packaged Windows executable 

When streaming, you have access to almost all of the same HoloLens capabilities as you would when running an application on a device. This includes [hand joint tracking](unreal-hand-tracking.md) (if you're on a HoloLens 2), [spatial mapping](unreal-spatial-mapping.md), and [spatial anchors](unreal-spatial-anchors.md), but leaves out the features on this [list of limitations](holographic-remoting-troubleshooting.md). 

> [!NOTE]
> * Streaming quality is highly dependent on the strength of your wifi network.
> * All capabilities are automatically enabled for the holographic remoting player. If you find a capability that requires user permission (ex: eye tracking) to be working over streaming but not when running on device, check to ensure you've enabled the proper capabilities under your project settings.

## Device support

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><strong>Source</strong></td>
        <td><a href="https://docs.microsoft.com/hololens/hololens1-hardware"><strong>HoloLens 1st Gen</strong></a></td>
        <td><a href="https://www.microsoft.com/hololens/hardware"><strong>HoloLens 2</strong></a></td>
        <td><strong>Immersive Headsets</strong></td>
    </tr>
     <tr>
        <td>Unreal editor</td>
        <td>✔️</td>
        <td>✔️</td>
        <td>❌</td>
    </tr>
    <tr>
        <td>Windows package</td>
        <td>❌</td>
        <td>✔️</td>
        <td>❌</td>
    </tr>

</table>

## Streaming from the Unreal editor

As a developer, you'll find that streaming from the Unreal editor to your HoloLens device provides big benefits when testing, namely that you no longer have to wait for your app to build and deploy before trying out your updates.

You can find detailed instructions on [streaming from the Unreal editor](unreal-uxt-ch6.md#device-only-streaming) in the last section of the Getting Started with Unreal tutorial series.

## Streaming from a packaged Windows executable

As of Unreal 4.25.1, you can stream your app to a HoloLens 2 device from a packaged Windows executable by following the steps below: 

1. Go to **File > Package Project > Windows** in the editor menu. 
    * Choose a location to save your package and click **Select Folder**.

2. Once the package has finished building, open the **Holographic Remoting Player** on your HoloLens 2 and make note of the IP Address. 
3. Leave the **Holographic Remoting Player** open and use the command line prompt to: 
    * cd into the local directory where you saved your package.
    * Enter the following command: ```<App Name>.exe -vr -HoloLensRemoting=<IP Address>```

> [!NOTE]
> The application name in your project settings should be automatically used to create the Windows package. If these are different for some reason, use the Windows executable name in the command prompt.

Hit enter and watch your application start streaming!

## See also
* [Holographic remoting version history](holographic-remoting-version-history.md)
* [Writing a custom Holographic Remoting player app](holographic-remoting-create-player.md)
* [Establishing a secure connection with Holographic Remoting](holographic-remoting-secure-connection.md)

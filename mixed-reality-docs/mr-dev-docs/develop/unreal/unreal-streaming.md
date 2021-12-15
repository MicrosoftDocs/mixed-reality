---
title: Streaming in Unreal
description: Learn how to stream your Unreal apps to HoloLens 2, including streaming limitations and command line options.
author: sw5813
ms.author: v-vtieto
ms.date: 08/04/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, mixed reality, streaming, PC, holographic app remoting, holographic remoting player, documentation, mixed reality headset, windows mixed reality headset, virtual reality headset
appliesto:
- HoloLens 
- HoloLens 2
---

# Streaming in Unreal

"Streaming" is sometimes referred to as "Holographic Remoting." To learn more, see [Holographic Remoting Overview](../native/holographic-remoting-overview.md)

Streaming from a PC to HoloLens provides two major advantages: 
* It lets your mixed reality app take advantage of your PC's computational power. 
* It helps speed up development iteration time. 

To get started, you'll need to download the [Holographic Remoting Player](../native/holographic-remoting-player.md) to your HoloLens device. The Holographic Remoting Player lets your app to stream  directly to the remoting player on your HoloLens from the following sources:

* The Unreal Engine editor
* A packaged Windows executable 

When streaming, you have access to almost all of the same HoloLens capabilities as you would when running an application on a device. This includes [hand joint tracking](unreal-hand-tracking.md) if you're on a HoloLens 2, [spatial mapping](unreal-spatial-mapping.md), and [spatial anchors](unreal-spatial-anchors.md), but leaves out the features on this [list](../native/holographic-remoting-troubleshooting.md). 

> [!NOTE]
> * Streaming quality is highly dependent on the strength of your wifi network.
> * All capabilities are automatically enabled for the holographic remoting player. If you find a capability that requires user permission (ex: eye tracking) to be working over streaming but not when running on device, check to ensure you've enabled the proper capabilities under your project settings.

### Streaming limitations

Hand meshes, the HoloLens camera, and the system keyboard are unavailable over streaming. Note that speech input for streamed apps can be acquired via the microphone of the PC you are streaming from.

#### OpenXR

Unreal 4.26 running on OpenXR supports streaming to versions 2.4.0+ of the Holographic Remoting Player. OpenXR streaming in 2.4.0 is missing support for spatial mapping and spatial anchors. 

## Device support

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><strong>Source</strong></td>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens first Gen</strong></a></td>
        <td><a href="/hololens/hardware"><strong>HoloLens 2</strong></a></td>
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

As a developer, you'll find that streaming from the Unreal editor to your HoloLens device provides significant benefits when testing, namely that you no longer have to wait for your app to build and deploy before trying out your updates.

You can find detailed instructions for [streaming from the Unreal editor](tutorials/unreal-uxt-ch6.md#device-only-streaming) in our tutorial series.

## Streaming from a packaged Windows executable

In Unreal 4.25.1 and onwards, you can stream your app to a HoloLens 2 device from a packaged Windows executable: 

1. Go to **File > Package Project > Windows** in the editor menu. 
    * Choose a location to save your package and select **Select Folder**.

2. Once the package has finished building, open the **Holographic Remoting Player** on your HoloLens 2 and make note of the IP Address. 
3. Leave the **Holographic Remoting Player** open and use the command line prompt to: 
    * cd into the local directory where you saved your package.
    * Enter the following command: `<App Name>.exe -vr -HoloLensRemoting=<IP Address>`

> [!NOTE]
> The application name in your project settings should be automatically used to create the Windows package. If these are different for some reason, use the Windows executable name in the command prompt.

> [!NOTE]
> If eye tracking isn't working when streaming from a packaged executable, either disable any other plugins with PC-supported eye trackers (example: Magic Leap) or run the application from the command line with the relevant eye tracking argument (see [command line options](/mixed-reality/develop/unreal/unreal-streaming?tabs=wmr#command-line-options)).

Hit enter and watch your application start streaming!

### Command line options

Additional command line options for streaming from each platform in Unreal Engine 4.26+ can be found in the table below. 

[!INCLUDE[](includes/tabs-streaming-args.md)]

## See also

* [Holographic remoting version history](../native/holographic-remoting-version-history.md)
* [Writing a custom Holographic Remoting player app](../native/holographic-remoting-create-player.md)
* [Establishing a secure connection with Holographic Remoting](../native/holographic-remoting-secure-connection.md)

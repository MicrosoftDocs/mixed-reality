---
title: Holographic Remoting Player
description: Learn about the Holographic Remoting Player and streaming holographic content from a PC to your HoloLens in real time over Wi-Fi.
author: florianbagarmicrosoft
ms.author: v-vtieto
ms.date: 07/30/2021
ms.topic: article
keywords: HoloLens, Remoting, Holographic Remoting, mixed reality headset, windows mixed reality headset, virtual reality headset, diagnostics, performance
---

# Holographic Remoting Store Player

> [!TIP]
> [Learn the basics of Holographic Remoting.](holographic-remoting-overview.md)

> [!IMPORTANT]
> Holographic Remoting for HoloLens 2 is a major version change. [Remote applications for **HoloLens (1st gen)**](add-holographic-remoting.md) must use NuGet package version **1.x.x** and [remote applications for **HoloLens 2**](holographic-remoting-create-remote-wmr.md) must use **2.x.x**. This implies that remote applications written for HoloLens 2 are not compatible with HoloLens (1st gen) and vice versa.

The [Holographic Remoting Player](https://www.microsoft.com/p/holographic-remoting-player/9nblggh4sv40) is a companion app that connects to PC apps and games that support Holographic Remoting. The Player is available for both HoloLens (first gen) and HoloLens 2.  PC apps that supported Holographic Remoting with HoloLens need to be updated to support Holographic Remoting with HoloLens 2. Contact your app provider if you have questions about which versions are supported.

> [!Note]
> Starting with version [2.2.0](holographic-remoting-version-history.md#v2.2.0) the Holographic Remoting player is also available for Windows PCs running [Windows Mixed Reality](../../discover/navigating-the-windows-mixed-reality-home.md).

> [!TIP]
> Starting with version [2.4.0](holographic-remoting-version-history.md#v2.4.0) remote apps using the [OpenXR API](../native/openxr.md) can be created. To get started check out [Writing a Holographic Remoting remote app using OpenXR APIs](holographic-remoting-create-remote-openxr.md).

## Connecting to the Holographic Remoting Player

Follow your app's instructions to connect to the Holographic Remoting Player. You'll need to enter the IP address of your HoloLens device, which you can see on the Remoting Player's main screen, as follows:

![Holographic Remoting Player](images/holographicremotingplayer.png)

Whenever you see the main screen, you'll know that you don't have an app connected.

The holographic remoting connection is **not encrypted**. You should always use Holographic Remoting over a secure Wi-Fi connection that you trust.

## Quality and Performance

The quality and performance of your experience will vary based on three factors:
* **The holographic experience you're running** - Apps that render high-resolution or highly detailed content may require a faster PC or faster wireless connection.
* **Your PC's hardware** - Your PC needs to be able to run and encode your holographic experience at 60 frames per second. For a graphics card, we generally recommend a GeForce GTX 970 or AMD Radeon R9 290 or better. Again, your particular experience may require a higher or lower-end card.
* **Your Wi-Fi connection** - Your holographic experience is streamed over Wi-Fi. Use a fast network with low congestion to maximize quality. Using a PC that is connected over an Ethernet cable, rather than Wi-Fi, may also improve quality.

## Diagnostics

To measure the quality of your connection, say **"enable diagnostics"** while on the main screen of the Holographic Remoting Player. When diagnostics are enabled, on **HoloLens (first gen)** the app will show you:

* **FPS** - The average number of rendered frames the Remoting player is receiving and rendering per second. The ideal is 60 FPS.
* **Latency** - The average amount of time it takes for a frame to go from your PC to the HoloLens. The lower the better. This is largely dependent on your Wi-Fi network.

On **HoloLens 2** the app will show you:

![Holographic Remoting Player Diagnostics](images/holographicremotingplayer-diag.png)

* **Render** - The number of frames the Remoting player rendered during the last second. Note, this is independent from the number of frames, which arrived via the network (see **Video frames**). The average/maximum render delta time in milliseconds over the last second between rendered frames is displayed.

* **Video frames** - The first number displayed is skipped video frames, the second is reused video frames, and the third is received video frames. All numbers represent the count over the last second.
    * ```Received frames``` is the number of video frames, which arrived over the last second. Under normal conditions this should be 60 but if it's not this is an indicator that either frames are dropped because of network issues or the remote/remote side doesn't produce frames with the expected rate.
    * ```Reused frames``` is the count of video frames used more than once over the last second. For instance, if video frames arrive late, the rendering loop of the player still renders a frame but needs to *reuse* the video frame it already used for the previous frame.
    * ```Skipped frames``` is the count of video frames, which haven't been used by the rendering loop of the player. For instance, network jitter can have the effect that video frames arriving aren't evenly distributed anymore. For example, if some are late and others arrive in time with the result that they do not have a delta of 16.66 milliseconds anymore when running on 60 Hz. It can occur that more than one frame arrives between two ticks of the render loop of the player. In this case, the player *skips* one or more frames as it's supposed to always display the most recent received video frame.

> [!NOTE]
> When facing network jitter, skipped and reused frames are usually about the same. In contrast, if you only see skipped frames, this is an indicator that the player does not hit its target frame rate. In this case, you should keep an eye on the maximum render delta time when diagnosing issues.

* **Video frames delta** - The minimum/maximum delta between received video frames over the last second. This number usually correlates with skipped/reused frames in case of issues caused by network jitter.
* **Latency** - The average turnaround in milliseconds over the last second. 
Turnaround in this context means the time from sending pose/sensor data from the HoloLens to the remote/remote side until displaying the video frame for that pose/telemetry data on the HoloLens display.
* **Video frames discarded** - The number of discarded video frames over the last second and since a connection has been established. The primary cause for discarded video frames is when a video frame doesn't arrive in order and for that reason needs to be discarded as there's already a newer one. This is similar to *discarded frames* but the cause is at a lower level in the Remoting stack. Discarded video frames are only expected under bad network conditions.

While on the main screen, you can say **"disable diagnostics"** to turn off diagnostics.

## PC System Requirements
* Your PC **must** be running the Windows 10 Anniversary Update or newer.
* We recommend a GeForce GTX 970 or AMD Radeon R9 290 or better graphics card.
* We recommend you connect your PC to your network via ethernet to reduce the number of Wireless hops.

## See Also
* [Holographic Remoting overview](holographic-remoting-overview.md)
* [HoloLens (first gen): Add Holographic Remoting](add-holographic-remoting.md)
* [Writing a Holographic Remoting remote app using Windows Mixed Reality APIs](holographic-remoting-create-remote-wmr.md)
* [Writing a Holographic Remoting remote app using OpenXR APIs](holographic-remoting-create-remote-openxr.md)
* [Holographic Remoting software license terms](/legal/mixed-reality/microsoft-holographic-remoting-software-license-terms)
* [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?LinkId=521839)

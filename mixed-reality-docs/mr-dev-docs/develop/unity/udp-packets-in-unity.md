---
title: UDP packets in Unity UWP apps
description:
author: hferrone
ms.author: v-hferrone
ms.date: 02/3/2021
ms.topic: article
keywords: 
---

# UDP packets in Unity UWP apps

You can setup your Universal Windows Platform (UWP) Unity apps to receive UDP packets with the help of a UDP socket client and server. UDP sockets don't maintain connection on both endpoints, so they're a fast and simple solution for networking between remote machines. However, you'll be responsible for checking if the packets get to their destination, as UDP sockets don't do that automatically.

## Setup

Open your projects HoloLens manifest.json file and make sure you've enabled:
* **Internet (Client & Server)** 
* **Private Networks (Client & Server)**.

## Build your socket client and server 

Follow the instructions for [building a basic UDP socket client and server](https://docs.microsoft.com/windows/uwp/networking/sockets#build-a-basic-udp-socket-client-and-server). You'll be using the [DatagramSocket](https://docs.microsoft.com/uwp/api/Windows.Networking.Sockets.DatagramSocket?view=winrt-19041) class to send and receive data over UDP and form an echo client and server. We also recommend reading through the other resource sections in this article, as they apply to more customized and complex use cases. 

We also have a complete DatagramSocket UDP sample app available for download:

> [!div class="nextstepaction"]
> [Install the tools](https://docs.microsoft.com/samples/microsoft/windows-universal-samples/datagramsocket/)

## Known issues

UWP apps don't support the .NET UDPClient API, which is built on Unity's deprecated [UNET framework](https://docs.unity3d.com/Manual/UNet.html).

> [!IMPORTANT]
> If you're having trouble sending UDP packets from PC to PC, check that your network allows these operations. If your network is blocking the UDP packets in any way, your HoloLens device won't be able to listen for them.

## See also 
* [Experiments with Shared Holograms and Azure Blob Storage/UDP Multicasting](https://mtaulty.com/2017/12/29/experiments-with-shared-holograms-and-azure-blob-storage-udp-multicasting-part-1/)
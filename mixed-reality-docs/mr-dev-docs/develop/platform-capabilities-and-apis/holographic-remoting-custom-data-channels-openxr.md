---
title: Custom Data Channels with Holographic Remoting and the OpenXR API
description: This page explains how custom data channels can be used with the OpenXR API to send user data over the already established Holographic Remoting connection.
author: vimusc
ms.author: vimusch
ms.date: 09/07/2021
ms.topic: article
keywords: HoloLens, Remoting, Holographic Remoting, mixed reality headset, windows mixed reality headset, virtual reality headset, data channels
---

# Custom Data Channels with Holographic Remoting and the OpenXR API

>[!NOTE]
>This guidance is specific to Holographic Remoting on HoloLens 2 and Windows PCs running [Windows Mixed Reality](../../discover/navigating-the-windows-mixed-reality-home.md).

Use custom data channels to send custom data over an established remoting connection.

>[!IMPORTANT]
>Custom data channels require a custom remote app and a custom player app, as it allows for communication between the two custom apps.

>[!TIP]
>A simple ping-pong example can be found in the remote and player samples inside the [Holographic Remoting samples github repository](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples).
>Uncomment ```#define ENABLE_CUSTOM_DATA_CHANNEL_SAMPLE``` inside the OpenXrProgramm.cpp and SamplePlayerMain.h files to enable the sample code.

>[!IMPORTANT]
>The detailed [specification](https://htmlpreview.github.io/?https://github.com/microsoft/MixedReality-HolographicRemoting-Samples/blob/main/remote_openxr/specification.html) can be found in the [Holographic Remoting samples github repository](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples).


## Create a Custom Data Channel

After a connection is successfully established, new data channels can be created via the ```xrCreateRemotingDataChannelMSFT``` function.
Custom data channels can be created from the player and the remote application even if the runtimes are different.
In case a data channel gets created by the player side, the remote side is notified with the ```XrEventDataRemotingDataChannelCreatedMSFT``` event structure.

The initial ```XrRemotingDataChannelStatusMSFT``` state after calling ```xrCreateRemotingDataChannelMSFT``` is ```XR_REMOTING_DATA_CHANNEL_STATUS_OPEN_PENDING_MSFT```.
Once the data channel has been fully established the channel`s state switches to ```XR_REMOTING_DATA_CHANNEL_STATUS_OPENED_MSFT```.
The ```XrEventDataRemotingDataChannelOpenedMSFT``` event structure is placed in the event queue when the state of a previously created data channel switches from ```XR_REMOTING_DATA_CHANNEL_STATUS_OPEN_PENDING_MSFT``` to ```XR_REMOTING_DATA_CHANNEL_STATUS_OPENED_MSFT```.

## Send Data

The ```xrSendRemotingDataMSFT``` function is used to send data to the player side.

## Retrieve Data

Every time data arrives via a data channel, an ```XrEventDataRemotingDataChannelDataReceivedMSFT``` event structure is placed into the event queue.
**Received** packets can be **retrieved** with the ```xrRetrieveRemotingDataMSFT``` function.

## Get the Channel State

The ```xrGetRemotingDataChannelStateMSFT``` function can be used to query the data channel state.

## Destroy a Data Channel

A data channel can be destroyed with ```xrDestroyRemotingDataChannelMSFT```.
The ```XrRemotingDataChannelMSFT``` handle is invalid after the ```xrDestroyRemotingDataChannelMSFT``` call and the data channel handle must not be used afterwards.

The ```XrEventDataRemotingDataChannelClosedMSFT``` will be placed in the event queue in case the player side closes or destroys the data channel.
The data channel state switches to ```XR_REMOTING_DATA_CHANNEL_STATUS_CLOSED_MSFT```.
For a closed data channel, the ```XrRemotingDataChannelMSFT``` handle remains valid.

## See Also
* [Holographic Remoting Overview](holographic-remoting-overview.md)
* [Writing a Holographic Remoting remote app using OpenXR APIs](holographic-remoting-create-remote-openxr.md)

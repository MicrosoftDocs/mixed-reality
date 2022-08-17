---
title: Custom Data Channels with Holographic Remoting and the OpenXR API
description: This page explains how custom data channels can be used with the OpenXR API to send user data over the already-established Holographic Remoting connection.
author: vimusc
ms.author: vimusch
ms.date: 09/07/2021
ms.topic: article
keywords: HoloLens, Remoting, Holographic Remoting, mixed reality headset, windows mixed reality headset, virtual reality headset, data channels
---

# Custom Data Channels with Holographic Remoting and the OpenXR API

Use custom data channels to send custom data over an established remoting connection.

> [!IMPORTANT]
> Custom data channels require a custom remote app and a custom player app. This allows communication between the two custom apps.

> [!TIP]
> A simple ping-pong example can be found in the remote and player samples inside the [Holographic Remoting samples github repository](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples).
>Uncomment ```#define ENABLE_CUSTOM_DATA_CHANNEL_SAMPLE``` inside the OpenXrProgramm.cpp and SamplePlayerMain.h files to enable the sample code.

> [!NOTE]
> The detailed [specification](https://htmlpreview.github.io/?https://github.com/microsoft/MixedReality-HolographicRemoting-Samples/blob/main/remote_openxr/specification.html) can be found in the [Holographic Remoting samples github repository](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples).


## Create a Custom Data Channel
A custom data channel is defined by the ```XrRemotingDataChannelMSFT``` handle:
```cpp
XrRemotingDataChannelMSFT m_userDataChannel;
```

After a connection is successfully established, new data channels can be created via the ```xrCreateRemotingDataChannelMSFT``` function:

```cpp
XrRemotingDataChannelCreateInfoMSFT channelInfo{static_cast<XrStructureType>(XR_TYPE_REMOTING_DATA_CHANNEL_CREATE_INFO_MSFT)};
channelInfo.channelId = 0;
channelInfo.channelPriority = XR_REMOTING_DATA_CHANNEL_PRIORITY_LOW_MSFT;
CHECK_XRCMD(m_extensions.xrCreateRemotingDataChannelMSFT(m_instance.Get(), m_systemId, &channelInfo, &m_userDataChannel));
```

Custom data channels can be created from the player and the remote application even if the runtimes are different.
If a data channel is created by the player side, the remote side is notified with the ```XrEventDataRemotingDataChannelCreatedMSFT``` event structure:

```cpp
XrEventDataBuffer eventData{};
while (pollEvent(eventData)) 
{
    switch (eventData.type) 
    {
        case XR_TYPE_EVENT_DATA_REMOTING_DATA_CHANNEL_CREATED_MSFT: 
        {
            auto channelCreatedEventData = reinterpret_cast<const XrEventDataRemotingDataChannelCreatedMSFT*>(&eventData);
            m_userDataChannel = channelCreatedEventData->channel;
            break;
        }
    }
}
```

The initial ```XrRemotingDataChannelStatusMSFT``` state after calling ```xrCreateRemotingDataChannelMSFT``` is ```XR_REMOTING_DATA_CHANNEL_STATUS_OPEN_PENDING_MSFT```.
Once the data channel has been fully established, the channel`s state switches to ```XR_REMOTING_DATA_CHANNEL_STATUS_OPENED_MSFT```.
The ```XrEventDataRemotingDataChannelOpenedMSFT``` event structure is placed in the event queue when the state of a previously created data channel switches from ```XR_REMOTING_DATA_CHANNEL_STATUS_OPEN_PENDING_MSFT``` to ```XR_REMOTING_DATA_CHANNEL_STATUS_OPENED_MSFT```.


## Get the Channel State

The ```xrGetRemotingDataChannelStateMSFT``` function can be used to query the data channel state:
```cpp
XrRemotingDataChannelStateMSFT channelState{static_cast<XrStructureType>(XR_TYPE_REMOTING_DATA_CHANNEL_STATE_MSFT)};
CHECK_XRCMD(m_extensions.xrGetRemotingDataChannelStateMSFT(m_userDataChannel, &channelState));
```

## Send Data

If the channel is open the ```xrSendRemotingDataMSFT``` function is used to send data to the player side:

```cpp
if (channelState.connectionStatus == XR_REMOTING_DATA_CHANNEL_STATUS_OPENED_MSFT) {
    // Only send the packet if the send queue is smaller than 1MiB
    if (channelState.sendQueueSize >= 1 * 1024 * 1024) {
        return;
    }
    uint8_t data[] = {1};

    XrRemotingDataChannelSendDataInfoMSFT sendInfo{
        static_cast<XrStructureType>(XR_TYPE_REMOTING_DATA_CHANNEL_SEND_DATA_INFO_MSFT)};
    sendInfo.data = data;
    sendInfo.size = sizeof(data);
    sendInfo.guaranteedDelivery = true;
    CHECK_XRCMD(m_extensions.xrSendRemotingDataMSFT(m_userDataChannel, &sendInfo));
}
```

> [!NOTE]
> The data you send over a custom data channel shares the bandwidth with other data channels Holographic Remoting uses.

## Retrieve Data

Every time data arrives via a data channel, an ```XrEventDataRemotingDataChannelDataReceivedMSFT``` event structure is placed into the event queue.
Received packets can be retrieved with the ```xrRetrieveRemotingDataMSFT``` function:

```cpp
XrEventDataBuffer eventData{};
while (pollEvent(eventData)) 
{
    switch (eventData.type) 
    {
        case XR_TYPE_EVENT_DATA_REMOTING_DATA_CHANNEL_DATA_RECEIVED_MSFT: 
        {
            auto dataReceivedEventData = reinterpret_cast<const XrEventDataRemotingDataChannelDataReceivedMSFT*>(&eventData);
            std::vector<uint8_t> packet(dataReceivedEventData->size);
            uint32_t dataBytesCount;
            CHECK_XRCMD(m_extensions.xrRetrieveRemotingDataMSFT(dataReceivedEventData->channel,
                                                                dataReceivedEventData->packetId,
                                                                static_cast<uint32_t>(packet.size()),
                                                                &dataBytesCount,
                                                                packet.data()));
            break;
        }
    }
}
```

## Destroy a Data Channel

You can destroy a data channel with ```xrDestroyRemotingDataChannelMSFT```:

```cpp
CHECK_XRCMD(m_extensions.xrDestroyRemotingDataChannelMSFT(m_userDataChannel));
```

The ```XrRemotingDataChannelMSFT``` handle is invalid after the ```xrDestroyRemotingDataChannelMSFT``` call and the data channel handle must not be used afterwards.

The ```XrEventDataRemotingDataChannelClosedMSFT``` will be placed in the event queue in case the player side closes or destroys the data channel.
The data channel state switches to ```XR_REMOTING_DATA_CHANNEL_STATUS_CLOSED_MSFT```.
For a closed data channel, the ```XrRemotingDataChannelMSFT``` handle remains valid.

## See Also

* [Holographic Remoting Overview](holographic-remoting-overview.md)
* [Writing a Holographic Remoting remote app using OpenXR APIs](holographic-remoting-create-remote-openxr.md)

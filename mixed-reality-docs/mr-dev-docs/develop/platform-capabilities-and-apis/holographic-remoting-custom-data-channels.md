---
title: Custom Holographic Remoting data channels
description: This page explains how custom data channels can be used with the Windows Mixed Reality API to send user data over the already-established Holographic Remoting connection.
author: florianbagarmicrosoft
ms.author: flbagar
ms.date: 12/01/2020
ms.topic: article
keywords: HoloLens, Remoting, Holographic Remoting, mixed reality headset, windows mixed reality headset, virtual reality headset, data channels
---

# Custom Data Channels with Holographic Remoting and the Windows Mixed Reality API

> [!NOTE]
> This guidance is specific to Holographic Remoting on HoloLens 2 and Windows PCs running [Windows Mixed Reality](../../discover/navigating-the-windows-mixed-reality-home.md).

Use custom data channels to send custom data over an established remoting connection.

> [!IMPORTANT]
> Custom data channels require a custom remote app and a custom player app, as it allows for communication between the two custom apps.

> [!TIP]
> A simple ping-pong example can be found in the remote and player samples inside the [Holographic Remoting samples github repository](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples). Uncomment ```#define ENABLE_CUSTOM_DATA_CHANNEL_SAMPLE``` inside the SampleRemoteApp.h / SamplePlayerMain.h files to enable the sample code.


## Create a custom data channel


To create a custom data channel, the following fields are required:
```cpp
std::recursive_mutex m_customDataChannelLock;
winrt::Microsoft::Holographic::AppRemoting::IDataChannel m_customDataChannel = nullptr;
winrt::Microsoft::Holographic::AppRemoting::IDataChannel::OnDataReceived_revoker m_customChannelDataReceivedEventRevoker;
winrt::Microsoft::Holographic::AppRemoting::IDataChannel::OnClosed_revoker m_customChannelClosedEventRevoker;
```

After a connection is successfully established, you can create new data channels from either the remote side, the player side, or both. Both the RemoteContext and the PlayerContext provide a ```CreateDataChannel()``` method for creating data channels. The first parameter is the channel ID, which is used to identify the data channel in later operations. The second parameter is the priority that specifies with which priority data of this channel is transferred to the other side. On the remote side, valid channel IDs range from 0 up to and including 63. On the player side, valid channel IDs are from 64 up to and including 127. Valid priorities are ```Low```, ```Medium```, or ```High```.

To start the creation of a data channel on the **remote** side:
```cpp
// Valid channel ids for channels created on the remote side are 0 up to and including 63
m_remoteContext.CreateDataChannel(0, DataChannelPriority::Low);
```

To start the creation of a data channel on the **player** side:
```cpp
// Valid channel ids for channels created on the player side are 64 up to and including 127
m_playerContext.CreateDataChannel(64, DataChannelPriority::Low);
```

> [!NOTE]
> To create a new custom data channel, only one side (either remote or player) needs to call the ```CreateDataChannel``` method.

## Handling custom data channel events

To establish a custom data channel, the ```OnDataChannelCreated``` event needs to be handled (on both the player and the remote side). It triggers when a user data channel has been created by either side and provides a ```IDataChannel``` object, which can be used to send and receive data over this channel.

To register a listener on the ```OnDataChannelCreated``` event:
```cpp
m_onDataChannelCreatedEventRevoker = m_remoteContext.OnDataChannelCreated(winrt::auto_revoke,
    [this](const IDataChannel& dataChannel, uint8_t channelId)
    {
        std::lock_guard lock(m_customDataChannelLock);
        m_customDataChannel = dataChannel;

        // Register to OnDataReceived and OnClosed event of the data channel here, see below...
    });
```

To get notified when data is received, register to the ```OnDataReceived``` event on the ```IDataChannel``` object provided by the ```OnDataChannelCreated``` handler. Register to the ```OnClosed``` event, to get notified when the data channel has been closed.

```cpp
m_customChannelDataReceivedEventRevoker = m_customDataChannel.OnDataReceived(winrt::auto_revoke, 
    [this]()
    {
        // React on data received via the custom data channel here.
    });

m_customChannelClosedEventRevoker = m_customDataChannel.OnClosed(winrt::auto_revoke,
    [this]()
    {
        // React on data channel closed here.

        std::lock_guard lock(m_customDataChannelLock);
        if (m_customDataChannel)
        {
            m_customDataChannel = nullptr;
        }
    });
```

## Sending data

To send data over a custom data channel, use the ```IDataChannel::SendData()``` method. The first parameter is a ```winrt::array_view<const uint8_t>``` to the data that should be send. The second parameter specifies where the data should be resend, until the other side acknowledge the reception. 

> [!IMPORTANT]
> In case of bad network conditions, the same data packet might arrive more than once. The receiving code must be able to handle this situation.

```cpp
uint8_t data[] = {1};
m_customDataChannel.SendData(data, true);
```

## Closing a custom data channel

To close a custom data channel, use the ```IDataChannel::Close()``` method. Both sides will be notified by the ```OnClosed``` event once the custom data channel has been closed.

```cpp
m_customDataChannel.Close();
```

## See Also
* [Holographic Remoting overview](holographic-remoting-overview.md)
* [Writing a Holographic Remoting remote app using Windows Mixed Reality APIs](holographic-remoting-create-remote-wmr.md)
* [Writing a Holographic Remoting remote app using OpenXR APIs](holographic-remoting-create-remote-openxr.md)
* [Writing a custom Holographic Remoting player app](holographic-remoting-create-player.md)
* [Holographic Remoting troubleshooting and limitations](holographic-remoting-troubleshooting.md)
* [Holographic Remoting software license terms](/legal/mixed-reality/microsoft-holographic-remoting-software-license-terms)
* [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?LinkId=521839)

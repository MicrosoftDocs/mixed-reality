---
title: Writing a Holographic Remoting remote app (OpenXR)
description: Learn how to stream remote content rendered on a remote machine to HoloLens 2 with Holographic Remoting apps with OpenXR. 
author: florianbagarmicrosoft
ms.author: flbagar
ms.date: 12/01/2020
ms.topic: article
keywords: HoloLens, Remoting, Holographic Remoting, mixed reality headset, windows mixed reality headset, virtual reality headset, NuGet
---

# Writing a Holographic Remoting remote app using the OpenXR API

>[!IMPORTANT]
>This document describes the creation of a remote application for HoloLens 2 and Windows Mixed Reality headsets using the [OpenXR API](../native/openxr.md). Remote applications for **HoloLens (1st gen)** must use NuGet package version **1.x.x**. This implies that remote applications written for HoloLens 2 are not compatible with HoloLens 1 and vice versa. The documentation for HoloLens 1 can be found [here](add-holographic-remoting.md).

Holographic Remoting apps can stream remotely rendered content to HoloLens 2 and Windows Mixed Reality immersive headsets. You can also access more system resources and integrate remote [immersive views](../../design/app-views.md) into existing desktop PC software. A remote app receives an input data stream from HoloLens 2, renders content in a virtual immersive view, and streams content frames back to HoloLens 2. The connection is made using standard Wi-Fi. Holographic Remoting is added to a desktop or UWP app via a NuGet packet. Additional code is required which handles the connection and renders in an immersive view. A typical remoting connection will have as low as 50 ms of latency. The player app can report the latency in real time.

All code on this page and working projects can be found in the [Holographic Remoting samples github repository](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples).

## Prerequisites

A good starting point is a working OpenXR based Desktop or UWP app. For details see [Getting started with OpenXR](../native/openxr-getting-started.md).

>[!IMPORTANT]
>Any app using Holographic Remoting should be authored to use a [multi-threaded apartment](/windows/win32/com/multithreaded-apartments). The use of a [single-threaded apartment](/windows/win32/com/single-threaded-apartments) is supported but will lead to sub-optimal performance and possibly stuttering during playback. When using C++/WinRT [winrt::init_apartment](/windows/uwp/cpp-and-winrt-apis/get-started) a multi-threaded apartment is the default.

## Get the Holographic Remoting NuGet package

The following steps are required to add the NuGet package to a project in Visual Studio.
1. Open the project in Visual Studio.
2. Right-click the project node and select **Manage NuGet Packages...**
3. In the panel that appears, select **Browse** and then search for "Holographic Remoting".
4. Select **Microsoft.Holographic.Remoting.OpenXr**, ensure to pick the latest **2.x.x** version and select **Install**.
5. If the **Preview** dialog appears, select **OK**.
6. Select **I Accept** when the license agreement dialog pops up.
7. Repeat the steps 3 to 6 for the following NuGet Packages: OpenXR.Headers, OpenXR.Loader

>[!NOTE]
>Version **1.x.x** of the NuGet package is still available for developers who want to target HoloLens 1. For details see [Add Holographic Remoting (HoloLens (1st gen))](add-holographic-remoting.md).

## Select the Holographic Remoting OpenXR runtime

The first step you need to do in your remote app is to select the Holographic Remoting OpenXR runtime, which is part of the Microsoft.Holographic.Remoting.OpenXr NuGet package. You can do this by setting the ```XR_RUNTIME_JSON``` environment variable to the path of the RemotingXR.json file within your app. This environment variable is used by the OpenXR loader to not use the system default OpenXR runtime but instead redirect to the Holographic Remoting OpenXR runtime. When using the Microsoft.Holographic.Remoting.OpenXr NuGet package the RemotingXR.json file is automatically copied during compilation to the output folder, the OpenXR runtime selection typically looks as follows.

```cpp
bool EnableRemotingXR() {
    wchar_t executablePath[MAX_PATH];
    if (GetModuleFileNameW(NULL, executablePath, ARRAYSIZE(executablePath)) == 0) {
        return false;
    }
    
    std::filesystem::path filename(executablePath);
    filename = filename.replace_filename("RemotingXR.json");

    if (std::filesystem::exists(filename)) {
        SetEnvironmentVariableW(L"XR_RUNTIME_JSON", filename.c_str());
            return true;
        }

    return false;
}
```

## Create XrInstance with Holographic Remoting Extension

The first step a typical OpenXR app is supposed to do is to select OpenXR extensions and create an XrInstance. The OpenXR core specification doesn't provide any remoting specific API. For that reason Holographic Remoting introduces its own OpenXR extension named ```XR_MSFT_holographic_remoting```. Ensure that when you call xrCreateInstance the ```XR_MSFT_HOLOGRAPHIC_REMOTING_EXTENSION_NAME``` is included in the XrInstanceCreateInfo.

>[!TIP]
>By default the rendered content of your app is only streamed to the Holographic Remoting player either running on a HoloLens 2 or on a Windows Mixed Reality headsets. To also display the rendered content on the remote PC, via a swap-chain of a window for instance, Holographic Remoting provides a second OpenXR extension named ```XR_MSFT_holographic_remoting_frame_mirroring```. Ensure to also enable this extension using ```XR_MSFT_HOLOGRAPHIC_REMOTING_FRAME_MIRRORING_EXTENSION_NAME``` in case you want to use that functionality.

>[!IMPORTANT]
>To learn about the Holographic Remoting OpenXR extension API, check out the [specification](https://htmlpreview.github.io/?https://github.com/microsoft/MixedReality-HolographicRemoting-Samples/blob/master/remote_openxr/specification.html) which can be found in the [Holographic Remoting samples github repository](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples).

## Connect to the device

After your remote app has created the XrInstance and queried the XrSystemId via xrGetSystem a connection to the player device can be established.

>[!WARNING]
> The Holographic Remoting OpenXR runtime is only able to provide device specific data such as view configurations or environment blend modes after a connection has been established. ```xrEnumerateViewConfigurations```, ```xrEnumerateViewConfigurationViews```, ```xrGetViewConfigurationProperties```, ```xrEnumerateEnvironmentBlendModes```, and ```xrGetSystemProperties``` will give you default values, matching what you would typically get if you connect to a player running on a HoloLens 2, before being fully connected.
It is strongly recommended to not call these methods before a connection has been established. The suggestion is used these methods after the XrSession has been successfully created and the session state is at least XR_SESSION_STATE_READY.

General properties such as max bitrate, audio enabled, video codec, or depth buffer stream resolution can be configured via ```xrRemotingSetContextPropertiesMSFT``` as follows.

```cpp
XrRemotingRemoteContextPropertiesMSFT contextProperties;
contextProperties = XrRemotingRemoteContextPropertiesMSFT{static_cast<XrStructureType>(XR_TYPE_REMOTING_REMOTE_CONTEXT_PROPERTIES_MSFT)};
contextProperties.enableAudio = false;
contextProperties.maxBitrateKbps = 20000;
contextProperties.videoCodec = XR_REMOTING_VIDEO_CODEC_H265_MSFT;
contextProperties.depthBufferStreamResolution = XR_REMOTING_DEPTH_BUFFER_STREAM_RESOLUTION_HALF_MSFT;
xrRemotingSetContextPropertiesMSFT(m_instance.Get(), m_systemId, &contextProperties);
```

The connection can be done in one of two ways.
1) The remote app connects to the player running on the device.
2) The player running on the device connects to the remote app.

To establish a connection from the remote app to the player device call the ```xrRemotingConnectMSFT``` method specifying the hostname and port via the  ```XrRemotingConnectInfoMSFT``` structure. The port used by the Holographic Remoting Player is **8265**.

```cpp
XrRemotingConnectInfoMSFT connectInfo{static_cast<XrStructureType>(XR_TYPE_REMOTING_CONNECT_INFO_MSFT)};
connectInfo.remoteHostName = "192.168.x.x";
connectInfo.remotePort = 8265;
connectInfo.secureConnection = false;
xrRemotingConnectMSFT(m_instance.Get(), m_systemId, &connectInfo);
```

Listening for incoming connections on the remote app can be done by calling the ```xrRemotingListenMSFT``` method. Both the handshake port and transport port can be specified via the ```XrRemotingListenInfoMSFT``` structure. The handshake port is used for the initial handshake. The data is then sent over the transport port. By default **8265** and **8266** are used.

```cpp
XrRemotingListenInfoMSFT listenInfo{static_cast<XrStructureType>(XR_TYPE_REMOTING_LISTEN_INFO_MSFT)};
listenInfo.listenInterface = "0.0.0.0";
listenInfo.handshakeListenPort = 8265;
listenInfo.transportListenPort = 8266;
listenInfo.secureConnection = false;
xrRemotingListenMSFT(m_instance.Get(), m_systemId, &listenInfo);
```

The connection state must be disconnected when you call ```xrRemotingConnectMSFT``` or ```xrRemotingListenMSFT```. You can get the connection state at any point after you have created an XrInstance and queried for the XrSystemId via ```xrRemotingGetConnectionStateMSFT```.

```cpp
XrRemotingConnectionStateMSFT connectionState;
xrRemotingGetConnectionStateMSFT(m_instance.Get(), m_systemId, &connectionState, nullptr);
```

Available connection states are:
- XR_REMOTING_CONNECTION_STATE_DISCONNECTED_MSFT
- XR_REMOTING_CONNECTION_STATE_CONNECTING_MSFT
- XR_REMOTING_CONNECTION_STATE_CONNECTED_MSFT

>[!IMPORTANT]
> ```xrRemotingConnectMSFT``` or ```xrRemotingListenMSFT``` must be called before trying to create a XrSession via xrCreateSession. If you try to create a XrSession while the connection state is ```XR_REMOTING_CONNECTION_STATE_DISCONNECTED_MSFT``` the session creation will succeed but the session state will immediately transition to XR_SESSION_STATE_LOSS_PENDING.

Holographic Remoting's implementation of ```xrCreateSession``` supports waiting for a connection to be established. You can call ```xrRemotingConnectMSFT``` or ```xrRemotingListenMSFT``` immediately followed by a call to, which will block and wait for a connection to be established. The timeout is fixed to 10 seconds. If a connection can be established within this time the XrSession creation will succeed and the session state will transition to XR_SESSION_STATE_READY. In case no connection can be established the session creation also succeeds but immediately transitions to XR_SESSION_STATE_LOSS_PENDING.

In general, the connection state is couple with the XrSession state. Any change to the connection state also affects the session state. For instance, if the connection state switches from `XR_REMOTING_CONNECTION_STATE_CONNECTED_MSFT` to ```XR_REMOTING_CONNECTION_STATE_DISCONNECTED_MSFT``` the session state will transition to XR_SESSION_STATE_LOSS_PENDING as well.

## Handling Remoting specific events

The Holographic Remoting OpenXR runtime exposes three events, which are important to monitor the state of a connection.
1) ```XR_TYPE_REMOTING_EVENT_DATA_CONNECTED_MSFT```: Triggered when a connection to the device has been successfully established.
2) ```XR_TYPE_REMOTING_EVENT_DATA_DISCONNECTED_MSFT```: Triggered if an established connection is closed or a connection couldn't be established.
3) ```XR_TYPE_REMOTING_EVENT_DATA_LISTENING_MSFT```: When listening for incoming connections starts.

These events are placed in a queue and your remote app must read from the queue with regularity via ```xrPollEvent```.

```cpp
auto pollEvent = [&](XrEventDataBuffer& eventData) -> bool {
	eventData.type = XR_TYPE_EVENT_DATA_BUFFER;
	eventData.next = nullptr;
	return CHECK_XRCMD(xrPollEvent(m_instance.Get(), &eventData)) == XR_SUCCESS;
};

XrEventDataBuffer eventData{};
while (pollEvent(eventData)) {
	switch (eventData.type) {
	
	...
	
	case XR_TYPE_REMOTING_EVENT_DATA_LISTENING_MSFT: {
		DEBUG_PRINT("Holographic Remoting: Listening on port %d",
					reinterpret_cast<const XrRemotingEventDataListeningMSFT*>(&eventData)->listeningPort);
		break;
	}
	case XR_TYPE_REMOTING_EVENT_DATA_CONNECTED_MSFT: {
		DEBUG_PRINT("Holographic Remoting: Connected.");
		break;
	}
	case XR_TYPE_REMOTING_EVENT_DATA_DISCONNECTED_MSFT: {
		DEBUG_PRINT("Holographic Remoting: Disconnected - Reason: %d",
					reinterpret_cast<const XrRemotingEventDataDisconnectedMSFT*>(&eventData)->disconnectReason);
		break;
	}
}
```

## Preview streamed content locally

To display the same content in the remote app that is sent to the device the ```XR_MSFT_holographic_remoting_frame_mirroring``` extension can be used. With this extension, you can submit a texture to xrEndFrame by using the ```XrRemotingFrameMirrorImageInfoMSFT``` that isn't chained to the XrFrameEndInfo as follows.

```cpp
XrFrameEndInfo frameEndInfo{XR_TYPE_FRAME_END_INFO};
...

XrRemotingFrameMirrorImageD3D11MSFT mirrorImageD3D11{
    static_cast<XrStructureType>(XR_TYPE_REMOTING_FRAME_MIRROR_IMAGE_D3D11_MSFT)};
mirrorImageD3D11.texture = m_window->GetNextSwapchainTexture();

XrRemotingFrameMirrorImageInfoMSFT mirrorImageEndInfo{
    static_cast<XrStructureType>(XR_TYPE_REMOTING_FRAME_MIRROR_IMAGE_INFO_MSFT)};
mirrorImageEndInfo.image = reinterpret_cast<const XrRemotingFrameMirrorImageBaseHeaderMSFT*>(&mirrorImageD3D11);

frameEndInfo.next = &mirrorImageEndInfo;

xrEndFrame(m_session.Get(), &frameEndInfo);

m_window->PresentSwapchain();
```

The example above uses a DX11 swap-chain texture and presents the window immediately after the call to xrEndFrame. The usage isn't restricted to swap-chain textures and no additional GPU synchronization is required. For details on usage and constraints check out the [extension specification](https://htmlpreview.github.io/?https://github.com/microsoft/MixedReality-HolographicRemoting-Samples/blob/master/remote_openxr/specification.html#XR_MSFT_remoting_frame_mirroring).
If your remote app is using DX12 use XrRemotingFrameMirrorImageD3D12MSFT instead of XrRemotingFrameMirrorImageD3D11MSFT.

## See Also
* [Holographic Remoting overview](holographic-remoting-overview.md)
* [Writing a custom Holographic Remoting player app](holographic-remoting-create-player.md)
* [Establishing a secure connection with Holographic Remoting](holographic-remoting-secure-connection.md)
* [Holographic Remoting troubleshooting and limitations](holographic-remoting-troubleshooting.md)
* [Holographic Remoting software license terms](/legal/mixed-reality/microsoft-holographic-remoting-software-license-terms)
* [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?LinkId=521839)
---
title: Writing a custom Holographic Remoting player
description: By creating a custom Holographic Remoting player app you can create an custom application capable of displaying content rendered on a remote machine to your HoloLens 2. This article describes how this can be achieved.
author: NPohl-MSFT
ms.author: nopohl
ms.date: 08/01/2019
ms.topic: article
keywords: HoloLens, Remoting, Holographic Remoting
---

# Writing a custom Holographic Remoting player app

>[!IMPORTANT]
>This document describes the creation of a custom player application for HoloLens 2. Custom players written for HoloLens 2 are not compatible with host applications written for HoloLens 1. This implies that both applications must use NuGet package version **2.x.x**.

By creating a custom Holographic Remoting player app you can create a custom application capable of displaying [immersive views](app-views.md) from on a remote machine on your HoloLens 2. This article describes how this can be achieved. All code on this page and working projects can be found in the [Holographic Remoting samples github repository](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples).

A Holographic Remoting player allows your app to display holographic content [rendered](rendering.md) on a desktop PC or on a UWP device such as the Xbox One, allowing access to more system resources. A Holographic Remoting player app streams input data to a Holographic Remoting host application and receives back an immersive view as video and audio stream. The connection is made using standard Wi-Fi. To create a player app, you will use a NuGet package to add Holographic Remoting to your UWP app, and write code to handle the connection and to display an immersive view. 

## Prerequisites

A good starting point is a working DirectX based UWP app that already targets the Windows Mixed Reality API. For details see [DirectX development overview](directx-development-overview.md). If you do not have an existing app and want to start from scratch the [C++ holographic project template](creating-a-holographic-directx-project.md) is a good starting point.

>[!IMPORTANT]
>Any app using Holographic Remoting should be authored to use a [multi-threaded apartment](https://docs.microsoft.com/en-us/windows/win32/com/multithreaded-apartments). The use of a [single-threaded appartment](https://docs.microsoft.com/en-us/windows/win32/com/single-threaded-apartments) is supported but will lead to sub-optimal performance and possibly stuttering during playback. When using C++/WinRT [winrt::init_apartment](https://docs.microsoft.com/en-us/windows/uwp/cpp-and-winrt-apis/get-started) a multi-threaded apartment is the default.

## Get the Holographic Remoting NuGet package

The following steps are required to add the NuGet package to a project in Visual Studio.
1. Open the project in Visual Studio.
2. Right-click the project node and select **Manage NuGet Packages...**
3. In the panel that appears, click **Browse** and then search for "Holographic Remoting".
4. Select **Microsoft.Holographic.Remoting**, ensure to pick the latest **2.x.x** version and click **Install**.
5. If the **Preview** dialog appears, click **OK**.
6. The next dialog that appears is the license agreement. Click on **I Accept** to accept the license agreement.

>[!IMPORTANT]
><a name="idl"></a>The ```build\native\include\HolographicAppRemoting\Microsoft.Holographic.AppRemoting.idl``` inside the NuGet package contains detailed documentation for the API exposed by Holographic Remoting.

## Modify the Package.appxmanifest of the application

To make the application aware of the Microsoft.Holographic.AppRemoting.dll added by the NuGet package, the following steps need to be taken on the project:

1. In the Solution Explorer right-click on the **Package.appxmanifest** file and select **Open With...**
2. Select **XML (Text) Editor** and click OK
3. Add the following lines to the file and save
```xml
  </Capabilities>

  <!--Add lines below -->
  <Extensions>
    <Extension Category="windows.activatableClass.inProcessServer">
      <InProcessServer>
        <Path>Microsoft.Holographic.AppRemoting.dll</Path>
        <ActivatableClass ActivatableClassId="Microsoft.Holographic.AppRemoting.PlayerContext" ThreadingModel="both" />
      </InProcessServer>
    </Extension>
  </Extensions>
  <!--Add lines above -->

</Package>
```
## Create the player context

As a first step the application should create a player context.

```cpp
// class declaration:

#include <winrt/Microsoft.Holographic.AppRemoting.h>

...

private:
// PlayerContext used to connect with a Holographic Remoting host and display remotely rendered frames
winrt::Microsoft::Holographic::AppRemoting::PlayerContext m_playerContext = nullptr;
```


```cpp
// class implementation:

// Create the player context
// IMPORTANT: This must be done before creating the HolographicSpace (or any other call to the Holographic API).
m_playerContext = winrt::Microsoft::Holographic::AppRemoting::PlayerContext::Create();

```

>[!WARNING]
>Holographic Remoting works by replacing the Windows Mixed Reality runtime which is part of Windows with a remoting specific runtime. This is done during the creation of the player context. For that reason any call on any Windows Mixed Reality API before creating the player context can result in unexpected behavior. The recommended approach is to create the player context as early as possible before interaction with any Mixed Reality API. Never mix objects created or retrieved through any Windows Mixed Reality API before the call to ```PlayerContext::Create()``` with objects created or retrieved afterwards.

Next the HolographicSpace can be created, by calling [HolographicSpace.CreateForCoreWindow](https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographicspace.createforcorewindow).

```cpp
m_holographicSpace = winrt::Windows::Graphics::Holographic::HolographicSpace::CreateForCoreWindow(window);
```

## Connect to the host

Once the player app is ready for rendering content a connection to the host can be established.

The connection can be established in one of the follwing ways:
1) The player app running on HoloLens 2 connects to the host app.
2) The host app connects to the player app running on HoloLens 2.

To connect from the player app to the host call the ```Connect``` method on the player context specifying the hostname and port. The default port is **8265**.

```cpp
try
{
    m_playerContext.Connect(m_hostname, m_port);
}
catch(winrt::hresult_error& e)
{
    // Failed to connect. Get an error details via e.code() and e.message()
}
```

>[!IMPORTANT]
>As with any C++/WinRT API ```Connect``` might throw an winrt::hresult_error which needs to be handled.

Listening for incoming connections on the player app can be done by calling the ```Listen``` method. Both the handshake port and transport port can be specified during this call. The handshake port is used for the initial handshake. The data is then send over the transport port. By default port number **8265** and **8266** are used.

```cpp
try
{
    m_playerContext.Listen(L"0.0.0.0", m_port, m_port + 1);
}
catch(winrt::hresult_error& e)
{
    // Failed to listen. Get an error details via e.code() and e.message()
}
```


## Handling connection related events

The ```PlayerContext``` exposes three events to monitor the state of the connection
1) OnConnected: Triggered when a connection to the host has been successfully established.
```cpp
m_onConnectedEventToken = m_playerContext.OnConnected([]() 
{
    // Handle connection successfully established
});
```
2) OnDisconnected: Triggered if an established connection is terminated or a connection could not be established.
```cpp
m_onDisconnectedEventToken = m_playerContext.OnDisconnected([](ConnectionFailureReason failureReason)
{
    switch (failureReason)
    {
        // Handle connection failed or terminated.
        // See ConnectionFailureReason for possible reasons.
    }
}
```
>[!NOTE]
>Possible ```ConnectionFailureReason``` values are documented in the ```Microsoft.Holographic.AppRemoting.idl``` [file](#idl).

3) OnListening: When listening for incoming connections starts.
```cpp
m_onListeningEventToken = m_playerContext.OnListening([]()
{
    // Handle start listening for incoming connections
});
```

Additionally the connection state can be queried using the ```ConnectionState``` property on the player context.
```cpp
winrt::Microsoft::Holographic::AppRemoting::ConnectionState state = m_playerContext.ConnectionState();
```

## Display the remotely rendered frame

To display the remotely rendered content, call ```PlayerContext::BlitRemoteFrame()``` while rendering a [HolographicFrame](https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographicframe). 

```BlitRemoteFrame()``` requires that the back buffer for the current HolographicFrame is bound as render target. The back buffer can be received from the [HolographicCameraRenderingParameters](https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographicframe.getrenderingparameters) via the [Direct3D11BackBuffer](https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.direct3d11backbuffer) property.

When called, ```BlitRemoteFrame()``` copies the latest received frame from the host application into the BackBuffer of the HolographicFrame. Additionally the focus point set is set, if the remote application has specified a focus point during the rendering of the remote frame.

```cpp
// Blit the remote frame into the backbuffer for the HolographicFrame.
winrt::Microsoft::Holographic::AppRemoting::BlitResult result = m_playerContext.BlitRemoteFrame();
```

>[!NOTE]
>```PlayerContext::BlitRemoteFrame()``` potentially overwrites the focus point for the current frame. 
>- To specifiy a fallback focus point, call [HolographicCameraRenderingParameters::SetFocusPoint](https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.setfocuspoint) before ```PlayerContext::BlitRemoteFrame()```. 
>- To overrwrite the remote focus point, call [HolographicCameraRenderingParameters::SetFocusPoint](https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.setfocuspoint)  after ```PlayerContext::BlitRemoteFrame()```.

On success, ```BlitRemoteFrame()``` returns ```BlitResult::Success_Color```. Otherwise it returns the failure reason:
- ```BlitResult::Failed_NoRemoteFrameAvailable```: Failed because no remote frame is available.
- ```BlitResult::Failed_NoCamera```: Failed because no camera present.

## Optional: Get statistics about the last remote frame

To diagnose performance or network issues, statistics about the last remote frame can be retrieved via the ```PlayerContext::LastFrameStatistics``` property. Statistics are updated during the call to [HolographicFrame::PresentUsingCurrentPrediction](https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographicframe.presentusingcurrentprediction).

```cpp
// Get statistics for the last presented frame.
winrt::Microsoft::Holographic::AppRemoting::PlayerFrameStatistics statistics = m_playerContext.LastFrameStatistics();
```

For more details, see the ```PlayerFrameStatistics``` documentation in the ```Microsoft.Holographic.AppRemoting.idl``` [file](#idl).

## Optional: Custom data channels

Custom data channels can be used to send user data over the already established remoting connection. See [custom data channels](holographic-remoting-custom-data-channels.md) for more information.

## See Also
* [Writing a Holographic Remoting host app](holographic-remoting-create-host.md)
* [Custom Holographic Remoting data channels](holographic-remoting-custom-data-channels.md)
* [Establishing a secure connection with Holographic Remoting](holographic-remoting-secure-connection.md)
* [Holographic Remoting troubleshooting and limitations](holographic-remoting-troubleshooting.md)
* [Holographic Remoting software license terms](https://docs.microsoft.com/en-us/legal/mixed-reality/microsoft-holographic-remoting-software-license-terms)
* [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?LinkId=521839)
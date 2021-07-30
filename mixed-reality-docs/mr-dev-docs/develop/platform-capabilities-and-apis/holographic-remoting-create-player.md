---
title: Writing a custom Holographic Remoting player (C++)
description: Create a custom Hologaphic Remoting app to display content rendered on a remote machine to your HoloLens 2. 
author: florianbagarmicrosoft
ms.author: v-vtieto
ms.date: 07/30/21
ms.topic: article
keywords: HoloLens, Remoting, Holographic Remoting, NuGet, app manifest, player context, remote app, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Writing a custom Holographic Remoting player app (C++)

>[!IMPORTANT]
>This document describes the creation of a custom player application for HoloLens 2. Custom players written for HoloLens 2 are not compatible with remote applications written for HoloLens 1. This implies that both applications must use NuGet package version **2.x.x**.

By creating a custom Holographic Remoting player app, you can create a custom application capable of displaying [immersive views](../../design/app-views.md) from on a remote machine on your HoloLens 2. All code on this page and working projects can be found in the [Holographic Remoting samples github repository](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples).

A Holographic Remoting player lets your app display holographic content [rendered](rendering.md) on a desktop PC or UWP device like the Xbox One with access to more system resources. A Holographic Remoting player app streams input data to a Holographic Remoting remote application and receives back an immersive view as video and audio stream. The connection is made using standard Wi-Fi. To create a player app, use a NuGet package to add Holographic Remoting to your UWP app. Then write code to handle the connection and to display an immersive view. 

## Prerequisites

A good starting point is a working DirectX based UWP app that already targets the Windows Mixed Reality API. For details see [DirectX development overview](../native/directx-development-overview.md). If you don't have an existing app and want to start from scratch the [C++ holographic project template](../native/creating-a-holographic-directx-project.md) is a good starting point.

>[!IMPORTANT]
>Any app using Holographic Remoting should be authored to use a [multi-threaded apartment](/windows/win32/com/multithreaded-apartments). The use of a [single-threaded apartment](/windows/win32/com/single-threaded-apartments) is supported but will lead to sub-optimal performance and possibly stuttering during playback. When using C++/WinRT [winrt::init_apartment](/windows/uwp/cpp-and-winrt-apis/get-started) a multi-threaded apartment is the default.

## Get the Holographic Remoting NuGet package

The following steps are required to add the NuGet package to a project in Visual Studio.
1. Open the project in Visual Studio.
2. Right-click the project node and select **Manage NuGet Packages...**
3. In the panel that appears, select **Browse** and then search for "Holographic Remoting".
4. Select **Microsoft.Holographic.Remoting**, ensure to pick the latest **2.x.x** version and select **Install**.
5. If the **Preview** dialog appears, select **OK**.
6. Select **I Accept** when the license agreement dialog appears.

>[!IMPORTANT]
><a name="idl"></a>The ```build\native\include\HolographicAppRemoting\Microsoft.Holographic.AppRemoting.idl``` inside the NuGet package contains detailed documentation for the API exposed by Holographic Remoting.

## Modify the Package.appxmanifest of the application

To make the application aware of the Microsoft.Holographic.AppRemoting.dll added by the NuGet package, the following steps need to be taken on the project:

1. In the Solution Explorer right-click on the **Package.appxmanifest** file and select **Open With...**
2. Select **XML (Text) Editor** and select **OK**
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
// PlayerContext used to connect with a Holographic Remoting remote app and display remotely rendered frames
winrt::Microsoft::Holographic::AppRemoting::PlayerContext m_playerContext = nullptr;
```


```cpp
// class implementation:

// Create the player context
// IMPORTANT: This must be done before creating the HolographicSpace (or any other call to the Holographic API).
m_playerContext = winrt::Microsoft::Holographic::AppRemoting::PlayerContext::Create();

```

>[!WARNING]
>Holographic Remoting works by replacing the Windows Mixed Reality runtime which is part of Windows with a remoting specific runtime. This is done during the creation of the player context. For that reason any call on any Windows Mixed Reality API before creating the player context can result in unexpected behavior. The recommended approach is to create the player context as early as possible before interaction with any Mixed Reality API. Never mix objects created or retrieved through any Windows Mixed Reality API before the call to ```PlayerContext::Create``` with objects created or retrieved afterwards.

Next the HolographicSpace can be created, by calling [HolographicSpace.CreateForCoreWindow](/uwp/api/windows.graphics.holographic.holographicspace.createforcorewindow).

```cpp
m_holographicSpace = winrt::Windows::Graphics::Holographic::HolographicSpace::CreateForCoreWindow(window);
```

## Connect to the remote app

Once the player app is ready for rendering content a connection to the remote app can be established.

The connection can be established in one of the following ways:
1) The player app running on HoloLens 2 connects to the remote app.
2) The remote app connects to the player app running on HoloLens 2.

To connect from the player app to the remote app call the ```Connect``` method on the player context specifying the hostname and port. The default port is **8265**.

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

Listening for incoming connections on the player app can be done by calling the ```Listen``` method. Both the handshake port and transport port can be specified during this call. The handshake port is used for the initial handshake. The data is then sent over the transport port. By default port number **8265** and **8266** are used.

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


## Handling connection-related events

The ```PlayerContext``` exposes three events to monitor the state of the connection
1) OnConnected: Triggered when a connection to the remote app has been successfully established.
```cpp
m_onConnectedEventToken = m_playerContext.OnConnected([]() 
{
    // Handle connection successfully established
});
```
2) OnDisconnected: Triggered if an established connection is terminated or a connection couldn't be established.
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

To display the remotely rendered content, call ```PlayerContext::BlitRemoteFrame``` while rendering a [HolographicFrame](/uwp/api/windows.graphics.holographic.holographicframe). 

```BlitRemoteFrame``` requires that the back buffer for the current HolographicFrame is bound as render target. The back buffer can be received from the [HolographicCameraRenderingParameters](/uwp/api/windows.graphics.holographic.holographicframe.getrenderingparameters) via the [Direct3D11BackBuffer](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.direct3d11backbuffer) property.

When called, ```BlitRemoteFrame``` copies the latest received frame from the remote application into the BackBuffer of the HolographicFrame. Additionally the focus point set is set, if the remote application has specified a focus point during the rendering of the remote frame.

```cpp
// Blit the remote frame into the backbuffer for the HolographicFrame.
winrt::Microsoft::Holographic::AppRemoting::BlitResult result = m_playerContext.BlitRemoteFrame();
```

>[!NOTE]
>```PlayerContext::BlitRemoteFrame``` potentially overwrites the focus point for the current frame. 
>- To specify a fallback focus point, call [HolographicCameraRenderingParameters::SetFocusPoint](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.setfocuspoint) before ```PlayerContext::BlitRemoteFrame```. 
>- To overwrite the remote focus point, call [HolographicCameraRenderingParameters::SetFocusPoint](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.setfocuspoint)  after ```PlayerContext::BlitRemoteFrame```.

On success, ```BlitRemoteFrame``` returns ```BlitResult::Success_Color```. Otherwise it returns the failure reason:
- ```BlitResult::Failed_NoRemoteFrameAvailable```: Failed because no remote frame is available.
- ```BlitResult::Failed_NoCamera```: Failed because no camera present.
- ```BlitResult::Failed_RemoteFrameTooOld```: Failed because remote frame is too old (see PlayerContext::BlitRemoteFrameTimeout property).

>[!IMPORTANT]
> Starting with version [2.1.0](holographic-remoting-version-history.md#v2.1.0) it is possible with a custom player to use depth reprojection via Holographic Remoting.

```BlitResult``` can also return ```BlitResult::Success_Color_Depth``` under the following conditions:

- The remote app has committed a depth buffer via [HolographicCameraRenderingParameters.CommitDirect3D11DepthBuffer](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.commitdirect3d11depthbuffer#Windows_Graphics_Holographic_HolographicCameraRenderingParameters_CommitDirect3D11DepthBuffer_Windows_Graphics_DirectX_Direct3D11_IDirect3DSurface_).
- The custom player app has bound a valid depth buffer before calling ```BlitRemoteFrame```.

If these conditions are met ```BlitRemoteFrame``` will blit the remote depth into the currently bound local depth buffer. You can then render additional local content, which will have depth intersection with the remote rendered content. Additionally you can commit the local depth buffer via [HolographicCameraRenderingParameters.CommitDirect3D11DepthBuffer](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.commitdirect3d11depthbuffer#Windows_Graphics_Holographic_HolographicCameraRenderingParameters_CommitDirect3D11DepthBuffer_Windows_Graphics_DirectX_Direct3D11_IDirect3DSurface_) in your custom player to have depth reprojection for remote and local rendered content. See [Depth Reprojection](hologram-stability.md#reprojection) for details.

### Projection Transform Mode

One problem, which surfaces when using depth reprojection via Holographic Remoting is that the remote content can be rendered with a different projection transform than local content directly rendered by your custom player app. A common use-case is to specify different values for near and far plane (via [HolographicCamera::SetNearPlaneDistance](/uwp/api/windows.graphics.holographic.holographiccamera.setnearplanedistance) and [HolographicCamera::SetFarPlaneDistance](/uwp/api/windows.graphics.holographic.holographiccamera.setfarplanedistance)) on the player side and the remote side. In this case, it's not clear if the projection transform on the player side should reflect the remote near/far plane distances or the local ones.

Starting with version [2.1.0](holographic-remoting-version-history.md#v2.1.0) you can control the projection transform mode via ```PlayerContext::ProjectionTransformConfig```. Supported values are:

- ```Local``` - [HolographicCameraPose::ProjectionTransform](/uwp/api/windows.graphics.holographic.holographiccamerapose.projectiontransform) returns a projection transform, which reflects the near/far plane distances set by your custom player app on the HolographicCamera.
- ```Remote``` - Projection transform reflects the near/far plane distances specified by the remote app.
- ```Merged``` - Near/Far plane distances from your remote app and your custom player app are merged. By default this is done by taking the minimum of the near plane distances and the maximum of the far plane distances. In case either the remote or local side are inverted, say far < near, the remote near/far plane distances are flipped.

## Optional: Set BlitRemoteFrameTimeout <a name="BlitRemoteFrameTimeout"></a>
>[!IMPORTANT]
> ```PlayerContext::BlitRemoteFrameTimeout``` is supported starting with version [2.0.9](holographic-remoting-version-history.md#v2.0.9). 

The ```PlayerContext::BlitRemoteFrameTimeout``` property specifies the amount of time a remote frame is reused if no new remote frame is received. 

A common use-case is to enable the BlitRemoteFrame timeout to display a blank screen if no new frames are received for a certain amount of time. When enabled the return type of the ```BlitRemoteFrame``` method can also be used to switch to a locally rendered fallback content. 

To enable the timeout, set the property value to a duration equal or greater than 100 ms. To disable the timeout, set the property to zero duration. If the timeout is enabled and no remote frame is received for the set duration, BlitRemoteFrame will fail and return ```Failed_RemoteFrameTooOld``` until a new remote frame is received.

```cpp
using namespace std::chrono_literals;

// Set the BlitRemoteFrame timeout to 0.5s
m_playerContext.BlitRemoteFrameTimeout(500ms);
```

## Optional: Get statistics about the last remote frame

To diagnose performance or network issues, statistics about the last remote frame can be retrieved via the ```PlayerContext::LastFrameStatistics``` property. Statistics are updated during the call to [HolographicFrame::PresentUsingCurrentPrediction](/uwp/api/windows.graphics.holographic.holographicframe.presentusingcurrentprediction).

```cpp
// Get statistics for the last presented frame.
winrt::Microsoft::Holographic::AppRemoting::PlayerFrameStatistics statistics = m_playerContext.LastFrameStatistics();
```

For more information, see the ```PlayerFrameStatistics``` documentation in the ```Microsoft.Holographic.AppRemoting.idl``` [file](#idl).

## Optional: Custom data channels

Custom data channels can be used to send user data over the already established remoting connection. See [custom data channels](holographic-remoting-custom-data-channels.md) for more information.

## See Also
* [Holographic Remoting overview](holographic-remoting-overview.md)
* [Writing a Holographic Remoting remote app using Windows Mixed Reality APIs](holographic-remoting-create-remote-wmr.md)
* [Writing a Holographic Remoting remote app using OpenXR APIs](holographic-remoting-create-remote-openxr.md)
* [Custom Holographic Remoting data channels](holographic-remoting-custom-data-channels.md)
* [Establishing a secure connection with Holographic Remoting](holographic-remoting-secure-connection.md)
* [Holographic Remoting troubleshooting and limitations](holographic-remoting-troubleshooting.md)
* [Holographic Remoting software license terms](/legal/mixed-reality/microsoft-holographic-remoting-software-license-terms)
* [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?LinkId=521839)
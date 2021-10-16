---
title: Add holographic remoting
description: Learn how to install, configure, and use Holographic Remoting to render holograms to a HoloLens device over the network.
author: florianbagarmicrosoft
ms.author: v-vtieto
ms.date: 9/3/2021
ms.topic: article
keywords: Windows Mixed Reality, holograms, holographic remoting, remote rendering, network rendering, HoloLens, remote holograms, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Add Holographic Remoting (HoloLens (first gen))

If you're new to Holographic Remoting, you may want to [read our overview].

>[!IMPORTANT]
> This document describes the creation of a host application for HoloLens 1. Host application for **HoloLens (1st gen)** must use NuGet package version **1.x.x**. This implies that host applications written for HoloLens 1 are not compatible with HoloLens 2 and vice versa.

## HoloLens 2

HoloLens developers using Holographic Remoting will need to update their apps to make them compatible with HoloLens 2. This requires a new version of the Holographic Remoting NuGet package. Be sure to use version 2.0.0.0 or above of the Holographic Remoting NuGet package when connecting to the Holographic Remoting Player on HoloLens 2 or the connection will fail.

>[!NOTE]
> Guidance specific to HoloLens 2 can be found [here](holographic-remoting-create-remote-wmr.md).


## Add holographic remoting to your desktop or UWP app

This page describes how to add Holographic Remoting to a desktop or UWP app.

Holographic remoting lets your app target a HoloLens with holographic content hosted on a desktop PC or on a UWP device such as the Xbox One. You also have access to more system resources, making it possible to integrate remote [immersive views](../../design/app-views.md) into existing desktop PC software. A remoting host app receives an input data stream from a HoloLens, renders content in a virtual immersive view, and streams content frames back to HoloLens. The connection is made using standard Wi-Fi. To use remoting, use a NuGet package to add holographic remoting to your desktop or UWP app, then write code to handle the connection and render an immersive view. Helper libraries are included in the code sample that simplify the task of handling the device connection.

A typical remoting connection will have as low as 50 ms of latency. The player app can report the latency in real time.

>[!NOTE]
>The code snippets in this article currently demonstrate use of C++/CX rather than C++17-compliant C++/WinRT as used in the [C++ holographic project template](../native/creating-a-holographic-directx-project.md).  The concepts are equivalent for a C++/WinRT project, though you'll need to translate the code.

### Get the remoting NuGet packages

Follow these steps to get the NuGet package for holographic remoting, and add a reference from your project:
1. Go to your project in Visual Studio.
2. Right-click on the project node and select **Manage NuGet Packages...**
3. In the panel that appears, selecct **Browse** and then search for "Holographic Remoting".
4. Select **Microsoft.Holographic.Remoting** and selecct **Install**.
5. If the **Preview** dialog appears, select **OK**.
6. Select **I Accept** when the license agreement dialog appears.

### Create the HolographicStreamerHelpers

First, we need to add an instance of HolographicStreamerHelpers to the class that will handle remoting.

```cpp
#include <HolographicStreamerHelpers.h>

   private:
       Microsoft::Holographic::HolographicStreamerHelpers^ m_streamerHelpers;
```

You'll also need to track connection state. If you want to render the preview, you need to have a texture to copy it to. You also need a few things like a connection state lock, some way of storing the IP address of HoloLens, and so on.

```cpp
private:
       Microsoft::Holographic::HolographicStreamerHelpers^ m_streamerHelpers;

       Microsoft::WRL::Wrappers::SRWLock                   m_connectionStateLock;

       RemotingHostSample::AppView^                        m_appView;
       Platform::String^                                   m_ipAddress;
       Microsoft::Holographic::HolographicStreamerHelpers^ m_streamerHelpers;

       Microsoft::WRL::Wrappers::CriticalSection           m_deviceLock;
       Microsoft::WRL::ComPtr<IDXGISwapChain1>             m_swapChain;
       Microsoft::WRL::ComPtr<ID3D11Texture2D>             m_spTexture;
```

### Initialize HolographicStreamerHelpers and connect to HoloLens

To connect to a HoloLens device, create an instance of HolographicStreamerHelpers and connect to the target IP address. You'll need to set the video frame size to match the HoloLens display width and height, because the Holographic Remoting library expects the encoder and decoder resolutions to match exactly.

```cpp
m_streamerHelpers = ref new HolographicStreamerHelpers();
       m_streamerHelpers->CreateStreamer(m_d3dDevice);

       // We currently need to stream at 720p because that's the resolution of our remote display.
       // There is a check in the holographic streamer that makes sure the remote and local
       // resolutions match. The default streamer resolution is 1080p.
       m_streamerHelpers->SetVideoFrameSize(1280, 720);

       try
       {
           m_streamerHelpers->Connect(m_ipAddress->Data(), 8001);
       }
       catch (Platform::Exception^ ex)
       {
           DebugLog(L"Connect failed with hr = 0x%08X", ex->HResult);
       }
```

The device connection is asynchronous. Your app needs to provide event handlers for connect, disconnect, and frame send events.

The OnConnected event can update the UI, start rendering, and so on. In our desktop code sample, we update the window title with a "connected" message.

```cpp
m_streamerHelpers->OnConnected += ref new ConnectedEvent(
           [this]()
           {
               UpdateWindowTitle();
           });
```

The OnDisconnected event can handle reconnection, UI updates, and so on. In this example, we reconnect if there's a transient failure.

```cpp
Platform::WeakReference streamerHelpersWeakRef = Platform::WeakReference(m_streamerHelpers);
       m_streamerHelpers->OnDisconnected += ref new DisconnectedEvent(
           [this, streamerHelpersWeakRef](_In_ HolographicStreamerConnectionFailureReason failureReason)
           {
               DebugLog(L"Disconnected with reason %d", failureReason);
               UpdateWindowTitle();

               // Reconnect if this is a transient failure.
               if (failureReason == HolographicStreamerConnectionFailureReason::Unreachable ||
                   failureReason == HolographicStreamerConnectionFailureReason::ConnectionLost)
               {
                   DebugLog(L"Reconnecting...");

                   try
                   {
                       auto helpersResolved = streamerHelpersWeakRef.Resolve<HolographicStreamerHelpers>();
                       if (helpersResolved)
                       {
                           helpersResolved->Connect(m_ipAddress->Data(), 8001);
                       }
                       else
                       {
                           DebugLog(L"Failed to reconnect because a disconnect has already occurred.\n");
                       }
                   }
                   catch (Platform::Exception^ ex)
                   {
                       DebugLog(L"Connect failed with hr = 0x%08X", ex->HResult);
                   }
               }
               else
               {
                   DebugLog(L"Disconnected with unrecoverable error, not attempting to reconnect.");
               }
           });
```

When the remoting component is ready to send a frame, your app is provided an opportunity to make a copy of it in the SendFrameEvent. Here, we copy the frame to a swap chain so that we can display it in a preview window.

```cpp
m_streamerHelpers->OnSendFrame += ref new SendFrameEvent(
           [this](_In_ const ComPtr<ID3D11Texture2D>& spTexture, _In_ FrameMetadata metadata)
           {
               if (m_showPreview)
               {
                   ComPtr<ID3D11Device1> spDevice = m_appView->GetDeviceResources()->GetD3DDevice();
                   ComPtr<ID3D11DeviceContext> spContext = m_appView->GetDeviceResources()->GetD3DDeviceContext();

                   ComPtr<ID3D11Texture2D> spBackBuffer;
                   ThrowIfFailed(m_swapChain->GetBuffer(0, IID_PPV_ARGS(&spBackBuffer)));

                   spContext->CopySubresourceRegion(
                       spBackBuffer.Get(), // dest
                       0,                  // dest subresource
                       0, 0, 0,            // dest x, y, z
                       spTexture.Get(),    // source
                       0,                  // source subresource
                       nullptr);           // source box, null means the entire resource

                   DXGI_PRESENT_PARAMETERS parameters = { 0 };
                   ThrowIfFailed(m_swapChain->Present1(1, 0, &parameters));
               }
           });
```

### Render holographic content

To render content using remoting, you set up a virtual IFrameworkView within your desktop or UWP app and process holographic frames from remoting. All of the Windows Holographic APIs are used the same way by this view, but it's set up slightly differently.

Instead of creating them yourself, the holographic space and speech components come from your HolographicRemotingHelpers class:

```cpp
m_appView->Initialize(m_streamerHelpers->HolographicSpace, m_streamerHelpers->RemoteSpeech);
```

Instead of using an update loop in a Run method, you provide tick updates from the main loop of your desktop or UWP app. This allows your desktop or UWP app to remain in control of message processing.

```cpp
void DesktopWindow::Tick()
   {
       auto lock = m_deviceLock.Lock();
       m_appView->Tick();

       // display preview, etc.
   }
```

The holographic app view's Tick() method completes one iteration of the update, draw, present loop.

```cpp
void AppView::Tick()
   {
       if (m_main)
       {
           // When running on Windows Holographic, we can use the holographic rendering system.
           HolographicFrame^ holographicFrame = m_main->Update();

           if (holographicFrame && m_main->Render(holographicFrame))
           {
               // The holographic frame has an API that presents the swap chain for each
               // holographic camera.
               m_deviceResources->Present(holographicFrame);
           }
       }
   }
```

The holographic app view update, render, and present loop are exactly the same as it is when running on HoloLens - except that you have access to a much greater amount of system resources on your desktop PC. You can render many more triangles, have more drawing passes, do more physics, and use x64 processes to load content that requires more than 2 GB of RAM.

### Disconnect and end the remote session

To disconnect - for example, when the user clicks a UI button to disconnect - call Disconnect() on the HolographicStreamerHelpers, and then release the object.

```cpp
void DesktopWindow::DisconnectFromRemoteDevice()
   {
       // Disconnecting from the remote device can change the connection state.
       auto exclusiveLock = m_connectionStateLock.LockExclusive();

       if (m_streamerHelpers != nullptr)
       {
           m_streamerHelpers->Disconnect();

           // Reset state
           m_streamerHelpers = nullptr;
       }
   }
```

## Get the remoting player

The Windows Holographic remoting player is offered in the Windows app store as an endpoint for remoting host apps to connect to. To get the Windows Holographic remoting player, visit the Windows app store from your HoloLens, search for Remoting, and download the app. The remoting player includes a feature to display statistics on-screen, which can be useful when debugging remoting host apps.

## Notes and resources

The holographic app view will need a way to provide your app with the Direct3D device, which must be used to initialize the holographic space. Your app should use this Direct3D device to copy and display the preview frame.

```cpp
internal:
       const std::shared_ptr<DX::DeviceResources>& GetDeviceResources()
       {
           return m_deviceResources;
       }
```

**Code sample:** A complete [Holographic Remoting code sample](https://github.com/Microsoft/HoloLensCompanionKit) is available, which includes a holographic application view that is compatible with remoting and remoting host projects for desktop Win32, UWP DirectX, and UWP with XAML. 

**Debugging note:** The Holographic Remoting library can throw first-chance exceptions. These exceptions may be visible in debugging sessions, depending on the Visual Studio exception settings that are active at the time. These exceptions are caught internally by the Holographic Remoting library and can be ignored.

## See Also
* [Holographic Remoting overview](../advanced-concepts/holographic-remoting-overview.md)
* [Writing a custom Holographic Remoting player app](holographic-remoting-create-player.md)
* [Establishing a secure connection with Holographic Remoting](holographic-remoting-secure-connection.md)
* [Holographic Remoting troubleshooting and limitations](holographic-remoting-troubleshooting.md)
* [Holographic Remoting software license terms](/legal/mixed-reality/microsoft-holographic-remoting-software-license-terms)
* [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?LinkId=521839)
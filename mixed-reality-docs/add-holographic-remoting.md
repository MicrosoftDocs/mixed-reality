---
title: Add holographic remoting
description: Explains how to use Holographic Remoting to render holograms to a HoloLens over the network.
author: MikeRiches
ms.author: mriches
ms.date: 05/24/2019
ms.topic: article
keywords: Windows Mixed Reality, holograms, holographic remoting, remote rendering, network rendering, HoloLens, remote holograms
---



# Add holographic remoting

## HoloLens 2

> [!NOTE]
> More guidance specific to HoloLens 2 [coming soon](index.md#news-and-notes).

HoloLens developers using Holographic Remoting will need to update their apps to make them compatible with HoloLens 2.  This will require a new version of the Holographic Remoting NuGet package that is not publicly available yet.  If an application using the HoloLens NuGet package attempts to connect to the Holographic Remoting Player on HoloLens 2, the connection will fail.  Watch this page for updates once the HoloLens 2 NuGet package is available.

## Add holographic remoting to your desktop or UWP app

This page describes how to add Holographic Remoting to a desktop or UWP app.

Holographic remoting allows your app to target a HoloLens with holographic content hosted on a desktop PC or on a UWP device such as the Xbox One, allowing access to more system resources and making it possible to integrate remote [immersive views](app-views.md) into existing desktop PC software. A remoting host app receives an input data stream from a HoloLens, renders content in a virtual immersive view, and streams content frames back to HoloLens. The connection is made using standard Wi-Fi. To use remoting, you will use a NuGet package to add holographic remoting to your desktop or UWP app, and write code to handle the connection and to render in an immersive view. Helper libraries are included in the code sample that simplify the task of handling the device connection.

A typical remoting connection will have as low as 50 ms of latency. The player app can report the latency in real-time.

>[!NOTE]
>The code snippets in this article currently demonstrate use of C++/CX rather than C++17-compliant C++/WinRT as used in the [C++ holographic project template](creating-a-holographic-directx-project.md).  The concepts are equivalent for a C++/WinRT project, though you will need to translate the code.

### Get the remoting NuGet packages

Follow these steps to get the NuGet package for holographic remoting, and add a reference from your project:
1. Go to your project in Visual Studio.
2. Right-click on the project node and select **Manage NuGet Packages...**
3. In the panel that appears, click **Browse** and then search for "Holographic Remoting".
4. Select **Microsoft.Holographic.Remoting** and click **Install**.
5. If the **Preview** dialog appears, click **OK**.
6. The next dialog that appears is the license agreement. Click on **I Accept** to accept the license agreement.

### Create the HolographicStreamerHelpers

First, we need an instance of HolographicStreamerHelpers. Add this to the class that will be handling remoting.

```
#include <HolographicStreamerHelpers.h>

   private:
       Microsoft::Holographic::HolographicStreamerHelpers^ m_streamerHelpers;
```

You'll also need to track connection state. If you want to render the preview, you need to have a texture to copy it to. You also need a few things like a connection state lock, some way of storing the IP address of HoloLens, and so on.

```
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

To connect to a HoloLens device, create an instance of HolographicStreamerHelpers and connect to the target IP address. You will need to set the video frame size to match the HoloLens display width and height, because the Holographic Remoting library expects the encoder and decoder resolutions to match exactly.

```
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

```
m_streamerHelpers->OnConnected += ref new ConnectedEvent(
           [this]()
           {
               UpdateWindowTitle();
           });
```

The OnDisconnected event can handle reconnection, UI updates, and so on. In this example, we reconnect if there is a transient failure.

```
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

```
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

To render content using remoting, you set up a virtual IFrameworkView within your desktop or UWP app and process holographic frames from remoting. All of the Windows Holographic APIs are uses the same way by this view, but it is set up slightly differently.

Instead of creating them yourself, the holographic space and speech components come from your HolographicRemotingHelpers class:

```
m_appView->Initialize(m_streamerHelpers->HolographicSpace, m_streamerHelpers->RemoteSpeech);
```

Instead of using an update loop inside of a Run method, you provide tick updates from the main loop of your desktop or UWP app. This allows your desktop or UWP app to remain in control of message processing.

```
void DesktopWindow::Tick()
   {
       auto lock = m_deviceLock.Lock();
       m_appView->Tick();

       // display preview, etc.
   }
```

The holographic app view's Tick() method completes one iteration of the update, draw, present loop.

```
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

The holographic app view update, render, and present loop is exactly the same as it is when running on HoloLens - except that you have access to a much greater amount of system resources on your desktop PC. You can render many more triangles, have more drawing passes, do more physics, and use x64 processes to load content that requires more than 2 GB of RAM.

### Disconnect and end the remote session

To disconnect - for example, when the user clicks a UI button to disconnect - call Disconnect() on the HolographicStreamerHelpers, and then release the object.

```
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

```
internal:
       const std::shared_ptr<DX::DeviceResources>& GetDeviceResources()
       {
           return m_deviceResources;
       }
```

**Code sample:** A complete Holographic Remoting code sample is available, which includes a holographic application view that is compatible with remoting and remoting host projects for desktop Win32, UWP DirectX, and UWP with XAML. To get it, go here:
* [Windows Holographic Code Sample for Remoting](https://github.com/Microsoft/HoloLensCompanionKit/)

**Debugging note:** The Holographic Remoting library can throw first-chance exceptions. These exceptions may be visible in debugging sessions, depending on the Visual Studio exception settings that are active at the time. These exceptions are caught internally by the Holographic Remoting library and can be ignored.

---
title: Writing a Holographic Remoting remote app (WMR)
description: Learn how to stream remote content rendered on a remote machine to HoloLens 2 with Holographic Remoting apps with HolographicSpace.  
author: florianbagarmicrosoft
ms.author: flbagar
ms.date: 12/01/2020
ms.topic: article
keywords: HoloLens, Remoting, Holographic Remoting, mixed reality headset, windows mixed reality headset, virtual reality headset, NuGet
---


# Writing a Holographic Remoting remote app using the HolographicSpace API

>[!IMPORTANT]
>This document describes the creation of a remote application for HoloLens 2 using the [HolographicSpace API](../native/getting-a-holographicspace.md). Remote applications for **HoloLens (1st gen)** must use NuGet package version **1.x.x**. This implies that remote applications written for HoloLens 2 are not compatible with HoloLens 1 and vice versa. The documentation for HoloLens 1 can be found [here](add-holographic-remoting.md).

Holographic Remoting apps can stream remotely rendered content to HoloLens 2 and Windows Mixed Reality immersive headsets. You can also access more system resources and integrate remote [immersive views](../../design/app-views.md) into existing desktop PC software. A remote app receives an input data stream from HoloLens 2, renders content in a virtual immersive view, and streams content frames back to HoloLens 2. The connection is made using standard Wi-Fi. Holographic Remoting is added to a desktop or UWP app via a NuGet packet. Additional code is required which handles the connection and renders in an immersive view. A typical remoting connection will have as low as 50 ms of latency. The player app can report the latency in real time.

All code on this page and working projects can be found in the [Holographic Remoting samples github repository](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples).

## Prerequisites

A good starting point is a working DirectX based Desktop or UWP app, which targets the [HolographicSpace API](../native/getting-a-holographicspace.md). For details see [DirectX development overview](../native/directx-development-overview.md). The [C++ holographic project template](../native/creating-a-holographic-directx-project.md) is a good starting point.

>[!IMPORTANT]
>Any app using Holographic Remoting should be authored to use a [multi-threaded apartment](/windows/win32/com/multithreaded-apartments). The use of a [single-threaded apartment](/windows/win32/com/single-threaded-apartments) is supported but will lead to sub-optimal performance and possibly stuttering during playback. When using C++/WinRT [winrt::init_apartment](/windows/uwp/cpp-and-winrt-apis/get-started) a multi-threaded apartment is the default.



## Get the Holographic Remoting NuGet package

The following steps are required to add the NuGet package to a project in Visual Studio.
1. Open the project in Visual Studio.
2. Right-click the project node and select **Manage NuGet Packages...**
3. In the panel that appears, select **Browse** and then search for "Holographic Remoting".
4. Select **Microsoft.Holographic.Remoting**, ensure to pick the latest **2.x.x** version and select **Install**.
5. If the **Preview** dialog appears, select **OK**.
6. Select **I Accept** when the license agreement dialog pops up.

>[!NOTE]
>Version **1.x.x** of the NuGet package is still available for developers who want to target HoloLens 1. For details see [Add Holographic Remoting (HoloLens (1st gen))](add-holographic-remoting.md).

## Create the remote context

As a first step the application should create a remote context.

```cpp
// class declaration
#include <winrt/Microsoft.Holographic.AppRemoting.h>

...

private:
    // RemoteContext used to connect with a Holographic Remoting player and display rendered frames
    winrt::Microsoft::Holographic::AppRemoting::RemoteContext m_remoteContext = nullptr;
```


```cpp
// class implementation
#include <HolographicAppRemoting\Streamer.h>

...

CreateRemoteContext(m_remoteContext, 20000, false, PreferredVideoCodec::Default);

```

>[!WARNING]
>Holographic Remoting works by replacing the Windows Mixed Reality runtime which is part of Windows with a remoting specific runtime. This is done during the creation of the remote context. For that reason any call on any Windows Mixed Reality API before creating the remote context can result in unexpected behavior. The recommended approach is to create the remote context as early as possible before interaction with any Mixed Reality API. Never mix objects created or retrieved through any Windows Mixed Reality API before the call to CreateRemoteContext with objects created or retrieved afterwards.

Next the holographic space needs to be created. Specifying a CoreWindow isn't required. Desktop apps that don't have a CoreWindow can just pass a ```nullptr```.

```cpp
m_holographicSpace = winrt::Windows::Graphics::Holographic::HolographicSpace::CreateForCoreWindow(nullptr);
```

## Connect to the device

When the remote app is ready for rendering content a connection to the player device can be established.

Connection can be done in one of two ways.
1) The remote app connects to the player running on the device.
2) The player running on the device connects to the remote app.

To establish a connection from the remote app to the player device call the ```Connect``` method on the remote context specifying the hostname and port. The port used by the Holographic Remoting Player is **8265**.

```cpp
try
{
    m_remoteContext.Connect(m_hostname, m_port);
}
catch(winrt::hresult_error& e)
{
    DebugLog(L"Connect failed with hr = 0x%08X", e.code());
}
```

>[!IMPORTANT]
>As with any C++/WinRT API ```Connect``` might throw an winrt::hresult_error which needs to be handled.

>[!TIP]
>To avoid using [C++/WinRT](/windows/uwp/cpp-and-winrt-apis/) language projection the file ```build\native\include\<windows sdk version>\abi\Microsoft.Holographic.AppRemoting.h``` located inside the Holographic Remoting NuGet package can be included. It contains declarations of the underlying COM interfaces. The use of C++/WinRT is recommended though.

Listening for incoming connections on the remote app can be done by calling the ```Listen``` method. Both the handshake port and transport port can be specified during this call. The handshake port is used for the initial handshake. The data is then sent over the transport port. By default **8265** and **8266** are used.

```cpp
try
{
    m_remoteContext.Listen(L"0.0.0.0", m_port, m_port + 1);
}
catch(winrt::hresult_error& e)
{
    DebugLog(L"Listen failed with hr = 0x%08X", e.code());
}
```

>[!IMPORTANT]
>The ```build\native\include\HolographicAppRemoting\Microsoft.Holographic.AppRemoting.idl``` inside the NuGet package contains detailed documentation for the API exposed by Holographic Remoting.

## Handling Remoting specific events

The remote context exposes three events, which are important to monitor the state of a connection.
1) OnConnected: Triggered when a connection to the device has been successfully established.
```cpp
winrt::weak_ref<winrt::Microsoft::Holographic::AppRemoting::IRemoteContext> remoteContextWeakRef = m_remoteContext;

m_onConnectedEventRevoker = m_remoteContext.OnConnected(winrt::auto_revoke, [this, remoteContextWeakRef]() {
    if (auto remoteContext = remoteContextWeakRef.get())
    {
        // Update UI state
    }
});
```
2) OnDisconnected: Triggered if an established connection is closed or a connection couldn't be established.
```cpp
m_onDisconnectedEventRevoker =
    m_remoteContext.OnDisconnected(winrt::auto_revoke, [this, remoteContextWeakRef](ConnectionFailureReason failureReason) {
        if (auto remoteContext = remoteContextWeakRef.get())
        {
            DebugLog(L"Disconnected with reason %d", failureReason);
            // Update UI

            // Reconnect if this is a transient failure.
            if (failureReason == ConnectionFailureReason::HandshakeUnreachable ||
                failureReason == ConnectionFailureReason::TransportUnreachable ||
                failureReason == ConnectionFailureReason::ConnectionLost)
            {
                DebugLog(L"Reconnecting...");

                ConnectOrListen();
            }
            // Failure reason None indicates a normal disconnect.
            else if (failureReason != ConnectionFailureReason::None)
            {
                DebugLog(L"Disconnected with unrecoverable error, not attempting to reconnect.");
            }
        }
    });
```
3) OnListening: When listening for incoming connections starts.
```cpp
m_onListeningEventRevoker = m_remoteContext.OnListening(winrt::auto_revoke, [this, remoteContextWeakRef]() {
    if (auto remoteContext = remoteContextWeakRef.get())
    {
        // Update UI state
    }
});
```

Additionally the connection state can be queried using the ```ConnectionState``` property on the remote context.
```cpp
auto connectionState = m_remoteContext.ConnectionState();
```

## Handling speech events

Using the remote speech interface it's possible to register speech triggers with HoloLens 2 and have them remoted to the remote application.

This additional member is required to track the state of the remote speech.

```cpp
winrt::Microsoft::Holographic::AppRemoting::IRemoteSpeech::OnRecognizedSpeech_revoker m_onRecognizedSpeechRevoker;

```

First the remote speech interface needs to be retrieved.

```cpp
if (auto remoteSpeech = m_remoteContext.GetRemoteSpeech())
{
    InitializeSpeechAsync(remoteSpeech, m_onRecognizedSpeechRevoker, weak_from_this());
}
```

Using an asynchronous helper method you can then initialize the remote speech. This should be done asynchronously as initializing might take a considerable amount of time. [Concurrency and asynchronous operations with C++/WinRT](/windows/uwp/cpp-and-winrt-apis/concurrency) explains how to author asynchronous functions with C++/WinRT.

```cpp
winrt::Windows::Foundation::IAsyncOperation<winrt::Windows::Storage::StorageFile> LoadGrammarFileAsync()
{
    const wchar_t* speechGrammarFile = L"SpeechGrammar.xml";
    auto rootFolder = winrt::Windows::ApplicationModel::Package::Current().InstalledLocation();
    return rootFolder.GetFileAsync(speechGrammarFile);
}

winrt::fire_and_forget InitializeSpeechAsync(
    winrt::Microsoft::Holographic::AppRemoting::IRemoteSpeech remoteSpeech,
    winrt::Microsoft::Holographic::AppRemoting::IRemoteSpeech::OnRecognizedSpeech_revoker& onRecognizedSpeechRevoker,
    std::weak_ptr<SampleRemoteMain> sampleRemoteMainWeak)
{
    onRecognizedSpeechRevoker = remoteSpeech.OnRecognizedSpeech(
        winrt::auto_revoke, [sampleRemoteMainWeak](const winrt::Microsoft::Holographic::AppRemoting::RecognizedSpeech& recognizedSpeech) {
            if (auto sampleRemoteMain = sampleRemoteMainWeak.lock())
            {
                sampleRemoteMain->OnRecognizedSpeech(recognizedSpeech.RecognizedText);
            }
        });

    auto grammarFile = co_await LoadGrammarFileAsync();

    std::vector<winrt::hstring> dictionary;
    dictionary.push_back(L"Red");
    dictionary.push_back(L"Blue");
    dictionary.push_back(L"Green");
    dictionary.push_back(L"Default");
    dictionary.push_back(L"Aquamarine");

    remoteSpeech.ApplyParameters(L"", grammarFile, dictionary);
}
```

There are two ways of specifying phrases to be recognized.
1) Specification inside a speech grammar xml file. See [How to create a basic XML Grammar](/previous-versions/office/developer/speech-technologies/hh361658(v=office.14)) for details.
2) Specify by passing them inside the dictionary vector to ```ApplyParameters```.

Inside the OnRecognizedSpeech callback, the speech events can then be processed:

```cpp
void SampleRemoteMain::OnRecognizedSpeech(const winrt::hstring& recognizedText)
{
    bool changedColor = false;
    DirectX::XMFLOAT4 color = {1, 1, 1, 1};

    if (recognizedText == L"Red")
    {
        color = {1, 0, 0, 1};
        changedColor = true;
    }
    else if (recognizedText == L"Blue")
    {
        color = {0, 0, 1, 1};
        changedColor = true;
    }
    else if (recognizedText == L"Green")
    {
        ...
    }

    ...
}
```

## Preview streamed content locally

To display the same content in the remote app that is sent to the device the ```OnSendFrame``` event of the remote context can be used. The ```OnSendFrame``` event is triggered every time the Holographic Remoting library sends the current frame to the remote device. This is the ideal time to take the content and also blit it into the desktop or UWP window.

```cpp
#include <windows.graphics.directx.direct3d11.interop.h>

...

m_onSendFrameEventRevoker = m_remoteContext.OnSendFrame(
    winrt::auto_revoke, [this](const winrt::Windows::Graphics::DirectX::Direct3D11::IDirect3DSurface& texture) {
        winrt::com_ptr<ID3D11Texture2D> texturePtr;
        {
            winrt::com_ptr<ID3D11Resource> resource;
            winrt::com_ptr<::IInspectable> inspectable = texture.as<::IInspectable>();
            winrt::com_ptr<Windows::Graphics::DirectX::Direct3D11::IDirect3DDxgiInterfaceAccess> dxgiInterfaceAccess;
            winrt::check_hresult(inspectable->QueryInterface(__uuidof(dxgiInterfaceAccess), dxgiInterfaceAccess.put_void()));
            winrt::check_hresult(dxgiInterfaceAccess->GetInterface(__uuidof(resource), resource.put_void()));
            resource.as(texturePtr);
        }

        // Copy / blit texturePtr into the back buffer here.
    });
```

## Depth Reprojection

Starting with version [2.1.0](holographic-remoting-version-history.md#v2.1.0), Holographic Remoting supports [Depth Reprojection](hologram-stability.md#reprojection). This requires both the color buffer and depth buffer to be streamed from the Remote application to the HoloLens 2. By default depth buffer streaming is enabled and configured to use half the resolution of the color buffer. This can be changed as follows:

```cpp
// class implementation
#include <HolographicAppRemoting\Streamer.h>

...

CreateRemoteContext(m_remoteContext, 20000, false, PreferredVideoCodec::Default);

// Configure for half-resolution depth.
m_remoteContext.ConfigureDepthVideoStream(DepthBufferStreamResolution::Half_Resolution);

```

Note, if default values should not be used ```ConfigureDepthVideoStream``` must be called before establishing a connection to the HoloLens 2. The best place is right after you have created the remote context. Possible values for DepthBufferStreamResolution are:

* Full_Resolution
* Half_Resolution
* Quarter_Resolution
* Disabled (added with version [2.1.3](holographic-remoting-version-history.md#v2.1.3) and if used no additional depth video stream is created)

Keep in mind that using a full resolution depth buffer also affects bandwidth requirements and needs to be accounted for in the maximum bandwidth value you provide to ```CreateRemoteContext```.

Beside configuring the resolution, you also have to commit a depth buffer via [HolographicCameraRenderingParameters.CommitDirect3D11DepthBuffer](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.commitdirect3d11depthbuffer#Windows_Graphics_Holographic_HolographicCameraRenderingParameters_CommitDirect3D11DepthBuffer_Windows_Graphics_DirectX_Direct3D11_IDirect3DSurface_).

```cpp

void SampleRemoteMain::Render(HolographicFrame holographicFrame)
{
    ...

    m_deviceResources->UseHolographicCameraResources([this, holographicFrame](auto& cameraResourceMap) {
        
		...

        for (auto cameraPose : prediction.CameraPoses())
        {
            DXHelper::CameraResources* pCameraResources = cameraResourceMap[cameraPose.HolographicCamera().Id()].get();

            ...

            m_deviceResources->UseD3DDeviceContext([&](ID3D11DeviceContext3* context) {
                
                ...

                // Commit depth buffer if available and enabled.
                if (m_canCommitDirect3D11DepthBuffer && m_commitDirect3D11DepthBuffer)
                {
                    auto interopSurface = pCameraResources->GetDepthStencilTextureInteropObject();
                    HolographicCameraRenderingParameters renderingParameters = holographicFrame.GetRenderingParameters(cameraPose);
                    renderingParameters.CommitDirect3D11DepthBuffer(interopSurface);
                }
            });
        }
    });
}

```

To verify if depth reprojection is correctly working on HoloLens 2, you can enable a depth visualizer via the Device Portal. See [Verifying Depth is Set Correctly](hologram-stability.md#verifying-depth-is-set-correctly) for details.

## Optional: Custom data channels

Custom data channels can be used to send user data over the already established remoting connection. See [custom data channels](holographic-remoting-custom-data-channels.md) for more information.

## See Also
* [Writing a custom Holographic Remoting player app](holographic-remoting-create-player.md)
* [Custom Holographic Remoting data channels](holographic-remoting-custom-data-channels.md)
* [Establishing a secure connection with Holographic Remoting](holographic-remoting-secure-connection.md)
* [Holographic Remoting troubleshooting and limitations](holographic-remoting-troubleshooting.md)
* [Holographic Remoting software license terms](/legal/mixed-reality/microsoft-holographic-remoting-software-license-terms)
* [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?LinkId=521839)
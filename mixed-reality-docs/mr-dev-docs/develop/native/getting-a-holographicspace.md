---
title: Getting a HolographicSpace
description: Learn how to use the HolographicSpace API for holographic rendering and spatial input in your mixed reality apps.
author: mikeriches
ms.author: mriches
ms.date: 08/04/2020
ms.topic: article
keywords: Windows Mixed Reality, HolographicSpace, CoreWindow, spatial input, rendering, swap chain, holographic frame, update loop, game loop, frame of reference, locatability, sample code, walkthrough, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Getting a HolographicSpace

> [!NOTE]
> This article relates to the legacy WinRT native APIs.  For new native app projects, we recommend using the **[OpenXR API](openxr-getting-started.md)**.

The <a href="/uwp/api/windows.graphics.holographic.holographicspace" target="_blank">HolographicSpace</a> class is your portal into the holographic world. It controls immersive rendering, provides camera data, and provides access to spatial reasoning APIs. You'll create one for your UWP app's [CoreWindow](/uwp/api/Windows.UI.Core.CoreWindow) or your Win32 app's HWND.

## Set up the holographic space

Creating the holographic space object is the first step in making your Windows Mixed Reality app. Traditional Windows apps render to a Direct3D swap chain created for the core window of their application view. This swap chain is displayed to a slate in the holographic UI. To make your application view holographic rather than a 2D slate, create a holographic space for its core window instead of a swap chain. Presenting holographic frames that are created by this holographic space puts your app into full-screen rendering mode.

For a **UWP app** [starting from the *Holographic DirectX 11 App (Universal Windows) template*](creating-a-holographic-directx-project.md), look for this code in the **SetWindow** method in AppView.cpp:

```cpp
m_holographicSpace = HolographicSpace::CreateForCoreWindow(window);
```

If you're building a **Win32 app** [starting from the *BasicHologram* Win32 sample](creating-a-holographic-directx-project.md#creating-a-win32-project), look at **App::CreateWindowAndHolographicSpace** for an HWND example. You can then convert it into an immersive HWND by creating an associated <a href="/uwp/api/windows.graphics.holographic.holographicspace" target="_blank">HolographicSpace</a>:

```cpp
void App::CreateWindowAndHolographicSpace(HINSTANCE hInstance, int nCmdShow)
{
    // Store the instance handle in our class variable.
    m_hInst = hInstance;

    // Create the window for the HolographicSpace.
    hWnd = CreateWindowW(
        m_szWindowClass, 
        m_szTitle,
        WS_VISIBLE,
        CW_USEDEFAULT, 
        0, 
        CW_USEDEFAULT, 
        0, 
        nullptr, 
        nullptr, 
        hInstance, 
        nullptr);

    if (!hWnd)
    {
        winrt::check_hresult(E_FAIL);
    }

    {
        // Use WinRT factory to create the holographic space.
        using namespace winrt::Windows::Graphics::Holographic;
        winrt::com_ptr<IHolographicSpaceInterop> holographicSpaceInterop =
            winrt::get_activation_factory<HolographicSpace, IHolographicSpaceInterop>();
        winrt::com_ptr<ABI::Windows::Graphics::Holographic::IHolographicSpace> spHolographicSpace;
        winrt::check_hresult(holographicSpaceInterop->CreateForWindow(
            hWnd, __uuidof(ABI::Windows::Graphics::Holographic::IHolographicSpace),
            winrt::put_abi(spHolographicSpace)));

        if (!spHolographicSpace)
        {
            winrt::check_hresult(E_FAIL);
        }

        // Store the holographic space.
        m_holographicSpace = spHolographicSpace.as<HolographicSpace>();
    }

    // The DeviceResources class uses the preferred DXGI adapter ID from the holographic
    // space (when available) to create a Direct3D device. The HolographicSpace
    // uses this ID3D11Device to create and manage device-based resources such as
    // swap chains.
    m_deviceResources->SetHolographicSpace(m_holographicSpace);

    // The main class uses the holographic space for updates and rendering.
    m_main->SetHolographicSpace(hWnd, m_holographicSpace);

    // Show the window. This will activate the holographic view and switch focus
    // to the app in Windows Mixed Reality.
    ShowWindow(hWnd, nCmdShow);
    UpdateWindow(hWnd);
}
```

Once you've obtained a HolographicSpace for either your UWP CoreWindow or Win32 HWND, the HolographicSpace can handle holographic cameras, create coordinate systems, and do holographic rendering. The current holographic space is used in multiple places in the DirectX template:
* The **DeviceResources** class needs to get some information from the HolographicSpace object to create the Direct3D device. This is the DXGI adapter ID associated with the holographic display. The <a href="/uwp/api/windows.graphics.holographic.holographicspace" target="_blank">HolographicSpace</a> class uses your app's Direct3D 11 device to create and manage device-based resources, such as the back buffers for each holographic camera. If you're interested in seeing what this function does under the hood, you'll find it in DeviceResources.cpp.
* The function **DeviceResources::InitializeUsingHolographicSpace** demonstrates how to obtain the adapter by looking up the LUID – and how to choose a default adapter when no preferred adapter is specified.
* The app's main class uses the holographic space from **AppView::SetWindow** or **App::CreateWindowAndHolographicSpace** for updates and rendering.

>[!NOTE]
>While the sections below mention function names from the template like **AppView::SetWindow** that assume that you started from the holographic UWP app template, the code snippets you see will apply equally across UWP and Win32 apps.

Next, we'll dive into the setup process that **SetHolographicSpace** is responsible for in the AppMain class.

## Subscribe to camera events, create, and remove camera resources

Your app's holographic content lives in its holographic space, and is viewed through one or more holographic cameras, which represent different perspectives on the scene. Now that you have the holographic space, you can receive data for holographic cameras.

Your app needs to respond to **CameraAdded** events by creating any resources that are specific to that camera. An example of such a resource is your back buffer render target view. You can see this code in the **DeviceResources::SetHolographicSpace** function, called by **AppView::SetWindow** before the app creates any holographic frames:

```cpp
m_cameraAddedToken = m_holographicSpace.CameraAdded(
    std::bind(&AppMain::OnCameraAdded, this, _1, _2));
```

Your app also needs to respond to **CameraRemoved** events by releasing resources that were created for that camera.

From **DeviceResources::SetHolographicSpace**:

```cpp
m_cameraRemovedToken = m_holographicSpace.CameraRemoved(
    std::bind(&AppMain::OnCameraRemoved, this, _1, _2));
```

The event handlers must complete some work to keep holographic rendering flowing smoothly, and your app rendering at all. Read the code and comments for the details: you can look for **OnCameraAdded** and **OnCameraRemoved** in your main class to understand how the **m_cameraResources** map is handled by **DeviceResources**.

Right now, we're focused on AppMain and the setup that it does to enable your app to know about holographic cameras. With this in mind, it's important to take note of the following two requirements:

1. For the **CameraAdded** event handler, the app can work asynchronously to finish creating resources and loading assets for the new holographic camera. Apps that take more than one frame to complete this work should request a deferral, and complete the deferral after loading asynchronously. A [PPL task](/cpp/parallel/concrt/parallel-patterns-library-ppl) can be used to do asynchronous work. Your app must ensure that it's ready to render to that camera right away when it exits the event handler, or when it completes the deferral. Exiting the event handler or completing the deferral tells the system that your app is now ready to receive holographic frames with that camera included.

2. When the app receives a **CameraRemoved** event, it must release all references to the back buffer and exit the function right away. This includes render target views, and any other resource that might hold a reference to the [IDXGIResource](/windows/desktop/api/dxgi/nn-dxgi-idxgiresource). The app must also ensure that the back buffer isn't attached as a render target, as shown in **CameraResources::ReleaseResourcesForBackBuffer**. To help speed things along, your app can release the back buffer and then launch a task to asynchronously complete any other tear down work for the camera. The holographic app template includes a PPL task that you can use for this purpose.

>[!NOTE]
>If you want to determine when an added or removed camera shows up on the frame, use the **HolographicFrame** [AddedCameras](/uwp/api/windows.graphics.holographic.holographicframe.addedcameras) and [RemovedCameras](/uwp/api/windows.graphics.holographic.holographicframe.removedcameras) properties.

## Create a frame of reference for your holographic content

Your app's content must be positioned in a [spatial coordinate system](coordinate-systems-in-directx.md) to be rendered in the HolographicSpace. The system provides two primary frames of reference, which you can use to establish a coordinate system for your holograms.

There are two kinds of reference frames in Windows Holographic: reference frames attached to the device, and reference frames that remain stationary as the device moves through the user's environment. The holographic app template uses a stationary reference frame by default; this is one of the simplest ways to render world-locked holograms.

Stationary reference frames are designed to stabilize positions near the device's current location. This means that coordinates further from the device can drift slightly relative to the user's environment as the device learns more about the space around it. There are two ways to create a stationary frame of reference: acquire the coordinate system from the [spatial stage](coordinate-systems-in-directx.md#place-holograms-in-the-world-using-a-spatial-stage), or use the default <a href="/uwp/api/windows.perception.spatial.spatiallocator" target="_blank">SpatialLocator</a>. If you're creating a Windows Mixed Reality app for immersive headsets, the recommended starting point is the [spatial stage](coordinate-systems-in-directx.md#place-holograms-in-the-world-using-a-spatial-stage). The spatial stage also provides information about the capabilities of the immersive headset worn by the player. Here, we show how to use the default <a href="/uwp/api/windows.perception.spatial.spatiallocator" target="_blank">SpatialLocator</a>.

The spatial locator represents the Windows Mixed Reality device, and tracks the motion of the device and provides coordinate systems that can be understood relative to its location.

From **AppMain::OnHolographicDisplayIsAvailableChanged**:

```cpp
spatialLocator = SpatialLocator::GetDefault();
```

Create the stationary reference frame once when the app is launched. This is analogous to defining a world coordinate system, with the origin placed at the device's position when the app is launched. This reference frame doesn't move with the device.

From **AppMain::SetHolographicSpace**:

```cpp
m_stationaryReferenceFrame =
    m_spatialLocator.CreateStationaryFrameOfReferenceAtCurrentLocation();
```

All reference frames are gravity aligned, meaning that the y-axis points "up" in relation to the user's environment. Since Windows uses "right-handed" coordinate systems, the direction of the –z axis coincides with the "forward" direction the device is facing when the reference frame is created.

>[!NOTE]
>When your app requires precise placement of individual holograms, use a <a href="/uwp/api/windows.perception.spatial.spatialanchor" target="_blank">SpatialAnchor</a> to anchor the individual hologram to a position in the real world. For example, use a spatial anchor when the user indicates a point to be of special interest. Anchor positions do not drift, but they can be adjusted. By default, when an anchor is adjusted, it eases its position into place over the next several frames after the correction has occurred. Depending on your application, when this occurs you may want to handle the adjustment in a different manner (e.g. by deferring it until the hologram is out of view). The <a href="/uwp/api/windows.perception.spatial.spatialanchor.rawcoordinatesystem" target="_blank">RawCoordinateSystem</a> property and <a href="/uwp/api/windows.perception.spatial.spatialanchor.rawcoordinatesystemadjusted" target="_blank">RawCoordinateSystemAdjusted</a> events enable these customizations.

## Respond to locatability changed events

Rendering world-locked holograms requires the device to locate itself in the world. This may not always be possible because of environmental conditions, and if so, the user may expect a visual indication of the tracking interruption. This visual indication must be rendered using reference frames attached to the device, instead of stationary to the world.

Your app can request to be notified if tracking is interrupted for any reason. Register for the LocatabilityChanged event to detect when the device's ability to locate itself in the world changes. From **AppMain::SetHolographicSpace:**

```cpp
m_locatabilityChangedToken = m_spatialLocator.LocatabilityChanged(
    std::bind(&HolographicApp6Main::OnLocatabilityChanged, this, _1, _2));
```

Then use this event to determine when holograms cannot be rendered stationary to the world.

## See also
* [Rendering in DirectX](rendering-in-directx.md)
* [Coordinate systems in DirectX](coordinate-systems-in-directx.md)
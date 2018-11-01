---
title: Getting a HolographicSpace
description: Explains the HolographicSpace API, a core concept for holographic rendering and spatial input.
author: MikeRiches
ms.author: mriches
ms.date: 03/21/2018
ms.topic: article
keywords: Windows Mixed Reality, HolographicSpace, CoreWindow, spatial input, rendering, swap chain, holographic frame, update loop, game loop, frame of reference, locatability, sample code, walkthrough
---



# Getting a HolographicSpace

The [HolographicSpace](https://msdn.microsoft.com/library/windows/apps/windows.graphics.holographic.holographicspace.aspx) class is your portal into the holographic world. It controls full-screen rendering, provides camera data, and provides access to spatial reasoning APIs. You will create one for your UWP app's [CoreWindow](https://msdn.microsoft.com/library/windows/apps/windows.ui.core.corewindow.aspx) or your Win32 app's HWND.

## Set up the holographic space

Creating the holographic space object is the first step in making your Windows Mixed Reality app. Traditional Windows apps render to a Direct3D swap chain created for the core window of their application view. This swap chain is displayed to a slate in the holographic UI. To make your application view holographic rather than a 2D slate, create a holographic space for its core window instead of a swap chain. Presenting holographic frames that are created by this holographic space puts your app into full-screen rendering mode.

For a **UWP app** starting from the *Holographic DirectX 11 App (Universal Windows) template*, look for this code in the **SetWindow** method in AppView.cpp:

```cpp
m_holographicSpace = HolographicSpace::CreateForCoreWindow(window);
```

The current holographic space is used in multiple places in the DirectX template:
* The **DeviceResources** class needs to get some information from the HolographicSpace object in order to create the Direct3D device. This is the DXGI adapter ID associated with the holographic display. The [HolographicSpace](https://msdn.microsoft.com/library/windows/apps/windows.graphics.holographic.holographicspace.aspx) class uses your app's Direct3D 11 device to create and manage device-based resources, like swap chains for holographic cameras. If you're interested in seeing what this function does under the hood, you'll find it in DeviceResources.cpp.
* The function **DeviceResources::InitializeUsingHolographicSpace** demonstrates how to obtain the adapter by looking up the LUID – and how to choose a default adapter when no preferred adapter is specified.
* The main class uses the holographic space in **AppView::SetWindow**, for updates and rendering.

For a **Win32 app** starting from the *Windows Desktop Application* template, add the following code just below the #include directives at the top of the main .cpp file named for your project:
```cpp
#include <..\winrt\WinRTBase.h>;
#include <windows.graphics.holographic.h>;
#include <..\um\HolographicSpaceInterop.h>;
#include <wrl.h>;
```

Then, add the following code block within the **InitInstance** function, just above the call to **ShowWindow**:
```cpp
{
   CoInitializeEx(nullptr, 0);

   using namespace ABI::Windows::Foundation;
   using namespace ABI::Windows::Graphics::Holographic;
   using namespace Microsoft::WRL;
   using namespace Microsoft::WRL::Wrappers;
   
   ComPtr<IHolographicSpaceStatics> spHolographicSpaceFactory;
   HRESULT hr = GetActivationFactory(HStringReference(RuntimeClass_Windows_Graphics_Holographic_HolographicSpace).Get(), &spHolographicSpaceFactory);

   ComPtr<IHolographicSpaceInterop> spHolographicSpaceInterop;
   if (SUCCEEDED(hr))
   {
       hr = spHolographicSpaceFactory.As(&spHolographicSpaceInterop);
   }

   ComPtr<ABI::Windows::Graphics::Holographic::IHolographicSpace> spHolographicSpace;
   if (SUCCEEDED(hr))
   {
       hr = spHolographicSpaceInterop->CreateForWindow(hWnd, IID_PPV_ARGS(&spHolographicSpace));
   }
   
   ComPtr<IHolographicFrame> spHolographicFrame;
   if (SUCCEEDED(hr))
   {
       hr = spHolographicSpace->CreateNextFrame(&spHolographicFrame);
   }
}
```

Now that you've obtained a HolographicSpace for either your UWP CoreWindow or Win32 HWND, you'll use that HolographicSpace to handle holographic cameras, create coordinate systems and do holographic rendering.  The code you'll write there is the same regardless of whether you're writing a UWP app or Win32 app.

>[!NOTE]
>While the sections below mention functions like **AppView::SetWindow** that assume that you are using the holographic UWP app template, the code snippets shown apply equally across UWP and Win32 apps.

Next, we'll dive into the setup process that **SetHolographicSpace** is responsible for in the AppMain class.

## Subscribe to camera events, create and remove camera resources

Your app's holographic content lives in its holographic space, and is viewed through one or more holographic cameras which represent different perspectives on the scene. Now that you have the holographic space, you can receive data for holographic cameras.

Your app needs to respond to **CameraAdded** events by creating any resources that are specific to that camera, like your back buffer render target view. Register this function before the app creates any holographic frames in **AppView::SetWindow**:

```cpp
m_cameraAddedToken =
   m_holographicSpace->CameraAdded +=
      ref new Windows::Foundation::TypedEventHandler<HolographicSpace^, HolographicSpaceCameraAddedEventArgs^>(
          std::bind(&AppMain::OnCameraAdded, this, _1, _2)
           );
```

Your app also needs to respond to **CameraRemoved** events by releasing resources that were created for that camera.

From **AppView::SetWindow**:

```cpp
m_cameraRemovedToken =
   m_holographicSpace->CameraRemoved +=
       ref new Windows::Foundation::TypedEventHandler<HolographicSpace^, HolographicSpaceCameraRemovedEventArgs^>(
           std::bind(&AppMain::OnCameraRemoved, this, _1, _2)
           );
```

The event handlers must complete some work in order to keep holographic rendering flowing smoothly, and so that your app is able to render at all. Read the code and comments for the details: you can look for **CameraAdded** and **CameraRemoved** in your main class to understand how the **m_cameraResources** map is handled by **DeviceResources**.

Right now, we're focused on AppMain and the setup that it does to enable your app to know about holographic cameras. With this in mind, it's important to take note of the following two requirements:

1. For the **CameraAdded** event handler, the app can work asynchronously to finish creating resources and loading assets for the new holographic camera. Apps that take more than one frame to complete this work should request a deferral, and complete the deferral after loading asynchronously; a [PPL task](https://msdn.microsoft.com/library/dd492418.aspx) can be used to do asynchronous work. Your app must ensure that it's ready to render to that camera right away when it exits the event handler, or when it completes the deferral. Exiting the event handler or completing the deferral tells the system that your app is now ready to receive holographic frames with that camera included.

2. When the app receives a **CameraRemoved** event, it must release all references to the back buffer and exit the function right away. This includes render target views, and any other resource that might hold a reference to the [IDXGIResource](https://msdn.microsoft.com/library/windows/desktop/bb174560.aspx). The app must also ensure that the back buffer is not attached as a render target, as shown in **DeviceResources::ReleaseResourcesForBackBuffer**. To help speed things along, your app can release the back buffer and then launch a task to asynchronously complete any other work that is necessary to tear down that camera. The holographic app template includes a PPL task that you can use for this purpose.

>[!NOTE]
>If you want to determine when an added or removed camera shows up on the frame, use the **HolographicFrame** [AddedCameras](https://msdn.microsoft.com/library/windows/apps/windows.graphics.holographic.holographicframe.addedcameras.aspx) and [RemovedCameras](https://msdn.microsoft.com/library/windows/apps/windows.graphics.holographic.holographicframe.removedcameras.aspx) properties.

## Create a frame of reference for your holographic content

Your app's content must be positioned in a spatial coordinate system in order to be rendered. The system provides two primary frames of reference which you can use to establish a coordinate system for your holograms.

There are two kinds of reference frames in Windows Holographic: reference frames attached to the device, and reference frames that remain stationary as the device moves through the user's environment. The holographic app template uses a stationary reference frame by default; this is one of the simplest ways to render world-locked holograms.

Stationary reference frames are designed to stabilize positions near the device's current location. This means that [coordinates](coordinate-systems.md) further from the device are allowed to drift slightly with respect to the user's environment as the device learns more about the space around it. There are two ways to create a stationary frame of reference: acquire the coordinate system from the [spatial stage](coordinate-systems-in-directx.md#place-holograms-in-the-world-using-a-spatial-stage), or use the default [SpatialLocator](https://msdn.microsoft.com/library/windows/apps/windows.perception.spatial.spatiallocator.aspx). If you are creating a Windows Mixed Reality app for immersive headsets, the recommended starting point is the [spatial stage](coordinate-systems-in-directx.md#place-holograms-in-the-world-using-a-spatial-stage), which also provides information about the capabilities of the immersive headset worn by the player. Here, we show how to use the default [SpatialLocator](https://msdn.microsoft.com/library/windows/apps/windows.perception.spatial.spatiallocator.aspx).

The spatial locator represents the Windows Mixed Reality device, and tracks the motion of the device and provides coordinate systems that can be understood relative to its location.

From **AppMain::SetHolographicSpace:**

```cpp
m_locator = SpatialLocator::GetDefault();
```

Create the stationary reference frame once when the app is launched. This is analogous to defining a world coordinate system, with the origin placed at the device's position when the app is launched. This reference frame doesn't move with the device.

From **AppMain::SetHolographicSpace:**

```cpp
SpatialStationaryFrameOfReference m_referenceFrame =
       m_locator->CreateStationaryFrameOfReferenceAtCurrentLocation();
```

All reference frames are gravity aligned, meaning that the y axis points "up" with respect to the user's environment. Since Windows uses "right-handed" coordinate systems, the direction of the –z axis coincides with the direction the device is facing when the reference frame is created.

>[!NOTE]
>When your app requires precise placement of individual holograms, use a [SpatialAnchor](https://msdn.microsoft.com/library/windows/apps/windows.perception.spatial.spatialanchor.aspx) to anchor the individual hologram to a position in the real world. For example, use a spatial anchor when the user indicates a point to be of special interest. Anchor positions do not drift, but they can be adjusted. By default, when an anchor is adjusted, it eases its position into place over the next several frames after the correction has occurred. Depending on your application, when this occurs you may want to handle the adjustment in a different manner (e.g. by deferring it until the hologram is out of view). The [RawCoordinateSystem](https://msdn.microsoft.com/library/windows/apps/windows.perception.spatial.spatialanchor.rawcoordinatesystem.aspx) property and [RawCoordinateSystemAdjusted](https://msdn.microsoft.com/library/windows/apps/windows.perception.spatial.spatialanchor.rawcoordinatesystemadjusted.aspx) events enable these customizations.

## Respond to locatability changed events

Rendering world-locked holograms requires the device to be able to locate itself in the world. This may not always be possible due to environmental conditions, and if so, the user may expect a visual indication of the tracking interruption. This visual indication must be rendered using reference frames attached to the device, instead of stationary to the world.

You app can request to be notified if tracking is interrupted for any reason. Register for the LocatablilityChanged event to detect when the device's ability to locate itself in the world changes. From **AppMain::SetHolographicSpace:**

```cpp
m_locatabilityChangedToken =
   m_locator->LocatabilityChanged +=
       ref new Windows::Foundation::TypedEventHandler<SpatialLocator^, Object^>(
           std::bind(&AppMain::OnLocatabilityChanged, this, _1, _2)
           );
```

Then use this event to determine when holograms cannot be rendered stationary to the world.

## See also
* [Rendering in DirectX](rendering-in-directx.md)
* [Coordinate systems in DirectX](coordinate-systems-in-directx.md)

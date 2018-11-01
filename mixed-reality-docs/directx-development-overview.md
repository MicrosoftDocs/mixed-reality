---
title: DirectX development overview
description: Building a DirectX-based mixed reality engine using the Windows Mixed Reality APIs directly.
author: thetuvix
ms.author: alexturn
ms.date: 03/21/2018
ms.topic: article
keywords: DirectX, holographic rendering, native, native app, WinRT, WinRT app, platform APIs, custom engine, middleware
---



# DirectX development overview

Windows Mixed Reality apps use the [holographic rendering](rendering.md), [gaze](gaze.md), [gesture](gestures.md), [motion controller](motion-controllers.md), [voice](voice-input.md) and [spatial mapping](spatial-mapping.md) APIs to build [mixed reality](mixed-reality.md) experiences for HoloLens and immersive headsets. You can create mixed reality apps using a 3D engine, such as [Unity](unity-development-overview.md), or you can use Windows Mixed Reality APIs with DirectX 11. Please note that DirectX 12 is not currently supported. If you are leveraging the platform directly, you'll essentially be building your own middleware or framework. The Windows APIs support apps written in both C++ and C#. If you'd like to use C#, your application can leverage the [SharpDX](http://sharpdx.org/) open source software library.

Windows Mixed Reality supports [two kinds of apps](app-views.md):
* **Mixed reality apps** (UWP or Win32), which use the [HolographicSpace API](getting-a-holographicspace.md) to render an [immersive view](app-views.md) to the user that fills the headset display.
* **2D apps** (UWP), which use DirectX, XAML or other frameworks to render [2D views](app-views.md#2d-views) on slates in the Windows Mixed Reality home.

The differences between DirectX development for [2D views and immersive views](app-views.md) are primarily related to holographic rendering and spatial input. Your UWP app's [IFrameworkView](https://msdn.microsoft.com/library/windows/apps/windows.applicationmodel.core.iframeworkview.aspx) or your Win32 app's HWND are still required and remain largely the same, as do the WinRT APIs available to your app. However, you use a different subset of these APIs to take advantage of holographic features. For example, the swap chain is managed by the system for holographic apps, and you work with the HolographicSpace API rather than DXGI to [present frames](rendering-in-directx.md).

To begin developing immersive apps:
* For **UWP apps**, [create a new UWP project using the templates in Visual Studio](creating-a-holographic-directx-project.md). Based on your language, **Visual C++** or **Visual C#**, you will find the UWP templates under **Windows Universal** > **Holographic**.
* For **Win32 apps**, [create a new Win32 desktop project](creating-a-holographic-directx-project.md#creating-a-win32-project) and then follow the Win32 instructions on the [Getting a HolographicSpace](getting-a-holographicspace.md) page to get a HolographicSpace.

This is a great way to get the code you need to add holographic rendering support to an existing app or engine. Code and concepts are presented in the template in a way that's familiar to any developer of real-time interactive software.

## Getting started

The following topics discuss the base requirements of adding Windows Mixed Reality support to DirectX-based middleware:
* [Creating a holographic DirectX project](creating-a-holographic-directx-project.md): The holographic app template coupled with the documentation will show you the differences between what you're used to, and the special requirements introduced by a device that's designed to function while resting on your head.
* [Getting a HolographicSpace](getting-a-holographicspace.md): You'll first need to create a HolographicSpace, which will provide your app the sequence of HolographicFrame objects that represent each head position from which you'll render.
* [Rendering in DirectX](rendering-in-directx.md): Since a holographic swap chain has two render targets, you'll likely need to make some changes to the way your application renders.
* [Coordinate systems in DirectX](coordinate-systems-in-directx.md): Windows Mixed Reality learns and updates its understanding of the world as the user walks around, providing spatial coordinate systems that apps use to reason about the user's surroundings, including spatial anchors and the user's defined spatial stage.

## Adding mixed reality capabilities and inputs

To enable the best possible experience for users of your immersive apps, you'll want to support the following key building blocks:
* [Gaze, gestures, and motion controllers in DirectX](gaze,-gestures,-and-motion-controllers-in-directx.md)
* [Voice input in DirectX](voice-input-in-directx.md)
* [Spatial sound in DirectX](spatial-sound-in-directx.md)
* [Spatial mapping in DirectX](spatial-mapping-in-directx.md)

There are other key features that many immersive apps will want to use, which are also exposed to DirectX apps:
* [Shared spatial anchors in DirectX](shared-spatial-anchors-in-directx.md)
* [Locatable camera in DirectX](locatable-camera-in-directx.md)
* [Keyboard, mouse, and controller input in DirectX](keyboard,-mouse,-and-controller-input-in-directx.md)

## See also
* [App model](app-model.md)
* [App views](app-views.md)

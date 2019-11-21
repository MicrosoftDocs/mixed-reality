---
title: DirectX development overview 
description: Build a DirectX-based mixed-reality engine by using the Windows Mixed Reality APIs directly.
author: thetuvix
ms.author: alexturn
ms.date: 03/21/2018
ms.topic: article
keywords: DirectX, holographic rendering, native, native app, WinRT, WinRT app, platform APIs, custom engine, middleware
---

# DirectX development overview

Windows Mixed Reality applications use the following APIs to build [mixed-reality](mixed-reality.md) experiences for HoloLens and other immersive headsets:

 - [Holographic rendering](rendering.md)
 - [Gaze](gaze-and-commit.md)
 - [Gesture](gaze-and-commit.md#composite-gestures)
 - [Motion controller](motion-controllers.md)
 - [Voice](voice-input.md)
 - [Spatial mapping](spatial-mapping.md)

You can create mixed reality applications by using a 3D engine, such as [Unity](unity-development-overview.md). Or you can directly code to the Windows Mixed Reality APIs by using DirectX 11 or DirectX 12. If you leverage the platform directly, you essentially build your own middleware or framework. The Windows APIs support applications that are written in both C++ and C#. If you use C#, your application can leverage the [SharpDX](https://sharpdx.org/) open source software library.

Windows Mixed Reality supports [two kinds of apps](app-views.md):
* **Mixed-reality applications** (UWP or Win32) that use the [HolographicSpace API](getting-a-holographicspace.md) to render an [immersive view](app-views.md) to the user that fills the headset display
* **2D apps** (UWP) that use DirectX, XAML, or another framework to render [2D views](app-views.md#2d-views) on slates in the Windows Mixed Reality home

The differences between DirectX development for [2D views and immersive views](app-views.md) primarily concern holographic rendering and spatial input. Your UWP application's [IFrameworkView](https://msdn.microsoft.com/library/windows/apps/windows.applicationmodel.core.iframeworkview.aspx) or your Win32 application's HWND are required and remain largely the same. The same is true for the WinRT APIs that are available to your app. But you must use a different subset of these APIs to take advantage of holographic features. For example, the swap chain is managed by the system for holographic applications. And you the HolographicSpace API rather than DXGI to [present frames](rendering-in-directx.md).

To begin developing immersive applications:
* For **UWP apps**, [create a new UWP project by using the templates in Visual Studio](creating-a-holographic-directx-project.md). Based on your language, Visual C++ or Visual C#, find the UWP templates under **Windows Universal** > **Holographic**.
* For **Win32 applications**, [start from the *BasicHologram* Win32 sample](creating-a-holographic-directx-project.md#creating-a-win32-project).

This step is a great way to get the code that you need to add holographic rendering support to an existing application or engine. The code and concepts are presented in the template in a way that's familiar to any developer of real-time interactive software.

## Get started

The following topics describe the base requirements when you add Windows Mixed Reality support to DirectX-based middleware.

* [Create a holographic DirectX project](creating-a-holographic-directx-project.md): The holographic application template coupled with the documentation shows the differences compared to what you're used. It also describes the special requirements for a device that's designed to function while resting on your head.
* [Get a HolographicSpace](getting-a-holographicspace.md): You first need to create a HolographicSpace that gives your application the sequence of HolographicFrame objects that represent each head position from which you'll render.
* [Render in DirectX](rendering-in-directx.md): Because a holographic swap chain has two render targets, you must make some changes to the way your app renders.
* [Coordinate systems in DirectX](coordinate-systems-in-directx.md): Windows Mixed Reality learns and updates its understanding of the world as the user walks around. This provides spatial coordinate systems that applications use to reason about the user's surroundings, including spatial anchors and the user's defined spatial stage.

## Add mixed reality capabilities and inputs

To enable the best possible experience for users of your immersive app, you should support the following key building blocks:

* [Head and eye gaze in DirectX](gaze-in-directx.md)
* [Hands and motion controllers in DirectX](hands-and-motion-controllers-in-directx.md)
* [Voice input in DirectX](voice-input-in-directx.md)
* [Spatial sound](https://docs.microsoft.com/windows/win32/coreaudio/spatial-sound)
* [Spatial mapping in DirectX](spatial-mapping-in-directx.md)

These are other key features that many immersive applications use that are also exposed to DirectX applications:

* [Shared spatial anchors in DirectX](shared-spatial-anchors-in-directx.md)
* [Keyboard, mouse, and controller input in DirectX](keyboard,-mouse,-and-controller-input-in-directx.md)

## See also
* [App model](app-model.md)
* [App views](app-views.md)

---
title: Native development overview 
description: Build a DirectX-based mixed-reality engine by using the Windows Mixed Reality APIs directly.
author: thetuvix
ms.author: alexturn
ms.date: 08/04/2020
ms.topic: article
keywords: DirectX, holographic rendering, native, native app, WinRT, WinRT app, platform APIs, custom engine, middleware
---

# Native development overview

![Native banner logo](images/native_logo_banner.png)

3D engines like [Unity](unity-development-overview.md) or [Unreal](unreal-development-overview.md) aren't the only Mixed Reality development paths open to you. You can also create Mixed Reality apps by directly coding to the Windows Mixed Reality APIs with DirectX 11 or DirectX 12. By leveraging the platform directly, you're essentially building your own middleware or framework. 

> [!NOTE]
> The Windows APIs support applications that are written in both C++ and C#. If you use C#, your application can leverage the **[SharpDX](https://sharpdx.org/)** open source software library.

## Development checkpoints

Use the following checkpoints to bring your Unity games and applications into the world of mixed reality.

### 1. Getting started

Windows Mixed Reality supports [two kinds of apps](app-views.md):
* **Mixed-reality applications** (UWP or Win32) that use the [HolographicSpace API](getting-a-holographicspace.md) or [OpenXR API](openxr.md) to render an [immersive view](app-views.md) to the user that fills the headset display
* **2D apps** (UWP) that use DirectX, XAML, or another framework to render [2D views](app-views.md#2d-views) on slates in the Windows Mixed Reality home

The differences between DirectX development for [2D views and immersive views](app-views.md) primarily concern holographic rendering and spatial input. Your UWP application's [IFrameworkView](https://msdn.microsoft.com/library/windows/apps/windows.applicationmodel.core.iframeworkview.aspx) or your Win32 application's HWND are required and remain largely the same. The same is true for the WinRT APIs that are available to your app. But you must use a different subset of these APIs to take advantage of holographic features. For example, the swapchain and frame present is managed by the system for holographic applications in order to enable a pose-predicted frame loop.

Choose one of the tabs below and start your native journey!

[!INCLUDE[](~/includes/native-getting-started.md)]

### 2. Core building blocks

Windows Mixed Reality applications use the following APIs to build [mixed-reality](mixed-reality.md) experiences for HoloLens and other immersive headsets:

 - [Holographic rendering](rendering.md)
 - [Gaze](gaze-and-commit.md)
 - [Gesture](gaze-and-commit.md#composite-gestures)
 - [Motion controller](motion-controllers.md)
 - [Voice](voice-input.md)
 - [Spatial mapping](spatial-mapping.md)
 
You can find supporting documentation for these features in the tabs below:

[!INCLUDE[](~/includes/native-building-blocks.md)]

### 3. Platform capabilities and APIs

Other key features that play a role in mixed reality applications are available without any extra packages or setup. After diving into these more advanced capabilities, you'll be able to build deeper, more complex Mixed Reality apps.

[!INCLUDE[](~/includes/native-capabilities-apis.md)]

### 4. Deploying and testing

You can develop using OpenXR on a HoloLens 2 or Windows Mixed Reality immersive headset on the desktop.  If you don't have access to a headset, you can use the [HoloLens 2 Emulator](using-the-hololens-emulator.md) or the [Windows Mixed Reality Simulator](using-the-windows-mixed-reality-simulator.md) instead.

## What's next?

A developers job is never done, especially when learning a new tool or SDK. The following sections can take you into areas beyond the beginner level material you've already completed, along with helpful resources if you get stuck. Note that these topics and resources are not in any sequential order, so feel free to jump around and explore!

### Additional resources

If you're looking to level up your OpenXR game, check out the links below:

* [OpenXR best practices](openxr-best-practices.md)
* [OpenXR performance](openxr-performance.md)
* [OpenXR troubleshooting](openxr-troubleshooting.md)

## See also
* [App model](app-model.md)
* [App views](app-views.md)

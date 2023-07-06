---
title: Native development overview 
description: Learn how to build a DirectX-based mixed-reality engine using the Windows Mixed Reality APIs directly.
author: thetuvix
ms.author: alexturn
ms.date: 08/04/2020
ms.topic: article
keywords: DirectX, holographic rendering, native, native app, WinRT, WinRT app, platform APIs, custom engine, middleware, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Native development overview

![Native banner logo](../images/native_logo_banner.png)

3D engines like [Unity](../unity/unity-development-overview.md) or [Unreal](../unreal/unreal-development-overview.md) aren't the only Mixed Reality development paths open to you. You can also create Mixed Reality apps using the Windows Mixed Reality APIs with DirectX 11 or DirectX 12. By going to the platform source, you're essentially building your own middleware or framework. 

> [!IMPORTANT]
> If you have an existing WinRT project that you'd like to maintain, head over to our main [WinRT documentation](creating-a-holographic-directx-project.md). 

## Development checkpoints

Use the following checkpoints to bring your Unity games and applications into the world of mixed reality.

### 1. Getting started

Windows Mixed Reality supports [two kinds of apps](../../design/app-views.md):
* UWP or Win32 **Mixed Reality applications** that use the [HolographicSpace API](getting-a-holographicspace.md) or [OpenXR API](openxr.md) to render an [immersive view](../../design/app-views.md) that fills the headset display
* **2D apps** (UWP) that use DirectX, XAML, or another framework to render [2D views](../../design/app-views.md#2d-views) on slates in the Windows Mixed Reality home

The differences between DirectX development for [2D views and immersive views](../../design/app-views.md) primarily concern holographic rendering and spatial input. Your UWP application's [IFrameworkView](/uwp/api/Windows.ApplicationModel.Core.IFrameworkView) or your Win32 application's HWND are required and remain largely the same. The same is true for the WinRT APIs that are available to your app. But you must use a different subset of these APIs to take advantage of holographic features. For example, the system for holographic applications manages the swapchain and frame present to enable a pose-predicted frame loop.

[!INCLUDE[](../includes/native-getting-started.md)]

### 2. Core building blocks

Windows Mixed Reality applications use the following APIs to build [mixed-reality](../../discover/mixed-reality.md) experiences for HoloLens and other immersive headsets:

|  Feature  |  Capability  |
| --- | --- |
| [Gaze](../../design/gaze-and-commit.md) | Let users target holograms with by looking at them |
| [Gesture](../../design/gaze-and-commit.md#composite-gestures) | Add spatial actions to your apps |
| [Holographic rendering](../advanced-concepts/rendering-overview.md) | Draw a hologram at a precise location in the world around your users |
| [Motion controller](../../design/motion-controllers.md) | Let your users take action in your Mixed Reality environments |
| [Spatial mapping](../../design/spatial-mapping.md) | Map your physical space with a virtual mesh overlay to mark the boundaries of your environment |
| [Voice](../../design/voice-input.md) | Capture spoken keywords, phrases, and dictation from your users |
 
> [!NOTE]
> You can find upcoming and in-development core features in the OpenXR [roadmap](openxr.md#roadmap) documentation.

### 3. Deploying and testing

You can develop on a desktop using OpenXR on a HoloLens 2 or Windows Mixed Reality immersive headset.  If you don't have access to a headset, you can use the [HoloLens 2 Emulator](../advanced-concepts/using-the-hololens-emulator.md) or the [Windows Mixed Reality Simulator](../advanced-concepts/using-the-windows-mixed-reality-simulator.md) instead.

## What's next?

A developer's job is never done, especially when learning a new tool or SDK. The following sections can take you into areas beyond the beginner level material you've already completed. These topics and resources aren't in any sequential order, so feel free to jump around and explore!

### Additional resources

If you're looking to level up your OpenXR game, check out the links below:

* [OpenXR best practices](openxr-best-practices.md)
* [OpenXR performance](openxr-performance.md)
* [OpenXR troubleshooting](openxr-troubleshooting.md)

## See also
* [App model](../../design/app-model.md)
* [App views](../../design/app-views.md)
test
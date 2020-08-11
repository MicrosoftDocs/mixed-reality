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

> [!IMPORTANT]
> If you have an existing WinRT project that you'd like to maintain, head over to our main [WinRT documentation](creating-a-holographic-directx-project.md). 

## Development checkpoints

Use the following checkpoints to bring your Unity games and applications into the world of mixed reality.

### 1. Getting started

Windows Mixed Reality supports [two kinds of apps](app-views.md):
* **Mixed-reality applications** (UWP or Win32) that use the [HolographicSpace API](getting-a-holographicspace.md) or [OpenXR API](openxr.md) to render an [immersive view](app-views.md) to the user that fills the headset display
* **2D apps** (UWP) that use DirectX, XAML, or another framework to render [2D views](app-views.md#2d-views) on slates in the Windows Mixed Reality home

The differences between DirectX development for [2D views and immersive views](app-views.md) primarily concern holographic rendering and spatial input. Your UWP application's [IFrameworkView](https://msdn.microsoft.com/library/windows/apps/windows.applicationmodel.core.iframeworkview.aspx) or your Win32 application's HWND are required and remain largely the same. The same is true for the WinRT APIs that are available to your app. But you must use a different subset of these APIs to take advantage of holographic features. For example, the swapchain and frame present is managed by the system for holographic applications in order to enable a pose-predicted frame loop.

|  Checkpoint  |  Outcome  |
| --- | --- |
| [What is OpenXR?](openxr.md) | Begin your native development journey by getting acquainted with OpenXR and what it has to offer |
| [Install the latest tools](install-the-tools.md) | Download and install the latest Unity package and setup your project for mixed reality |
| [Setup for HoloLens 2](openxr-getting-started.md#getting-started-with-openxr-for-hololens-2) | Configure your device and environment for HoloLens 2 development |
| [Set up for immersive headsets](openxr-getting-started.md#getting-started-with-openxr-for-windows-mixed-reality-headsets) | Configure your device and environment for Windows Immersive Headset development |
| [Download the developer tools](openxr-getting-started.md#getting-the-windows-mixed-reality-openxr-developer-tools) | Try out the Windows Mixed Reality OpenXR Runtime |
| [Add the OpenXR Loader](openxr-getting-started.md#integrate-the-openxr-loader-into-a-project) | Discover the active OpenXR runtime on your device and access the core and extension functions that it implements |
| [Try a sample app](openxr-getting-started.md#building-a-sample-openxr-app) | Explore a UWP and Win32 versions of the same basic app on your device |

### 2. Core building blocks

Windows Mixed Reality applications use the following APIs to build [mixed-reality](mixed-reality.md) experiences for HoloLens and other immersive headsets:

|  Feature  |  Capability  |
| --- | --- |
| [Gaze](gaze-and-commit.md) | Let users target holograms with by looking at them |
| [Gesture](gaze-and-commit.md#composite-gestures) | Add spatial actions to your apps |
| [Holographic rendering](rendering.md) | Draw a hologram at a precise location in the world around your users |
| [Motion controller](motion-controllers.md) | Let your users take action in your Mixed Reality environments |
| [Spatial mapping](spatial-mapping.md) | Map your physical space with a virtual mesh overlay to mark the boundaries of your environment |
| [Voice](voice-input.md) | Capture spoken keywords, phrases, and dictation from your users |
 
> [!NOTE]
> You can find upcoming and in-development core features in the OpenXR [roadmap](openxr.md#roadmap) documentation.

### 3. Deploying and testing

You can develop using OpenXR on a HoloLens 2 or Windows Mixed Reality immersive headset on the desktop.  If you don't have access to a headset, you can use the [HoloLens 2 Emulator](using-the-hololens-emulator.md) or the [Windows Mixed Reality Simulator](using-the-windows-mixed-reality-simulator.md) instead.

<!--
### 4. Advanced services

At this point in your development journey you might be looking for advanced services or a helping hand with commercial deployment. Integrating [Azure Cloud Services](mixed-reality-cloud-services.md) and Dynamics 365 features can level up your projects in a major way. We've compiled a few starting points for you to explore and expand your Mixed Reality knowledge.

[!INCLUDE[](~/includes/native-cloud-services-d365.md)]
-->

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

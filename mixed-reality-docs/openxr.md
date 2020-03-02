---
title: OpenXR
description: Build an engine using the portable OpenXR API standard and deploy it to Windows Mixed Reality and HoloLens 2 headsets.
author: thetuvix
ms.author: alexturn
ms.date: 7/29/2019
ms.topic: article
keywords: OpenXR, Khronos, BasicXRApp, DirectX, native, native app, custom engine, middleware
---



# OpenXR

OpenXR is an open royalty-free API standard from <a href="https://www.khronos.org/" target="_blank">Khronos</a> that provides engines native access to a wide range of devices from many vendors that span across the [mixed reality spectrum](mixed-reality.md).

You can develop using OpenXR on a HoloLens 2 or Windows Mixed Reality immersive headset on the desktop.  If you don't have access to a headset, you can use the HoloLens 2 Emulator or the Windows Mixed Reality Simulator instead.

## Why OpenXR?

With OpenXR, you can build engines that target both holographic devices (like HoloLens 2) that place digital content in the real world as if it were really there, as well as immersive devices (like Windows Mixed Reality headsets for desktop PCs) that hide the physical world and replace it with a digital experience.  OpenXR lets you write code once that's then portable across a wide range of hardware platforms.

The OpenXR API uses a loader that connects your application directly to your headset's native platform support.  This offers your end users maximum performance and minimum latency, whether they're using a Windows Mixed Reality headset or any other headset.

## What is OpenXR?

The core OpenXR 1.0 API provides the base functionality you'll need to build an engine that can target both holographic devices like HoloLens 2 and immersive devices like Windows Mixed Reality headsets:
* Systems + sessions
* Reference spaces (view, local, stage)
* View configurations (mono, stereo)
* Swapchains + frame timing
* Composition layers
* Input and haptics
* Graphics API + platform integration

To learn about the OpenXR API, check out the OpenXR 1.0 <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html" target="_blank">specification</a>, <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html" target="_blank">API reference</a> and <a href="https://www.khronos.org/files/openxr-10-reference-guide.pdf" target="_blank">quick reference guide</a>.  For more information, see the <a href="https://www.khronos.org/openxr/" target="_blank">Khronos OpenXR page</a>.

To target the full feature set of HoloLens 2, you'll also use cross-vendor and vendor-specific OpenXR extensions that enable additional features beyond the OpenXR 1.0 core, such as articulated hand tracking, eye tracking, spatial mapping and spatial anchors.  See the [Roadmap section](#roadmap) below for more information on the extensions coming later this year.

Note that OpenXR is not itself a mixed reality engine.  Instead, OpenXR enables engines like Unity and Unreal to write portable code once that can then access the native platform features of the user's holographic or immersive device, regardless of which vendor built that platform.

## Roadmap

The OpenXR specification defines an extension mechanism that enables runtime implementers to expose additional functionality beyond the [core features](#what-is-openxr) defined in the <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html" target="_blank">base OpenXR 1.0 specification</a>.

There are three kinds of OpenXR extensions:
* **Vendor extensions (e.g. MSFT):** Enables per-vendor innovation in hardware or software features.  Any runtime vendor can introduce and ship a vendor extension at any time.
* **EXT extensions:** Cross-vendor extensions that multiple companies define and implement.  Groups of interested companies can introduce EXT extensions at any time.
* **KHR extensions:** Official Khronos extensions ratified as part of a core spec release.  KHR extensions are covered by the same license as the core spec itself.

By the end of the year, the Windows Mixed Reality OpenXR Runtime will support a set of MSFT and EXT extensions that bring the full set of HoloLens 2 features to OpenXR applications:
* [Unbounded reference space (world-scale experiences)](coordinate-systems.md#building-a-world-scale-experience)
* [Spatial anchors + storage](spatial-anchors.md)
* [Hand articulation + hand mesh](hands-and-tools.md)
* [Eye gaze](eye-tracking.md)
* [Secondary view configurations (Mixed Reality Capture)](mixed-reality-capture-for-developers.md#render-from-the-pv-camera-opt-in)
* [Scene understanding](scene-understanding.md)
* Interop with Windows SDK APIs

While some of these extensions may start out as vendor-specific MSFT extensions, Microsoft and other OpenXR runtime vendors are working together to design cross-vendor EXT or KHR extensions for many of these feature areas.  This will enable the code you write for those features to be portable across runtime vendors, just as with the core specification.

## See also

* <a href="https://www.khronos.org/openxr/" target="_blank">More information on OpenXR</a>
* <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html" target="_blank">OpenXR 1.0 specification</a>
* <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html" target="_blank">OpenXR 1.0 API reference</a>
* <a href="https://www.khronos.org/files/openxr-10-reference-guide.pdf" target="_blank">OpenXR 1.0 quick reference guide</a>

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

The OpenXR API provides the core pose prediction, frame timing and spatial input functionality you'll need to build an engine that can target both holographic devices like HoloLens 2 and immersive devices like Windows Mixed Reality headsets.

To learn about the OpenXR API, check out the OpenXR 1.0 <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html" target="_blank">specification</a>, <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html" target="_blank">API reference</a> and <a href="https://www.khronos.org/files/openxr-10-reference-guide.pdf" target="_blank">quick reference guide</a>.  For more information, see the <a href="https://www.khronos.org/openxr/" target="_blank">Khronos OpenXR page</a>.

To target the full feature set of HoloLens 2, you'll also use cross-vendor and vendor-specific OpenXR extensions that enable additional features beyond the OpenXR 1.0 core, such as articulated hand tracking, eye tracking, spatial mapping and spatial anchors.  See the [Roadmap section](#roadmap) below for more information on the extensions coming later this year.

Note that OpenXR is not itself a mixed reality engine.  Instead, OpenXR enables engines like Unity and Unreal to write portable code once that can then access the native platform features of the user's holographic or immersive device, regardless of which vendor built that platform.

## Roadmap

The OpenXR specification defines an extension mechanism that enables runtime implementers to expose additional functionality beyond the [core features](#what-is-openxr) defined in the <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html" target="_blank">base OpenXR 1.0 specification</a>.

There are three kinds of OpenXR extensions:
* **Vendor extensions (e.g. `MSFT`):** Enables per-vendor innovation in hardware or software features.  Any runtime vendor can introduce and ship a vendor extension at any time.
  * **Experimental vendor extensions (e.g. `MSFT_preview`):** Experimental vendor extensions being previewed to gather feedback.  `MSFT_preview` extensions are for developers only and will be removed when the real extension ships, so you must manually enable them.
* **Cross-vendor EXT extensions:** Cross-vendor extensions that multiple companies define and implement.  Groups of interested companies can introduce EXT extensions at any time.
* **Official KHR extensions:** Official Khronos extensions ratified as part of a core spec release.  KHR extensions are covered by the same license as the core spec itself.

By June 2020, the Windows Mixed Reality OpenXR Runtime will support a set of MSFT and EXT extensions that bring the full set of HoloLens 2 features to OpenXR applications:
| Feature area | Extension | Availability |
|---|---|---|
| Systems + sessions | Core spec: `XrInstance`, `XrSystemId`, `XrSession` | **Released in OpenXR 1.0** |
| Reference spaces (view, local, stage) | Core spec: `XrSpace` | **Released in OpenXR 1.0** |
| View configurations (mono, stereo) | Core spec: `XrView*` | **Released in OpenXR 1.0** |
| Swapchains + frame timing | Core spec: `XrSwapchain*` | **Released in OpenXR 1.0** |
| Composition layers | Core spec: `XrCompositionLayer*` | **Released in OpenXR 1.0** |
| Input and haptics | Core spec: `XrAction*` | **Released in OpenXR 1.0** |
| Graphics API integration (D3D11) | `XR_KHR_D3D11_enable` | **Released in OpenXR 1.0** |
| [Unbounded reference space (world-scale experiences)](coordinate-systems.md#building-a-world-scale-experience) | [`XR_MSFT_unbounded_reference_space`](https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_unbounded_reference_space) | **Released as `MSFT` extension** |
| [Spatial anchors](spatial-anchors.md) | [`XR_MSFT_spatial_anchor`](https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_spatial_anchor) | **Released as `MSFT` extension** |
| [Hand interaction (grip/aim pose, air-tap, grasp)](hands-and-tools.md) | [`XR_MSFT_hand_interaction_preview`](https://microsoft.github.io/OpenXR-MixedReality/openxr_preview/specs/openxr.html#XR_MSFT_hand_interaction_preview) | **`MSFT_preview` extension available**<br />March 2020: `MSFT` release
| [Hand articulation + hand mesh](hands-and-tools.md) | [`XR_MSFT_hand_tracking_preview`](https://microsoft.github.io/OpenXR-MixedReality/openxr_preview/specs/openxr.html#XR_MSFT_hand_tracking_preview)<br />[`XR_MSFT_hand_tracking_mesh_preview`](https://microsoft.github.io/OpenXR-MixedReality/openxr_preview/specs/openxr.html#XR_MSFT_hand_tracking_mesh_preview) | **`MSFT_preview` extension available**<br />April 2020: `MSFT` release
| [Mixed Reality Capture (third render)](mixed-reality-capture-for-developers.md#render-from-the-pv-camera-opt-in) | [`XR_MSFT_secondary_view_configuration_preview`](https://microsoft.github.io/OpenXR-MixedReality/openxr_preview/specs/openxr.html#XR_MSFT_secondary_view_configuration_preview)<br />[`XR_MSFT_first_person_observer_preview`](https://microsoft.github.io/OpenXR-MixedReality/openxr_preview/specs/openxr.html#XR_MSFT_first_person_observer_preview) | **`MSFT_preview` extension available**<br />April 2020: `MSFT` release
| Interop with other HoloLens SDKs (e.g. [QR](qr-code-tracking.md)) | [`XR_MSFT_spatial_graph_bridge_preview`](https://microsoft.github.io/OpenXR-MixedReality/openxr_preview/specs/openxr.html#XR_MSFT_spatial_graph_bridge_preview) | **`MSFT_preview` extension available**<br />April 2020: `MSFT` release
| [Eye gaze](eye-tracking.md) | *Upcoming:* `MSFT` vendor or `EXT` cross-vendor extension | March 2020: `MSFT_preview`<br />April 2020: `MSFT` or `EXT` release
| [Motion controller render models](motion-controllers.md#rendering-the-motion-controller-model) | *Upcoming:* `MSFT` vendor extension | March 2020: `MSFT_preview`<br />June 2020: `MSFT` release
| [Scene understanding (planes, meshes)](scene-understanding.md) | *Upcoming:* `MSFT` vendor extension | April 2020: `MSFT_preview`<br />June 2020: `MSFT` release

While some of these extensions may start out as vendor-specific `MSFT` extensions, Microsoft and other OpenXR runtime vendors are working together to design cross-vendor `EXT` or `KHR` extensions for many of these feature areas.  This will enable the code you write for those features to be portable across runtime vendors, just as with the core specification.

## Get started with OpenXR

You can develop using OpenXR on a HoloLens 2 or Windows Mixed Reality immersive headset on the desktop.  If you don't have access to a headset, you can use the HoloLens 2 Emulator or the Windows Mixed Reality Simulator instead.

To start developing OpenXR applications for HoloLens 2 or immersive Windows Mixed Reality headsets, see [how to get started with OpenXR development](openxr-getting-started.md).

## See also

* <a href="https://www.khronos.org/openxr/" target="_blank">More information on OpenXR</a>
* <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html" target="_blank">OpenXR 1.0 specification</a>
* <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html" target="_blank">OpenXR 1.0 API reference</a>
* <a href="https://www.khronos.org/files/openxr-10-reference-guide.pdf" target="_blank">OpenXR 1.0 quick reference guide</a>

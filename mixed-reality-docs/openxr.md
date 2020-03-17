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
  * **Experimental vendor extensions (e.g. `MSFT_preview`):** Experimental vendor extensions being previewed to gather feedback.  `MSFT_preview` extensions are for developers only and will be removed when the real extension ships.  To preview them as a developer, you can enable "Use latest preview OpenXR runtime" on the OpenXR page of [Device Portal](using-the-windows-device-portal.md) on the target device.
* **Cross-vendor `EXT` extensions:** Cross-vendor extensions that multiple companies define and implement.  Groups of interested companies can introduce EXT extensions at any time.
* **Official `KHR` extensions:** Official Khronos extensions ratified as part of a core spec release.  KHR extensions are covered by the same license as the core spec itself.

By July 2020, the Windows Mixed Reality OpenXR Runtime will support a set of `MSFT` and `EXT` extensions that bring the full set of HoloLens 2 features to OpenXR applications:

| Feature area | Extension availability |
|--------------|------------------------|
| Systems + sessions | **OpenXR 1.0 core spec:**<br /><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#instance" target="_blank">`XrInstance`</a>, <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#system" target="_blank">`XrSystemId`</a>, <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#session" target="_blank">`XrSession`</a> |
| [Reference spaces (view, local, stage)](coordinate-systems.md) | **OpenXR 1.0 core spec:**<br /><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#spaces" target="_blank">`XrSpace`</a> |
| View configurations (mono, stereo) | **OpenXR 1.0 core spec:**<br /><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#view_configurations" target="_blank">`XrView...`</a> |
| [Swapchains](rendering.md) + [frame timing](understanding-performance-for-mixed-reality.md) | **OpenXR 1.0 core spec:**<br /><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#rendering" target="_blank">`XrSwapchain...`</a> + <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#frame-synchronization" target="_blank">`xrWaitFrame`</a> |
| Composition layers<br />(projection, quad) | **OpenXR 1.0 core spec:**<br /><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#compositing" target="_blank">`XrCompositionLayer...`</a> + <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#frame-submission" target="_blank">`xrEndFrame`</a> |
| [Input and haptics](interaction-fundamentals.md) | **OpenXR 1.0 core spec:**<br /><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#input" target="_blank">`XrAction...`</a> |
| Direct3D 11 integration | **Official `KHR` extension released:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_KHR_D3D11_enable" target="_blank">XR_KHR_D3D11_enable</a></code><br /> |
| Direct3D 12 integration | **Official `KHR` extension defined:** *(not yet supported)*<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_KHR_D3D12_enable" target="_blank">XR_KHR_D3D12_enable</a></code><br /><p>**Preview support**: April 2020 *(planned)*</p><p>**Full support**: May 2020 *(planned)*</p> |
| [Unbounded reference space<br />(world-scale experiences)](coordinate-systems.md#building-a-world-scale-experience) | **`MSFT` extension released:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_unbounded_reference_space" target="_blank">XR_MSFT_unbounded_reference_space</a></code> |
| [Spatial anchors](spatial-anchors.md) | **`MSFT` extension released:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_spatial_anchor">XR_MSFT_spatial_anchor</a></code> |
| [Hand interaction<br />(grip/aim pose, air-tap, grasp)](hands-and-tools.md) | **`MSFT_preview` extension available:**<br /><code><a href="https://microsoft.github.io/OpenXR-MixedReality/openxr_preview/specs/openxr.html#XR_MSFT_hand_interaction_preview">XR_MSFT_hand_interaction_preview</a></code><p>**`MSFT` release**: April 2020 *(planned)*</p> |
| [Hand articulation + hand mesh](hands-and-tools.md) | **`MSFT_preview` extension available:**<br /><code><a href="https://microsoft.github.io/OpenXR-MixedReality/openxr_preview/specs/openxr.html#XR_MSFT_hand_tracking_preview">XR_MSFT_hand_tracking_preview</a></code><br /><code><a href="https://microsoft.github.io/OpenXR-MixedReality/openxr_preview/specs/openxr.html#XR_MSFT_hand_tracking_mesh_preview">XR_MSFT_hand_tracking_mesh_preview</a></code><p>**`MSFT` release**: May 2020 *(planned)*</p> |
| Interop with other HoloLens SDKs (e.g. [QR](qr-code-tracking.md)) | **`MSFT_preview` extension available:**<br /><code><a href="https://microsoft.github.io/OpenXR-MixedReality/openxr_preview/specs/openxr.html#XR_MSFT_spatial_graph_bridge_preview">XR_MSFT_spatial_graph_bridge_preview</a></code><p>**`MSFT` release**: May 2020 *(planned)*</p> |
| [Eye gaze](eye-tracking.md) | <p>**`MSFT_preview`**: April 2020 *(planned)*</p><p>**`MSFT` or `EXT` release**: May 2020 *(planned)*</p> |
| [Mixed Reality Capture<br />(third render from PV camera)](mixed-reality-capture-for-developers.md#render-from-the-pv-camera-opt-in) | **`MSFT_preview` extension available:**<br /><code><a href="https://microsoft.github.io/OpenXR-MixedReality/openxr_preview/specs/openxr.html#XR_MSFT_secondary_view_configuration_preview">XR_MSFT_secondary_view_configuration_preview</a></code><br /><code><a href="https://microsoft.github.io/OpenXR-MixedReality/openxr_preview/specs/openxr.html#XR_MSFT_first_person_observer_preview">XR_MSFT_first_person_observer_preview</a></code><br /><p>**`MSFT` release**: June 2020 *(planned)*</p> |
| [Motion controller render models](motion-controllers.md#rendering-the-motion-controller-model) | <p>**`MSFT_preview`**: April 2020 *(planned)*</p><p>**`MSFT` release**: July 2020 *(planned)*</p> |
| [Scene understanding (planes, meshes)](scene-understanding.md) | <p>**`MSFT_preview`**: May 2020 *(planned)*</p><p>**`MSFT` release**: July 2020 *(planned)*</p> |

While some of these extensions may start out as vendor-specific `MSFT` extensions, Microsoft and other OpenXR runtime vendors are working together to design cross-vendor `EXT` or `KHR` extensions for many of these feature areas.  This will enable the code you write for those features to be portable across runtime vendors, just as with the core specification.

## Get started with OpenXR

You can develop using OpenXR on a HoloLens 2 or Windows Mixed Reality immersive headset on the desktop.  If you don't have access to a headset, you can use the HoloLens 2 Emulator or the Windows Mixed Reality Simulator instead.

To start developing OpenXR applications for HoloLens 2 or immersive Windows Mixed Reality headsets, see [how to get started with OpenXR development](openxr-getting-started.md).

## See also

* <a href="https://www.khronos.org/openxr/" target="_blank">More information on OpenXR</a>
* <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html" target="_blank">OpenXR 1.0 specification</a>
* <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html" target="_blank">OpenXR 1.0 API reference</a>
* <a href="https://www.khronos.org/files/openxr-10-reference-guide.pdf" target="_blank">OpenXR 1.0 quick reference guide</a>

---
title: OpenXR
description: Build an engine using the portable OpenXR API standard and deploy it to Windows Mixed Reality and HoloLens 2 headsets.
author: thetuvix
ms.author: alexturn
ms.date: 7/29/2019
ms.topic: article
keywords: OpenXR, roadmap, extensions, Khronos, BasicXRApp, DirectX, native, native app, custom engine, middleware
---

# OpenXR

<img align="right" src="images/openxr.png" alt="OpenXR logo">

OpenXR is an open royalty-free API standard from <a href="https://www.khronos.org/" target="_blank">Khronos</a>, providing engines with native access to a range of devices across the [mixed reality spectrum](../../discover/mixed-reality.md).

You can develop using OpenXR on a HoloLens 2 or Windows Mixed Reality immersive headset on the desktop.  If you don't have access to a headset, you can use the HoloLens 2 Emulator or the Windows Mixed Reality Simulator instead.

## Why OpenXR?

With OpenXR, you can build engines that target both holographic devices, like HoloLens 2, and immersive devices, like Windows Mixed Reality headsets for desktop PCs. OpenXR lets you write code once that's then portable across a wide range of hardware platforms.

The OpenXR API uses a loader to connect your application directly to your headset's native platform support. End users get maximum performance and minimum latency, whether they're using a Windows Mixed Reality or any other headset.

## What is OpenXR?

The OpenXR API provides the core pose prediction, frame timing, and spatial input functionality you'll need to build an engine that can target both holographic and immersive devices.

To learn about the OpenXR API, check out the OpenXR 1.0 <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html" target="_blank">specification</a>, <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html" target="_blank">API reference</a>, and <a href="https://www.khronos.org/files/openxr-10-reference-guide.pdf" target="_blank">quick reference guide</a>.  For more information, see the <a href="https://www.khronos.org/openxr/" target="_blank">Khronos OpenXR page</a>.

To target the full feature set of HoloLens 2, you'll also use cross-vendor and vendor-specific OpenXR extensions that enable additional features beyond the OpenXR 1.0 core, such as articulated hand tracking, eye tracking, spatial mapping, and spatial anchors. For more information, see the [Roadmap section](#roadmap) below on the extensions coming later this year.

OpenXR isn't itself a mixed reality engine.  Instead, OpenXR enables engines like Unity and Unreal to write portable code once that can then access the native platform features of the user's holographic or immersive device, whatever vendor built that platform.

## Roadmap

The OpenXR specification defines an extension mechanism that enables runtime implementers to expose additional functionality beyond the [core features](#what-is-openxr) defined in the <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html" target="_blank">base OpenXR 1.0 specification</a>.

There are three kinds of OpenXR extensions:
* **Vendor extensions (for example, `MSFT`):** Enables per-vendor innovation in hardware or software features.  Any runtime vendor can introduce and ship a vendor extension at any time.
  * **Experimental vendor extensions (for example, `MSFT_preview`):** Experimental vendor extensions being previewed to gather feedback.  `MSFT_preview` extensions are for developer devices only and will be removed when the real extension ships.  To experiment with them, you can [enable preview extensions on your developer device](openxr-getting-started.md#using-preview-extensions).
* **Cross-vendor `EXT` extensions:** Cross-vendor extensions that multiple companies define and implement.  Groups of interested companies can introduce EXT extensions at any time.
* **Official `KHR` extensions:** Official Khronos extensions ratified as part of a core spec release.  KHR extensions are covered by the same license as the core spec itself.

The Windows Mixed Reality OpenXR Runtime supports a set of `MSFT` and `EXT` extensions that brings the full set of HoloLens 2 features to OpenXR applications:

| Feature area | Extension availability |
|--------------|------------------------|
| Systems + sessions | **OpenXR 1.0 core spec:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#instance" target="_blank">XrInstance</a></code>, <code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#system" target="_blank">XrSystemId</a></code>, <code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#session" target="_blank">XrSession</a></code> |
| [Reference spaces (view, local, stage)](../../design/coordinate-systems.md) | **OpenXR 1.0 core spec:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#spaces" target="_blank">XrSpace</a></code> |
| View configurations (mono, stereo) | **OpenXR 1.0 core spec:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#view_configurations" target="_blank">XrView...</a></code> |
| [Swapchains](../platform-capabilities-and-apis/rendering.md) + [frame timing](../platform-capabilities-and-apis/understanding-performance-for-mixed-reality.md) | **OpenXR 1.0 core spec:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#rendering" target="_blank">XrSwapchain...</a></code> + <code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#frame-synchronization" target="_blank">xrWaitFrame</a></code> |
| Composition layers<br />(projection, quad) | **OpenXR 1.0 core spec:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#compositing" target="_blank">XrCompositionLayer...</a></code> + <code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#frame-submission" target="_blank">xrEndFrame</a></code> |
| [Input and haptics](../../design/interaction-fundamentals.md) | **OpenXR 1.0 core spec:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#input" target="_blank">XrAction...</a></code> |
| Direct3D 11 integration | **Official `KHR` extension released:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_KHR_D3D11_enable" target="_blank">XR_KHR_D3D11_enable</a></code> |
| Direct3D 12 integration | **Official `KHR` extension released:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_KHR_D3D12_enable" target="_blank">XR_KHR_D3D12_enable</a></code> |
| [Unbounded reference space<br />(world-scale experiences)](../../design/coordinate-systems.md#building-a-world-scale-experience) | **`MSFT` extension released:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_unbounded_reference_space" target="_blank">XR_MSFT_unbounded_reference_space</a></code> |
| [Spatial anchors](../../design/spatial-anchors.md) | **`MSFT` extension released:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_spatial_anchor">XR_MSFT_spatial_anchor</a></code> |
| [Hand interaction<br />(grip/aim pose, air-tap, grasp)](../../design/hands-and-tools.md)<p>*HoloLens 2 only*</p> | **`MSFT` extension released:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_hand_interaction">XR_MSFT_hand_interaction</a></code> |
| [Hand articulation + hand mesh](../../design/hands-and-tools.md)<p>*HoloLens 2 only*</p> | <p>**`EXT` extension released in runtime 102:**<code><br /><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_EXT_hand_tracking">XR_EXT_hand_tracking</a></code></p>**`MSFT` extension released in runtime 102:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_hand_tracking_mesh">XR_MSFT_hand_tracking_mesh</a></code> |
| [Eye gaze](../../design/eye-tracking.md)<p>*HoloLens 2 only*</p> | **`EXT` extension released:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_EXT_eye_gaze_interaction" target="_blank">XR_EXT_eye_gaze_interaction</a></code> |
| Interop with other HoloLens SDKs<br />(for example, [QR](../platform-capabilities-and-apis/qr-code-tracking.md))<p>*HoloLens 2 only*</p> | <p>**`MSFT` extension released in runtime 102:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_spatial_graph_bridge">XR_MSFT_spatial_graph_bridge</a></code></p><p>**`MSFT` extension in runtime 105:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_perception_anchor_interop">XR_MSFT_perception_anchor_interop</a></code></p> |
| [Mixed Reality Capture<br />(third render from PV camera)](../platform-capabilities-and-apis/mixed-reality-capture-for-developers.md#render-from-the-pv-camera-opt-in)<p>*HoloLens 2 only*</p> | **`MSFT` extensions released in runtime 102:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_secondary_view_configuration">XR_MSFT_secondary_view_configuration</a></code><br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_first_person_observer">XR_MSFT_first_person_observer</a></code> |
| Interop with UWP CoreWindow API<br />(for example, for keyboard/mouse) | **`MSFT` extension released in runtime 103:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_holographic_window_attachment">XR_MSFT_holographic_window_attachment</a></code>
| Motion controller interaction profiles<br />(Samsung Odyssey and HP Reverb G2) | **`MSFT` extensions released in runtime 103:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_EXT_samsung_odyssey_controller">XR_EXT_samsung_odyssey_controller</a></code><br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_EXT_hp_mixed_reality_controller">XR_EXT_hp_mixed_reality_controller</a></code> |
| [Motion controller render models](../../design/motion-controllers.md#rendering-the-motion-controller-model) | **`MSFT` extension released in runtime 104:**<br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_controller_model">XR_MSFT_controller_model</a></code> |
| [Scene understanding (planes, meshes)](../../design/scene-understanding.md)<p>*HoloLens 2 only*</p> | <p>**As of runtime 102:**<br />Use <code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_MSFT_spatial_graph_bridge">XR_MSFT_spatial_graph_bridge</a></code> with [Scene Understanding SDK](../platform-capabilities-and-apis/scene-understanding-sdk.md)</p><p>**`MSFT` extension in [preview runtime 105](openxr-getting-started.md#using-preview-extensions):**<br /><code><a href="https://microsoft.github.io/OpenXR-MixedReality/openxr_preview/specs/openxr.html#XR_MSFT_scene_understanding_preview2">XR_MSFT_scene_understanding_preview2</a></code><br /><code><a href="https://microsoft.github.io/OpenXR-MixedReality/openxr_preview/specs/openxr.html#XR_MSFT_scene_understanding_serialization_preview">XR_MSFT_scene_understanding_serialization_preview</a></code></p> |
| [Composition layer reprojection modes<br />(auto-planar or orientation-only reprojection)](../platform-capabilities-and-apis/hologram-stability.md#reprojection) | **`MSFT` extension in [preview runtime 105](openxr-getting-started.md#using-preview-extensions):**<br /><code><a href="https://microsoft.github.io/OpenXR-MixedReality/openxr_preview/specs/openxr.html#XR_MSFT_composition_layer_reprojection_preview">XR_MSFT_composition_layer_reprojection_preview</a></code> |
| Other cross-vendor extensions | <p>**Official `KHR` extensions released:**</p><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_KHR_composition_layer_depth" target="_blank">XR_KHR_composition_layer_depth</a></code><br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_KHR_visibility_mask" target="_blank">XR_KHR_visibility_mask</a></code><br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_KHR_win32_convert_performance_counter_time" target="_blank">XR_KHR_win32_convert_performance_counter_time</a></code><br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_KHR_composition_layer_color_scale_bias" target="_blank">XR_KHR_composition_layer_color_scale_bias</a></code><p>**`EXT` extensions released:**</p><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_EXT_win32_appcontainer_compatible" target="_blank">XR_EXT_win32_appcontainer_compatible</a></code><br /><code><a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html#XR_EXT_debug_utils" target="_blank">XR_EXT_debug_utils</a></code> |

While some of these extensions may start out as vendor-specific `MSFT` extensions, Microsoft and other OpenXR runtime vendors are working together to design cross-vendor `EXT` or `KHR` extensions for many of these feature areas. Cross-vendor extensions will make the code you write for those features portable across runtime vendors, as with the core specification.

## Getting started with OpenXR

![Screenshot of Minecraft being played by a user wearing a mixed reality headset](images/openxr-minecraft.jpg)

*Minecraft's new RenderDragon engine has built its desktop VR support using OpenXR!*

Microsoft has been working with Unity and Epic Games to ensure the future of mixed reality is open, not just for HoloLens 2, but across the full breadth of PC VR, including [HP’s new Reverb G2 headset](https://www.microsoft.com/mixed-reality/windows-mixed-reality?rtc=1).  OpenXR powers the cross-vendor VR support for major titles shipping today, such as Minecraft and Microsoft Flight Simulator!  For more information on developing for HoloLens (1st gen), see the [release notes](/hololens/hololens1-release-notes).

To learn how you can get started with OpenXR in Unity, Unreal Engine or your own engine, read on!

### OpenXR in Unity

Today, the supported Unity development path for HoloLens 2, HoloLens (1st gen), and Windows Mixed Reality headsets is **Unity 2019 LTS** with the existing WinRT API backend.  You can jump into [OpenXR with Unity](../unity/openxr-getting-started.md); If you’re targeting the new HP Reverb G2 controller in a Unity 2019 app, see our [HP Reverb G2 input docs](../unity/unity-reverb-g2-controllers.md).

Starting with **Unity 2020 LTS**, [Unity ships an OpenXR backend](https://forum.unity.com/threads/unitys-plans-for-openxr.993225/) that supports HoloLens 2 and Windows Mixed Reality headsets.  This includes support for the OpenXR extensions that light up the [full capabilities of HoloLens 2 and Windows Mixed Reality headsets](#roadmap), including hand/eye tracking, spatial anchors and HP Reverb G2 controllers.  MRTK-Unity supports OpenXR as of [MRTK 2.7](../unity/tutorials/mr-learning-base-02.md?tabs=openxr#importing-the-mixed-reality-toolkit-and-configuring-the-unity-project).  For more about the current status of Unity 2020 LTS support for HoloLens 2, see [Choosing a Unity version](../unity/choosing-unity-version.md).

Starting in **Unity 2021**, OpenXR will then graduate to be the only supported Unity backend for targeting HoloLens 2 and Windows Mixed Reality headsets.

### OpenXR in Unreal Engine

As of **Unreal Engine 4.23**, full support for HoloLens 2 and Windows Mixed Reality headsets are available through the Windows Mixed Reality (WinRT) plugin.

Unreal Engine 4.23 was also the first major game engine release to ship preview support for OpenXR 1.0!  Now in **Unreal Engine 4.26**, support for HoloLens 2, Windows Mixed Reality and other desktop VR headsets is available through Unreal Engine's built-in OpenXR support.  Unreal Engine 4.26 also supports [Microsoft's OpenXR extension plugin](https://github.com/microsoft/Microsoft-OpenXR-Unreal), enabling hand interaction and HP Reverb G2 controller support, lighting up the [full feature set of HoloLens 2 and Windows Mixed Reality headsets](#roadmap).  Unreal Engine 4.26 is available today on the [Epic Games Launcher](https://www.unrealengine.com/download/creators), with MRTK-Unreal support coming later in April.


### OpenXR for native development

You can develop using OpenXR on a HoloLens 2 or Windows Mixed Reality immersive headset on the desktop.  If you don't have access to a headset, you can use the HoloLens 2 Emulator or the Windows Mixed Reality Simulator instead.

To start developing OpenXR applications for HoloLens 2 or immersive Windows Mixed Reality headsets, see [how to get started with OpenXR development](openxr-getting-started.md).

For a tour through all the major components of the OpenXR API, along with examples of the real-world applications using OpenXR today, check out this 60-minute walkthrough video:

>[!VIDEO https://channel9.msdn.com/Shows/Docs-Mixed-Reality/OpenXR-Cross-platform-native-mixed-reality/player?format=ny]

## See also

* <a href="https://www.khronos.org/openxr/" target="_blank">More information on OpenXR</a>
* <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html" target="_blank">OpenXR 1.0 specification</a>
* <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/man/html/openxr.html" target="_blank">OpenXR 1.0 API reference</a>
* <a href="https://www.khronos.org/files/openxr-10-reference-guide.pdf" target="_blank">OpenXR 1.0 quick reference guide</a>
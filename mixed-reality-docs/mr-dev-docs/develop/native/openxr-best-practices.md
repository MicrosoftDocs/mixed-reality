---
title: OpenXR best practices
description: Learn the best practices for visual quality, stability, and performance for your OpenXR applications.
author: thetuvix
ms.author: alexturn
ms.date: 2/28/2020
ms.topic: article
keywords: OpenXR, Khronos, BasicXRApp, DirectX, native, native app, custom engine, middleware, best practices, performance, quality, stability
---

# OpenXR app best practices

You can see an example of the best practices below in <a href="https://github.com/microsoft/OpenXR-MixedReality/tree/master/samples/BasicXrApp" target="_blank">BasicXrApp</a>'s OpenXRProgram.cpp file. The Run() function at the beginning captures a typical OpenXR app code flow from initialization to the event and rendering loop.

## Best practices for visual quality and stability

The best practices in this section describe how to get the best visual quality and stability in any OpenXR application.

For further performance recommendations specific to HoloLens 2, see the [Best practices for performance on HoloLens 2](#best-practices-for-performance-on-hololens-2) section below.

### Gamma-correct rendering

Care must be taken to ensure that your rendering pipeline is gamma-correct. When rendering to a swapchain, the render-target view format should match the swapchain format. For example, `DXGI_FORMAT_B8G8R8A8_UNORM_SRGB` for both the swapchain format and the render-target view.
There's an exception if the app's rendering pipeline does a manual sRGB conversion in shader code. The app should request an sRGB swapchain format but use the linear format for the render-target view. For example, request `DXGI_FORMAT_B8G8R8A8_UNORM_SRGB` as the swapchain format but use `DXGI_FORMAT_B8G8R8A8_UNORM` as the render-target view to prevent content from being double-gamma corrected.

### Submit depth buffer for projection layers

Always use `XR_KHR_composition_layer_depth` extension and submit the depth buffer together with the projection layer when submitting a frame to `xrEndFrame`.
Enabling hardware depth reprojection on HoloLens 2 improves hologram stability.

### Choose a reasonable depth range

Prefer a narrower depth range to scope the virtual content to help hologram stability on HoloLens.
For example, the OpenXrProgram.cpp sample is using 0.1 meters to 20 meters.
Use [reversed-Z](https://developer.nvidia.com/content/depth-precision-visualized) for a more uniform depth resolution.
On HoloLens 2, using the preferred `DXGI_FORMAT_D16_UNORM` depth format will help achieve better frame rate and performance, although 16-bit depth buffers provide less depth resolution than 24-bit depth buffers.
Following these best practices to make best use of the depth resolution becomes more important.

### Prepare for different environment blend modes

If your application will also run on immersive headsets that completely block out the world, be sure to enumerate supported environment blend modes using `xrEnumerateEnvironmentBlendModes` API, and prepare your rendering content correctly.
For example, for a system with `XR_ENVIRONMENT_BLEND_MODE_ADDITIVE` such as the HoloLens, the app should use transparent as the clear color, while for a system with `XR_ENVIRONMENT_BLEND_MODE_OPAQUE`, the app should render some opaque color or some virtual room in the background.

### Choose unbounded reference space as application's root space

Applications typically establish some root world coordinate space to connect views, actions, and holograms together.
Use `XR_REFERENCE_SPACE_TYPE_UNBOUNDED_MSFT` when the extension is supported to establish a [world-scale coordinate system](../../design/coordinate-systems.md#building-a-world-scale-experience), enabling your app to avoid undesired hologram drift when the user moves far (for example, 5 meters away) from where the app starts.
Use `XR_REFERENCE_SPACE_TYPE_LOCAL` as a fallback if the unbounded space extension doesn't exist.

### Associate hologram with spatial anchor

When using an unbounded reference space, holograms you place directly in that reference space [may drift as the user walks to distant rooms and then comes back](../../design/coordinate-systems.md#building-a-world-scale-experience).
For hologram users place at a discrete location in the world, [create a spatial anchor](../../design/spatial-anchors.md#best-practices) using the `xrCreateSpatialAnchorSpaceMSFT` extension function and position the hologram at its origin. That will keep that hologram independently stable over time.

### Support mixed reality capture

Although HoloLens 2's primary display uses additive environment blending, when the user starts [mixed reality capture](../advanced-concepts/mixed-reality-capture-overview.md), the app's rendering content will be alpha-blended with the environment video stream.
To achieve the best visual quality in mixed reality capture videos, it's best to set the `XR_COMPOSITION_LAYER_BLEND_TEXTURE_SOURCE_ALPHA_BIT` in your projection layer's `layerFlags`.

## Best practices for performance on HoloLens 2

As a mobile device with hardware reprojection support, HoloLens 2 has stricter requirements for optimal performance.  There are a number of ways to submit composition data through, which results in post-processing with a noticeable performance penalty.

### Select a swapchain format

Always enumerate supported pixel formats using `xrEnumerateSwapchainFormats`, and choose the first color and depth pixel format from the runtime that the app supports, because that's what the runtime prefers for optimal performance. Note, on HoloLens 2, `DXGI_FORMAT_B8G8R8A8_UNORM_SRGB` and `DXGI_FORMAT_D16_UNORM` is typically the first choice to achieve better rendering performance. This preference can be different on VR headsets running on a Desktop PC, where 24-bit depth buffers have less of a performance impact.
  
**Performance Warning:** Using a format other than the primary swapchain color format will result in runtime post-processing, which comes at a significant performance penalty.

### Render with recommended rendering parameters and frame timing

Always render with the recommended view configuration width/height (`recommendedImageRectWidth` and `recommendedImageRectHeight` from `XrViewConfigurationView`), and always use `xrLocateViews` API to query for the recommended view pose, FOV, and other rendering parameters before rendering.
Always use the `XrFrameEndInfo.predictedDisplayTime` from the latest `xrWaitFrame` call when querying for poses and views.
This allows HoloLens to adjust rendering and optimize visual quality for the person who is wearing the HoloLens.

### Use a single projection layer

HoloLens 2 has limited GPU power for rendering content and a hardware compositor optimized for a single projection layer.
Always using a single projection layer can help the application's framerate, hologram stability and visual quality.  
  
**Performance Warning:** Submitting anything but a single protection layer will result in runtime post-processing, which comes at a significant performance penalty.

### Render with texture array and VPRT

Create one `xrSwapchain` for both left and right eye using `arraySize=2` for color swapchain, and one for depth.
Render the left eye into slice 0 and the right eye into slice 1.
Use a shader with VPRT and instanced draw calls for stereoscopic rendering to minimize GPU load.
This also enables the runtime's optimization to achieve the best performance on HoloLens 2.
Alternatives to using a texture array, such as double-wide rendering or a separate swapchain per eye, will result in runtime post-processing, which comes at a significant performance penalty.

### Avoid quad layers

Rather than submitting quad layers as composition layers with `XrCompositionLayerQuad`, render the quad content directly into the projection swapchain.

**Performance Warning:** Providing additional layers beyond a single projection layer, such as quad layers, will result in runtime post-processing, which comes at a significant performance penalty.
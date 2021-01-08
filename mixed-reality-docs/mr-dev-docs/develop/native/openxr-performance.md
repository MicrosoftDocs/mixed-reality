---
title: OpenXR performance
description: Learn how to debug the GPU performance of your OpenXR mixed reality applications.
author: thetuvix
ms.author: alexturn
ms.date: 2/28/2020
ms.topic: article
keywords: OpenXR, Khronos, BasicXRApp, DirectX, native, native app, custom engine, middleware, performance, optimization, GPU debugging, RenderDoc, PIX
---

# OpenXR performance

On HoloLens 2, there are a number of ways to submit composition data through `xrEndFrame`, which can result in post-processing and noticeable performance penalties.

To avoid poor performance, [submit a single `XrCompositionProjectionLayer`](openxr-best-practices.md#use-a-single-projection-layer) with the following characteristics:

* [Use a texture array swapchain](openxr-best-practices.md#render-with-texture-array-and-vprt)
* [Use the primary color swapchain format](openxr-best-practices.md#select-a-swapchain-format)
* [Use the recommended view dimensions](openxr-best-practices.md#render-with-recommended-rendering-parameters-and-frame-timing)
* Don't set the `XR_COMPOSITION_LAYER_UNPREMULTIPLIED_ALPHA_BIT` flag
* Set the `XrCompositionLayerDepthInfoKHR` `minDepth` to 0.0f and `maxDepth` to 1.0f

For better performance, consider:

* [Using the 16-bit depth format](openxr-best-practices.md#choose-a-reasonable-depth-range)
* [Making instanced draw calls](openxr-best-practices.md#render-with-texture-array-and-vprt)

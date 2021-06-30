---
title: The Quality Fundamentals sample app
description: Learn about the Quality Fundamentals of designing mixed reality applications.
author: qianw211
ms.author: v-qianwen
ms.date: 06/30/2021
ms.topic: article
keywords: quality fundamentals, case study, project, sample, MRTK, Mixed Reality Toolkit, Unity, sample apps, example apps, open source, Microsoft Store, HoloLens, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# The Quality Fundamentals sample app

Welcome to the Quality Fundamentals sample application for HoloLens 2.  This sample app is a go to place for us to learn about the Quality Fundamentals of designing mixed reality applications.  You can experience performance issues in real-time by selecting the options provided in the app.

![Quality Fundamentals homepage](images\qf-homepage.jpg)

To install and download the app, see the [Quality Fundamentals](https://www.microsoft.com/p/quality-fundamentals/9mwz852q88fw?activetab=pivot:overviewtab) app download page.

In this sample app, you'll learn about:

>[!div class = "checklist"]
> * [Device I/O and environment.](#prerequisites)
> * [Spatial Anchors.](#set-up-your-development-environment)
> * [Holographic stability and fidelity.](#configure-services)
> * [3D assets](app-usage.md#arr-session-control-in-play-mode)

## Device I/O and environment

Start the Quality Fundamentals app on your HoloLens.  The app's homepage appears, and select **Device I/O and Environment**.  We will explore how the HoloLens sensors and the surrounding environment will affect spatial mapping, tracking and the placement of holograms. 

### Surfaces

Mirrors or surfaces with mirrored finishes can confuse the HoloLens sensors about the shape of the object.  Objects reflected on the surface may be interpreted by the device as changing environment, which can cause the device to loose tracking.  If mirrored surfaces are causing challenges for your HoloLens, consider adding a screen or closable blinds.

For more information, see [surfaces in a space](/hololens/hololens-environment-considerations#surfaces-in-a-space) in [HoloLens environment considerations](/hololens/hololens-environment-considerations).

### Lighting

Mixed reality uses visual light to track a user's location.  HoloLens sensors can be affected by either very low or very bright light conditions.  HoloLens sensors operate the best when the surrounding light is 500-1000 lux as measured by a luxmeter.

For more information, see [lighting](/hololens/hololens-environment-considerations#surfaces-in-a-space) in [HoloLens environment considerations](/hololens/hololens-environment-considerations).

## Anchor fundamentals

To explore how to use Spatial Anchors to align holograms to a physical space, select **Anchor Fundametals** on the app's homepage.

In this part of the app, we will explore the following user scenarios:

>[!div class = "checklist"]
> * What happens when no anchor is being applied to an object.
> * When multiple spatial anchors are being used for a group of objects.
> * Sharing a spatial anchor between multiple collaborators by using either a QR code.
> * Anchor placement for very large objects in a space.

For more information, see [spatial anchors](https://docs.microsoft.com/windows/mixed-reality/design/spatial-anchors) in the [mixed reality](https://docs.microsoft.com/windows/mixed-reality/design/spatial-anchors) documentation.

## Stability and fidelity

On the application's homepage, select **stability and fidelity** to learn about how to improve hologram stability.

The following key concepts will be explored:

>[!div class = "checklist"]
> * Frame rate.
> * Late stage reprojection (LSR).
> * Z-fighting.
> * Anti-aliasing.

### Frame rate

To provide the best hologram experience possible, application developers must maintain 60 frames per second (FPS).  In this part of the app, toggle between different triangle count options to experience the difference with various frame rates.

![Triangle count optimization](images\qf-triangle-count-optimization.png)

For more information, see [frame rate](/windows/mixed-reality/develop/platform-capabilities-and-apis/hologram-stability#frame-rate) in the [hologram stability](/windows/mixed-reality/develop/platform-capabilities-and-apis/hologram-stability) article.

### Late stage reprojection (LSR)

Reprojection adjusts for the motion and change of the point of view as a user moves.  Try out the different reprojection options provided by this part of the app to see the difference in hologram quality.

![Try the different reprojection options to experience the difference.](images\qf-lsr-modes.jpg)

For detailed information, see [reprojection](/windows/mixed-reality/develop/platform-capabilities-and-apis/hologram-stability#reprojection) in the [homogram stability](/windows/mixed-reality/develop/platform-capabilities-and-apis/hologram-stability) article.

### Z-fighting

Z-fighting occurs when the mixed reality application cannot discern which object is in front of the other.  You will notice flickering of the holographic objects as they fight for the same z-depth value.  Experience the effects of z-fighting in the app by changing the placement of a holographic object, the logo on a bicycle in this case.

![Experience z-fighting with object placements.](images\qf-z-fighting.jpg)

For detailed information about z-fighting, see [enable depth buffer sharing](/windows/mixed-reality/develop/unity/recommended-settings-for-unity#enable-depth-buffer-sharing) in the [recommended settings for Unity](/windows/mixed-reality/develop/unity/recommended-settings-for-unity) article.

### Anti-aliasing

In this part of the app, experience the affects of aliasing on displayed text and bicycle spokes.  

## 3D asset fundamentals

On the application's homepage, select **3D Asset Fundamentals** to explore how to optimize 3D assets to meet frame rate while maintaining high visual fidelity.

The following key concepts will be explored:

>[!div class = "checklist"]
> * Triangle count.
> * Shader passes.
> * Draw calls.
> * Finale.

### Triangle count

Select the number and complexity of bicycle models to experience the visual difference based on FPS.

![Choose different triangle count options to see the effects on frame rate.](images\qf-3d-asset-visible-triangles.jpg)

For more information, see [asset creation process](/windows/mixed-reality/design/asset-creation-process).

### Shader passes

Select the number of bikes, and different shader options to experience the visual difference based on FPS.

![Choose different shader options to see the effects on frame rate.](images\qf-3d-asset-shader-complexity.jpg)

For more information, see [MRTK Standard Shader](/windows/mixed-reality/mrtk-unity/features/rendering/mrtk-standard-shader).

### Draw calls

Draw calls are resource-intensive calls to the graphics card.  In this part of the app, experience the visual difference first hand, as the number of draw calls impact FPS.

![Draw calls should be optimized to boost performance.](images\qf-3d-asset-draw-calls.jpg)

See [CPU-to-GPU performance recommendations](/windows/mixed-reality/develop/unity/performance-recommendations-for-unity#cpu-to-gpu-performance-recommendations).

### Finale

Here, we can explore how many fully optimized bicycles can be displayed, and the level of fidelity possible given the optimization techniques.

![Optimization techniques used.](images\qf-3d-asset-finale.jpg)
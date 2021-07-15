---
title: Quality Fundamentals
description: Learn about the Quality Fundamentals of designing mixed reality applications.
author: qianw211
ms.author: v-qianwen
ms.date: 07/15/2021
ms.topic: article
keywords: quality fundamentals, case study, project, sample, MRTK, Mixed Reality Toolkit, Unity, sample apps, example apps, open source, Microsoft Store, HoloLens, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Quality Fundamentals

Quality Fundamentals is a HoloLens 2 app that demonstrates the fundamentals of building a great mixed reality experience.  Instead just learning and reading about quality issues in mixed reality, we can now experience common environmental, design, and performance issues and solutions firsthand by selecting the options provided in the app.

To download and install the app, go to the app download page:

> [!div class="nextstepaction"]
> [Quality Fundamentals](https://www.microsoft.com/p/quality-fundamentals/9mwz852q88fw?activetab=pivot:overviewtab)

![Quality Fundamentals homepage](images\qf-homepage.jpg)

In this sample app, we'll learn about:

>[!div class = "checklist"]
> * [Device I/O and environment](#device-io-and-environment): How the environmental factors can affect HoloLens' performance.
> * [Spatial Anchors](#anchor-fundamentals): How to align holograms to a physical space by using spatial anchors.
> * [Holographic stability and fidelity](#stability-and-fidelity): Explore techniques to help improve the stability and fidelity of Holograms.
> * [3D asset fundamentals](#3d-asset-fundamentals): How to optimize 3D assets to maintain high visual fidelity. 

## Device I/O and environment

Start the Quality Fundamentals app on HoloLens. Once the app's homepage appears, select **Device I/O and Environment**.  We'll explore how the HoloLens sensors and the surrounding environment affect spatial mapping, tracking and the placement of holograms. 

### Surfaces

Mirrors or surfaces with mirrored finishes can confuse the HoloLens sensors about the shape of the object.  Objects reflected on the surface may be interpreted by the device as changing environment, which can cause the device to lose tracking.  If mirrored surfaces are causing challenges for HoloLens, consider adding a screen or closable blinds.

For more information, see [surfaces in a space](/hololens/hololens-environment-considerations#surfaces-in-a-space) in [HoloLens environment considerations](/hololens/hololens-environment-considerations).

### Lighting

HoloLens performance can be negatively impacted by either very low or very bright light conditions.  The tracking sensors on the HoloLens need around 500-1000 lux of light to operate optimally. You can use a luxmeter or mobile app to measure the amount of light in your space.

For more information, see [lighting](/hololens/hololens-environment-considerations?branch=pr-en-us-3071#lighting) in [HoloLens environment considerations](/hololens/hololens-environment-considerations).

## Anchor fundamentals

To explore how to use Spatial Anchors to align holograms to a physical space, select **Anchor Fundametals** on the app's homepage.

In this part of the app, we'll explore the following user scenarios:

>[!div class = "checklist"]
> * What happens when no anchor is being applied to an object.
> * When multiple Spatial Anchors are being used for a group of objects.
> * Sharing a Spatial Anchor between multiple collaborators by using a QR code.
> * Anchor placement for very large objects in a space.

For more information, see [Spatial Anchors](/windows/mixed-reality/design/spatial-anchors) in the [Mixed Reality](/windows/mixed-reality/design/spatial-anchors) documentation.

## Stability and fidelity

On the application's homepage, select **Stability and Fidelity** to explore how to improve hologram stability.

We'll explore the following key concepts:

>[!div class = "checklist"]
> * [Frame rate](#frame-rate).
> * [Late stage reprojection (LSR)](#late-stage-reprojection-lsr).
> * [Z-fighting](#z-fighting).
> * [Anti-aliasing](#anti-aliasing).

### Frame rate

To provide the best hologram experience possible, application developers must maintain 60 frames per second (FPS).  In this part of the app, toggle between different triangle count options to experience the difference with various frame rates.

![Triangle count optimization](images\qf-triangle-count-optimization.png)

For more information, see [frame rate](/windows/mixed-reality/develop/platform-capabilities-and-apis/hologram-stability#frame-rate) in the [hologram stability](/windows/mixed-reality/develop/platform-capabilities-and-apis/hologram-stability) article.

### Late stage reprojection (LSR)

Reprojection is used to stabilize holograms as users move around their space.  Try out the different reprojection options provided by this part of the app to see the difference in hologram quality.

![Try the different reprojection options to experience the difference.](images\qf-lsr-modes.jpg)

For detailed information, see [reprojection](/windows/mixed-reality/develop/platform-capabilities-and-apis/hologram-stability#reprojection) in the [hologram stability](/windows/mixed-reality/develop/platform-capabilities-and-apis/hologram-stability) article.

### Z-fighting

Z-fighting occurs when the mixed reality application cannot discern which object is in front of the other.  You'll notice flickering of the holographic objects as they fight for the same z-depth value.  Experience the effects of z-fighting in the app by changing the placement of a holographic object, the logo on a bicycle in this case.

![Experience z-fighting with object placements.](images\qf-z-fighting.jpg)

For detailed information about z-fighting, see [enable depth buffer sharing](/windows/mixed-reality/develop/unity/recommended-settings-for-unity#enable-depth-buffer-sharing) in the [recommended settings for Unity](/windows/mixed-reality/develop/unity/recommended-settings-for-unity) article.

### Anti-aliasing

Anti-aliasing is a technique used to smooth jagged edges on curved lines and diagonals in holograms.  In this part of the app, experience the affects of aliasing on displayed text and bicycle spokes.  

## 3D asset fundamentals

On the application's homepage, select **3D Asset Fundamentals** to explore how to optimize 3D assets to meet the frame rate requirement while maintaining high visual fidelity.

We'll explore the following key concepts:

>[!div class = "checklist"]
> * [Triangle count](#triangle-count).
> * [Shader passes](#shader-passes).
> * [Draw calls](#draw-calls).
> * [Finale](#finale).

### Triangle count

Select the number and complexity of bicycle models to experience the visual difference based on FPS.

![Choose different triangle count options to see the effects on frame rate.](images\qf-3d-asset-visible-triangles.jpg)

For more information, see [asset creation process](/windows/mixed-reality/design/asset-creation-process).

### Shader passes

Select the number of bikes and different shader options to experience the visual difference based on FPS.

![Choose different shader options to see the effects on frame rate.](images\qf-3d-asset-shader-complexity.jpg)

For more information, see [MRTK Standard Shader](/windows/mixed-reality/mrtk-unity/features/rendering/mrtk-standard-shader).

### Draw calls

Draw calls are resource-intensive calls to the graphics card.  In this part of the app, experience the visual difference first hand, as the number of draw calls impact FPS.

![Draw calls should be optimized to boost performance.](images\qf-3d-asset-draw-calls.jpg)

See [CPU-to-GPU performance recommendations](/windows/mixed-reality/develop/unity/performance-recommendations-for-unity#cpu-to-gpu-performance-recommendations).

### Finale

Here, we can explore how many fully optimized bicycles can be displayed, and the level of fidelity possible given the optimization techniques.

![Optimization techniques used.](images\qf-3d-asset-finale.jpg)

## Next steps

Explore other mixed reality sample scenarios:

   > [!div class="nextstepaction"]
   > [Samples and feature apps](../features-and-samples.md)
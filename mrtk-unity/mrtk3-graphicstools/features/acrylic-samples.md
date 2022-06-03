---
title: Acrylic Sample Scene
description: Illustrated walkthrough of the Acrylic feature
author: Species521
ms.author: wettigmarti
ms.date: 06/02/2022
ms.localizationpriority: medium
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Graphics Tools, MRGT, MR Graphics Tools, Standard Shader, Animation
---

# Acrylic Samples

The experimental Acrylic feature adds a translucency effect to a surface.
Objects behind that surface will appear blurred as seen through frosted glass.


![Acrylic Sample scene](images/SampleScenes/Acrylic_01.jpg)


It is enabled by adding the "AcrylicHelpr.cs" script to your object and in Unity's shader menu under "Graphics Tools/Experimental/Acrylic", pick one of the shader options.
For more information about the this, have a look at the [Acrylic documentation](acrylic-layer-system.md).

## Acrylic in real-time


![Acrylic real-time sample](images/SampleScenes/Acrylic_sample_01.gif)

In this example, the shader reacts in realtime to the moving objects in the background.
While this is a powerful visual, please be aware that the real-time use is rather expensive in terms of performance.

## Acylic Pre-baked

![Acrylic pre-baked sample](images/SampleScenes/Acrylic_sample_02.jpg)

As a different option, Acrylic blurs a static background like the photos above beforehand.
The rounded plates on top of the photos act as stencil windows to make the pre-blurred image visible in that area.
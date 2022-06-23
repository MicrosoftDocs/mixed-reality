---
title: MeshOutline Sample Scene
description: Illustrated walkthrough of the MeshOutline features
author: Species521
ms.author: wettigmarti
ms.date: 06/23/2022
ms.localizationpriority: medium
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Graphics Tools, MRGT, MR Graphics Tools, Standard Shader, Animation, MeshOutlines, Outlines
---

# MeshOutline Examples

This scene illustrates the outline feature and its variation possibilities.
Outlines are a quick and appealing feature to highlight objects in a scene.
Besides colour and thickness we can further define the highlighting by adding animations and grading effects.


![Acrylic Sample scene](images/SampleScenes/OutlinesScene_01.gif)

To achieve the outline effect, add the MeshOutline or the MeshOutlineHierarchy script to the 3D object in the Inspector, set up the Outline Width and apply an outline material.
For guides on how to set up an outline material, please visit the [MeshOutline Material Setup](https://github.com/Species521/mixed-reality-pr_mawettig/blob/main/mrtk-unity/mrtk3-graphicstools/features/mesh-outlines.md#material-setup)

## Outline Pulse Example


<img src="images/SampleScenes/OutlinesRainbow_01.gif" width="50%" height="50%">

In this example, the Outline Width value is animated and applied to the object itself as Animator 'OutlinePulseController'.

![OutlinePulseController](images/SampleScenes/pulseAnimation_01.jpg)

> [!NOTE]
> Depending on the model's edge hardness, you might experience jagged and disrupted results. For the Outline effect to work properly, the model's vertex normals need to be smooth. If the model itself doesn't provide this, an in-editor solution might be to apply the MeshSmoother script to the model.
> [MeshSmoother](images/SampleScenes/MeshSmoother_01.jpg)

## Acrylic Pre-baked


<img src="images/SampleScenes/acrylic_sample_02.jpg" width="50%" height="50%">

As a different option, Acrylic blurs a static background like the photos above beforehand.
The rounded plates on top of the photos act as stencil windows to make the pre-blurred image visible in that area.
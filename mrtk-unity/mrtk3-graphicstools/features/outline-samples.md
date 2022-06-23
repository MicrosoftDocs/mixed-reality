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
Besides colour and thickness we can further define the highlighting by adding animations and gradient effects.



![MeshOutlineSampleScene](images/SampleScenes/OutlinesScene_01.gif)


To achieve the outline effect, add the MeshOutline script for single objects or the MeshOutlineHierarchy script for entire mesh hierarchies in the Inspector, set up the Outline Width and apply an outline material.

<img src="images/SampleScenes/outlineScripts_side-side_01.png" width="80%" height="80%">

For guides on how to set up an outline material, please visit the [MeshOutline Material Setup](https://github.com/Species521/mixed-reality-pr_mawettig/blob/main/mrtk-unity/mrtk3-graphicstools/features/mesh-outlines.md#material-setup)

## Outline Pulse Example

<img src="images/SampleScenes/OutlinesRainbow_01.gif" width="40%" height="40%">

In this example, the Outline Width value is animated and applied to the object itself as Animator 'OutlinePulseController'.

<img src="images/SampleScenes/pulseAnimation_01.jpg" width="40%" height="40%">

> [NOTE]
> Depending on the model's edge hardness, you might experience jagged and disrupted results. For the Outline effect to work properly, the model's vertex normals need to be smooth. If the model itself doesn't provide this, an in-editor solution might be to apply the MeshSmoother script to the model.
<img src="images/SampleScenes/MeshSmoother_01.jpg" width="40%" height="40%">

## Hierachies, multiple and skinned meshes

<img src="images/SampleScenes/OutlinesCat_01.gif" width="40%" height="40%">

Some imported 3D objects come in mutliple parts in hierarchical structures, in this case the model has several subnodes such as skeletal joints and unattached additional meshes. In order to avoid searching and applying through the entire hierarchy, the MeshOutlineHierarchy script needs merely to be added on the root object and all meshes inside that structure have the effect applied as well. 
As seen in this example, the outline works very well on skinned and animated meshes too.



As a different option, Acrylic blurs a static background like the photos above beforehand.
The rounded plates on top of the photos act as stencil windows to make the pre-blurred image visible in that area.
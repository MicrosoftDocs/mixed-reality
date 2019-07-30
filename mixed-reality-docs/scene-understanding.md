---
title: Scene understanding
description: Introduction to scene understanding capabilities for HoloLens
author: szymons
ms.author: szymons
ms.date: 07/08/19
ms.topic: article
keywords: Scene Understanding, Spatial Mapping, Windows Mixed Reality, Unity
---

# Scene understanding

Scene understanding provides Mixed Reality developers with a structured, high-level environment representation designed to make developing for environmentally aware applications intuitive. Scene understanding does this by combining the power of existing mixed reality runtimes such as the highly accurate less structured [spatial mapping](spatial-mapping.md) and new AI driven runtimes. By combining these technologies, Scene Understanding will generate representations of 3d environments that are much more similar to those you may have used in frameworks such as Unity or ARKit/ARCore. Scene understanding starts with a SceneProcessor which is updated by your application and contains Scene data. Today the technology is capable of generating 3 distinct but related object categories: simplified watertight environment meshes that infer the planar room structure without clutter, plane regions for placement that we call Quads, and a snapshot of the [spatial mapping](spatial-mapping.md) mesh that aligns with the Quads/Watertight data that we surface.

![Spatial mapping mesh, labeled planar surfaces, watertight mesh](images/SUScenarios.png)

This document is intended to provide a scenario overview and to clarify the relationship that scene understanding and spatial mapping share. For details on how scene understanding works and how to develop for it, please see the scene understanding [SDK overview](scene-understanding-SDK.md) documentation.

## Device support

<table>
<tr>
<th>Feature</th><th style="width:150px"> <a href="hololens-hardware-details.md">HoloLens (1st gen)</a></th><th style="width:150px">HoloLens 2</th><th style="width:150px"> <a href="immersive-headset-hardware-details.md">Immersive headsets</a></th>
</tr><tr>
<td> Scene Understanding</td><td style="text-align: center;">️</td><td style="text-align: center;"> ✔️</td><td style="text-align: center;"></td>
</tr>
</table>

## Common usage scenarios

![Illustrations of common Spatial Mapping usage scenarios: Placement, Occlusion, Physics and Navigation](images/sm-concepts-1000px.png)

Many of the core scenarios for environment aware applications (Placement, Occlusion, Physics etc...) are addressable by both Spatial Mapping and Scene Understanding, this section aims to highlight the differences. The core difference between Scene Understanding and Spatial Mapping is a tradeoff of latency to structure and simplicity. If your application requires low-latency un-structured meshes you will want to access spatial mapping directly, however if you are performing higher level processing you may consider switching to the Scene Understanding model as it should provide you with a superset of functionality.

 The following sections re-visit the core spatial mapping scenarios in the context of the new scene understanding SDK.

### Placement

Scene Understanding provides new constructs specifically designed to simplify placement scenarios. A Scene can compute primitives called SceneQuads which describe flat surfaces on which holograms can be placed. SceneQuads have specifically been designed around placement and describe a 2D surface, and provide an API for placement on that surface. Previously, when using the triangle mesh to perform placement, one had to scan all areas of the quad and perform hole filling/post-processing to identify good locations for object placement. This is not always necessary with Quads, as the Scene Understanding runtime is capable of inferring which areas of the quad that were not scanned, and invalidate areas of the quad that are not part of the surface.

<figure><img src="images/SUQuads.png" alt="SceneQuads with inference disabled, capturing placement areas for scanned regions." />
<figcaption>SceneQuads with inference disabled, capturing placement areas for scanned regions.</figcaption></figure>

<figure><img src="images/SUWatertight.png" alt="Quads with inference enabled, placement is no longer limited to scanned areas." />
<figcaption>Quads with inference enabled, placement is no longer limited to scanned areas.</figcaption></figure>
&nbsp;
If your application intends to place 2D or 3D holograms on rigid structures of your environment, the simplicity and convenience of SceneQuads for placement is be preferable to computing this information from the Surface mesh. For more details on this topic, please see the [Scene Understanding SDK reference](scene-understanding-SDK.md)

**Note** For legacy code that depends on the surface mesh, a Scene can be computed that contains spatial mapping output along with SceneQuads, ensuring that any legacy requirements for placement can be maintained. If scene understanding mesh data does not satisfy your application's latency requirements, we recommend you continue to use the spatial mapping APIs documented here: [Spatial Mapping Placement](spatial-mapping.md#Placement)

### Occlusion

[Spatial Mapping Occlusion](spatial-mapping.md#Occlusion) remains the most accurate way to capture the real-time state of the environment. Using Spatial Mapping for occlusion alongside Scene Understanding for more complex tasks (such as placement, physics or navigation) is supported and recommended for most applications.

However, while Spatial Mapping meshes are accurate, they suffer some limitations that Scene Understanding watertight meshes do not. Specifically, Scene Understanding meshes will automatically fill un-scanned regions to ensure the occlusion is watertight, secondly it supports mesh ranges beyond the maximum runtime Surface Reconstruction maximum radius. If real-time updates are not required (for example, in an environment expected to be static), applications may consider using the Scene Understanding watertight mesh and the Boundless Mesh in unison. This would produce the best of both worlds as it would render occlusion for planar scene structure and more organic data that the watertight mesh cannot support.

### Physics

Scene Understanding generates watertight meshes that decompose space with semantics specifically to address many limitations to physics that surface meshes impose. Watertight structures ensure physics ray casts always hit, and semantic decomposition allows for simpler generation of nav meshes for indoor navigation. As described in the section on [occlusion](#Occlusion) creating a Scene with EnableSceneObjectMeshes and EnableWorldMesh will produce the most physically complete mesh possible. The watertight property of the environment mesh will prevent hit tests from failing to hit surfaces and the mesh data will ensure that physics are interacting with all objects in the scene and not just the room structure.

### Navigation

Planar meshes decomposed by semantic class are ideal constructs for navigation and path planning, easing many of the issues described in the [Spatial Mapping Navigation](spatial-mapping.md#Navigation) overview. The SceneMesh objects computed in the Scene are already de-composed by surface type ensuring that nav-mesh generation is limited to surfaces that can be walked on. Due to the simplicity of the floor structure, dynamic nav-mesh generation in 3d engines such as Unity are attainable depending on real-time requirements.

Generating accurate nav-meshes currently still requires post-processing, namely applications must still project occluders on to the floor to ensure that navigation does not pass through clutter/tables etc... The most accurate way to accomplish this is to project the world mesh data which is provided if the Scene is computed with the EnableWorldMesh flag.

### Visualization

While [Spatial Mapping Visualization](spatial-mapping.md#Visualization) can be used for real-time feedback of the environment, there are many scenarios where the simplicity of planar and watertight objects provides more performance or visual quality. Shadow projection and grounding techniques that are described using spatial mapping may be more pleasing if projected on the planar surfaces provided by Quads or the planar watertight mesh. This is especially true for environments/scenarios where through pre-scanning is not optimal due to the fact that the Scene will infer, and complete environments and planar assumptions will minimize artifacts.

Additionally, the total number of surfaces returned by Spatial Mapping is limited, while Scene Understanding is only limited by memory with respect to the size of the volume requested. Because of this, Scene Understanding is more suited to capturing mesh representations for larger spaces (for example, larger than a single room) for visualization or further mesh processing. The world mesh returned with EnableWorldMesh will have a consistent level of detail throughout, which may yield a more pleasing visualization if rendered as wireframe.

## Developing with the Scene Understanding Scene Understanding SDK and MRTK

While MRTK is a great entry point to Scene Understanding, the range of scenarios that might make use Scene Understanding are so varied that we expect many developers to build solutions that access Scene Understanding using the Scene Understanding SDK directly. The varied scenarios that Scene Understanding is used for, room measurement, slate/hologram placement, room analysis for application interaction, occlusion rendering, mesh analysis etc... have such varied usage/memory/timing patterns that are best implemented directly. Because we expect many developers to access the SDK, the APIs were designed in a high level and intuitive manner that will hopefully make development with real world environments easier than ever before. We highly recommend for developers to get familiar with the SDK documentation [here](scene-understanding-SDK.md).

### See Also

* [Scene Understanding SDK](scene-understanding-SDK.md)
* [Spatial mapping](spatial-mapping.md)

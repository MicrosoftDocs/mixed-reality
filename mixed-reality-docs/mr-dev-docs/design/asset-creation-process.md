---
title: Asset creation process
description: Learn how to create, purchase, and port assets for mixed reality experiences.
author: sean-kerawala
ms.author: sekerawa
ms.date: 03/21/2018
ms.topic: article
keywords: asset, creation, process, budget, polygons, textures, shaders, performance, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens, MRTK, Mixed Reality Toolkit, assets
---

# Asset creation process

Windows Mixed Reality builds on the decades of investment Microsoft has made into DirectX. All of the experience and skills developers have with building 3D graphics continues to be valuable with HoloLens.

The assets you create for a project come in many shapes and forms. They can be composed of a series of textures/images, audio, video, 3D models, and animations. We can't begin to cover all the tools that are available to create the different types of assets used in a project. For this article, we'll focus on 3D asset creation methods.

![Concept, creation, integration and iteration flow](images/concept-creation-integration-iteration-flow-640px.jpg)<br>
*Concept, creation, integration, and iteration flow*

## Things to consider

When looking at the experience, you're trying to create,  think of it as a **budget** that you can spend to try to create the best experience. There aren't necessarily any hard limits on the number of **polygons** or **material types** you can use in your assets. Think of it more as a budgeted set of tradeoffs.

Below is an example budget for your experience. Performance isn't a single point of failure, but death by a thousand cuts.
<br>

<table>
<tr>
<th><b>Assets</b></th><th> CPU</th><th> GPU</th><th> Memory</th>
</tr><tr>
<td> Polygons</td><td> 0%</td><td> 5%</td><td> 10%</td>
</tr><tr>
<td> Textures</td><td> 5%</td><td> 15%</td><td>25%</td>
</tr><tr>
<td> Shaders</td><td> 15%</td><td> 35%</td><td> 0%</td>
</tr><tr>
<td> <b>Dynamics</b></td><td></td><td></td><td></td>
</tr><tr>
<td> Physics</td><td> 5%</td><td> 15%</td><td> 0%</td>
</tr><tr>
<td> Real-time lighting</td><td> 10%</td><td> 0%</td><td> 0%</td>
</tr><tr>
<td> Media (audio/video)</td><td> -</td><td> 15%</td><td> 25%</td>
</tr><tr>
<td> Script/logic</td><td> 25%</td><td> 0%</td><td> 5%</td>
</tr><tr>
<td> General overhead</td><td> 5%</td><td> 5%</td><td> 5%</td>
</tr><tr>
<td> <b>Total</b></td><td> <b>65%</b></td><td> <b>90%</b></td><td> <b>70%</b></td>
</tr>
</table>

**Total number of assets**
* How many assets are active in the scene?

**Complexity of assets**
* How many triangles / polygons?
* How complex is the shader? When using the Mixed Reality Toolkit, it's recommended to use the [Mixed Reality Toolkit Standard shader](/windows/mixed-reality/mrtk-unity/mrtk2/features/rendering/mrtk-standard-shader) to reduce shader complexity.

Both the developers and artists have to consider the capabilities of the device and the graphics engine. Microsoft HoloLens has all of the computational and graphics built into the device. It shares the capabilities developers would find on a mobile platform.

The asset creation process is the same whether your experience targets a [holographic device or an immersive device](../discover/mixed-reality.md#the-mixed-reality-spectrum). The primary thing to note is the device capability and scale. You can see the real world in mixed reality, so you'll want to maintain the correct scale based on the experience.

## Authoring assets

We'll start with the ways to get assets for your project:
1. Creating Assets (Authoring tools and object capture)
2. Purchasing Assets (Buying assets online)
3. Porting Assets (Taking existing assets)
4. Outsourcing Assets (Importing assets from third parties)

### Creating assets

**Authoring tools**<br>
First you can create your own assets in several different ways. 3D artists use various applications and tools to create models, which consist of **meshes**, **textures**, and **materials**. This is then saved in a file format that can be imported or used by the graphics engine used by the app, such as **.FBX** or **.OBJ**. Any tool that generates a model that your chosen graphics engine supports will work on **HoloLens**. Among 3D artists, many choose to use [Autodesk’s Maya because it can use HoloLens](https://www.youtube.com/watch?v=q0K3n0Gf8mA) to transform the way assets are created. If you want to get something in quick, you can also use [3D Builder](https://developer.microsoft.com/windows/hardware/3d-print/3d-builder-resources) that comes with Windows to export .OBJ for use in your application.

**Object capture**<br>
There's also the option to capture objects in 3D. Capturing inanimate objects in 3D and editing them with digital content creation software is increasingly popular with the rise of 3D printing. Using the **Kinect 2** sensor and [3D Builder](https://developer.microsoft.com/windows/hardware/3d-print/3d-builder-resources) you can use the capture feature to create assets from real world objects. This is also a [suite of tools](https://en.wikipedia.org/wiki/Comparison_of_photogrammetry_software) to do the same with **photogrammetry** by processing several images to stitch together and mesh and textures.

### Purchasing assets

Another excellent option is to purchase assets for your experience. There are a ton of assets available through services such as the [Unity Asset Store](https://www.assetstore.unity3d.com/) or [TurboSquid](https://www.turbosquid.com/) among others.

When you purchase assets from a third party, you always want to check the following properties:
* **What's the poly count?**
  * Does it fit within your budget?
* **Are there levels of detail (LODs) for the model?**
  * A models level of detail lets you scale the detail of a model for performance.
* **Is the source file available?**
  * Not included with [Unity Asset Store](https://www.assetstore.unity3d.com/) but always included with services like [TurboSquid](https://www.turbosquid.com/).
  * Without the source file, you can't modify the asset.
  * Make sure the source file provided can be imported by your 3D tools.
* **Know what you're getting**
  * Are animations provided?
  * Make sure to check the contents list of the asset you're purchasing.

### Porting assets

In some cases you'll be handed existing assets that were originally built for other devices and different apps. In most cases, these assets can be converted to formats compatible with the graphics engine their app is using.

When porting assets to use in your HoloLens application, you'll want to ask the following questions:
* **Can you import directly or does need to be converted to another format?** Check the format you're importing with the graphics engine you're using.
* **If converting to a compatible format is anything lost?** Sometimes details can be lost or importing can cause artifacts that need to be cleaned up in a 3D authoring tool.
* **What is the triangle / polygon count for the asset?** Based on the budget for your application you can use [Simplygon](https://www.simplygon.com/) or similar tools to decimate (procedurally or manually reduce poly count) the original asset to fit within your applications budget.

### Outsourcing assets

Another option for larger projects that require more assets than your team is equipped to create is to outsource asset creation. The process of outsourcing involves finding the right studio or agency that specializes in outsourcing assets. This can be the most expensive option but also be the most flexible in what you get.
* **Clearly define what you're requesting**
  * Provide as much detail as possible
  * Front, side, and back concept images
  * Reference art showing asset in context
  * Scale of object (Usually specified in centimeters)
* **Provide a Budget**
  * Poly count range
  * Number of textures
  * Type of shader (For Unity and HoloLens you should always default to mobile shaders first)
* **Understand the costs**
  * What's the outsourcing policy for change requests?

Outsourcing can work well based on your projects timeline but requires more oversight to guarantee that you get the right assets you need the first time.

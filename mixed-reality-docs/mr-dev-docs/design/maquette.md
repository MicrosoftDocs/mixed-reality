---
title: Microsoft Maquette Beta overview
description: Microsoft Maquette makes spatial prototyping easy, quick, and immersive. Maquette provides VR developers with various tools & assets to construct & iterate ideas in space.
author: qianw211
ms.author: qianwen
ms.date: 6/28/2022
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, get started, setup, Mixed Reality Portal, Maquette
---

# Microsoft Maquette Beta overview

>[!Note]
>Microsoft is not actively developing Microsoft Maquette at this time, and the access to the application in the store will be discontinued. Microsoft will apply the learnings from building the application and the feedback from the community to enable better tools for Mixed Reality content creation in the future. While there are no plans to open source any of Maquette's source code, we will continue to offer the application as a download here. We want to thank the community for the journey and support.

   > [!div class="nextstepaction"]
   > [Download the Maquette app package](https://aka.ms/MaquetteDownloadAppPackage)

&nbsp;

> [!VIDEO https://docs.microsoft.com/en-us/shows/Docs-Mixed-Reality/Maquette-Teaser/player]

Microsoft Maquette makes spatial prototyping easy, quick, and immersive. As a VR developer, you can use the various tools and assets that Maquette provides to construct and iterate ideas in space. 

- Import images & 3D content, and export Maquette content for use in other tools. 
- Design Incredible Immersive Interfaces, Spaces, & Experiences. 
- Bring Maquette Content Into Unity With the Unity Add-on. 

## Getting started with Maquette 

Here is a list of Maquette tutorial videos in alphabetical order:

* [Interacting with UI](/shows/Docs-Mixed-Reality/Maquette-Hand-UI) 
* [Moving around](/shows/Docs-Mixed-Reality/Maquette-Swimming)
* [Teleporting](/shows/Docs-Mixed-Reality/Maquette-Teleporting)
* [Manipulating content](/shows/Docs-Mixed-Reality/Maquette-Object-Manipulation)
* [Rotational snapping](/shows/Docs-Mixed-Reality/Maquette-Rotational-Snapping)
* [Surface snapping](/shows/Docs-Mixed-Reality/Maquette-Surface-Snapping)
* [Duplicating content](/shows/Docs-Mixed-Reality/Maquette-Duplicating-Content)
* [Erasing content](/shows/Docs-Mixed-Reality/Maquette-Erasing-Content)
* [Selecting content](/shows/Docs-Mixed-Reality/Maquette-Selecting-Content)
* [Needle selection](/shows/Docs-Mixed-Reality/Maquette-Needle-Selection)
* [Grouping content](/shows/Docs-Mixed-Reality/Maquette-Grouping-Content)
* [Gimbal positioning](/shows/Docs-Mixed-Reality/Maquette-Gimbal)
* [Bounding manipulation](/shows/Docs-Mixed-Reality/Maquette-Bounding-Manipulation)
* [Orientation tool](/shows/Docs-Mixed-Reality/Maquette-Orientation-Tool)
* [Coloring content](/shows/Docs-Mixed-Reality/Maquette-Coloring-Content)
* [Lighting](/shows/Docs-Mixed-Reality/Maquette-Lighting)
* [Hull brush](/shows/Docs-Mixed-Reality/Maquette-Hull-Brush)
* [Volume brush](/shows/Docs-Mixed-Reality/Maquette-Volume-Brush)
* [Tube brush](/shows/Docs-Mixed-Reality/Maquette-Tube-Brush)
* [Parametric objects](/shows/Docs-Mixed-Reality/Maquette-Parametric-Objects)
* [Lock object](/shows/Docs-Mixed-Reality/Maquette-Lock-Object)

## Export content from Maquette

### Part 1 - Export content from Maquette

1. Use the Select Tool to highlight what you want to export to Unity. 

1. Highlight your desired content, and select the **Export** icon at the bottom of the Select menu on your hand. 

1. In the context menu that appears, rename the content for export, and select Export to either .FBX, .GLB, or .GLTF file types. 

1. A File Explorer window will appear on your desktop showing your exported files, and you can always find Maquette's exported files in **~Documents/Maquette/Exports/**

### Part 2 - Import the Maquette Unity Add-On into Unity

The Maquette Unity Editor Add-On package ensures .FBX and .GLTF files exported from Maquette appear in Unity in the same way they appear in Maquette. Without importing this package, Unity will not display Maquette's materials and images. 

1. Open the Unity project where you intend to use your Maquette content within. 

1. In the Unity taskbar, select **Assets > Import Package > Custom Package**, and open the Microsoft Maquette Unity Editor Add-On package, downloaded from the button above. 

1. Select **Import** at the bottom right of the window that appears. 

>[!div class="nextstepaction"] 
>[Download the Unity Add-on](https://aka.ms/MaquetteDownloadAddOn) 

### Part 3 - Import Maquette Content into Unity with the Unity Add-On 

1. Import the Maquette Unity Editor Add-On package (See the section below for more info) into your Unity project. 

1. Bring your .FBX, .GLB, or .GLTF files exported from Maquette into your Unity project. Unity will preserve the grouping hierarchy of your content, and the materials and images as they appear in Maquette, with your imported the Microsoft Maquette Unity Editor Add-On. 

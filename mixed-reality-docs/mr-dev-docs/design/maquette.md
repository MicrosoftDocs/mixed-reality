---
title: Microsoft Maquette 
description: Microsoft Maquette makes spatial prototyping easy, quick, and immersive. Maquette provides VR developers with a variety of tools & assets to construct & iterate ideas in space.
author: qianw211
ms.author: v-qianwen
ms.date: 10/6/2021
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, get started, setup, Mixed Reality Portal, Maquette
---

# Overview

>[!Note]
>Microsoft is not actively developing Microsoft Maquette at this time. The learnings from building the application and the feedback of the community will enable Microsoft to build better tools for content creation in a Mixed Reality context in the future. There are no plans to open source any of Maquette’s source code. The access to the application through the store has to cease at some point in the future. We want to thank the community for the journey and support and hope to keep Maquette available as a download here.

Microsoft Maquette makes spatial prototyping easy, quick, and immersive. Maquette provides VR developers with a variety of tools & assets to construct & iterate ideas in space. 

- Import images & 3D content, and export Maquette content for use in other tools. 
- Design Incredible Immersive Interfaces, Spaces, & Experiences. 
- Bring Maquette Content Into Unity With the Unity Add-on. 

***\< insert Maquette video seen here: Microsoft Maquette Beta – Home \>***

>[!div class="nextstepaction"] 
>[Join the Microsoft Maquette Steam Community discussion today!](https://steamcommunity.com/app/967490/discussions/)

## Getting started with Maquette 

>[!div class="nextstepaction"] 
>[View Maquette Tutorials](https://www.youtube.com/watch?v=Hkr1lBgHdl0&list=PLUucYl60vaTG76sN9RG8NZNe54Bsoy2G5) 

### Export content from Maquette

## Part 1 - Export content from Maquette

1. Use the Select Tool to highlight what you want to export to Unity. 

1. With your desired content highlighted, click the Export icon at the bottom of the Select menu on your hand. 

1. In the context menu that appears, rename the content for export, and select Export to either .FBX, .GLB, or .GLTF. 

1. A File Explorer window will appear on your desktop showing your newly-exported files, and you can always find Maquette's exported files in **~Documents/Maquette/Exports/**

## Part 2 - Import the Maquette Unity Add-On into Unity

The Maquette Unity Editor Add-On package ensures .FBX and .GLTF files exported from Maquette appear in Unity in the same way they appear in Maquette. Without importing this package, Unity will not display Maquette's materials and images, so it's important to import this package into any Unity project you plan to import Maquette FBX's and GLTF's into. 

1. Open the Unity project where you intend to use your Maquette content within. 

1. In the Unity taskbar, click Assets > Import Package > Custom Package, and open the Microsoft Maquette Unity Editor Add-On package, downloaded from the button above. 

1. Click Import at the bottom right of the window that appears. 

>[!div class="nextstepaction"] 
>[Download the Unity Add-on](https://www.maquette.ms/asset/MaquetteUnityEditorAddon.unitypackage) 

## Part 3 - Import Maquette Content into Unity with the Unity Add-On 

1. Import the Maquette Unity Editor Add-On package (See the section below for more info) into your Unity project. 

1. Bring your .FBX, .GLB, or .GLTF files exported from Maquette into your Unity project. Unity will preserve the grouping hierarchy of your content, as well as the materials and images as they appear in Maquette, so long as you've imported the Microsoft Maquette Unity Editor Add-On. 
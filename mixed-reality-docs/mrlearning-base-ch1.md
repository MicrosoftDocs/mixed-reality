---
title: MR Learning Base Module Project Initialization and First Application
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# MR Learning Base Module Project Initialization and First Application

## Device support

<table>
<tr>
<th>Course</th><th style="width:150px"> <a href="hololens-hardware-details.md">HoloLens (1st Gen)</a></th><th style="width:150px"> <a href="immersive-headset-hardware-details.md">Immersive headsets</a></th><th style="width:150px"> <a href="hololens-hardware-details.md">HoloLens 2</a></th>
</tr><tr>
<td></td><td style="text-align: center;"> </td><td style="text-align: center;"> </td><td style="text-align: center;"> ✔️</td>
</tr>
</table>

## Before you start

### Prerequisites

* A Windows 10 PC configured with the correct [tools installed](install-the-tools.md).
* Minimum Windows 10 version of xxxxx.xxxx
* Some basic C# programming ability.
* A HoloLens 2 device [configured for development](using-visual-studio.md#enabling-developer-mode).

### Project files

* Download the [files](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-210-Gaze.zip) required by the project. Requires Unity 2018.3 or later.
* Un-archive the files to your desktop or other easy to reach location.

>[!NOTE]
>If you want to look through the source code before downloading, it's [available on GitHub](https://github.com/Microsoft/HolographicAcademy/tree/Holograms-210-Gaze).

### Errata and Notes

* In Visual Studio, "Just My Code" needs to be disabled (unchecked) under Tools->Options->Debugging in order to hit breakpoints in your code.
In this lesson, we’ll cover initialization of your Unity project, importing the Mixed Reality Toolkit, and deploying your first application.

## Chapter 1 - Create a new project

### Objectives

* Optimize Unity for HoloLens development.
* Import assets and setup the scene.
* View the astronaut in the HoloLens.

### Instructions

1. Start Unity.
2. Select **New**.
3. Enter a project name (e.g. "MixedRealityBase").
4. Enter a location to save your project.
5. Make sure the project is set to **3D**.
6. Click **Create Project**.

### Import the Mixed Reality Toolkit

1. Download the [Mixed Reality Toolkit]() unity package and save it to a folder on your PC.
2. Import the Mixed Reality Toolkit package by clicking on Assets>Import>Custom Package. Find the Mixed Reality Toolkit package downloaded in Step 1 and open it to begin the importing process.
3. In the next pop-up window, click “Import” to begin importing the Mixed Reality Toolkit. Ensure all items are checked, as shown in the image.

### Configure the Mixed Reality Toolkit

1. Configure the Mixed Toolkit by selecting from the menu bar Mixed Reality Toolkit > Configure.
2. Your scene will now have several new items and modifications in it from the Mixed Reality Toolkit. Save your scene under a different name by clicking on File>Save As and give your scene a name, e.g., BaseScene. Keep your scene organized by saving it to the “Scenes” folder in your project’s Assets folder.

### Configure the Unity project for Windows Mixed Reality
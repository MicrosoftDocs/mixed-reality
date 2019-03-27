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

* Download the [files](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-210-Gaze.zip) required by the project. Requires Unity 2017.2 or later.
* Un-archive the files to your desktop or other easy to reach location.

>[!NOTE]
>If you want to look through the source code before downloading, it's [available on GitHub](https://github.com/Microsoft/HolographicAcademy/tree/Holograms-210-Gaze).

### Errata and Notes

* In Visual Studio, "Just My Code" needs to be disabled (unchecked) under Tools->Options->Debugging in order to hit breakpoints in your code.
In this lesson, we’ll cover initialization of your Unity project, importing the Mixed Reality Toolkit, and deploying your first application.

## Chapter 1 - Create a new project


---
title: MR Learning Base Module User Interface, Hand Tracking, and Mixed Reality Toolkit Configuration
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# MR Learning Base Module User Interface, Hand Tracking, and Mixed Reality Toolkit Configuration

In the previous lesson, we learned some of the capabilities the MRTK had to offer, with starting your first application for the HoloLens 2. In this next lesson we’ll learn how to create and organize buttons along with UI text panels and use default interaction (touch) to interact with each button. We will also include some minor code that will allow you to customize your buttons, (like change the size, sound and color). To give more customizability, we will show how to modify these profiles by turning off the visualization of the spatial mesh. 

## Objectives

* O
* I
* V

## Instructions

### How to Configure the Mixed-Reality Toolkit Profiles

1. Select Mixed-Reality Toolkit (MRTK) from the “BaseScene” hierarchy. From there, you should see the “Mixed Reality Toolkit Script.” It should also say “active profile” underneath. Double click on it to open it.

![MR213_BuildSettings](images/mrlearning-base-ch2-1step1im.png)

>[!Note]
>By default, all of the profiles are not editable. These are default profiles that you can copy and customize. There are several layers of customization and profiles, so in order to change a profile you’ll need to copy and customize several profiles. Before any of this, however, we need to disable the visibility of the spatial mapping mesh.

1. Select **New**.
1. Enter a project name (e.g. "MixedRealityBase").
1. Enter a location to save your project.
1. Make sure the project is set to **3D**.
1. Click **Create Project**.
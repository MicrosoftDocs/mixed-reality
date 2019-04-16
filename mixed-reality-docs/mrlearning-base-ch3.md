---
title: MR Learning Base Module Dynamic Content Placement and Solvers
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# MR Learning Base Module Dynamic Content Placement and Solvers

Holograms come to life in the HoloLens 2 when they intuitively follow the user and are placed in the physical environment in a way that makes interaction seamless and elegant. In Lesson 3, we will explore ways to dynamically place holograms using the MRTK’s available placement tools, known as “solvers.” They are known as “solvers” for the way they solve complex spatial placement algorithms. In the MRTK, solvers are a system of scripts and behaviors that we use to be able to allow UI elements to follow you, the user or other game objects in the scene. They can also be used to snap to certain positions quickly, making your application more intuitive. 

## Objectives

* O
* I
* V

## Instructions

### Location of solvers in the MRTK
 To find the available solvers in your project, look in the MRTK SDK folder (MixedRealityToolkit.SDK folder), then under the utilities folder you will see the solvers folder, as shown in the image below.

![Solvers](images/lesson3_chapter1_step1im.PNG)

>Note: In this lesson we will only go over implementation of the “Orbital” solver and the “RadialView” solver. To learn more about the full range of solvers available in the MRTK, please visit: https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_Solver.html

### Use a Solver to Follow the User
The goal of this chapter is to enhance the button collection we previously created such that it follows the user’s gaze direction. In previous version of the MRTK and HoloToolkit, this was referred to as a “taglong” functionality.

1. Select the Button Collection parent object from the previous lesson.

![Lesson3 Chapter2 Step1im](images/Lesson3_chapter2_step1im.PNG)

2. In the inspector panel, click the “add component” button and search for “orbital.” The orbital component should appear. Select it to add the orbital component to the Button Collection game object.

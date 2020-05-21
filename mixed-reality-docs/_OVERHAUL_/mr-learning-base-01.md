---
title: Getting started tutorials - 1. Overview and objectives
description: This course shows you how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
ms.localizationpriority: high
---

<!-- TODO: Sync entire Introduction page with Base and Sharing -->
# 1. Introduction

<!-- TODO: Most likely remove this section, design seems outdated and not seeing it being used in new tutorials. Waiting confirmation from MS
## Device support
-->

## Overview
<!-- TODO: update wording to match the tutorials -->
<!-- TODO: Give overview of the application -->
Welcome to the first of three series of Hololens 2 tutorials. In this twelve-part series you will learn about some of the capabilities the <a href="https://github.com/microsoft/MixedRealityToolkit-Unity" target="_blank"> Mixed Reality Toolkit (MRTK)</a> has to offer and leverage the power it holds to build a RoverModule experience.

In the next series [Azure Spatial Anchors tutorials](mr-learning-asa-01.md), we will cover the basics of ASA and leverage the power it holds to anchor our experience in the real world.

In the last series [Multi-user capabilities tutorials](mr-learning-sharing-01.md), you will learn how to leverage the power of Photon and ASA to make a shared experience that updates in real time.

Tutorials in this series:

* [Initializing your project and first application](mr-learning-base-02.md) - You will start your first application for the HoloLens 2, and deploy it to the device.
* [Configure the Mixed Reality Toolkit](mr-learning-base-03.md) - You will learn how to configure the MRTK profile giving greater flexibility in the applications you can create.
* [Positioning objects in scene](mr-learning-base-04.md) - You will learn about positioning 3D objects for Mixed Reality applications.
* [Scene understanding](mr-learning-base-05.md) - You will learn the basics of scene understanding.
* [Interacting with 3D objects](mr-learning-base-06.md) - You will learn the different ways of interacting with 3D objects.
* [Adding tooltips to scene](mr-learning-base-07.md) - You will learn how to set up tooltips and how useful they are.
* [Creating user interface](mr-learning-base-08.md) - You will learn how to set up UI with MRTK assets or how to replace MRTK assets with your own.
* [Using solvers](mr-learning-base-09.md) - You will learn the massive potential of solvers and how to use them.
* [Using Voice Commands](mr-learning-base-10.md) - You will learn how to set up custom voice commands.
* [Using eye Tracking](mr-learning-base-11.md) - You will learn how to use eye tracking.
* [Functionality to drive rover](mr-learning-base-12.md) - You will finalize the app you have been build to this point.
* [Build your application to a mobile device](mr-learning-base-13.md) - You will learn how to build an MRTK project to a mobile device.

## Objectives

<!-- TODO: Update to exact wording used in the following tutorials' Objectives section and add any missing objectives -->
<!-- TODO: see if this list can be condensed -->
* Configure Unity for HoloLens development
* Import assets and set up the scene
* Visualization of the spatial mapping mesh, hand meshes, and the framerate counter
* Customize and configure Mixed Reality Toolkit profiles
* Create a panel of 3D objects which will be used for the other learning objectives
* Implement bounding boxes
* Configure 3D objects for basic manipulation such as move, rotate, and scale
* Explore near and far interaction
* Learn about additional hand tracking gestures, such as grab and touch
* Interact with holograms using UI elements and buttons
* Basic hand-tracking input and interactions
* Introduce the MRTK's Solvers
* Use Solvers to have a collection of buttons follow the user
* Use Solvers to have a game object follow the user's tracked hands
* Trigger events using voice commands and keywords
* Use tracked hands to pan textures and 3D objects with tracked hands
* Leverage HoloLens 2 eye tracking capabilities to select objects
* Combine multiple concepts from previous lessons to create a unique experience
* Learn how to toggle objects
* Trigger complex events using pressable buttons
* Use rigidbody physics and forces
* Explore the use of tool tips

## Prerequisites

* A Windows 10 PC configured with the correct [tools installed](install-the-tools.md)
* Windows 10 SDK 10.0.18362.0 or later
* A HoloLens 2 device [configured for development](using-visual-studio.md#enabling-developer-mode)
* <a href="https://docs.unity3d.com/Manual/GettingStartedInstallingHub.html" target="_blank">Unity Hub</a> with Unity 2019.3.X installed and the Universal Windows Platform Build Support module added

> [!IMPORTANT]
> The recommended Unity version for this tutorial series is Unity 2019.3.X. This supersedes any Unity version requirements or recommendations stated in the prerequisites linked above.

<!-- TODO: Consider adding a 'What you will create' section with animations/images-->
[Next lesson: 2. Initializing your project and first application](mr-learning-base-02.md)

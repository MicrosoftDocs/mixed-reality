---
title: Getting started tutorials - 3. Configuring the MRTK profiles
description: This course shows you how to configure the Mixed Reality Toolkit (MRTK) profiles.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/05/2021
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens, MRTK, mixed reality toolkit, UWP, spatial awareness
ms.localizationpriority: high
---

# 3. Configuring the MRTK profiles

## Overview

In this tutorial, you will learn how to customize and configure the MRTK profiles.

The <a href="/windows/mixed-reality/mrtk-docs/features/profiles/profiles.md" target="_blank">MRTK profiles</a> is a tree of nested profiles that make up the configuration information for how the MRTK systems and features should be initialized. The top-level profile, the Configuration Profile, contains nested profiles for each of the primary core systems. Each nested profile is designed to configure the behavior of their corresponding system.

This particular example will show you how to hide the spatial awareness mesh by changing the settings of the Spatial Mesh Observer. However, you may follow these same principles to customize any setting or value in the MRTK profiles.

As you experienced when you deployed your project to your HoloLens 2 during the [previous tutorial](mr-learning-base-02.md#congratulations), the <a href="/windows/mixed-reality/mrtk-docs/features/spatial-awareness/spatial-awareness-getting-started.md" target="_blank">Spatial Awareness</a> mesh is a collection of meshes representing the geometry of the environment. It's a helpful visualization to see initially but it's typically turned off to avoid the visual distraction and the additional performance hit of having it on.

## Objectives

* Learn how to customize and configure MRTK profiles
* Hide the spatial awareness mesh

## Changing the Spatial Awareness Display Option

The main steps you will take to hide the spatial awareness mesh are:

1. Clone the default Configuration Profile
2. Enable the Spatial Awareness System
3. Clone the default Spatial Awareness System Profile
4. Clone the default Spatial Awareness Mesh Observer Profile
5. Change the visibility of the spatial awareness mesh

> [!NOTE]
> By default, the MRTK profiles are not editable. These are default profile templates that you have to clone before they can be edited. There are several nested layers of profiles. Therefore, it is common to clone and edit several profiles when configuring one or more settings.

## Congratulations

In this tutorial, you learned how to clone, customize, and configure MRTK profiles and settings.

> [!div class="nextstepaction"]
> [Next Tutorial: 4. Positioning objects in the scene](mr-learning-base-04.md)
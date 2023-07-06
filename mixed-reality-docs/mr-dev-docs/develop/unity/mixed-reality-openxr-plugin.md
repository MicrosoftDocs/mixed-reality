---
title: Add the Mixed Reality OpenXR Plugin to your Unity project
description: Learn how to add the Mixed Reality OpenXR Plugin to your Unity project.
author: satyapoojasama
ms.author: vinnietieto
ms.date: 03/24/2022
ms.topic: article
keywords: Unity, mixed reality, development, getting started, new project, Windows Mixed Reality, XR, Unity 2020, Unity 2019, OpenXR
---

# Add the Mixed Reality OpenXR Plugin to your existing Unity project

If you have a Unity project that's already set up for OpenXR (you have the Unity OpenXR plugin installed and configured) and you want to add the capability to target your app for HoloLens 2 or Windows Mixed Reality headsets, follow the instructions below.

**To determine if your project has the Mixed Reality OpenXR plugin installed**:

1. In Unity, on the menu bar, select **Edit** > **Project Settings**.
1. Ensure that you're on the **XR Plug-in Management** page with the Universal Windows Platform settings (Windows logo tab) displayed.
1. If **Microsoft HoloLens feature group** is grayed out or doesn't exist, the Mixed Reality OpenXR plugin isn't installed.

    :::image type="content" source="images/028-ms-hololens-feature-group.png" alt-text="Screenshot of XR Plug-in Management window.":::
1. If the plugin is installed, proceed to the section named [configure the project to use the Mixed Reality OpenXR Plugin](#configure-the-project-to-use-the-mixed-reality-openxr-plugin). Otherwise, continue to follow the instructions below.

[!INCLUDE[](includes/xr/use-mrft-install-mr-openxr.md)]

## Configure the project to use the Mixed Reality OpenXR Plugin
- If you're targeting HoloLens 2, see [configure for HoloLens 2 via Project Validation ](new-openxr-project-without-mrtk.md#configure-the-project-for-the-hololens-2-via-project-validation-mr-openxr-16) for further instructions. Alternatively, to apply recommended settings by hand, see [configure for HoloLens 2 manually](new-openxr-project-without-mrtk.md#configure-the-project-for-the-hololens-2-manually).
- If you're targeting Windows Mixed Reality headsets, see [configure for desktop VR](new-openxr-project-without-mrtk.md#configure-the-project-for-desktop-vr).

## See also

- [Set up a new OpenXR project with MRTK](new-openxr-project-with-mrtk.md)
- [Set up a new OpenXR project without MRTK](new-openxr-project-without-mrtk.md)

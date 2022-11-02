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

If you have a Unity project that's already set up for OpenXR (you have the Unity OpenXR plugin installed and configured) and you want to add the capability to target your app for the HoloLens 2, follow the instructions below.

**To determine if your project has the Mixed Reality OpenXR plugin installed**:

1. In Unity, on the menu bar, select **Edit** > **Project Settings**.
1. Ensure that you're on the **XR Plug-in Management** page with the Universal Windows Platform settings (Windows logo tab) displayed.
1. If **Microsoft Hololens feature group** is grayed out or doesn't exist, the Mixed Reality OpenXR plugin isn't installed.

    :::image type="content" source="images/028-ms-hololens-feature-group.png" alt-text="Screenshot of XR Plug-in Management window.":::

[!INCLUDE[](includes/xr/use-mrft-install-mr-openxr.md)]

## Configure the project to use the Mixed Reality OpenXR Plugin
1. In Unity, ensure that you're in the **Project Settings** window, on the **XR Plug-in Management** page, and in the **Universal Windows Platform** tab (if targeting HoloLens 2) or the **Standalone** tab (if targeting Desktop VR).
1. There are now several feature groups underneath **OpenXR**. Select **Microsoft HoloLens feature group**(if targeting HoloLens 2) or **Windows Mixed Reality feature group** (if targeting Desktop VR).
1.  Close the **Project Settings** window.

## See also

- [Set up a new OpenXR project with MRTK](new-openxr-project-with-mrtk.md)
- [Set up a new OpenXR project without MRTK](new-openxr-project-without-mrtk.md)

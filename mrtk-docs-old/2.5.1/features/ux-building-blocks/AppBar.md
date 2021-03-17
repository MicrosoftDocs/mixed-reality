---
title: AppBar
description: Overview on App Bar in MRTK
author: CDiaz-MS
ms.author: cadia
ms.date: 01/12/2021
ms.localizationpriority: medium
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, App bar,
---

# App bar

![App bar](../images/app-bar/MRTK_AppBar_Main.png)

App bar is a UI component that is used together with the [bounds control](BoundsControl.md) script. It adds button controls to an object with the intent to manipulate it. Using the 'Adjust' button, the bounds control interface for an object can be de- / activated. The "Remove" button should remove the object from the scene.

## How to use app bar

Drag and drop `AppBar` (Assets/MRTK/SDK/Features/UX/Prefabs/AppBar/AppBar.prefab) into the scene hierarchy. In the inspector panel of the component, assign any object with a bounds control as the *Target Bounding Box* to add the app bar to it.

**Important:** The bounds control activation option for the target object should be 'Activate Manually'.

<img src="../images/app-bar/MRTK_AppBar_Setup1.png" width="450" alt="Setup 1">

<img src="../images/app-bar/MRTK_AppBar_Setup2.png" width="450" alt="Setup 2">

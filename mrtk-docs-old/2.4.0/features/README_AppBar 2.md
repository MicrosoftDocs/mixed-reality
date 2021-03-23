---
title: README_AppBar
description: Overview on App Bar in MRTK
author: CDiaz-MS
ms.author: cadia
ms.date: 01/12/2021
ms.localizationpriority: medium
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, App bar,
---

# App bar

![App bar](Images/AppBar/MRTK_AppBar_Main.png)

App bar is a UI component that is used together with the [bounding box](README_BoundingBox.md) script. It adds button controls to an object with the intent to manipulate it. Using the 'Adjust' button, the bounding box interface for an object can be de- / activated. The "Remove" button should remove the object from the scene.

## How to use app bar

Drag and drop `AppBar` (Assets/MRTK/SDK/Features/UX/Prefabs/AppBar/AppBar.prefab) into the scene hierarchy. In the inspector panel of the component, assign any object with a bounding box as the *Target Bounding Box* to add the app bar to it.

**Important:** The bounding box activation option for the target object should be 'Activate Manually'.

<img src="Images/AppBar/MRTK_AppBar_Setup1.png" width="450" alt="App Bar Setup 1">

<img src="Images/AppBar/MRTK_AppBar_Setup2.png" width="450" alt="App Bar Setup 2">

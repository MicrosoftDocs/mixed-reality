---
title: Build window
description: Documentation on using the build window in MRTK for Unity.
author: cre8ivepark
ms.author: dongpark
ms.date: 04/06/2021
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, build, build window, tools
---

# Build window &#8212; MRTK2

![Build & deploy flow](images/MRTK_BuildWindow0.png)

MRTK's build window make it easy to build & deploy your MRTK-Unity projects. With a single button click, you can build Unity project and generate Visual Studio solution(.SLN), UWP App package(.APPX), and install the app package on the device. 


## Unity Build Options
![Build window - Unity Build Options 1](images/MRTK_BuildWindow1.png)

These scenes are from the Unity Build Settings. You can change the target device type using the dropdown menu.

## Appx Build Options
![Build window - Appx Build Options 2](images/MRTK_BuildWindow2.png)

This tab shows the configuration for the Visual Studio solution. To enabled HoloLens 2's eye-tracking input capability, check **Gaze Input Capability** option. 

You can assign .glb file in the **3D App Launcher Model** field for custom 3D app launcher icon. See [3D app launcher design guideline](/windows/mixed-reality/distribute/3d-app-launcher-design-guidance) for more information.

By default, **Auto Increment** is checked in the Versioning Options. AppX versions will be automatically incremented.


## Deploy Options
![Build window - Deploy Options 3](images/MRTK_BuildWindow3.png)

In this tab, you can connect to the device by entering username and password for the Device Portal. 

On the bottom of the page, you can find list of the app packages that has been created. 


---
title: MRTK next Release Notes
description: release notes of the next MRTK version
author: RogPodge
ms.author: roliu
ms.date: 03/25/2021
ms.localizationpriority: medium
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, XRSDK, Legacy XR
---

# Microsoft Mixed Reality Toolkit vNext Release Notes

## What's new in vNext

### Scene Content System

### Legacy XR and XR SDK Data Providers can now be used within the same profile

Data providers will now also only be loaded when the appropriate pipeline is selected, allowing both Legacy XR and XRSDK data providers to co-exist within 
the same profile. To accomdate this, Legacy XR and XR SDK Data Providers are now organized under different tabs within the profile view, helping users 
determine whether they have the correct profile for their targetted XR pipeline.

![Legacy and XR SDK data providers can now be unified under a single profile](../features/images/xrsdk/LegacyAndXrsdkUnified.png)

To accommodate this null data providers will now no longer be loaded and displayed in the profile inspector. Users can toggle `Show null data providers in the profile inspector`
under **Edit -> Project Settings -> Mixed Reality Toolkit** to debug unexpected behaviors with missing data providers.

![Null data providers are now hidden by default](https://user-images.githubusercontent.com/39840334/115093658-ead24600-9ecf-11eb-91c2-486a37f69aba.png)
![Toggle show null data providers in the profile inspector](https://user-images.githubusercontent.com/39840334/115093670-f6257180-9ecf-11eb-96ec-ffe44a225a55.png)

### Added Experience Settings and an associated Mixed Reality Scene Content behavior

Users can now configure [Experience Settings](../features/experience-settings/experience-settings.md), which will allow MRTK to display [Mixed Reality Scene Content](../features/experience-settings/scene-content.md)
appropriately based on the targeted experience.

If user's previous Experience Scale settings do not match the new Experience Settings Profile, they will be prompted to correct it in the inspector

![Experience Scale Migration](https://user-images.githubusercontent.com/39840334/114946863-d70bde80-9e00-11eb-9859-fa40d40d2b36.gif)

### Teleport Hotspot added

A new teleport hotspot component has been graduated. You can add a teleport hotspot to your gameobject to ensure that the user is in a certain position and orientation when they teleport to that location.

[Teleport Hotspot example](images/TeleportHotspot.gif)

### Added support for Leap Motion Unity Modules version 4.6.0, 4.7.0 and 4.7.1

Support for the latest versions of the [Leap Motion Unity Modules](https://developer.leapmotion.com/unity) is now compatible with MRTK 2.7.0.  See [How to Configure MRTK for Leap Motion](../features/cross-platform/leap-motion-mrtk.md) for more information. 

### Targetted speech events raised no longer restricted to gaze pointers.

Previously, targetted speech events could only be raised on objects which were focused on with the gaze pointer. Now, objects can recieve speech events if they are focused by any pointer.

[Speech Events with Far Pointers](https://user-images.githubusercontent.com/39840334/117516612-6fa00500-af4e-11eb-94ba-d5fb2ed4e7de.gif)

### Notable Bugfixes and Changes

- Pinch detection made smoother. It is now harder to accidentally drop the pinch gesture. [#9576](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9576)
- Objects with the Object Manipulator component now consistently maintain velocity on release when the flag is set. [#9733](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9733)
- Backstrafing now checks for a floor, helping prevent situations where the camera can clip into the environment or where the user is left hovering over empty space.[#9697](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9697)
- IsNearObject is now a virtual property, allowing more flexibility when extending the sphere or poke pointer. [#9803](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9803)
- Buttons now display the proper keyword when showing the available speech command. [#9824](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9824)
- Oculus Controllers now uses it's own standalone visualizer, preventing the MRTK visualization from clashing with the Oculus Integration Package's visualization. [#9589](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9589)


## Known Issues

### Text Mesh Pro Canvas Renderer warnings in Unity 2020

The following warning is logged in most MRTK example scenes while using Unity 2020:

```
Please remove the CanvasRenderer component from the [TextMeshPro] GameObject as this component is no longer necessary.
```

The Canvas Renderer warning was added in [TextMeshPro version 3.0.3](https://docs.unity3d.com/Packages/com.unity.textmeshpro@3.0/changelog/CHANGELOG.html#changes-3).  These warning do not have an impact on MRTK's example scenes and can be cleared from the console. See [Issue 9811](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/9811) for more details. 

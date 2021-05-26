---
title: MRTK next Release Notes
description: release notes of the next MRTK version
author: RogPodge
ms.author: roliu
ms.date: 03/25/2021
ms.localizationpriority: medium
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK,
---

# Microsoft Mixed Reality Toolkit vNext Release Notes

## What's new in vNext

### Scene Content System

Many VR applications have a notion of "FloorHeight", which ensures that when moving across a surface, the position of the floor relative to the user's head remains the same. In 2.7, we've added a new component, MixedRealitySceneContent. This allows objects with this component to have their placement be tailored for AR/VR, and other experience scales, allowing us to account for things like FloorHeight on VR platforms

With this, properties such as Target Experience Scale and Content offset were consolidated under the Experience Settings within the MRTK profile. 

[MixedRealityToolkit Experience Settings](images/ExperienceSettingsProfile.png)


### Targetted speech events raised no longer restricted to gaze pointers.

Previously, targetted speech events could only be raised on objects which were focused on with the gaze pointer. Now, objects can recieve speech events if they are focused by any pointer.

[Speech Events with Far Pointers](https://user-images.githubusercontent.com/39840334/117516612-6fa00500-af4e-11eb-94ba-d5fb2ed4e7de.gif)

### Teleport Hotspot added

The teleport hotspot component has been graduated. You can add a teleport hotspot to your gameobject to ensure that the user is in a certain position and orientation when they teleport to that location.

[Teleport Hotspot example](images/TeleportHotspot.gif)

### Notable Bugfixes and Changes

- Pinch detection made smoother. It is now harder to accidentally drop the pinch gesture. [#9576](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9576)
- Objects with the Object Manipulator component now consistently maintain velocity on release when the flag is set. [#9733](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9733)
- Backstrafing now checks for a floor, helping prevent situations where the camera can clip into the environment or where the user is left hovering over empty space.[#9697](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9697)
- IsNearObject is now a virtual property, allowing more flexibility when extending the sphere or poke pointer. [#9803](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9803)
- Buttons now display the proper keyword when showing the available speech command. [#9824](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9824)
- Oculus Controllers now uses it's own standalone visualizer, preventing the MRTK visualization from clashing with the Oculus Integration Package's visualization. [#9589](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9589)
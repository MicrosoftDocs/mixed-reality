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

### Legacy XR and XR SDK Data Providers can now be used within the same profile

Data providers will now also only be loaded when the appropriate pipeline is selected, allowing both Legacy XR and XRSDK data providers to co-exist within 
the same profile. To accomdate this, Legacy XR and XR SDK Data Providers are now organized under different tabs within the profile view, helping users 
determine whether they have the correct profile for their targetted XR pipeline.

![Legacy and XR SDK data providers can now be unified under a single profile](../features/images/xrsdk/LegacyAndXrsdkUnified.png)

To accommodate this null data providers will now no longer be loaded and displayed in the profile inspector. Users can toggle `Show null data providers in the profile inspector`
under **Edit -> Project Settings -> Mixed Reality Toolkit** to debug unexpected behaviors with missing data providers.

![Null data providers are now hidden by default](https://user-images.githubusercontent.com/39840334/115093658-ead24600-9ecf-11eb-91c2-486a37f69aba.png)
![Toggle show null data providers in the profile inspector](https://user-images.githubusercontent.com/39840334/115093670-f6257180-9ecf-11eb-96ec-ffe44a225a55.png)

### Teleport Hotspot added

A new teleport hotspot component has been graduated. You can add a teleport hotspot to your gameobject to ensure that the user is in a certain position and orientation when they teleport to that location.

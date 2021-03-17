---
title: TeleportSystemOverview
description: Overview on Enabling and disabling Teleport system in MRTK
author: RogPodge
ms.author: roliu
ms.date: 01/12/2021
ms.localizationpriority: medium
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Teleport system,
---

# Teleport Hot Spot [Experimental]

The teleport hotspot is a component you can add to your gameobject to ensure that the user is in a certain position and orientation when they teleport to that location.

## Usage

### How to create a teleport hotspot

To create a teleport hotspot, add the TeleportHotspot component to an object which also has a collider component. 

![TeleportHotspotComponent](../features/images/teleport/TeleportHotspotComponent.png)

Now, the teleport pointer's indicator will change color when it's directed over a TeleportHotspot. When the teleport action is completed over the hotspot, the user will teleport
to the center of the TeleportHotspot.

If the override orientation flag is checked off, the user's orientation will match that of the teleport hotspot.

![TeleportHotspotExample](../features/images/teleport/TeleportHotspotExample.gif)

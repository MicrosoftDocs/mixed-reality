---
title: Spatial Anchors in Unreal
description: Guide to using spatial anchors in Unreal
author: sw5813
ms.author: jacksonf
ms.date: 5/5/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, mixed reality, development, features, documentation, guides, holograms, spatial anchors
---
# Spatial Anchors in Unreal

Spatial anchors are used to persist holograms in real-world space between application sessions.  This gets surfaced through Unreal as ARPins and gets saved in the HoloLens’ anchor store to be loaded in future sessions. 

Before saving or loading anchors, first check that the anchor store is ready.  Attempting to call any of the HoloLens anchor functions before the anchor store is ready will not succeed.  

![Spatial Anchors Store Ready](images/unreal-spatialanchors-store-ready.PNG)

## Save Anchors

Once the application has a component that needs to be pinned to the world, it can be saved to the anchor store with the following sequence: 

![Spatial Anchors Save](images/unreal-spatialanchors-save.PNG)

Here, we are spawning an actor at a known location, creating an ARPin with that location and a name based on the actor’s class, adding the actor to the ARPin, and saving the pin to the HoloLens anchor store.  The anchor name we choose must be unique, so in this example we append the current timestamp.  If the anchor successfully saves to the anchor store, it can be inspected in the HoloLens device portal under System > Map manager > Anchor Files Saved On Device. 

## Load Anchors

When an application starts, the following blueprint can be called to restore components to their anchor locations:

![Spatial Anchors Load](images/unreal-spatialanchors-load.PNG)

In this example, we iterate over all of the anchors in the anchor store, spawn an actor at identity, and pin that actor to the ARPin from the anchor store.  It is important to spawn the actor at identity since the anchor is responsible for repositioning the hologram in the world based on where it was saved, so any transform added here will add an offset to the anchor. 

The anchor ID is also queried so that different actors can be spawned depending on the anchor’s saved name. 

## Remove Anchors 

When done with an anchor, the entire anchor store can be cleared, or individual anchors can be removed from the anchor store so they are not included in future sessions: 

![Spatial Anchors Remove](images/unreal-spatialanchors-remove.PNG)

## See also
* [Spatial anchors](spatial-anchors.md)
* [Coordinate systems](coordinate-systems.md)

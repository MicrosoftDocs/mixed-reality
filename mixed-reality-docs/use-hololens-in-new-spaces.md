---
title: Use HoloLens in New Spaces
description: HoloLens learns what a space looks like over time. Users can facilitate this process by moving the HoloLens in certain ways through the space.
author: dorreneb
ms.author: dobrown
ms.date: 08/16/2019
ms.topic: article
keywords: Windows Mixed Reality, design, spatial mapping, HoloLens, surface reconstruction, mesh, head tracking, mapping
---

# Use HoloLens in New Spaces

HoloLens *maps*, or learns information about, its environment as the user moves around a space. Over time, the HoloLens builds up a *spatial map* of all parts of the environment that have been observed. HoloLens updates the map as changes in the environment are observed. This scan will automatically persist between app launches.

HoloLens will create and update maps as long as the device is on and a user is logged in. If you hold or wear the device with the cameras pointed at a space, the device will try to map the area. While the HoloLens will learn a space naturally over time, there are tips and tricks available to map the space faster and more efficiently. 

If your HoloLens can’t map your space or is out of calibration, you may enter Limited mode. In Limited mode, you won’t be able to place holograms in your surroundings.

## Tips and tricks for mapping spaces

### Make sure the space is set up for mixed reality

Features in an environment can make it difficult for the HoloLens to interpret a space. Light levels, materials in the space, the layout of objects, and more can all affect how HoloLens maps an area.

Tips for setting up your space for HoloLens and other mixed reality devices can be found in [Environment considerations for HoloLens](environment-considerations-for-hololens.md).

### Understand the scenarios for the area

It is important to spend the most time where you will be using the HoloLens so that the map is relevant and complete. 

For example, if a user scenario for HoloLens involves moving from Point A to Point B, walk that path two to three times, looking in all directions as you move. 

### Walk slowly around the space

If you walk too quickly around the area, it's likely that the HoloLens will miss mapping areas. Walk slowly around the space, stopping every 5-8 feet to look around at your surroundings.

Smooth movements also help the HoloLens map more effeciently.

### Look in all directions

Looking around as you map the space gives the HoloLens more data on where points are relative to each other. 

If you don't look up, for example, the HoloLens may not know where the ceiling in a room is. 

Don't forget to look down at the floor as you map the space.

### Cover key areas multiple times

Moving through an area multiple times will help pick up features you may have missed on the first walkthrough. Try traversing an area two to three times to build an ideal map.

If possible, while repeating these movements, spend time walking through an area in one direction, then turn around and walk back the way you came.

### Take your time mapping the area

It can take between 15 and 20 minutes for the HoloLens to fully map and adjust itself to its surroundings. If you have a space in which you plan to use a HoloLens frequently, taking that time up front to map the space can prevent issues later on. 

## Possible errors in the spatial map

Errors in spatial mapping data fall into one of three categories:

* *Holes*: Real-world surfaces are missing from the spatial mapping data.
* *Hallucinations*: Surfaces exist in the spatial mapping data that do not exist in the real world.
* *Wormholes*: HoloLens 'loses' part of the spatial map by thinking it is in a different part of the map than it actually is.
* *Bias*: Surfaces in the spatial mapping data are imperfectly aligned with real-world surfaces, either pushed in or pulled out.

Many of these errors can be mitigated by [deleting your holograms](environment-considerations-for-hololens.md) and re-mapping the space.
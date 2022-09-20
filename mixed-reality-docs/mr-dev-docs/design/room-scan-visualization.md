---
title: Room scan visualization
description: Applications that require spatial mapping use the device to collect data over time and across sessions.
author: mattzmsft
ms.author: alexpf
ms.date: 03/21/2018
ms.topic: article
keywords: Windows Mixed Reality, App patterns, design, HoloLens, room scan, spatial mapping, mesh, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens
---

# Room scan visualization

Applications that require spatial mapping rely on the device to collect data over time and across sessions. The completeness and quality of the mapping data depends on many factors, including the amount of exploration the user has done, how much time has passed since the exploration, and whether objects such as furniture and doors have moved since the device scanned the area.

To ensure useful spatial mapping data, applications developers have several options:
* Rely on what may have already been collected. This data may be incomplete initially.
* Ask the user to use the bloom gesture to get to the Windows Mixed Reality home and then explore the area they wish to use for the experience. They can use air-tap to confirm that all the necessary area is known to the device.
* Build a custom exploration experience in their own application.

In all these cases, the actual data gathered during the exploration is stored by the system and the application doesn't need to do this. If you'd like to see room scan visualization in action, check out our **Designing Holograms - Spatial Awareness** video demo below:

> [!VIDEO https://learn.microsoft.com/shows/Docs-Mixed-Reality/Microsofts-Designing-Holograms-Spatial-Awareness-Chapter/player]

*This video was taken from the "Designing Holograms" HoloLens 2 app. Download and enjoy the full experience [here](https://aka.ms/dhapp).*

## Device support

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><strong>Feature</strong></td>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens</strong></a></td>
        <td><a href="/windows/mixed-reality/enthusiast-guide/immersive-headset-hardware-details"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Room scan visualization</td>
        <td>✔️</td>
        <td>❌</td>
    </tr>
</table>

## Building a custom scanning experience

Applications may analyze the spatial mapping data at the start of the experience to judge whether they want the user to do extra steps to improve its completeness and quality. If analysis indicates quality should be improved, developers should provide a visualization to overlay on the world to indicate:
* How much of the total volume in the users vicinity needs to be part of the experience
* Where the user should go to improve data

Users don't know what makes a "good" scan. They need to be shown or told what to look for if they’re asked to evaluate a scan – flatness, distance from actual walls, and so on. The developer should implement a feedback loop that includes refreshing the spatial mapping data during the scanning or exploration phase.

In many cases, it's best to tell the user what they need to do to get the necessary scan quality. For example, look at the ceiling, look behind furniture, and so on.

## Cached versus continuous spatial mapping

The spatial mapping data is the most heavy weight data source applications can consume. To avoid performance issues such as dropped frames or stuttering, consumption of this data should be done carefully.

Active scanning during an experience can be both beneficial and detrimental, so you'll need to decide which method to use based on the experience.

### Cached spatial mapping

If there's cached spatial mapping data, the application typically takes a snapshot of the spatial mapping data and uses this snapshot during the experience.

**Benefits**
* Reduced overhead on the system while the experience is running leading to dramatic power, thermal, and cpu performance gains.
* A simpler implementation of the main experience since it is not interrupted by changes in the spatial data.
* A single one time cost on any post processing of the spatial data for physics, graphics, and other purposes.

**Drawbacks**
* The movement of real world objects or people is not reflected by the cached data. for example, the application might consider a door open when it's closed now.
* Potentially more application memory to maintain the cached version of the data.

A good case for this method is a controlled environment or a table top game.

### Continuous spatial mapping

Certain applications may rely on continues scanning to refresh spatial mapping data.

**Benefits**
* You don't need to build in a separate scanning or exploration experience upfront in your application.
* The movement of real world objects can be reflected by the game, although with some delay.

**Drawbacks**
* Higher complexity in the implementation of the main experience.
* Potential overhead from the extra graphic and physics processing, as changes need to be incrementally ingested by these systems.
* Higher power, thermal, and CPU impact.

A good case for this method is one where holograms are expected to interact with moving objects, for example, a holographic car that drives on the floor may want to bump into a door depending on whether it's open or closed.

## See also

* [Spatial mapping](spatial-mapping.md)
* [Coordinate systems](coordinate-systems.md)
* [Spatial sound design](spatial-sound-design.md)

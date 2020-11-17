---
title: Spatial Mapping in Unreal
description: Guide to using spatial mapping in Unreal
author: hferrone
ms.author: v-hferrone
ms.date: 06/10/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, mixed reality, development, features, documentation, guides, holograms, spatial mapping, mixed reality headset, windows mixed reality headset, virtual reality headset
---
# Spatial Mapping in Unreal

## Overview
Spatial mapping makes it possible to place objects on surfaces in the physical world by showing the world around the HoloLens, which makes holograms seem more real to the user. Spatial mapping also anchors objects in the user's world by taking advantage of real world depth cues. This helps convince the user that these holograms are actually in their space; holograms floating in space or moving with the user will not feel as real. You want to place items for comfort whenever possible.

You can find more information on spatial mapping quality, placement, occlusion, rendering, and more, in the [Spatial mapping](../../design/spatial-mapping.md) document.

## Enabling Spatial Mapping

To enable spatial mapping on HoloLens:
- Open **Edit > Project Settings** and scroll down to the **Platforms** section.    
    + Select **HoloLens** and check **Spatial Perception**.

To opt into spatial mapping and debug the **MRMesh** in a HoloLens game:
1. Open the **ARSessionConfig** and expand the **ARSettings > World Mapping** section. 

2. Check **Generate Mesh Data from Tracked Geometry**, which tells the HoloLens plugin to start asynchronously getting spatial mapping data and surface it to Unreal through the **MRMesh**. 
3. Check **Render Mesh Data in Wireframe** to show a white wireframe outline of every triangle in the **MRMesh**. 

![Spatial Anchors Store Ready](images/unreal-spatialmapping-arsettings.PNG)


## Spatial Mapping at runtime
You can modify the following parameters to update the spatial mapping runtime behavior:

- Open **Edit > Project Settings**, scroll down to the **Platforms** section and select **HoloLens > Spatial Mapping**: 

![Spatial Anchors Project Settings](images/unreal-spatialmapping-projectsettings.PNG)

- **Max Triangles Per Cubic Meter** updates the density of the triangles in the spatial mapping mesh.  
- **Spatial Meshing Volume Size** is the size of the cube around the player to render and update spatial mapping data.  
    + If the expected application runtime environment is expected to be large, this value may need to be large to match the real-world space.  On the other hand, this value can be smaller if the application only needs to place holograms on surfaces immediately around the user. As the user walks around the world, the spatial mapping volume will move with them. 

## Working with MRMesh
To get access to the **MRMesh** at runtime:
1. Add an **ARTrackableNotify** Component to a Blueprint actor. 

![Spatial Anchors AR Trackable Notify](images/unreal-spatialmapping-artrackablenotify.PNG)

2. Select the **ARTrackableNotify** component and expand the **Events** section in the **Details** panel. 
    - Click the **+** button on the events you want to monitor. 

![Spatial Anchors Events](images/unreal-spatialmapping-events.PNG)

In this case, the **On Add Tracked Geometry** event is being monitored, which looks for valid world meshes matching to spatial mapping data. You can find the full list of events in the [UARTrackableNotify](https://docs.unrealengine.com/API/Runtime/AugmentedReality/UARTrackableNotifyComponent/index.html) component API. 

You can change the mesh’s material in the Blueprint Event Graph or in C++. The screenshot below shows the Blueprint route: 

![Spatial Anchors Example](images/unreal-spatialmapping-example.PNG)

In C++, you can subscribe to the `OnTrackableAdded` delegate to get the `ARTrackedGeometry` as soon as it is available, shown in the code below. 

> [!IMPORTANT]
> The project’s build.cs file **MUST** have **AugmentedReality** in the **PublicDependencyModuleNames** list.
> - This includes **ARBlueprintLibrary.h** and **MRMeshComponent.h**, which lets you inspect the **MRMesh** component of the **UARTrackedGeometry**. 

![Spatial Anchors Example C++ code](images/unreal-spatialmapping-examplecode.PNG)

Spatial mapping is not the only type of data that gets surfaced through **ARTrackedGeometries**. You can check that the `EARObjectClassification` is `World`, which means this is spatial mapping geometry. 

There are similar delegates for updated and removed events: 
- `AddOnTrackableUpdatedDelegate_Handle` 
- `AddOnTrackableRemovedDelegate_Handle`. 

You can find the full list of events in the [UARTrackedGeometry](https://docs.unrealengine.com/API/Runtime/AugmentedReality/UARTrackedGeometry/index.html) API.

## See also
* [Spatial mapping](../../design/spatial-mapping.md)

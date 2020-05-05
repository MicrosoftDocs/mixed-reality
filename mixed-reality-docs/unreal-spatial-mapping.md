---
title: Spatial Mapping in Unreal
description: Guide to using spatial mapping in Unreal
author: sw5813
ms.author: jacksonf
ms.date: 5/5/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, mixed reality, development, features, documentation, guides, holograms, spatial mapping
---
# Spatial Mapping in Unreal

To enable spatial mapping on HoloLens, ensure that the “Spatial Perception” capability is checked in the Unreal editor under Project Settings > Platform > HoloLens > Capabilities.  

To opt into using spatial mapping in a HoloLens game, enable the “Generate Mesh Data from Tracked Geometry” in the ARSessionConfig.  The HoloLens plugin will then asynchronously get spatial mapping data and surface it to Unreal through the MRMesh. 

![Spatial Anchors Store Ready](images/unreal-spatialmapping-arsettings.PNG)

To see a debug visualization of the spatial mapping mesh, enable the “Render Mesh Data in Wireframe” checkbox in the ARSessionConfig to see a white wireframe outline of every triangle in the MRMesh. 

In Project Settings > Platform > HoloLens > Spatial Mapping, the following parameters can be modified to update spatial mapping’s runtime behavior: 

![Spatial Anchors Project Settings](images/unreal-spatialmapping-projectsettings.PNG)

Max Triangles Per Cubic Meter will update the density of the triangles in the spatial mapping mesh.  Spatial Meshing Volume Size indicates the size of the cube around the player to render and update spatial mapping data.  If the expected application runtime environment is expected to be large, this field may need to be large to match the real-world space.  Conversely, if the application only needs to place holograms on surfaces immediately around the user, this field can be smaller.  As the user walks around the world, the spatial mapping volume will move with them. 

To get access to the MRMesh at runtime, first add an AR Trackable Notify Component to a Blueprint actor: 

![Spatial Anchors AR Trackable Notify](images/unreal-spatialmapping-artrackablenotify.PNG)

Then go to the component’s details and click on the green “+” button on the events to monitor. 

![Spatial Anchors Events](images/unreal-spatialmapping-events.PNG)

In this case we monitor the On Add Tracked Geometry event looking for valid world meshes which correspond to spatial mapping data, and change the mesh’s material: 

![Spatial Anchors Example](images/unreal-spatialmapping-example.PNG)

In C++, we can subscribe to the OnTrackableAdded delegate to get the ARTrackedGeometry as soon as it is available.  There are similar delegates for updated and removed events: AddOnTrackableUpdatedDelegate_Handle and AddOnTrackableRemovedDelegate_Handle. 

![Spatial Anchors Example C++ code](images/unreal-spatialmapping-examplecode.PNG)

The project’s build.cs must have “AugmentedReality” in the PublicDependencyModuleNames list to include “ARBlueprintLibrary.h” and “MRMesh” to inspect the MRMesh component of the UARTrackedGeometry. 

Spatial mapping is not the only type of data that gets surfaced through ARTrackedGeometries, so we first check that the EARObjectClassification is World, which indicates that this is spatial mapping geometry. 

## See also
* [Spatial mapping](spatial-mapping.md)

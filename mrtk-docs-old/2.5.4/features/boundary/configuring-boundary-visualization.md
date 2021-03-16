---
title: ConfiguringBoundaryVisualization
description: Details to configure the Boundary system in MRTK
author: davidkline-ms
ms.author: davidkl
ms.date: 01/12/2021
ms.localizationpriority: medium
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Boundary System,
---

# Configuring the boundary visualization

The *Boundary Visualization Profile* provides options for configuring the visual aesthetics and other related parameters for the Boundary system. Boundary visualizations are attached to the Mixed Reality Playspace object in the scene and teleport with the user.

## General settings

![Boundary Visualization General Settings](../images/boundary/BoundaryVisualizationGeneralSettings.png)

### Boundary height

The boundary height indicates the distance above the floor plane at which the boundary ceiling should be rendered. The default value is 3 meters.

## Floor settings

![Boundary Visualization Floor Settings](../images/boundary/BoundaryVisualizationFloorSettings.png)

**Show**

Indicates whether or not a floor plane is to be created and added to the scene. The default value is true.

**Material**

Indicates the material that should be used when creating the floor plane.

**Scale**

Indicates the size, in meters, of the floor plane to be created. The default scale is a 3 meter x 3 meter square.

**Physics Layer**

The layer on which the floor plane should be set. The default value is the *Default* layer.

## Play area settings

![Boundary Visualization Play Area Settings](../images/boundary/BoundaryVisualizationPlayAreaSettings.png)

**Show**

Indicates whether or not a play area rectangle is be created and added to the scene. The default value is true.

**Material**

Indicates the material that should be used when creating the play area object.

**Physics Layer**

The layer on which the play area should be set. The default value is the *Ignore Raycast* layer.

## Tracked area settings

![Boundary Visualization Tracked Area Settings](../images/boundary/BoundaryVisualizationTrackedAreaSettings.png)

**Show**

Indicates whether or not the outline of the tracked area is be created and added to the scene. The default value is true.

**Material**

Indicates the material that should be used when creating the tracked area outline.

**Physics Layer**

The layer on which the tracked area should be sets. The default value is the *Ignore Raycast* layer.

## Boundary wall settings

![Boundary Visualization Boundary Wall Settings](../images/boundary/BoundaryVisualizationWallSettings.png)

**Show**

Indicates whether or not boundary wall planes are to be created and added to the scene. The default value is false.

**Material**

Indicates the material that should be used when creating the boundary wall planes.

**Physics Layer**

The layer on which the boundary walls should be set. The default value is the *Ignore Raycast* layer.

> [!NOTE]
> Setting the boundary wall component to a physics layer other than *Ignore Raycast* may prevent users from interacting with objects within the scene.

## Boundary ceiling settings

![Boundary Visualization Boundary Ceiling Settings](../images/boundary/BoundaryVisualizationCeilingSettings.png)

**Show**

Indicates whether or not a boundary ceiling plane is to be created and added to the scene. The default value is false.

**Material**

Indicates the material that should be used when creating the boundary ceiling plane.

**Physics Layer**

The layer on which the boundary walls should be set. The default value is the *Ignore Raycast* layer.

> [!NOTE]
> Setting the boundary ceiling component to a physics layer other than *Ignore Raycast* may prevent users from interacting with objects within the scene.

## See also

- [Boundary API documentation](xref:Microsoft.MixedReality.Toolkit.Boundary)
- [Boundary System](boundary-system-getting-started.md)

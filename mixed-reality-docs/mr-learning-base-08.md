---
title: Getting started tutorials - 8. Adding tooltips
description: This course shows you how to use Mixed Reality Toolkit (MRTK) to create a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
ms.localizationpriority: high
---

# 8. Adding tooltips

In this tutorial, you will explore a few advanced input options for HoloLens 2, including the use of voice commands, panning gesture, and eye tracking.

## Objectives

* Trigger events using voice commands and keywords
* Use tracked hands to pan textures and 3D objects with tracked hands
* Leverage HoloLens 2 eye tracking capabilities to select objects

## Tooltips

The pan gesture is useful for scrolling by using your finger or hand to scroll through content. In this example, you will first learn how to scroll a 2D UI and then expand on that to be able to scroll through a collection of 3D objects.

The main steps you will take to achieve this are:

1. Create a Quad object that can be used for panning
2. Add the Near Interaction Touchable (Script) component
3. Add the Hand Interaction Pan Zoom (Script) component
4. Add 2D content to be scrolled
5. Add 3D content to be scrolled
6. Add the Move With Pan (Script) component

> [!NOTE]
> The Move With Pan (Script) component is not part of MRTK. It was provided with this tutorial's assets.

### 1. Create a Quad object that can be used for panning

In the Hierarchy window, right-click at an empty area and select **3D Object** > **Quad** to add a quad to your scene. Give it a suitable name, for example, **PanGesture**, and position it in a suitable location, for example, X = 0, Y = -0.2, Z = 2.

As with any other interaction, the the pan gesture also requires a collider. By default, a Quad has a mesh collider. However, the mesh collider is not ideal because it is extremely thin. To make it easier for the user to interact with the collider, we will replace the mesh collider with a box collider.

With the PanGesture object still selected, click the **Mesh Collider** component's **Settings** icon and select **Remove Component** to remove the Mesh Collider:

In the Inspector window, use the **Add Component** button to add a **Box Collider**, then change the Box Collider **Size** Z to 0.15 to increase the thickness of the box collider:

### 2. Add the Near Interaction Touchable (Script) component

With the **PanGesture** object still selected, add the **Near Interaction Touchable (Script)** component to the PanGesture object, and then click the **Fix Bounds** and **Fix Center** buttons to update the Local Center and Bounds properties of the Near Interaction Touchable (Script) to match the BoxCollider:

### 3. Add the Hand Interaction Pan Zoom (Script) component

With the **PanGesture** object still selected, add the **Hand Interaction Pan Zoom (Script)** component to the PanGesture object, and then check the **Lock Horizontal** checkbox to allow vertical scrolling only:

### 4. Add 2D content to be scrolled

In the Project panel, search for the **PanContent** material and then click-and-drag it on to the **PanGesture** object's Mesh Renderer **Material** Element 0 property:

In the Inspector window, expand the newly added **PanContent** material component, and then change it's **Tiling** Y value to 0.5 so it matches the X value and the tiles appear square:

If you now enter Game mode, you can test scrolling the 2D content using the pan gesture in the in-editor simulation:

### 5. Add 3D content to be scrolled

In the Hierarchy window, **create four cubes** as a child objects of the **PanGesture** object and set their Transform **Scale** to X = 0.15, Y = 0.15, Z = 0.15:

To space the cubes out evenly, and save some time, add the **Grid Object Collection (Script)** component, to the cubes' parent object, i.e. the **PanGesture** object, and configure the Grid Object Collection (Script) as follows:

* Change **Num Rows** to 1 to have all the cubes aligned on one single row
* Change **Cell Width** to 0.25 to space out the cubes within the row

Then click the **Update Collection** button to apply the new configuration:

### 6. Add the Move With Pan (Script) component

In the Hierarchy window, select all the **Cube child objects**, then in the Inspector window, use the **Add Component** button to add the **Move With Pan (Script)** component to all the cubes:

With all the cubes still selected, click-and-drag the **PanGesture** object to the **Pan Input Source** field:

> [!TIP]
> The Move With Pan (Script) component on each cube listens for the Pan Updated event sent by the HandInteractionPanZoom (Script) component on the PanGesture object, which you assigned as the Pan Input Source in the step above, and updates each cube's position accordingly.

In the Hierarchy window, select the **PanGesture** object, then in the inspector **un-check** the **Mesh Renderer** checkbox to disable the Mesh Renderer component:

If you now enter Game mode, you can test scrolling the 3D content using the pan gesture in the in-editor simulation:

## Congratulations

You have successfully added basic eye tracking capabilities to your application. These actions are only the beginning of a world of possibilities with eye tracking. In this tutorial, you also learned about other advanced input features, such as voice commands and panning gestures.

[Next Lesson: 9. Using eye tracking](mr-learning-base-09.md)

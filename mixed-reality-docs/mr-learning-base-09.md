---
title: Getting started tutorials - 9. Using eye tracking
description: This course shows you how to use Mixed Reality Toolkit (MRTK) to create a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
ms.localizationpriority: high
---

# 9. Using eye tracking

In this tutorial, you will explore a few advanced input options for HoloLens 2, including the use of voice commands, panning gesture, and eye tracking.

## Objectives

* Trigger events using voice commands and keywords
* Use tracked hands to pan textures and 3D objects with tracked hands
* Leverage HoloLens 2 eye tracking capabilities to select objects

## Eye Tracking

In this section, you will explore how to enable eye tracking in your project. For this example, you will implement functionality to make each object in the 3DObjectCollection spin slowly while being looked at by the user's eye gaze, as well as, trigger a blip effect when the object being looked at is selected by air-tap or speech command.

The main steps you will take to achieve this are:

1. Add the Eye Tracking Target (Script) component to all target objects
2. Add the Eye Tracking Tutorial Demo (Script) component  to all target objects
3. Implement the While Looking At Target event
4. Implement the On Selected event
5. Enable simulated eye tracking for in-editor simulations
6. Enable Gaze Input in the Visual Studio project's app capabilities

### 1. Add the Eye Tracking Target (Script) component to all target objects

In the Hierarchy window, expand the **3DObjectCollection** object and select all the **child objects**, then in the Inspector window, use the **Add Component** button to add the **Eye Tracking Target (Script)** component to all the child objects:

With all the **child objects** still selected, configure the **Eye Tracking Target (Script)** component as follows:

* Change **Select Action** to **Select**, to define the air-tap action for this object as Select
* Expand **Voice Select** and set the voice command list **Size** to 1, and then, in the new element list that appear, change **Element 0** to **Select**, to define the speech command action for this object as Select

### 2. Add the Eye Tracking Tutorial Demo (Script) component  to all target objects

With all the **child objects** still selected, use the **Add Component** button to add the **Eye Tracking Tutorial Demo (Script)** component to all the child objects:

> [!NOTE]
> The Eye Tracking Target (Script) component is not part of MRTK. It was provided with this tutorial's assets.

### 3. Implement the While Looking At Target event

In the Hierarchy window, select the **Cheese** object, then create a new **While Looking At Target ()** event, configure the **Cheese** object to receive the event, and define **EyeTrackingTutorialDemo.RotateTarget** as the action to be triggered:

**Repeat** for each of the child objects in the 3DObjectCollection.

### 4. Implement the On Selected event

In the Hierarchy window, select the **Cheese** object, then create a new **On Selected ()** event, configure the **Cheese** object to receive the event, and define **EyeTrackingTutorialDemo.BlipTarget** as the action to be triggered:

**Repeat** for each of the child objects in the 3DObjectCollection.

### 5. Enable simulated eye tracking for in-editor simulations

In the Hierarchy window, select the **MixedRealityToolkit** object, then in the Inspector window, select the **Input** tab, expand the **Input Data Providers** section and then the **Input Simulation Service** section, and clone the **DefaultMixedRealityInputSimulationProfile** to replace it with your own customizable **Input Simulation Profile**:

> [!TIP]
> For a reminder on how to clone MRTK profiles, you can refer to the [Configuring the Mixed Reality Toolkit profiles](mr-learning-base-03.md) instructions.

In the **Eye Simulation** section, check the **Simulate Eye Position** checkbox to enable eye tracking simulation:

If you now enter Game mode, you can test the spin and blip effects you implemented by adjusting the view so the cursor hits one of the objects and using hand interaction or speech command to select the object:

> [!NOTE]
> If you did not use the DefaultHoloLens2ConfigurationProfile to clone your customizable MRTK configuration profile, as instructed in the [Configuring the Mixed Reality Toolkit profiles](mr-learning-base-03.md) instructions, eye tracking may not be enable in your project and will need to be enabled. For that, you can refer to the [Getting started with eye tracking in MRTK](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_BasicSetup.html) instructions.

### 6. Enable Gaze Input in the Visual Studio project's app capabilities

Before building and deploying your app from Visual Studio to your device, Gaze Input has to been enabled in the project's app capabilities. For this, you can follow the [Testing your Unity app on a HoloLens 2](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_BasicSetup.html#testing-your-unity-app-on-a-hololens-2) instructions.

## Congratulations

You have successfully added basic eye tracking capabilities to your application. These actions are only the beginning of a world of possibilities with eye tracking. In this tutorial, you also learned about other advanced input features, such as voice commands and panning gestures.

[Next Lesson: 10. Using voice commands](mr-learning-base-10.md)

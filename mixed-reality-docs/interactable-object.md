---
title: Interactable object
description: A button has long been a metaphor used for triggering an event in the 2D abstract world. In the three-dimensional mixed reality world, we don’t have to be confined to this world of abstraction anymore.
author: cre8ivepark
ms.author: jennyk
ms.date: 02/24/2019
ms.topic: article
keywords: Mixed Reality, Controls, interaction, ui, ux
---



# Interactable object

A button has long been a metaphor used for triggering an event in the 2D abstract world. In the three-dimensional mixed reality world, we don’t have to be confined to this world of abstraction anymore. Anything can be an **Interactable object** that triggers an event. An interactable object can be represented as anything from a coffee cup on the table to a balloon floating in the air. We still do make use of traditional buttons in certain situation such as in dialog UI. The visual representation of the button depends on the context.

![Interactible object hero image](images/640px-interactibleobject-hero-640px.jpg)


## Important properties of the interactable object

### Visual cue

Visual cues are sensory cues received by the eye in the form of light and processed by the visual system during visual perception. Since the visual system is dominant in many species, especially humans, visual cues are a large source of information in how the world is perceived.

In mixed reality, since the holographic objects are mixed with the real-world environment, it could be difficult to understand which objects are interactable. For any interactable objects in your experience, it is important to provide differentiated visual cue for each input state. This helps the user understand which part of your experience is interactable and makes the user confident with consistent interaction method.

#### Far interactions

For any objects that user can interact with gaze, hand ray, and motion controller's ray, we recommend to have different visual cue for these three input states:
* **Default (Observation)**: Default idle state of the object.
* **Targeted (Hover)**: When the object is targeted with gaze cursor, finger proximity or motion controller's pointer.
* **Pressed**: When the object is pressed with air-tap gesture, finger press or motion controller's select button.

You can use techniques such as highlighting or scaling to provide visual cue to the user’s input states. In Windows Mixed Reality, you can find the examples of visualizing different input states on Start menu and App Bar buttons. 

![Holographic button](images/640px-interactibleobject-states.png)<br>
*Example of visualizing observation state, targeted state, and pressed state*

![Holographic button](images/MRTK_InteractableState.png)<br>
*Observation state, targeted state, and pressed state on holographic button*

#### Near(direct) interactions

HoloLens 2 supports articulated hand tracking input which allows you to interact with objects. Without haptic feedback and perfect depth perception sometimes it can be hard to tell how far away your hand is from an object, or whether you are touching. Providing a large number of visual cues to communicate the state of your system and in particular of your hands in relation to holograms.

Use visual feedback to communicate the following:
* **Default (Observation)**: Default idle state of the object.
* **Hover**: When hand is near a hologram, change visuals to communicate that hand is targeting hologram. 
* **Distance and point of interaction** - As hand approaches hologram, design feedback to communicate the projected point of interaction, as well as how far from the object the finger is
* **Contact Begin**: Change visuals (light, color) to communicate that touch has occured
* **Grasped**: Change visuals (light, color) when the object is grasped.
* **Contact End**: Change visuals (light, color) when touch has ended.

![Pressable button](images/640px-interactibleobject-states-near.jpg)<br>
*Example of visualizing near interaction states*

The [Button in HoloLens 2](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_Button.html) shows the example of visualizing different input interaction states.

![Pressable button](images/640px-interactibleobject-pressablebutton-650px2.jpg)<br>
*Example of pressable button in HoloLens 2*


In the **[Mixed Reality Toolkit](https://github.com/Microsoft/MixedRealityToolkit-Unity)**, we have created a series of Unity scripts and prefabs that will help you create Interactable objects. You can use these to create any type of object that the user can interact with, using these standard interaction states: observation, targeted and pressed. You can easily customize the visual design with your own assets. Detailed animations can be customized by either creating and assigning corresponding animation clips for the interaction states in the Unity's animation controller or using offset and scale. 

### Audio cue

### Speech command

### Input modality

## Interactable object in Mixed Reality Toolkit
You can find the [examples of Interactable object in Mixed Reality Toolkit](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_Interactable.html)


## See also
* [Pressable Button on Mixed Reality Toolkit-Unity](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_Button.html)
* [Object collection](object-collection.md)
* [Billboarding and tag-along](billboarding-and-tag-along.md)

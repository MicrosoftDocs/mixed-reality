---
title: Point and Commit 
description: Overview of the point and commit input model
author: caseymeekhof
ms.author: cmeekhof
ms.date: 04/05/2019
ms.topic: article
keywords: Mixed Reality, interaction, design, hololens, hands, far, point and commit 
---
# Point and commit

Point and commit is an input model that enables users to target, select, and manipulate 2D content and 3D objects from a distance. This "Far" interaction technique is a novel interactive experience that, until now, has not been present in our daily interactions with the real world. In both Microsoft HoloLens (AR) and Microsoft Mixed Reality (VR), we equip users this power, breaking the physical constraint of the "real world", not only to have delightful experience with holographic contents but to ensure interaction is more effective and efficient.

## Device support

Input model | [HoloLens (1st gen)](https://review.docs.microsoft.com/en-us/windows/mixed-reality/hololens-hardware-details?branch=master) | HoloLens2 | [Immersive headsets](https://review.docs.microsoft.com/en-us/windows/mixed-reality/immersive-headset-hardware-details?branch=master) |
| ---------| -----| ----- | ---------|
Point and commit (far interaction) | ❌ Not supported | ✔️ Recommended | ✔️ Recommended

Point and commit, also known as **Hands Far**, is one of the new features that utilizes the new articulated hand-tracking system. This input model is also the primary input model on immersive headsets through the use of motion controllers.

## Hand rays

On HoloLens 2, we created a hand ray that shoots out from the center of a palm. This ray is treated as an extension of the hand. A donut-shaped cursor is attached to the end of the ray to indicate the location where the ray intersects with a target object. The object that the cursor lands on can then receive gestural commands from the hand.

This basic gestural command is triggered by using the thumb and index finger to perform the air-tap action. By using the hand ray to point and air tap to commit, users can activate a button or a hyperlink on a web content. With more composite gestures, users are capable of navigating web content and manipulating 3D objects from a distance. The visual design of the hand ray should also react to these point and commit states, as described and shown below: 

* In the *pointing* state, the ray is a dash line and the cursor is a donut shape.
* In the *commit* state, the ray turns into a solid line and the cursor shrinks to a dot.

![](images/Hand-Rays-720px.jpg)

## Transition between near and far

Instead of using specific gesture, such as "pointing with index finger" to direct the ray, we designed the ray coming out from the center of the palm, releasing and reserving the five fingers for more manipulative gestures, such as pinch and grab. With this design, we create only one mental model, supporting exactly the same set of hand gestures for both near and far interaction. You can use the same grab gesture to manipulate objects at different distances. The invocation of the rays is automatic and proximity based:

*  When an object is within arm reached distance (roughly 50 cm), the rays are turned off automatically encouraging for near interaction.
*  When the object is farther than 50 cm, the rays are turned on. The transition should be smooth and seamless.

![](images/Transition-Between-Near-And-Far-720px.jpg)

## 2D slate interaction

A 2D Slate is a holographic container hosting 2D app contents, such as web browser. The design concept for far interacting with a 2D slate is to use hand rays to target and air tap to select. After targeting with a hand ray, users can air tap to trigger a hyperlink or a button. They can use one hand to "air tap and drag" to scroll a slate content up and down. The relative motion of using two hands to air tap and drag can zoom in and out the slate content.

Targeting the hand ray at the corners and edges reveals the closest manipulation affordance. By "grab and drag" the manipulation affordances, users can perform uniform scaling through the corner affordances and can reflow the slate via the edge affordances. Grabbing and dragging the holobar at the top of the 2D slate can users move the whole slate.

![](images/2D-Slate-Interaction-Far-720px.jpg)

## 3D object manipulation

In direct manipulation, there are two ways for users to manipulate 3D object: Affordance-based Manipulation and Non-affordanced Based Manipulation. In the point-and-commit model for far interaction, users are capable of achieving exactly the same tasks through the hand rays. No additional learning is needed.

* **Affordance Based Manipulation:** Use hand rays to target and reveal the bounding box and manipulation affordances. You can grab the bounding box to move the whole object, the edge affordances to rotate and the corner affordances to scale uniformly.

* **Non-Affordance Based Manipulation:** You can can point with hand rays to reveal the bounding box then grab it. If the bounding box is targeted and grabbed with one hand, the translation and rotation of the object are associated to motion and orientation of the hand. When the object is targeted and grabbed with two hands, users can translate, scale and rotate it according to relative motions of two hands.

![](images/3D-Object-Manipultaion-Far-720px.jpg)

## Instinctual gestures

Coming soon!  

![](images/Instinctual-Gestures-Far-720px.jpg)

## Symmetric design between hands and 6 DoF controller

Coming soon!

![](images/Symmetric-Design-For-Rays-720px.jpg)

## See also

* [Gaze and commit](gaze-and-commit.md)
* [Direct manipulation](direct-manipulation.md)
* [Interaction fundamentals](interaction-fundamentals.md)

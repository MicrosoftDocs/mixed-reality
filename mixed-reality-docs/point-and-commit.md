---
title: Point and commit
description: Overview of the point and commit input model
author: caseymeekhof
ms.author: cmeekhof
ms.date: 04/05/2019
ms.topic: article
keywords: Mixed Reality, interaction, design
---
# Point and commit
Point and Commit is an input model enables users to target, select and manipulate 2D contents and 3D objects in a distance. This far interaction technique is a navel interactive experience that human being didn't really have during their daily interaction with the real world. For example, in a super hero movie, Magneto is capable of reaching out and manipulate a far object via hands at a distance, which human can't do it in reality. In both Microsoft HoloLens (AR) and Microsoft Mixed Reality (VR), we equip users this magical power breaking the physical constraint of real world not only to have delightful experience with holographic contents but to make the interaction more effective and efficient.

## Device Support
<table>
    <colgroup>
    <col width="40%" />
    <col width="20%" />
    <col width="20%" />
    <col width="20%" />
    </colgroup>
    <tr>
        <td><strong>Input model</strong></td>
        <td><a href="hololens-hardware-details.md"><strong>HoloLens (1st gen)</strong></a></td>
        <td><strong>HoloLens 2</strong></td>
        <td><a href="immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Point and commit (far interaction)</td>
        <td>❌ Not supported</td>
        <td>✔️ Recommended (second choice - <a href="interaction-fundamentals.md">See the other options</a>)</td>
        <td>❌ Not supported</td>
    </tr>
</table>
Point and Commit has been one of the primary input models on HoloLens 2, utilizing the new articulated hand tracking system. This input model is also the primary input model on immersive headsets through the use of motion controllers. Point and Commit is the input model that we suggest to replace the Head Gaze and Commit on HoloLens (1st gen). 

## Hand Rays
On HoloLens 2, we invent a hand ray shooting out from the center of a palm. A donut shape cursor is attached at the end of the ray. The ray is treated as a direct extension of a hand, and the cursor implies the intersection with a hitted object. The object that the cursor lands will receive further commands and actions from the hand. The very fundamental command is using thumb and index finger to perform Air Tap gesture to commit. By hand ray targeting (point) and air tapping (commit), users can press a button or a hyperlink on a web content in a distance. The visual design of the hand ray should also react to point and commit states. For example, in the pointing state, the ray is dash lined, and the cursor is a donut shape, while, in the committing state, the ray turns into a solid line, and the cursor shrinks to a dot.
![](images/Hand-Rays-720px.jpg)<br>

## Transition between Near and Far
Instead of using specific gesture, such as "pointing with index finger" to direct the ray, we design the ray coming out from the center of the palm, releasing and reserving the five fingers for more manipulative gestures, such as pinch and grab. With this design, we create only one mental model, supporting exactly the same set of hand gestures for both near and far interaction. Users can use the same grab gesture to manipulate objects at different distances. The invocation of the rays is automatic and proximity based. When an object is within arm reached distance (roughly 50 cm), the rays are turned off automatically encouraging for near interaction. When the object is farther than 50 cm, the rays are turned on. The transition should be smooth and seamless.
![](images/Transition-Between-Near-And-Far-720px.jpg)<br>

## 2D Slate Interaction
A 2D Slate is a holographic container hosting 2D app contents, such as web browser. The design concept for far interacting with a 2D slate is to use hand rays to target and air tap to select. After targeting with a hand ray, users can air tap to trigger a hyperlink or a button. They can use one hand to "air tap and drag" to scroll a slate content up and down. The relative motion of using two hands to air tap and drag can zoom in and out the slate content. Targeting the hand ray at the corners and edges reveals the closest manipulation affordance. By "grab and drag" the manipulation affordances, users can perform uniform scaling through the corner affordances and can reflow the slate via the edge affordances. Grabbing and dragging the holobar at the top of the 2D slate can users move the whole slate.
![](images/2D-Slate-Interaction-Far-720px.jpg)<br>

## 3D Object Manipulation
In direct manipulation, there are two ways for users to manipulate 3D object, Affordance Based Manipulation and Non-affordnace Based Manipulation. In point and commit model for far interaction, users are capable of achieving exactly the same tasks through the hand rays. No additional learning is needed. For Affordance Based Manipulation, users use hand ray to target and reveal the bounding box and manipulation affordances. Users can grab the bounding box to move the whole object, the edge affordances to rotate and the coner affordances to scale uniformly. For non-affordnace based manipulation, users can point with hand rays to reveal the bounding box then grab it. If the bounding box is targeted and grabbed with one hand, the translation and rotation of the object are associated to motion and orientation of the hand. When the object is targeted and grabbed with two hands, users can translate, scale and rotate it according to relative motions of two hands.
![](images/3D-Object-Manipultaion-Far-720px.jpg)<br>

## Instinctual Gesturers
![](images/Instinctual-Gestures-Far-720px.jpg)<br>

## Symmetric Design between Hands and 6 DoF Controller 
![](images/Symmetric-Design-For-Rays-720px.jpg)<br>


## See also
* [Gaze and commit](gaze-and-commit.md)
* [Direct manipulation](direct-manipulation.md)
* [Interaction fundamentals](interaction-fundamentals.md)

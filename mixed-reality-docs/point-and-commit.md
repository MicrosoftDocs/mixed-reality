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
Point and commit is an input model that enables users to target, select and manipulate 2D content and 3D objects in the distance. This "far" interaction technique is unique to mixed reality and is not a way humans naturally intereact with the real world. For example, in the super hero movie *X-Men*, the character [Magneto](https://en.wikipedia.org/wiki/Magneto_(comics)) is capable of reaching out and manipulating a far object in the distance with his hands. This is not something humans can do in reality. In both HoloLens (AR) and Mixed Reality (VR), we equip users with this magical power, breaking the physical constraint of real world not only to have a delightful experience with holographic contents but also to make the interaction more effective and efficient.

## Device support
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
        <td>Point and commit (far hand interaction)</td>
        <td>❌ Not supported</td>
        <td>✔️ Recommended</td>
        <td>✔️ Recommended</td>
    </tr>
</table>
<br>
Point and commit is one of the primary input models on HoloLens 2, utilizing the new articulated hand tracking system. This input model is also the primary input model on immersive headsets through the use of motion controllers. Point and commit is the input model that we suggest to replace the [Head-gaze and Commit](gaze-and-commit.md) on HoloLens (1st gen). 

## Hand rays
On HoloLens 2, we create a hand ray that shoots out from the center of the user's palm. The ray is treated as an extension of the hand. A donut-shaped cursor is attached at the end of the ray to imply the location where the ray intersects with a hitted object. The object that the cursor lands on will receive gestural commands from the hand. 

A basic gestural command is triggered by using the thumb and index finger to perform an air tap gesture. By using hand ray to point and air tap to commit, users can activate a button or a hyperlink on a web content. With more composite gestures, users are capable of navigating the web content and manipulating 3D objects in a distance. The visual design of the hand ray should also react to point and commit states: <br>
* In the point state, the ray is dash-lined, and the cursor is a donut shape.
* In the commit state, the ray turns into a solid line, and the cursor shrinks to a dot.<br><br>
![](images/Hand-Rays-720px.jpg)<br>

## Transition between near and far
Instead of using specific gestures, such as pointing with the index finger to direct the ray, we designed the ray coming out from the center of the palm, releasing and reserving the five fingers for more gestural manipulations. Therefore, HoloLens 2 supports exactly the same set of hand gestures for both near and far interaction. No additional learning is needed when users transit from near to far interactions, and vice versa. Users can use the same grab gesture to manipulate objects at different distances. The invocation of the rays is automatic and proximity based: <br>
* When the distance of an object is within arm's reached (roughly 50 cm), the rays are turned off automatically encouraging for near interaction. 
* When the object is farther away than 50 cm, the rays are turned on.

This mechanism makes the transition smooth and seamless.<br>
![](images/Transition-Between-Near-And-Far-720px.jpg)<br>

## 2D slate interaction
A 2D slate is a holographic container hosting 2D app content, such as web browser. The design concept for far interacting with a 2D slate is to use hand rays to point and air tap to commit.<br>

For interacting with 2D slate content:<br>

* Users can point at a hyperlink or a button, then air tap to activate it. 
* Users can use one hand to perform a navigation gesture to scroll the slate's content up and down. 
* Users can use two hands to perform navigation gestures to zoom in and out the slate's content.<br><br>

![](images/2D-Slate-Interaction-Far-720px.jpg)<br>

For manipulating the 2D slate itself:<br>

* Users point the hand ray at the corners or edges to reveal the closest manipulation affordance. 
* By applying a manipulation gesture on the affordance, users can perform uniform scaling through the corner affordance and can reflow the slate via the edge affordance. 
* By applying a manipulation gesture on the holobar at the top of the 2D slate, users can move the whole slate.<br>

<br>

## 3D object manipulation
In direct manipulation, there are two ways for users to manipulate 3D object, affordance-based manipulation and non-affordance based manipulation. In the point and commit model, users are capable of achieving exactly the same tasks through the hand rays. No additional learning is needed.<br>

### Affordance-based manipulation
Users use hand rays to point and reveal the bounding box and manipulation affordances. Users can apply the manipulation gesture on the bounding box to move the whole object, on the edge affordances to rotate and on the coner affordances to scale uniformly. <br>

![](images/3D-Object-Manipulation-Far-720px.jpg) <br>


### Non-affordance based manipulation
Users point with hand rays to reveal the bounding box then directly apply manipulation gestures on it. With one hand, the translation and rotation of the object are associated to motion and orientation of the hand. With two hands, users can translate, scale and rotate it according to relative motions of two hands.<br>

<br>

## Instinctual gesturers
The concept of instinctual gestures for point and commit is similar to that for direct manipulation. The gestures users are suppose to perform on a 3D object are guided by the design of UI affordances. For example, a small control point might motivate users to pinch with their thumb and index finger, while a user might want to grab a larger object using all 5 fingers.

![](images/Instinctual-Gestures-Far-720px.jpg)<br>

## Symmetric design between hands and 6 DoF controller 
The concept of point and commit for far interaction was initially created and defined for the Mixed Reality Portal (MRP), where a user wears an immersive headset and interacts with 3D objects via motion controllers. The motion controllers shoot out rays for pointing and manipulating far objects. There are buttons on the controllers for further committing different actions. We leverage the interaction model of rays and attached them to both hands. With this symmetric design, users who are familiar with MRP won't need to learn another interaction model for far pointing and manipulation when they use HoloLen 2, and vice versa.    

![](images/Symmetric-Design-For-Rays-720px.jpg)<br>


## See also
* [Head-gaze and commit](gaze-and-commit.md)
* [Direct manipulation](direct-manipulation.md)
* [Instinctual interactions](interaction-fundamentals.md)

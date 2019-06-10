---
title: Direct manipulation with hands
description: Overview of the direct manipulation input model
author: caseymeekhof
ms.author: cmeekhof
ms.date: 04/02/2019
ms.topic: article
ms.localizationpriority: high
keywords: Mixed Reality, Gaze, gaze targeting, interaction, design, hands near, HoloLens
---

# Direct manipulation with hands
Direct manipulation is an input model that involves touching holograms directly with your hands. The idea behind direct manipulation is that objects behave just as they would in the real world. Buttons can be activated simply by pressing them, objects can be picked up by grabbing them, and 2D content behaves like a virtual touchscreen. This makes direct manipulation is easy for users to learn, and fun. Direct manipulation is considered a "near" input model in that it's best used for interacting with content within arms reach.

Direct manipulation is affordance-based, meaning it's user friendly. There are no symbolic gestures to teach users. All interactions are built around a visual element that you can touch or grab.

## Device support


| Input model | [HoloLens (1st gen)](hololens-hardware-details.md) | HoloLens 2 |[Immersive headsets](immersive-headset-hardware-details.md)|
|:-------- | :-------| :--------| :------------|
| Direct manipulation with hands | ❌ Not supported | ✔️ Recommended | ➕ An alternative, [point and commit with hands](point-and-commit.md) is recommended.

Direct manipulation is a primary input model on HoloLens 2, and utilizes the new articulated hand-tracking system. The input model is also available on immersive headsets through the use of motion controllers, but is not recommended as a primary means of interaction outside of object manipulation. Direct manipluation is not available on HoloLens (1st Gen).


## Collidable fingertip

On HoloLens 2, the user's hands are recognized and interpreted as left and right hand skeletal models. To implement the idea of touching holograms directly with hands, ideally, five colliders could be attached to the five fingertips of each hand skeletal model. However, due to the lack of tactile feedback, ten collidable fingertips can cause unexpected and unpredictable collisions with holograms. 

Hence, we suggest to only put a collider on each index finger. The collidable index fingertips can still serve as active touch points for diverse touch gestures involving other fingers, such as 1-finger press, 1-finger tap, 2-finger press and 5-finger press, as shown in the image below.

![Collidable fingertip image](images/Collidable-Fingertip-720px.jpg)

### Sphere collider

Instead of using a random generic shape, we suggest you use a sphere collider. Then visually render it to provide better cues for near targeting. The sphere's diameter should match the thickness of the index finger to increase touch accuracy. It easier to retrieve the variable of finger thickness by calling the hand API.

### Fingertip cursor

In addition to rendering a collidable sphere on the index fingertip, we've created an advanced fingertip cursor to interactively achieve a better near-targeting experience. It is a donut-shaped cursor attached to the index fingertip. According to proximity, it dynamically reacts to a target in terms of orientation and size as detailed below:

* When an index finger moves toward a hologram, the cursor is always parallel to the hologram's surface and gradually shrinks its size accordingly.
* As soon as the finger touches the surface, the cursor shrinks into a dot and emits a touch event.

With interactive feedback, users can achieve high precision near-targeting tasks, such as triggering a hyperlink or pressing a button as shown below. 

![Fingertip cursor image](images/Fingertip-Cursor-720px.jpg)

## Bounding box with proximity shader

The hologram itself also requires the ability to provide both visual and audio feedback to compensate the lack of tactile feedback. For that, we generate the concept of a bounding box with a proximity shader. A bounding box is a minimum volumetric area that encloses a 3D object. The bounding box has an interactive rendering mechanism called a proximity shader. The proximity shader behaves:

* When the index finger is within a range, a fingertip spotlight is cast on the surface of the bounding box.
* When the fingertip gets closer to the surface, the spotlight shrinks accordingly.
* As soon as the fingertip touches the surface, the entire bounding box changes color or generates visual effects to reflect the touch state.
* A sound effect can also be activated to enhance the visual touch feedback.

![Bounding box with proximity shader image](images/Bounding-Box-With-Proximity-Shader-720px.jpg)

## Pressable button

With a collidable fingertip, users are now ready to interact with the fundamental holographic UI component, sucha as a pressable button. A pressable button is a holographic button tailored for a direct finger press. Again, due to the lack of tactile feedback, a pressable button equips a couple mechanisms to tackle tactile feedback-related issues.

* The first mechanism is a bounding box with a proximity shader, which isdetailed in the previous section. It give users a better sense of proximity when as approach and make contact with a button.
* The second mechanism is depression. Depression creates a sense of pressing down after a fingertip contacts a button. The mechanism is that the button tightly moves with the fingertip along the depth axis. The button can be triggered when it reaches a designated depth (on press) or leaves the depth (on release) after passing through it.
* The sound effect should be added to enhance feedback when the button is triggered.

![Pressable button image](images/Pressable-Button-720px.jpg)

## 2D slate interaction

A 2D slate is a holographic container hosting 2D app contents, such as web browser. The design concept for interacting with a 2D slate via direct manipulation is to leverage the mental model of interacting with a physical touch screen.

To interact with the slate contact:

* Use an index finger to press a hyperlink or a button.
* Use an index finger to scroll a slate content up and down.
* The user's two index fingers are used to zoom in and out of the slate content, according to the relative motion of the fingers.

![2D slate image](images/2D-Slate-Interaction-720px.jpg)

For manipulating the 2D slate itself:

* Approach your hands toward corners and edges to reveal the closest manipulation affordances.
* Grab the manipulation affordances, and perform uniform scaling through the corner affordances, and reflow via the edge affordances.
* Grab the holobar at the top of the 2D slate, which lets you move the whole slate.

![Image of slate manipulation](images/Manipulate-2d-slate-720px.jpg)

## 3D object manipulation

HoloLens 2 lets lets users enable their hands to direct manipulate 3D holographic objects by applying a bounding box to each 3D object. The bounding box provides better depth perception through its proximity shader. With the bounding box, there are two design approaches for 3D object manipulation.

### Affordance-based manipulation

Affordance-base manipulation lets you manipulate the 3D object through a bounding box along with the manipulation affordances around it. As soon as a user's hand is close to a 3D object, the bounding box and the nearest affordance are revealed. Users can grab the bounding box to move the whole object, the edge affordances to rotate and the corner affordances to scale uniformly.

![3D object manipulation image](images/3D-Object-Manipulation-720px.jpg)

### Non-affordance based manipulation

Non-affordance-based manipulation does not attach affordance to the bounding box. Users can only reveal the bounding box, then directly interact with it. If the bounding box is grabbed with one hand, the translation and rotation of the object are associated to motion and orientation of the hand. When the object is grabbed with two hands, users can translate, scale, and rotate it according to relative motions of two hands.

Specific manipulation requires precision. We recommend that you use **affordance-based manipulation** because it provides a high level of granularity. For flexible manipulation, we recommend you use **non-affordance manipulation** as it allows for instant and playful experiences.

## Instinctual gestures

With HoloLens (1st Gen), we taught users a couple predefined gestures, such as bloom and air tap. For HoloLens 2, we don't ask users to memorize any symbolic gestures. All required user gestures--where users need to interact with holograms and content--are instinctual. The way to achieve instinctual gestures is to help users perform gestures through the design of UI affordances.

For example, if we encourage the user to grab an object or a control point with a two finger pinch, the object or the control point should be small. If we want the user to perform five finger grab, the object or the control point should be relatively large. Similar to buttons, a tiny button would limit users to press it with a single finger; a large button would encourage users to press it with their palms.

![](images/Instinctual-Gestures-720px.jpg)

## Symmetric design between hands and 6 DoF controllers

You may have noticed that there are interaction parallels that we can draw between hands in AR and motion controllers in VR. Both inputs can be used to trigger direct manipulations in their respective environments. In HoloLens 2, grabbing and dragging with hands at a close distance works much the same way as the grab button does on WMR motion controllers. This provides users with interaction familiarity between the two platforms, and might prove useful should you ever decide to port your application from one to the other.

## Optimize with eye tracking

Direct manipulation can feel magical if it works as intended. But can also quickly become frustrating if you can’t move your hand anywhere without unintentionally triggering a hologram. Eye tracking can potentially help in better identifying what the user’s intent is.

* **When**: Reduce unintentionally triggering a manipulation response. Eye tracking allows for better understanding what a user is currently engaged with.
For example, imagine you are reading through a holographic (instructional) text when reaching over to grab you real-world work tool.

By doing so, you accidentally move your hand across some interactive holographic buttons that you hadn't even noticed before (maybe it even was outside of the user's field-of-view (FoV)).

  Long story short: If the user hasn't looked at a hologram for a while, yet a touch or grasp event has been detected for it, it is likely that the user wasn't actually intending to interact with that hologram.

* **Which one**:  Aside from addressing false positive activations, another example includes better identifying which holograms to grab or poke as the precise intersection point may not be clear from your perspective, especially if several holograms are positioned close to each other.

  While eye tracking on HoloLens 2 has a certain limitation on how accurately it can determine you eye gaze, this can still be very helpful for near interactions due to depth disparity when interacting with hand input. This means that it is sometimes difficult to determine whether your hand is behind or in front of a hologram to precisely grab a manipulation widget, for example.

* **Where to**: Use information about what a user is looking at with quick-throwing gestures. Grab a hologram and roughly toss it toward your intended destination.  

    While this may sometimes works work, quickly performing hand gestures may result in highly inaccurate destinations. This is where eye tracking could help out to lean the hand throwing vector back to your intended position.

## See also

* [Head-gaze and commit](gaze-and-commit.md)
* [Point and commit with hands](point-and-commit.md)
* [Instinctual interactions](interaction-fundamentals.md)


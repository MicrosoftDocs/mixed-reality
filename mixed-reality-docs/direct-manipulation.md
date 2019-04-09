---
title: Direct manipulation
description: Overview of the direct manipulation input model
author: caseymeekhof
ms.author: cmeekhof
ms.date: 04/02/2019
ms.topic: article
keywords: Mixed Reality, Gaze, gaze targeting, interaction, design
---

# Direct manipulation
Direct manipulation is an input model that involves touching holograms directly with your hands.  The goal with direct manipulation is that objects behave just as they do in the real world. Buttons can be activated simply by pressing them, objects can be picked up by grabbing them, and 2D content behaves like a virtual touchscreen.  Because of this, direct manipulation is easy for users to learn, and it's fun too.  It is considered a "near" input model, meaning it is best used for interacting with content that is within arms reach.

A key ingredient that makes direct manipulation easy to learn is that it is affordance-based. There are no symbolic gestures to teach users. All interactions should be built around a visual element that can be touched or grabbed.

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
        <td>HoloLens 2</td>
        <td><a href="immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Direct manipulation (near interaction)</td>
        <td>❌ Not supported</td>
        <td>✔️ Recommended</td>
        <td>➕ An alternate option but <a href="TBD-fill-in-file-name.md">Pointing and commit (far interaction) is recommended</td>
    </tr>
</table>

Direct manipulation is a primary input model on HoloLens 2, utilizing the new articulated hand tracking system. The input model is also available on immersive headsets through the use of motion controllers, but is not recommended a primary means of interaction outside of object manipulation.  Direct manipluation is not available on HoloLens v1.

## Button design guidelines (Tony)
- Visual affordances (fingertip cursor, hover feedback, bounding boxes that light up, etc)
- Behavior (button movement, on press vs on release, whether to allow cancel, etc)
- Sizing considerations
- Which fingertips to support, and when

## Object manipulation design guidelines (Tony)
- Discuss the two primary techniques, and when to use either:
  - Full 6DOF (single-hand grab/rotate, with two hands for scaling)
  - Manipulation handles (bounding box with handles for resize/scale on different axis)
- Describe the platform grab gesture that should be used for this
- Visual affordances
- Behavior
- Sizing considerations
- Smoothing the object's movement

## Object manipulation considerations for motion controllers (Tony)
Explain what's unique to motion controllers regarding object manipulation. What do devs need to know. 

## 2D slate design guidelines (Tony)
- Goal is to behave like a touchscreen
  - Touch buttons with fingertip
  - Long press for context menu
  - Scroll with single finger
  - Scale with two fingers
- Recommended affordances
- Recommended button sizes
- Etc...

## Visual comfort guidelines (Tony / Thom)
 - What distance is comfortable for near manipulation

## Optimizing with eye tracking
Direct manipulation can feel magical if it works as intended, but can also quickly become frustrating if you can’t move your hand anywhere anymore without unintentionally triggering a hologram.
Eye tracking can potentially help in better identifying what the user’s intent is. 

1.	**When**: 
Reduce falsely triggering a manipulation response. Eye tracking allows for better understanding what a user is currently engaged with. 
For example, imagine you are reading through a holographic (instructional) text when reaching over to grab you real-world work tool.
By doing so, you accidently move your hand across some interactive holographic buttons that you hadn't even noticed before (maybe it even was outside of the user's Field-of-View).
Long story short: If the user hasn't looked at a hologram for a while, yet a touch or grasp event has been detected for it, it is likely that the user wasn't actually intending to interact with that hologram. 

2.	**Which one**: 
Aside from addressing false positive activations, another example includes better identifying which holograms to grab or poke as the precise intersection point may not be clear from your perspective especially if several holograms are positioned close to each other. 
While eye tracking on HoloLens 2 has a certain limitation on how accurately it can determine you eye gaze, this can still be very helpful for near interactions due to depth disparity when interacting with hand input. 
This means that it is sometimes difficult to determine whether your hand is behind or in front of a hologram to precisely grab a manipulation widget for example.

3.	**Where to**: 
Use information about what a user is looking at with quick throwing gestures. 
Grab a hologram and roughly toss it toward your intended destination. 
While this may sometimes work just fine, quickly performing hand gestures may result in highly inaccurate destinations.
This is where eye tracking could help out to lean the hand throwing vector back to your intended position.

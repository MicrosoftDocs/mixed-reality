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

## Optimizing with eye tracking (Sophie)
 - Discuss how direct manipulation can be improved when ET is avaialble
 - Possible examples:
    - Alowing "close" grabs
    - Multiple object disambiguation
    - Targetting when throwing things

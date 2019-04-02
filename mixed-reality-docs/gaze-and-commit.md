---
title: Gaze and commit
description: Overview of the gaze and commit input model
author: caseymeekhof
ms.author: cmeekhof
ms.date: 03/31/2019
ms.topic: article
keywords: Mixed Reality, Gaze, gaze targeting, interaction, design
---

# Gaze and commit
Gaze and commit is an input model that involves targeting an object with your gaze, and then acting on it with a secondary input such as a hand gesture.  It is considered a "far" input model, meaning it is best used for interacting with content that is beyond arms reach.

## Gaze
The most common form of gaze is called head gaze. Mixed reality headsets use the position and orientation of the user's head to determine their head gaze vector. You can think of this as a laser that points straight ahead from directly between the user's eyes. This is a fairly coarse approximation of where the user is looking. Your application can intersect this ray with virtual or real-world objects and draw a cursor at that location to let the user know what they are currently targetting.

In addition to head gaze, some mixed reality headsets include eye tracking systems that produce an eye gaze vector. This provides a fine-grained measurement of where the user is looking. It is possible to build gaze and commit interactions using eye gaze, but this comes with a very different set of design constraints, which will be covered seperately in this article.

## Commit
After targeting an object or UI element with head or eye gaze, the user can select or "click" it using a secondary input. This is known as the commit step of the gaze-and-commit model. On HoloLens v1, Air tap is the most common method selecting things.

Air tap is a tapping gesture with the hand held upright. To perform an Air tap, raise your index finger to the ready position, then pinch with your thumb and raise your index finger back up to release.

![Finger in the ready position and then a tap or click motion](images/readyandpress.jpg)<br>

Air tap is also available on HoloLens 2, and it has been relaxed from the original version. Nearly all types of pinches are now supported, as long as the hand is upright and holding still. This makes it much easier for users to learn and perform the gesture.  This new Air tap replaces the old one through the same API, so existing applications will get the new behavior automatically after recompiling for HoloLens 2.

Users may also perform a "select" action using any of the following methods:
- Speak the voice command "Select"
- Press the single button on a [HoloLens Clicker](hardware-accessories.md#hololens-clicker)
- Press the 'A' button on an Xbox Gamepad

## Device support
Head gaze and commit is available on all mixed reality headsets. Is the primary input model on HoloLens v1. Other headsets typically include a hand-based pointing mechanism, such as motion controllers or articulated hand tracking. On these devices, applications should prefer [point-and-commit](point-and-commit.md) for far interactions when possible.

Eye gaze and commit is available on HoloLens v2, but is not the primary input model. Jump to the "Eye gaze design guidelines" section for a discussion about when this might make sense for your application.

## Head gaze design guidelines (Jenny?)
- Move content from here: https://docs.microsoft.com/en-us/windows/mixed-reality/gaze-targeting
- Be sure to include:
  - Target size and feedback
  - Target placement
  - Improving targeting behaviors
  - Cursor visuals and behavior

## Eye gaze design guidelines (Sophie)
 - Describe the cases where you might want to do this
 - Design guidelines for target size and feedback. Examples:
   - Gaze feedback
   - Visual affordances
   - Button design
   - Etc...

## Gaze and dwell (Jenny?)
 - Describe when this might be a viable alternative to gaze and commit
- Design guidelines

## Composite gestures (Jenny?)
- Move from "composite gestures" section here: https://docs.microsoft.com/en-us/windows/mixed-reality/gestures#composite-gestures
- Note that these are available on HoloLens v1 and v2
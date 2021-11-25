---
title: Head-gaze and commit
description: Get started with the head-gaze and commit input model, including target sizing, placement, and stabilization.
author: caseymeekhof
ms.author: cmeekhof
ms.date: 03/31/2019
ms.topic: article
keywords: Mixed Reality, gaze, gaze targeting, interaction, design, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens, MRTK, Mixed Reality Toolkit, target, focus, smoothing
---

# Head-gaze and commit

_Head-gaze and commit_ is a special case of the [gaze and commit](gaze-and-commit.md) input model that involves targeting an object with a users head direction. You can act on the target with a secondary input, such as the hand gesture air tap or "Select" voice command. 

## Device support

<table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <tr>
        <td><strong>Input model</strong></td>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens (1st gen)</strong></a></td>
        <td><a href="/hololens/hololens2-hardware"><strong>HoloLens 2</strong></td>
        <td><a href="../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Head-gaze and commit</td>
        <td>✔️ Recommended</td>
        <td>✔️ Recommended (third choice - <a href="interaction-fundamentals.md">See the other options</a>)</td>
        <td>➕ Alternate option</td>
    </tr>
</table>

---

## Head and eye tracking design concepts demo

If you'd like to see Head and Eye Tracking design concepts in action, check out our **Designing Holograms - Head Tracking and Eye Tracking** video demo below. When you've finished, continue on for a more detailed dive into specific topics.

> [!VIDEO https://docs.microsoft.com/en-us/shows/Docs-Mixed-Reality/Microsofts-Designing-Holograms-Head-Tracking-and-Eye-Tracking-Chapter/player]

*This video was taken from the "Designing Holograms" HoloLens 2 app. Download and enjoy the full experience [here](https://aka.ms/dhapp).*

## Target sizing and feedback

The head gaze vector has been shown repeatedly to be usable for fine targeting, but often works best for gross targeting--acquiring larger targets. 
Minimum target sizes of 1 degree to 1.5 degrees allow successful user actions in most scenarios, though targets of 3 degrees often allow for greater speed. 
The size that the user targets is effectively a 2D area even for 3D elements--whichever projection is facing them should be the targetable area. 
Providing some salient cue that an element is "active" (that the user is targeting it) is helpful. 
This can include treatments like visible "hover" effects, audio highlights or clicks, or clear alignment of a cursor with an element.

![Optimal target size at 2 meter distance](images/gazetargeting-size-1000px.jpg)<br>
*Optimal target size at 2-meter distance*

<br>

![An example of highlighting a gaze targeted object](images/gazetargeting-highlighting-940px.jpg)<br>
*An example of highlighting a gaze targeted object*

## Target placement

Users often fail to find UI elements located either too high or low in their field of view. Most of their attention ends up on areas around their main focus, which is approximately at eye level. Placing most targets in some reasonable band around eye level can help. Given the tendency for users to focus on a relatively small visual area at any time (the attentional cone of vision is roughly 10 degrees), grouping UI elements together to the degree they're related conceptually can use attention-chaining behaviors from item to item as a user moves their gaze through an area. When designing UI, keep in mind the potential large variation in field of view between HoloLens and immersive headsets.

![An example of grouped UI elements for easier gaze targeting in Galaxy Explorer](images/gazetargeting-grouping-1000px.jpg)<br>
*An example of grouped UI elements for easier gaze targeting in Galaxy Explorer*

## Improving targeting behaviors

If user intent to target something can be determined or closely approximated, it can be helpful to accept near miss interaction attempts as though they were targeted correctly. Here's a handful of successful methods that can be incorporated in mixed reality experiences:

### Head-gaze stabilization ("gravity wells")

This should be turned on most or all of the time. This technique removes the natural head and neck jitters that users might have as well movement because of looking and speaking behaviors.

### Closest link algorithms

These algorithms work best in areas with sparse interactive content. If there's a high probability that you can determine what a user was attempting to interact with, you can supplement their targeting abilities by assuming some level of intent.

### Backdating and postdating actions

This mechanism is useful in tasks requiring speed. When a user is moving through a series of targeting and activation maneuvers at speed, it's useful to assume some intent. It's also useful to allow missed steps to act on targets that the user had in focus slightly before or slightly after the tap (50 ms before/after was effective in early testing).

### Smoothing

This mechanism is useful for pathing movements, reducing the slight jitter and wobbles because of natural head movement characteristics. When smoothing over pathing motions, smooth by the size and distance of movements rather than over time.

### Magnetism

This mechanism can be thought of as a more general version of closest link algorithms--drawing a cursor toward a target or simply increasing hitboxes, whether visibly or not, as users approach likely targets by using some knowledge of the interactive layout to better approach user intent. This can be powerful for small targets.

### Focus stickiness

When determining which nearby interactive elements to give,  focus to, focus stickiness provides a bias to the element that is currently focused. This helps reduce erratic focus switching behaviors when floating at a midpoint between two elements with natural noise.

## See also

* [Eye-based interaction](eye-gaze-interaction.md)
* [Gaze and dwell](gaze-and-dwell.md)
* [Hands - Direct manipulation](direct-manipulation.md)
* [Hands - Gestures](gaze-and-commit.md#composite-gestures)
* [Hands - Point and commit](point-and-commit.md)
* [Instinctual interactions](interaction-fundamentals.md)
* [Voice input](voice-input.md)
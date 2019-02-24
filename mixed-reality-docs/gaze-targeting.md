---
title: Gaze targeting
description: All interactions are built upon the ability of a user to target the element they want to interact with, regardless of the input modality.
author: cre8ivepark
ms.author: jennyk
ms.date: 02/24/2019
ms.topic: article
keywords: Mixed Reality, Gaze, gaze targeting, interaction, design
---



# Gaze targeting

All interactions are built upon the ability of a user to target the element they want to interact with, regardless of the input modality. In Windows Mixed Reality, this is generally done using the user's gaze.

To enable a user to work with an experience successfully, the system's calculated understanding of a user's intent, and the user's actual intent, must align as closely as possible. To the degree that the system interprets the user's intended actions correctly, satisfaction increases and performance improves.

## Device support

<table>
<tr>
<th>Feature</th><th style="width:150px"> <a href="hololens-hardware-details.md">HoloLens (1st gen)</a></th><th style="width:150px">HoloLens 2</th><th style="width:150px"> <a href="immersive-headset-hardware-details.md">Immersive headsets</a></th>
</tr><tr>
<td> Gaze targeting</td><td style="text-align: center;"> ✔️</td><td style="text-align: center;"> ✔️</td><td style="text-align: center;">✔️ </td>
</tr>
</table>

> [!NOTE]
> More guidance specific to HoloLens 2 [coming soon](index.md#news-and-notes).

## Target sizing and feedback

The gaze vector has been shown repeatedly to be usable for fine targeting, but often works best for gross targeting (acquiring somewhat larger targets). Minimum target sizes of 1 to 1.5 degrees should allow successful user actions in most scenarios, though targets of 3 degrees often allow for greater speed. Note that the size that the user targets is effectively a 2D area even for 3D elements--whichever projection is facing them should be the targetable area. Providing some salient cue that an element is "active" (that the user is targeting it) is extremely helpful - this can include treatments like visible "hover" effects, audio highlights or clicks, or clear alignment of a cursor with an element.

![Optimal target size at 2 meter distance](images/gazetargeting-size-1000px.jpg)<br>
*Optimal target size at 2 meter distance*

![An example of highlighting a gaze targeted object](images/gazetargeting-highlighting-640px.jpg)<br>
*An example of highlighting a gaze targeted object*

## Target placement

Users will often fail to find UI elements that are positioned very high or very low in their field of view, focusing most of their attention on areas around their main focus (usually roughly eye level). Placing most targets in some reasonable band around eye level can help. Given the tendency for users to focus on a relatively small visual area at any time (the attentional cone of vision is roughly 10 degrees), grouping UI elements together to the degree that they're related conceptually can leverage attention-chaining behaviors from item to item as a user moves their gaze through an area. When designing UI, keep in mind the potential large variation in field of view between HoloLens and immersive headsets.

![An example of grouped UI elements for easier gaze targeting in Galaxy Explorer](images/gazetargeting-grouping-1000px.jpg)<br>
*An example of grouped UI elements for easier gaze targeting in Galaxy Explorer*

## Improving targeting behaviors

If user intent to target something can be determined (or approximated closely), it can be very helpful to accept "near miss" attempts at interaction as though they were targeted correctly. There are a handful of successful methods that can be incorporated in mixed reality experiences:

### Gaze stabilization ("gravity wells")

This should be turned on most/all of the time. This technique removes the natural head/neck jitters that users may have. Also movement due to looking/speaking behaviors.

### Closest link algorithms

These work best in areas with sparse interactive content. If there is a high probability that you can determine what a user was attempting to interact with, you can supplement their targeting abilities by simply assuming some level of intent.

### Backdating/postdating actions

This mechanism is useful in tasks requiring speed. When a user is moving through a series of targeting/activation maneuvers at speed, it can be useful to assume some intent and allow *missed steps* to act upon targets which the user had in focus slightly before or slightly after the tap (50ms before/after was effective in early testing).

### Smoothing

This mechanism is useful for pathing movements, reducing the slight jitter/wobble due to natural head movement characteristics. When smoothing over pathing motions, smooth by size/distance of movements rather than over time

### Magnetism

This mechanism can be thought of as a more general version of "Closest link" algorithms - drawing a cursor toward a target, or simply increasing hitboxes (whether visibly or not) as users approach likely targets, using some knowledge of the interactive layout to better approach user intent. This can be particularly powerful for small targets.

### Focus stickiness

When determining which nearby interactive elements to give focus to, provide a bias to the element that is currently focused. This will help reduce erratic focus switching behaviours when floating at a midpoint between two elements with natural noise.

## See also
* [Gestures](gestures.md)
* [Voice design](voice-design.md)
* [Cursors](cursors.md)

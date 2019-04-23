---
title: Optimizing your app for hands-free
description: Optimizing your app for hands-free
author: shengkait
ms.author: shengkait
ms.date: 04/20/2019
ms.topic: article
keywords: Mixed Reality, hands-free, gaze, gaze targeting, interaction, design
---


# Optimizing your app for hands-free



## Scenarios

As outlined in the <a href="mixed-reality-docs/interaction-fundamentals.md">design guidelines</a>, once you have identified the users and their goals, ask yourself what environmental or situational challenges they might face as they work to accomplish their tasks. For example, many users need to use their hands to accomplish their real-world goals and will have difficulty interacting with a hands-and-controllers based interface. 

Some specific scenarios might be: 
* Being guided through a task, while hands are busy
* Referencing materials while your hands are busy
* Hand fatigue
* Gloves that can't be tracked
* Carrying something


## Hands-free modes

For more details on the implementation of hands-free, try the links below. 
* <a href="mixed-reality-docs/voice-design.md">Speech commanding</a>
* Head Gaze + dwell

		
## Usability checklist

**Are there UI and voice equivalents for gestures?**
* Hands-free substitutions for gestures are often neglected, and controlling UI elements so they are optimally placed and sized is often a situation-by-situation decision from the user and hard to do without hands.
* Ensure that there is a replacement for system gesture, resizing, placing, swipes, taps, etc.
* Ensure that the user has confident control of UI presence, placement, verbosity at all times
	* Getting UI out of the way
	* Addressing UI that is out of field of view (FOV)
	* How much I see, where, when

**Are the mechanics of the interaction being taught and reinforced with the right affordances?**
Does the user understand ...
	* ... What mode they are in?
	* ... What they can do in this mode?
	* ... What is the current state?
	* ... How they can transition out?
	
**Is the UI optimized for hands-free?**
* Ex. Dwell affordances are not built-in to typical 2D patterns; [needs a graphic] 
* Ex. Voice targeting is better with object highlighting [needs a graphic]
* Ex. Voice interactions are better with captions that have to be turned on [needs a graphic]


## See also
* [Gaze and commit](gaze-and-commit.md)
* [Direct manipulation](direct-manipulation.md)
* [Point and commit](point-and-commit.md)

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

As outlined in the [link] design guidelines, once you have identified the users and their goals, ask yourself what environmental or situational challenges they might face as they work to accomplish their tasks. For example, many users need to use their hands to accomplish their real-world goals and will have difficulty interacting with a hands-and-controllers based interface. 

Some specific scenarios might be: 
* Being guided through a task, while hands are busy
* Referencing materials while your hands are busy
* Hand fatigue
* Gloves that can't be tracked
* Carrying something


## Hands-free modes

For more details on the implementation of hands-free, try the links below. 
* Speech commanding
	* Commanding 
	* Assistant
* Gaze + commit
	* Eye gaze + "select" or blink
	* Head gaze + "select" 
* Head Gaze + dwell


## Design challenges for creating a hands-free interface 

**Manipulation: hands-free substitutions for manipulation are often neglected.** 
* Controlling UI elements so they are optimally placed and sized is often a situation-by-situation decision from the user and hard to do without hands.

**Awareness: Mechanics are not as 'natural' as hands, so they have to be taught**
* Ex. How would I know how to use voice commanding, then transitioning to pointer or dwell?
* Ex. How do I know how to turn on voice commanding? 

**Refactoring UI: Affordances are less 'natural' and have to be optimized for hands-free**
* Ex. Dwell affordances are not built-in to typical 2D patterns; 
* Ex. Voice targeting is better with object highlighting
* Ex. Voice interactions are better with captions that have to be turned on 

		
## Usability Checklist

**Are there UI and voice equivalents for gestures?**
* Replacement for system gesture, resizing, placing, swipes, taps, etc.

**Does the user have confident control of UI presence, placement, verbosity at all times?**
* Getting UI out of the way
* Addressing UI that is out of FOV
* How much I see, where, when

**Does the user understand ...**
* ... What mode they are in?
* ... What they can do in this mode?
* ... What is the current state?
* ... How they can transition out?

## See also
* [Gaze and commit](gaze-and-commit.md)
* [Direct manipulation](direct-manipulation.md)
* [Point and commit](point-and-commit.md)

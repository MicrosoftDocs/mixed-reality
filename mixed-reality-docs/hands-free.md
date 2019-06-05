---
title: Hands-free
description: Optimizing your app for hands-free
author: liamar
ms.author: liamar
ms.date: 04/20/2019
ms.topic: article
keywords: Mixed Reality, hands-free, gaze, gaze targeting, interaction, design
---


# Hands-free



## Scenarios

As outlined in the [interaction model overview](interaction-fundamentals.md), once you have identified the users and their goals, ask yourself what environmental or situational challenges they might face as they work to accomplish their tasks. For example, many users need to use their hands to accomplish their real-world goals and will have difficulty interacting with a hands-and-controllers based interface. 

Some specific scenarios might be: 
* Being guided through a task, while hands are busy
* Referencing materials while your hands are busy
* Hand fatigue
* Gloves that can't be tracked
* Carrying something


## Hands-free modalities

### [Voice commanding](voice-design.md)

Using your voice to command and control an interface can not only allow the user to operate handsfree, but also skip multiple steps. The usage of this modality can range from allowing the user to simply reading any button's name out loud to activate it, as in See-it-say-it, to conversing with an agent who can accomplish tasks for you.



### [Head-gaze and dwell](gaze-and-dwell.md)

In some hands-free situations, using your voice is not ideal or even possible. Loud factory environments, privacy, or social norms can all be constraints. The head gaze + dwell model allows the user to navigate the app by using their head vector to point, while lingering, or dwelling on a button will activate it after a certain amount of time (typically around 1 second or so). 


## Transitioning in and out of hands-free

For these scenarios, freeing your hands from interacting with holograms for commanding and navigation can range from being an absolute requirement to operating the app, end-to-end, to an added convenience that the user can transition in and out of at any time. 

If the requirement of the app is that it will always be used hands-free, whether by using dwell, voice commands, or the single voice command, "select", then make sure to make the appropriate accomodations in your UI. 

If your target user needs to be able to switch from hands to hands-free at their discretion, then it is important to take these principles into account:

### Assume the user is already in the mode that they want to switch to
For instance, if your user is on the factory floor, watching a video reference on her Hololens, and decides to pick up a wrench to start working, she most likely would like to begin working in handsfree without having to put down the wrench to press a button. She should be able to invoke a voice session with a voice command, dwell on already-visible UI to begin dwell, or say the word "select".

The user should have the ability to: 
* Switch to handsfree while handsfree
* Switch to hands with your hands
* Switch to the controller using a controller 

### Create redundant ways to switch modes
While the first principle is about access, the second one is about availability. There should not just be a single way to transition in and out of a mode. 

Some examples would be: 
* A button to begin voice interactions
* A voice command to transition to using gaze + dwell

### Add a dash of drama
A mode switch is a big deal -- it is important that when these transitions happen, that they be an explicit, even dramatic switch, to let the user know what happened. 


## Usability checklist

**Can the user do everything and anything hands-free, end-to-end?**
* Every interactible should be accessible hands-free
* Ensure that there is a replacement for all custom gestures, such as resizing, placing, swipes, taps, etc.
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

* Ex. Dwell affordances are not built-in to typical 2D patterns
* Ex. Voice targeting is better with object highlighting
* Ex. Voice interactions are better with captions that have to be turned on


## See also
* [Head-gaze and commit](gaze-and-commit.md)
* [Direct manipulation with hands](direct-manipulation.md)
* [Point and commit with hands](point-and-commit.md)

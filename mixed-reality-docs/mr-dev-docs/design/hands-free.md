---
title: Hands-free
description: Learn about the difficulties that users may face with a hands-and-controllers interface, and about various hands-free alternatives.
author: sean-kerawala
ms.author: sekerawa
ms.date: 04/20/2019
ms.topic: article
keywords: Mixed Reality, hands-free, gaze, gaze targeting, interaction, design, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens, MRTK, Mixed Reality Toolkit, voice input, usability
---

# Hands-free

## Scenarios

As outlined in the [interaction model overview](interaction-fundamentals.md), once you've identified your users and their goals, ask yourself what environmental or situational challenges they might face as they work to accomplish their tasks. 
For example, many users need to use their hands to accomplish their real-world goals, and they'll have difficulty interacting with a hands-and-controllers based interface.

Some specific scenarios include: 
* Being guided through a task, while the user's hands are busy
* Referencing materials while the user's hands are busy
* Hand fatigue
* Gloves that can't be tracked
* Carrying something in their hands
* Social awkwardness when using large hand gestures
* Tight spaces

## Hands-free modalities

### [Voice input](voice-input.md)

Using your voice to command and control an interface offers a convenient way to operate hands-free and to use shortcuts to skip multiple steps if you want. 
With voice input, the user can read any button's name out loud to activate it _("see it, say it")_ and converse with a digital agent who can accomplish tasks for you.

### [Gaze and dwell](gaze-and-dwell.md)

In some hands-free situations, using your voice isn't ideal or even possible. 
Loud factory environments, privacy, or social norms can all be constraints. 
The gaze + dwell model allows the user to navigate an app without any extra input aside from their eye or head gaze: 
The user simply keeps gazing (with their head or eyes) at the target and lingers there for a moment to activate it. 
To learn more about the individual design considerations for gaze + dwell, check out [eye-gaze + dwell](gaze-and-dwell-eyes.md) and [head-gaze + dwell](gaze-and-dwell-head.md).

## Transitioning in and out of hands-free

For these scenarios, freeing your hands from interacting with holograms for commanding and navigation can range from being an absolute requirement to operating the application, end-to-end, to an added convenience that the user can transition in and out of at any time. 

If the application requires that it will always be used hands-free, whether by using dwell, custom voice commands, or the single voice command, "select", then make sure to make the appropriate accommodations in your UI. 

If your target user needs to switch from hands to hands-free at their discretion, then it's important to take the following principles into account.

### Assume the user is already in the mode that they want to switch to
For instance, if the user is on the factory floor, watching a video reference on her HoloLens, and decides to pick up a wrench to start working, she most likely would start working in hands-free without having to put down the wrench to press a button. She can invoke a voice session with a voice command, dwell on an already-visible UI to begin dwell, or say the word "select".

The user can: 
* Switch to hands-free while hands-free
* Switch to hands with your hands
* Switch to the controller using a controller 

### Create redundant ways to switch modes

While the first principle is about access, the second one is about availability. There shouldn't just be a single way to transition in and out of a mode. 

Some examples would be: 
* A button to begin voice interactions
* A voice command to transition to, using head-gaze and dwell

### Add a dash of drama

A mode switch is a big deal. It's important that when these transitions happen that they be an explicit, even a dramatic switch, to let the user know what happened. 

## Usability checklist

**Can the user do everything and anything hands-free, end-to-end?**
* Every interactable should be accessible hands-free
* Ensure that there's a replacement for all custom gestures, such as resizing, placing, swipes, taps, and so on.
* Ensure that the user has confident control of UI presence, placement, and verbosity always
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

* Example: Dwell affordances aren't built in to typical 2D patterns
* Example: Voice targeting is better with object highlighting
* Example: Voice interactions are better with captions that need to be turned on

## See also

* [Eye tracking on HoloLens 2](eye-tracking.md)
* [Gaze and commit](gaze-and-commit.md)
* [Gaze and dwell](gaze-and-dwell.md)
* [Hands - Direct manipulation](direct-manipulation.md)
* [Hands - Gestures](gaze-and-commit.md#composite-gestures)
* [Hands - Point and commit](point-and-commit.md)
* [Instinctual interactions](interaction-fundamentals.md)
* [Voice input](voice-input.md)

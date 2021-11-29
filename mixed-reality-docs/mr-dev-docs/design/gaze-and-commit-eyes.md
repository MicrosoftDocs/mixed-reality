---
title: Eye-gaze and commit
description: Learn about the eye-gaze and commit input model.
author: sostel
ms.author: sostel
ms.date: 05/05/2019
ms.topic: article
ms.localizationpriority: high
keywords: Eye Tracking, Mixed Reality, Input, Eye Gaze, Eye Targeting, HoloLens 2, Eye-based Selection, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens, MRTK, Mixed Reality Toolkit, gaze
---

# Eye-gaze and commit

_Eye-gaze and commit_ is a special [gaze and commit](gaze-and-commit.md) input model case that involves targeting an object by looking at it. You can act on the target with a secondary _commit_ input, such as a hand gesture, voice command, or peripheral input like a game controller. 

With HoloLens 2, we have the great opportunity to make _gaze and commit_ faster and more comfortable by using eye-gaze instead of head-gaze. 
To extend the common [head-gaze and commit](gaze-and-commit.md) interaction model: 
1. Look at a target 
2. To confirm your intention to select the target, use a secondary explicit input such as a:  
   - Hand gesture (for example, an Air Tap)
   - Button press (for example, on a Bluetooth keyboard or clicker)
   - Voice command (for example, "Select")
   - Dwelling (that is, the user simply keeps looking at the target to select)

However, eye gaze behaves differently to head gaze in certain ways and comes with many unique challenges. 

In the [Eye Gaze Design Guidelines](eye-tracking.md), we summarize general advantages and challenges when using eye tracking as an input in your holographic app. 
In this section, we focus on the specific design considerations for _eye-gaze and commit_.
First, our eyes move incredibly fast and are great at quickly targeting across the view. 
Eye-gaze is ideal for quick gaze-and-commit actions especially when combined with fast commits such as an air tap or button press.

## Head and eye tracking design concepts demo

If you'd like to see Head and Eye Tracking design concepts in action, check out our **Designing Holograms - Head Tracking and Eye Tracking** video demo below. When you've finished, continue on for a more detailed dive into specific topics.

> [!VIDEO https://docs.microsoft.com/en-us/shows/Docs-Mixed-Reality/Microsofts-Designing-Holograms-Head-Tracking-and-Eye-Tracking-Chapter/player]

*This video was taken from the "Designing Holograms" HoloLens 2 app. Download and enjoy the full experience [here](https://aka.ms/dhapp).*
   
## Design guidelines for eye-gaze and commit

**Don't show a cursor**: 
While it's nearly impossible to interact without a cursor when using head gaze, the cursor becomes quickly distracting and annoying when using eye gaze. 
Instead of relying on a cursor to inform the user whether eye tracking is working and has correctly detected the currently looked at target, use subtle visual highlights.

**Strive for subtle blended hover feedback**: 
What seems great visual feedback for head gaze can result in terrible, overwhelming experiences using eye gaze. 
Remember, your eyes are enormously fast, quickly darting across points in your field-of-view. 
Quick sudden highlight changes (on/off) may result in flickery feedback when looking around. 
So, when providing hover feedback, we recommend using a smoothly blended-in highlight (and blended-out when looking away). 
This means at first you would barely notice the feedback when looking at a target. 
Over the course of 500-1000 ms the highlight would increase in intensity. 
While novice users could keep looking at the target to ensure the system has correctly determined the focused target, expert users could quickly gaze-and-commit without waiting until the feedback is at its full intensity. 
We also recommend using a blend-out when fading out the hover feedback. 
Research has shown that quick motions and contrast changes are noticeable in your peripheral vision (the area of your visual field where you aren't looking).
The fade-out doesn't have to be as slow as the blend-in. 
This is only critical when you have high contrast or color changes for your highlight. 
If the hover feedback was subtle to begin with, you probably won't notice a difference.

**Look out for synchronizing gaze and commit signals**: 
The synchronization of input signals may be less of a challenge for simple air taps and button presses. 
It's something to look out for in case you want to use more complicated commit actions that may involve long voice commands or complicated hand gestures. 
Imagine you look at a target and utter a long voice command. 
Think about the time you need to say it and the time that the system needed to detect what you said, your eye gaze has long moved on to some new target in the scene. 
Either make your users aware they may need to keep looking at a target until the command has been recognized or handle the input in a way to determine the onset of the command and what the user had been looking at back then.

## See also

* [Eye-based interaction] (eye-gaze-interaction.md)
* [Eye tracking on HoloLens 2] (eye-tracking.md)
* [Gaze and commit](gaze-and-commit.md)
* [Gaze and dwell](gaze-and-dwell.md)
* [Hands - Direct manipulation](direct-manipulation.md)
* [Hands - Gestures](gaze-and-commit.md#composite-gestures)
* [Hands - Point and commit](point-and-commit.md)
* [Instinctual interactions](interaction-fundamentals.md)
* [Voice input](voice-input.md)

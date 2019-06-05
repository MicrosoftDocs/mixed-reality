---
title: Eye-gaze and commit
description: Overview of the eye-gaze and commit input model
author: sostel
ms.author: sostel
ms.date: 05/05/2019
ms.topic: article
ms.localizationpriority: high
keywords: Eye Tracking, Mixed Reality, Input, Eye Gaze, Eye Targeting, HoloLens 2, Eye-based Selection
---

# Eye-gaze and commit
With HoloLens 2, we have the great opportunity to make gaze & commit faster and more comfortable by using eye gaze instead of head gaze. 
This allows to extend the common [head-gaze and commit](gaze-and-commit.md) interaction model: 
1. Simply look at a target and 
2. To confirm your intention to select the target, perform a secondary explicit input such as a:  
   - Hand gesture (e.g., an Air Tap)
   - Button press (e.g., on a Bluetooth keyboard or clicker)
   - Voice command (e.g., "Select")
   - Dwelling (i.e., the user simply keeps looking at the target to select)

However, eye gaze behaves very differently to head gaze in certain ways and hence comes with a number of unique challenges. 
In the [Eye Gaze Design Guidelines](eye-tracking.md), we summarize general advantages and challenges to take into account when using eye tracking as an input in your holographic app. 
In this section, we focus on the specific design considerations for eye-gaze & commit.
First, our eyes move incredibly fast and thus are great at quickly targeting across the view. 
This makes eye gaze ideal for quick gaze-and-commit actions especially when combined with fast commits such as an air-tap or button press.
   
In the following, we will address design guidelines when using eye gaze for this type of interaction and will discuss differences between head and eye gaze that you should keep in mind.

## Design guidelines for eye-gaze and commit

**Do not show a cursor**: While it is nearly impossible to interact without a cursor when using head gaze, the cursor becomes quickly distracting and annoying when using eye gaze. Instead of relying on a cursor to inform the user whether eye tracking is working and has correctly detected the currently looked at target, use subtle visual highlights (more details below).

**Strive for subtle blended hover feedback**: What seems great visual feedback for head gaze can result in terrible, overwhelming experiences using eye gaze. Remember that your eyes are enormously fast, quickly darting across points in your field-of-view. Quick sudden highlight changes (on/off) may result in flickery feedback when looking around. So, when providing hover feedback, we recommend using a smoothly blended-in highlight (and blended-out when looking away). This means that at first you would barely notice the feedback when looking at a target. Over the course of 500-1000 ms the highlight would increase in intensity. While novice users could keep looking at the target to ensure that the system has correctly determined the focused target, expert users could quickly gaze & commit without waiting until the feedback is at its full intensity. In addition, we also recommend using a blend-out when fading out the hover feedback. Research has shown that quick motion and contrast changes are very noticeable in your peripheral vision (so, the area of your visual field where you are not looking). The fade-out doesn't have to be as slow as the blend-in. This is only critical when you have high contrast or color changes for your highlight. If the hover feedback was pretty subtle to begin with, you probably won't notice a difference.

**Look out for synchronizing gaze and commit signals**: The synchronization of input signals may be less of a challenge for simple gaze & commit, so, don't worry! It is something to look out for in case you want to use more complicated commit actions though that may involve long voice commands or complicated hand gestures. Imagine you look at target and utter a long voice command. Taken into account the time that you needed to speak and the time that the system needed to detect what you said, your eye gaze has usually long moved on to some new target in the scene. Hence, either make your users aware that they may need to keep looking at a target until the command has been recognized or handle the input in a way to determine the onset of the command and what the user had been looking at back then.

## See also
* [Head-gaze and commit](gaze-and-commit.md)
* [Hand gestures](gestures.md)
* [Voice input](voice-design.md)
* [Motion controllers](motion-controllers.md)

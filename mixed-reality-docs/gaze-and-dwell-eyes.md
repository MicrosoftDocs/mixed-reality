---
title: Eye-gaze and dwell
description: Overview of the eye-gaze and dwell input model
author: sostel
ms.author: sostel
ms.date: 10/29/2019
ms.topic: article
ms.localizationpriority: high
keywords: Eye Tracking, Mixed Reality, Input, Eye Gaze, Eye Targeting, HoloLens 2, Eye-based Selection, Dwell
---

# Eye-gaze and dwell

The _"eye-gaze and dwell"_ interaction model is a special case of the [eye-gaze and commit](gaze-and-commit.md) interaction model:
1. Simply look at a target and 
2. To confirm your intention to select the target, perform a secondary explicit input: _Simply keep looking at the target you would like to select_.

## Advantages of the "eye-gaze and dwell" interaction model 
When your hands are already occupied with a task or holding tools, using them for interacting with holograms may not be an option.
A hands-free interaction alternative for selecting holograms is "eye-gaze and dwell" or in other words: _"look and stare"_. 
The advantage of this approach is that even severely constrained users who may not be able to fully turn their heads or bodies can interact with holograms (e.g., in a highly confined work environment).
The user simply keeps looking at the target they would like to select and different dwell feedback is displayed to indicate the process.


## Challenges of the "eye-gaze and dwell" interaction model
In general, we  recommend to only use dwell-based activations as a last fall-back if neither voice input nor hand input is available. 
The reason is that the choice of dwell time can be pretty tricky. Novice users are ok with longer dwell times, while expert users want to quickly and efficiently navigate through their experiences. 
This leads to the challenge of how to adjust the dwell time to the specific needs of a user.
If the dwell time is too short: The user may feel overwhelmed by having holograms reach to their eye-gaze all the time. 
If the dwell time is too long: The experience may feel too slow and interruptive as the user has to keep looking at targets for a long time.

## Design recommendations
We recommend using a two-state approach for dwell feedback:
1. *Onset delay*: When the user starts looking at a target, nothing should immediately happen as this may result in an unpleasant and overwhelming user experience. Instead we start a timer to detect whether the user is intentionally staring at the target or merely skimming over it.
2. *Start dwell feedback:* After ensuring that the user is intentionally looking at the target, we start showing dwell feedback to inform the user that the dwell activation is being initiated. We recommend an onset time of 150-250 ms in a given proximity (meaning the user is fixating vs. looking around on a large target).  
3. *Continuous Feedback:* While the user keeps looking at the target, show a continuous progress indicator so that the user knows that they have to keep looking at the target. In particular for eye-gaze input, we recommend _pulling in the user's visual attention_ by starting out with a bigger circle or sphere that contracts into a smaller version. Showing an indicator for the final state (small circle) helps to communicate to the user when the dwell will be finished. An example illustration is shown below. 
4. *Finish:* If the user kept fixating the target (for another 650-850 ms), complete the dwell activation and select the looked-at target.

![Dwell states](images/eyes_dwellstate_recommendation.png)<br>

## See also
* [Eye tracking](eye-tracking.md)
* [Eye-gaze and commit](gaze-and-commit-eyes.md)
* [Gaze and commit](gaze-and-commit.md)
* [Gaze and dwell](gaze-and-dwell.md)
* [Voice input](voice-design.md)

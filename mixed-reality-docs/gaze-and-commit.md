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
        <td><a href="hololens-hardware-details.md"><strong>HoloLens (1st gen)</strong></a></td>
        <td><strong>HoloLens 2</strong></td>
        <td><a href="immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Gaze and commit</td>
        <td>✔️ Recommended</td>
        <td>✔️ Recommended (third choice - <a href="interaction-fundamentals.md">See the other options</a>)</td>
        <td>➕ Alternate option</td>
    </tr>
</table>

## Gaze
The most common form of gaze is called head gaze. Mixed reality headsets use the position and orientation of the user's head to determine their head gaze vector. You can think of this as a laser that points straight ahead from directly between the user's eyes. This is a fairly coarse approximation of where the user is looking. Your application can intersect this ray with virtual or real-world objects and draw a cursor at that location to let the user know what they are currently targetting.

In addition to head gaze, some mixed reality headsets include eye tracking systems that produce an eye gaze vector. This provides a fine-grained measurement of where the user is looking. It is possible to build gaze and commit interactions using eye gaze, but this comes with a very different set of design constraints, which will be covered seperately in this article.

## Commit
After targeting an object or UI element with head or eye gaze, the user can select or "click" it using a secondary input. This is known as the commit step of the gaze-and-commit model. On HoloLens (1st gen), Air tap is the most common method selecting things.

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

## Eye gaze design guidelines
With HoloLens 2, we have the great opportunity to make _gaze & commit_ faster and more comfortable by using eye gaze instead of head gaze. 
However, eye gaze behaves very differently to head gaze in certain ways and hence comes with a number of unique challenges.
In [Eye Gaze Design Guidelines](eye-tracking.md#eye-gaze-design-guidelines), we summarize general advantages and challenges to take into account when using eye tracking as an input medium in your holographic app. 
In this section, we focus on the specific design considerations for _eye gaze & commit_.
First, our eyes move incredibly fast and thus are great at quickly targeting across the view.
This makes eye gaze ideal for quick _gaze & commit_ actions especially when combined with fast commits such as an air-tap or button press. 

- **Do not show a cursor**: 
While it is nearly impossible to interact without a cursor when using head gaze, the cursor becomes quickly distracting and annoying when using eye gaze.
Instead of relying on a cursor to inform the user whether eye tracking is working and has correctly detected the currently looked at target, use subtle visual highlights (more details below).

- **Strive for subtle blended hover feedback**: 
What seems great visual feedback for head gaze can result in terrible, overwhelming experiences using eye gaze.
Remember that your eyes are enormously fast, quickly darting across points in your field-of-view. 
Quick sudden highlight changes (on/off) may result in flickery feedback when looking around. 
So, when providing hover feedback, we recommend using a smoothly blended-in highlight (and blended-out when looking away). 
This means that at first you would barely notice the feedback when looking at a target.
Over the course of 500-1000 ms the highlight would increase in intensity.
While novice users could keep looking at the target to ensure that the system has correctly determined the focused target, expert users could quickly _gaze & commit_ without waiting until the feedback is at its full intensity. 
In addition, we also recommend using a blend-out when fading out the hover feedback. 
Research has shown that quick motion and contrast changes are very noticeable in your peripheral vision (so, the area of your visual field where you are _not_ looking). 
The fade-out doesn't have to be as slow as the blend-in. 
This is only critical when you have high contrast or color changes for your highlight.
If the hover feedback was pretty subtle to begin with, you probably won't notice a difference.

- **Look out for synchronizing gaze and commit signals**:
The synchronization of input signals may be less of a challenge for simple _gaze & commit_, so, don't worry! 
It is something to look out for in case you want to use more complicated _commit_ actions though that may involve long voice commands or complicated hand gestures. 
Imagine you look at target and utter a long voice command. 
Taken into account the time that you needed to speak and the time that the system needed to detect what you said, your eye gaze has usually long moved on to some new target in the scene.
Hence, either make your users aware that they may need to keep looking at a target until the command has been recognized or handle the input in a way to determine the onset of the command and what the user had been looking at back then.

  
## Gaze and dwell
There are lots of different ways to confirm a _commit_ such as combining gaze with _voice_ or _hand gestures_.
There are several user scenarios though, in which users' hands may either be busy or cannot be tracked (e.g., factory workers with oversized heavy duty gloves). 
Voice input may also not be available due to user preferences, social context or loud environments.
As a fallback solution another option to perform a _commit_ is simply to keep staring at a UI element which we refer to as _dwell_.
A _dwell_ can be performed with either head or eye gaze. 
The idea is simple and can be broken down in the following phases: 
1. User starts gazing at a holographic button

2. After a brief onset delay (e.g., 150 ms) some visual feedback animation is started. The onset delay is used to avoid overwhelming the user by immediately popping up feedback all the time.
    - For _eye gaze_, we recommend the following for the design of the visual dwell feedback:
      - **Blend it**: Smoothly blend in the feedback from barely visible at first to fully opaque. This makes the feedback less distracting and overwhleming and nicely aligns with the confidence that the system has that the user really wants to engage with this button.
      - **Pull it in**: Create a visual feedback than decreases in size and moves towards the center of the target, pulling in the user's visual attention. 

3. After a pre-defined dwell duration (e.g., 800 ms), the dwell completes and an associated event is triggered.
    - Provide some finalizing auditory or visual feedback to really bring home that the item got selected now.

![Dwell states](images/eyes_dwellstate_recommendation.png)


> More info to come! (Jenny?)
<!-- 
- Describe when this might be a viable alternative to gaze and commit
- Design guidelines 
-->

## Composite gestures (Jenny?)
- Move from "composite gestures" section here: https://docs.microsoft.com/en-us/windows/mixed-reality/gestures#composite-gestures
- Note that these are available on HoloLens (1st gen) and HoloLens 2

## See also
* [Direct manipulation](direct-manipulation.md)
* [Point and commit](point-and-commit.md)
* [Interaction fundamentals](interaction-fundamentals.md)



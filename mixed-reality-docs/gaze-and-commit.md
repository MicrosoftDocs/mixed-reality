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

## Gaze
The most common form of gaze is called head gaze. Mixed reality headsets use the position and orientation of the user's head to determine their head gaze vector. You can think of this as a laser that points straight ahead from directly between the user's eyes. This is a fairly coarse approximation of where the user is looking. Your application can intersect this ray with virtual or real-world objects and draw a cursor at that location to let the user know what they are currently targetting.

In addition to head gaze, some mixed reality headsets include eye tracking systems that produce an eye gaze vector. This provides a fine-grained measurement of where the user is looking. It is possible to build gaze and commit interactions using eye gaze, but this comes with a very different set of design constraints, which will be covered seperately in this article.

## Commit
After targeting an object or UI element with head or eye gaze, the user can select or "click" it using a secondary input. This is known as the commit step of the gaze-and-commit model. On HoloLens v1, Air tap is the most common method selecting things.

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

## Eye Gaze Design Guidelines (Sophie)
Building an interaction that takes advantage of fast moving eye targeting can be challenging. 
In this section, we summarize the key advantages and challenges to take into account when designing your app. 

### Benefits of Eye Gaze Input

- **High speed pointing.** 
The eye muscle is the fastest reacting muscle in our body. 

- **Low effort.** 
Barely any physical movements are necessary. 

- **Implicitness.** 
Often described by users as "mind reading", information about a user's eye movements lets the system know which target the user plans to engage with. 

- **Alternative input channel.** 
Eye gaze can provide a powerful supporting input for hand and voice input building on years of experience from users based on their hand-eye coordination.

- **Visual attention.** 
Another important benefit is the possibility to infer what a user's is paying attention to. 
This can help in various application areas ranging from more effectively evaluating different designs to aiding in smarter User Interfaces and enhanced social cues for remote communication.

In a nutshell, using eye gaze as an input potentially offers a fast and effortless contextual signal - This is particularly powerful in combination with other inputs such as *voice* and *manual* input to confirm the user's intent.


### Challenges of Eye Gaze Input
With lots of power, comes lots of responsibility: 
While eye gaze can be used to create magical user experiences feeling like a superhero, it is also important to know what it is not good at to account for this appropriately. 
In the following, we discuss some *challenges* to take into account and how to address them when working with eye gaze input: 

- **Your eye gaze is "always on"** 
The moment you open your eye lids, your eyes start fixating things in your environment. 
Reacting to every look you make and potentially accidentally issuing actions because you looked at something for too long would result in a terrible experience!
This is why we recommend combining eye gaze with a *voice command*, *hand gesture*, *button click* or extended dwell to trigger the selection of a target.
This solution also allows for a mode in which the user can freely look around without the overwhelming feeling of involuntarily triggering something. 
This issue should also be taken into account when designing visual and auditory feedback when merely looking at a target.
Do not overwhelm the user with immediate pop-out effects or hover sounds. 
Subtlety is key! 
We will discuss some best practices for this further below when talking about design recommendations.

- **Observation vs. Control** 
Imagine you want to precisely align a photograph at your wall. 
You look at its borders and its surroundings to see if it aligns well. 
Now imagine how you would do that when at the same time you want to use your eye gaze as an input to move the picture. 
Difficult, isn't it? 
This describes the double role of eye gaze when it is required both for input and control. 

- **Leave before Click:** 
For quick target selections, research has shown that a user's eye gaze may move on before concluding a manual click (e.g., an airtap). 
Hence, special attention must be paid to synchronizing the fast eye gaze signal with slower control input (e.g., voice, hands, controller).

- **Small targets:**
Do you know the feeling when you try to read text that is just a bit too small to comfortably read? 
This straining feeling on your eyes that cause you to feel tired and worn out because you try to readjust your eyes to focus better?
This is a feeling you may invoke in your users when forcing them to select too small targets in your app using eye targeting.
For your design, to create a pleasant and comfortable experience for your users, we recommend that targets should be at least 2° in visual angle, preferably larger.

- **Ragged Eye Gaze Movements** 
Our eyes perform rapid movements from fixation to fixation. 
If you look at scan paths of recorded eye movements, you can see that they look ragged. 
Your eyes move quickly and in spontaneous jumps in comparison to *head gaze* or *hand motions*.  

- **Tracking Reliability:**
Eye tracking accuracy may degrade a little in changing light as your eye adjust to the new conditions.
While this should not necessarily affect your app design, as the accuracy should be within the above mentioned limitation of 2°. 
It may mean that the user has to run another calibration. 


### Design Recommendations
In the following, we list specific design recommendations based on the described advantages and challenges for eye gaze input:

1. **Eye Gaze != Head gaze:**
    - **Consider whether fast yet ragged eye movements fit your input task:** 
While our fast and ragged eye movements are great to quickly select targets across our Field of View, it is less applicable for tasks that require smooth input trajectories (e.g., for drawing or encircling annotations). 
In this case, hand or head pointing should be preferred.
  
    - **Avoid attaching something directly to the user’s eye gaze (e.g., a slider or cursor).**
In case of a cursor, this may result in the “fleeing cursor” effect due to slight offsets in the projected eye gaze signal. 
In case of a slider, it conflicts with the double role of controlling the slider with your eyes while also wanting to check whether the object is at the correct location. 
In a nutshell, users may quickly feel overwhelmed and distracted, especially if the signal is imprecise for that user. 
  
2. **Combine eye gaze with other inputs:** 
The integration of Eye Tracking with other inputs, such as hand gestures, voice commands or button presses, serves several advantages:
    - **Allow for free observation:** 
    Given that the main role of our eyes is to observe our environment, it is important to allow users to look around without triggering any (visual, auditory, ...) feedback or actions. 
    Combining ET with another input control allows for smoothly transitioning between ET observation and input control modes.
  
    - **Powerful context provider:** 
Using information about where the user is looking at while uttering a voice command or performing a hand gesture allows for effortlessly channeling the input across the field-of-view. Examples include: “Put that there” to quickly and fluently select and position a hologram across the scene by simply looking at a target and destination. 

    - **Need for synchronizing multimodal inputs (“leave before click” issue):** 
    Combining rapid eye movements with more complex additional inputs (e.g., long voice commands or hand gestures) bears the risk of moving on with your eye gaze before finishing the additional input command. 
    Hence, if you create your own input controls (e.g., custom hand gestures), make sure to log the onset of this input or approximate duration to correlate it with what a user had fixated on in the past.
    
3. **Subtle feedback for ET input:**
It is useful to provide feedback if a target is looked at (to indicate that the system is working as intended) but should be kept subtle. 
This may include slowly blending in/out visual highlights or perform other subtle target behaviors, such as slow motions (e.g., slightly increasing the target) to indicate that the system correctly detected that the user is looking at a target, however, without unnecessarily interrupting the user’s current workflow. 

4. **Avoid enforcing unnatural eye movements as input:** 
Do not force users to perform specific eye movements (gaze gestures) to trigger actions in your app.

5. **Account for imprecisions:** 
We distinguish two types of imprecisions which are noticeable to users: Offset and Jitter. The easiest way to address offsets is to provide sufficiently large targets to interact with (> 2° in visual angle – as reference: your thumbnail is about 2° in visual angle when you stretch out your arm (1)). This leads to the following guidance:
    - Do not force users to select tiny targets: Research has shown that if targets are sufficiently large (and the system is designed well), users describe the interaction as effortless and magical. If targets become too small, users describe the experience as fatiguing and frustrating.




---
<TODO>
  - Talk about design considerations for 
    - Visual feedback
    - Button design
    - Dwell design
    - ...
---
  
## Gaze and dwell (Jenny?)
 - Describe when this might be a viable alternative to gaze and commit
- Design guidelines

## Composite gestures (Jenny?)
- Move from "composite gestures" section here: https://docs.microsoft.com/en-us/windows/mixed-reality/gestures#composite-gestures
- Note that these are available on HoloLens v1 and v2

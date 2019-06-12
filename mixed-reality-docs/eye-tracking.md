---
title: Eye-gaze
description: HoloLens 2 allows for a new level of context and human understanding within the holographic experience by providing developers with the ability of using information about what users are looking at.
author: sostel
ms.author: sostel
ms.date: 04/05/2019
ms.topic: article
ms.localizationpriority: high
keywords: Eye Tracking, Mixed Reality, Input, Eye-gaze, eye gaze
---
# Eye-gaze on HoloLens 2
HoloLens 2 allows for a new level of context and human understanding within the holographic experience by providing developers with the ability of using information about what users are looking at. This page tells developers how they can benefit from eye tracking for various use cases as well as what to look for when designing eye-gaze-based user interfaces. 


## Device support

<table>
<colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
</colgroup>
<tr>
     <td><strong>Feature</strong></td>
     <td><a href="hololens-hardware-details.md"><strong>HoloLens (1st gen)</strong></a></td>
     <td><strong>HoloLens 2</strong></td>
     <td><a href="immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
</tr>
<tr>
     <td>Eye-gaze</td>
     <td>❌</td>
     <td>✔️</td>
     <td>❌</td>
</tr>
</table>

## Use cases
Eye tracking enables applications to track where the user is looking in real time. The following use cases describe some interactions that are possible with eye tracking in mixed reality.
Keep in mind that the [Mixed Reality Toolkit](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_Main.html) is useful for providing several interesting and powerful examples for using eye tracking, such as quick and effortless eye-supported target selections as well as automatically scrolling through text based on what the user looks at. 

### User intent	   
Information about where and what a user looks at provides a powerful **context for other inputs**, such as voice, hands and controllers.
This can be used for various tasks.
For example, this can range from quickly and effortlessly **targeting** across the scene by simply looking at a hologram and saying "select" (also see [Head-gaze and commit](gaze-and-commit.md)) or by saying "put this...", then looking over to where the user wants to place the hologram and say "...there". 
Examples for this can be found in [Mixed Reality Toolkit - Eye-supported Target Selection](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_TargetSelection.html) and [Mixed Reality Toolkit - Eye-supported Target Positioning](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_Positioning.html).

Additionally, an example for user intent might include using information about what users look at to enhance engagement with embodied virtual agents and interactive holograms. For instance, virtual agents might adapt available options and their behavior based on currently viewed content. 

### Implicit actions
The category of implicit actions closely relates to user intent.
The idea is that holograms or user interface elements react in a somewhat instinctual way that may not even feel like the user is interacting with the system at all, but rather that the system and the user are in sync.
One example is **eye-gaze-based auto scroll** where the user reads text as the text continues to scroll or flow in sync with with the user's gaze. A key aspect of this is that scrolling speed adapts to the reading speed of the user.
Another example is **eye-supported zoom and pan** where the user can feel like diving exactly toward what he or she is focused o. Triggering zoom and controlling zoom speed can be controlled by voice or hand input, which is important for providing the user with the feeling of control while avoiding being overwhelmed. We will talk about these design guidelines in more detail below. Once zoomed in, the user can  smoothly follow, for example, the course of a street to explore his or her neighborhood by simply using their eye-gaze.
Demo examples for these types of interactions can be found in the [Mixed Reality Toolkit - Eye-supported Navigation](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_Navigation.html) sample.

Additional use cases for _implicit actions_ can include:
- **Smart notifications:** Ever get annoyed by notifications popping up right where you were focusing? Taking into account what a user is paying attention to, you can make this experience better by offsetting notifications from where the user is currently gazing. This limits distractions and automatically dismisses them once the user is finished reading. 
- **Attentive holograms:** Holograms that subtly react when being gazed upon. This can range from slightly glowing UI elements to a slowly blooming flower to a virtual pet starting to look back at the user or trying to avoid the user's eye-gaze after a prolonged stare. This interaction might provide an interesting sense of connectivity and satisfaction in your application.

### Attention tracking	 
Information about where or what users look at is an immensely powerful tool to assess usability of designs, and to identify problems in efficient workflows. Eye tracking visualization and analytics are a common practice in various application areas. With HoloLens 2, we provide a new dimension to this understanding as 3D holograms can be placed in real-world contexts and assessed accordingly. 
The [Mixed Reality Toolkit](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_Main.html) provides basic examples for logging and loading eye tracking data and  how to visualize them.

Other applications in this area can include: 
-	**Remote eye-gaze visualization:** Visualize what remote collaborators are looking at to ensure whether instructions are correctly understood and followed.
-	**User research studies:** Attention tracking can be used to explore the way novice vs. expert users visually analyze content or how their hand-eye-coordination for complex tasks, such as for analysis of medical data or while operating machinery.
-	**Training simulations and Performance monitoring:** Practice and optimize the execution of tasks by identifying bottlenecks more effectively in the execution flow.
-	**Design evaluations, advertisement and marketing research:** Eye tracking is a common tool for market research when evaluateing website and product designs.

### Additional use cases
- **Gaming:** Ever wanted to have superpowers? Here's your chance! You can levitate holograms by staring at them. Shoot laser beams from your eyes. Turn enemies into stone or freeze them. Use your x-ray vision to explore buildings. Your imagination is the limit!	

- **Expressive avatars:** Eye tracking aids in more expressive 3D avatars by using live-eye tracking date to animate the avatar's eyes that indicate what the user is looking at. It also adds more expressiveness by adding winks and blinks. 

- **Text entry:** Eye tracking can be used as an alternative for low-effort text entry, especially when speech or hands are inconvenient to use. 


## Eye tracking API
Before going into detail about the specific design guidelines for eye-gaze interaction, we want to briefly point out the capabilities that the HoloLens 2 Eye Tracker API provides to developers. It provides a single eye-gaze--gaze origin and direction--providing data at approximately _30 FPS_. 

The predicted eye-gaze lies within ca. 1.0 - 1.5 degrees in visual angle around the actual target. 
As slight imprecisions are expected, you should plan for some margin around this lower bound value. We will discuss this more below. 
For eye tracking to work accurately, each user is required to go through an eye tracking user calibration. 

![Optimal target size at 2 meter distance](images/gazetargeting-size-1000px.jpg)<br>
*Optimal target size at a 2-meter distance*
<br>
The [Eye Tracking API](https://docs.microsoft.com/en-us/uwp/api/windows.perception.people.eyespose) is accessible through: `Windows.Perception.People.EyesPose'. 

## Eye-gaze design guidelines
Building an interaction that takes advantage of fast moving eye targeting can be challenging. 
In this section, we summarize the key advantages and challenges to take into account when designing your application. 

### Benefits of eye-gaze input
- **High speed pointing.** 
The eye muscle is the fastest reacting muscle in our body. 

- **Low effort.** 
Barely any physical movements are necessary. 

- **Implicitness.** 
Often described by users as "mind reading", information about a user's eye movements lets the system know which target the user plans to engage. 

- **Alternative input channel.** 
Eye-gaze can provide a powerful supporting input for hand and voice input building on years of experience from users based on their hand-eye coordination.

- **Visual attention.** 
Another important benefit is the possibility to infer what a user is paying attention to. 
This can help in various application areas ranging from more effectively evaluating different designs to aiding in smarter user interfaces and enhanced social cues for remote communication.

In a nutshell, using eye-gaze as an input offers a fast and effortless contextual signal. This is particularly powerful when combined with other inputs such as *voice* and *manual* input to confirm the user's intent.


### Challenges of eye-gaze as an input
With lots of power, comes lots of responsibility.
While eye-gaze can be used to create satisfying user experiences thata makes you feel like a superhero, it is also important to know what it is not good at to appropriately account for this. 
The following discusses some *challenges* to take into account as well as how to address them when working with eye-gaze input: 

- **Your eye-gaze is "always on"** 
The moment you open your eye lids, your eyes start fixating on things in the environment. 
Reacting to every look you make and accidentally issuing actions because you looked at something for too long would result in an unsatisfying experience.
This is why we recommend combining eye-gaze with a *voice command*, *hand gesture*, *button click* or extended dwell to trigger the selection of a target.
This solution also allows for a mode in which the user can freely look around without being overwhelmed by involuntarily triggering something. 
This issue should also be taken into account when designing visual and auditory feedback when merely looking at a target.
Do not overwhelm the user with immediate pop-out effects or hover sounds. Subtlety is key. 
We will discuss some best practices for this further below when talking about design recommendations.

- **Observation vs. control** 
Imagine that you want to precisely straighten a photograph on your wall. 
You look at its borders and its surroundings to see if it aligns well. 
Now imagine how you would do that when you want to use your eye-gaze as an input to move the picture. 
Difficult, isn't it? 
This describes the double role of eye-gaze when it is required both for input and control. 

- **Leave before click:** 
For quick target selections, research has shown that a user's eye-gaze can move on before concluding a manual click (e.g., an airtap). 
Hence, special attention must be paid to synchronizing the fast eye-gaze signal with slower control input (e.g., voice, hands, controller).

- **Small targets:**
Do you know the feeling when you try to read text that is just a bit too small to read comfortable? 
This straining feeling on your eyes can cause you to feel tired and worn out because you try to readjust your eyes to focus better.
This is a feeling you might invoke in your users when forcing them to select targets that are too small in your application using eye targeting.
For your design, to create a pleasant and comfortable experience for your users, we recommend that targets should be at least 2° in visual angle, preferably larger.

- **Ragged eye-gaze movements** 
Our eyes perform rapid movements from fixation to fixation. 
If you look at scan paths of recorded eye movements, you can see that they look ragged. 
Your eyes move quickly and in spontaneous jumps in comparison to *head gaze* or *hand motions*.  

- **Tracking reliability:**
Eye tracking accuracy may degrade a little in changing light as your eye adjust to the new conditions.
While this should not necessarily affect your application design, as the accuracy should be within the 2° limitation, i might be necessary for the user to run another calibration. 


## Design recommendations
The following is a list of specific design recommendations based on the described advantages and challenges for eye-gaze input:

1. **Eye-gaze != Head gaze:**
    - **Consider whether fast yet ragged eye movements fit your input task:** 
While our fast and ragged eye movements are great at quickly selecting targets across our field of view (FoV), it is less applicable for tasks that require smooth input trajectories (e.g., drawing or encircling annotations). 
In this case, hand or head pointing should be preferred.
  
    - **Avoid attaching something directly to the user’s eye-gaze (e.g., a slider or cursor).**
In case of a cursor, this may result in the “fleeing cursor” effect due to slight offsets in the projected eye-gaze signal. 
In case of a slider, it can conflict with the double role of controlling the slider with your eyes while also wanting to check whether the object is at the correct location. 
In a nutshell, users could become overwhelmed and distracted, especially if the signal is imprecise for that user. 
  
2. **Combine eye-gaze with other inputs:** 
The integration of eye tracking with other inputs, such as hand gestures, voice commands or button presses, serves several advantages:
    - **Allow for free observation:** 
    Given that the main role of our eyes is to observe our environment, it is important users are allowed to look around without triggering any (visual, auditory, etc.) feedback or actions. 
    Combining eye tracking with another input control allows smooth transitioning between eye tracking observation and input control modes.
  
    - **Powerful context provider:** 
Using information about where and what the user is looking at while uttering a voice command or performing a hand gesture allows seamlessly channeling the input across the field-of-view. For example: “Put that there” to quickly and fluently select and position a hologram across the scene by simply looking at a target and destination. 

    - **Need for synchronizing multimodal inputs (“leave before click” issue):** 
Combining rapid eye movements with more complex additional inputs, such as long voice commands or hand gestures, bears the risk of continuing your eye-gaze before finishing the additional input command. 
Hence, if you create your own input controls (e.g., custom hand gestures), make sure to log the onset of this input or approximate duration to correlate it with what a user had fixated on in the past.
    
3. **Subtle feedback for eye tracking input:**
It's useful to provide feedback when a target is looked at to indicate that the system is working as intended, but should be kept subtle. 
This can include slowly blending, in and out, visual highlights or perform other subtle target behaviors, such as slow motions, such as slightly increasing the target, to indicate that the system correctly detected that the user is looking at a target without unnecessarily interrupting the user’s current workflow. 

4. **Avoid enforcing unnatural eye movements as input:** 
Do not force users to perform specific eye movements (gaze gestures) to trigger actions in your application.

5. **Account for imprecisions:** 
We distinguish two types of imprecisions which are noticeable to users: offset and jitter. The easiest way to address an offset is to provide sufficiently large targets to interact with. It is suggested that you use a visual angle greater than 2° as a reference. For instance, your thumbnail is about 2° in visual angle when you stretch out your arm. This leads to the following guidance:
    - Do not force users to select tiny targets. Research has shown that if targets are sufficiently large, and that the system is designed well, users describe their interactions as effortless and magical. If targets become too small, users describe the experience as fatiguing and frustrating.
   

## See also
* [Head-gaze and commit](gaze-and-commit.md)
* [Head and eye-gaze in DirectX](gaze-in-directx.md)
* [Eye-gaze in Unity (Mixed Reality Toolkit)](https://aka.ms/mrtk-eyes)
* [Hand gestures](gestures.md)
* [Voice input](voice-design.md)
* [Motion controllers](motion-controllers.md)
* [Comfort](comfort.md)

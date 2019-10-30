---
title: Eye tracking
description: HoloLens 2 allows for a new level of context and human understanding within the holographic experience by providing developers with the ability of using information about what users are looking at.
author: sostel
ms.author: sostel
ms.date: 10/29/2019
ms.topic: article
keywords: Eye tracking, Mixed Reality, input, eye-gaze
---
# Eye tracking on HoloLens 2

![Eye tracking demo in MRTK](images/mrtk_et_scenemenu.jpg)

HoloLens 2 allows for a new level of context and human understanding within the holographic experience by providing developers with the ability of using information about what users are looking at. 
This page provides an overview to developers and designers on how they can benefit from eye tracking for various use cases as well as what to look for when designing eye-gaze-based user interfaces. 


## Calibration 
For eye tracking to work accurately, each user is required to go through an [eye tracking user calibration](calibration.md) for which the user has to look at a set of holographic targets. 
This allows the device to adjust the system for a more comfortable and higher quality viewing experience for the user and to ensure accurate eye tracking at the same time. 
Eye tracking should work for most users, but there are rare cases in which a user might be unable to calibrate successfully.
To learn more about the calibration and about how to ensure a smooth experience, please check [Calibration](calibration.md).


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
     <td><a href="https://docs.microsoft.com/hololens/hololens2-hardware"><strong>HoloLens 2</strong></td>
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
For example, this can range from quickly and effortlessly **targeting** across the scene by simply looking at a hologram and saying "select" (also see [Head-gaze and commit](gaze-and-commit.md)) or by saying *"put this..."*, then looking over to where the user wants to place the hologram and say *"...there"*. 
Examples for this can be found in [Mixed Reality Toolkit - Eye-supported Target Selection](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_TargetSelection.html) and [Mixed Reality Toolkit - Eye-supported Target Positioning](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_Positioning.html).

Additionally, an example for user intent might include using information about what users look at to enhance engagement with embodied virtual agents and interactive holograms. For instance, virtual agents might adapt available options and their behavior based on currently viewed content. 

### Implicit actions
The category of implicit actions closely relates to user intent.
The idea is that holograms or user interface elements react in a somewhat instinctual way that may not even feel like the user is interacting with the system at all, but rather that the system and the user are in sync.
One example is **eye-gaze-based auto scroll** where the user can read a long text which automatically starts scrolling once the user gets to the bottom of the textbox to keep the user in the flow of reading without lifting a finger.  
A key aspect of this is that the scrolling speed adapts to the reading speed of the user.
Another example is **eye-supported zoom and pan** where the user can feel like diving exactly toward what he or she is focused on. Triggering zoom and controlling zoom speed can be controlled by voice or hand input, which is important for providing the user with the feeling of control while avoiding being overwhelmed. We will talk about these design guidelines in more detail below. Once zoomed in, the user can  smoothly follow, for example, the course of a street to explore his or her neighborhood by simply using their eye-gaze.
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
-	**Design evaluations, advertisement and marketing research:** Eye tracking is a common tool for market research when evaluating website and product designs.

### Additional use cases
- **Gaming:** Ever wanted to have superpowers? Here's your chance! You can levitate holograms by staring at them. Shoot laser beams from your eyes. Turn enemies into stone or freeze them. Use your x-ray vision to explore buildings. Your imagination is the limit!	

- **Expressive avatars:** Eye tracking aids in more expressive 3D avatars by using live eye tracking data to animate the avatar's eyes that indicate what the user is looking at. 

- **Text entry:** Eye tracking can be used as an alternative for low-effort text entry, especially when speech or hands are inconvenient to use. 


## Available eye tracking data
Before going into detail about the specific design guidelines for eye-gaze interaction, we want to briefly point out the capabilities that the HoloLens 2 [Eye Tracking API](https://docs.microsoft.com/uwp/api/windows.perception.people.eyespose) provides. 
Developers get access to a single eye-gaze ray (gaze origin and direction) at approximately _30 FPS (30 Hz)_.
For more detailed information about how to access eye tracking data, please refer to our developer guides on using [eye-gaze in DirectX](gaze-in-directx.md) and [eye-gaze in Unity](https://aka.ms/mrtk-eyes).

The predicted eye-gaze is approximately within 1.5 degrees in visual angle around the actual target (see the illustration below). 
As slight imprecisions are expected, developers should plan for some margin around this lower bound value (e.g., 2.0-3.0 degrees may result in a much more comfortable experience). 
We will discuss how to address the selection of small targets in more detail below. 
For eye tracking to work accurately, each user is required to go through an eye tracking user calibration. 

![Optimal target size at 2 meter distance](images/gazetargeting-size-1000px.jpg)<br>
*Optimal target size at a 2-meter distance*


## Using eye-gaze for interaction
Building an interaction that takes advantage of fast-moving eye targeting can be challenging.
On the one hand, the eyes move so fast that you need to be careful on how to use eye-gaze input, because otherwise user may find the experience overwhelming or distracting. 
On the other hand, you can also create truly magical experiences that will excite your users! 
To help you, check out our overview of key advantages, challenges and design recommendations for [eye-gaze for interaction](eye-gaze-interaction.md). 

  
## Dev guidance: What if eye tracking is not available?
There may be situations in which your app will not receive any eye tracking data due to various reasons including but not limited to:
* The user skipped the eye tracking calibration.
* The user calibrated, but decided to not give permission to your app to use their eye tracking data.
* The user has unique eyeglasses or some eye condition that the system does not yet support.
* External factors inhibiting reliable eye tracking such as smudges on the HoloLens visor or eyeglasses, intense direct sunlight and occlusions due to hair in front of the eyes.

For you as an app developer, this means that you need to account for how to support users for whom eye tracking data may not be available. 
Below we first explain how to detect whether eye tracking is available and how to address when it is not available for different applications.

### 1. How to detect that eye tracking is available
There are a few checks to determine whether eye tracking data is available. Check whether...
* ... the system supports eye tracking at all. Call the following *method*: [Windows.Perception.People.EyesPose.IsSupported()](https://docs.microsoft.com/uwp/api/windows.perception.people.eyespose.issupported#Windows_Perception_People_EyesPose_IsSupported)

* ... the user is calibrated. Call the following *property*: [Windows.Perception.People.EyesPose.IsCalibrationValid](https://docs.microsoft.com/uwp/api/windows.perception.people.eyespose.iscalibrationvalid#Windows_Perception_People_EyesPose_IsCalibrationValid)

* ... the user has given your app permission to use their eye tracking data: Retrieve the current _'GazeInputAccessStatus'_. An example on how to do this is explained at [Requesting access to gaze input](https://docs.microsoft.com/windows/mixed-reality/gaze-in-directX#requesting-access-to-gaze-input).

In addition, you may want to check that your eye tracking data is not stale by adding a timeout between received eye tracking data updates and otherwise fallback to head-gaze as discussed below. 

As described above, there are several reasons why eye tracking data may not be available. 
While some users may have consciously decided to revoke access to their eye tracking data and are ok with the trade-off of an inferior user experience to the privacy of not providing access to their eye tracking data, in some cases this may be unintentional. 
Hence, if your app uses eye tracking, and this is an important part of the experience, we recommend clearly communicating this to the user. 
Kindly informing the user why eye tracking is critical for your application (maybe even listing some enhanced features) to experience the full potential of your application can help the user to better understand what they are giving up. 
Help the user to identify why eye tracking may not be working (based on the above checks) and offer some suggestions to quickly troubleshoot potential issues. 
For example, if you can detect that the system supports eye tracking, the user is calibrated and even has given their permission, yet no eye tracking data is received, then this may point to some other issues such as smudges or the eyes being occluded. 
Please note though that there are rare cases of users for whom eye tracking may simply not work. 
Hence, please be respectful of that by allowing to dismiss or even disable reminders for enabling eye tracking in your app.

### 2. Fallback for apps using eye-gaze as a primary input pointer
If your app uses eye-gaze as a pointer input to quickly select holograms across the scene, yet eye tracking data is unavailable, we recommend falling back to head-gaze and start showing the head-gaze cursor. 
We recommend using a timeout (e.g., 500–1500 ms) to determine whether to switch or not. 
This is to prevent popping up a cursor every time the system may briefly lose tracking due to fast eye motions or winks and blinks. 
If you are a Unity developer, the automatic fallback to head-gaze is already handled in the Mixed Reality Toolkit. 
If you are a DirectX developer, you need to handle this switch yourself.

### 3. Fallback for other eye-tracking-specific applications
Your app may use eye-gaze in a unique way that is tailored specifically to the eyes - for example, for animating an avatar’s eyes or for eye-based attention heatmaps relying on precise information about visual attention. 
In this case, there is no clear fallback. 
If eye tracking is not available, these capabilities may simply need to be disabled. 

<br>

This page has hopefully provided you with a good overview to get you started understanding the role of eye tracking and eye-gaze input for HoloLens 2. 
To get started developing, check out our information on the role of [eye-gaze for interacting with holograms](eye-gaze-interaction.md),
[eye-gaze in Unity](https://aka.ms/mrtk-eyes) and 
[eye-gaze in DirectX](gaze-in-directx.md).


## See also
* [Calibration](calibration.md)
* [Comfort](comfort.md)
* [Eye-gaze-based interaction](eye-gaze-interaction.md)
* [Eye-gaze in DirectX](gaze-in-directx.md)
* [Eye-gaze in Unity (Mixed Reality Toolkit)](https://aka.ms/mrtk-eyes)
* [Eye-gaze and commit](eye-gaze-and-commit.md)
* [Head-gaze and commit](gaze-and-commit.md)
* [Voice input](voice-design.md)



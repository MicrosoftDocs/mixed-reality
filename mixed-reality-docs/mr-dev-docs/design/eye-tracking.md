---
title: Eye tracking overview
description: Learn about eye tracking for HoloLens 2 and the new levels of human understanding if affords in holographic experiences.
author: sostel
ms.author: vinnietieto
ms.date: 12/22/2021
ms.topic: article
keywords: Eye tracking, mixed reality, input, eye-gaze, calibration, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens, MRTK, Mixed Reality Toolkit, intent, actions
---

# Eye tracking on HoloLens 2

![Eye tracking demo in MRTK](images/mrtk_et_scenemenu.jpg)

HoloLens 2 allows for a new level of context and human understanding within the holographic experience by providing developers with the ability to use information about what the user is looking at. This page explains how developers can benefit from eye tracking for various use cases, and what to look for when designing eye-gaze-based user interactions. 

The Eye Tracking API has been designed with a user’s privacy in mind; it avoids the passing of any identifiable information, particularly any biometrics. For eye-tracking capable applications, the user needs to grant app permission to use eye tracking information.

### Device support

<table>
<colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
</colgroup>
<tr>
     <td><strong>Feature</strong></td>
     <td><a href="/hololens/hololens1-hardware"><strong>HoloLens (1st gen)</strong></a></td>
     <td><a href="/hololens/hololens2-hardware"><strong>HoloLens 2</strong></td>
     <td><a href="/windows/mixed-reality/enthusiast-guide/immersive-headset-hardware-details"><strong>Immersive headsets</strong></a></td>
</tr>
<tr>
     <td>Eye-gaze</td>
     <td>❌</td>
     <td>✔️</td>
     <td>❌</td>
</tr>
</table>

<br>

## Head and eye tracking design concepts demo

If you'd like to see Head and Eye Tracking design concepts in action, check out our **Designing Holograms - Head Tracking and Eye Tracking** video demo below. When you've finished, continue on for a more detailed dive into specific topics.

> [!VIDEO https://docs.microsoft.com/en-us/shows/Docs-Mixed-Reality/Microsofts-Designing-Holograms-Head-Tracking-and-Eye-Tracking-Chapter/player]

*This video was taken from the "Designing Holograms" HoloLens 2 app. Download and enjoy the full experience [here](https://aka.ms/dhapp).*

## Calibration 

For eye tracking to work accurately, each user is required to go through an [eye tracking user calibration](/hololens/hololens-calibration) for which the user has to look at a set of holographic targets. This allows the device to adjust the system, resulting in a more comfortable and higher-quality viewing experience for the user and ensuring accurate eye tracking at the same time. 

Eye tracking should work for most users, but there are rare cases in which a user can't calibrate successfully. Calibration might fail for various reasons, including but not limited to: 

* The user previously opted out of the calibration process.
* The user got distracted and didn't follow the calibration targets.
* The user has certain types of contact lenses and glasses that the system doesn't yet support.
* The user has certain eye physiology or eye conditions or had eye surgery, which the system doesn't yet support.
* External factors inhibiting reliable eye tracking such as smudges on the HoloLens visor or eyeglasses, intense direct sunlight, and occlusions due to hair in front of the eyes.

Developers should make sure to provide adequate support for users for whom eye tracking data may not be available (who aren't able to calibrate successfully). We've  provided recommendations for fallback solutions in the section at the bottom of this page. 

To learn more about the calibration and how to ensure a smooth experience, see our [eye tracking user calibration](/hololens/hololens-calibration) page.

<br>

## Available eye tracking data

Eye tracking on HoloLens 2 lets developers design natural and intuitive input and interaction scenarios. [The Eye Tracking API](/uwp/api/windows.perception.people.eyespose) provides the information about what the user is looking at as a single eye-gaze ray (gaze origin and direction) at approximately 30 FPS (30 Hz). For eye tracking to work accurately, each user is required to go through an eye tracking user calibration. For more detailed information about how to access eye tracking data, refer to our developer guides for using [eye-gaze in DirectX](../develop/native/gaze-in-directx.md) and [eye-gaze in Unity](https://aka.ms/mrtk-eyes).

The predicted eye-gaze is approximately within 1.5 degrees in visual angle around the actual target (see the illustration below). Slight imprecisions are expected, so developers should plan for some margin around this lower-bound value (for example, 2.0-3.0 degrees may result in a much more comfortable experience). We'll discuss how to address the selection of small targets in more detail below. 

![Optimal target size at 2 meter distance](images/gazetargeting-size-1000px.jpg)<br>
*Optimal target size at a 2-meter distance*

<br>

## Extended Eye Tracking data 

Extended eye tracking APIs allow developers to unlock next level of innovative scenarios such as health assessment, monitoring and therapy by providing more fine-grained information about the user's eye gaze.

Extended eye tracking APIs provide access to existing eye tracking values and new features such as individual (left and right) eye gaze vectors, supported frame rates, and the ability to set the eye tracking frame rate to 30, 60 or 90fps. To use the Extended Eye Tracking API, refer to our developer guides for using Extended Eye Tracking APIs for [native](../develop/native/extended-eye-tracking-native.md) or [Unity](../develop/unity/extended-eye-tracking-unity.md). 

## Use cases

Eye tracking enables applications to track where the user is looking in real time. The following use cases describe some interactions that are possible with eye tracking on HoloLens 2 in mixed reality. These use cases aren't yet part of the Holographic Shell experience (the interface that you see when you start up your HoloLens 2). You can try some of them in the [Mixed Reality Toolkit](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_Main.html). The Toolkit provides several interesting and powerful examples for using eye tracking, such as quick and effortless eye-supported target selections and automatically scrolling through text based on what the user looks at. 


### User intent

Information about where and what a user looks at provides a powerful context for other inputs, such as voice, hands, and controllers. This can be used for various tasks. For example, the user can quickly and effortlessly target across the scene by looking at a hologram and saying *"select"* (also see [gaze and commit](gaze-and-commit.md)) or *"put this..."*, and then look over to where they want to place the hologram and say *"...there"*. Examples for this can be found in [Mixed Reality Toolkit - Eye-supported Target Selection](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_TargetSelection.html) and [Mixed Reality Toolkit - Eye-supported Target Positioning](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_Positioning.html).

Additionally, an example for user intent might include using information about what users look at to enhance engagement with embodied virtual agents and interactive holograms. For example, virtual agents might adapt available options, and their behavior, based on currently viewed content. 

### Implicit actions

The category of implicit actions closely relates to user intent. The idea is that holograms or user interface elements react in an instinctual way that may not even feel like the user is interacting with the system at all, but rather that the system and the user are in sync. One example is **eye-gaze-based auto scroll** where the user can read a long text that automatically starts scrolling once the user gets to the bottom of the textbox. This keeps the user in the flow of reading without lifting a finger. A key aspect of this is that the scrolling speed adapts to the reading speed of the user.

Another example is **eye-supported zoom and pan** where the user can feel like they're diving exactly towards whatever they're focused on.

Triggering and controlling zoom speed can be controlled by voice or hand input, which is important for providing the user with the feeling of control while avoiding being overwhelmed. We'll talk about these design considerations in more detail below. Once zoomed in, the user can smoothly follow, for example, the course of a street to explore his or her neighborhood by using their eye-gaze. Demo examples for these types of interactions can be found in the [Mixed Reality Toolkit - Eye-supported Navigation](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_Navigation.html) sample.


Other use cases for _implicit actions_ may include:

- **Smart notifications:** Do you ever get annoyed by notifications popping up right in middle of your view? You can make this experience better by offsetting notifications from where the user is currently gazing. This limits distractions and automatically dismisses them once the user is finished reading. 
- **Attentive holograms:** These are holograms that react in a subtle way when they're gazed upon. This can range from slightly glowing UI elements to a slowly blooming flower to a virtual dog starting to look back at the user and wagging its tail. This interaction can provide an interesting sense of connectivity and satisfaction in your application.

### Attention tracking

Information on where or what users look at can be an immensely powerful tool. It can help assess usability of designs and identify problems in workflows to make them more efficient. Eye tracking visualization and analytics are a common practice in various application areas. With HoloLens 2, we provide a new dimension to this understanding; 3D holograms can be placed in real-world contexts and assessed accordingly. 

The [Mixed Reality Toolkit](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_Main.html) provides basic examples for logging and loading eye tracking data and how to visualize them. 

Microsoft is dedicated to facilitating innovation while ensuring that users have an informed and transparent experience with how their eye tracking information is used.  We'll continue to work with our developers and UX teams to provide guidance for third parties to ensure that experiences are centered around the user.  

Other applications in this area may include:

-	**Remote eye-gaze visualization:** Visualize what remote collaborators are looking at. This can provide immediate feedback and facilitate more accurate information processing.
-	**User research studies:** Attention tracking can provide insights into how users perceive and engage with the natural environment without interfering. This can help developers design more instinctual human-computer-interactions. Eye tracking can provide information that's not directly articulated by participants in the study and can be easily missed by the researcher. 
-	**Training and performance monitoring:** Practice and optimize the execution of tasks by identifying bottlenecks more effectively in the execution flow. Eye tracking can provide natural, real-time, and objective information to help improve training, productivity, and safety in the workplace. 
-	**Design evaluations, marketing, and consumer research:** Eye tracking enables commercial companies to perform marketing and consumer studies in real-world environments or analyze what captures a user’s attention to improve product or space design. 

### Other use cases

- **Gaming:** Have you ever wanted to have superpowers? Here's your chance!

You can levitate holograms by staring at them. 

Shoot laser beams from your eyes--try it out in [RoboRaid for HoloLens 2](https://www.microsoft.com/p/roboraid/9nblggh5fv3j).

Turn enemies into stone or freeze them. 

Use your x-ray vision to explore buildings.

Your imagination is the limit! Beware of not overwhelming the user, though. To learn more, see our [eye-gaze-based input design guidelines](eye-gaze-interaction.md).

- **Expressive avatars:** Eye tracking aids in more expressive 3D avatars by using live eye tracking data to animate the avatar's eyes and make them follow what the user is looking at. 

- **Text entry:** Eye tracking can be used as an alternative for low-effort text entry, especially when speech or hands are inconvenient to use. 

<br>

## Using eye-gaze for interaction

Building an interaction that takes advantage of fast-moving eye targeting can be challenging. Since eyes can move quickly, if you're not careful about how to use eye-gaze input, users may find the experience overwhelming or distracting. But this is well worth the challenge because eye tracking lets you create truly magical experiences that will excite your users! To help you, check out our overview of key advantages, challenges, and design recommendations for [eye-gaze for interaction](eye-gaze-interaction.md). 
 
## Fallback solutions when eye tracking isn't available

In rare cases, eye tracking data might not be available. This can happen for a number of reasons--the most common are listed below:
 
* The system failed to [calibrate the user](/hololens/hololens-calibration).
* The user skipped the [calibration](/hololens/hololens-calibration).	
* The user is calibrated, but decided to not give permission to your app to use their eye tracking data.	
* The user has unique eyeglasses or some eye condition that the system doesn't yet support.	
* External factors inhibiting reliable eye tracking such as smudges on the HoloLens visor or eyeglasses, intense direct sunlight, and occlusions because of hair in front of the eyes.

Developers should ensure that there's appropriate fallback support for these users. On the [Eye Tracking in DirectX](../develop/native/gaze-in-directx.md#fallback-when-eye-tracking-isnt-available) page, we explain the APIs required to detect whether eye tracking data is available. 

Some users may decide that greater privacy is more important to them than the improved experience that eye tracking can provide, so they intentionally revoke access to their eye-tracking data. However, in some cases this revoking may be unintentional. If your app uses eye tracking, and this is an important part of the experience, we recommend that you communicate this clearly to the user. Explaining to the user how eye tracking unlocks the full potential of your application can help them to better understand what they're giving up. If eye-tracking is turned on but not working, help the user identify and resolve the problem using the checklist above as a guide. For example, if you can detect that the system supports eye tracking and the user is calibrated and has given their permission, yet no eye tracking data is received, this may point to issues such as smudges or the eyes being occluded. 	

There are rare cases where eye tracking just doesn't work for someone and there's no obvious reason. Be respectful of that by allowing the user to dismiss or disable reminders for enabling eye tracking in your app.

### Fall back for apps using eye-gaze as a primary input pointer

If your app uses eye-gaze as a pointer input to quickly select holograms across the scene, yet eye tracking data is unavailable, we recommend falling back to head-gaze and showing the head-gaze cursor. We recommend using a timeout (for example, 500–1500 ms) to determine whether to switch or not. This action prevents cursors from appearing every time the system may briefly lose tracking because of fast eye motions or winks and blinks. If you're a Unity developer, the automatic fallback to head-gaze is already handled in the Mixed Reality Toolkit. If you're a DirectX developer, you need to handle this switch yourself.

### Fall back for other eye-tracking-specific applications

Your app may use eye-gaze in a unique way that's tailored specifically to the eyes--for example, animating an avatar’s eyes or eye-based attention heatmaps that rely on precise information about visual attention. In this type of case, there's no clear fallback. If eye tracking isn't available, these capabilities may need to be disabled. Again, we recommend that you clearly communicate this to the user, who may be unaware that the capability isn't working.

<br>

This page has hopefully provided you with a good overview to get you started understanding the role of eye tracking and eye-gaze input for the HoloLens 2. To get started developing, check out our information on the role of [eye-gaze for interacting with holograms](eye-gaze-interaction.md),
[eye-gaze in Unity](https://aka.ms/mrtk-eyes) and 
[eye-gaze in DirectX](../develop/native/gaze-in-directx.md).

## See also

* [Calibration](/hololens/hololens-calibration)
* [Comfort](comfort.md)
* [Eye-gaze-based interaction](eye-gaze-interaction.md)
* [Eye-gaze in DirectX](../develop/native/gaze-in-directx.md)
* [Eye-gaze in Unity (Mixed Reality Toolkit)](/windows/mixed-reality/mrtk-unity/features/input/eye-tracking/eye-tracking-main)
* [Gaze and commit](gaze-and-commit.md)
* [Extended Eye Tracking SDK for Native Development](../develop/native/extended-eye-tracking-native.md)
* [Extended Eye Tracking SDK for Unity Development](../develop/unity/extended-eye-tracking-unity.md)
* [Voice input](../out-of-scope/voice-design.md)

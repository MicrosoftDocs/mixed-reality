---
title: Using Audio in Mixed Reality Applications
description: Spatial sound is a powerful tool for immersion, accessibility, and UX design in mixed reality applications.
author: kegodin
ms.author: kegodin
ms.date: 11/02/2019
ms.topic: article
keywords: Windows Mixed Reality, spatial sound, design, style
---

# Using Sound in Mixed Reality Applications

Use sound to inform and reinforce the user's mental model of application state. Use spatialization, when appropriate, to place sounds into the mixed world. Connecting the auditory and the visual in this way deepens the intuitive nature of many interactions and leads to increased user confidence.

<br>

<iframe width="940" height="530" src="https://www.youtube.com/embed/aB3TDjYklmo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Device support

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><strong>Feature</strong></td>
        <td><a href="hololens-hardware-details.md"><strong>HoloLens</strong></a></td>
        <td><a href="immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Spatial sound design</td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
</table>


## When should I add sounds?
Mixed reality applications often have a greater need for sounds than applications on a 2D screen, due to the lack of a physical interface. Sounds should be added when they inform the user or reinforce interactions.

### Inform and reinforce
* For events not initiated by the user, such as asynchronous process completions and incoming messages, the field of view might not contain related visuals. Consider adding sounds to inform the user.
* Interactions may have several stages. Consider using sounds to reinforce stage transitions.

See below for examples of interactions, events, and suggested sound characteristics.

### Exercise restraint
Users don't have an unlimited capacity for audio information:
* Limit sounds to communicating specific, valuable pieces of information.
* When playing informative sounds, duck reinforcing sounds.
* In augmented reality, avoid chasing the user with sound. The user should have the option to attend to the physical world without inadvertently triggering sounds from virtual objects.

### Don't rely solely on sounds
Sounds used well will be valuable when your users can hear them, but ensure your application is usable even with the sound off.
* Users may be hearing impaired
* Your application may be used in a loud environment
* Users may have privacy or other reasons to disable the device audio

## How should I sonify interactions?
Interaction types in mixed reality include gesture, direct manipulation, and voice. Use the following suggested characteristics to select or design sounds for these interactions.

### Gesture interactions
In mixed reality, users can interact with buttons using a cursor. Button actions are generally performed when the user has released the button, rather than when it has been pressed, to allow the user a chance to cancel the interaction. Use sounds to reinforce these stages. Also, to assist users in targeting distant buttons, consider using a cursor hover sound.
* Button press sounds should have a short, tactile click.
		: MRTK example: MRTK_ButtonPress.wav
* Button unpress sounds should have a similar tactile feel. Having a raised pitch versus the press sound reinforces the sense of completion.
		: MRTK example: MRTK_ButtonUnpress.wav
* For hover sounds, consider using a subtle and non-threatening sound such as a low-frequency thud or bump.


### Direct manipulation
On HoloLens2, articulated hand tracking supports direct manipulation of user interface elements. Sounds are important replacements for the lack of physical feedback.

Confirming a **grab** or **release** in direct manipulation is difficult to communicate visually. The user's hand will often be in the way of any visual effect, and hard-bodied objects lack a real-world visual analogue of "grabbing". In contrast, sounds can effectively communicate successful grab and release interactions.
* Grab actions should have a short, somewhat muffled tactile sound that evokes the idea of fingers closing around an object. Sometimes this is accompanied by a "whoosh" sound leading up to the impact of the sound to communicate the motion of the hand when grabbing.
		? MRTK example: MRTK_Move_Start.wav
* Release actions should have a similarly short and tactile sound, usually pitched down from the grab sound and in a reverse order in time, having an impact and then a "whoosh" to communicate the object settling into place.
		? MRTK_Move_End.wav

A **drawing** interaction should have a looping, persistent sound that has its volume controlled by the movement of the user's hand, with it being completely silent when the user's hand is still, and at its maximum volume when the user's hand is moving quickly.

A **button press** sound is important in direct manipulation because the user lacks physical indication of when they've reached the bottom of the key travel. Visual indicators of key travel can be small, subtle, and occluded. As with gesture interactions, button presses should have a short, tactile sound like a click, and unpresses should have a similar click with raised pitch.
* MRTK example: MRTK_ButtonPress.wav
* MRTK example: MRTK_ButtonUnpress.wav


### Voice interactions
Voice interactions often have subtle visual elements. Reinforce the interaction stages using sounds. Consider choosing more tonal sounds to distinguish them from gesture and direct manipulation sounds.

* Use a positive-sounding tone for voice command **confirmations**. Rising tones and major musical intervals are effective at this.
* Use a shorter, less-positive sounding tone for voice command **failure**. Avoid negative sounds; instead, use a more percussive, neutral sound to communicate the application is moving on from the interaction.
* If your application uses a wake word, use a short, gentle tone when the device has **started listening**, and a subtle looping sound while the application listens. 

### Notifications
Notifications communicate application state changes and other events not initiated by the user, such as process completions, messages, and calls.

In mixed reality, objects that move can move out of the user's field of view. Accompany **animated objects** with a spatialized sound that depends on the object and speed of motion.
* It also helps to play a spatialized sound at the end of an animation to inform the user of the new position
* For gradual movements, a "whoosh" sound during movement will help the user track the object

**Message notifications** will most likely be heard several times, and sometimes in quick succession. It's important that it doesn't stand out or sound harsh. Mid-range positive tonal sounds are effective here.

* Calls should have similar qualities to a cell phone ringtone. These are usually looping musical phrases that play until the user has answered the call.
* Voice communication connection and disconnection should have a short, tonal sound. The connection sound should have a positive tone, indicating the successful connection, while the disconnection sound should be a neutral sound indicating completion of the call.

## Spatialization
Spatialization uses stereo headphones or speakers to place sounds into the mixed world.

### Which sounds should I spatialize?
A sound should be spatialized when it's associated with an event that has a spatial location. This includes UI, embodied AI voices, and visual indicators.

Spatializing **user interface** elements helps declutter user's sonic "space" by limiting the number of stereo sounds locked to their heads. Especially in direct manipulation interactions, touching, grabbing, and releasing feels more natural when audio feedback is spatialized.

Spatializing **visual indicators** intuitively informs users when they are outside the field of view.
	
For **faceless voice assistance**, and other elements without a well-defined spatial location, avoid spatialization. Spatialization without a related visual element can distract users into thinking there is a visual element that they can't find.

Adding spatialization will come with some CPU cost. Many applications will have, at most, two sounds playing simultaneously. The cost of spatialization in that case can be negligible. You can use the MRTK frame rate monitor to judge the impact of adding spatialization. 

### When and how should I apply distance-based attenuation?
In the physical world, sounds that are farther away are quieter. Your audio engine can model this attenuation based on the source distance. Use distance-based attenuation when it communicates relevant information.

The distances to **visual indicators**, **animated holograms**, and other informative sounds are usually relevant to the user. Use distance-based attenuation to intuitively provide this cue.
* Adjust the attenuation curve for each source to fit the size of your mixed world spaces. Your audio engine's default curve is often meant for very large (up to half-kilometer) spaces.

Sounds that reinforce the **progressive stages of buttons** and other interactions shouldn't have attenuation applied. The reinforcing effects of these sounds are generally more important than communicating the distance to the button. Variations can be distracting, especially with keyboards, where many button clicks will be heard in succession.

### Which spatialization technology should I use?
Use HRTF (head-related transfer function)-based spatialization technologies. They model the sound propagation around the head in the physical world. Even when a sound source is far on one side of the head, sound propagates to the distant ear with some attenuation and delay. Speaker panning, in contrast, relies only on attenuation, and applies total attenuation in the left ear when sounds are on the right side (and vice-versa). This can be uncomfortable for normal-hearing listeners, and be inaccessible for listeners with hearing impairment in one ear.

## Next steps
* [Use spatial sound in Unity](spatial-sound-in-unity.md)
* [Case study of Roboraid](case-study-using-spatial-sound-in-roboraid.md)
* [Case study of HoloTour](case-study-spatial-sound-design-for-holotour.md)


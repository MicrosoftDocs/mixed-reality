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
* Your users may have privacy or other reasons to disable the device audio

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

Confirming a **grab** or **release** in direct manipulation is difficult to communicate visually. The user's hand will often be in the way of any visual effect, and hard-bodied objects lack a real-world analogue. In contrast, sounds can effectively communicate successful grab and release interactions.
* Grab actions should have a short, somewhat muffled tactile sound that evokes the idea of fingers closing around an object. Sometimes this is accompanied by a "whoosh" sound leading up to the impact of the sound to communicate the motion of the hand when grabbing.
		? MRTK example: MRTK_Move_Start.wav
* Release actions should have a similarly short and tactile sound, usually pitched down from the grab sound and in a reverse order in time, having an impact and then a "whoosh" to communicate the object settling into place.
		? MRTK_Move_End.wav

A **drawing** interaction should have a looping, persistent sound that has its volume controlled by the movement of the user's hand, with it being completely silent when the user's hand is still, and at its maximum volume when the user's hand is moving quickly.

A **button press** sound is important in direct manipulation because the user lacks physical indication of when they've reached bottom of the key travel. Visual indicators of key travel can be small, subtle, and occluded. As with gesture interactions, button presses should have a short, tactile sound like a click, and unpresses should have a similar click with raised pitch.
* MRTK example: MRTK_ButtonPress.wav
* MRTK example: MRTK_ButtonUnpress.wav


### Voice interactions
Voice interactions generally have little to no visual element, leaving audio as the primary way that progress is communicated.

Voice interaction sounds are generally more tonal than their hand interaction counterparts.

* Wake words should have a short, gentle tone to inform the user that the device has started listening for available commands. If this is not accompanied by any visual cue, also consider a subtle looping sound while the application is waiting for a valid command. This not only reinforces the idea that the application is waiting for further input, but will immediately inform the user when it has stopped listening, whether or not a valid command has been given. This is useful for the case where you have to time out the voice interaction so accidental commands aren't registered later when the user is doing something else.
* Voice command confirmations should play a positive-sounding tone to communicate that the interaction was successful and the application is performing the command. Rising tones and major musical intervals work best for this.
* Voice command failure should be a shorter, less uplifting sound. Because negative sounds are usually avoided, a more percussive, neutral sound works to communicate that while the interaction was unsuccessful, the application is moving on, and the user can try using the command again if they wish.

### Notifications
Notifications communicate application state and communication updates like messages and calls.
* Message notifications should be positive tonal sounds, and should be very brief. These sounds will most likely be heard several times, sometimes in quick succession, so it is important that it doesn't stand out or sound harsh. Mid-range frequencies work best.
* Animated objects should usually be accompanied by a sound, varying greatly depending on the object and speed of motion. At minimum, it helps to play a spatialized sound at the end of the animation to inform the user of the new position. If the movement is gradual enough, a "whoosh" sound that plays for the duration of the movement will help the user keep track of it during the motion and easily find where it ends up.
* Calls should have similar qualities to a cell phone ringtone. These are usually looping musical phrases that play until the user has answered the call.
* Voice communication connection and disconnection should have a short, tonal sound. The connection sound should have a positive tone, indicating the successful connection, while the disconnection sound should be a neutral sound indicating completion of the call.

## Spatialization
Audio spatialization uses stereo headphones or speakers to place sounds into the mixed world.

### Which sounds should I spatialize?
Generally, when a sound is associated with an event that has a spatial location, the sound should be spatialized. This includes UI, embodied AI voices, and visual indicators. These objects can benefit from spatialized sounds.  By spatializing interaction sounds, we provide a more natural and realistic user experience.

* UI  -  audio emitting from the location of the user's hand the way it would in reality.  Touching, grabbing, releasing feels more natural when such audio feedback is spatialized.  This also helps declutter user's sonic "space" by limiting the amount of stereo/2D sounds that are locked to their heads.

* Visual Indicators - spatializing visual indicators helps user hear and locate objects even when they are outside of the field of view.  Human ears use audio cues such as loudness, time delay, attenuation for determining distances.  
	
* Faceless Voice Assistance - Consider using mono or stereo settings.  Spatialized voices in this case might cause distractions to the users which will then lead to a poor user experience.

Adding spatialization will come with some CPU cost. Many applications will have, at most, two sounds playing simultaneously. The cost of spatialization in that case can be negligible. You can use the MRTK frame rate monitor to judge the impact of adding spatialization. 

### When should I apply distance-based attenuation?
In the physical world, sounds that are farther away are quieter. Your audio engine provides a tool to model this attenuation based on the distance from the source to the user. There are cases when you should apply distance attenuation, and others when you should not.

* Sounds attached to user-initiated events will generally have a visible visual element. These shouldn't have distance attenuation.  Tools that the users frequent might not need the attenuation.  For example, the tactile feedback from the typing keyboard is essential to the user that the volume of it should be consistent regardless of the placement of it.  The distance decay will prompt the user to think negatively about the experience, as if something has gone wrong.
	

* You'll generally find that informative sounds are attached to objects that have a distance in the 3D world. You can apply distance-based attenuation to make the sounds from these objects quieter when farther. The default curve may not apply to the size of your expected space, so adjust the curve for each source to fit your needs.

### Which spatialization technology should I use?
There are several available spatialization technologies. Speaker panning techniques apply total attenuation to the far left side when a sound is on the far right side of the head. Speaker panning is lower in CPU cost, effective for loudspeaker setups, and often the default spatialization technology in audio engines. However, they can cause comfort and accessibility issues when heard over headphones. Users with hearing loss in one ear may not hear a sound source at all when it's panned entirely to their weak ear.

In the physical world, even when a sound source is far on one side of the head, sound propagates to both ears due to diffraction around the head. HRTF (head-related transfer function)-based spatialization technologies capture this and many other effects that are essential to user comfort when listening to spatialized sound over headphones. 

## Next steps
Enabling spatialization:
* [Unity](spatial-sound-in-unity.md)


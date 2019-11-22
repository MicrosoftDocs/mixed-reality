---
title: Use Sound in mixed-reality applications
description: Spatial sound is a powerful tool for immersion, accessibility, and UX design in mixed-reality applications.
author: kegodin
ms.author: kegodin
ms.date: 11/02/2019
ms.topic: article
keywords: Windows Mixed Reality, spatial sound, design, style
---

# Use sound in mixed-reality applications

You can use sound to inform and reinforce the user's mental model of application state. Use spatialization, when appropriate, to place sounds in the mixed world. When you connect the auditory and the visual in this way, you deepen the intuitive nature of many interactions and increase user confidence.

<br>

<iframe width="940" height="530" src="https://www.youtube.com/embed/aB3TDjYklmo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## When should I add sounds?
Mixed-reality applications often have a greater need for sound than 2D applications, due to their lack of a physical interface. You should add sounds when they inform the user or reinforce interactions.

### Inform and reinforce
* For events that aren't initiated by the user, such as notifications, use sound to inform the user that a change occurred.
* Interactions may have several stages. Use sound to reinforce stage transitions.

See the following examples of interactions, events, and suggested sound characteristics.

### Exercise restraint
Users don't have an unlimited capacity for audio information.
* Each sound should communicate specific, valuable information.
* When your app plays a sound to inform the user, temporarily reduce the volume of other sounds.
* For button hover sounds (see the following information), add a time delay to prevent excessive triggering of sounds.

### Don't rely solely on sounds
Sounds that are used well are valuable to your users. But make sure your application is usable even with the sound turned off.
* Users may be hearing impaired.
* Your application may be used in a loud environment.
* Users may have privacy concerns or other reasons to disable device audio.

## How should I sonify interactions?
Interaction types in mixed reality include gesture, direct manipulation, and voice. Use the following suggested characteristics to select or design sounds for these interactions.

### Gesture interactions
In mixed reality, users can interact with buttons by using a mouse. Button actions  generally occur when the user releases the button, rather than when it's pressed, to give the user a chance to cancel the interaction. Use sounds to reinforce these stages. Also, to assist users in targeting distant buttons, consider using a cursor-hover sound.
* Button-press sounds should have a short, tactile "click." Example: [MRTK_ButtonPress.wav](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/mrtk_development/Assets/MixedRealityToolkit.SDK/StandardAssets/Audio/MRTK_ButtonPress.wav)
* Button-unpress sounds should have a similar tactile feel. A higher pitch than the press sound reinforces the sense of completion. Example: [MRTK_ButtonUnpress.wav](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/mrtk_development/Assets/MixedRealityToolkit.SDK/StandardAssets/Audio/MRTK_ButtonUnpress.wav)
* For hover sounds, consider using a subtle and non-threatening sound, such as a low-frequency thud or bump.

### Direct manipulation
On HoloLens 2, articulated hand tracking supports direct manipulation of user interface elements. Sounds are important replacements when there's no other physical feedback.

A *button press* sound is important in direct manipulation because the user doesn't get any other indication of when they reached the bottom of the key stroke. Sound indicators of key travel can be small, subtle, and occluded. As with gesture interactions, button presses should have a short, tactile sound like a click, and unpresses should have a similar click with raised pitch.
* Example: [MRTK_ButtonPress.wav](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/mrtk_development/Assets/MixedRealityToolkit.SDK/StandardAssets/Audio/MRTK_ButtonPress.wav)
* Example: [MRTK_ButtonUnpress.wav](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/mrtk_development/Assets/MixedRealityToolkit.SDK/StandardAssets/Audio/MRTK_ButtonUnpress)

It's difficult to visual confirm a *grab* or *release* action. The user's hand will often be in the way of any visual effect, and hard-bodied objects lack a real-world visual analogue of "grabbing." In contrast, sounds can effectively communicate successful grab and release interactions.
* Grab actions should have a short, somewhat muffled tactile sound that evokes the idea of fingers closing around an object. Sometimes this is accompanied by a "whoosh" sound leading up to the impact of the sound to communicate the motion of the hand when grabbing. Example: [MRTK_Move_Start.wav](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/mrtk_development/Assets/MixedRealityToolkit.SDK/StandardAssets/Audio/MRTK_Move_Start.wav)
* Release actions should have a similarly short and tactile sound, usually pitched down from the grab sound and in a reverse order in time, with an impact and then a "whoosh" to communicate that the object is settling into place.	Example: [MRTK_Move_End.wav](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/mrtk_development/Assets/MixedRealityToolkit.SDK/StandardAssets/Audio/MRTK_Move_End.wav)

A *drawing* interaction should have a looping, persistent sound whose volume is controlled by the movement of the user's hand. It should be silent when the user's hand is still and at maximum volume when the user's hand is moving quickly.

### Voice interactions
Voice interactions often have subtle visual elements. Reinforce the interaction stages by using sounds. You may want to use more-tonal sounds to distinguish them them from gesture and direct manipulation sounds.

* Use a positive-sounding tone for voice command *confirmations*. Rising tones and major musical intervals are effective for this.
* Use a shorter, less-positive sounding tone for voice command *failure*. Avoid negative sounds. Instead, use a more percussive, neutral sound to communicate the application is moving on from the interaction.
* If your application has a wake word, use a short, gentle tone when the device *starts listening*. Use  a subtle looping sound while the application listens.

### Notifications
Notifications communicate application state changes and other events that aren't initiated by the user, such as process completions, messages, and calls.

In mixed reality, objects sometimes move out of the user's field of view. Accompany *animated objects* with a spatialized sound that depends on the object and speed of motion.
* It also helps to play a spatialized sound at the end of an animation to inform the user of the object's new position.
* For gradual movements, a "whoosh" sound during movement helps the user track the object

*Message notifications* will most likely be heard several times, and sometimes in quick succession. It's important that it doesn't stand out or sound harsh. Mid-range positive tonal sounds are effective.

* Calls should have similar qualities to a cell phone ringtone. These are usually looping musical phrases that play until the user answers the call.
* Voice communication connection and disconnection should have a short, tonal sound. The connection sound should be a positive tone, to indicate a successful connection. The disconnection sound should be a neutral sound to indicate completion of the call.

## Spatialization
Spatialization uses stereo headphones or speakers to place sounds in the mixed-reality world.

### Which sounds to spatialize
A sound should be spatialized when it's associated with an event that has a spatial location. This includes UI, embodied AI voices, and visual indicators.

Spatialize *user interface* elements to help declutter the user's sonic "space" by limiting the number of stereo sounds that they hear. Manipulation interactions such as touching, grabbing, and releasing feel more natural when audio feedback is spatialized. See the following information about distance attenuation for these elements.

Spatialize *visual indicators* and *embodied AI voices* to intuitively inform users when these are outside the field of view.
	
In contrast, avoid spatialization for *faceless AI voices* and other elements that lack a well-defined spatial location. Spatialization without a related visual element can distract users into thinking there's a visual element that they can't find.

Spatialization does come with some CPU cost. Many applications will have at most two sounds playing simultaneously. The cost of spatialization in that case is likely negligible. You can use the MRTK frame rate monitor to judge the impact of adding spatialization.

### When and how to apply distance-based attenuation
In the physical world, sounds that are farther away are quieter. Your audio engine can model this attenuation based on the source distance. Use distance-based attenuation when it communicates relevant information.

The distances to *visual indicators*, *animated holograms*, and other informative sounds is usually relevant to the user. Use distance-based attenuation to intuitively provide cues.
* Adjust the attenuation curve for each source to fit the size of your mixed-reality world spaces. Your audio engine's default curve is often meant for very large (up to half-kilometer) spaces.

Sounds that reinforce the *progressive stages of button actions* and other interactions shouldn't get attenuation applied. The reinforcing effects of these sounds are generally more important than communicating the distance to the button. Variations can be distracting, especially with keyboards, where many button clicks may be heard in succession.

### Which spatialization technology to use
When using headphones or the HoloLens speakers, use head-related transfer function (HRTF)-based spatialization technologies. They model the sound propagation around the head in the physical world. Even when a sound source is on the far side of one's head, sound propagates to the distant ear, with some attenuation and delay. Speaker panning, in contrast, relies only on attenuation and applies total attenuation in the left ear when sounds are on the right side (and vice-versa). This can be uncomfortable for "normal hearing" listeners and inaccessible for listeners who have hearing impairment in one ear.

## Next steps
* [Use spatial sound in Unity](spatial-sound-in-unity.md)
* [Case study of Roboraid](case-study-using-spatial-sound-in-roboraid.md)
* [Case study of HoloTour](case-study-spatial-sound-design-for-holotour.md)


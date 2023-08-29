---
title: Spatial audio best practices
description: Spatial audio is a powerful tool for immersion, accessibility, and UX design in mixed-reality applications.
author: kegodin
ms.author: vinnietieto
ms.date: 11/02/2019
ms.topic: article
keywords: Windows Mixed Reality, spatial sound, design, style, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens, MRTK, Mixed Reality Toolkit, gestures, interactions, attenuation
---

# Spatial sound best practices

If you're new to working with spatial sound, see our [Spatial sound overview](spatial-sound.md).

You can use sound to inform and reinforce the user's mental model of application state. Use spatialization, when appropriate, to place sounds in the mixed-reality world. When you connect the auditory and the visual in this way, you deepen the intuitive nature of interactions and increase user confidence.

> [!VIDEO https://www.youtube.com/embed/aB3TDjYklmo]

## When to add sounds

Mixed-reality applications often have a greater need for sound than 2D apps because of their lack of a tactile interface. Add sounds when they inform the user or reinforce interactions.

### Inform and reinforce

* For events that aren't initiated by the user, such as notifications, use sound to inform the user that a change occurred.
* Interactions may have several stages. Use sound to reinforce stage transitions.

See the following examples of interactions, events, and suggested sound characteristics.

### Exercise restraint

Users don't have an unlimited capacity for audio information.
* Each sound should communicate specific, valuable information.
* When your app plays a sound to inform the user, temporarily reduce the volume of other sounds.
* For button hover sounds (see the following information), add a time delay to prevent excessive sound triggering.

### Don't rely solely on sounds

Sounds that are used well are valuable to your users. But make sure your application is usable even with the sound turned off.
* Users may be hard of hearing.
* Your application may be used in a loud environment.
* Users may have privacy concerns or other reasons to disable device audio.

## How to sonify interactions

Interaction types in mixed reality include gesture, direct manipulation, and voice. Use the following suggested characteristics to select or design sounds for these interactions.

### Gesture interactions

In mixed reality, users may interact with buttons by using a mouse. Button actions generally occur when the user releases rather than presses the button to give the user a chance to cancel the interaction. Use sounds to reinforce these stages. To assist users in targeting distant buttons, also consider using a pointer-hover sound.
* Button-press sounds should be a short, tactile "click."<br/>Example: [MRTK_ButtonPress.wav](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/main/Assets/MRTK/SDK/StandardAssets/Audio/MRTK_ButtonPress.wav)
* Button-"unpress" sounds should have a similar tactile feel. A higher pitch than the press sound reinforces the sense of completion.<br/>Example: [MRTK_ButtonUnpress.wav](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/main/Assets/MRTK/SDK/StandardAssets/Audio/MRTK_ButtonUnpress.wav)
* For hover sounds, consider using a subtle and non-threatening sound, such as a low-frequency thud or bump.

### Direct manipulation

On HoloLens 2, articulated hand tracking supports direct manipulation of user-interface elements. Sounds are important when there's no other physical feedback.

A *button press* sound is important because the user doesn't get any other indication when they reach the bottom of the key stroke. Sound indicators of key travel can be small, subtle, and occluded. As with gesture interactions, button presses should get a short, tactile sound like a click. Unpresses should have a similar click sound but with raised pitch.
* Example: [MRTK_ButtonPress.wav](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/main/Assets/MRTK/SDK/StandardAssets/Audio/MRTK_ButtonPress.wav)
* Example: [MRTK_ButtonUnpress.wav](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/main/Assets/MRTK/SDK/StandardAssets/Audio/MRTK_ButtonUnpress.wav)

It's difficult to visually confirm a grab or release action. The user's hand will often be in the way of any visual effect, and hard-bodied objects lack a real-world visual analog of "grabbing." Sounds can effectively communicate successful grab and release interactions.
* Grab actions should have a short, somewhat-muffled tactile sound that prompts the idea of fingers closing around an object. Sometimes there's also a "whoosh" sound that leads up to the grabbing sound to communicate the motion of the hand.<br/>Example: [MRTK_Move_Start.wav](https://github.com/microsoft/MixedRealityToolkit-Unity/blob/db7bbec0e72a7ff0b853b5a37283d41a416f8398/Assets/MRTK/StandardAssets/Audio/MRTK_Move_Start.wav)
* Release actions should get a similarly short and tactile sound. It's usually lower pitched than the grab sound and in reverse order, with an impact and then a "whoosh" to communicate that the object is settling into place.<br/>Example: [MRTK_Move_End.wav](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/main/Assets/MRTK/SDK/StandardAssets/Audio/MRTK_Move_End.wav)

A *drawing* interaction should get a persistent, looping sound with volume determined by the user's hand movement. It should be silent when the user's hand is still and loudest when the hand is moving quickly.

### Voice interactions

Voice interactions often have subtle visual elements. Use sounds to reinforce interaction stages. You may want to use more-tonal sounds to distinguish them from gesture and direct-manipulation sounds.

* Use a positive-sounding tone for voice command *confirmations*. Rising tones and major musical intervals are effective.
* Use a shorter, less-positive-sounding tone for voice command *failures*. Avoid negative sounds. Instead, use a more percussive, neutral sound to communicate that the application is moving on from the interaction.
* If your application has a wake word, use a short, gentle tone when the device *starts listening*. Use  a subtle looping sound while the application *is* listening.

### Notifications

Notifications signal application-state changes and other events the user didn't initiate. State changes can include process completions, messages, and phone calls.

In mixed reality, objects sometimes move out of the user's field of view. Pair moving *animated objects* with a spatialized sound that depends on the object type and speed of motion.
* It helps to play a spatialized sound at the end of an animation to inform the user of the object's new position.
* For gradual movements, a "whoosh" sound during movement helps the user track the object.

*Message notification* sounds may be heard repeatedly, sometimes in quick succession. It's important they don't stand out or sound harsh. Mid-range positive tonal sounds are effective.

* Incoming-call sounds should have similar qualities to a cell phone ringtone. These sounds are looping musical phrases that play until the user answers the call.
* Voice communication connection and disconnection should have a short, tonal sound. The connection sound should be a positive tone to indicate a successful connection. The disconnection sound should be a neutral sound to indicate completion of the call.

## Handle spatialization

Spatialization uses stereo headphones or speakers to place sounds in the mixed-reality world.

### Which sounds to spatialize

A sound should be spatialized when it's associated with an event that has a spatial location. This includes UI, embodied AI voices, and visual indicators.

Spatialize *user interface* elements to help declutter the user's sonic "space" by limiting the number of stereo sounds that they hear. Manipulation interactions such as touching, grabbing, and releasing feel more natural when audio feedback is spatialized. Consider the following information about distance attenuation for these elements.

Spatialize *visual indicators* and *embodied AI voices* to intuitively inform users when these things are outside the field of view.
	
In contrast, avoid spatialization for *faceless AI voices* and other elements that lack a well-defined spatial location. Spatialization without a related visual element can distract users into thinking there's a visual element that they can't find.

Spatialization does come with some CPU cost. Many applications have at most two sounds playing simultaneously. The cost of spatialization in that case is likely negligible. You can use the MRTK frame rate monitor to judge the impact of adding spatialization.

### When and how to apply distance-based attenuation

In the physical world, sounds that are farther away are quieter. Your audio engine can model this attenuation based on the source distance. Use distance-based attenuation when it communicates relevant information.

The distances to *visual indicators*, *animated holograms*, and other informative sounds are relevant to the user. Use distance-based attenuation to intuitively provide cues.

Adjust the attenuation curve for each source to fit the size of your mixed-reality world's spaces. Your audio engine's default curve is often meant for large (up to half-kilometer) spaces.

Sounds that reinforce the *progressive stages of button actions* and other interactions shouldn't get attenuation applied. The reinforcing effects of these sounds are more important than communicating the distance to the button. Variations can be distracting, especially with keyboards, when many button clicks may be heard in succession.

### Which spatialization technology to use

With headphones or the HoloLens speakers, use head-related transfer function (HRTF)-based spatialization technologies. These technologies model the sound propagation around the head in the physical world. Even when a sound source is on the far side of one's head, sound propagates to the distant ear with some attenuation and delay. Speaker panning relies only on attenuation and applies total attenuation in the left ear when sounds are on the right side, and the other way around. This technique can be uncomfortable for "normal hearing" listeners and inaccessible for listeners who are hard of hearing in one ear.

## Next steps

* [Use spatial sound in Unity](../develop/unity/spatial-sound-in-unity.md)
* [Case study of Roboraid](case-study-using-spatial-sound-in-roboraid.md)
* [Case study of HoloTour](case-study-spatial-sound-design-for-holotour.md)

---
title: Spatial sound
description: Using spatial sound in a mixed reality application allows you to convincingly place sounds in a 3D space.
author: hak0n
ms.author: hakons
ms.date: 03/21/2018
ms.topic: article
keywords: spatial sound, surround sound, 3d audio, 3d sound, spatial audio
---



# Spatial sound

When objects are out of our line of sight, one of the ways that we can perceive what's going on around us is through sound. In Windows Mixed Reality, the audio engine provides the aural component of the mixed-reality experience by simulating 3D sound using direction, distance, and environmental simulations. Using spatial sound in an application allows developers to convincingly place sounds in a 3 dimensional space (sphere) all around the user. Those sounds will then seem as if they were coming from real physical objects or the mixed reality holograms in the user's surroundings. Given that [holograms](hologram.md) are objects made of light and sometimes sound, the sound component helps ground holograms making them more believable and creating a more immersive experience.

Although holograms can only appear visually where the user's gaze is pointing, your app's sound can come from all directions; above, below, behind, to the side, etc. You can use this feature to draw attention to an object that might not currently be in the user's view. A user can perceive sounds to be emanating from a source in the mixed-reality world. For example, as the user gets closer to an object or the object gets closer to them, the volume increases. Similarly, as objects move around a user, or vice versa, spatial sounds give the illusion that sounds are coming directly from the object.

<br>

>[!VIDEO https://www.youtube.com/embed/PTPvx7mDon4]

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
        <td>Spatial sound</td>
        <td>✔️</td>
        <td>✔️</td>
        <td>✔️ (with headphones)</td>
    </tr>
</table>

## Simulating the perceived location and distance of sounds

By analyzing how sound reaches both our ears, our brain determines the distance and direction of the object emitting the sound. An HRTF (or Head Related Transfer Function) simulates this interaction by modeling the spectral response that characterizes how an ear receives sound from a point in space. The spatial audio engine uses personalized HRTFs to expand the mixed reality experience, and simulate sounds that are coming from various directions and distances.

<br>

>[!VIDEO https://www.youtube.com/embed/aB3TDjYklmo]

Left or right audio (azimuth) cues originate from differences in the time sound arrives at each ear. Up and down cues originate from spectral changes produced by the outer ear shape (pinnae). By designating where audio is coming from, the system can simulate the experience of sound arriving at different times to our ears. Note that on HoloLens, while azimuth spatialization is personalized, the simulation of elevation is based on an average set of anthropometrics. Thus, elevation accuracy may be less accurate than azimuth accuracy.

The characteristics of sounds also change based on the environment in which they exist. For instance, shouting in a cave will cause your voice to bounce off the walls, floors, and ceilings, creating an echo effect. The room model setting of spatial sound reproduces these reflections to place sounds in a particular audio environment. You can use this setting to match the user's actual location for simulation of sounds in that space to create a more immersive audio experience.

## Integrating spatial sound

Because the general principle of mixed reality is to ground [holograms](hologram.md) in the user's physical world or virtual environment, most sounds from holograms should be spatialized. On HoloLens, there are naturally CPU and memory budget considerations, but you can use 10-12 spatial sound voices there while using less than ~12% of the CPU (~70% of one of the four cores). Recommended use for spatial sound voices include:
* Gaze Mixing (highlighting objects, particularly when out of view). When a hologram needs a user's attention, play a sound on that hologram (e.g. have a virtual dog bark). This helps the user to find the hologram when it is not in view.
* Audio Haptics (reactive audio for touchless interactions). For example, play a sound when the user's hand or motion controller enters and exits the gesture frame. Or play a sound when the user selects a hologram.
* Immersion (ambient sounds surrounding the user).

It is also important to note that while blending standard stereo sounds with spatial sound can be effective in creating realistic environments, the stereo sounds should be relatively quiet to leave room for the subtle aspects of spatial sound, such as reflections (distance cues) that can be difficult to hear in a noisy environment.

Windows' spatial sound engine only supports a 48k sample rate for playback. Most middleware, such as Unity, will automatically convert sound files into the supported format, but when using Windows Audio APIs directly please match the format of the content to the format supported by the effect.

## See also
* [MR Spatial 220](holograms-220.md)
* [Spatial sound in Unity](spatial-sound-in-unity.md)
* [Spatial sound in DirectX](spatial-sound-in-directx.md)
* [Spatial sound design](spatial-sound-design.md)

---
title: Audio
description: Applying spatialization and acoustics to audio in a mixed reality application allows you to immerse users and enhance UI effectiveness.
author: hak0n
ms.author: hakons
ms.date: 03/21/2018
ms.topic: article
keywords: spatial sound, surround sound, 3d audio, 3d sound, spatial audio
---

# Audio

Audio is a key component of many applications and can be used to provide UI feedback, call attention to visual elements, evoke an ambience, and provide cues about the environmentand application state. Audio takes on special importance and power in mixed reality applications. New input modalities make audio-based UI feedback essential to user effectiveness, and holograms in your world, especially those that move, beg for audio to ground them. Head tracking makes immersive spatialization possible, and life-size, walk-around holograms increase the emotional impact of realistic acoustics. 

Application scenarios vary, with some scenarios needing only simple spatialization or stereo audio, while others benefit from realistic multi-room acoustics, and levels in between. We've organized materials to help you determine your needs and set goals for audio design and realism, and we provide tools and guides to reach those goals.

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
        <td>Spatialization</td>
        <td>✔️</td>
        <td>✔️</td>
        <td>✔️ (with headphones)</td>
    </tr>
     <tr>
        <td>Spatialization offload</td>
        <td>❌</td>
        <td>✔️</td>
        <td>❌</td>
    </tr>
</table>

## Developers
* Augmented reality 
* Virtual reality
When adding audio to a mixed reality application, we tend to organize technical choices into graded steps of complexity of spatialization and acoustics. Depending on the application scenario you may want to choose a different tradeoff to achieve design goals and consider computational and design costs.
* Stereo
* Spatialization-only
* Spatialization with acoustics

## Technical info
Software support is available for four combinations of game engine and audio engine. We also provide an OS API to access hardware offload when writing plugins for other audio engines.
* Unity game engine + Unity audio engine
* Unity game engine + Wwise audio engine
* Unreal game engine + Unreal audio engine
* Unreal game engine + Wwise audio engine
* ISAC: For Direct-X applications and custom audio engines

To access spatialization hardware offload on HoloLens2 using other audio engines, ask your audio engine provider about support for the ISAC API.

## Spatialization offload
HoloLens2 provides spatialization offload to help applications reach target framerates without sacrificing audio immersion. 

## Technical background: Spatialization and acoustics

By analyzing how sound reaches both our ears, our brain determines the distance and direction of the object emitting the sound. An HRTF (or Head Related Transfer Function) simulates this interaction by modeling the spectral response that characterizes how an ear receives sound from a point in space. The spatial audio engine uses personalized HRTFs to expand the mixed reality experience, and simulate sounds that are coming from various directions and distances.

<br>

>[!VIDEO https://www.youtube.com/embed/aB3TDjYklmo]

Left or right audio (azimuth) cues originate from differences in the time sound arrives at each ear. Up and down cues originate from spectral changes produced by the outer ear shape (pinnae). By designating where audio is coming from, the system can simulate the experience of sound arriving at different times to our ears. Note that on HoloLens, while azimuth spatialization is personalized, the simulation of elevation is based on an average set of anthropometrics. Thus, elevation accuracy may be less accurate than azimuth accuracy.

The characteristics of sounds also change based on the environment in which they exist. For instance, shouting in a cave will cause your voice to bounce off the walls, floors, and ceilings, creating an echo effect. The room model setting of spatial sound reproduces these reflections to place sounds in a particular audio environment. You can use this setting to match the user's actual location for simulation of sounds in that space to create a more immersive audio experience.


## See also
* [Spatial sound in Unity](spatial-sound-in-unity.md)
* [Spatial sound in DirectX](spatial-sound-in-directx.md)
* [Spatial sound design](spatial-sound-design.md)


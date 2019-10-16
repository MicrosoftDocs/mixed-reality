---
title: Audio in Mixed Reality
description: Audio in mixed reality can increase user confidence in UI interactions and immerse users in the experience.
author: kegodin
ms.author: kegodin
ms.date: 11/07/2019
ms.topic: article
keywords: spatial sound, surround sound, 3d audio, 3d sound, spatial audio
---

# Audio in Mixed Reality
Audio is an essential part of design and productivity in mixed reality, from ensuring user confidence in gesture- and voice-based interactions, to guiding users to next steps, to effectively combining virtual objects with the real world.

The low-latency head tracking of mixed reality headsets, including HoloLens, enables the use of high quality HRTF-based spatialization. Spatializing audio in your application can provide UI feedback, call attention to visual elements, help users maintain awareness of their real-world surroundings, and provide cues to application state. Layering on acoustics connects holograms to the mixed world and can provide cues about the environment and object state.

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
        <td>✔️</td>
    </tr>
     <tr>
        <td>Spatialization hardware acceleration</td>
        <td>❌</td>
        <td>✔️</td>
        <td>❌</td>
    </tr>
</table>

## Sound design
The APIs and 1st- and 3rd-party tools used to render audio in a mixed reality application are the same as those used on other Windows platforms. However, [sound design in mixed reality](spatial-sound-design.md) can have a different impact on the user and require a different approach than in other modalities such as touch and keyboard-and-mouse. For example, in mixed reality, audio can provide essential feedback for a UI that otherwise lacks tactile response due to lack of a touchscreen or input device. As another example, when no holograms are visible, audio can let users know the application is still running, and help them find their way back to visible application elements.

## Spatialization
[Spatialization](spatial-sound-spatialization.md) tells the listener the source direction of audio. Spatializing over a 7.1 home theater system is as simple as panning across the loudspeakers, but when rendering over headphones in mixed reality it's essential to use a technology like HRTFs for accuracy and comfort. HoloLens2 provides hardware acceleration of HRTF-based spatialization.

Windows provides spatialization, including HRTFs, via the [ISpatialAudioClient API](spatial-sound-in-directx.md). Spatialization is also available via [Unity plugin](spatial-sound-unity.md).

## Acoustics
Spatial audio can be about more than direction. Other dimensions, including occlusion, obstruction, reverb, portalling, and source modelling, are collectively referred to as 'acoustics'. [Project Acoustics](http://aka.ms/acoustics) is an effective option for cases where the relevant scene geometry is static, such as in many immersive headset applications.

## Case studies
The following case study describes the sound design for HoloTour, where a special microphone and rendering setup were used to capture real spaces: [Sound design for HoloTour](case-study-spatial-sound-design-for-holotour.md).

RoboRaid is a high-energy shooter for HoloLens. The following case study describes the design choices made to ensure spatial audio was used to fullest dramatic effect: [Sound design for RoboRaid](case-study-using-spatial-sound-in-roboraid.md).

## See also
* [Spatial sound in DirectX](spatial-sound-in-directx.md)


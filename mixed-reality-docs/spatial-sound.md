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
Audio is an essential part of design and productivity in mixed reality, from user confidence in gesture- and voice-based interactions, to providing users guidance on next steps, to effectively combining virtual objects with the real world.

The low-latency head tracking of mixed reality headsets, including HoloLens, enables the use of high quality HRTF-based spatialization. Among many uses, spatializing audio in your application can help provide UI feedback, call attention to visual elements, evoke an ambience, and provide cues to application state. Layering on acoustics further connects holograms to the mixed world and can provide cues about the environment and object state.

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
        <td>Spatialization hardware acceleration</td>
        <td>❌</td>
        <td>✔️</td>
        <td>❌</td>
    </tr>
</table>

## Audio
The APIs and 1st- and 3rd-party tools used to render audio in a mixed reality application are the same as those used on other Windows platforms. However, [sound design in mixed reality](spatial-sound-design.md) can have a different impact on the user and require a different approach than in other modalities such as touch and keyboard-and-mouse. For example, in mixed reality, audio can provide essential feedback for a UI that otherwise lacks tactile response due to lack of a touchscreen or input device. As another example, when no holograms are visible, such as when a HoloLens user has turned in a direction away from all application holograms, audio can help users know that the app is still running, and help them find their way back to the main application elements.

## Spatialization
[Spatialization](spatial-sound-spatialization.md) tells the listener the source direction of audio. Spatializing over a 7.1 home theater system is as simple as linear panning across the loudspeakers, but when rendering over headphones in mixed reality it's essential to use a technology like HRTFs for accuracy and user comfort. HoloLens2 provides hardware acceleration of HRTF-based spatialization.

## Acoustics
Spatial audio can be about more than direction. Other dimensions, including occlusion, obstruction, reverb, portalling, and source modelling, are collectively referred to as 'acoustics'. [Project Acoustics](http://aka.ms/acoustics) is an effective option for cases where the relevant scene geometry is static, such as in many immersive headset applications.

## Mixed reality audio case studies
Case studies. Write 1-sentence intro for each.
* [Sound design for HoloTour](case-study-spatial-sound-design-for-holotour.md)
* [Sound design for RoboRaid](case-study-using-spatial-sound-in-roboraid.md)

## See also
* [Spatial sound in DirectX](spatial-sound-in-directx.md)


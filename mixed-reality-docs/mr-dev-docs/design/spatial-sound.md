---
title: How spatial sound works
description: Audio in mixed reality can increase user confidence in UI interactions and immerse users in the experience.
author: kegodin
ms.author: v-vtieto
ms.date: 12/08/2021
ms.topic: article
keywords: spatial sound, surround sound, 3d audio, 3d sound, spatial audio, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens, MRTK, Mixed Reality Toolkit, case studies, acoustics
---

# How spatial sound works

Sound is an essential part of design and productivity in mixed reality. It more deeply connect holograms to the mixed-reality world and provides cues about the environment and object state. [Use of sounds in mixed reality](spatial-sound-design.md) requires a different approach than in touch and keyboard-and-mouse applications. Key sound design decisions include which sounds to spatialize and which interactions to sonify. 

See detailed [examples of design that uses audio](spatial-sound-design.md).

"Spatial" sound can:
* Increase user confidence in gesture and voice interactions.
* Guide users to next steps.
* Effectively combine virtual objects with the real world.

The low-latency head tracking of mixed reality headsets, including HoloLens, supports high-quality HRTF-based spatialization. You can spatialize audio in your application to:
* Call attention to visual elements.
* Help users maintain awareness of their real-world surroundings.

## Spatialization

Spatialization is the directional component of spatial audio. For a 7.1 home theater setup, spatialization is as simple as panning between loudspeakers. But for headphones in mixed reality, it's essential to use an HRTF-based technology for accuracy and comfort. Windows offers HRTF-based spatialization, and this support is hardware-accelerated on HoloLens 2.

<br>

<iframe width="940" height="530" src="https://www.youtube.com/embed/aB3TDjYklmo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Should I spatialize?

Spatialization can improve many sounds in mixed-reality applications. Spatialization takes a sound out of the listener's head and places it in the world. For suggestions on effective use of spatialization in your application, see [Spatial sound design](spatial-sound-design.md).

<br>

<iframe width="940" height="530" src="https://www.youtube.com/embed/PTPvx7mDon4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens (first gen)</strong></a></td>
        <td><a href="https://docs.microsoft.com/hololens/hololens2-hardware"><strong>HoloLens 2</strong></td>
        <td><a href="../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
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

### Case studies

HoloTour virtually takes users to tourist and historical sites around the world. See the [Sound design for HoloTour](case-study-spatial-sound-design-for-holotour.md) case study. A special microphone and rendering setup were used to capture the subject spaces.

RoboRaid is a high-energy shooter for HoloLens. The [Sound design for RoboRaid](case-study-using-spatial-sound-in-roboraid.md) case study describes the design choices that were made to ensure spatial audio was used to the fullest dramatic effect.

### Spatializer personalization

HRTFs manipulate the level and phase differences between ears across the frequency spectrum. They're based on physical models and measurements of human head, torso, and ear shapes (pinnae). Our brains respond to these differences to provide perceived direction in sound.

Every individual has a unique ear shape, head size, and ear position. So the best HRTFs conform to you. To increase spatialization accuracy, HoloLens uses your inter-pupilary distance (IPD) from the headset displays to adjust the HRTFs for your head size.

### Spatializer platform support

Windows offers spatialization, including HRTFs, via the [ISpatialAudioClient API](/windows/win32/coreaudio/spatial-sound). This API exposes the HoloLens 2 HRTF hardware acceleration to applications.

### Spatializer middleware support

Support for Windows' HRTFs is available for the following third-party audio engines.
* A [Unity audio engine plugin](../develop/unity/spatial-sound-in-unity.md)
* A [Wwise audio engine plugin](https://www.audiokinetic.com/products/plug-ins/msspatial/)

## Acoustics

Spatial audio is about more than direction. Other dimensions include occlusion, obstruction, reverb, portaling, and source modeling. Collectively these dimensions are referred to as *acoustics*. Without acoustics, spatialized sounds lack perceived distance.

Acoustics treatments range from simple to complex. You can use a reverb that's supported by any audio engine to push spatialized sounds into the environment of the listener. Acoustics systems such as [Project Acoustics](/gaming/acoustics/what-is-acoustics)  provide richer and more compelling acoustics treatment. Project Acoustics can model the effect of walls, doors, and other scene geometry on a sound. It's an effective option for cases where the relevant scene geometry is known at development time.

## Next steps

- [Spatial sound in Unity](../develop/unity/spatial-sound-in-unity.md)
- [How to use sound in mixed-reality applications](spatial-sound-design.md)
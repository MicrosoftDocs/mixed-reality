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
Many of the platform audio APIs and supporting tools used in a mixed reality application are the same as those used in other Windows applications. However, [sound design in mixed reality](spatial-sound-design.md) can require a different approach than in other modalities such as touch and keyboard-and-mouse. Key sound design decisions include which sounds to spatialize and which interactions to sonify. These decisions can have a strong effect on user confidence, productivity, and learning curve.

### Sound design case studies
HoloTour virtually takes users to tourist and historical sites around the world. The following case study describes the sound design for HoloTour: [Sound design for HoloTour](case-study-spatial-sound-design-for-holotour.md). A special microphone and rendering setup were used to capture the subject spaces.

RoboRaid is a high-energy shooter for HoloLens. The following case study describes the design choices made to ensure spatial audio was used to fullest dramatic effect: [Sound design for RoboRaid](case-study-using-spatial-sound-in-roboraid.md).

## Spatialization
Spatialization adds a sense of direction to spatial audio. When using a 7.1 home theater setup, spatialization is as simple as panning between loud speakers. But mixed reality is experienced over headphones, and with headphones it's essential to use a technology like HRTFs for accuracy and comfort. Windows offers several spatialization technologies depending on the device, and HoloLens2 includes hardware acceleration of HRTF-based spatialization.

<br>

>[!VIDEO https://www.youtube.com/embed/aB3TDjYklmo]

### Should I spatialize?
Many sounds in mixed reality applications benefit from spatialization, which takes a sound out of the listener's head and places it in the world. Refer to [Spatial Sound Design](spatial-sound-design.md) for suggestions on the most effective uses of spatialization in your application.

### Spatializer personalization
HRTFs manipulate the level and phase differences between ears across the frequency spectrum. They're based on physical models and measurements of human head, torso, and ear shapes (pinnae). Our brains respond to these differences to give rise to a perception of direction in sound. 

Every individual has a unique ear shape, head size, and ear position, so the best HRTFs are those that conform to you. HoloLens and HoloLens2 increase spatialization accuracy by using your inter-pupilary distance (IPD) from the headset displays to adjust the HRTFs for your head size.

### Spatializer platform support
Windows offers spatialization, including HRTFs, via the [ISpatialAudioClient API](https://docs.microsoft.com/windows/win32/coreaudio/spatial-sound). This API exposes the HoloLens2 HRTF hardware acceleration to applications.

### Spatializer middleware support
Support for Windows' HRTFs is available for some 3rd-party audio engines:
* A [Unity audio engine](spatial-sound-in-unity.md) plugin calls the HRTF XAPO
* A [Wwise audio engine plugin](https://www.audiokinetic.com/products/plug-ins/msspatial/) calls the ISpatialAudioClient API

## Acoustics
Spatial audio can be about more than direction. Other dimensions, including occlusion, obstruction, reverb, portalling, and source modelling, are collectively referred to as 'acoustics'. Without acoustics, spatialized sounds lack a perceived distance and are heard as being 'stuck' on a sphere surrounding the listener.

Acoustics treatment can range from simple to very complex. By using a simple reverb, such as that supported by any audio engine, you can push spatialized sounds out into the environment surrounding the listener. For more details, see [spatial sound design](spatial-sound-design.md).

Rich and compelling acoustics treatment is available from acoustics systems such as [Project Acoustics](http://aka.ms/acoustics). Project Acoustics can model the effect of walls, doors, and other scene geometry on a sound, and is an effective option for cases where the relevant scene geometry is known at development time.


---
title: Spatial Audio
description: Applying spatialization and acoustics to audio in a mixed reality application allows you to immerse users and enhance UI effectiveness.
author: hak0n
ms.author: hakons
ms.date: 03/21/2018
ms.topic: article
keywords: spatial sound, surround sound, 3d audio, 3d sound, spatial audio
---

# Spatial Audio

Spatial audio takes on new life in mixed reality applications with low-latency head tracking. You can use spatial audio in your application to provide UI feedback, call attention to visual elements, evoke an ambience, and provide cues about the environment and application state. 

Spatial audio can be about more than spatialization. Holograms in your world, especially those that move, beg for environment processing to ground them. Life-size, walk-around holograms increase the emotional impact of realistic acoustics. 

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

## Use cases of spatial sound
Case studies. Write an intro to each case study so that it's clear to the reader whether it addresses their scenario.

## Getting started: Adding spatialization
Brief intro sentences including mentioning HW offload. Then link to 'intro to spatialization' page for background and orientation. Then link to 'spatialization-integration' page for technical info on software.

## Spatialization and acoustics
What is acoustics? Occlusion, obstruction, reverb, portalling, and source modelling. Project Acoustics is an effective option for cases where the relevant scene geometry is static, such as in many immersive headset applications.

## More resources
* [Sample applications] (link to documentation in sample app repo)
* [Design advice] (spatial-sound-design.md)

## See also
* [Spatial sound in Unity](spatial-sound-in-unity.md)
* [Spatial sound in DirectX](spatial-sound-in-directx.md)


---
title: Gaze
description: Gaze is the first form of input and is a primary form of targeting within mixed reality. 
author: thetuvix
ms.author: alexturn
ms.date: 02/24/2019
ms.topic: article
keywords: Mixed reality, gaze, interaction, design
---



# Gaze

**Gaze** is the first form of input and is a primary form of targeting within mixed reality. 
Gaze tells you where the user is looking in the world and lets you determine their intent. 
In the real world, you'll typically look at an object that you intend to interact with. 
This is the same with gaze.

Mixed reality headsets use the position and orientation of your user's head to determine their head gaze vector. 
You can think of this vector as a laser pointer straight ahead from directly between the user's eyes. 
As the user looks around the room, your application can intersect this ray, both with its own holograms and with the [spatial mapping](spatial-mapping.md) mesh to determine what virtual or real-world object your user may be looking at.

On HoloLens 2, interactions can be targeted by either the user's head gaze, eye gaze or through near or far hand interactions.
On HoloLens (1st gen), interactions should generally derive their targeting from the user's head gaze, rather than trying to render or interact at the hand's location directly. 
Once an interaction has started, relative motions of the hand may be used to control the [gesture](gestures.md), as with the [manipulation or navigation](gestures.md#composite-gestures) gesture. 
With immersive headsets, you can target using either head gaze or pointing-capable [motion controllers](motion-controllers.md).

<br>

>[!VIDEO https://www.youtube.com/embed/zCPiZlWdVws]

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
        <td>Head gaze</td>
        <td>✔️</td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
     <tr>
        <td>Eye gaze</td>
        <td>❌</td>
        <td>✔️</td>
        <td>❌</td>
    </tr>
</table>

> [!NOTE]
> More guidance specific to HoloLens 2 [coming soon](index.md#news-and-notes).


## Uses of gaze

As a mixed reality developer, you can do a lot with head or eye gaze:
* Your app can intersect gaze with the holograms in your scene to determine where the user's attention is.
* Your app can target gestures and controller presses based on the user's gaze, letting the user select, activate, grab, scroll, or otherwise interact with their holograms.
* Your app can let the user place holograms on real-world surfaces, by intersecting their gaze ray with the spatial mapping mesh.
* Your app can know when the user is *not* looking in the direction of an important object, which can lead your app to give visual and audio cues to turn towards that object.

## Cursor

For head gaze, most apps should use a [cursor](cursors.md) (or other auditory/visual indication) to give the user confidence in what they're about to interact with. 
You typically position this cursor in the world where their head gaze ray first intersects an object, which may be a hologram or a real-world surface.

![An example visual cursor to show gaze](images/cursor.jpg)<br>
*An example visual cursor to show gaze*

For eye gaze, we generally recommend *not* to show a cursor, as this can quickly become distracting and annoying for the user. 
Instead subtly highlight visual targets or use a very faint eye cursor to provide confidence about what the user is about to interact with. For more information, please check out our [design guidance for eye-based input](eye-tracking.md) on HoloLens 2.

## Giving action to the user's gaze

Once the user has targeted a hologram or real-world object using their gaze, their next step is to take action on that object. The primary ways for a user to take action are through [gestures](gestures.md), [motion controllers](motion-controllers.md) and [voice](voice-input.md).

## See also
* [MR Input 210: Head gaze](holograms-210.md)
* [Head and eye gaze in DirectX](gaze-in-directx.md)
* [Head gaze in Unity](gaze-in-unity.md)
* [Eye tracking on HoloLens 2](eye-tracking.md)
* [Eye gaze in Unity using Mixed Reality Toolkit](https://aka.ms/mrtk-eyes)

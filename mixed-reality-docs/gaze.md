---
title: Gaze
description: Gaze is the first form of input and is a primary form of targeting within mixed reality. 
author: thetuvix
ms.author: alexturn
ms.date: 03/21/2018
ms.topic: article
keywords: Windows Mixed Reality, Gaze, Interaction, design
---



# Gaze

**Gaze** is the first form of input and is a primary form of targeting within mixed reality. Gaze tells you where the user is looking in the world and lets you determine their intent. In the real world, you'll typically look at an object that you intend to interact with. This is the same with gaze.

Mixed reality headsets use the position and orientation of your user's head, not their eyes, to determine their gaze vector. You can think of this vector as a laser pointer straight ahead from directly between the user's eyes. As the user looks around the room, your application can intersect this ray, both with its own holograms and with the [spatial mapping](spatial-mapping.md) mesh to determine what virtual or real-world object your user may be looking at.

On HoloLens, interactions should generally derive their targeting from the user's gaze, rather than trying to render or interact at the hand's location directly. Once an interaction has started, relative motions of the hand may be used to control the [gesture](gestures.md), as with the [manipulation or navigation](gestures.md#composite-gestures) gesture. With immersive headsets, you can target using either gaze or pointing-capable [motion controllers](motion-controllers.md).

<br>

>[!VIDEO https://www.youtube.com/embed/zCPiZlWdVws]

## Device support

<table>
<tr>
<th>Feature</th><th style="width:150px"> <a href="hololens-hardware-details.md">HoloLens</a></th><th style="width:150px"> <a href="immersive-headset-hardware-details.md">Immersive headsets</a></th>
</tr><tr>
<td> Gaze</td><td style="text-align: center;"> ✔️</td><td style="text-align: center;"> ✔️</td>
</tr>
</table>



## Uses of gaze

As a mixed reality developer, you can do a lot with gaze:
* Your app can intersect gaze with the holograms in your scene to determine where the user's attention is.
* Your app can target gestures and controller presses based on the user's gaze, letting the user select, activate, grab, scroll, or otherwise interact with their holograms.
* Your app can let the user place holograms on real-world surfaces, by intersecting their gaze ray with the spatial mapping mesh.
* Your app can know when the user is *not* looking in the direction of an important object, which can lead your app to give visual and audio cues to turn towards that object.

## Cursor

Most apps should use a [cursor](cursors.md) (or other auditory/visual indication) to give the user confidence in what they're about to interact with. You typically position this cursor in the world where their gaze ray first interacts an object, which may be a hologram or a real-world surface.

![An example visual cursor to show gaze](images/cursor.jpg)<br>
*An example visual cursor to show gaze*

## Giving action to the user's gaze

Once the user has targeted a hologram or real-world object using their gaze, their next step is to take action on that object. The primary ways for a user to take action are through [gestures](gestures.md), [motion controllers](motion-controllers.md) and [voice](voice-input.md).

## See also
* [MR Input 210: Gaze](holograms-210.md)
* [Gaze, gestures, and motion controllers in DirectX](gaze,-gestures,-and-motion-controllers-in-directx.md)
* [Gaze in Unity](gaze-in-unity.md)

---
title: Spatialization
description: Spatialization techniques and impact.
author: hak0n
ms.author: hakons
ms.date: 03/21/2018
ms.topic: quickstart
keywords: spatial sound, surround sound, 3d audio, 3d sound, spatial audio
---

# Spatialization
By analyzing how sound reaches both our ears, our brain determines the distance and direction of the object emitting the sound. An HRTF (or Head Related Transfer Function) simulates this interaction by modeling the spectral response that characterizes how an ear receives sound from a point in space. The spatial audio engine uses personalized HRTFs to expand the mixed reality experience, and simulate sounds that are coming from various directions and distances.

<br>

>[!VIDEO https://www.youtube.com/embed/aB3TDjYklmo]

## What is spatialization?

## When to spatialize?

## Technical background

Left or right audio (azimuth) cues originate from differences in the time sound arrives at each ear. Up and down (elevation) cues originate from spectrum changes produced by the outer ear shape (pinnae). By designating where audio is coming from, the system can simulate the experience of sound arriving at different times to our ears. 

## Options
Get MRTK. Or use Project Acoustics.

## Features
HW offload of spatialization.

## Supported configurations
Software support is available for four combinations of game engine and audio engine. We also provide an OS API to access hardware offload when writing plugins for other audio engines.
* [Unity game engine with Unity audio engine](spatial-sound-in-unity.md)
* [Unreal game engine with Unreal audio engine](spatial-sound-in-unreal.md)
* [Wwise audio engine with Unity or Unreal](spatial-sound-in-wwise.md)
* [Spatial sound in Direct-X applications and custom audio engines](spatial-sound-in-directx.md)

## There's more than spatialization...
The characteristics of sounds also change based on the environment in which they exist. For instance, shouting in a cave will cause your voice to bounce off the walls, floors, and ceilings, creating an echo effect. The room model setting of spatial sound reproduces these reflections to place sounds in a particular audio environment. You can use this setting to match the user's actual location for simulation of sounds in that space to create a more immersive audio experience.

## Next steps


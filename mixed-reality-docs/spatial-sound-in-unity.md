---
title: Spatial sound in Unity
description: Playing spatial sound that comes from a specific 3D point within your Unity scene.
author: thetuvix
ms.author: alexturn
ms.date: 2/28/2018
ms.topic: article
keywords: Unity, spatial sound, HRTF, room size
---



# Spatial sound in Unity

This topic describes how to use Spatial Sound in your Unity projects. It covers the required plugin files as well as the Unity components and properties that enable Spatial Sound.

## Enabling Spatial Sound in Unity

Spatial Sound, in Unity, is enabled using an audio spatializer plugin. The plugin files are bundled directly into Unity so enabling spatial sound is as easy as going to **Edit > Audio > Spatializer** and enabling the Microsoft HRTF extension. Since Microsoft Spatial Sound only supports 48000 currently, you should also set your System Sample Rate to 48000 to prevent an HRTF failure in the rare case that your system output device is not set to 48000 already:

![Inspector for AudioManager](images/audio-250px.png)

Your Unity project is now configured to use Spatial Sound.

**Note that, while the Windows 10 SDK may be used to build HoloLens apps on Windows versions prior to Windows 10, if you aren't using Windows 10, you will not get Spatial Sound in the editor nor on the device.**

## Using Spatial Sound in Unity

Spatial Sound is used in your Unity project by adjusting three settings on your Audio Source components. The following steps will configure your Audio Source components for Spatial Sound.
* In the **Hierarchy** panel, select the game object that has an attached **Audio Source**.
* In the **Inspector** panel, under the **Audio Source** component
    * Check the **Spatialize** option.
    * Set **Spatial Blend** to **3D** (numeric value 1).
    * For best results, expand **3D Sound Settings** and set **Volume Rolloff** to **Custom Rolloff**.

![Inspector panel in Unity showing the Audio Source](images/audiosource.png)

Your sounds now realistically exist inside your project's environment!

It is strongly recommended that you become familiar with the [Spatial Sound design guidelines](spatial-sound-design.md). These guidelines help to integrate your audio seamlessly into your project and to further immerse your users into the experience you have created.

## Setting Spatial Sound Settings

The Microsoft Spatial Sound plugin provides an additional parameter that can be set, on a per Audio Source basis, to allow additional control of the audio simulation. This parameter is the size of the simulated room.

### Room Size

The size of room that is being simulated by Spatial Sound. The approximate sizes of the rooms are; small (an office to a small conference room), medium (a large conference room) and large (an auditorium). You can also specify a room size of none to simulate an outdoor environment. The default room size is small.

### Example

The MixedRealityToolkit for Unity provides a static class that makes setting the Spatial Sound settings easy. This class can be found in the [MixedRealityToolkit\SpatialSound folder](https://github.com/Microsoft/MixedRealityToolkit-Unity/tree/master/Assets/HoloToolkit/SpatialSound) and can be called from any script in your project. It is recommended that you set these parameters on each Audio Source component in your project. The following example shows selecting the medium room size for an attached Audio Source.

```cs
AudioSource audioSource = gameObject.GetComponent<AudioSource>()

if (audioSource != null) {
    SpatialSoundSettings.SetRoomSize(audioSource, SpatialMappingRoomSizes.Medium);
}
```

### Directly Accessing Parameters from Unity

If you don't want to use the excellent Audio tools in the MixedRealityToolkit, here is how you would change HRTF Parameters. You can copy/paste this into a script called **SetHRTF**.cs that you will want to attach to every HRTF AudioSource. It lets you change parameters important to HRTF.

```cs
using UnityEngine;
   using System.Collections;
   public class SetHRTF : MonoBehaviour    {
       public enum ROOMSIZE { Small, Medium, Large, None };
       public ROOMSIZE room = ROOMSIZE.Small;  // Small is regarded as the "most average"
       // defaults and docs from MSDN
       // https://msdn.microsoft.com/en-us/library/windows/desktop/mt186602(v=vs.85).aspx
       AudioSource audiosource;
       void Awake()
       {
           audiosource = this.gameObject.GetComponent<AudioSource>();
           if (audiosource == null)
           {
               print("SetHRTFParams needs an audio source to do anything.");
               return;
           }
           audiosource.spatialize = 1; // we DO want spatialized audio
           audiosource.spread = 0; // we dont want to reduce our angle of hearing
           audiosource.spatialBlend = 1;   // we do want to hear spatialized audio
           audiosource.SetSpatializerFloat(1, (float)room);    // 1 is the roomsize param
       }
   }
```

## See also
* [Spatial sound](spatial-sound.md)
* [Spatial sound design](spatial-sound-design.md)

---
title: Spatial sound in Unity
description: Playing spatial sound that comes from a specific 3D point within your Unity scene.
author: thetuvix
ms.author: alexturn
ms.date: 03/21/2018
ms.topic: article
keywords: Unity, spatial sound, HRTF, room size
---

# Spatial Sound in Unity

This topic links to resources to help you use and design with the Microsoft HRTF spatializer in your Unity mixed reality projects.

## Enabling spatialization

### Enable spatialization plugin
Enable the **MS HRTF Spatializer** in your project's audio settings. For more details, see [Unity's spatializer documentation](https://docs.unity3d.com/Manual/VRAudioSpatializer.html). 

### Enable spatialization on sound sources
Attach an **Audio Source** to an object in the hierarchy, and enable spatialization by checking the **Enable spatialization** checkbox and moving the **Spatial Blend** slider to '1'. For more details, see [Unity's audio source documentation](https://docs.unity3d.com/2019.3/Documentation/Manual/class-AudioSource.html). 

## Design with spatialization

### Distance-based decay
Unity's default distance-based decay has a minimum distance of 1 meter and a maximum distance of 500 meters, with a linear rolloff. With these settings, sound sources in even the largest of mixed reality scenes will not get perceivably quieter as they become farther away. See [sound design in mixed reality](spatial-sound-design.md) for recommended settings for distance decay curves, and see [Unity's audio source documentation](https://docs.unity3d.com/2019.3/Documentation/Manual/class-AudioSource.html) for information on setting these curves in Unity.

### Environment
The **MS HRTF Spatializer** includes a room reverb component with [four reverb settings](https://docs.microsoft.com/en-us/windows/win32/api/hrtfapoapi/ne-hrtfapoapi-hrtfenvironment) and a default of 'small'. The room setting can be changed programmatically for each audio source by attaching the following C# script to each object in Unity with a spatialized Audio Source:

```cs
using UnityEngine;
   using System.Collections;
   public class SetHRTF : MonoBehaviour    {
       public enum ROOMSIZE { Small, Medium, Large, None };
       public ROOMSIZE room = ROOMSIZE.Small;  // Small is regarded as the "most average"
       // defaults and docs from MSDN
       // https://msdn.microsoft.com/library/windows/desktop/mt186602(v=vs.85).aspx
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

## Unity spatial sound examples
The Mixed Reality Toolkit (MRTK) includes examples of ways to apply audio effects in mixed reality: [MRTK demos](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/mrtk_release/Assets/MixedRealityToolkit.Examples/Demos/Audio).


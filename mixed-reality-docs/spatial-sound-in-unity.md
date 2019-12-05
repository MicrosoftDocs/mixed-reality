---
title: Spatial sound in Unity
description: Play spatial sound from a specific 3D point within your Unity scene.
author: kegodin
ms.author: kegodin
ms.date: 11/07/2019
ms.topic: article
keywords: Unity, spatial sound, HRTF, room size
---

# Spatial sound in Unity

This article links to resources that help you design by using the Microsoft HRTF spatializer in Unity mixed-reality projects.

## Enable spatialization

Enable the *MS HRTF Spatializer* in your project's audio settings. For details, see the [Unity spatializer documentation](https://docs.unity3d.com/Manual/VRAudioSpatializer.html).

Attach an *Audio Source* to an object in the hierarchy. To enable spatialization, select the **Enable spatialization** check box, and move the **Spatial Blend** slider to "1." For details, see the [Unity audio source documentation](https://docs.unity3d.com/2019.3/Documentation/Manual/class-AudioSource.html).

## Design with spatialization

### Distance-based attenuation
The default distance-based decay in Unity has a minimum distance of 1 meter and a maximum of 500 meters, with a logarithmic rolloff. These settings may work for your scenario, or you may find that sources attenuate too quickly or too slowly. For recommended settings for the distance decay curve, see [sound design in mixed reality](spatial-sound-design.md). For information about setting these curves in Unity, see the [Unity audio source documentation](https://docs.unity3d.com/2019.3/Documentation/Manual/class-AudioSource.html) .

### Environment
The *MS HRTF Spatializer* includes a room reverb component with [four reverb settings](https://docs.microsoft.com/windows/win32/api/hrtfapoapi/ne-hrtfapoapi-hrtfenvironment). The default value is "small." You can change the room setting programmatically for each audio source. To change it, attach the following C# script to each object in Unity that has a spatialized audio source:

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

## Next steps
The Mixed Reality Toolkit (MRTK) includes [demos of how to apply audio effects in mixed reality](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/mrtk_release/Assets/MixedRealityToolkit.Examples/Demos/Audio).

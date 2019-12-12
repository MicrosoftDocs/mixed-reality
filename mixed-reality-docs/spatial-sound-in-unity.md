---
title: Spatial sound in Unity
description: Playing spatial sound that comes from a specific 3D point within your Unity scene.
author: kegodin
ms.author: kegodin
ms.date: 11/07/2019
ms.topic: article
keywords: Unity, spatial sound, HRTF, room size
---

# Spatial Sound in Unity

This page links to resources to help you use and design with the _Microsoft Spatializer_ in your Unity mixed reality projects.

## Enable spatialization

Use [NuGet for Unity](https://github.com/GlitchEnzo/NuGetForUnity/releases/latest) to install _Microsoft.SpatialAudio.Spatializer.Unity_ and choose **Microsoft Spatializer** in your project's audio settings. Then:
* Attach an **Audio Source** to an object in the hierarchy
* Check the **Enable spatialization** checkbox
* Move the **Spatial Blend** slider to '1'

For more details, see:
* [Microsoft spatializer GitHub repository](https://github.com/microsoft/spatialaudio-unity)
* [Microsoft's spatializer tutorial](unity-spatial-audio-ch1.md)
* [Unity's audio source documentation](https://docs.unity3d.com/2019.3/Documentation/Manual/class-AudioSource.html)
* [Unity's spatializer documentation](https://docs.unity3d.com/Manual/VRAudioSpatializer.html)

## Distance-based attenuation
Unity's default distance-based decay has a minimum distance of 1 meter and a maximum distance of 500 meters, with a logarithmic rolloff. This may work for your scenario, or you may find sources attenuate too quickly or too slowly. See:
* [Sound design in mixed reality](spatial-sound-design.md) for recommended settings
* [Unity's audio source documentation](https://docs.unity3d.com/2019.3/Documentation/Manual/class-AudioSource.html) for instructions on setting these curves

## Reverb
The _Microsoft Spatializer_ changes the way reverb is handled for spatialized sources in the Unity audio graph. See [Chapter 5 of the spatializer tutorial](unity-spatial-audio-ch5.md) for instructions.

## Unity spatial sound examples
* [MRTK demos](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/mrtk_release/Assets/MixedRealityToolkit.Examples/Demos/Audio)
* [Microsoft Spatializer sample project](https://github.com/microsoft/spatialaudio-unity/tree/master/Samples/MicrosoftSpatializerSample)

## Next steps
* [Sound design in mixed reality](spatial-sound-design.md)
* [Microsoft's spatializer tutorial](unity-spatial-audio-ch1.md)


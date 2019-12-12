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

<<<<<<< HEAD
This page links to resources for spatial sound in Unity.

## Spatializer options
Spatializer options for mixed reality applications include:
* The *MS HRTF Spatializer*. Unity provides this as part of the *Windows Mixed Reality* optional package.
  * This runs on CPU in a higher-cost 'single-source' architecture.
  * This is provided for backwards compatibility with original HoloLens applications.
* The *Microsoft Spatializer*. This is available from the [Microsoft spatializer GitHub repository](https://github.com/microsoft/spatialaudio-unity).
  * This uses a lower-cost 'multi-source' architecture.
  * On HoloLens 2, this is offloaded to a hardware accelerator.

For new applications, we recommend the *Microsoft Spatializer*.

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
Unity's default distance-based decay has a minimum distance of 1 meter and a maximum distance of 500 meters, with a logarithmic rolloff. These settings may work for your scenario, or you may find that sources attenuate too quickly or too slowly. For more details, see:
* [Sound design in mixed reality](spatial-sound-design.md) for recommended settings
* [Unity's audio source documentation](https://docs.unity3d.com/2019.3/Documentation/Manual/class-AudioSource.html) for instructions on setting these curves

## Reverb
The _Microsoft Spatializer_ changes the way reverb is handled for spatialized sources in the Unity audio graph. See [Chapter 5 of the spatializer tutorial](unity-spatial-audio-ch5.md) for instructions.

## Unity spatial sound examples
For examples of spatial sound in Unity, see:
* [MRTK demos](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/mrtk_release/Assets/MixedRealityToolkit.Examples/Demos/Audio)
* The [Microsoft Spatializer sample project](https://github.com/microsoft/spatialaudio-unity/tree/master/Samples/MicrosoftSpatializerSample)

## Next steps
* [Sound design in mixed reality](spatial-sound-design.md)
* [Microsoft's spatializer tutorial](unity-spatial-audio-ch1.md)


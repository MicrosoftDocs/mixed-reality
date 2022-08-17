---
title: Spatial sound in Unity
description: Learn how to play and attenuate spatial sounds from a specific 3D point within your Unity scene with examples.
author: sean-kerawala
ms.author: sekerawa
ms.date: 11/07/2019
ms.topic: article
keywords: Unity, spatial sound, HRTF, room size, mixed reality headset, windows mixed reality headset, virtual reality headset, MRTK, Mixed Reality Toolkit, spatializer, reverb
---

# Spatial sound in Unity

This page links to resources for spatial sound in Unity.

## Spatializer options

Spatializer options for mixed reality applications include:
* Unity provides the *MS HRTF Spatializer* as part of the *Windows Mixed Reality* optional package.
  * Runs on CPU in a higher-cost 'single-source' architecture.
  * Provided for backwards compatibility with original HoloLens applications.
* The *Microsoft Spatializer* is available from the [Microsoft spatializer GitHub repository](https://github.com/microsoft/spatialaudio-unity).
  * Uses a lower-cost 'multi-source' architecture.
  * Offloaded to a hardware accelerator on the HoloLens 2. 

For new applications, we recommend the *Microsoft Spatializer*.

## Enable spatialization

Use [NuGet for Unity](https://github.com/GlitchEnzo/NuGetForUnity/releases/latest) to install _Microsoft.SpatialAudio.Spatializer.Unity_ and choose **Microsoft Spatializer** in your project's audio settings. Then:
* Attach an **Audio Source** to an object in the hierarchy
* Check the **Enable spatialization** checkbox
* Move the **Spatial Blend** slider to '1'
* Ensure spatial audio is enabled on your developer workstation. 
    * Right-click on the volume icon in the task bar and making sure that Spatial Sound is set to something other than "off". 
    * Choose **Windows Sonic for Headphones** to get the best representation of what you'll hear on HoloLens 2.

>[!NOTE]
>If you get an error in Unity about not being able to load plugin Microsoft.SpatialAudio.Spatializer.Unity because one of its dependencies is missing, check that you have the latest version of the [Microsoft Visual C++ Redistributable](https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads) installed on your PC.

For more information, see:
* [Microsoft spatializer GitHub repository](https://github.com/microsoft/spatialaudio-unity)
* [Microsoft's spatializer tutorial](/learn/modules/spatial-audio-tutorials-mrtk/)
* [Unity's audio source documentation](https://docs.unity3d.com/2019.3/Documentation/Manual/class-AudioSource.html)
* [Unity's spatializer documentation](https://docs.unity3d.com/Manual/VRAudioSpatializer.html)

## Distance-based attenuation

Unity's default distance-based decay has a minimum distance of 1 meter and a maximum distance of 500 meters, with a logarithmic rolloff. These settings may work for your scenario, or you may find that sources attenuate too quickly or too slowly. For more information, see:
* [Sound design in mixed reality](../../design/spatial-sound-design.md) for recommended settings.
* [Unity's audio source documentation](https://docs.unity3d.com/2019.3/Documentation/Manual/class-AudioSource.html) for instructions on setting these curves.

## Reverb

The _Microsoft Spatializer_ disables post-spatializer effects by default. To enable reverb and other effects for spatialized sources:
* Attach the **Room Effect Send Level** component to each source
* Adjust the send level curve for each source, to control the gain on the audio sent back to the graph for effects processing

See [Chapter 5 of the spatializer tutorial](/learn/modules/spatial-audio-tutorials-mrtk/10-use-reverb-to-add-distance-to-spatial-audio) for details.

## Unity spatial sound examples

For examples of spatial sound in Unity, see:
* [MRTK demos](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/main/Assets/MRTK/Examples/Demos/Audio)
* The [Microsoft Spatializer sample project](https://github.com/microsoft/spatialaudio-unity/tree/master/Samples/MicrosoftSpatializerSample)

## Next Development Checkpoint

If you're following the Unity development journey we've laid out, you're in the midst of exploring the Mixed Reality core building blocks. From here, you can continue to the next building block:

> [!div class="nextstepaction"]
> [Text](text-in-unity.md)

Or jump to Mixed Reality platform capabilities and APIs:

> [!div class="nextstepaction"]
> [Shared experiences](shared-experiences-in-unity.md)

You can always go back to the [Unity development checkpoints](unity-development-overview.md#2-core-building-blocks) at any time.

## See also

* [Sound design in mixed reality](../../design/spatial-sound-design.md)
* [Microsoft's spatializer tutorial](/learn/modules/spatial-audio-tutorials-mrtk/)
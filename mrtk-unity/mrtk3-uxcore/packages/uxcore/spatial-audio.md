---
title: Spatial Audio
description: How to configure spatial audio for UX components in MRTK3
author: marlenaklein-msft
ms.author: marlenaklein
ms.date: 4/26/2023
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, UX, UXCore, UX Core, packaging
---

# Spatial Audio

For some UX components, you may want an `AudioSource` to play sound, like a button click. In order to spatialize this sound, you need to use a spatializer. For new applications, the `Microsoft Spatializer` is recommended. Documentation on how to set up the Microsoft Spatializer can be found [here](/windows/mixed-reality/develop/unity/spatial-sound-in-unity). 

<br/>

### Configuring AudioSource 

In order to enable spatial audio for an AudioSource with Microsoft Spatializer, the `Spatialize` checkbox should be enabled, `Spatial Blend` set to `1`, and `Output` set to the spatialized audio mixer. For an example of using spatial audio with a UX component, check out the buttons in the MRTK3 sample scenes.

![An example of an audio source configured for spatial audio](images/spatialaudio_config.png)

> [!IMPORTANT]
> When using Microsoft Spatializer, be sure to set the `Output` to the audio mixer. If `Spatialize` is enabled, and no mixer is set, no sound will play. 
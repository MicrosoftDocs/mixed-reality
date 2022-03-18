---
title: Mixed reality capture for Unreal
description: Learn about performing mixed reality capture in Unreal.
author: vtieto
ms.author: vinnietieto
ms.date: 09/28/2021
ms.topic: article
keywords: mrc, photo, video, capture, camera
---

# Mixed reality capture with Unreal

> [!NOTE]
> See [Render from the PV camera](#render-from-the-pv-camera-opt-in) below for guidance on a new MRC capability for HoloLens 2.

Before getting started here, we recommend that you take a look at our [mixed reality capture overview](../advanced-concepts/mixed-reality-capture-overview.md) article.

#### Render from the PV camera (opt-in)

HoloLens 2 adds the ability for an immersive app to **render from the PV camera** while mixed reality capture is running. To ensure the app supports the additional render correctly, the app has to opt in to this functionality.

Render from the PV camera offers the following improvements over the default MRC experience:
* Hologram alignment to your physical environment and hands for near interactions should be accurate at all distances. Avoid having an offset at distances other than the focus point as you might see in the default MRC.
* The right eye in the headset won't be compromised, as it won't be used to render the holograms for the MRC output.

There are three steps to enable rendering from the PV camera:
1. Enable the PhotoVideoCamera HolographicViewConfiguration
2. Handle the additional HolographicCamera render
3. Verify your shaders and code render correctly from this additional HolographicCamera

##### Enable the PhotoVideoCamera HolographicViewConfiguration in Unreal

> [!NOTE]
> This requires **Unreal Engine 4.25** or newer.

To opt in to rendering from the PV Camera:

1. Call **SetEnabledMixedRealityCamera** and **ResizeMixedRealityCamera**
    * Use the **Size X** and **Size Y** values to set the video dimensions.

![Camera 3rd](images/unreal-camera-3rd.PNG)

##### Handle the additional HolographicCamera render in Unreal

This is done for you automatically by Unreal.

### Creating a custom MRC recorder

While the user can always trigger a photo or video using the system MRC capture service, an application may want to build a custom camera app that include holograms in the camera stream just like MRC. This allows the application to kick off captures from user input, build custom recording UI, or customize MRC settings to name a few examples.

#### MRC access for developers

We recommend you always request Exclusive control for the camera when using MRC. This will ensure your application has full control of the settings for the camera as long as you're aware of the limitations listed above.

## See also

* [Mixed reality capture overview](../advanced-concepts/mixed-reality-capture-overview.md)
* [Mixed reality capture for HoloLens users](/hololens/holographic-photos-and-videos)

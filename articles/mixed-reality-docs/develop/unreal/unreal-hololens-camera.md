---
title: HoloLens Photo/Video Camera in Unreal
description: Guide to using the HoloLens photo/video camera in Unreal
author: hferrone
ms.author: v-hferrone
ms.date: 06/10/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, mixed reality, development, features, documentation, guides, holograms, camera, PV camera, MRC
---
# HoloLens Photo/Video Camera in Unreal

## Overview

The HoloLens has a Photo/Video (PV) Camera that is used for both Mixed Reality Capture (MRC) and can be used by an app to access real-world visuals.

## Render from the PV Camera for MRC

> [!NOTE]
> This requires **Unreal Engine 4.25** or newer.

The system, and custom MRC recorders, create mixed reality captures by combining the PV Camera with holograms rendered by the immersive app.

By default, mixed reality capture uses the right eye's holographic output. If an immersive app chooses to [render from the PV Camera](../platform-capabilities-and-apis/mixed-reality-capture-for-developers.md#render-from-the-pv-camera-opt-in) then that will be used instead. This improves the mapping between the real world and the holograms in the MRC video.

To opt-in to rendering from the PV Camera:

1. Call **SetEnabledMixedRealityCamera** and **ResizeMixedRealityCamera**
    * Use the **Size X** and **Size Y** values to set the video dimensions.

![Camera 3rd](../platform-capabilities-and-apis/images/unreal-camera-3rd.PNG)

Unreal will then handle requests from MRC to render from the PV Camera's perspective.

> [!NOTE]
> Only when [Mixed Reality Capture](../../mixed-reality-capture.md) is triggered will the app be asked to render from the photo/video camera's perspective.

## Using the PV Camera

The webcam texture can be retrieved in the game at runtime, but it needs to be enabled in the editor's **Edit > Project Settings**:
1. Go to **Platforms > HoloLens > Capabilities** and check **Webcam**.
    * Use the **StartCameraCapture** function to use the webcam at runtime and the **StopCameraCapture** function to stop recording.

![Camera Start Stop](images/unreal-camera-startstop.PNG)

## Rendering an image
To render the camera image:
1. Create a dynamic material instance based on a material in the project, which is named **PVCamMat** in the screenshot below.  
2. Set the dynamic material instance to a **Material Instance Dynamic Object Reference** variable.  
3. Set the material of the object in the scene that will render the camera feed to this new dynamic material instance.
    * Start a timer that will be used to bind the camera image to the material.

![Camera Render](images/unreal-camera-render.PNG)

4. Create a new function for this timer, in this case **MaterialTimer**, and call **GetARCameraImage** to get the texture from the webcam.  
5. If the texture is valid, set a texture parameter in the shader to the image.  Otherwise, start the material timer again.

![Camera Texture from webcam](images/unreal-camera-texture.PNG)

5. Make sure the material has a parameter matching the name in **SetTextureParameterValue** that's bound to a color entry. Without this, the camera image can't be properly displayed.

![Camera Texture](images/unreal-camera-material.PNG)

## Next Development Checkpoint

If you're following the Unreal development checkpoint journey we've laid out, you're in the midst of exploring the Mixed Reality platform capabilities and APIs. From here, you can proceed to the next topic:

> [!div class="nextstepaction"]
> [QR codes](unreal-qr-codes.md)

Or jump directly to deploying your app on a device or emulator:

> [!div class="nextstepaction"]
> [Deploying to device](unreal-deploying.md)

You can always go back to the [Unreal development checkpoints](unreal-development-overview.md#3-platform-capabilities-and-apis) at any time.

## See also
* [Locatable camera](../platform-capabilities-and-apis/locatable-camera.md)
* [Mixed reality capture for developers](../platform-capabilities-and-apis/mixed-reality-capture-for-developers.md)

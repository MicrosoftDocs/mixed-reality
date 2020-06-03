---
title: HoloLens Camera in Unreal
description: Guide to using the HoloLens camera in Unreal
author: hferrone
ms.author: v-haferr
ms.date: 5/5/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, mixed reality, development, features, documentation, guides, holograms, camera, 3rd camera, MRC
---
# HoloLens Camera in Unreal

## Overview

Third camera Mixed Reality Capture (MRC) renders a mixed reality capture from the position of the HoloLens visor camera instead of the eye textures in the scene. This improves the mapping between the real world and the holograms in the MRC video. 

To opt into using third camera MRC:
1. Call **SetEnabledMixedRealityCamera** and **ResizeMixedRealityCamera**
    * Use the **Size X** and **Size Y** values to set the video dimensions. 

![Camera 3rd](images/unreal-camera-3rd.PNG)

2. Record an MRC video in the HoloLens device portal. 

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

![Camera Texture](images/unreal-camera-texture.PNG)

5. Make sure the material has a parameter matching the name in **SetTextureParameterValue** that's bound to a color entry. Without this, the camera image can't be properly displayed.

![Camera Texture](images/unreal-camera-material.PNG)

## See also
* [Locatable camera](locatable-camera.md)
* [Mixed reality capture for developers](mixed-reality-capture-for-developers.md)

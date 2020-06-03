---
title: HoloLens Camera in Unreal
description: Guide to using the HoloLens camera in Unreal
author: sw5813
ms.author: jacksonf
ms.date: 5/5/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, mixed reality, development, features, documentation, guides, holograms, camera, 3rd camera, MRC
---
# HoloLens Camera in Unreal

## Third Camera Mixed Reality Capture

Third camera Mixed Reality Capture (MRC) can be used to render a mixed reality capture from the perspective of the camera on the HoloLens visor, rather than the perspective of the eye textures.  This improves the mapping between the real world and the holograms in the MRC video. 

To opt into using third camera MRC, call SetEnabledMixedRealityCamera and ResizeMixedRealityCamera with the desired video dimensions. 

![Camera 3rd](images/unreal-camera-3rd.PNG)

Then record an MRC video in the HoloLens device portal. 

## PV Camera

The webcam texture can also be retrieved in the game at runtime.  To get the webcam texture on HoloLens, first ensure the “Webcam” capability is checked in the Unreal editor under Project Settings > Platform > HoloLens > Capabilities. 

Opt into using the webcam at runtime with the StartCameraCapture function.  Stop capturing with the StopCameraCapture function. 

![Camera Start Stop](images/unreal-camera-startstop.PNG)

To render the camera image, first create a dynamic material instance based on a material in the project.  In this case based on a material named PVCamMat.  Set this to a variable with type Material Instance Dynamic Object Reference.  Then set the material of the object in the scene that will render the camera feed to this new dynamic material instance and start a timer that will be used to bind the camera image to the material. 

![Camera Render](images/unreal-camera-render.PNG)

Create a new function for this timer, in this case MaterialTimer, and call GetARCameraImage to get the texture from the webcam.  If this texture is valid, set a texture parameter in the shader to this image.  Otherwise, start the material timer again. 

![Camera Texture](images/unreal-camera-texture.PNG)

The material should have a parameter matching the name in SetTextureParameterValue bound to a color entry to properly display the camera image. 

![Camera Texture](images/unreal-camera-material.PNG)

## See also
* [Locatable camera](locatable-camera.md)
* [Mixed reality capture for developers](mixed-reality-capture-for-developers.md)

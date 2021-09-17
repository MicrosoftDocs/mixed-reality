---
title: Spatial audio tutorials - 3. Spatializing audio from a video
description: Import a video asset into your Unity project, and spatialize the audio from the video.
author: vtieto
ms.author: v-hferrone
ms.date: 02/05/2021
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens2, spatial audio, MRTK, mixed reality toolkit, UWP, Windows 10, HRTF, head-related transfer function, reverb, Microsoft Spatializer, video importing, Video Player
ROBOTS: NOINDEX
---

# 3. Spatializing audio from a video

## Overview

In this tutorial, you will learn how to spatialize audio from an video source and test this in the unity editor and HoloLens 2.

## Objectives

* Import a video and add a Video Player
* Play the video onto a quadrangle
* Route audio from the video to the quadrangle, and spatialize the audio

## Import a video and add a Video Player to the Scene

For this tutorial use You can use [this video](https://github.com/microsoft/spatialaudio-unity/blob/develop/Samples/MicrosoftSpatializerSample/Assets/Microsoft%20HoloLens%20-%20Spatial%20Sound-PTPvx7mDon4.mp4?raw=true) from the spatial audio sample project.

To import Video into the unity project. in the Unity menu select **Asset** > **Import New Asset**
![Importing Asset](images/spatial-audio/spatial-audio-03-section1-step1-1.PNG)

In the **Import New Asset...** window, select the **Microsoft HoloLens - Spatial Sound-PTPvx7mDon4** file you downloaded and click the **Open** button to import the asset into the project:

![Selecting Asset](images/spatial-audio/spatial-audio-03-section1-step1-2.PNG)

Adjusting the quality settings on the video clip can ensure smooth playback on HoloLens 2. Select the video file in the **Project** window and in the Inspector window of the video file, **override** the settings for **Windows Store Apps**, and:

* Enable **Transcode**
* Set **Codec** to H264
* Set **Bitrate Mode** to Low
* Set **Spatial Quality** to Medium Spatial Quality

After these adjustments, click on Apply to change the quality setting on the video clip.

![Video property Change](images/spatial-audio/spatial-audio-03-section1-step1-3.PNG)

Right click on the Hierarchy, Select **Video** > **Video Player** to add Video player component.

![Add Video Player](images/spatial-audio/spatial-audio-03-section1-step1-4.PNG)

## Play video onto a quadrangle

The **Video Player** object needs a textured game object to render the video.

Right click the Hierarchy , Select **3D Object** > **Quad** to create a quad and configure its **Transform** component as follows:

* **Position**: X = 0, Y = 0, Z = 2
* **Rotation**: X = 0, Y = 0, Z = 0
* **Scale**: X = 1.28, Y = 0.72, Z = 1

![Add a Quad](images/spatial-audio/spatial-audio-03-section2-step1-1.PNG)

Now you need to texture the **Quad** with the video,
 In the **Project** window, right-click and choose **Create** > **Render Texture** to create a Render Texture component, enter a suitable name to the Render Texture for example, _Spatial Audio Texture_:

![Create Render Texture](images/spatial-audio/spatial-audio-03-section2-step1-2.PNG)

Select the **Render Texture** and in the Inspector window set the **Size** property to match the video's native resolution of 1280x720. Then, to ensure good rendering performance on HoloLens 2, set the **Depth Buffer** property to **At least 16 bits depth**.

![Render Texture properties](images/spatial-audio/spatial-audio-03-section2-step1-3.PNG)

Next, use the created Render Texture **Spatial Audio Texture** as the texture for the **Quad**:

1. Drag the **Spatial Audio Texture** from the **Project** window onto the **Quad** in the Hierarchy to add the Render Texture to the Quad
2. To ensure good performance on HoloLens 2, select Quad in the Hierarchy and in the Inspector window for shader select the **Mixed Reality Toolkit** > **Standard** Shader.

![Quad texture properties](images/spatial-audio/spatial-audio-03-section2-step1-4.PNG)

To set **Video Player** and **Render Texture** to play the video clip, select the **Video Player** in the **Hierarchy** and in the **Inspector** window,

* Set the **Video Clip** property to the downloaded video file 'Microsoft HoloLens - Spatial Sound-PTPvx7mDon4'
* Check the **Loop** checkbox
* Set **Target Texture** to your new render texture **Spatial Audio Texture**

![Video player properties](images/spatial-audio/spatial-audio-03-section2-step1-5.PNG)

## Spatialize the audio from the video

In the Hierarchy window, select **Quad** object, then in the Inspector window, use the **Add Component** button to add **Audio Source** to which you'll route the audio from the video.

In the **Audio Source**:

* Set **Output** to the **Spatial Audio Mixer**
* Check the **Spatialize** box
* Move the **Spatial Blend** slider to 1 (3D)

![Quad audio source inspector](images/spatial-audio/spatial-audio-03-section3-step1-1.PNG)

To set the Video Player to route its audio to the **Audio Source**, select the **Video Player** In the Hierarchy window, and in Video Player object in the Inspector do the following changes.

* Set the **Audio Output Mode** to **Audio Source**
* Set the **Audio Source** property to the **Quad**

![Video player set audio source](images/spatial-audio/spatial-audio-03-section3-step1-2.PNG)

> [!TIP]
> For a reminder on how to build and deploy your Unity project to HoloLens 2, you can refer to the [Building your app to your HoloLens 2](mr-learning-base-02.md#building-your-application-to-your-hololens-2) instructions.

## Congratulations

In this tutorial, you have learned how to spatialize audio from an video source Try out your app on a HoloLens 2 or in the Unity editor. You'll see and hear the video, and the audio from the video is spatialized.

In the next tutorial you will learn how to Enable and disable spatialization at run time

> [!div class="nextstepaction"]
> [Next Tutorial: 4. Enabling and disabling spatialization at run time](unity-spatial-audio-ch4.md)

---
title: Configure a New Unity Project for Windows Mixed Reality 
description: configure Unity project without MRTK
author: yoyoz
ms.author: Yoyoz
ms.date: 04/15/2018
ms.topic: article
keywords: Unity, mixed reality, development, getting started, new project
---


# Configure a New Unity Project for Windows Mixed Reality 

(skip if you have already imported MRTK v2 into your Unity Project)

If you'd like to created a new Unity project without importing Mixed Reality Toolkit, there are a small set of Unity settings you'll need to manually change for Windows Mixed Reality, broken down into two categories: per-project and per-scene.

## Per-project settings

To target Windows Mixed Reality, you first need to set your Unity project to export as a Universal Windows Platform app:
1. Select **File > Build Settings...**
2. Select **Universal Windows Platform** in the Platform list and click **Switch Platform**
3. Set **SDK** to **Universal 10**
4. Set **Target device** to **Any Device** to support immersive headsets or switch to **HoloLens**
5. Set **Build Type** to **D3D**
6. Set **UWP SDK** to **Latest installed**

We then need to let Unity know that the app we are trying to export should create an [immersive view](app-views.md) instead of a 2D view. We do that by enabling "Virtual Reality Supported":
1. From the **Build Settings...** window, open **Player Settings...**
2. Select the **Settings for Universal Windows Platform** tab
3. Expand the **XR Settings** group
4. In the **XR Settings** section, check the **Virtual Reality Supported** checkbox to add the **Virtual Reality Devices** list.
5. In the **XR Settings** group, confirm that **"Windows Mixed Reality"** is listed as a supported device. (this may appear as "Windows Holographic" in older versions of Unity)

![Unity quality settings](images/getting-started-unity-quality-settings.jpg)<br>
*Unity xr settings*

Your app can now do basic holographic rendering and spatial input. To go further and take advantage of certain functionality, your app must declare the appropriate capabilities in its manifest. The manifest declarations can be made in Unity so they are included in every subsequent project export. The setting are found in **Player Settings > Settings for Universal Windows Platform > Publishing Settings > Capabilities**. The applicable capabilities for enabling commonly-used Unity APIs for Mixed Reality are:

|  Capability  |  APIs requiring capability | 
|----------|----------|
|  SpatialPerception  |  SurfaceObserver (access to [spatial mapping](spatial-mapping.md) meshes on HoloLens)&mdash;*No capability needed for general spatial tracking of the headset* | 
|  WebCam  |  PhotoCapture and VideoCapture | 
|  PicturesLibrary / VideosLibrary  |  PhotoCapture or VideoCapture, respectively (when storing the captured content) | 
|  Microphone  |  VideoCapture (when capturing audio), DictationRecognizer, GrammarRecognizer, and KeywordRecognizer | 
|  InternetClient  |  DictationRecognizer (and to use the Unity Profiler) | 

**Unity quality settings**

![Unity quality settings](images/getting-started-unity-quality-settings.jpg)<br>
*Unity quality settings*

HoloLens has a mobile-class GPU. If your app is targeting HoloLens, you'll want the quality settings tuned for fastest performance to ensure we maintain full framerate:
1. Select **Edit > Project Settings > Quality**
2. Select the **dropdown** under the **Windows Store** logo and select **Very Low**. You'll know the setting is applied correctly when the box in the Windows Store column and **Very Low** row is green.

## Per-scene settings

**Unity camera settings**

![Unity camera settings](images/Unitycamerasettings.png)<br>
*Unity camera settings*

Once you enable the "Virtual Reality Supported" checkbox, the [Unity Camera](camera-in-unity.md) component handles [head tracking and stereoscopic rendering](rendering.md). There is no need to replace it with a custom camera to do this.

If your app is targeting HoloLens specifically, there are a few settings that need to be changed to optimize for the device's transparent displays, so your app will show through to the physical world:
1. In the **Hierarchy**, select the **Main Camera**
2. In the **Inspector** panel, set the transform **position** to **0, 0, 0** so the location of the users head starts at the Unity world origin.
3. Change **Clear Flags** to **Solid Color**.
4. Change the **Background** color to **RGBA 0,0,0,0**. Black renders as transparent in HoloLens.
5. Change **Clipping Planes - Near** to the [HoloLens recommended](camera-in-unity.md#clip-planes) 0.85 (meters).

If you delete and create a new camera, make sure your camera is **Tagged** as **MainCamera**.


## See also
* [Mixed Reality Toolkit v2](mrtk-getting-started.md)
* [Unity Development Overview](unity-development-overview.md)

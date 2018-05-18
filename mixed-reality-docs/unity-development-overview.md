---
title: Unity development overview
description: Getting started building mixed reality apps in Unity.
author: thetuvix
ms.author: alexturn
ms.date: 03/21/2018
ms.topic: article
keywords: Unity, mixed reality, development, getting started, new project, porting, capability, camera, simulation, emulation, documentation
---



# Unity development overview

The fastest path to building a [mixed reality app](app-views.md) is with [Unity](http://aka.ms/HoloLensUnity). We recommend you take the time to explore the [Unity tutorials](https://unity3d.com/learn/tutorials). If you need assets, Unity has a comprehensive [Asset Store](https://www.assetstore.unity3d.com/). Once you have built up a basic understanding of Unity, you can visit the [Mixed Reality Academy](academy.md) to learn the specifics of mixed reality development with Unity. Be sure to visit the [Unity Mixed Reality forums](http://forum.unity3d.com/forums/hololens.102/) to engage with the rest of the community building mixed reality apps in Unity and find solutions to problems you might run into.

## Porting an existing Unity app to Windows Mixed Reality

If you have an existing Unity project that you're porting to Windows Mixed Reality, follow along with the [Unity porting guide](porting-guides.md) to get started.

## Configuring a new Unity project for Windows Mixed Reality

To get started building mixed reality apps with Unity, first [install the tools](install-the-tools.md). If you'll be targeting Windows Mixed Reality immersive headsets rather than HoloLens, you'll need a special version of Unity for now.

If you've just created a new Unity project, there are a small set of Unity settings you'll need to change for Windows Mixed Reality, broken down into two categories: per-project and per-scene.

### Per-project settings

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

Your app can now do basic holographic rendering and spatial input. To go further and take advantage of certain functionality, your app must declare the appropriate capabilities in its manifest. The manifest declarations can be made in Unity so they are included in every subsequent project export. The setting are found in **Player Settings > Settings for Universal Windows Platform > Publishing Settings > Capabilities**. The applicable capabilities for enabling commonly-used Unity APIs for Mixed Reality are:

|  Capability  |  APIs requiring capability | 
|----------|----------|
|  SpatialPerception  |  SurfaceObserver (access to [spatial mapping](spatial-mapping.md) meshes on HoloLens)&mdash;*No capability needed for general spatial tracking of the headset* | 
|  WebCam  |  PhotoCapture and VideoCapture | 
|  PicturesLibrary / VideosLibrary  |  PhotoCapture or VideoCapture, respectively (when storing the captured content) | 
|  Microphone  |  VideoCapture (when capturing audio), DictationRecognizer, GrammarRecognizer, and KeywordRecognizer | 
|  InternetClient  |  DictationRecognizer (and to use the Unity Profiler) | 

**Unity quality settings**

![Unity quality settings](images/unityqualitysettings-350px.png)<br>
*Unity quality settings*

HoloLens has a mobile-class GPU. If your app is targeting HoloLens, you'll want the quality settings tuned for fastest performance to ensure we maintain full framerate:
1. Select **Edit > Project Settings > Quality**
2. Select the **dropdown** under the **Windows Store** logo and select **Fastest**. You'll know the setting is applied correctly when the box in the Windows Store column and **Fastest** row is green.

### Per-scene settings

**Unity camera settings**

![Unity camera settings](images/unitycamerasettings.png)<br>
*Unity camera settings*

Once you enable the "Virtual Reality Supported" checkbox, the [Unity Camera](camera-in-unity.md) component handles [head tracking and stereoscopic rendering](rendering.md). There is no need to replace it with a custom camera to do this.

If your app is targeting HoloLens specifically, there are a few settings that need to be changed to optimize for the device's transparent displays, so your app will show through to the physical world:
1. In the **Hierarchy**, select the **Main Camera**
2. In the **Inspector** panel, set the transform **position** to **0, 0, 0** so the location of the users head starts at the Unity world origin.
3. Change **Clear Flags** to **Solid Color**.
4. Change the **Background** color to **RGBA 0,0,0,0**. Black renders as transparent in HoloLens.
5. Change **Clipping Planes - Near** to the [HoloLens recommended](camera-in-unity.md#clip-planes) 0.85 (meters).

If you delete and create a new camera, make sure your camera is **Tagged** as **MainCamera**.

## Adding mixed reality capabilities and inputs

Once you've configured your project as described above, standard Unity game objects (such as the camera) will light up immediately for a **seated-scale experience**, with the camera's position updated automatically as the user moves their head through the world.

Adding support for Windows Mixed Reality features such as [spatial stages](coordinate-systems.md#spatial-coordinate-systems), [gestures, motion controllers](gestures-and-motion-controllers-in-unity.md) or [voice input](voice-input-in-unity.md) is achieved using APIs built directly into Unity.

Your first step should be to review the [experience scales](coordinate-systems.md) that your app can target:
* If you're looking to build an **orientation-only** or **seated-scale experience**, you'll need to set Unity's tracking space type to [Stationary](coordinate-systems-in-unity.md#building-an-orientation-only-or-seated-scale-experience).
* If you're looking to build a **standing-scale** or **room-scale experience**, you'll need to ensure Unity's tracking space type is successfully set to [RoomScale](coordinate-systems-in-unity.md#building-an-orientation-only-or-seated-scale-experience).
* If you're looking to build a **world-scale** experience on HoloLens, letting users roam beyond 5 meters, you'll need to use the [WorldAnchor](coordinate-systems-in-unity.md#building-a-world-scale-experience) component.

All of the core building blocks for mixed reality apps are exposed in a manner consistent with other Unity APIs:
* [Camera](camera-in-unity.md)
* [Coordinate systems](coordinate-systems-in-unity.md)
* [Gaze](gaze-in-unity.md)
* [Gestures and motion controllers](gestures-and-motion-controllers-in-unity.md)
* [Voice input](voice-input-in-unity.md)
* [Persistence](persistence-in-unity.md)
* [Spatial sound](spatial-sound-in-unity.md)
* [Spatial mapping](spatial-mapping-in-unity.md)

There are other key features that many mixed reality apps will want to use, which are also exposed to Unity apps:
* [Shared experiences](shared-experiences-in-unity.md)
* [Locatable camera](locatable-camera-in-unity.md)
* [Focus point](focus-point-in-unity.md)
* [Tracking loss](tracking-loss-in-unity.md)
* [Keyboard](keyboard-input-in-unity.md)

## Running your Unity project on a real or simulated device

Once you've got your holographic Unity project ready to test out, your next step is to [export and build a Unity Visual Studio solution](exporting-and-building-a-unity-visual-studio-solution.md).

With that VS solution in hand, you can then run your app in one of three ways, using either a real or simulated device:
* [Deploy to a real HoloLens or Windows Mixed Reality immersive headset](using-visual-studio.md)
* [Deploy to the HoloLens emulator](using-the-hololens-emulator.md)
* [Deploy to the Windows Mixed Reality immersive headset simulator](using-the-windows-mixed-reality-simulator.md)

## Unity documentation

In addition to this documentation available on the Windows Dev Center, Unity installs documentation for Windows Mixed Reality functionality alongside the Unity Editor. The Unity provided documentation includes two separate sections:
1. **Unity scripting reference**
    * This section of the documentation contains details of the scripting API that Unity provides.
    * Accessible from the Unity Editor through **Help > Scripting Reference**
2. **Unity manual**
    * This manual is designed to help you learn how to use Unity, from basic to advanced techniques.
    * Accessible from the Unity Editor through **Help > Manual**

## See also
* [MR Basics 100: Getting started with Unity](holograms-100.md)
* [Recommended settings for Unity](recommended-settings-for-unity.md)
* [Performance recommendations for Unity](performance-recommendations-for-unity.md)
* [Exporting and building a Unity Visual Studio solution](exporting-and-building-a-unity-visual-studio-solution.md)
* [Using the Windows namespace with Unity apps for HoloLens](using-the-windows-namespace-with-unity-apps-for-hololens.md)
* [Best practices for working with Unity and Visual Studio](best-practices-for-working-with-unity-and-visual-studio.md)
* [Unity Play Mode](unity-play-mode.md)
* [Porting guides](porting-guides.md)

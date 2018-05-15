---
title: Recommended settings for Unity
description: Unity offers some behaviors specific to mixed reality that can be toggled through project settings.
author: thetuvix
ms.author: alexturn
ms.date: 03/21/2018
ms.topic: article
keywords: unity, settings, mixed reality
---



# Recommended settings for Unity

Unity provides a set of default options that are generally the average case for all platforms. However, Unity offers some behaviors specific to mixed reality that can be toggled through project settings.

## Holographic splash screen

HoloLens has a mobile-class CPU and GPU, which means apps may take a bit longer to load. While the app is loading, users will just see black, and so they may wonder what's going on. To reassure them during loading, you can add a holographic splash screen.

To toggle the holographic splash screen, go to **Edit > Project Settings... > Player** page, click on the **Windows Store** tab and find the **Splash Image > Show Unity Splash Screen** setting and the **Windows Holographic > Holographic Splash Image**.
* Toggling the **Show Unity Splash Screen** option will enable or disable the Unity branded splash screen. If you do not have a Unity Pro license, the Unity branded splash screen will always be displayed.
* If a **Holographic Splash Image** is applied, it will always be displayed regardless of whether the Show Unity Splash Screen checkbox is enabled or disabled. Specifying a custom holographic splash image is only available to developers with a Unity Pro license.

|  Show Unity Splash Screen  |  Holographic Splash Image  |  Behavior |
|----------|----------|----------|
|  On  |  None  |  Show default Unity splash screen for 5 seconds or until the app is loaded, whichever is longer. | 
|  On  |  Custom  |  Show Custom splash screen for 5 seconds or until the app is loaded, whichever is longer. | 
|  Off  |  None  |  Show transparent black (nothing) until app is loaded. | 
|  Off  |  Custom  |  Show Custom splash screen for 5 seconds or until the app is loaded, whichever is longer. | 

## Tracking loss

A Mixed reality headset depends on seeing the environment around it to construct [world-locked coordinate systems](coordinate-systems-in-unity.md), which allow holograms to remain in position. When the headset is unable to locate itself in the world, the headset is said to have *lost tracking*. In these cases, functionality dependent on world-locked coordinate systems, such as spatial stages, spatial anchors and spatial mapping, do not work.

If a loss of tracking occurs, Unity's default behavior is to stop rendering holograms, pause the [game loop](http://docs.unity3d.com/Manual/ExecutionOrder.html)), and display a tracking lost notification that comfortably follows the users gaze. Custom notifications can also be provided in the form of a tracking loss image. For apps that depend upon tracking for their whole experience, it's sufficient to let Unity handle this entirely until tracking is regained.

### Customize tracking loss image

Developers can supply a custom image to be shown during tracking loss. To customize the tracking lost image, go to **Edit > Project Settings... > Player** page, click on the **Windows Store** tab and find the **Windows Holographic > Tracking Loss Image**.

### Opt-out of automatic pause

Some apps may not require tracking (e.g. [orientation-only apps](coordinate-systems-in-unity.md) such as 360-degree video viewers) or may need to continue processing uninterrupted while tracking is lost. In these cases, apps can opt out of the default loss of tracking behavior. Developers who choose this are responsible for hiding/disabling any objects which would not render properly in a tracking-loss scenario. In most cases, the only content that is recommended to be render in that case is body-locked content, centered around the main camera.

To opt out of automatic pause behavior, go to **Edit > Project Settings... > Player** page, click on the **Windows Store** tab and find the **Windows Holographic > On Tracking Loss Pause and Show Image** checkbox.

### Tracking loss events

To define custom behavior when tracking is lost, handle the global [tracking loss events](tracking-loss-in-unity.md).

## Capabilities

For an app to take advantage of certain functionality, it must declare the appropriate capabilities in its manifest. The manifest declarations can be made in Unity so they are included in every subsequent project export. The setting are found in **Player Settings > Windows Store > Publishing Settings > Capabilities**. The applicable capabilities for enabling the commonly used APIs for Holographic apps are:
<br>

|  Capability  |  APIs requiring capability |
|----------|----------|
|  SpatialPerception  |  SurfaceObserver | 
|  WebCam  |  PhotoCapture and VideoCapture | 
|  PicturesLibrary / VideosLibrary  |  PhotoCapture or VideoCapture, respectively (when storing the captured content) | 
|  Microphone  |  VideoCapture (when capturing audio), DictationRecognizer, GrammarRecognizer, and KeywordRecognizer | 
|  InternetClient  |  DictationRecognizer (and to use the Unity Profiler) | 

## See also
* [Unity development overview](unity-development-overview.md)
* [Performance recommendations for Unity](performance-recommendations-for-unity.md)
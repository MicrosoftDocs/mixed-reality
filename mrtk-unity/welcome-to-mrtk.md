---
title: MRTK_Documentation
description: MRTK Getting started documentation page
author: CDiaz-MS
ms.author: cadia
ms.date: 01/12/2021
ms.localizationpriority: high
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK,
---

# What is the Mixed Reality Toolkit

![Mixed Reality Toolkit](features/images/Logo_MRTK_Unity_Banner.png)

MRTK-Unity is a Microsoft-driven project that provides a set of components and features, used to accelerate cross-platform MR app development in Unity. Here are some of its functions:

* Provides the **cross-platform input system and building blocks for spatial interactions and UI**.
* Enables **rapid prototyping** via in-editor simulation that allows you to see changes immediately.
* Operates as an **extensible framework** that provides developers the ability to swap out core components.
* **Supports a wide range of platforms**, including
  * OpenXR (Unity 2020.2 or newer)
    * Microsoft HoloLens 2
    * Windows Mixed Reality headsets
  * Windows Mixed Reality
    * Microsoft HoloLens
    * Microsoft HoloLens 2
    * Windows Mixed Reality headsets
  * Oculus (Unity 2019.3 or newer)
    * Oculus Quest
  * OpenVR
    * Windows Mixed Reality headsets
    * HTC Vive
    * Oculus Rift
  * Ultraleap Hand Tracking
  * Mobile devices such as iOS and Android

> [!div class="nextstepaction"]
> [Explore MRTK on GitHub](https://github.com/Microsoft/MixedRealityToolkit-Unity)

> [!div class="nextstepaction"]
> [Download the latest release](https://github.com/microsoft/MixedRealityToolkit-Unity/releases)

## Getting started with MRTK

If you're new to MRTK or Mixed Reality development in Unity, **we recommend you start at the beginning of our** [Unity development journey](https://docs.microsoft.com/windows/mixed-reality/unity-development-overview?tabs=mrtk%2Chl2) in the Microsoft Docs. The Unity development journey is specifically tailored to walk new developers through the installation, core concepts, and usage of MRTK.

| IMPORTANT: The Unity development journey currently uses **MRTK version 2.4.0** and **Unity 2019.4**. |
| --- |

If you're an experienced Mixed Reality or MRTK developer, check the links in the next section for the newest packages and release notes.

## Documentation

| [![Release notes](features/images/MRTK_Icon_ReleaseNotes.png)](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/ReleaseNotes.html)<br/>[Release Notes](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/ReleaseNotes.html)| [![MRTK Overview](features/images/MRTK_Icon_ArchitectureOverview.png)](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/Architecture/Overview.html)<br/>[MRTK Overview](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/Architecture/Overview.html)| [![Feature Guides](features/images/MRTK_Icon_FeatureGuides.png)](https://microsoft.github.io/MixedRealityToolkit-Unity/features/ux-building-blocks/Button.html)<br/>[Feature Guides](https://microsoft.github.io/MixedRealityToolkit-Unity/features/ux-building-blocks/Button.html)| [![API Reference](features/images/MRTK_Icon_APIReference.png)](https://microsoft.github.io/MixedRealityToolkit-Unity/api/Microsoft.MixedReality.Toolkit.html)<br/>[API Reference](https://microsoft.github.io/MixedRealityToolkit-Unity/api/Microsoft.MixedReality.Toolkit.html)|
|:---|:---|:---|:---|

## Build status

| Branch | CI Status | Docs Status |
|---|---|---|
| `mrtk_development` |[![CI Status](https://dev.azure.com/aipmr/MixedRealityToolkit-Unity-CI/_apis/build/status/public/mrtk_CI?branchName=mrtk_development)](https://dev.azure.com/aipmr/MixedRealityToolkit-Unity-CI/_build/latest?definitionId=15)|[![Docs Status](https://dev.azure.com/aipmr/MixedRealityToolkit-Unity-CI/_apis/build/status/public/mrtk_docs?branchName=mrtk_development)](https://dev.azure.com/aipmr/MixedRealityToolkit-Unity-CI/_build/latest?definitionId=7)

## Required software

 | [![Windows SDK 18362+](features/images/MRTK170802_Short_17.png)](https://developer.microsoft.com/windows/downloads/windows-10-sdk) [Windows SDK 18362+](https://developer.microsoft.com/windows/downloads/windows-10-sdk)| [![Unity](features/images/MRTK170802_Short_18.png)](https://unity3d.com/get-unity/download/archive) [Unity 2018.4.x](https://unity3d.com/get-unity/download/archive)| [![Visual Studio 2019](features/images/MRTK170802_Short_19.png)](http://dev.windows.com/downloads) [Visual Studio 2019](http://dev.windows.com/downloads)| [![Emulators (optional)](features/images/MRTK170802_Short_20.png)](https://docs.microsoft.com/windows/mixed-reality/using-the-hololens-emulator) [Emulators (optional)](https://docs.microsoft.com/windows/mixed-reality/using-the-hololens-emulator)|
| :--- | :--- | :--- | :--- |
| To build apps with MRTK v2, you need the Windows 10 May 2019 Update SDK. <br> To run apps for immersive headsets, you need the Windows 10 Fall Creators Update. | The Unity 3D engine provides support for building mixed reality projects in Windows 10 | Visual Studio is used for code editing, deploying and building UWP app packages | The Emulators allow you to test your app without the device in a simulated environment |

## Feature areas

:::row:::
    :::column:::
       [![Input System](features/images/MRTK_Icon_InputSystem.png)](features/input/overview.md)
        **[Input System](features/input/overview.md)**<br>
    :::column-end:::
    :::column:::
        [![Hand Tracking (HoloLens 2)](features/images/MRTK_Icon_HandTracking.png)](features/input/overview.md)
        **[Hand Tracking <br> (HoloLens 2)](features/input/hand-tracking.md)**<br>
    :::column-end:::
    :::column:::
        [![Eye Tracking (HoloLens 2)](features/images/MRTK_Icon_EyeTracking.png)](features/input/eye-tracking/eye-tracking-Main.md)
        **[Eye Tracking <br/> (HoloLens 2)](features/input/eye-tracking/eye-tracking-Main.md)**<br>
    :::column-end:::
    :::column:::
        [![Profiles](features/images/MRTK_Icon_Profiles.png)](configuration/mixed-reality-configuration-guide.md)
        **[Profiles](configuration/mixed-reality-configuration-guide.md)**<br>
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
       [![Hand Tracking (Ultraleap)](features/images/MRTK_Icon_HandTracking.png)](features/cross-platform/leap-motion-mrtk.md)
        **[Hand Tracking <br/> (Ultraleap)](features/cross-platform/leap-motion-mrtk.md)**<br>
    :::column-end:::
    :::column:::
        [![UI Controls 1](features/images/MRTK_Icon_UIControls.png)](#ux-building-blocks)
        **[UI Controls 1](#ux-building-blocks)**<br>
    :::column-end:::
    :::column:::
        [![Solvers](features/images/MRTK_Icon_Solver.png)](features/ux-building-blocks/solvers/solver.md)
        **[Solvers](features/ux-building-blocks/solvers/solver.md)**<br>
    :::column-end:::
    :::column:::
        [![Multi-Scene Manager](features/images/MRTK_Icon_SceneSystem.png)](features/scene-system/scene-system-getting-started.md)
        **[Multi-Scene<br/> Manager](features/scene-system/scene-system-getting-started.md)**<br>
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
       [![Spatial Awareness 1](features/images/MRTK_Icon_SpatialUnderstanding.png)](features/spatial-awareness/spatial-awareness-getting-started.md)
        **[Spatial <br/> Awareness 2](features/spatial-awareness/spatial-awareness-getting-started.md)**<br>
    :::column-end:::
    :::column:::
        [![Diagnostic Tool](features/images/MRTK_Icon_Diagnostics.png)](features/diagnostics/diagnostics-system-getting-started.md)
        **[Diagnostic <br/> Tool](features/diagnostics/diagnostics-system-getting-started.md)**<br>
    :::column-end:::
    :::column:::
        [![MRTK Standard Shader View](features/images/MRTK_Icon_StandardShader.png)](features/rendering/mrtk-standard-shader.md?q=shader)
        **[MRTK Standard Shader Example View](features/rendering/mrtk-standard-shader.md?q=shader)**<br>
    :::column-end:::
    :::column:::
        [![Speech & Dictation](features/images/MRTK_Icon_VoiceCommand.png)](features/scene-system/scene-system-getting-started.md)
        **[Speech](features/input/speech.md)<br/> & [Dictation](features/input/dictation.md)**<br>
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
       [![Boundary System](features/images/MRTK_Icon_Boundary.png)](features/boundary/boundary-system-getting-started.md)
        **[Boundary <br/>System](features/boundary/boundary-system-getting-started.md)**<br>
    :::column-end:::
    :::column:::
        [![In-Editor Simulation](features/images/MRTK_Icon_InputSystem.png)](features/diagnostics/diagnostics-system-getting-started.md)
        **[In-Editor <br/> Simulation](features/diagnostics/diagnostics-system-getting-started.md)**<br>
    :::column-end:::
    :::column:::
        [![Experimental Features](features/images/MRTK_Icon_Experimental.png)](contributing/experimental-features.md)
        **[Experimental <br/> Features](contributing/experimental-features.md)**<br>
    :::column-end:::
    :::column:::
    :::column-end:::
:::row-end:::

## UX building blocks

:::row:::
    :::column:::
       [![Button](features/images/Button/MRTK_Button_Main.png)](features/ux-building-blocks/button.md)
        **[Button](features/ux-building-blocks/button.md)**<br>
        A button control which supports various input methods, including HoloLens 2's articulated hand
    :::column-end:::
    :::column:::
        [![Bounds Control](features/images/bounds-control/MRTK_BoundsControl_Main.png)](features/ux-building-blocks/bounds-control.md)
        **[Bounds Control](features/ux-building-blocks/bounds-control.md)**<br>
        Standard UI for manipulating objects in 3D space
    :::column-end:::
    :::column:::
        [![Object Manipulator](features/images/manipulation-handler/MRTK_Manipulation_Main.png)](features/ux-building-blocks/object-manipulator.md)
        **[Object Manipulator](features/ux-building-blocks/object-manipulator.md)**<br>
        Script for manipulating objects with one or two hands
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
       [![Slate](features/images/slate/MRTK_Slate_Main.png)](features/ux-building-blocks/slate.md)
        **[Slate](features/ux-building-blocks/slate.md)**<br>
        2D style plane which supports scrolling with articulated hand input
    :::column-end:::
    :::column:::
        [![System Keyboard](features/images/system-keyboard/MRTK_SystemKeyboard_Main.png)](features/ux-building-blocks/system-keyboard.md)
        **[System Keyboard](features/ux-building-blocks/system-keyboard.md)**<br>
        Example script of using the system keyboard in Unity
    :::column-end:::
    :::column:::
        [![Interactable](features/images/interactable/InteractableExamples.png)](features/ux-building-blocks/interactable.md)
        **[Interactable](features/ux-building-blocks/interactable.md)**<br>
        A script for making objects interactable with visual states and theme support
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
       [![Solver](features/images/solver/MRTK_Solver_Main.png)](features/ux-building-blocks/solvers/solver.md)
        **[Solver](features/ux-building-blocks/solvers/solver.md)**<br>
        Various object positioning behaviors such as tag-along, body-lock, constant view size and surface magnetism
    :::column-end:::
    :::column:::
        [![Object Collection](features/images/object-collection/MRTK_ObjectCollection_Main.jpg)](features/ux-building-blocks/object-collection.md)
        **[Object Collection](features/ux-building-blocks/object-collection.md)**<br>
        Script for laying out an array of objects in a three-dimensional shape
    :::column-end:::
    :::column:::
        [![Tooltip](features/images/tooltip/MRTK_Tooltip_Main.png)](features/ux-building-blocks/tooltip.md)
        **[Tooltip](features/ux-building-blocks/tooltip.md)**<br>
        Annotation UI with a flexible anchor/pivot system, which can be used for labeling motion controllers and objects
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
       [![Slider](features/images/slider/MRTK_UX_Slider_Main.jpg)](features/ux-building-blocks/sliders.md)
        **[Slider](features/ux-building-blocks/sliders.md)**<br>
        Slider UI for adjusting values supporting direct hand tracking interaction
    :::column-end:::
    :::column:::
        [![MRTK Standard Shader](features/images/mrtk-standard-shader/MRTK_StandardShader.jpg)](features/rendering/mrtk-standard-shader.md)
        **[MRTK Standard Shader](features/rendering/mrtk-standard-shader.md)**<br>
        MRTK's Standard shader supports various Fluent design elements with performance
    :::column-end:::
    :::column:::
        [![Hand Menu](features/images/solver/MRTK_UX_HandMenu.png)](features/ux-building-blocks/hand-menu.md)
        **[Hand Menu](features/ux-building-blocks/hand-menu.md)**<br>
        Hand-locked UI for quick access, using the Hand Constraint Solver
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
       [![App Bar](features/images/app-bar/MRTK_AppBar_Main.png)](features/ux-building-blocks/app-bar.md)
        **[App Bar](features/ux-building-blocks/app-bar.md)**<br>
        UI for Bounds Control's manual activation
    :::column-end:::
    :::column:::
        [![Pointers](features/images/Pointers/MRTK_Pointer_Main.png)](features/input/pointers.md)
        **[Pointers](features/input/pointers.md)**<br>
        Learn about various types of pointers
    :::column-end:::
    :::column:::
        [![Fingertip Visualization](features/images/fingertip/MRTK_FingertipVisualization_Main.png)](features/ux-building-blocks/fingertip-visualization.md)
        **[Fingertip Visualization](features/ux-building-blocks/fingertip-visualization.md)**<br>
        Visual affordance on the fingertip which improves the confidence for the direct interaction
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
       [![Near Menu](features/images/near-menu/MRTK_UX_NearMenu.png)](features/ux-building-blocks/near-menu.md)
        **[Near Menu](features/ux-building-blocks/near-menu.md)**<br>
        Floating menu UI for the near interactions
    :::column-end:::
    :::column:::
        [![Spatial Awareness Getting started](features/images/spatial-awareness/MRTK_SpatialAwareness_Main.png)](features/spatial-awareness/spatial-awareness-getting-started.md)
        **[Spatial Awareness View](features/spatial-awareness/spatial-awareness-getting-started.md)**<br>
        Make your holographic objects interact with the physical environments
    :::column-end:::
    :::column:::
        [![Voice Command](features/images/input/MRTK_Input_Speech.png)](features/input/speech.md)
        **[Voice Command](features/input/speech.md)**<br>
        Scripts and examples for integrating speech input
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
       [![Progress Indicator](features/images/progress-indicator/MRTK_ProgressIndicator_Main.png)](features/ux-building-blocks/progress-indicator.md)
        **[Progress Indicator](features/ux-building-blocks/progress-indicator.md)**<br>
        Visual indicator for communicating data process or operation
    :::column-end:::
    :::column:::
        [![Dialog](features/images/Dialog/MRTK_UX_Dialog_Main.png)](features/experimental/dialog.md)
        **[Dialog [Experimental]](features/experimental/dialog.md)**<br>
        UI for asking for user's confirmation or acknowledgement
    :::column-end:::
    :::column:::
        [![Hand Coach](features/images/hand-coach/MRTK_UX_HandCoach_Main.jpg)](features/experimental/hand-coach.md)
        **[Hand Coach [Experimental]](features/experimental/hand-coach.md)**<br>
        Component that helps guide the user when the gesture has not been taught
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
       [![Hand Physics Service](features/images/hand-physics/MRTK_UX_HandPhysics_Main.jpg)](features/experimental/hand-physics-service.md)
        **[Hand Physics Service [Experimental]](features/experimental/hand-physics-service.md)**<br>
        The hand physics service enables rigid body collision events and interactions with articulated hands
    :::column-end:::
    :::column:::
        [![Scrolling Collection](features/images/scrolling-collection/ScrollingCollection_Main.jpg)](features/ux-building-blocks/scrolling-object-collection.md)
        **[Scrolling Collection](features/ux-building-blocks/scrolling-object-collection.md)**<br>
        An Object Collection that natively scrolls 3D objects
    :::column-end:::
    :::column:::
        [![Dock](features/images/Dock/MRTK_UX_Dock_Main.png)](features/experimental/dock.md)
        **[Dock [Experimental]](features/experimental/dock.md)**<br>
        The Dock allows objects to be moved in and out of predetermined positions
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
       [![Eye Tracking: Target Selection](features/images/eye-tracking/mrtk_et_targetselect.png)](features/input/eye-tracking/eye-tracking-target-selection.md)
        **[Eye Tracking: Target Selection](features/input/eye-tracking/eye-tracking-target-selection.md)**<br>
        Combine eyes, voice and hand input to quickly and effortlessly select holograms across your scene
    :::column-end:::
    :::column:::
        [![Eye Tracking: Navigation](features/images/eye-tracking/mrtk_et_navigation.png)](features/input/eye-tracking/eye-tracking-navigation.md)
        **[Eye Tracking: Navigation](features/input/eye-tracking/eye-tracking-navigation.md)**<br>
        Learn how to auto-scroll text or fluently zoom into focused content based on what you are looking at
    :::column-end:::
    :::column:::
        [![Eye Tracking: Heat Map](features/images/eye-tracking/mrtk_et_heatmaps.png)](features/example-scenes/eye-tracking-examples-overview.md#visualization-of-visual-attention)
        **[Eye Tracking: Heat Map](features/example-scenes/eye-tracking-examples-overview.md#visualization-of-visual-attention)**<br>
        Examples for logging, loading and visualizing what users have been looking at in your app
    :::column-end:::
:::row-end:::

## Tools

|  [![Optimize Window](features/images/MRTK_Icon_OptimizeWindow.png)](features/tools/optimize-window.md) [Optimize Window](features/tools/optimize-window.md) | [![Dependency Window](features/images/MRTK_Icon_DependencyWindow.png)](features/tools/dependency-window.md) [Dependency Window](features/tools/dependency-window.md) | ![Build Window](features/images/MRTK_Icon_BuildWindow.png) Build Window | [![Input recording](features/images/MRTK_Icon_InputRecording.png)](features/input-simulation/input-animation-recording.md) [Input recording](features/input-simulation/input-animation-recording.md) |
|:--- | :--- | :--- | :--- |
| Automate configuration of Mixed Reality projects for performance optimizations | Analyze dependencies between assets and identify unused assets |  Configure and execute an end-to-end build process for Mixed Reality applications | Record and playback head movement and hand tracking data in editor |

## Example scenes

Explore MRTK's various types of interactions and UI controls in [this example scene](features/example-scenes/hand-interaction-examples.md).

You can find  other example scenes under [**Assets/MixedRealityToolkit.Examples/Demos**](/Assets/MixedRealityToolkit.Examples/Demos) folder.

[![Example Scene 2](features/images/MRTK_Examples.png)](features/example-scenes/hand-interaction-examples.md)

## MRTK examples hub

With the MRTK Examples Hub, you can try various example scenes in MRTK.
You can find pre-built app packages for HoloLens(x86), HoloLens 2(ARM), and Windows Mixed Reality immersive headsets(x64) under [**Release Assets**](https://github.com/microsoft/MixedRealityToolkit-Unity/releases/tag/v2.4.0) folder. [Use the Windows Device Portal to install apps on HoloLens](https://docs.microsoft.com/hololens/hololens-install-apps#use-the-windows-device-portal-to-install-apps-on-hololens). On HoloLens 2, you can download and install [MRTK Examples Hub through the Microsoft Store app](https://www.microsoft.com/p/mrtk-examples-hub/9mv8c39l2sj4).

See [Examples Hub README page](features/example-scenes/example-hub.md) to learn about the details on creating a multi-scene hub with MRTK's scene system and scene transition service.

[![Example Scene Hub](features/images/MRTK_ExamplesHub.png)](features/example-scenes/hand-interaction-examples.md)

## Sample apps made with MRTK

| [![Periodic Table of the Elements](features/images/MRDL_PeriodicTable.jpg)](https://medium.com/@dongyoonpark/bringing-the-periodic-table-of-the-elements-app-to-hololens-2-with-mrtk-v2-a6e3d8362158)| [![Galaxy Explorer 1](features/images/MRTK_GalaxyExplorer.jpg)](https://docs.microsoft.com/windows/mixed-reality/galaxy-explorer-update)| [![Galaxy Explorer 2](features/images/MRDL_Surfaces.jpg)](https://docs.microsoft.com/windows/mixed-reality/galaxy-explorer-update)|
|:--- | :--- | :--- |
| [Periodic Table of the Elements](https://github.com/Microsoft/MRDL_Unity_PeriodicTable) is an open-source sample app which demonstrates how to use MRTK's input system and building blocks to create an app experience for HoloLens and Immersive headsets. Read the porting story: [Bringing the Periodic Table of the Elements app to HoloLens 2 with MRTK v2](https://medium.com/@dongyoonpark/bringing-the-periodic-table-of-the-elements-app-to-hololens-2-with-mrtk-v2-a6e3d8362158) |[Galaxy Explorer](https://github.com/Microsoft/GalaxyExplorer) is an open-source sample app that was originally developed in March 2016 as part of the HoloLens 'Share Your Idea' campaign. Galaxy Explorer has been updated with new features for HoloLens 2, using MRTK v2. Read the story: [The Making of Galaxy Explorer for HoloLens 2](https://docs.microsoft.com/windows/mixed-reality/galaxy-explorer-update) |[Surfaces](https://github.com/Microsoft/GalaxyExplorer) is an open-source sample app for HoloLens 2 which explores how we can create a tactile sensation with visual, audio, and fully articulated hand-tracking. Check out Microsoft MR Dev Days session [Learnings from the Surfaces app](https://channel9.msdn.com/Shows/Docs-Mixed-Reality/Learnings-from-the-MR-Surfaces-App) for the detailed design and development story. |

## Session videos from Mixed Reality Dev Days 2020

| [![MRDevDays 1](features/images/MRDevDays_Session1.png)](https://channel9.msdn.com/Shows/Docs-Mixed-Reality/Intro-to-MRTK-Unity)| [![MRDevDays 3](features/images/MRDevDays_Session2.png)](https://channel9.msdn.com/Shows/Docs-Mixed-Reality/MRTKs-UX-Building-Blocks)| [![MRDevDays 2](features/images/MRDevDays_Session3.png)](https://channel9.msdn.com/Shows/Docs-Mixed-Reality/MRTK-Performance-and-Shaders)|
|:--- | :--- | :--- |
| Tutorial on how to create a simple MRTK app from start to finish. Learn about interaction concepts and MRTK’s multi-platform capabilities. | Deep dive on the MRTK’s UX building blocks that help you build beautiful mixed reality experiences. | An introduction to performance tools, both in MRTK and external, as well as an overview of the MRTK Standard Shader. |

See [Mixed Reality Dev Days](https://docs.microsoft.com/windows/mixed-reality/mr-dev-days-sessions) to explore more session videos.

## Engage with the community

* Join the conversation around MRTK on [Slack](https://holodevelopers.slack.com/). You can join the Slack community via the [automatic invitation sender](https://holodevelopersslack.azurewebsites.net/).

* Ask questions about using MRTK on [Stack Overflow](https://stackoverflow.com/questions/tagged/mrtk) using the **MRTK** tag.

* Search for [known issues](https://github.com/Microsoft/MixedRealityToolkit-Unity/issues) or file a [new issue](https://github.com/Microsoft/MixedRealityToolkit-Unity/issues) if you find something broken in MRTK code.

* For questions about contributing to MRTK, go to the [mixed-reality-toolkit](https://holodevelopers.slack.com/messages/C2H4HT858) channel on slack.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information, see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Useful resources on the Mixed Reality Dev Center

| ![Discover](features/images/mrdevcenter/icon-discover.png) [Discover](https://docs.microsoft.com/windows/mixed-reality/)| ![Design](features/images/mrdevcenter/icon-design.png) [Design](https://docs.microsoft.com/windows/mixed-reality/design)| ![Develop](features/images/mrdevcenter/icon-develop.png) [Develop](https://docs.microsoft.com/windows/mixed-reality/development)| ![Distribute)](features/images/mrdevcenter/icon-distribute.png) [Distribute](https://docs.microsoft.com/windows/mixed-reality/implementing-3d-app-launchers)|
| :--------------------- | :----------------- | :------------------ | :------------------------ |
| Learn to build mixed reality experiences for HoloLens and immersive headsets (VR).          | Get design guides. Build user interface. Learn interactions and input.     | Get development guides. Learn the technology. Understand the science.       | Get your app ready for others and consider creating a 3D launcher. |

## Useful resources on Azure

| ![Spatial Anchors](features/images/mrdevcenter/icon-azurespatialanchors.png)<br> [Spatial Anchors](https://docs.microsoft.com/azure/spatial-anchors/)| ![Speech Services](features/images/mrdevcenter/icon-azurespeechservices.png) [Speech Services](https://docs.microsoft.com/azure/cognitive-services/speech-service/)| ![Vision Services](features/images/mrdevcenter/icon-azurevisionservices.png) [Vision Services](https://docs.microsoft.com/azure/cognitive-services/computer-vision/)|
| :------------------------| :--------------------- | :---------------------- |
| Spatial Anchors is a cross-platform service that allows you to create Mixed Reality experiences using objects that persist their location across devices over time.| Discover and integrate Azure powered speech capabilities like speech to text, speaker recognition or speech translation into your application.| Identify and analyze your image or video content using Vision Services like computer vision, face detection, emotion recognition or video indexer. |

## Learn more about the MRTK project

You can find our planning material on [our wiki](https://github.com/Microsoft/MixedRealityToolkit-Unity/wiki) under the Project Management Section. You can always see the items the team is actively working on in the Iteration Plan issue.

## How to contribute

Learn how you can contribute to MRTK at [Contributing](contributing/contributing.md).

**For details on the different branches used in the Mixed Reality Toolkit repositories, check this [Branch Guide here](https://github.com/Microsoft/MixedRealityToolkit-Unity/wiki/Branch-Guide).**

## Getting help

If you run into issues caused by MRTK or otherwise have questions about how to do something, there are a few resources that can help:

* For bug reports, please [file an issue](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/new/choose) on the GitHub repo.
* For questions, please reach out on either [StackOverflow](https://stackoverflow.com/questions/tagged/mrtk) or the [mixed-reality-toolkit channel](https://holodevelopers.slack.com/messages/C2H4HT858) on Slack. You can join the Slack community via the [automatic invitation sender](https://holodevelopersslack.azurewebsites.net/).

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

![Mixed Reality Toolkit](../images/Logo_MRTK_Unity_Banner.png)

MRTK-Unity is a Microsoft-driven project that provides a set of components and features, used to accelerate cross-platform MR app development in Unity. Here are some of its functions:

* Provides the **cross-platform input system and building blocks for spatial interactions and UI**.
* Enables **rapid prototyping** via in-editor simulation that allows you to see changes immediately.
* Operates as an **extensible framework** that provides developers the ability to swap out core components.
* **Supports a wide range of platforms**, including
  * Microsoft HoloLens
  * Microsoft HoloLens 2
  * Windows Mixed Reality headsets
  * OpenVR headsets (HTC Vive / Oculus Rift)
  * Ultraleap Hand Tracking
  * Mobile devices such as iOS and Android

## Getting started with MRTK

If you're new to MRTK or Mixed Reality development in Unity, **we recommend you start at the beginning of our** [Unity development journey](https://docs.microsoft.com/windows/mixed-reality/unity-development-overview?tabs=mrtk%2Chl2) in the Microsoft Docs. The Unity development journey is specifically tailored to walk new developers through the installation, core concepts, and usage of MRTK.

| IMPORTANT: The Unity development journey currently uses **MRTK version 2.4.0** and **Unity 2019.4**. |
| --- |

If you're an experienced Mixed Reality or MRTK developer, check the links in the next section for the newest packages and release notes.

## Documentation

| [![Release notes](../images/MRTK_Icon_ReleaseNotes.png)](https://microsoft.github.io/MixedRealityToolkit-Unity/../ReleaseNotes.html)<br/>[Release Notes](https://microsoft.github.io/MixedRealityToolkit-Unity/../ReleaseNotes.html)| [![MRTK Overview](../images/MRTK_Icon_ArchitectureOverview.png)](https://microsoft.github.io/MixedRealityToolkit-Unity/../Architecture/Overview.html)<br/>[MRTK Overview](https://microsoft.github.io/MixedRealityToolkit-Unity/../Architecture/Overview.html)| [![Feature Guides](../images/MRTK_Icon_FeatureGuides.png)](https://microsoft.github.io/MixedRealityToolkit-Unity/../Button.html)<br/>[Feature Guides](https://microsoft.github.io/MixedRealityToolkit-Unity/../Button.html)| [![API Reference](../images/MRTK_Icon_APIReference.png)](https://microsoft.github.io/MixedRealityToolkit-Unity/api/Microsoft.MixedReality.Toolkit.html)<br/>[API Reference](https://microsoft.github.io/MixedRealityToolkit-Unity/api/Microsoft.MixedReality.Toolkit.html)|
|:---|:---|:---|:---|

## Build status

| Branch | CI Status | Docs Status |
|---|---|---|
| `mrtk_development` |[![CI Status](https://dev.azure.com/aipmr/MixedRealityToolkit-Unity-CI/_apis/build/status/public/mrtk_CI?branchName=mrtk_development)](https://dev.azure.com/aipmr/MixedRealityToolkit-Unity-CI/_build/latest?definitionId=15)|[![Docs Status](https://dev.azure.com/aipmr/MixedRealityToolkit-Unity-CI/_apis/build/status/public/mrtk_docs?branchName=mrtk_development)](https://dev.azure.com/aipmr/MixedRealityToolkit-Unity-CI/_build/latest?definitionId=7)

## Required software

 | [![Windows SDK 18362+](../images/MRTK170802_Short_17.png)](https://developer.microsoft.com/windows/downloads/windows-10-sdk) [Windows SDK 18362+](https://developer.microsoft.com/windows/downloads/windows-10-sdk)| [![Unity](../images/MRTK170802_Short_18.png)](https://unity3d.com/get-unity/download/archive) [Unity 2018.4.x](https://unity3d.com/get-unity/download/archive)| [![Visual Studio 2019](../images/MRTK170802_Short_19.png)](http://dev.windows.com/downloads) [Visual Studio 2019](http://dev.windows.com/downloads)| [![Emulators (optional)](../images/MRTK170802_Short_20.png)](https://docs.microsoft.com/windows/mixed-reality/using-the-hololens-emulator) [Emulators (optional)](https://docs.microsoft.com/windows/mixed-reality/using-the-hololens-emulator)|
| :--- | :--- | :--- | :--- |
| To build apps with MRTK v2, you need the Windows 10 May 2019 Update SDK. <br> To run apps for immersive headsets, you need the Windows 10 Fall Creators Update. | The Unity 3D engine provides support for building mixed reality projects in Windows 10 | Visual Studio is used for code editing, deploying and building UWP app packages | The Emulators allow you to test your app without the device in a simulated environment |

## Feature areas

| ![Input System](../images/MRTK_Icon_InputSystem.png) [Input System](../input/Overview.md)<br/>&nbsp;  | ![Hand Tracking<br/> (HoloLens 2)](../images/MRTK_Icon_HandTracking.png) [Hand Tracking<br/> (HoloLens 2)](../input/HandTracking.md) | ![Eye Tracking<br/> (HoloLens 2)](../images/MRTK_Icon_EyeTracking.png) [Eye Tracking<br/> (HoloLens 2)](../eye-tracking/EyeTracking_Main.md) | ![Profiles](../images/MRTK_Icon_Profiles.png) [Profiles](../../configuration/MixedRealityConfigurationGuide.md)<br/>&nbsp; | ![Hand Tracking<br/> (Ultraleap)](../images/MRTK_Icon_HandTracking.png) [Hand Tracking (Ultraleap)](../cross-platform/LeapMotionMRTK.md)|
| :--- | :--- | :--- | :--- | :--- |
| ![UI Icon Controls](../images/MRTK_Icon_UIControls.png) [UI Controls BuildingBlock](README.md#ux-building-blocks)<br/>&nbsp; | ![Solvers](../images/MRTK_Icon_Solver.png) [Solvers](../ux-building-blocks/solvers/Solver.md)<br/>&nbsp; | ![Multi-Scene<br/> Manager](../images/MRTK_Icon_SceneSystem.png) [Multi-Scene<br/> Manager](../scene-system/SceneSystemGettingStarted.md) | ![Spatial<br/> Awareness understatnding](../images/MRTK_Icon_SpatialUnderstanding.png) [Spatial<br/> Awareness getting started](../spatial-awareness/SpatialAwarenessGettingStarted.md) | ![Diagnostic<br/> Tool](../images/MRTK_Icon_Diagnostics.png) [Diagnostic<br/> Tool getting started](../diagnostics/DiagnosticsSystemGettingStarted.md) |
| ![MRTK Standard Shader Icon](../images/MRTK_Icon_StandardShader.png) [MRTK Standard Shader View](../rendering/MRTKStandardShader.md?q=shader) | ![Speech & Dictation](../images/MRTK_Icon_VoiceCommand.png) [Speech](../input/Speech.md)<br/> & [Dictation](../input/Dictation.md) | ![Boundary<br/>System](../images/MRTK_Icon_Boundary.png) [Boundary<br/>System](../boundary/BoundarySystemGettingStarted.md)| ![In-Editor<br/>Simulation](../images/MRTK_Icon_InputSystem.png) [In-Editor<br/>Simulation](../input-simulation/inputSimulationService.md) | ![Experimental<br/>Features](../images/MRTK_Icon_Experimental.png) [Experimental<br/>Features](../../contributing/ExperimentalFeatures.md)|

## UX building blocks

|  [![Button](../images/Button/MRTK_Button_Main.png)](../ux-building-blocks/Button.md) [Button](../ux-building-blocks/Button.md) | [![Bounds Control](../images/bounds-control/MRTK_BoundsControl_Main.png)](../ux-building-blocks/BoundsControl.md) [Bounds Control](../ux-building-blocks/BoundsControl.md) | [![Object Manipulator](../images/manipulation-handler/MRTK_Manipulation_Main.png)](../ux-building-blocks/ObjectManipulator.md) [Object Manipulator](../ux-building-blocks/ObjectManipulator.md) |
|:--- | :--- | :--- |
| A button control which supports various input methods, including HoloLens 2's articulated hand | Standard UI for manipulating objects in 3D space | Script for manipulating objects with one or two hands |
|  [![Slate](../images/slate/MRTK_Slate_Main.png)](../ux-building-blocks/Slate.md) [Slate](../ux-building-blocks/Slate.md) | [![System Keyboard](../images/system-keyboard/MRTK_SystemKeyboard_Main.png)](../ux-building-blocks/SystemKeyboard.md) [System Keyboard](../ux-building-blocks/SystemKeyboard.md) | [![Interactable](../images/interactable/InteractableExamples.png)](../ux-building-blocks/Interactable.md) [Interactable](../ux-building-blocks/Interactable.md) |
| 2D style plane which supports scrolling with articulated hand input | Example script of using the system keyboard in Unity  | A script for making objects interactable with visual states and theme support |
|  [![Solver](../images/solver/MRTK_Solver_Main.png)](../ux-building-blocks/solvers/Solver.md) [Solver](../ux-building-blocks//solvers/Solver.md) | [![Object Collection](../images/object-collection/MRTK_ObjectCollection_Main.jpg)](../ux-building-blocks/ObjectCollection.md) [Object Collection](../ux-building-blocks/ObjectCollection.md) | [![Tooltip](../images/tooltip/MRTK_Tooltip_Main.png)](../ux-building-blocks/Tooltip.md) [Tooltip](../ux-building-blocks/Tooltip.md) |
| Various object positioning behaviors such as tag-along, body-lock, constant view size and surface magnetism | Script for laying out an array of objects in a three-dimensional shape | Annotation UI with a flexible anchor/pivot system, which can be used for labeling motion controllers and objects |
|  [![Slider](../images/slider/MRTK_UX_Slider_Main.jpg)](../ux-building-blocks/Sliders.md) [Slider](../ux-building-blocks/Sliders.md) | [![MRTK Standard Shader 1](../images/mrtk-standard-shader/MRTK_StandardShader.jpg)](../rendering/MRTKStandardShader.md) [MRTK Standard Shader 2](../rendering/MRTKStandardShader.md) | [![Hand Menu](../images/solver/MRTK_UX_HandMenu.png)](../ux-building-blocks/HandMenu.md) [Hand Menu](../ux-building-blocks/HandMenu.md) |
| Slider UI for adjusting values supporting direct hand tracking interaction | MRTK's Standard shader supports various Fluent design elements with performance | Hand-locked UI for quick access, using the Hand Constraint Solver |
|  [![App Bar](../images/app-bar/MRTK_AppBar_Main.png)](../ux-building-blocks/AppBar.md) [App Bar](../ux-building-blocks/AppBar.md) | [![Pointers](../images/pointers/MRTK_Pointer_Main.png)](../input/Pointers.md) [Pointers](../input/Pointers.md) | [![Fingertip Visualization](../images/fingertip/MRTK_FingertipVisualization_Main.png)](../ux-building-blocks/FingertipVisualization.md) [Fingertip Visualization](../ux-building-blocks/FingertipVisualization.md) |
| UI for Bounds Control's manual activation | Learn about various types of pointers | Visual affordance on the fingertip which improves the confidence for the direct interaction |
|  [![Near Menu](../images/near-menu/MRTK_UX_NearMenu.png)](../ux-building-blocks/NearMenu.md) [Near Menu](../ux-building-blocks/NearMenu.md) | [![Spatial Awareness 1](../images/spatial-awareness/MRTK_SpatialAwareness_Main.png)](../spatial-awareness/SpatialAwarenessGettingStarted.md) [Spatial Awareness 2](../spatial-awareness/SpatialAwarenessGettingStarted.md) | [![Voice Command](../images/input/MRTK_Input_Speech.png)](../input/Speech.md) [Voice Command](../input/Speech.md) / [Dictation](../input/Dictation.md) |
| Floating menu UI for the near interactions | Make your holographic objects interact with the physical environments | Scripts and examples for integrating speech input |
|  [![Progress Indicator](../images/progress-indicator/MRTK_ProgressIndicator_Main.png)](../ux-building-blocks/ProgressIndicator.md) [Progress Indicator](../ux-building-blocks/ProgressIndicator.md) | [![Dialog](../images/dialog/MRTK_UX_Dialog_Main.png)](dialog/Dialog.md) [Dialog [Experimental]](dialog/Dialog.md) | [![Hand Coach](../images/hand-coach/MRTK_UX_HandCoach_Main.jpg)](hand-coach/HandCoach.md) [Hand Coach [Experimental]](hand-coach/HandCoach.md) |
| Visual indicator for communicating data process or operation | UI for asking for user's confirmation or acknowledgement  | Component that helps guide the user when the gesture has not been taught |
|  [![Hand Physics Service](../images/hand-physics/MRTK_UX_HandPhysics_Main.jpg)](hand-physics-service/README.md) [Hand Physics Service [Experimental]](hand-physics-service/README.md) | [![Scrolling Collection](../images/scrolling-collection/ScrollingCollection_Main.jpg)](../ux-building-blocks/ScrollingObjectCollection.md) [Scrolling Collection](../ux-building-blocks/ScrollingObjectCollection.md) | [![Dock](../images/dock/MRTK_UX_Dock_Main.png)](dock/Dock.md) [Dock [Experimental]](dock/Dock.md) |
| The hand physics service enables rigid body collision events and interactions with articulated hands | An Object Collection that natively scrolls 3D objects | The Dock allows objects to be moved in and out of predetermined positions |
|  [![Eye Tracking: Target Selection](../images/eye-tracking/mrtk_et_targetselect.png)](../eye-tracking/EyeTracking_TargetSelection.md) [Eye Tracking: Target Selection](../eye-tracking/EyeTracking_TargetSelection.md) | [![Eye Tracking: Navigation](../images/eye-tracking/mrtk_et_navigation.png)](../eye-tracking/EyeTracking_Navigation.md) [Eye Tracking: Navigation](../eye-tracking/EyeTracking_Navigation.md) | [![Eye Tracking: Heat Map](../images/eye-tracking/mrtk_et_heatmaps.png)](../eye-tracking/EyeTracking_ExamplesOverview.md#visualization-of-visual-attention) [Eye Tracking: Heat Map](../eye-tracking/EyeTracking_ExamplesOverview.md#visualization-of-visual-attention) |
| Combine eyes, voice and hand input to quickly and effortlessly select holograms across your scene | Learn how to auto-scroll text or fluently zoom into focused content based on what you are looking at | Examples for logging, loading and visualizing what users have been looking at in your app |

## Tools

|  [![Optimize Window](../images/MRTK_Icon_OptimizeWindow.png)](../tools/OptimizeWindow.md) [Optimize Window](../tools/OptimizeWindow.md) | [![Dependency Window](../images/MRTK_Icon_DependencyWindow.png)](../tools/DependencyWindow.md) [Dependency Window](../tools/DependencyWindow.md) | ![Build Window](../images/MRTK_Icon_BuildWindow.png) Build Window | [![Input recording](../images/MRTK_Icon_InputRecording.png)](../input-simulation/inputAnimationRecording.md) [Input recording](../input-simulation/inputAnimationRecording.md) |
|:--- | :--- | :--- | :--- |
| Automate configuration of Mixed Reality projects for performance optimizations | Analyze dependencies between assets and identify unused assets |  Configure and execute an end-to-end build process for Mixed Reality applications | Record and playback head movement and hand tracking data in editor |

## Example scenes

Explore MRTK's various types of interactions and UI controls in [this example scene](../example-scenes/HandInteractionExamples.md).

You can find  other example scenes under [**Assets/MixedRealityToolkit.Examples/Demos**](/Assets/MixedRealityToolkit.Examples/Demos) folder.

[![Example Scene 1](../images/MRTK_Examples.png)](../example-scenes/HandInteractionExamples.md)

## MRTK examples hub

With the MRTK Examples Hub, you can try various example scenes in MRTK.
You can find pre-built app packages for HoloLens(x86), HoloLens 2(ARM), and Windows Mixed Reality immersive headsets(x64) under [**Release Assets**](https://github.com/microsoft/MixedRealityToolkit-Unity/releases/tag/v2.4.0) folder. [Use the Windows Device Portal to install apps on HoloLens](https://docs.microsoft.com/hololens/hololens-install-apps#use-the-windows-device-portal-to-install-apps-on-hololens). On HoloLens 2, you can download and install [MRTK Examples Hub through the Microsoft Store app](https://www.microsoft.com/p/mrtk-examples-hub/9mv8c39l2sj4).

See [Examples Hub README page](../example-scenes/ExampleHub.md) to learn about the details on creating a multi-scene hub with MRTK's scene system and scene transition service.

[![Example Scene 2](../images/MRTK_ExamplesHub.png)](../example-scenes/HandInteractionExamples.md)

## Sample apps made with MRTK

| [![Periodic Table of the Elements 1](../images/MRDL_PeriodicTable.jpg)](https://medium.com/@dongyoonpark/bringing-the-periodic-table-of-the-elements-app-to-hololens-2-with-mrtk-v2-a6e3d8362158)| [![Galaxy Explorer 1](../images/MRTK_GalaxyExplorer.jpg)](https://docs.microsoft.com/windows/mixed-reality/galaxy-explorer-update)| [![Galaxy Explorer 2](../images/MRDL_Surfaces.jpg)](https://docs.microsoft.com/windows/mixed-reality/galaxy-explorer-update)|
|:--- | :--- | :--- |
| [Periodic Table of the Elements 2](https://github.com/Microsoft/MRDL_Unity_PeriodicTable) is an open-source sample app which demonstrates how to use MRTK's input system and building blocks to create an app experience for HoloLens and Immersive headsets. Read the porting story: [Bringing the Periodic Table of the Elements app to HoloLens 2 with MRTK v2](https://medium.com/@dongyoonpark/bringing-the-periodic-table-of-the-elements-app-to-hololens-2-with-mrtk-v2-a6e3d8362158) |[Galaxy Explorer](https://github.com/Microsoft/GalaxyExplorer) is an open-source sample app that was originally developed in March 2016 as part of the HoloLens 'Share Your Idea' campaign. Galaxy Explorer has been updated with new features for HoloLens 2, using MRTK v2. Read the story: [The Making of Galaxy Explorer for HoloLens 2](https://docs.microsoft.com/windows/mixed-reality/galaxy-explorer-update) |[Surfaces](https://github.com/Microsoft/GalaxyExplorer) is an open-source sample app for HoloLens 2 which explores how we can create a tactile sensation with visual, audio, and fully articulated hand-tracking. Check out Microsoft MR Dev Days session [Learnings from the Surfaces app](https://channel9.msdn.com/Shows/Docs-Mixed-Reality/Learnings-from-the-MR-Surfaces-App) for the detailed design and development story. |

## Session videos from Mixed Reality Dev Days 2020

| [![MRDevDays 1](../images/MRDevDays_Session1.png)](https://channel9.msdn.com/Shows/Docs-Mixed-Reality/Intro-to-MRTK-Unity)| [![MRDevDays 2](../images/MRDevDays_Session2.png)](https://channel9.msdn.com/Shows/Docs-Mixed-Reality/MRTKs-UX-Building-Blocks)| [![MRDevDays 3](../images/MRDevDays_Session3.png)](https://channel9.msdn.com/Shows/Docs-Mixed-Reality/MRTK-Performance-and-Shaders)|
|:--- | :--- | :--- |
|Tutorial on how to create a simple MRTK app from start to finish. Learn about interaction concepts and MRTK’s multi-platform capabilities. | Deep dive on the MRTK’s UX building blocks that help you build beautiful mixed reality experiences. | An introduction to performance tools, both in MRTK and external, as well as an overview of the MRTK Standard Shader. |

See [Mixed Reality Dev Days](https://docs.microsoft.com/windows/mixed-reality/mr-dev-days-sessions) to explore more session videos.

## Engage with the community

* Join the conversation around MRTK on [Slack](https://holodevelopers.slack.com/). You can join the Slack community via the [automatic invitation sender](https://holodevelopersslack.azurewebsites.net/).

* Ask questions about using MRTK on [Stack Overflow](https://stackoverflow.com/questions/tagged/mrtk) using the **MRTK** tag.

* Search for [known issues](https://github.com/Microsoft/MixedRealityToolkit-Unity/issues) or file a [new issue](https://github.com/Microsoft/MixedRealityToolkit-Unity/issues) if you find something broken in MRTK code.

* For questions about contributing to MRTK, go to the [mixed-reality-toolkit](https://holodevelopers.slack.com/messages/C2H4HT858) channel on slack.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information, see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Useful resources on the Mixed Reality Dev Center

| ![Discover](../images/mrdevcenter/icon-discover.png) [Discover](https://docs.microsoft.com/windows/mixed-reality/)| ![Design](../images/mrdevcenter/icon-design.png) [Design](https://docs.microsoft.com/windows/mixed-reality/design)| ![Develop](../images/mrdevcenter/icon-develop.png) [Develop](https://docs.microsoft.com/windows/mixed-reality/development)| ![Distribute)](../images/mrdevcenter/icon-distribute.png) [Distribute](https://docs.microsoft.com/windows/mixed-reality/implementing-3d-app-launchers)|
| :--------------------- | :----------------- | :------------------ | :------------------------ |
| Learn to build mixed reality experiences for HoloLens and immersive headsets (VR).          | Get design guides. Build user interface. Learn interactions and input.     | Get development guides. Learn the technology. Understand the science.       | Get your app ready for others and consider creating a 3D launcher. |

## Useful resources on Azure

| ![Spatial Anchors](../images/mrdevcenter/icon-azurespatialanchors.png)<br> [Spatial Anchors](https://docs.microsoft.com/azure/spatial-anchors/)| ![Speech Services](../images/mrdevcenter/icon-azurespeechservices.png) [Speech Services](https://docs.microsoft.com/azure/cognitive-services/speech-service/)| ![Vision Services](../images/mrdevcenter/icon-azurevisionservices.png) [Vision Services](https://docs.microsoft.com/azure/cognitive-services/computer-vision/)|
| :------------------------| :--------------------- | :---------------------- |
| Spatial Anchors is a cross-platform service that allows you to create Mixed Reality experiences using objects that persist their location across devices over time.| Discover and integrate Azure powered speech capabilities like speech to text, speaker recognition or speech translation into your application.| Identify and analyze your image or video content using Vision Services like computer vision, face detection, emotion recognition or video indexer. |

## Learn more about the MRTK project

You can find our planning material on [our wiki](https://github.com/Microsoft/MixedRealityToolkit-Unity/wiki) under the Project Management Section. You can always see the items the team is actively working on in the Iteration Plan issue.

## How to contribute

Learn how you can contribute to MRTK at [Contributing](../../contributing/CONTRIBUTING.md).

**For details on the different branches used in the Mixed Reality Toolkit repositories, check this [Branch Guide here](https://github.com/Microsoft/MixedRealityToolkit-Unity/wiki/Branch-Guide).**

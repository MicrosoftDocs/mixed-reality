---
title: Getting started with MRTK version 2
description: For new developers who are interested in leveraging MRTK
author: Yoyoz
ms.author: Yoyoz
ms.date: 05/15/19
ms.topic: article
keywords: Windows Mixed Reality, test, Mixed Reality Toolkit, MRTK version 2, MRTK, tools, SDK, HoloLens, HoloLens 2
---

# Getting started with MRTK v2

## MRTK Getting Started Guide
See the [MRTK getting started guide](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/GettingStartedWithTheMRTK.html) for information on getting started with MRTK V2.

## What is Mixed Reality Toolkit (MRTK)?
The MRTK is an amazing open source toolkit that has been around since the HoloLens was first released, and would not be where it is today without the hard work of our developer community who have contributed to it. Over the past 3 years, we have listened to the feedback of our developer community, and built MRTK v2 to take the biggest concerns into account.  

The MRTK v2 with Unity is an open source cross-platform development kit for mixed reality applications.  MRTK version 2 is intended to accelerate development of applications targeting Microsoft HoloLens, Windows Mixed Reality immersive (VR) headsets and OpenVR platform. The project is aimed at reducing barriers to entry to create mixed reality applications and contribute back to the community as we all grow. 


See the [MRTK documentation portal](https://microsoft.github.io/MixedRealityToolkit-Unity/README.html) to learn more.

## Feature areas

:::row:::
    :::column:::
    <img src="images/MRTK_Icon_InputSystem.png" alt="Input system" title="Input System" width="105"> 
    Input System 
    :::column-end:::
    :::column:::
    <img src="images/MRTK_Icon_HandTracking.png" alt="Hand Tracking (HoloLens 2)" title="Hand Tracking (HoloLens 2)" width="105"> 
    Hand Tracking (HoloLens 2)
    :::column-end:::
    :::column:::
    <img src="images/MRTK_Icon_EyeTracking.png" alt="Eye Tracking (HoloLens 2)" title="Eye Tracking (HoloLens 2)" width="105">
    Eye Tracking (HoloLens 2)
    :::column-end:::
        :::column:::
    <img src="images/MRTK_Icon_VoiceCommand.png" alt="Voice Commanding" title="Voice Commanding" width="105"> 
    Voice Commanding
    :::column-end:::
        :::column:::
    <img src="images/MRTK_Icon_GazeSelect.png" alt="Gaze + Select (HoloLens (1st gen))" title="Gaze + Select (HoloLens (1st gen))" width="105">
    Gaze + Select (HoloLens (1st gen))
    :::column-end:::
        :::column:::
    <img src="images/MRTK_Icon_Teleportation.png" alt="Teleportation" title="Teleportation" width="105"> 
    Teleportation
    :::column-end:::
:::row-end:::


:::row:::
    :::column:::
    <img src="images/MRTK_Icon_UIControls.png" alt="UI Controls" title="UI Controls" width="105"> 
    UI Controls
    :::column-end:::
    :::column:::
    <img src="images/MRTK_Icon_Solver.png" alt="Solver and Interactions" title="Solver and Interactions" width="105"> 
    Solver and Interactions
    :::column-end:::
    :::column:::
    <img src="images/MRTK_Icon_ControllerVisualization.png" alt="Controller Visualization" title="Controller Visualization" width="105"> 
    Controller Visualization
    :::column-end:::
        :::column:::
    <img src="images/MRTK_Icon_SpatialUnderstanding.png" alt="Spatial Understanding" title="Spatial Understanding" width="105"> 
    Spatial Understanding
    :::column-end:::
        :::column:::
    <img src="images/MRTK_Icon_Diagnostics.png" alt="Diagnostic Tool" title="Diagnostic Tool" width="105"> 
    Diagnostic Tool
    :::column-end:::
        :::column:::
    <img src="images/MRTK_Icon_StandardShader.png" alt="MRTK Standard Shader" title="MRTK Standard Shader" width="105"> 
    MRTK Standard Shader
    :::column-end:::
:::row-end:::

## UI and Interaction Building blocks

:::row:::
    :::column:::
    <a href="https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_Button.html"><img src="images/MRTK_Button_Main.png" alt="Button" title="Button" width="250"><br>
    **Button**<br>
    A button control which supports various input methods including HoloLens 2's articulated hand
    <a/>
    :::column-end:::
    :::column:::
<a href="https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_BoundingBox.html"><img src="images/MRTK_BoundingBox_Main.png" alt="Bounding Box" title="Bounding Box" width="250"><br>
    **Bounding Box**<br>
    Standard UI for manipulating objects in 3D space
    <a/>
    :::column-end:::
    :::column:::
<a href="https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_ManipulationHandler.html"><img src="images/MRTK_Manipulation_Main.png" alt="Manipulation Handler" title="Manipulation Handler" width="250"><br>
    **Manipulation Handler**<br>
    Script for manipulating objects with one or two hands
    <a/>
    :::column-end:::
:::row-end:::    
    
:::row:::
    :::column:::
    <a href="https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_Slate.html"><img src="images/MRTK_Slate_Main.png" alt="Slate" title="Slate" width="250"><br>
    **Slate** <br>
    2D style plane which supports scrolling with articulated hand input
    <a/>
    :::column-end:::
    :::column:::
    <a href="https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_SystemKeyboard.html"><img src="images/MRTK_SystemKeyboard_Main.png" alt="System Keyboard" title="System Keyboard" width="250"><br>
    **System Keyboard**<br>
    Example script of using the system keyboard in Unity
    <a/>
    :::column-end:::
    :::column:::
    <a href="https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_Interactable.html"><img src="images/InteractableExamples.png" alt="Interactable" title="Interactable" width="250"><br>
     **Interactable** <br>
     A script for making objects interactable with visual states and theme support
    <a/>
    :::column-end:::
:::row-end:::       

:::row:::
    :::column:::
    <a href="https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_Solver.html"><img src="images/MRTK_Solver_Main.png" alt="Solver" title="Solver" width="250"><br>
    **Solver** <br>
    Various object positioning behaviors such as tag-along, body-lock, constant view size and surface magnetism
    <a/>
    :::column-end:::
    :::column:::
    <a href="https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_ObjectCollection.html"><img src="images/MRTK_ObjectCollection_Main.png" alt="Object Collection" title="Object Collection" width="250"><br>
    **Object Collection**<br>
    Script for lay out an array of objects in a three-dimensional shape 
    <a/>
    :::column-end:::
    :::column:::
    <a href="https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_Tooltip.html"><img src="images/MRTK_Tooltip_Main.png" alt="Tooltip" title="Tooltip" width="250">  <br>
    **Tooltip**<br>
    Annotation UI with flexible anchor/pivot system which can be used for labeling motion controllers and object
    <a/>
    :::column-end:::
:::row-end:::   
        
:::row:::
    :::column:::
    <a href="https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_AppBar.html"><img src="images/MRTK_AppBar_Main.png" alt="App Bar" title="App Bar" width="250"><br>
    **App Bar**<br>
    UI for Bounding Box's manual activation
    <a/>
    :::column-end:::
    :::column:::
    <a href="https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_Pointers.html"><img src="images/MRTK_Pointer_Main.png" alt="Pointers" title="Pointers" width="250"><br>
    **Pointers**<br>
    Learn about various types of pointers
    <a/>
    :::column-end:::
    :::column:::
    <a href="https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_FingertipVisualization.html"><img src="images/MRTK_FingertipVisualization_Main.png" alt="Fingertip Visualization" title="Fingertip Visualization" width="250"><br>
     **Fingertip Visualization**<br>
     Visual affordance on the fingertip which improves the confidence for the direct interaction
    <a/>
    :::column-end:::
:::row-end:::   

:::row:::
    :::column:::
    <a href="https://github.com/microsoft/MixedRealityToolkit-Unity/blob/mrtk_development/Documentation/README_Sliders.md"><img src="images/MRTK_UX_Slider_Main.jpg" alt="Slider" title="Slider" width="250"><br>
    **Slider**<br>
    Slider UI for adjusting values supporting direct hand tracking interaction
    <a/>
    :::column-end:::
    :::column:::
    <a href="https://github.com/microsoft/MixedRealityToolkit-Unity/blob/mrtk_development/Documentation/README_MRTKStandardShader.md"><img src="images/MRTK_StandardShader.jpg" alt="MRTK Standard Shader" title="MRTK Standard Shader" width="250"><br>
    **MRTK Standard Shader**<br>
    MRTK's Standard shader supports various Fluent design elements with performance
    <a/>
    :::column-end:::
    :::column:::
    <a href="https://github.com/microsoft/MixedRealityToolkit-Unity/blob/mrtk_development/Documentation/README_HandJointChaser.md"><img src="images/MRTK_HandJointChaser_Main.jpg" alt="Hand Joint Chaser" title="Hand Joint Chaser" width="250"><br>
     **Hand Joint Chaser**<br>
     Demonstrates how to use Solver to attach objects to the hand joints
    <a/>
    :::column-end:::
:::row-end:::   
        
:::row:::
    :::column:::
    <a href="https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_TargetSelection.html"><img src="images/mrtk_et_targetselect.png" alt="Eye Tracking: Target Selection" title="Eye Tracking: Target Selection" width="250"><br>
    **Eye Tracking: Target Selection**<br>
    Combine eyes, voice and hand input to quickly and effortlessly select holograms across your scene
    <a/>
    :::column-end:::
    :::column:::
    <a href="https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_Navigation.html"><img src="images/mrtk_et_navigation.png" alt="Eye Tracking: Navigation" title="Eye Tracking: Navigation" width="250"><br>
    **Eye Tracking: Navigation**<br>
    Learn how to auto scroll text or fluently zoom into focused content based on what you are looking at
    <a/>
    :::column-end:::
    :::column:::
    <a href="https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_Visualization.html"><img src="images/mrtk_et_heatmaps.png" alt="Eye Tracking: Heat Map" title="Eye Tracking: Heat Map" width="250"><br>
    **Eye Tracking: Heat Map**<br>
    Examples for logging, loading and visualizing what users have been looking at in your app
    <a/>
    :::column-end:::
:::row-end:::           


## Minimum Requirement for MRTK v2
* Unity 2018.3.x
* Microsoft Visual Studio 2017 or later
* Windows SDK 18362+ 
* Windows 10 1803 or later

## New with MRTK v2
We want to stress our commitment to these platform tools.  In fact, we leveraged MRTK version 2 to develop our inbox experiences, such as the setup experience (OOBE) and our Mixed Reality Learning application.  You can also expect to see new HoloLens 2 capabilities first exposed through MRTK because we believe it’s the best way to develop on our platform. 

### Modular
We have built it in a modular way, so that you do not need to take every bit of the toolkit into your project.  There are actually a few benefits to this.  It keeps your project size smaller, as well as makes it easier to manage.  On top of that, because it’s built with scriptable objects and is interface driven, it’s also possible for you to replace the components that are included with your own, to support other services, systems, and platforms.


### Cross-platform
Speaking of other platforms, it has cross-platform support.  And while this doesn’t mean every single platform is supported out of the box, we have made sure none of the toolkit code will break when you switch your build target to other platforms.  The robustness and extensibility with the modular design sets you up on a good path to be able to support multiple platforms, such as ARCore, ARKit, and OpenVR.


### Performant
Working with mobile platforms, we constructed it with performance in mind.  This is super important, and we wanted to ensure that the tools are not going to work against you.


## See also
* [MRTK getting started guide](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/GettingStartedWithTheMRTK.html)
* [MRTK documentation home](https://microsoft.github.io/MixedRealityToolkit-Unity/README.html)
* [Install the tools](install-the-tools.md)
* [Porting from HTK/MRTK to MRTK version 2](mrtk-porting-guide.md)

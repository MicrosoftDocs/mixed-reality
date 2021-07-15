---
title: Using Vuforia with Unity
description: Use Vuforia to build Windows Mixed Reality applications in Unity.
author: thetuvix
ms.author: alexturn
ms.date: 12/20/2019
ms.topic: article
keywords: Vuforia, markers, coordinates, frame of reference, tracking, mixed reality headset, windows mixed reality headset, virtual reality headset, unity, HoloLens, device tracking, performance mode, Vuforia Developer Portal
---


# Using Vuforia Engine with Unity

Vuforia Engine brings an important capability to HoloLens – the power to connect AR experiences to specific images and objects in the environment. You can use this capability to overlay guided step-by-step instructions on top of machinery for the industrial enterprise or add digital features and experiences to a physical product or game.

Vuforia Engine offers a broad range of features and targets to make your AR development process more flexible. One of our newest features, Vuforia Model Targets, is a key capability for both commercial and industrial uses. Model Targets allow applications to recognize physical objects like machines, automobiles, or toys and track them based on a CAD or digital 3D model. For industrial uses, this feature can provide assembly workers and service technicians with AR work instructions and procedural guidance while in the factory or out in the field.

Existing Vuforia Engine apps that were built for phones and tablets can easily be configured in Unity to run on HoloLens. You can even use Vuforia Engine to take your new HoloLens app to Windows 10 tablets such as the Surface Pro and Surface Book.


## Get the tools

[Install the recommended versions](../install-the-tools.md) of Visual Studio and Unity and then configure Unity to use Visual Studio and the preferred IDE and compiler. 

When installing Unity, be sure to install the “Windows Store IL2CPP Scripting Backend”.

Add the Vuforia Engine package as described [here.](https://library.vuforia.com/content/vuforia-library/en/articles/Solution/vuforia-engine-package-hosting-for-unity.html).

## Getting started with Vuforia Engine

The best starting point for learning about Vuforia Engine and HoloLens is the [Vuforia Engine HoloLens sample](https://assetstore.unity.com/packages/templates/packs/vuforia-hololens-sample-101553) (available in the Unity Asset Store). The sample provides a complete HoloLens project including pre-configured scenes that can be deployed to a HoloLens.

The scenes show how to use Vuforia Image Targets to recognize an image and augment it with digital content in a HoloLens experience. The Vuforia Engine HoloLens Sample also includes a scene showing the usage of Model Targets and VuMarks on HoloLens. You can easily substitute your own content in the scenes to experiment with the creation of HoloLens apps that use Vuforia Engine.



## Configuring a Vuforia App for HoloLens

Developing a Vuforia Engine app for HoloLens is fundamentally the same as developing Vuforia Engine apps for other devices. You can then apply the build settings and configurations described in the section below. That’s all that’s needed to enable Vuforia Engine to work with the HoloLens spatial mapping and positional tracking systems.

## Build and Run the Vuforia Engine Sample for HoloLens
1.	Download the [Vuforia Engine Sample for HoloLens](https://assetstore.unity.com/packages/templates/packs/vuforia-hololens-sample-101553) from the Unity Asset Store
2.	Apply the [recommended Unity engine options for power and performance](performance-recommendations-for-unity.md)
3.	Add the sample scenes to **Scenes** in **Build.**
4.	In **Build Settings**, switch build platform to **UWP** by clicking the **Add Open Scenes** button.
![image](https://user-images.githubusercontent.com/45470042/89573103-173daa80-d7f8-11ea-9284-931a7b6c913d.png)
5.	Select the **Player Settings** button.  
   * Select the **UWP** icon and expand the **XR Settings** section.
   * Ensure that **Virtual Reality Supported** is enabled.    
   * Under **Virtual Reality SDKs** ensure that:
     * **Window Mixed Reality** is included in the list and that **Enable Depth Buffer** Sharing is enabled. 
     * The **Depth Format** is set to **16-bit depth.** 
   * Ensure that the **Stereo Rendering Mode** is set to **Single Pass Instanced.**
6.	Expand the **Publishing Settings** section.
   * Under **Capabilities** ensure that **Internet Client, WebCam, Microphone,** and **SpatialPerception** are selected.
   * **NOTE: SpatialPerception** should only be selected if you intend to use the Surface Observer API.
   * Under **Supported Device Families**, ensure that **Holographic** is selected. 
7.	Expand the **Resolution and Presentation** section.
   * Disable **Run in Background** so that Vuforia Engine pauses when the app is put into the background and can access the camera again when the app is resumed. 
   * In the **Default Orientation** dropdown, ensure that **Landscape Left** is selected.
8.	Return to the **Build Settings** window and select **Build** to generate a Visual Studio project.
9.	Build the executable from Visual Studio and install it on your HoloLens.

## The Vuforia Developer Portal

Developers looking to create their own AR experiences with Vuforia Engine and HoloLens should sign up on our Vuforia Developer Portal at [developer.vuforia.com](https://developer.vuforia.com/). In the portal, developers have access to the [Vuforia Engine Forums](https://developer.vuforia.com/forum) where they can join community discussions, a [library](https://library.vuforia.com/) with in-depth documentation on all the Vuforia Engine Features, and the [Vuforia Target Manager](https://developer.vuforia.com/target-manager) where users can create their own custom Targets. Developers can also sign up for a free Developer License using the [Vuforia License Manager](https://developer.vuforia.com/license-manager).

## Device Tracking with Vuforia

[Device Tracking](https://library.vuforia.com/features/environments/device-tracker-overview.html) maintains tracking even when a target is no longer in view. It's automatically enabled for all targets when the Positional Device Tracker is enabled. For HoloLens applications, the Positional Device Tracker is started automatically in Unity.

Vuforia Engine automatically fuses the poses from camera tracking and HoloLens's spatial tracking to provide stable target poses independent of whether the target is seen by the camera or not.

Since the process is handled automatically, it doesn't require any programming by the developer.


**The following is a high-level description of the process:**
1. Vuforia’s target Tracker recognizes the target
2. Target tracking is then initialized
3. The position and rotation of the target are analyzed to provide a robust pose estimate for the HoloLens
4. Vuforia Engine transforms the target's pose into the HoloLens spatial mapping coordinate space
5. HoloLens takes over tracking if the target is no longer in view. Whenever you look again at the target, Vuforia will continue to track the images and objects accurately.

Targets that are detected, but no longer in view, are reported as EXTENDED_TRACKED. In these cases, the DefaultTrackableEventHandler script that is used on all targets continues to render augmentation content. The developer can control this behavior by implementing a custom trackable event handler script.

## Performance Mode with Vuforia Engine 

It's possible through the Vuforia Engine to manage the performance on the HoloLens to extent AR experiences and reduce the workload on the CPU. The Vuforia Engine offers three modes that can be selected: default, for optimizing speed, and for optimizing quality. 

*	MODE_OPTIMIZE_SPEED lets you minimize the workload on the HoloLens device and is great for extending AR experiences. We recommended for situations where the app is tracking static objects/targets.
*	MODE_DEFAULT is the normal mode, which can be used in most scenarios.
*	MODE_OPTIMIZE_QUALITY is better for tracking movable targets or model targets you expect to be picked up.

**Setting the mode**

To change the performance mode in Unity, navigate to Vuforia Configuration (Ctrl+Shift+V / Cmd+Shift+V) that is located as a component in the ARCamera GameObject. 
*	Select the dropdown menu for Camera Device Mode and select one of the three options.


## See also
* [Install the tools](../install-the-tools.md)
* [Coordinate systems](../../design/coordinate-systems.md)
* [Spatial mapping](../../design/spatial-mapping.md)
* [Camera in Unity](camera-in-unity.md)
* [Exporting and building a Unity Visual Studio solution](exporting-and-building-a-unity-visual-studio-solution.md)
* [Vuforia documentation: Getting Started with Vuforia Engine for Windows 10 Development](https://library.vuforia.com/articles/Training/Getting-Started-with-Vuforia-for-Windows-10-Development.html)
* [Vuforia documentation: Getting Started with Vuforia Engine in Unity](https://library.vuforia.com/articles/Training/getting-started-with-vuforia-in-unity.html)
* [Vuforia documentation: Working with the HoloLens sample in Unity](https://library.vuforia.com/articles/Solution/Working-with-the-HoloLens-sample-in-Unity.html)
* [Vuforia documentation: Device Tracking in Vuforia](https://library.vuforia.com/features/environments/device-tracker-overview.html)
* [Vuforia documentation: Framerate and Performance Optimization](https://library.vuforia.com/content/vuforia-library/en/articles/Solution/Framerate-Optimization-for-Mixed-Reality-Apps.html)

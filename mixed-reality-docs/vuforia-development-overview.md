---
title: Using Vuforia with Unity
description: Leverage Vuforia to build Windows Mixed Reality applications in Unity.
author: ailyadis
ms.author: 
ms.date: 01/28/2019
ms.topic: article
keywords: Vuforia, markers, coordinates, frame of reference, tracking
---



# Using Vuforia Engine with Unity

Vuforia Engine brings an important capability to HoloLens – the power to connect AR experiences to specific images and objects in the environment. You can use this capability to overlay guided step-by-step instructions on top of machinery for the industrial enterprise or add digital features and experiences to a physical product or game. 

For greater flexibility when developing AR experiences, Vuforia Engine offers a broad range of features and targets. One of our newest features, Vuforia Model Targets, is a key capability for both commercial and industrial uses. Model Targets allow applications to recognize physical objects like machines, automobiles or toys and track them based on a CAD or digital 3D model. For industrial uses, this feature can provide assembly workers and service technicians with AR work instructions and procedural guidance while in the factory or out in the field. 

Existing Vuforia Engine apps that were built for phones and tablets can easily be configured in Unity to run on HoloLens. You can even use Vuforia Engine to take your new HoloLens app to Windows 10 tablets such as the Surface Pro 4 and Surface Book.

## Get the tools

[Install the recommended versions](install-the-tools.md) of Visual Studio and Unity and then configure Unity to use Visual Studio and the preferred IDE and compiler. 

When installing Unity, be sure to install either the “Windows Store .NET Scripting Backend” or the “Windows Store IL2CPP Scripting Backend”. Also, be sure to select “Vuforia Augmented Reality Support” to enable Vuforia Engine within Unity.


## Getting started with Vuforia Engine

Since Vuforia Engine is integrated into Unity, developers don’t need to download or install any extra tools. The recommended version of Unity is the LTS stream which is currently at 2017.3 and includes Vuforia Engine 7.0.57. The best starting point for learning about using Vuforia Engine with HoloLens is with the [Vuforia Engine HoloLens sample](https://assetstore.unity.com/packages/templates/packs/vuforia-hololens-sample-101553) (available in the Unity Asset Store). The sample provides a complete HoloLens project including pre-configured scenes that can be deployed to a HoloLens.

The scenes show how to use Vuforia Image Targets to recognize an image and augment it with digital content in a HoloLens experience. Developers using more recent versions of Unity and Vuforia have access to updated samples which include a scene showing the usage of Model Targets on HoloLens. You can easily substitute your own content in the scenes to experiment with the creation of HoloLens apps that use Vuforia Engine.


## Configuring a Vuforia App for HoloLens

Developing a Vuforia Engine app for HoloLens is fundamentally the same as developing Vuforia Engine apps for other devices. You can then apply the build settings and configurations described in the section below. That’s all that’s needed to enable Vuforia Engine to work with the HoloLens spatial mapping and positional tracking systems.

## Build and Run the Vuforia Engine Sample for HoloLens
1.	Download the [Vuforia Engine Sample for HoloLens](https://assetstore.unity.com/packages/templates/packs/vuforia-hololens-sample-101553) from the Unity Asset Store
2.	Apply the [recommended Unity engine options for power and performance](performance-recommendations-for-unity.md)
3.	Add the sample scenes to Scenes in Build.
4.	Set your platform build target for “Universal Windows Platform” in File > Build Settings.
5.	Select the following platform build configuration settings: 
   * Target Device = HoloLens
   * Build Type = D3D
   * SDK = Latest Installed
   * Visual Studio Version = Latest Installed
   * Build and Run on = Local Machine
6.	Define a unique **Product Name**, in **Player Settings**, to serve as the name of the app when installed on the HoloLens.
7.	Check **Vuforia Augmented Reality** and **Virtual Reality Supported** in **Player Settings > XR Settings**
8.	Also under **XR Settings**, make sure that “Windows Mixed Reality” is added to the **Virtual Reality SDKs** List
9.	Check the following Capabilities in Player Settings > Publish Settings 
   * InternetClient
   * WebCam
   * SpatialPerception - if you intend to use the Surface Observer API
10. Select Build to generate a Visual Studio project
11. Build the executable from Visual Studio and install it on your HoloLens

Note: Starting with version 7.2, the Vuforia Engine Sample for HoloLens includes a sample scene including example usage of Model Targets

## The Vuforia Developer Portal

Developers looking to create their own AR experiences with Vuforia Engine and HoloLens should sign up on our Vuforia Developer Portal at [developer.vuforia.com](https://developer.vuforia.com/). In the portal, developers have access to the [Vuforia Engine Forums](https://developer.vuforia.com/forum) where they can join community discussions, a [library](https://library.vuforia.com/) with in-depth documentation on all the Vuforia Engine Features, and the [Vuforia Target Manager](https://developer.vuforia.com/target-manager) where users can create their own custom Targets. Developers can also sign up for a free Developer License using the [Vuforia License Manager](https://developer.vuforia.com/license-manager).

## Extended tracking with Vuforia

[Extended tracking](https://library.vuforia.com/articles/Training/Extended-Tracking) creates a map of the environment to maintain tracking even when a target is no longer in view. It is Vuforia Engines’ counterpart to the spatial mapping performed by HoloLens. When you enable extended tracking on a target, you enable the pose of that target to be passed to the spatial mapping system. In this way, targets can exist in both the Vuforia Engine and HoloLens spatial coordinate systems, though not simultaneously.

![Unity settings window](images/vuforia-extendedtracking.png)<br>
*Unity settings window*

**Enabling Extended Tracking on a Target**

Vuforia Engine will automatically transform the pose of a target that uses extended tracking into the HoloLens spatial coordinate system. This allows HoloLens to take over tracking, and to integrate any content augmenting into the spatial map of the target’s surroundings. This process occurs between Vuforia Engine and mixed reality APIs in Unity and does not require any programming by the developer - it's handled automatically.

**Here is what occurs...**
1. Vuforia’s target Tracker recognizes the target
2. Target tracking is then initialized
3. The position and rotation of the target are analyzed to provide a robust pose estimate for HoloLens to use
4. Vuforia transforms the target's pose into the HoloLens spatial mapping coordinate space
5. HoloLens takes over tracking and the Vuforia tracker is deactivated

The developer can control this process, to return control to Vuforia, by disabling extended tracking on the TargetBehaviour.

**NOTE:** Starting with Vuforia 7.2, Extended Tracking is no longer enabled on a per-target basis. Instead, developers can turn on Device Tracking to enable similar functionality on all the targets in the scene.


## See also
* [Install the tools](install-the-tools.md)
* [Coordinate systems](coordinate-systems.md)
* [Spatial mapping](spatial-mapping.md)
* [Camera in Unity](camera-in-unity.md)
* [Exporting and building a Unity Visual Studio solution](exporting-and-building-a-unity-visual-studio-solution.md)
* [Vuforia documentation: Developing for Windows 10 in Unity](https://library.vuforia.com/articles/Solution/Developing-for-Windows-10-in-Unity)
* [Vuforia documentation: How to install the Vuforia Unity extension](https://library.vuforia.com/articles/Solution/Installing-the-Unity-Extension)
* [Vuforia documentation: Working with the HoloLens sample in Unity](https://library.vuforia.com/articles/Solution/Working-with-the-HoloLens-sample-in-Unity)
* [Vuforia documentation: Extended tracking in Vuforia](https://library.vuforia.com/articles/Training/Extended-Tracking)

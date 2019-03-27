---
title: MR Learning Base Module Project Initialization and First Application
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# MR Learning Base Module Project Initialization and First Application

In this first lesson, we will learn some of the capabilities the Mixed Reality Tool Kit has to offer, start your first application for the HoloLens 2, and deploy it to the device.

## Objectives

* Optimize Unity for HoloLens development.
* Import assets and setup the scene.
* Visualization of the spatial mesh, hand meshes, and the framerate counter.

## Instructions

### Create new Unity project

1. Start Unity.
2. Select **New**.
3. Enter a project name (e.g. "MixedRealityBase").
4. Enter a location to save your project.
5. Make sure the project is set to **3D**.
6. Click **Create Project**.

### Import the Mixed Reality Toolkit

1. Download the [Mixed Reality Toolkit]() unity package and save it to a folder on your PC.
2. Import the Mixed Reality Toolkit package by clicking on Assets>Import>Custom Package. Find the Mixed Reality Toolkit package downloaded in Step 1 and open it to begin the importing process.
3. In the next pop-up window, click “Import” to begin importing the Mixed Reality Toolkit. Ensure all items are checked, as shown in the image.

### Configure the Mixed Reality Toolkit

1. Configure the Mixed Toolkit by selecting from the menu bar Mixed Reality Toolkit > Configure.
2. Your scene will now have several new items and modifications in it from the Mixed Reality Toolkit. Save your scene under a different name by clicking on File>Save As and give your scene a name, e.g., BaseScene. Keep your scene organized by saving it to the “Scenes” folder in your project’s Assets folder.

### Configure the Unity project for Windows Mixed Reality

1. Open the build settings window by going to File>Build Settings.
2. Switch to “Universal Windows Platform” by selecting “Universal Windows Platform” and then click the “Switch Platform” button to switch platforms. Apps running on HoloLens 2 are required to be Universal Windows Platform (UWP).
3. Enable virtual reality by clicking on Player Settings in the Build Window, and then in the inspector panel enable the “Virtual Reality Supported” checkbox under XR Settings.
4. Enable the “Spatial Perception” checkbox in the capabilities section, under Publishing Settings. Spatial Perception will allow us to visualize the spatial mapping mesh on a mixed reality device such as the HoloLens 2.

### Build your application to your device

1. Open the build settings window by going to File>Build Settings.
2. Ensure the scene you want to try is in the “Scenes in Build” list by clicking on the “Add Open Scenes” button.
3. Press the Build button to begin the build process.
4. Create and name a new folder for your application. In the image below, a folder with the name “App” was created to contain the application. Click “Select Folder” to begin building to the newly created folder.
5. . After the build is completed, open the newly created folder containing your newly built application files. Double click on the “MixedRealityBase.sln” solution (or the corresponding name, if you used an alternative name for your project) to open the solution file in Visual Studio.
6. Plug your HoloLens 2 into your PC with the USB cable.
7. . Before building to your device, ensure that the device is in Developer Mode and that it is paired with visual Studio. Please follow [these instructions](https://docs.microsoft.com/en-us/windows/mixed-reality/using-visual-studio) if you need to enable developer mode or pair with Visual Studio.
8. Configure Visual Studio for building to your HoloLens 2 by selecting the “Release” configuration and the “ARM” architecture.
9. The final step is to build to your device by selecting Debug>Start without Debugging. Selecting “Start without Debugging” will cause the application to immediately start on your device upon a successful build, but without Debugging information appearing in Visual Studio. This also means that you can disconnect your USB cable while your application is running on your HoloLens 2 without stopping the application.

## Congratulations

You now have now deployed your first HoloLens 2 application. As you walk around, you should see a spatial mesh cover all surfaces that have been perceived by the HoloLens 2. Additionally, you should see indicators on your hands and fingers for hand tracking. These are just a few of the foundational pieces included out of the box with the Mixed Reality Toolkit. In the lessons to come, we’ll start adding more content and interactivity to your scene, so you can fully explore the capabilities of the HoloLens 2 and the Mixed Reality Toolkit.
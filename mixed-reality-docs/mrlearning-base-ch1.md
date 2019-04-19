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
![Lesson1 Chapter1 Step2](images/Lesson1Chapter1Step2.JPG)
3. Enter a project name (e.g. "MixedRealityBase").
![Lesson1 Chapter1 Step3](images/Lesson1Chapter1Step3.JPG)
4. Enter a location to save your project.
![Lesson1 Chapter1 Step4](images/Lesson1Chapter1Step4.JPG)
5. Make sure the project is set to **3D**.
![Lesson1 Chapter1 Step5](images/Lesson1Chapter1Step5.JPG)
6. Click **Create Project**.
![Lesson1 Chapter1 Step6](images/Lesson1Chapter1Step6.JPG)

### Import the Mixed Reality Toolkit

1. Download the [Mixed Reality Toolkit](https://github.com/Microsoft/MixedRealityToolkit-Unity/releases/download/v2.0.0-RC1/Microsoft.MixedReality.Toolkit.Unity.Foundation-v2.0.0-RC1.unitypackage) unity package and save it to a folder on your PC.
2. Import the Mixed Reality Toolkit package by clicking on Assets>Import>Custom Package. Find the Mixed Reality Toolkit package downloaded in Step 1 and open it to begin the importing process.
![Lesson1 Chapter2 Step2a](images/Lesson1Chapter2Step2a.JPG)
![Lesson1 Chapter2 Step2b](images/Lesson1Chapter2Step2b.JPG)
3. In the next pop-up window, click “Import” to begin importing the Mixed Reality Toolkit. Ensure all items are checked, as shown in the image.
![Lesson1 Chapter2 Step3](images/Lesson1Chapter2Step3.JPG)

### Configure the Mixed Reality Toolkit

1. Configure the Mixed Toolkit by selecting from the menu bar Mixed Reality Toolkit > Configure.
![Lesson1 Chapter3 Step1](images/Lesson1Chapter3Step1.JPG)
2. Your scene will now have several new items and modifications in it from the Mixed Reality Toolkit. Save your scene under a different name by clicking on File>Save As and give your scene a name, e.g., BaseScene. Keep your scene organized by saving it to the “Scenes” folder in your project’s Assets folder.
![Lesson1 Chapter3 Step2a](images/Lesson1Chapter3Step2a.JPG)
![Lesson1 Chapter3 Step2b](images/Lesson1Chapter3Step2b.JPG)

### Configure the Unity project for Windows Mixed Reality

1. Open the build settings window by going to File>Build Settings.
![Lesson1 Chapter4 Step1](images/Lesson1Chapter4Step1.JPG)
2. Switch to “Universal Windows Platform” by selecting “Universal Windows Platform” and then click the “Switch Platform” button to switch platforms. Apps running on HoloLens 2 are required to be Universal Windows Platform (UWP).
![Lesson1 Chapter4 Step2](images/Lesson1Chapter4Step2.JPG)
3. Enable virtual reality by clicking on Player Settings in the Build Window, and then in the inspector panel enable the “Virtual Reality Supported” checkbox under XR Settings. TODO: be more specific about where to find inspector panel. Might suggest moving build settings window out of the way, in case it's overlapping. Make note that "Virtual Reality Supported" also applies to Mixed Reality / AR.
![Lesson1 Chapter4 Step3](images/Lesson1Chapter4Step3.JPG)
4. Check that the “Spatial Perception” checkbox in the capabilities section is enabled, under Publishing Settings. Spatial Perception will allow us to visualize the spatial mapping mesh on a mixed reality device such as the HoloLens 2. TODO: add more context on where to find publishing settings.
![Lesson1 Chapter4 Step4](images/Lesson1Chapter4Step4.JPG)

### Build your application to your device

1. If you closed the Build Settings window from the previous sections, open the build settings window again by going to File>Build Settings.
  ![Lesson1 Chapter5 Step1](images/Lesson1Chapter5Step1.JPG)

2. Ensure the scene you want to try is in the “Scenes in Build” list by clicking on the “Add Open Scenes” button.

3. Press the Build button to begin the build process.
  ![Lesson1 Chapter5 Step3](images/Lesson1Chapter5Step3.JPG)

4. Create and name a new folder for your application. In the image below, a folder with the name “App” was created to contain the application. Click “Select Folder” to begin building to the newly created folder.
  ![Lesson1 Chapter5 Step4](images/Lesson1Chapter5Step4.JPG)

  > TODO: tell people they can close the build window now.
  >
  > TODO NOTE: you might have to build again if the build fails, or may need to press play before building. Make note that users should see progress bar, it will take a while. Look for build errors in console for build failed / build succeeded.
  >
  > 

5. After the build is completed, open the newly created folder containing your newly built application files. Double click on the “MixedRealityBase.sln” solution (or the corresponding name, if you used an alternative name for your project) to open the solution file in Visual Studio.

  > TODO note: make sure to open the newly created folder, there will be an identically named solution file outside that, but that's not the right one.

  ![Lesson1 Chapter5 Step5](images/Lesson1Chapter5Step5.JPG)

  > TODO note: Grab screenshot from Graham. if Visual Studio asks to install any missing components, please do.

6. Plug your HoloLens 2 into your PC with the USB cable.

   > TODO: Emulator path or app package path - separate instructions, link to them. Note that this pathway is for HoloLens 2. 

7. Before building to your device, ensure that the device is in Developer Mode and that it is paired with visual Studio. Please follow [these instructions](https://docs.microsoft.com/en-us/windows/mixed-reality/using-visual-studio) if you need to enable developer mode or pair with Visual Studio.

8. Configure Visual Studio for building to your HoloLens 2 by selecting the “Release” configuration and the “ARM” architecture.
  ![Lesson1 Chapter5 Step8](images/Lesson1Chapter5Step8.JPG)

9. The final step is to build to your device by selecting Debug>Start without Debugging. Selecting “Start without Debugging” will cause the application to immediately start on your device upon a successful build, but without Debugging information appearing in Visual Studio. This also means that you can disconnect your USB cable while your application is running on your HoloLens 2 without stopping the application.
  ![Lesson1 Chapter5 Step9](images/Lesson1Chapter5Step9.JPG)

## Congratulations

You now have now deployed your first HoloLens 2 application. As you walk around, you should see a spatial mesh cover all surfaces that have been perceived by the HoloLens 2. Additionally, you should see indicators on your hands and fingers for hand tracking and a frame rate counter for keeping an eye on app performance. These are just a few of the foundational pieces included out of the box with the Mixed Reality Toolkit. In the lessons to come, we’ll start adding more content and interactivity to your scene, so you can fully explore the capabilities of the HoloLens 2 and the Mixed Reality Toolkit.

>Note: We'll cover how to toggle the frame rate counter using a voice command in [Lesson 5](mrlearning-base-ch5.md) 
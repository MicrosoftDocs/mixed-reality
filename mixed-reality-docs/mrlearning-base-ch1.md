---
title: Getting started tutorials - 2. Initializing your project and first application
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 11/01/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# 2. Initializing your project and first application

In this first lesson, you'll learn about some of the capabilities the [Mixed Reality Toolkit (MRTK)]() has to offer, start your first application for the HoloLens 2, and deploy it to the device.

## Objectives

* Optimize Unity for HoloLens development.
* Import assets and setup the scene.
* Visualization of the spatial mapping mesh, hand meshes, and the framerate counter.

## Instructions

### Create new Unity project

1. Start Unity.
2. Select **New**.
![Lesson1 Section1 Step2](images/mrlearning-base-ch1-1-step2.JPG)

3. Enter a project name (e.g. "MixedRealityBase").
![Lesson1 Section1 Step3](images/mrlearning-base-ch1-1-step3.JPG)
4. Enter a location to save your project.
![Lesson1 Section1 Step4](images/mrlearning-base-ch1-1-step4.JPG)
5. Make sure the project is set to **3D**.
![Lesson1 Section1 Step5](images/mrlearning-base-ch1-1-step5.JPG)
6. Click **Create Project**.
![Lesson1 Section1 Step6](images/mrlearning-base-ch1-1-step6.JPG)


### Configure the Unity project for Windows Mixed Reality

1. Open the *Build Settings* window by going to **File** > **Build Settings**.
![Lesson1 Section2 Step1](images/mrlearning-base-ch1-2-step1.JPG)
2. Select the *Universal Windows Platform* and click the **Switch Platform** button to switch platforms. Applications running on HoloLens 2 are required to be Universal Windows Platform (UWP) compatible.
![Lesson1 Section2 Step2](images/mrlearning-base-ch1-2-step2.JPG)
3. Enable virtual reality by clicking on **Player Settings** button in the Build Window, and enable the *Virtual Reality Supported* checkbox under XR Settings from the inspector panel, as shown in the image below. Note that you might need to drag the *Build Settings* window out of the way in order to see the inspector panel. The *Virtual Reality Supported* checkbox also applies to Mixed Reality and Augmented Reality headsets because it refers to the enabling of stereoscopic vision (rendering different images for each eye.)
![Lesson1 Section2 Step3](images/mrlearning-base-ch1-2-step3.JPG)
4. Also under XR Settings, change the *Stereo Rendering Mode* to *Single Pass Instanced*. This [rendering pipeline style](https://docs.unity3d.com/Manual/SinglePassStereoRenderingHoloLens.html) is generally most performant for HoloLens 2. If interested in other performant configurations for your Unity environment, follow [these instructions](recommended-settings-for-unity.md).
![Lesson1 Section2 Step4](images/mrlearning-base-ch1-2-step4.jpg)
5. From the same inspector panel, ensure that the *Spatial Perception* checkbox in the capabilities section is enabled under *Publishing Settings*. Spatial Perception allows us to visualize the spatial mapping mesh on a mixed reality device, such as HoloLens 2. Publishing Settings are found in the inspector panel, above XR Settings and under Other Settings.
![Lesson1 Section2 Step5](images/mrlearning-base-ch1-2-step5.JPG)

    > [!NOTE]
    > While not used in this section, some other common capabilities you might want to enable include the *Microphone* for voice commands, and *InternetClient* for connecting to services requiring a network connection.

### Import the Mixed Reality Toolkit

1. Download the [Mixed Reality Toolkit](https://github.com/microsoft/MixedRealityToolkit-Unity/releases) Unity [foundation package version 2.1.0](https://github.com/microsoft/MixedRealityToolkit-Unity/releases/download/v2.1.0/Microsoft.MixedReality.Toolkit.Unity.Foundation.2.1.0.unitypackage) and save it to a folder on your PC.

2. Import the *Mixed Reality Toolkit* package that you downloaded in the previous step. Start by clicking on **Assets** > **Import** > **Custom Package** and select *Microsoft.MixedReality.Toolkit.Unity.Foundation.2.1.0.unitypackage* and open it to begin the importing process. Please allow a few minutes for the importing process to complete.
    ![Lesson1 Section3 Step2a](images/mrlearning-base-ch1-3-step2a.JPG)
    ![Lesson1 Section3 Step2b](images/mrlearning-base-ch1-3-step2b.JPG)

3. In the next pop-up window, click **Import** to begin importing the selected package into the Unity project. Ensure all items are checked as shown in the image.
    ![Lesson1 Section3 Step3](images/mrlearning-base-ch1-3-step3.JPG)

    > [!NOTE]
    > If you see a pop-up dialog box asking to apply the Mixed Reality Toolkit default settings, click **Apply**. MRTK analyzes your project for any missing recommended settings when imported for automated setup. Depending on your settings the popup might look differnt then the image below.

    ![Lesson1 Section3 Step4 Note1](images/mrlearning-base-ch1-3-step4-note1.JPG)

### Configure the Mixed Reality Toolkit

1. Add the *Mixed Reality Toolkit* to your current scene by selecting **Mixed Reality Toolkit** > **Add to Scene and Configure..** from the menu bar. If you don't see this menu item after importing the mixed reality toolkit, please restart Unity.
  ![Lesson1 Section4 Step1](images/mrlearning-base-ch1-4-step1.JPG)

    > [!NOTE]
    > You may see a pop-up dialog box for selecting a [profile for the Mixed Reality Toolkit](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/Profiles/Profiles.html). Choose the profile named *DefaultMixedRealityToolkitConfigurationProfile* by double-clicking it.

2. Your scene will have several new items and modifications. Save your scene under a different name by clicking **File** > **Save As...**, and give your scene a name, such as *BaseScene*. Keep your scene organized by saving it to the *Scenes* folder in your project’s *Assets* folder.
  ![Lesson1 Section4 Step2a](images/mrlearning-base-ch1-4-step2a.JPG)
  ![Lesson1 Section4 Step2b](images/mrlearning-base-ch1-4-step2b.JPG)

### Build your application to your device

1. If you closed the *Build Settings* window from the previous sections, open the *Build Settings* window again by going to **File** > **Build Settings**.
    ![Lesson1 Section5 Step1](images/mrlearning-base-ch1-5-step1.JPG)

2. Ensure the scene you just created is in the *Scenes in Build* list by clicking on the **Add Open Scenes** button while your scene is open in Unity.

3. Press the **Build** button to begin the build process.
    ![Lesson1 Section5 Step3](images/mrlearning-base-ch1-5-step3.JPG)

4. Create and name a new folder for your application. In the image below, a folder with the name App was created to contain the application. Click **Select Folder** to begin building to the newly created folder. After the build has completed, you can close the *Build Settings* window in Unity.
    ![Lesson1 Section5 Step4](images/mrlearning-base-ch1-5-step4.JPG)

    > [!IMPORTANT]
    > If the build fails, try building again or restarting Unity and building again. If you see an error, such as "Error: CS0246 = The type or namespace name “XX” could not be found (are you missing a using directive or an assembly reference?). If so, then you might need to install [Windows 10 SDK (10.0.18362.0)](https://developer.microsoft.com/windows/downloads/windows-10-sdk)

5. After the build is completed, open the newly created folder containing your newly built application files. Double click on the *MixedRealityBase.sln* solution, or the corresponding name, if you used an alternative name for your project, to open the solution file in Visual Studio.

    > [!NOTE]
    > Be sure to open the newly created folder (i.e. the *App* folder, if following the naming conventions from the previous steps), as there will be a similarly named .sln file outside of that folder that is not to be confused with the .sln file inside the build folder. The folder structure should look similar to the image below.
    >
    > If Visual Studio asks you to install new components, please take a moment to ensure that all prerequisite components are installed as specified in [the "Install the Tools" page](install-the-tools.md)

    ![Lesson1 Section5 Step5](images/mrlearning-base-ch1-5-step5.JPG)

6. Connect your HoloLens 2 to your PC. While these instructions assume you will be deploying to a HoloLens 2 device, you might also choose to deploy to the [HoloLens 2 emulator](using-the-hololens-emulator.md) or choose to create an [app package for sideloading](<https://docs.microsoft.com/windows/uwp/packaging/packaging-uwp-apps>)

    > [!IMPORTANT]
    > Before building to your device, the device must be in *Developer Mode* and paired with your development machine. Both of these steps can be completed by following [these instructions](using-visual-studio.md)

7. Configure Visual Studio for building to your HoloLens 2 by selecting the *Release* or *Master* configuration, the *ARM* architecture, and *Device* as target.
    ![Lesson1 Section5 Step8](images/mrlearning-base-ch1-5-step7.JPG)

8. The final step is to build and deploy to your device by selecting **Debug** > **Start without debugging**. Selecting *Start without Debugging* causes the application to immediately start on your device upon a successful build, but without the debugger attached and information appearing in Visual Studio. This also means that you can disconnect your USB cable while your application is running on your HoloLens 2 without stopping the application.

    > [!NOTE]
    > You might also select **Build** > **Deploy Solution** to deploy to your device without having the application automatically start.

    ![Lesson1 Section5 Step9](images/mrlearning-base-ch1-5-step8.JPG)

## Congratulations

You have now deployed your first HoloLens 2 application. As you walk around, you should see a spatial mapping mesh covering all the surfaces that have been perceived by the HoloLens 2. Additionally, you should see indicators on your hands and fingers for hand tracking and a frame rate counter for keeping an eye on application performance. These are just a few of the foundational pieces, included out of the box, with the Mixed Reality Toolkit. In the lessons to come, you will start adding more content and interactivity to your scene so that you can fully explore the capabilities of HoloLens 2 and the Mixed Reality Toolkit.

> [!NOTE]
> In the app you may notice the visual profiler. You will cover how to toggle the frame rate counter using a voice command in [Lesson 5](mrlearning-base-ch5.md). It is generally recommended to keep the visual profiler visible at all times during development to understand when code changes may have impacted perf. HoloLens 2 application should [continuously run at 60 FPS](understanding-performance-for-mixed-reality.md).

[Next Lesson: 3. Creating user interface and configure Mixed Reality Toolkit](mrlearning-base-ch2.md)

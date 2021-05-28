---
title: Azure Spatial Anchors for Android and iOS
description: Complete this course to learn how to deploy a Unity project with Mixed Reality Toolkit (MRTK) and Azure Spatial Anchors to Android and iOS.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/05/2021
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens, android, ios, MRTK, mixed reality toolkit, UWP, Azure spatial anchors, AR Foundation, ARCore, ARKit
ms.localizationpriority: high
---

# 5. Azure Spatial Anchors for Android and iOS

In this tutorial, you will learn how to build your project to Android and iOS devices using AR Foundation, ARCore XR Plugin, and ARKit XR Plugin.

## Objectives

* Learn how to build your project to your Android device using Unity's AR Foundation and ARCore XR Plugin
* Learn how to build your project to your iOS device using Unity's AR Foundation and ARKit XR Plugin

## Installing inbuilt Unity packages

[!INCLUDE[](includes/installing-inbuilt-unity-packages-for-asa-android-and-ios)]

## Configure MRTK for AR Foundation Camera

In this section, you will learn how to configure MRTK for deploying to a mobile device.

In the Hierarchy window, select the **MixedRealityToolkit** object. Then in the Inspector window, select the **Camera** tab, clone the camera profile, and give it a suitable name, for example, **AzureSpatialAnchors_ARCameraProfile**:

![Unity with newly created ARCameraProfile selected](images/mr-learning-asa/asa-05-section2-step1-1.png)

> [!TIP]
> For a reminder on how to clone MRTK profiles, you can refer to the [Configuring the Mixed Reality Toolkit profiles](mr-learning-base-03.md) instructions.

With the **Camera** tab still selected in the Inspector window, expand the **Camera Setting Providers** and by clicking the "-" remove the **Windows Mixed Reality Camera Setting** or **XR SDK Windows Mixed Reality Camera Setting**:

![Unity ARCameraProfile with new data provider added ](images/mr-learning-asa/asa-05-section2-step1-2.png)

and click the **+ Add Camera Setting Provider** button, then expand the newly added **New data provider**:

![AR camera added for Android](images/mr-learning-asa/asa-05-section2-step1-3.png)

Using the **Type** dropdown, change the type to **Microsoft.MixedReality.Toolkit.Experimental.UnityAR** > **UnityARCameraSettings**:

![Unity ARCameraProfile with path to data provider type selection](images/mr-learning-asa/asa-05-section2-step1-4.png)

Update the MRTK UnityAR scripting defines by invoking the menu item: **Mixed Reality** > **Toolkit** > **Utilities** > **UnityAR** > Update Scripting Defines

## Building your application to your Android device

In this section, you will learn how to configure your project to build and deploy it to an Android device.

In the Unity menu, select **File** > **Build Settings...** to open the Build Settings window and then switch the platform to Android:

![Unity Build Settings window with Android platform selected](images/mr-learning-asa/asa-05-section3-step1-1.png)

> [!TIP]
> For a reminder on how to switch build platform, you can refer to the [Switching the build platform](mr-learning-base-02.md#switching-the-build-platform) instructions.

Close the Build Settings window.

In the Unity menu, select **Mixed Reality** > **Toolkit** > **Utilities** > **Configure Project for MRTK** to open the **MRTK Project Configurator** window, ensure all options are selected, then click the **Apply** button to apply the settings:

![Unity MRTK Project Configurator window Android](images/mr-learning-asa/asa-05-section3-step1-2.png)

In the Unity menu, select **Edit** > **Project Settings...** to open the Player Settings window, then locate the **Player** >  **Other Settings** section, select **Vulkan** and remove it by clicking the **"-"** symbol:

![Unity Other Settings with Vulcan selected](images/mr-learning-asa/asa-05-section3-step1-3.png)

[!INCLUDE[](includes/project-setting-for-asa-android)]

In the Build Settings window, click the **Add Open Scenes** button to add your current scene to the **Scenes In Build** list. Then, use a USB cable, connect your Android device to your computer and select it from the **Run Device** dropdown:

![Unity Build Settings window with scene added and Run Device selected](images/mr-learning-asa/asa-05-section3-step1-4.png)

>[!NOTE]
> If your device does not appear in the Run Device dropdown, you might need to press the Refresh button next to the dropdown.

In the Build Settings window, click the **Build And Run** button to open the Build Android window.

Choose a suitable location to store your build, for example, _D:\MixedRealityLearning\Builds_, then give the apk a suitable name, for example, _MRTKTutorials-AzureSpatialAnchors_, and click the **Save** button to start the build process:

![Unity Build Settings window with Save prompt window Android](images/mr-learning-asa/asa-05-section3-step1-5.png)

> [!NOTE]
> If you get any error in the Unity Console window related to Android SDK, NDK, or JDK modules, you need to open Unity Hub and install the associated Android Build Support modules.

When the build process is complete, your apps should automatically load on your Android device.

## Building your application to your iOS device

In this section, you will learn how to configure your project, to build and deploy it to your iOS device.

In the Unity menu, select **File** > **Build Settings...** to open the Build Settings window and switch platform to iOS:

![Unity Build Settings window with iOS selected](images/mr-learning-asa/asa-05-section4-step1-1.png)

> [!TIP]
> For a reminder on how to switch build platform, you can refer to the [Switching the build platform](mr-learning-base-02.md#switching-the-build-platform) instructions.

Close the Build Settings window.

In the Unity menu, select **Mixed Reality** > **Toolkit** > **Utilities** > **Configure Project for MRTK** to open the **MRTK Project Configurator** window, ensure all options are selected, then click the **Apply** button to apply the settings:

![Unity MRTK Project Configurator window iOS](images/mr-learning-asa/asa-05-section4-step1-2.png)

[!INCLUDE[](includes/project-setting-for-asa-ios)]

In the Unity menu, select **Edit** > **Project Settings...** to open the Player Settings window, then locate the **Player** >  **Other Settings** section, uncheck the **Strip Engine Code** checkbox to disable it:

![Unity Other Settings with Strip Engine Code disabled](images/mr-learning-asa/asa-05-section4-step1-3.png)

Close the Player Settings window and open the **Build Settings** window again.

In the Build Settings window, click the **Add Open Scenes** button to add your current scene to the **Scenes In Build** list:

![Unity Build Settings window with scene added](images/mr-learning-asa/asa-05-section4-step1-4.png)

In the Build Settings window, click the **Build** button to open the Build iOS window.

Choose a suitable location to store your Xcode project, for example, _D:\MixedRealityLearning\Builds_, create a new folder and give it a suitable name, for example, _MRTKTutorials-AzureSpatialAnchors_, and then click the **Select Folder** button to start the build process:

![Unity Build Settings window with Save prompt window iOS](images/mr-learning-asa/asa-05-section4-step1-5.png)

When the build process is complete, follow the [Export the Xcode project](/azure/spatial-anchors/quickstarts/get-started-unity-ios#export-the-xcode-project) instructions to learn to deploy your Xcode project to your iOS device.

## Congratulations

In this tutorial, you learned how to build your project to Android and iOS devices using AR Foundation, ARCore XR Plugin, and ARKit XR Plugin.
---
title: Azure Spatial Anchors tutorials - 2. Getting started with Azure Spatial Anchors
description: Complete this course to learn how to implement Azure Spatial Anchors within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
ms.localizationpriority: high
---

# 2. Getting started with Azure Spatial Anchors

## Overview

In this tutorial, you will explore the various steps required to start and stop an Azure Spatial Anchors session and to create, upload, and download Azure Spatial Anchors on a single device.

## Objectives

* Learn the fundamentals of developing with Azure Spatial Anchors for HoloLens 2
* Learn how to create spatial anchors and fetch them from Azure

## Creating and preparing the Unity project

In this section, you will create a new Unity project and get it ready for MRTK development.

For this, first follow the [Initializing your project and first application](mr-learning-base-02.md), excluding the [Build your application to your device](mr-learning-base-02.md#building-your-application-to-your-hololens-2) instructions, which includes the following steps:

1. [Creating the Unity project](mr-learning-base-02.md#creating-the-unity-project) and give it a suitable name, for example, *MRTK Tutorials*
2. [Switching the build platform](mr-learning-base-02.md#configuring-the-unity-project)
3. [Importing the TextMeshPro Essential Resources](mr-learning-base-02.md#importing-the-textmeshpro-essential-resources)
4. [Importing the Mixed Reality Toolkit](mr-learning-base-02.md#importing-the-mixed-reality-toolkit)
5. [Configuring the Unity project](mr-learning-base-02.md#configuring-the-unity-project)
6. [Creating and configuring the scene](mr-learning-base-02.md#creating-and-configuring-the-scene) and give the scene a suitable name, for example, *AzureSpatialAnchors*

Then follow the [Changing the Spatial Awareness Display Option](mr-learning-base-03.md#changing-the-spatial-awareness-display-option) instructions to change the MRTK configuration profile for your scene to the **DefaultHoloLens2ConfigurationProfile** and change the display options for the spatial awareness mesh to **Occlusion**.

## Installing AR Foundation

In this section, you will install Unity's inbuilt AR Foundation package because it is required by the Azure Spatial Anchors SDK you will import in the next section.

In the Unity menu, select **Window** > **Package Manager**:

![mr-learning-asa](images/mr-learning-asa/asa-02-section2-step1-1.png)

> [!NOTE]
> It might take a few seconds before the AR Foundation package appears in the list.

In the Package Manager window, select **AR Foundation** and install the package by clicking the **Install** button:

![mr-learning-asa](images/mr-learning-asa/asa-02-section2-step1-2.png)

## Importing the tutorial assets

Download and **import** the following Unity custom packages **in the order they are listed**:

* [AzureSpatialAnchors.unitypackage](https://github.com/Azure/azure-spatial-anchors-samples/releases/download/v2.2.1/AzureSpatialAnchors.unitypackage) (version 2.2.1)
* [MRTK.HoloLens2.Unity.Tutorials.Assets.GettingStarted.2.4.0.0.unitypackage](https://github.com/microsoft/MixedRealityLearning/releases/download/getting-started-v2.4.0.0/MRTK.HoloLens2.Unity.Tutorials.Assets.GettingStarted.2.4.0.0.unitypackage)
* [MRTK.HoloLens2.Unity.Tutorials.Assets.AzureSpatialAnchors.2.4.0.0.unitypackage](https://github.com/microsoft/MixedRealityLearning/releases/download/azure-spatial-anchors-v2.4.0.0/MRTK.HoloLens2.Unity.Tutorials.Assets.AzureSpatialAnchors.2.4.0.0.unitypackage)

> [!TIP]
> For a reminder on how to import a Unity custom package, you can refer to the [Importing the Mixed Reality Toolkit](mr-learning-base-02.md#importing-the-mixed-reality-toolkit) instructions.

After you have imported the tutorial assets your Project window should look similar to this:

![mr-learning-asa](images/mr-learning-asa/asa-02-section3-step1-1.png)

## Preparing the scene

In this section, you will prepare the scene by adding some of the tutorial prefabs.

In the Project window, navigate to the **Assets** > **MRTK.Tutorials.AzureSpatialAnchors** > **Prefabs** folder. While holding down the CTRL button, click on **ButtonParent**, **DebugWindow**, **Instructions**, and **ParentAnchor** to select the four prefabs:

![mr-learning-asa](images/mr-learning-asa/asa-02-section4-step1-1.png)

With the four prefabs still selected, drag them into the Hierarchy window to add them to the scene:

![mr-learning-asa](images/mr-learning-asa/asa-02-section4-step1-2.png)

To focus in on the objects in the scene, you can double-click on the ParentAnchor object, and then zoom slightly out again:

![mr-learning-asa](images/mr-learning-asa/asa-02-section4-step1-3.png)

> [!TIP]
> If you find the large icons in your scene, for example, the large framed 'T' icons distracting, you can hide these by <a href="https://docs.unity3d.com/2019.1/Documentation/Manual/GizmosMenu.html" target="_blank">toggling the Gizmos</a> to the off position.

## Configuring the buttons to operate the scene

In this section, you will add scripts to the scene to create a series of button events that demonstrate the fundamentals of how both local anchors and Azure Spatial Anchors behave in an application.

### 1. Configure the Interactible (Script) component

In the Hierarchy window, expand the **ButtonParent** object and select the first child object named **StartAzureSession**:

![mr-learning-asa](images/mr-learning-asa/asa-02-section5-step1-1.png)

In the Inspector window, on the **Interactable (Script)** component, locate the **OnClick ()** event:

![mr-learning-asa](images/mr-learning-asa/asa-02-section5-step1-2.png)

With the StartAzureSession object still selected in the Hierarchy window, click-and-drag the **ParentAnchor** object from the Hierarchy window into the empty **None (Object)** field of the event to make the ParentAnchor object listen for OnClick events from this button:

![mr-learning-asa](images/mr-learning-asa/asa-02-section5-step1-3.png)

Click the **No Function** dropdown of the same OnClick event, then select **AnchorModuleScript** > **StartAzureSession ()** to set the StartAzureSession () function as the action that is triggered when the button pressed event is sent from this button:

![mr-learning-asa](images/mr-learning-asa/asa-02-section5-step1-4.png)

### 2. Configure the remaining buttons

For each of the remaining buttons, complete the process outlined in step 1 above to assign functions to the **OnClick ()** event:

* For the **StopAzureSession** object, assign the AnchorModuleScript > **StopAzureSession ()** function.
* For the **CreateAzureAnchor** object, assign the AnchorModuleScript > **CreateAzureAnchor ()** function,
  * then drag the **ParentAnchor** again into the empty **None (Game Object)** field.
* For the **RemoveLocalAnchor** object, assign the AnchorModuleScript > **RemoveLocalAnchor ()** function,
  * then drag the **ParentAnchor** again into the empty **None (Game Object)** field.
* For the **FindAzureAnchor** object, assign the AnchorModuleScript > **FindAzureAnchor ()** function.
* For the **DeleteAzureAnchor** object, assign the AnchorModuleScript > **DeleteAzureAnchor ()** function.

### 3. Connect the scene to the Azure resource

In the Hierarchy window, select the **ParentAnchor** object and in the Inspector window, locate the **Spatial Anchor Manager (Script)** component.

Then, in the **Credentials** section, paste your Spatial Anchors Account ID and Key, which you created as part of this tutorial's [Prerequisites](mr-learning-asa-01.md#prerequisites), into the corresponding **Spatial Anchors Account Id** and **Spatial Anchors Account Key** fields:

![mr-learning-asa](images/mr-learning-asa/asa-02-section5-step3-1.png)

## Trying the basic behaviors of Azure Spatial Anchors

Now that your scene is configured to demonstrate the basics of Azure Spatial Anchors, it is time to deploy the app so you can experience Azure Spatial Anchors firsthand.

### 1. Add additional required capabilities

In the Unity menu, select **Edit** > **Project Settings...** to open the Player Settings window:

![mr-learning-asa](images/mr-learning-asa/asa-02-section6-step1-1.png)

In the Player Settings window, select **Player** and then **Publishing Settings**:

![mr-learning-asa](images/mr-learning-asa/asa-02-section6-step1-2.png)

In the  **Publishing Settings**, scroll down to the **Capabilities** section and double-check that the **InternetClient**, **Microphone**, and **SpatialPerception** capabilities, which you enabled when you created the project at the beginning of the tutorial, are enabled. Then, enable the **InternetClientServer**, **PrivateNetworkClientServer**, **RemovableStorage**, and **Webcam** capabilities:

![mr-learning-asa](images/mr-learning-asa/asa-02-section6-step1-3.png)

### 2. Deploy the app to your HoloLens 2

Azure Spatial Anchors can not run in Unity, so to test the Azure Spatial Anchors functionality, you need to deploy the project to your device.

> [!TIP]
> For a reminder on how to build and deploy your Unity project to HoloLens 2, you can refer to the [Building your application to your HoloLens 2](mr-learning-base-02.md#building-your-application-to-your-hololens-2) instructions.

### 3. Run the app on your HoloLens 2 and follow the in-app instructions

> [!CAUTION]
> Azure Spatial Anchors uses the internet to save and load the anchor data so make sure your device is connected to the internet.

When the application is running on your device, follow the on-screen instructions displayed on the Azure Spatial Anchor Tutorial Instructions panel:

![mr-learning-asa](images/mr-learning-asa/asa-02-section6-step3-1.png)

## Anchoring an experience

In the previous sections, you learned the fundamentals of Azure Spatial Anchors. We used a cube to represent and visualize the parent game object with the attached anchor. In this section, you will learn how to anchor an entire experience by placing it as a child of the ParentAnchor object.

### 1. Add the Rover Module experience

In the Project window, navigate to the **Assets** > **MRTK.Tutorials.GettingStarted** > **Prefabs** > **Rover** folder and select the **RoverExplorer_Complete** prefab:

![mr-learning-asa](images/mr-learning-asa/asa-02-section7-step1-1.png)

With the RoverModule_Complete prefab still selected, drag it on top of the **ParentAnchor** object in the Hierarchy window to make it a child of the ParentAnchor object:

![mr-learning-asa](images/mr-learning-asa/asa-02-section7-step1-2.png)

### 2. Reposition the Rover Module experience

Position, rotate, and scale the **RoverModule_Complete** object to a suitable scale and orientation, while also ensuring the **ParentAnchor** object is still exposed, for example:

* Transform **Position** X = 0, Y = 0, Z = 0
* Transform **Rotation** X = 0, Y = 0, Z = 0
* Transform **Scale** X = 10, Y = 10, Z = 10

![mr-learning-asa](images/mr-learning-asa/asa-02-section7-step2-1.png)

If you rebuild and deploy the application to your device, users can now reposition the entire Rover Module experience by moving the cube.

> [!TIP]
> There are a variety of user experience flows for repositioning experiences including the use of a repositioning object (such as the cube used in this tutorial), the use of a button to toggle a bounding box that surrounds the experience, the use of position and rotation gizmos, and more.

## Congratulations

In this tutorial, you learned the fundamentals of Azure Spatial Anchors. The tutorial provided you with several buttons that let you explore the various steps required to start and stop an Azure Spatial Anchors session and to create, upload, and download Azure Spatial Anchors on a single device.

In the next tutorial, you will learn how to save Azure anchor IDs to your HoloLens 2 for retrieval, even after the application is restarted, and how to transfer anchor IDs between multiple devices to achieve spatial alignment.

[Next Tutorial: 3. Saving, retrieving and sharing Azure Spatial Anchors](mr-learning-asa-03.md)

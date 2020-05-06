---
title: Azure Spatial Anchors tutorials - 2. Saving, retrieving, and sharing Azure Spatial Anchors
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
ms.localizationpriority: high
---

# 2. Create Holographic Remoting remote Application

In this tutorial you will learn how to create Holographic Remoting remote app and connect to HoloLens 2 at any point providing a way to visualize 3D content in Mixed Reality.

## Objectives

* Configure Unity for HoloLens Remoting
* Learn how to Build and deploy the application with Visual studio
* Installing the remote application and connecting to HoloLens

## Set up Holographic Remoting.

In the Project window, navigate to **Assets** > **MRTK.Tutorials.AppXHolograhicRemoting**> **Prefabs** folder, and select **Holographic Remote** prefab:



pic



With the prefab still selected, drag it into the Hierarchy window to add it to the scene:



pic



Now you need to Build and Deploy this Application to UWP, so that you can connect to HoloLens using this Application.

[!TIP]
For a reminder on how to Build the application, you can refer to the [Build your application to your device](https://docs.microsoft.com/en-us/windows/mixed-reality/mrlearning-base-ch1#build-your-application-to-your-device) instructions.

While Building the Application the Only changes need to be done are listed below.

select the  **Release** configuration instead of **debug**, 

select **XR64** architecture instead of **ARM**, 

and select **Local Machin** as target instead of Device:



pic



Press Ctrl+Shift+B, or select **Build** > **Build Solution** to Build the App.



## How to test application:

### Install the Remoting Player app in HoloLens

 	1. On your Microsoft HoloLens, visit the Store app and search for "**Remoting Player**".
      	2. Select the **Remoting Player app**.
         	3. Tap **Install* to start the download and install the Remoting Player app.



### Connect the remoting host sample to the Remoting Player

1. Start the **Remoting Player** on your Microsoft HoloLens.
2. Take note of the HoloLens **IP address**. It will be displayed as a hologram by the **Remoting Player** as soon as it launches.
3. Open Installed Application in your PC.
4. Once application is lunched Enter the **IP address** and click on connect button



## Congratulations

In this tutorial, you learned how to create Holographic Remoting remote app and connect to HoloLens 2 at any point providing a way to visualize 3D content in Mixed Reality. Once the HoloLens is connected to the Remote Application, you should see the Mixed Reality Experience that is been Streaming in the PC App. Mixed Reality Experience of this tutorial includes demonstration of UI elements, 3D model manipulation, model clipping and eye tracking features.  when **NextButton** and **PreviousButton** are pressed, the 3D model in the Scene will change. when Clicked on **ClippingObject** the Clipping Objects will appear and disappear. one of the Clipping Object and run over the 3D model to experience the Clipping feature. when you look at the part of the 3D model, a tool tip with the name will appear.




---
title: Standalone Holographic Remoting tutorials - 2. Create Standalone Holographic Remoting application
description: Complete this course to learn how to remote mixed reality experience form your PC to HoloLens 2.
author: jessemcculloch
ms.author: jemccull
ms.date: 05/19/2020
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
ms.localizationpriority: high
---

# 2. Create Standalone Holographic Remoting application

In this tutorial, you will learn how to create a PC app for Holographic Remoting and connect to HoloLens 2 at any point, providing a way to visualize 3D content in Mixed Reality.

## Objectives

* Configure Unity for Holographic Remoting
* Learn how to build and deploy the application with Visual Studio
* Installing the Holographic Remoting application and connecting to HoloLens

## Configuring your scene for Holographic Remoting

In this section, you will be configuring your project to stream your Mixed Reality experience on to your HoloLens 2 device from your PC in real-time over a WIFI connection.

In the Project window, navigate to **Assets** > **MRTK.Tutorials.AppXHolograhicRemoting**> **Prefabs** folder, and select-and-drag **HolographicRemoting** prefab into your scene.

![mr-learning-appx](images/mr-learning-appx/Tutorial2-Section1-Step1-1.png)

With the HolographicRemoting object still selected in the Hierarchy window, locate the **Holographic Remote Connect (Script)** component. The script uses HolographicRemoting API to connect, disconnect, and check the connection status.

Now your Holographic Remoting app is ready, follow these instructions to [build it to your PC](https://docs.microsoft.com/windows/mixed-reality/mrlearning-base-ch1#build-your-application-to-your-device).

Note: Apart from the **Player Settings** mentioned in the instructions, make the following changes that are specific for the Holographic Remoting application.

### 1. Select the Windows Mixed Reality **WSA Holographic Remoting Supported** checkbox

![mr-learning-appx](images/mr-learning-appx/Tutorial2-Section2-Step1-1.png)

### 2. Configuring Visual Studio for PC with the below settings

* Select the  **Release** configuration instead of debugging
* Select **X64** architecture instead of ARM
* Select **Local Machine** as the target instead of Device

![mr-learning-appx](images/mr-learning-appx/Tutorial2-Section2-Step1-3.png)

## How to test the Holographic Remoting remote application

To connect your Holographic Remoting PC application to your HoloLens 2, follow the below procedure:

### 1. Install the Remoting Player application in HoloLens 2 device

* On your Microsoft HoloLens, visit the Store app and search for "**Remoting Player**".
* Select the **Remoting Player app**.
* Tap **Install** to start downloading and install the Remoting Player app.

### 2. Connect the remoting host sample to the Remoting Player

* Start the **Remoting Player** on your Microsoft HoloLens.
* Take note of the HoloLens **IP address**. It will be displayed as a hologram by the **Remoting Player** as soon as it launches.
* Open the installed application on your PC.
* Once the application is launched, enter the **IP address** and click on the **Connect** button to connect.

## Congratulations

In this tutorial, you learned how to create a Holographic Remoting remote app and connect to HoloLens 2 at any point, providing a way to visualize 3D content in Mixed Reality. Once the HoloLens connected to the Holographic Remoting PC application, you should see the Mixed Reality experience that has been streaming into your HoloLens 2 device.

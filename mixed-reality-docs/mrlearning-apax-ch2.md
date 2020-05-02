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

# 2. How to create APPX HL remoting PC host app

In this tutorial, you will learn how to connect HoloLens through UWP or desktop app with simple way 

## Objectives

* Configure Unity for HoloLens Remoting
* Learn how to Build and deploy the application with Visual studio

## Set up Holographic Remoting.

In the Project window, navigate to **Assets** folder. While holding down the CTRL button, click on Remote to select the prefab:



pic



With the prefab still selected, drag them into the Hierarchy window to add them to the scene:



pic



In the Unity menu, select **File** > **Build Settings...** to open the Build Settings window, In the Build Settings window, select **Universal Windows Platform** and click the **Switch Platform** button and Wait for Unity to finish switching the platform:



pic



When Unity has finished switching the platform, click the red **x** icon to close the Build Settings window:

### Enable Mixed reality Remoting

In the Unity menu, select **Edit** > **Project Settings...** to open the Project Settings window, In the Project Settings window, select **Player** > **XR Settings** to expand the XR Settings, In the XR Settings, check the **Virtual Reality Supported** checkbox to enable virtual reality, then , click the **+** icon and select **Windows Mixed Reality** to add the Windows Mixed Reality SDK



pic



When Unity has finished adding the SDK, optimize the XR Settings as follows:

* Set Windows Mixed Reality **Depth Format** to **16-bit depth**
* Check the Windows Mixed Reality **Enable Depth Sharing** checkbox
* Set Stereo **Rendering Mode\*** to **Single Pass Instanced**
* Check the Windows Mixed Reality **WSA Holographic Remoting Supported** checkbox



pic



In the Project Settings window, select **Player** > **Publishing Settings** to expand the Publishing Settings, In the Publishing Settings, scroll down to the **Capabilities** section and check the below shown capability checkbox:

- Internet Clint server

- Internet Clint

- Web cam

- Spatial perception

- Private Network Client Server

  

pic



### Build the Unity project

In the Unity menu, select **File** > **Build Settings...** to open the Build Settings window.

In the Build Settings window, click the **Add Open Scenes** button to add your current scene to the **Scenes In Build** list, then click the **Build** button to open the Build Universal Windows Platform window:

In the Build Universal Windows Platform window, choose a suitable location to store your build



pic



Wait for Unity to finish the build process:



### Build and deploy the Holographic Remote application

When the build process is completed, Unity will prompt Windows File Explorer to open the location you stored the build. Navigate inside the folder, and double-click the solution file to open it in Visual Studio:



pic



> [!NOTE]
> If Visual Studio asks you to install new components, take a moment to ensure that all prerequisite components are installed as specified in the [Install the Tools](install-the-tools.md) documentation.

Configure Visual Studio for HoloLens  by selecting the  **Release** configuration, the **XR64** architecture, and **Local Machin** as target:



pic



> [!NOTE]
> If you don't see Device as an option you may need to change the default start up project from the IC2Lpp project to your UWP Project. In the **Solution Explorer**, right click on **yourprojectname (Universal Windows)** and select **Set as StartUp Project**. 



Press Ctrl+Shift+B, or select **Build** > **Build Solution**.



### How to test application:

### Install the Remoting Player app in HoloLens

 	1. On your Microsoft HoloLens, visit the Store app and search for "Remoting Player".
   	2. Select the Remoting Player app.
   	3. Tap **Install* to start the download and install the Remoting Player app.



### Connect the remoting host sample to the Remoting Player

1. Start the Remoting Player on your Microsoft HoloLens.
2. Take note of the HoloLens IP address. It will be displayed as a hologram by the Remoting Player soon after it launches.
3. Open .Build file in Windows files manager (Need to change)
4. Once application is lunched Enter the IP address and click on connect button

### 

## Congratulations

In this tutorial you learned how to connect HoloLens by creating UWP or Desktop app... 

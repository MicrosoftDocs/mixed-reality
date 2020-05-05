---
title: 6. Packaging & deploying to device or emulator
description: Part 6 of a tutorial to build a simple chess app using Unreal Engine 4 and the Mixed Reality Toolkit UX Tools plugin
author: sw5813
ms.author: suwu
ms.date: 5/5/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, mixed reality, tutorial, getting started, mrtk, uxt, UX Tools, documentation
---

# 6. Packaging & deploying to device or emulator

This section walks you through the steps of preparing your app to run on a HoloLens 2 device or Emulator. If you have a device, you can either stream from your computer to the device or package the app to run directly on the device. If you do not have a device, you will need to package the app for it to run on the Emulator. 

## Objectives

* [Device only] Stream your app to HoloLens 2 via holographic app remoting
* Package and deploy your app to a HoloLens 2 device or emulator

## [Device Only] Stream

1.	Install the **Holographic Remoting Player** from the Microsoft Store on your HoloLens 2 and run the app

2.	Go to **Edit > Project Settings**. In the Holographic Remoting section, check the box to enable remoting and restart the editor.

3.	Input the IP address of your device and click Connect.

4.	Once you’re connected, in your UE4 Editor, click the drop-down arrow to the right of the Play button and select VR Preview.

## Package and deploy your app 

1.	Go to **Edit > Project Settings**. Under **Project > Description > About > Project Name**, give your project a name. Under **Project > Description > Publisher > Company Distinguished Name** put “CN={INSERT COMPANY NAME}”. Leaving either of these fields blank will result in an error. 

![Project Settings - Description](images/unreal-uxt/6-cn.PNG)

2.	Under **Platforms > HoloLens** choose Emulation and/or Device based on which you want to target.

3.	In the **Packaging** section, next to **Signing Certificate**, click the **Generate new** button to generate a new signing certificate. Return to the Main window.

![Project Settings - Platforms - HoloLens](images/unreal-uxt/6-packaging.PNG)

4.	Go to **File > Package Project** and select **HoloLens**. Create a new folder to save your package in and click **Select Folder**. 

5.	Once the app has been successfully packaged, open the **Windows Device Portal**, go to **Views > Apps**, and find the **Deploy apps** section.

6.	Click**Browse...** and navigate to your **ChessApp.appxbundle** file. Click **Open**. 

    * If this is the first time you are installing the app on your device, check the box next to **Allow me to select framework packages**. In the next dialogue, include the appropriate VCLibs appx file (arm64 for device, x64 for emulator). 

7.	Click **Install**

Congratulations on finishing this tutorial!  
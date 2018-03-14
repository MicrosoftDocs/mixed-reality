---
title: Get apps for HoloLens
description: Describes installing apps for HoloLens, both via the Microsoft Store and side-loading.
author: mattzmsft
ms.author: mazeller
ms.date: 2/28/2018
ms.topic: article
keywords: sideload, side load, side-load, store, uwp, app, install
---



# Get apps for HoloLens

As a Windows 10 device, HoloLens supports many existing UWP applications from the app store, as well as new apps built specifically for HoloLens. On top of these, you may even want to [develop](development-overview.md) and install your own apps or those of your friends!

## Installing Apps

There are three ways to install new apps on your HoloLens. The primary method will be to install new applications from the Windows Store. However, you can also install your own applications using either the Device Portal or by deploying them from Visual Studio.

### From the Microsoft Store
1. Perform a [bloom](gestures.md#bloom) gesture to open the [Start Menu](navigating-the-windows-mixed-reality-home.md#start-menu).
2. Select the Store app and then tap to place this tile into your world.
3. Once the Store app opens, use the search bar to look for any desired application.
4. Select **Get** or **Install** on the application's page (a purchase may be required).

### Installing an application package with the Device Portal
1. Establish a connection from [Device Portal](using-the-windows-device-portal.md) to the target HoloLens.
2. Navigate to the **Apps** page in the left navigation.
3. Under **App Package** Browse to the .appx file associated with your application.
  >[!IMPORTANT]
  >Make sure to reference any associated dependency and certificate files.
4. Click **Go**.

![Install app form in Windows Device Portal on Microsoft HoloLens](images/deviceportal-appmanager.jpg)<br>
Using Windows Device Portal to install an app on HoloLens

### Deploying from Microsoft Visual Studio 2015
1. Open your app's Visual Studio solution (.sln file).
2. Open the project's **Properties** .
3. Select the following build configuration: Master/x86/Remote Machine.
4. When you select Remote Machine:
  - Make sure the address points to the HoloLens' WiFi IP address.
  - Set authentication to Universal (Unencrypted Protocol).
5. Build your solution.
6. Click the **Remote Machine** button to deploy the app from your development PC to your HoloLens. If you already have an existing build on the HoloLens, select yes to re-install this newer version.<br>
  ![Remote Machine deployment for apps to Microsoft HoloLens in Visual Studio](images/vs2015-remotedeployment.jpg)<br>
7. The application will install and auto launch on your HoloLens.

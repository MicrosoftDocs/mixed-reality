---
title: Deploy to device in Unreal
description: A guide to deploying to device in Unreal to HoloLens 2
author: sw5813
ms.author: suwu
ms.date: 7/10/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, mixed reality, deploy to device, PC, documentation
appliesto:
- HoloLens 2
---

# Deploy to device in Unreal

## Overview
There are two ways to deploy an Unreal application to HoloLens 2: 
* Directly from the Unreal editor
* As a package uploaded via the device portal

Both options require you to set up your HoloLens to use the [device portal](using-the-windows-device-portal.md) for development. 

## Deploying to device from the Unreal editor

1. Click the dropdown arrow next to the **Launch** button. Initially, the HoloLens device option will be grayed out.

![Launch dropdown options](images/unreal/launch-dropdown.png)

2. Open the **Device Manager**. Note that your HoloLens won't automatically appear in the device list.

3. Expand the **Add An Unlisted Device** section.

4. Select **HoloLens** as your **Platform**.

5. Enter your devices' IP address and port information separated by a colon as the device identifier. For example, "127.0.0.1:10080" (when connected via USB). Use your Device Portal username and password credentials.

6. Hit **Add** and close the device manager. 
    * In the case of an error (such as wrong address, user name or password), a message will be printed to the Output Log.

![Adding an unlisted device](images/unreal/add-unlisted-device.png)

7. Click the dropdown arrow next to the **Launch** button again - this time you should see the HoloLens device you just added. Select the HoloLens device to build and deploy to your HoloLens. 

>[!NOTE]
>Building for the device may involve recompiling shaders (especially on the first run)- this can take a while. Don't let the device go to sleep until the app is running (you may have to wear it). Otherwise shader compilation will fail!

## Deploying to device via device portal

You can find detailed instructions on [packaging and deploying an app](unreal-uxt-ch6.md#packaging-and-deploying-the-app-via-device-portal) in the last section of the Getting Started with Unreal tutorial series.

---
title: Deploy to device in Unreal
description: Learn everything you need to know about deploying your mixed reality Unreal apps to HoloLens 2 using the editor or device portal.
author: sw5813
ms.author: suwu
ms.date: 12/9/2020
ms.topic: article
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, mixed reality, deploy to device, PC, documentation, mixed reality headset, windows mixed reality headset, virtual reality headset
appliesto:
- HoloLens 2
---

# Deploy to device in Unreal

There are two ways to deploy an Unreal application to HoloLens 2:
* Directly from the Unreal editor
* As a package uploaded via the device portal

Both options require you to set up your HoloLens to use the [device portal](../advanced-concepts/using-the-windows-device-portal.md) for development.

## Deploying to device from the Unreal editor

1. Select the dropdown arrow next to the **Launch** button. Initially, the HoloLens device option will be grayed out.

![Launch dropdown options](images/unreal/launch-dropdown.png)

2. Open the **Device Manager** and note that your HoloLens won't automatically appear in the device list.

3. Expand the **Add An Unlisted Device** section.

4. Select **HoloLens** as your **Platform**.

5. Enter your devices' IP address and port information separated by a colon as the device identifier. For example, "127.0.0.1:10080" (when connected via USB). Use your Device Portal username and password credentials.

6. Hit **Add** and close the device manager.
    * If there's an error, such as wrong address or user credentials, a message will print to the Output Log.

![Adding an unlisted device](images/unreal/add-unlisted-device.png)

7. Select the dropdown arrow next to the **Launch** button again - this time you should see the HoloLens device you just added. Select the HoloLens device to build and deploy to your HoloLens.

>[!NOTE]
>Building for the device may involve recompiling shaders (especially on the first run)- this can take a while. Don't let the device go to sleep until the app is running (you may have to wear it). Otherwise shader compilation will fail!

## Deploying to device via device portal

You can find detailed instructions on packaging and deploying an app in the [Unreal tutorial series](tutorials/unreal-uxt-ch6.md#packaging-and-deploying-the-app-via-device-portal).

## Next Development Checkpoint

If you're following the Unreal development journey we've laid out, you're in the midst of the deployment stage. From here, you can continue to adding advanced services:

> [!div class="nextstepaction"]
> [Advanced services](unreal-development-overview.md#5-adding-services)

You can always go back to the [Unreal development checkpoints](unreal-development-overview.md#4-streaming-and-deploying-to-a-device) at any time.

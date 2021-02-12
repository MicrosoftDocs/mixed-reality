---
title: Installing PIX for HoloLens 2
description: Learn how to install PIX for HoloLens 2 devices.
author: hferrone
ms.author: flbagar
ms.date: 12/02/2020
ms.topic: article
keywords: HoloLens, HoloLens 2, PIX, capture, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Installing PIX for HoloLens 2

[PIX](https://devblogs.microsoft.com/pix) is a performance tuning and debugging tool for DirectX 12 applications on Windows. 

## Setup

1. Grab the latest PIX [release]( https://devblogs.microsoft.com/pix/download) from your host PC and connect your HoloLens 2 to your PC via a USB cable.

2. If your HoloLens 2 is on a [Windows Insider build](https://insider.windows.com) or has a configuration that breaks PIX,  [reflash your device](/hololens/hololens-recovery) to erase all data.

3. Enable **Developer Mode** and **Device Portal**:

* Open **Settings** from Mixed Reality Home:

![Screenshot of the HoloLens menu with settings button highlighted](images/pix-img-01.jpg)

* Select **Update & Security**:

![Screenshot of settings window open on HoloLens with update and security button highlighted](images/pix-img-02.jpg)

* Select **For Developers**:

![Screenshot of security and updates window open with for developers button highlighted](images/pix-img-03.jpg)

* Turn on **Use Developer Features** and **Enable Device Portal**

![Screenshot of for developers window open in settings with enable device portal button highlighted](images/pix-img-04.jpg)

![Screenshot of for developers window open in settings with use develop features toggle highlighted](images/pix-img-05.jpg)

* With the device still connected, awake, and with the user logged in, launch Visual Studio.

> [!IMPORTANT]
> Make sure your device isn't in standby mode or asleep. If you're having trouble with this step, refer to the [Windows Device Portal instructions](./using-the-windows-device-portal.md).

## Preparing for deployment

1. In Visual Studio, set **ARM64** as the platform and **Device** as the device:

![Screenshot of visual studios solution with platform and device settings highlighted](images/pix-img-06.png)

2. When Visual Studio prompts you for a **PIN** from the device:

![Screenshot of visual studio pop-up asking for PIN](images/pix-img-07.png)

* Select **Settings** from Shell
* Select **Update & Security**
* Select **For Developers** and press Pair under **Device Discovery** 

![Screenshot of for developers window open in settings with device discovery highlighted](images/pix-img-08.jpg)

![Screenshot of paid device pop-up with registration code highlighted](images/pix-img-09.jpg)

* Enter the generated PIN number in Visual Studio

3. Visual Studio will deploy the app to the connected HoloLens 2, which may take a few minutes depending on the app.

## Launching PIX

First, use Device Portal to verify the app isn't running on the HoloLens 2. Then, launch PIX, connect to your device, and select **Home**:

![Screenshot of PIX application home screen](images/pix-img-10.png)

* Select **Connect** from the left-side menu:

![Screenshot of PIX application left-side menu with connect button highlighted](images/pix-img-11.png)

2. From the **Computer** tab, select **Add**, and enter the following credentials:
    * Alias: Up to user’s discretion
    * Host Name or IP Address: 127.0.0.1

3. Select **Connect** in the lower right of the **Computer** tab:

![Screenshot of PIX application connect window with alias, host name, IP address, and add button highlighted](images/pix-img-12.png)

> [!NOTE]
> The first connection is always slower because binaries are being copied.

4. When PIX has connected to the HoloLens 2, find your app in the **Select Target Process** section in the Launch UWP tab, and select **Launch**:

![Screenshot of PIX application with the select target process window and launch button highlighted](images/pix-img-13.png)

## GPU captured

1. Start the GPU capture by clicking **Photo** in the **GPU Capture** section:

![Screenshot of the PIX application with the PC connection panel open with GPU capture highlighted](images/pix-img-14.png)

2. Open the capture for analysis by clicking on the generated screenshot in the **GPU Capture** panel:

![Screenshot of the PIX application with the GPU capture section open with GPU capture panel highlighted](images/pix-img-15.png)

3. Press **Start** to begin the analysis:

![Screenshot of the PIX application the start button highlighted](images/pix-img-16.png)

> [!IMPORTANT]
> If you collect timing data after taking a GPU capture, you'll be required to reboot the headset. This is a one-time restart of the device and is required for timing data collection.

PIX is now ready for use!

## See also
* [PIX homepage](https://devblogs.microsoft.com/pix)
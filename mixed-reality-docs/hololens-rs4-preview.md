---
title: HoloLens RS4 Preview
description: Learn more about the RS4 preview build for HoloLens, including how to install the preview, a description of the new features included, and how to provide feedback and get support.
author: mattzmsft
ms.author: mazeller
ms.date: 03/23/2018
keywords: HoloLens, preview, insider, os, rs4, new features
---

# HoloLens RS4 Preview

>[!IMPORTANT]
>By downloading *or* using the HoloLens RS4 preview builds, you are acknowledging and agreeing to the **HoloLens RS4 Preview – EULA (End User License Agreement)**, included in the preview program package.

In this article, you'll learn more about the HoloLens RS4 Preview, a preview of the Windows Holographic OS updates coming to the Windows 10 Spring Creators Update (also known as RS4). Any HoloLens owner who is interested in trying the preview is invited to give it a try, however, please remember that this is a preview build (not final software) and all the warnings that come along with that. If that doesn't worry you, follow the instructions below to install the HoloLens RS4 Preview and read about the new features it includes.

## Downloading the HoloLens RS4 Preview package

You can download the setup package from the [https://aka.ms/hololenspreviewdownload](https://aka.ms/hololenspreviewdownload).

## What's in the package?

| File | Description |
|------|------|
| rs4_release_svc_analog.retail.10.0.17110.1001.FFU | The HoloLens RS4 Preview image that you will flash to your device using the Windows Device Recovery Tool. |
| HoloLens RS4 Preview – EULA | HoloLens RS4 Preview - Evaluation Use Terms (End User License Agreement) |

## Installing the preview

1. On a retail HoloLens device (Windows Holographic 10.0.14393), opt-in to Insider Preview builds to prepare your device for the RS4 Preview:
   * Launch the **Settings** app -> **Update & Security** -> **Get Insider Preview builds** -> **Get started**.
   * Select Restart to restart the device to prepare to install Preview builds and wait until your device is once again booted.

>[!NOTE]
>If you need assistance getting your device back to a known state, refer to the [Reset & Recovery instructions](reset-or-recover-your-hololens.md).

2. Install an updated version of the **Windows Device Recovery Tool (WDRT)** from [https://aka.ms/wdrt](https://aka.ms/wdrt).

>[!NOTE]
>This preview requires WDRT version 3.14.07501 (or newer)

3. Flash the OS Preview Build using the Windows Device Recovery Tool:
   a. Launch Windows Device Recovery Tool from your Start menu or Desktop shortcut.
   b. Plug in your HoloLens device, and then select **Microsoft HoloLens** to continue.
   c. Select **Manual package selection** to select a custom OS image to use, then navigate to the .FFU file provided as part of the [Preview package](#downloading-the-hololens-rs4-preview-package).
   d. Confirm that the correct package is listed, and then select **Install software** to begin the OS installation.
   e. WARNING: this process will erase all the content on your HoloLens device; confirm by selecting **Continue**.
   f. The installation process will take a few minutes, during which a progress bar will be displayed on-screen.
   g. Once installation is complete, your device will reboot; select **Finish** to complete the process.
   h. You can confirm the new OS version on your device by selecting your device again in the tool, and verifying on the **Device info** page.

4. Go through the HoloLens on-device OOBE setup flow. Sign-in with your personal or work account to experience all the features of this Preview.

## New features in this preview

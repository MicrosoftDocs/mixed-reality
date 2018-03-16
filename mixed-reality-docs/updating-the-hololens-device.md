---
title: Updating the HoloLens device
description: How to update HoloLens and join the Windows Insider program for preview builds.
author: mattzmsft
ms.author: mazeller
ms.date: 2/28/2018
ms.topic: article
keywords: how-to, insider, preview, update, features, new release
---



# Updating the HoloLens device

Your HoloLens will automatically download and install system updates whenever it is plugged-in and connected to Wi-Fi, even when it is in standby. However, you can also trigger a system update manually if there is one available.

## Manual update

To perform a manual update:
* Open the **Settings** app.
* Navigate to **Update & Security** > **Device Update**.
* Select the **Check for updates** button.

If an update is available, it will start downloading the new version. Once the download is complete, select the **Restart Now** button to trigger the installation. If your device is below 40% and not plugged in, restarting will not start installing the update.

While your HoloLens is installing the update, it will display spinning gears and a progress indicator. Do not turn off your HoloLens during this time. It will reboot automatically once it has completed the installation.

You can verify the system version number by opening the **Settings** app and selecting **System** and then **About**. HoloLens currently supports applying only one update at a time, so if your HoloLens is more than one version behind the latest you may need to run through the update process multiple times to get it fully up to date.

## Opt in to Windows Insider program

To ensure you are receiving the latest updates to Windows Holographic, become a Windows Insider and opt in from the Update Settings page:
* Open the **Settings** app.
* Navigate to **Update & Security** > **Device Update**.
* Under the section **Get Insider Preview builds** select **Get started**.
* Select **Restart** to complete to enrollment process.

## Leaving the Windows Insider program

If you no longer want to receive the latest updates to Windows Holographic, you must [recover your device](reset-or-recover-your-hololens.md#perform-a-full-device-recovery) through the Windows Device Recovery Tool to go back to a pre-Windows Insider state.

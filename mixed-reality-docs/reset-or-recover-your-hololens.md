---
title: Reset or recover your HoloLens
description: Both basic and advanced instructions for rebooting or resetting your HoloLens.
author: mattzmsft
ms.author: mazeller
ms.date: 03/21/2018
ms.topic: article
keywords: how-to, reboot, reset, recover, hard reset, soft reset, power cycle, HoloLens, shut down
---



# Reset or recover your HoloLens

If you’re experiencing problems with your HoloLens you may want to try a restart, reset, or even re-flash with device recovery. This document will guide you through the recommended steps in succession.

## Perform a device reboot

If your HoloLens is experiencing issues or is unresponsive, first try rebooting it via one of the below methods.

### Perform a safe reboot via Cortana

The safest way to reboot the HoloLens is via Cortana. This is generally a great first-step when experiencing an issue with HoloLens:
1. Put on your device
2. Make sure it’s powered on, a user is logged in, and the device is not waiting for a password to unlock it.
3. Say “Hey Cortana, reboot” or "Hey Cortana, restart."
4. When she acknowledges she will ask you for confirmation. Wait a second for a sound to play after she has finished her question, indicating she is listening to you and then say “Yes.”
5. The device will now reboot/restart.

### Perform a safe reboot via Windows Device Portal

If the above doesn't work, you can try to reboot the device via [Windows Device Portal](using-the-windows-device-portal.md). In the upper right corner, there is an option to restart/shutdown the device.

### Perform a safe reboot via the power button

If you still can't reboot your device, you can try to issue a reboot via the power button:
1. Press and hold the power button for 5 seconds
   1. After 1 second, you will see all 5 LEDs illuminate, then slowly turn off from right to left
   2. After 5 seconds, all LEDs will be off, indicating the shutdown command was issued successfully
   3. Note, it’s important to stop pressing the button immediately after all the LEDs have turned off
2. Wait 1 minute for the shutdown to cleanly succeed. Note that the shutdown may still be in progress even if the displays are off
3. Power on the device again by pressing and holding the power button for 1 second

### Perform an unsafe forced reboot

If none of the above methods are able to successfully reboot your device, you can force a reboot. Note that this method is equivalent to pulling the battery from the HoloLens, and as such, is a dangerous operation which may leave your device in a corrupt state. 

>[!WARNING]
>This is a potentially harmful method and should only be used in the event none of the above methods work.

1. Press and hold the power button for at least 10 seconds
   * It’s okay to hold the button for longer than 10 seconds
   * It’s safe to ignore any LED activity
2. Release the button and wait 2-3 seconds
3. Power on the device again by pressing and holding the power button for 1 second

## Reset the device to a factory clean state

If your HoloLens is still experiencing issues after rebooting, you can try resetting it to a factory clean state. If you reset your device, all your personal data, apps, and settings will be erased. Resetting will only install the latest installed version of Windows Holographic and you will have to redo all the initialization steps (calibrate, connect to WiFi, create a user account, download apps, etc…).
1. Launch the **Settings** app -> **Update** -> **Reset**
2. Select the **Reset device** option and read the confirmation dialog
3. If you agree to reset your device, the device will reboot and display a set of spinning gears with a progress bar
4. Wait about 30 minutes for this process to complete
5. The reset will complete and the device will reboot into the out of the box experience

## Perform a full device recovery

If, after performing the above options, your device is **still** frozen, unresponsive, or experiencing update or software problems you can recover it using the Windows Device Recovery Tool. Recovering your device is similar to resetting it in the sense that it will erase all user content on the device, including apps, games, photos, user accounts, and more. If possible, backup any information you want to keep.

To fully recover your HoloLens:
1. Disconnect all phones and Windows devices from your PC
2. Install and launch the [Windows Device Recovery Tool](https://support.microsoft.com/en-us/help/12379/windows-10-mobile-device-recovery-tool-faq) (WDRT) on your PC
3. Connect your HoloLens to your PC using the micro-USB cable it came with
   * Note that not all USB cables are created equal. Even if you’ve been using another cable successfully, this flow will expose new states where the cable may not perform as well. The one your HoloLens came with is the best and most well tested option
4. If the tool automatically detects your device it will display a HoloLens tile. Click it and follow the instructions to complete the process

>[!NOTE]
>WDRT may recover your device to an older version of Windows Holographic; you may need to install updates after flashing

If the tool is unable to detect your device automatically, try the following:
1. Reboot your PC and try again (this fixes most issues)
2. Click the **My device was not detected button**, choose **Microsoft HoloLens**, and follow the rest of the instructions on the screen

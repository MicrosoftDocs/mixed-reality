---
title: HoloLens known issues
description: This is the list of known issues that may affect HoloLens developers.
author: mattzmsft
ms.author: mazeller
ms.date: 2/28/2018
ms.topic: article
keywords: troubleshoot, known issue, help
---



# HoloLens known issues

This is the current list of known issues for HoloLens affecting developers. Check here first if you are seeing an odd behavior. This list will be kept updated as new issues are discovered or reported, or as issues are addressed in future HoloLens software updates.

## Connecting to WiFi

During OOBE & Settings, there is a credential timeout of 2 mins. The username/password needs to be entered within 2 mins otherwise the username field will be automatically cleared.

We recommend using a Bluetooth keyboard for entering long passwords.

## Device Update
* 30 seconds after a new update, the shell may disappear one time. Please perform the **bloom** gesture to resume your session.

## Visual Studio
* See [Install the tools](install-the-tools.md) for the most up-to-date version of Visual Studio recommended for HoloLens development.
* When deploying an app from Visual Studio to your HoloLens, you may see the error: **The requested operation cannot be performed on a file with a user-mapped section open. (Exception from HRESULT: 0x800704C8)**. If this happens, try again and your deployment will generally succeed.

## Emulator
* Not all apps in the Microsoft Store are compatible with the emulator. For example, Young Conker and Fragments are not playable on the emulator.
* You cannot use the PC webcam in the Emulator.
* The Live Preview feature of the Windows Device Portal does not work with the emulator. You can still capture Mixed Reality videos and images.

## Unity
* See [Install the tools](install-the-tools.md) for the most up-to-date version of Unity recommended for HoloLens development.
* Known issues with the Unity HoloLens Technical Preview are documented in the [HoloLens Unity forums](http://forum.unity3d.com/threads/known-issues.394627/).

## Windows Device Portal
* The Live Preview feature in Mixed Reality capture may exhibit several seconds of latency.
* On the Virtual Input page, the Gesture and Scroll controls under the Virtual Gestures section are not functional. Using them will have no effect. The virtual keyboard on the same page works correctly.
* After enabling Developer Mode in Settings, it may take a few seconds before the switch to turn on the Device Portal is enabled.

## API
* If the application sets the [focus point](focus-point-in-unity.md) behind the user or the normal to camera.forward, holograms will not appear in Mixed Reality Capture photos or videos. Until this bug is fixed in Windows, if applications actively set the [focus point](focus-point-in-unity.md) they should ensure the plane normal is set opposite camera-forward (e.g. normal = -camera.forward).

## Xbox Wireless Controller
* Xbox Wireless Controller S must be updated before it can be used with HoloLens. Ensure you are [up to date](https://support.xbox.com/en-US/xbox-one/accessories/update-controller-for-stereo-headset-adapter) before attempting to pair your controller with a HoloLens.
* If you reboot your HoloLens while the Xbox Wireless Controller is connected, the controller will not automatically reconnect to HoloLens. The Guide button light will flash slowly until the controller powers off after 3 minutes. To reconnect your controller immediately, power off the controller by holding the Guide button until the light turns off. When you power your controller on again, it will reconnect to HoloLens.
* If your HoloLens enters standby while the Xbox Wireless Controller is connected, any input on the controller will wake the HoloLens. You can prevent this by powering off your controller when you are done using it.

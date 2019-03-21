---
title: HoloLens known issues
description: This is the list of known issues that may affect HoloLens developers.
author: mattzmsft
ms.author: mazeller
ms.date: 03/21/2018
ms.topic: article
keywords: troubleshoot, known issue, help
---



# HoloLens known issues

This is the current list of known issues for HoloLens affecting developers. Check here first if you are seeing an odd behavior. This list will be kept updated as new issues are discovered or reported, or as issues are addressed in future HoloLens software updates.

## Issues launching the Microsoft Store and Apps on HoloLens

[Last Update: 3/20 @ 10 PM] You may experience issues when trying to launch the Microsoft Store and Apps on HoloLens.  We’ve been investigating with the highest urgency and have determined that an automatic app update delivered a new version of the .NET Native Framework (version 10.0.25531 to 10.0.27413) that doesn’t correctly update for all apps consuming the prior version of the framework.  The flow for framework update is as follows: -

1.	The new framework package is downloaded from the store and installed
2.	All apps using the older framework are ‘updated’ to use the newer version

If step 2 is interrupted before completion then any apps for which the newer framework wasn’t registered will fail to launch from the start menu.  We believe the current impacted apps to be the Microsoft Store App and Apps on HoloLens.

At this point the only known mitigation is as follows:

1.	Open the Settings app and go to “Recovery”
2.	Select “Reset this device” -  Please note, this step will require devices to reapply a commercial license and considered the equivalent of a “clean flash”
3.	After the device has been updated, open the Microsoft Store, go to “settings” and set “Update apps automatically” to off. 
4.	On commercial devices, automatic app updates can be managed via the [ApplicationManagement/AllowAppStoreAutoUpdate policy](https://docs.microsoft.com/en-us/windows/client-management/mdm/policy-csp-applicationmanagement#applicationmanagement-allowappstoreautoupdate)

We are working around the clock to address this issue and believe we will have additional mitigations in the coming days. We’ll reach out with updates as we work towards a remedy.



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
* Xbox Wireless Controller S must be updated before it can be used with HoloLens. Ensure you are [up to date](https://support.xbox.com/xbox-one/accessories/update-controller-for-stereo-headset-adapter) before attempting to pair your controller with a HoloLens.
* If you reboot your HoloLens while the Xbox Wireless Controller is connected, the controller will not automatically reconnect to HoloLens. The Guide button light will flash slowly until the controller powers off after 3 minutes. To reconnect your controller immediately, power off the controller by holding the Guide button until the light turns off. When you power your controller on again, it will reconnect to HoloLens.
* If your HoloLens enters standby while the Xbox Wireless Controller is connected, any input on the controller will wake the HoloLens. You can prevent this by powering off your controller when you are done using it.

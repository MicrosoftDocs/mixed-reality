---
title: HoloLens known issues
description: This is the list of known issues that may affect HoloLens developers.
author: mattzmsft
ms.author: mazeller
ms.date: 04/1/2019
ms.topic: article
keywords: troubleshoot, known issue, help
---



# HoloLens known issues

This is the current list of known issues for HoloLens affecting developers. Check here first if you are seeing an odd behavior. This list will be kept updated as new issues are discovered or reported, or as issues are addressed in future HoloLens software updates.

## Issues launching the Microsoft Store and apps on HoloLens

>[!IMPORTANT]
>Last Update: 4/2 @ 10 AM - Issue resolved. 

You may experience issues when trying to launch the Microsoft Store and apps on HoloLens. We've determined that the issue occurs when background app updates deploy a newer version of framework packages in specific sequences while one or more of their dependent apps are still running. In this case,  an automatic app update delivered a new version of the .NET Native Framework (version 10.0.25531 to 10.0.27413) caused the apps that are running to not correctly update for all running apps consuming the prior version of the framework.  The flow for framework update is as follows: -

1.	The new framework package is downloaded from the store and installed
2.	All apps using the older framework are ‘updated’ to use the newer version

If step 2 is interrupted before completion then any apps for which the newer framework wasn’t registered will fail to launch from the start menu.  We believe any app on HoloLens could be affected by this issue.

Some users have reported that closing hung apps and launching other apps such as Feedback Hub, 3D Viewer or Photos resolves the issue for them - however, this does not work 100% of the time.

We have root caused that this issue was not caused the update itself, but a bug in the OS that resulted in the .NET Native framework update being handled incorrectly. We are pleased to announce that we have identified a fix and have released an update (OS version 17763.380) containing the fix. 

To see if your device can take the update please:

1.  Go to the “Settings” app and open “Update & Security”
2.  Click “Check for Updates”
3.  If update to 17763.380 is available, please update to this build to receive the fix for the App Hang bug
4.  Upon updating to this version of the OS, the Apps should work as expected.

Additionally, as we do with every HoloLens OS release, we have posted the FFU image to the Microsoft Download Center at https://aka.ms/hololensdownload/10.0.17763.380. 

If you would not like to take the update, we have released a new version of the Microsoft Store UWP app as of 3/29. Once you have the updated version of the Store:

1) Open the Store and confirm that it loads.
2) Use the Bloom Gesture to open the menu.
3) Attempt to open previously broken apps
3) If it still cannot be launched, tap and hold the icon of the broken app and select uninstall.
4) Resinstall these apps from the store.

If your device is still unable to load apps, you can sideload a version of the .NET Native Framework and Runtime through the download center by doing:

1)	Please download [this zip file](http://download.microsoft.com/download/8/5/C/85C23745-794C-419D-B8D7-115FBCCD6DA7/netfx_1.7.zip) from the Microsoft Download Center.  Unzipping will produce two files.  Microsoft.NET.Native.Runtime.1.7.appx and Microsoft.NET.Native.Framework.1.7.appx
2)	Please verify that your device is dev unlocked.  If you haven’t done that before the instructions to do that are [here](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Fwindows%2Fmixed-reality%2Fusing-the-windows-device-portal&data=02%7C01%7Cjalynch%40microsoft.com%7C3622a462ebd04870fccb08d6ae94cad6%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C636888351416725140&sdata=ZB6Zdx9GV95PcU6FAVgWaP3eQNMsyIc%2FbNDEby3Sb8A%3D&reserved=0).
3)	You then want to get into the Windows Device Portal.  Our recommendation is to do this over USB and you would do that by typing http://127.0.0.1:10080 into your browser.  
4)	Once you have the Windows Device Portal up we need you to “side load” the two files that you downloaded.  To do that you need to go down the left side bar until you get to the “Apps” section and click on “Apps”.
5)	You will then see a screen that is similar to the below.  You want to go to the section that says “Install App” and browse to where you unzipped those two APPX files.  You can only do one at a time, so after you select the first one, then click on “Go” under the Deploy section.  Then do this for the second APPX file. 
  ![Windows Device Portal to Install Side-Loaded app](images/20190322-DevicePortal.png)<br>
6)  At this point we believe your applications should start working again and that you can also get to the Store.
7)  In some cases, it is necessary run the additional step of launching the 3D Viewer app before affected apps will launch. 

We appreciate your patience as we have gone through the process to get this issue resolved, and we look forward to continued working with our community to create successful Mixed Reality experiences.

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

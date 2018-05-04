---
title: Release notes
description: HoloLens and Windows Mixed Reality release notes for the Windows 10 April 2018 Update (also known as RS4).
author: mattzmsft
ms.author: mazeller
ms.date: 05/04/2018
ms.topic: article
keywords: release notes, version, windows 10, build, rs4, os
---



# Release notes

The **[Windows 10 April 2018 Update](https://blogs.windows.com/windowsexperience/2018/04/30/whats-new-in-the-windows-10-april-2018-update)** (also known as RS4) includes new features for both HoloLens and Windows Mixed Reality immersive headsets connected to PCs. 

To update to the latest release for each device, open the **Settings** app, go to **Update & Security**, then select the **Check for updates** button. On a Windows 10 PC, you can also manually install the Windows 10 April 2018 Update using the [Windows media creation tool](https://www.microsoft.com/en-us/software-download/windows10).

>[!IMPORTANT]
>The Windows 10 RS4 Update for HoloLens has not yet been publicly released. However, you can install the [HoloLens RS4 Preview](hololens-rs4-preview) and try it early.

**Latest release for Desktop:** Windows 10 Desktop April 2018 Update (**10.0.17134.1**)<br>
**Latest release for HoloLens:** [Windows 10 Holographic August 2016](release-notes-august-2016.md) (**10.0.14393.0**, Windows 10 Anniversary Update)

## New features for Windows Mixed Reality immersive headsets

The Windows 10 April 2018 Update includes many improvements for using Windows Mixed Reality headsets with your desktop PC, such as: 

* **New environment for the Windows Mixed Reality home** - You can now choose between the Cliff House and the new Skyloft environment by selecting **Places** on the Start menu. We've also added an experimental feature that will let you use original environments you've created (more info coming soon).
* **Quick access to mixed reality capture** - You can now take mixed reality photos using a motion controller. Hold the Windows button and then tap the trigger. This works across environments and apps, but will not capture content protected with DRM.
* **New options for launching and resizing content** - Apps are now automatically placed in front of you when you launch them from the Start menu. You can also now resize 2D apps by dragging the edges and corners of the window.
* **Easily jump to content with "teleport" voice command** - You can now quickly teleport to be in front of content in the Windows Mixed Reality home by gazing at content and saying "teleport."
* **Animated 3D app launchers and decorative 3D objects for your home** - You can now add animation to 3D app launchers, and allow users to place decorative 3D models from a web page into the Windows Mixed Reality home.
* **Improvements to Windows Mixed Reality for SteamVR** - [Windows Mixed Reality for SteamVR](updating-your-steamvr-application-for-windows-mixed-reality.md) is out of "early access" with new upgrades, including: haptic feedback when using motion controllers, improved performance and reliability, and improvements to the appearance of motion controllers in SteamVR.
* **Other improvements** - Automatic performance settings have been updated to provide a more optimized experience (you can [manually override](#visual-quality) this setting). Setup now provides more detailed information about common compatibility issues with USB 3.0 controllers and graphics cards.

## New features for HoloLens

The Windows 10 April 2018 Update has not yet publicly launched on HoloLens, but you can install the [HoloLens RS4 Preview](hololens-rs4-preview) and try it early. New features are documented on the [HoloLens RS4 Preview](hololens-rs4-preview) page, and will be added to these release notes when the update is publicly availalbe for HoloLens.

## Known issues

We've worked hard to deliver a great Windows Mixed Reality experience, but we're still tracking some known issues. If you find others, please [Give us feedback](give-us-feedback.md).

### Visual quality

If you notice after the Windows 10 April 2018 Update that graphics are more blurry than before, or that the field of view looks smaller on your headset, the automatic performance setting may have been changed in order to maintain a sufficient framerate on a less powerful graphics card (such as Nvidia 1050). You can manually override this (if you choose) by navigating to **Settings > Mixed reality > Headset display > Experience options > Change** and changing "Automatic" to "90 Hz." You can also try changing **Visual quality** (on the same Settings page) to "High."

### Windows Mixed Reality setup

* When setting up Windows with a headset connected, your PC monitor may go blank. Unplug your headset to enable output to your PC monitor to complete Windows setup.
* If you do not have headphones connected, you may miss additional tips when you first visit the Windows Mixed Reality home.
* Other Bluetooth devices can cause interference with motion controllers. If the motion controllers have connection/pairing/tracking issues, make sure the Bluetooth radio (if an external dongle) is plugged in to an unobstructed location and not immediately next to another Bluetooth dongle. Also try powering down other Bluetooth peripherals during Windows Mixed Reality sessions to see if it helps.

### Games and apps from the Microsoft Store

Some graphically intensive games, like Forza Motorsport 7, may cause performance issues on less capable PCs when played inside Windows Mixed Reality.

### Audio

* If you have Cortana enabled on your host PC prior to using your Windows Mixed Reality headset, you may lose spatial sound simulation applied to the apps you place around the Windows Mixed Reality home. The work around is to enable "Windows Sonic for Headphones" on all the audio devices attached to your PC, even your headset-connected audio device:
   1. Left-click the speaker icon on the desktop taskbar and select from list of audio devices.
   2. Right-click the speaker icon on the desktop taskbar and select "Windows Sonic for Headphones" in the "Speaker setup" menu.
   3. Repeat these steps for all of your audio devices (endpoints).

>[!NOTE]
>Another option is turning off "Let Cortana respond to Hey Cortana" in **Settings** > **Cortana** on your desktop prior to launching Windows Mixed Reality.

* When another multimedia USB device (such as a web cam) shares the same USB hub (either external or inside your PC) with the Windows Mixed Reality headset, in rare cases the headset's audio jack/headphones may either have a buzzing sound or no audio at all. You can fix this by your headset into a USB port that does not share the same hub as the other device, or disconnect/disable your other USB multimedia device.
* In very rare cases, the host PC's USB hub cannot provide enough power to the Windows Mixed Reality headset and you may notice a burst of noise from the headphones connected to the headset.

### Holograms

If you've placed a large number of holograms in your Windows Mixed Reality home, some may disappear and reappear as you look around. To avoid this, remove some of the holograms in that area of the Windows Mixed Reality home.

### Motion controllers

Occasionally, when you click on a web page in Microsoft Edge, the content will zoom instead of click.

### Desktop app in the Windows Mixed Reality home

* Snipping Tool does not work in Desktop app.
* Desktop app does not persist setting on re-launch.
* If you're using Mixed Reality Portal preview on your desktop, when opening the Desktop app in the Windows Mixed Reality home, you may notice the infinite mirror effect. 
* Running the Desktop app may cause performance issues on non-Ultra Windows Mixed Reality PCs; it is not recommended.  
* Desktop app may auto-launch because an invisible window on Desktop has focus. 
* Desktop User Account Control prompt will make headset display black until the prompt is completed.

### Windows Mixed Reality for SteamVR

* You may need to launch Mixed Reality Portal after updating to ensure the necessary software updates for the Windows 10 April 2018 Update have completed before launching SteamVR. 
* You must be on a recent version of Windows Mixed Reality for SteamVR to remain compatible with the Windows 10 April 2018 Update. Make sure automatic updates are turned on for Windows Mixed Reality for SteamVR, which is located in the "Software" section of your library in Steam.  

### Other issues

>[!IMPORTANT]
>An early version of the Windows 10 April 2018 Update pushed to Insiders (version 17134.5) was missing a piece of software necessary to run Windows Mixed Reality. We recommend avoiding this version if using Windows Mixed Reality. 

We've identified a performance regression when using Surface Book 2 on the initial release of this update (10.0.17134.1) that we are working to fix in an upcoming update patch. We suggest waiting until this has been fixed before updating manually or waiting for the update to roll out normally.  

## Prior release notes

* [Release notes - October 2017](release-notes-october-2017.md)
* [Release notes - August 2016](release-notes-august-2016.md)
* [Release notes - May 2016](release-notes-may-2016.md)
* [Release notes - March 2016](release-notes-march-2016.md)

## See also
* [Immersive headset support (external link)](https://docs.microsoft.com/en-us/windows/mixed-reality/enthusiast-guide/troubleshooting-windows-mixed-reality)
* [HoloLens RS4 Preview](hololens-rs4-preview.md)
* [Install the tools](install-the-tools.md)
* [Give us feedback](give-us-feedback.md)


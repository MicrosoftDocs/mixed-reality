---
title: Release notes - RS4
description: HoloLens and Windows Mixed Reality release notes for the Windows 10 XXX Update (XXX 2018).
author: mattzmsft
ms.author: mazeller
ms.date: 03/21/2018
ms.topic: article
keywords: 
---



# Release notes - RS4

Welcome to Windows Mixed Reality! The release of the **[Windows 10 April 2018 Update](https://blogs.windows.com/windowsexperience/2018/04/27/make-the-most-of-your-time-with-the-new-windows-10-update)** includes new features for both HoloLens and Windows Mixed Reality immersive headsets on desktops. 

To update to the latest release for each device, open the **Settings** app, go to **Update & Security**, then select the **Check for updates** button. On a Windows 10 PC, you can also manually install the Windows 10 April 2018 Update using the [Windows media creation tool](https://www.microsoft.com/en-us/software-download/windows10).

 **Latest release for Desktop:** Windows 10 Desktop April 2018 Update (**10.0.16299.15**, Windows 10 Fall Creators Update)
 **Latest release for HoloLens:** [Windows 10 Holographic August 2016](release-notes-august-2016.md) (**10.0.14393.0**, Windows 10 Anniversary Update)

>[!VIDEO https://www.youtube.com/embed/YBcLy1lkegg]

## Windows Mixed Reality immersive headsets

The Windows 10 April 2018 Update includes many improvements for using Windows Mixed Reality headsets with your desktop PC, such as: 

* A brand-new environment called Sky Loft that you can navigate to by selecting Places on the Mixed Reality Start menu.
* Support for haptic feedback when using motion controllers in SteamVR games in combination with the latest version of SteamVR bridge for Windows Mixed Reality
* Improved performance in SteamVR games with lower video RAM usage. Live video preview in the Mixed Reality Portal on desktop is also more performant. 
* You can now take mixed reality photos directly from your controller by holding the Windows button and then tapping the trigger. This works across environments and apps except for capturing content protected with DRM.
* The automatic performance settings have been updated to provide an optimized experience, and we’ve added a new setting to override the default in Settings > Mixed Reality > Headset display.
* Setup now provides more detailed information about common compatibility issues with USB3.0 controllers and graphics cards.

## Known issues

We've worked hard to deliver a great Windows Mixed Reality experience, but we're still tracking some known issues. If you find others, please [Give us feedback](give-us-feedback.md).

### Desktop app in the Windows Mixed Reality home
* Snipping Tool does not work in Desktop app.
* Desktop app does not persist setting on re-launch.
* If you're using Mixed Reality Portal preview on your desktop, when opening the Desktop app in the Windows Mixed Reality home, you may notice the infinite mirror effect. 
* Running the Desktop app may cause performance issues on non-Ultra Windows Mixed Reality PCs; it is not recommended.  
* Desktop app may auto-launch because an invisible window on Desktop has focus. 
* Desktop User Account Control prompt will make headset display black until the prompt is completed.

### Windows Mixed Reality setup
* When setting up Windows with a headset connected, your PC monitor may go blank. Unplug your headset to enable output to your PC monitor to complete Windows setup.
* When creating a boundary, tracing may fail. If so, try again, as the system will learn more about your space over time.
* If you turn Cortana on or off during Windows Mixed Reality setup, this change will be applied to your desktop Cortana settings.
* If you do not have headphones connected, you may miss additional tips when you first visit the Windows Mixed Reality home.
* Bluetooth headphones can cause interference with motion controllers. We recommend unpairing or powering down other Bluetooth peripherals during Windows Mixed Reality sessions and making sure your computer's Bluetooth radio is in an unobstructed location.

### Games and apps from Windows Store
* Some graphically intensive games, like Forza Motorsports 6, may cause performance issues on less capable PCs when played inside Windows Mixed Reality.

### Audio
* As noted above, Bluetooth Audio peripherals do not work well with Windows Mixed Reality voice and spatial sound experiences. They can also negatively affect your motion controller experience. WE do not recommend using Bluetooth Audio headsets with Windows Mixed Reality.
* Some applications, including many of those launched through SteamVR, can lose audio or hang when the audio device changes as you start or stop the Mixed Reality Portal. Restart the app after you have opened the Mixed Reality Portal app to correct this.
* If you have Cortana enabled on your host PC prior to using your Windows Mixed Reality headset, you may lose the spatial sound simulation applied to the apps you place around the Windows Mixed Reality home. The work around is to enable "Windows Sonic for Headphones" on all the audio devices attached to your PC, even your headset-connected audio device:
   1. Left-click the speaker icon on the desktop taskbar and select from list of audio devices.
   2. Right-click the speaker icon on the desktop taskbar and select "Windows Sonic for Headphones" in the "Speaker setup" menu.
   3. Repeat these steps for all of your audio devices (endpoints).
>[!NOTE]
> - Another option is to turn off "Let Cortana respond to Hey Cortana" in **Settings** > **Cortana** on your desktop prior to launching Windows Mixed Reality.

* When another multimedia USB device (such as a web cam) shares the same USB hub (either external or inside your PC) with the Windows Mixed Reality headset, in rare cases the headset's audio jack/headphones may either have a buzzing sound or no audio at all. You can fix this by your headset into a USB port that does not share the same hub as the other device, or disconnect/disable your other USB multimedia device.
* In very rare cases, the host PC's USB hub cannot provide enough power to the Windows Mixed Reality headset and you may notice a burst of noise from the headphones connected to the headset.

### Speech
* Cortana may fail to play her audio cues for listening/thinking and audio responses to commands.
* Cortana in China and Japan markets do not correctly show text below the Cortana circle during use.
* Cortana can be slow the first time she is invoked in a Mixed Reality Portal session. You can work around this by making sure "Let Cortana respond to Hey Cortana" under **Settings** > **Cortana** > **Talk to Cortana** is enabled.
* Cortana may run slower on PCs that are not Windows Mixed Reality Ultra PCs.
* When your system keyboard is set to a language different from the UI language in Windows Mixed Reality, using dictation from the keyboard in Windows Mixed Reality will result in an error dialog about dictation not working due to not having Wi-Fi connection. To fix the issue simply make sure the system keyboard language matches the Windows Mixed Reality UI language.
* Spain is not correctly being recognized as a market where speech is enabled for Windows Mixed Reality.

### Holograms
* If you've placed a large number of holograms in your Windows Mixed Reality home, some may disappear and reappear as you look around. To avoid this, remove some of the holograms in that area of the Windows Mixed Reality home.

### Motion controllers
* Occasionally, if you click on a webpage in Edge, the content will zoom instead of click.
* Sometimes when you click on a link in Edge, the selection won't work.

## Prior release notes
* [Release notes - October 2017] (release-notes-october-2017.md)
* [Release notes - August 2016](release-notes-august-2016.md)
* [Release notes - May 2016](release-notes-may-2016.md)
* [Release notes - March 2016](release-notes-march-2016.md)

## See also
* [Immersive headset support (external link)](https://docs.microsoft.com/en-us/windows/mixed-reality/enthusiast-guide/troubleshooting-windows-mixed-reality)
* [HoloLens known issues](hololens-known-issues.md)
* [Install the tools](install-the-tools.md)
* [Give us feedback](give-us-feedback.md)


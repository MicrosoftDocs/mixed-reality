---
title: Release notes - October 2017
description: Stay up to date on the Windows Mixed Reality release notes for the Windows 10 Fall Creators Update (October 2017).
author: mattzmsft
ms.author: mazeller
ms.date: 03/21/2018
ms.topic: article
keywords: release notes, version, windows 10, build, rs3, os
---

# Release notes - October 2017

Welcome to Windows Mixed Reality! The **[Windows 10 Fall Creators Update](https://blogs.windows.com/windowsexperience/2017/10/17/whats-new-windows-10-fall-creators-update/)** release introduces support for new [Windows Mixed Reality immersive headsets](/windows/mixed-reality/discover/immersive-headset-hardware-details) and [motion controllers](/windows/mixed-reality/design/motion-controllers). You can now explore new worlds, play VR games, and experience immersive entertainment when connected to a [Windows Mixed Reality capable PC](./windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md).

The Windows Mixed Reality headsets and motion controllers release is the culmination of a massive team effort and a major step forward for the [Windows Mixed Reality platform](/windows/mixed-reality/discover/mixed-reality), including [Microsoft HoloLens](/windows/mixed-reality/hololens-hardware-details). While HoloLens isn't receiving an update with the Windows 10 Fall Creators Update, work on HoloLens hasn't stopped. We'll have a lot of learnings and insight to apply from our recent work across Windows Mixed Reality as a whole. In fact, Windows Mixed Reality immersive headsets and motion controllers represent a great entry point to development for HoloLens too, as the same APIs, tools, and concepts apply to both.

To update to the latest release for each device, open the **Settings** app, go to **Update & Security**, then select the **Check for updates** button. On a Windows 10 PC, you can also manually install the Windows 10 Fall Creators Update using the [Windows media creation tool](https://www.microsoft.com/software-download/windows10).

 **Latest release for Desktop:** Windows 10 Desktop October 2017 (**10.0.16299.15**, Windows 10 Fall Creators Update)<br>
 **Latest release for HoloLens:** [Windows 10 Holographic August 2016](release-notes-august-2016.md) (**10.0.14393.0**, Windows 10 Anniversary Update)

>[!VIDEO https://www.youtube.com/embed/YBcLy1lkegg]

## Introducing Windows Mixed Reality

The Windows 10 Fall Creators Update officially introduces support for Windows Mixed Reality headsets and motion controllers, and making Windows 10 the world's first spatial operating system. Here are the highlights:
* **[Variety of headsets](https://blogs.windows.com/windowsexperience/2017/10/03/how-to-pre-order-your-windows-mixed-reality-headset/)** - Windows Mixed Reality is enabling partners to offer different headset types starting at $399 USD bundled with motion controllers.
* **[Motion controllers](/windows/mixed-reality/design/motion-controllers)** - Windows Mixed Reality motion controllers wirelessly pair with your PC via Bluetooth and feature six degrees-of-freedom tracking, plenty of input methods, and IMUs.
* **[Easy setup and portability](./recommended-adapters-for-windows-mixed-reality-capable-pcs.md)** - Set up and get started in under 10 minutes. Immersive headsets use inside-out tracking to track your movement, and your motion controllers, with six degrees-of-freedoms. No external cameras or lighthouse markers required!
* **[Support for a wider range of PCs](./windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md)** - Windows Mixed Reality will allow more people to experience desktop VR than ever before, with support for select integrated graphics cards and PCs starting at $499 USD.
* **[Windows Mixed Reality home](/windows/mixed-reality/discover/navigating-the-windows-mixed-reality-home)** - The world's first spatial operating system provides a familiar home environment for multi-tasking with 2D apps, launching VR games and apps, and placing decorative holograms.
* **[Amazing VR games and apps in the Microsoft Store](https://www.microsoft.com/store/collections/MR-All-ImmersiveContent/)** - From immersive entertainment like Hulu VR and 360 video to epic games like SUPERHOT VR and Arizona Sunshine, the Microsoft Store has a range of content to experience in Windows Mixed Reality.
* **[SteamVR Early Access](./using-steamvr-with-windows-mixed-reality.md)** - The Windows 10 Fall Creators Update enables support for SteamVR titles to be played with Windows Mixed Reality headsets and controllers, making the largest catalog of VR titles available to Windows Mixed Reality users.

## Known issues

We've worked hard to deliver a great Windows Mixed Reality experience, but we're still tracking some known issues. If you find others, [give us feedback](/windows/mixed-reality/give-us-feedback).

### Desktop app in the Windows Mixed Reality home
* Snipping Tool doesn't work in Desktop app.
* Desktop app doesn't persist setting on relaunch.
* If you're using Mixed Reality Portal preview on your desktop, when opening the Desktop app in the Windows Mixed Reality home, you may notice the infinite mirror effect. 
* Running the Desktop app may cause performance issues on non-Ultra Windows Mixed Reality PCs; it isn't recommended.  
* Desktop app may auto-launch because an invisible window on Desktop has focus. 
* Desktop User Account Control prompt will make headset display black until the prompt is completed.

### Windows Mixed Reality setup
* When setting up Windows with a headset connected, your PC monitor may go blank. Unplug your headset to enable output to your PC monitor to complete Windows setup.
* When creating a boundary, tracing may fail. If so, try again, as the system will learn more about your space over time.
* If you turn Cortana on or off during Windows Mixed Reality setup, this change will be applied to your desktop Cortana settings.
* If you don't have headphones connected, you may miss tips when you first visit the Windows Mixed Reality home.
* Bluetooth headphones can cause interference with motion controllers. We recommend unpairing or powering down Bluetooth controllers during Windows Mixed Reality sessions.

### Games and apps from Windows Store
* Some graphically intensive games, like Forza Motorsports 6, may cause performance issues on less capable PCs when played inside Windows Mixed Reality.

### Audio
* As noted above, Bluetooth Audio peripherals don't work well with Windows Mixed Reality voice and spatial sound experiences. They can also negatively affect your motion controller experience. We do not recommend using Bluetooth Audio headsets with Windows Mixed Reality.
* You can't use the audio device connected to (or part of) the headset for audio playback when the device isn't being worn. If you only have one audio headset, you may want to connect the audio headset to the host PC instead of the headset. If so, then you must turn off "switch to headset audio" in **Settings** > **Mixed Reality** > **Audio and speech**.
* Some applications, including many of those launched through SteamVR, can lose audio or hang when the audio device changes as you start or stop the Mixed Reality Portal. Restart the app after you've opened the Mixed Reality Portal app to correct this.
* If Cortana is enabled on your host PC before you use your Windows Mixed Reality headset, you may lose the spatial sound simulation applied to the apps you place around the Windows Mixed Reality home. The work-around is to enable "Windows Sonic for Headphones" on all the audio devices attached to your PC, even your headset-connected audio device:
   1. Left-click the speaker icon on the desktop taskbar and select from list of audio devices.
   2. Right-click the speaker icon on the desktop taskbar and select "Windows Sonic for Headphones" in the "Speaker setup" menu.
   3. Repeat these steps for all of your audio devices (endpoints).
>[!NOTE]
> - Because the headphones/speakers connected to your headset won't appear unless you're wearing it, you have to do this from within the Desktop app window in the Windows Mixed Reality home to apply this setting to the audio device connected to your headset (or integrated into your headset).
> - Another option is to turn off "Let Cortana respond to Hey Cortana" in **Settings** > **Cortana** on your desktop prior to launching Windows Mixed Reality.

* When another multimedia USB device (such as a web cam) shares the same USB hub (either external or inside your PC) with the Windows Mixed Reality headset, in rare cases the headset's audio jack/headphones may either have a buzzing sound or no audio at all. You can fix this by your headset into a USB port that doesn't share the same hub as the other device, or disconnect/disable your other USB multimedia device.
* In rare cases, the host PC's USB hub can't provide enough power to the Windows Mixed Reality headset and you may notice a burst of noise from the headphones connected to the headset.

### Speech
* Cortana may fail to play her audio cues for listening/thinking and audio responses to commands.
* Cortana in China and Japan markets does not correctly show text below the Cortana circle during use.
* Cortana can be slow the first time she's invoked in a Mixed Reality Portal session. You can work around this by making sure "Let Cortana respond to Hey Cortana" under **Settings** > **Cortana** > **Talk to Cortana** is enabled.
* Cortana may run slower on PCs that aren't Windows Mixed Reality Ultra PCs.
* When your system keyboard is set to a language different from the UI language in Windows Mixed Reality, using dictation from the keyboard in Windows Mixed Reality will result in an error dialog about dictation not working because of not having Wi-Fi connection. To fix the issue, make sure the system keyboard language matches the Windows Mixed Reality UI language.
* Spain isn't correctly being recognized as a market where speech is enabled for Windows Mixed Reality.

### Holograms
* If you've placed a large number of holograms in your Windows Mixed Reality home, some may disappear and reappear as you look around. To avoid this, remove some of the holograms in that area of the Windows Mixed Reality home.

### Motion controllers
* Occasionally, if you select a webpage in Edge, the content will zoom instead of click.
* Sometimes when you select a link in Edge, the selection won't work.

## Prior release notes
* [Release notes - August 2016](release-notes-august-2016.md)
* [Release notes - May 2016](release-notes-may-2016.md)
* [Release notes - March 2016](release-notes-march-2016.md)

## See also
* [Immersive headset support (external link)](./troubleshooting-windows-mixed-reality.md)
* [HoloLens known issues](/windows/mixed-reality/hololens-known-issues)
* [Install the tools](/windows/mixed-reality/develop/install-the-tools)
* [Give us feedback](/windows/mixed-reality/give-us-feedback)
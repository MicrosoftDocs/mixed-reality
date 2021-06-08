---
title: Software overview and release history
description: An overview of the major software components for Windows Mixed Reality, immersive headsets, and their release history.
author: hferrone
ms.author: v-hferrone
ms.date: 09/15/2020
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, software components, release history, release notes, version history
appliesto:
    - Windows 10
---

# Mixed Reality software overview and release history

## Introduction to Mixed Reality software

Windows Mixed Reality consists of the following major software components:

1. **Mixed Reality Portal**, which provides the main Windows Mixed Reality experience
    * In Windows 10 versions 1709 and 1803, Mixed Reality Portal is a key component of the Windows 10 operating system updated via Windows Update.
    * In Windows 10 version 1809 and newer, Mixed Reality Portal is updated via the Microsoft Store app.
2. The **Mixed Reality feature-on-demand package** (FOD), automatically downloaded and installed during Mixed Reality Portal's first-run. More information about the FOD package can be found [here](/windows/application-management/manage-windows-mixed-reality)
3. The **Mixed Reality headset and motion controller driver**, also known as the HoloLens Sensors driver, is the key driver package that enables Windows Mixed Reality headsets to work with Windows Mixed Reality. This is automatically downloaded and installed via Windows Update the first time your Mixed Reality headset is plugged in, and is regularly updated via Windows Update
4. The **Mixed Reality motion controller model drivers contain the 3D models of the Mixed Reality motion controllers and needed for third-party Mixed Reality experiences. This is automatically downloaded and installed via Windows Update the first time your Mixed Reality motion controllers are paired to your PC, and is updated via Windows Update
5. **Windows 10, version 1709 (the Fall Creator's Update) or newer** contains key OS components and technologies that enable Windows Mixed Reality

Using Windows Mixed Reality in SteamVR requires the following software:

6. **SteamVR**, developed and maintained by Valve Corporation that enables virtual reality apps and games on Steam. More information can be found [here](https://go.microsoft.com/fwlink/?linkid=862788)
7. The **Windows Mixed Reality for SteamVR** component, which bridges SteamVR with Windows Mixed Reality. More information about this component can be found [on the Windows Mixed Reality for SteamVR page](http://store.steampowered.com/app/719950/Windows_Mixed_Reality_for_SteamVR/)

Managing your Windows Mixed Reality headset:

8. The **Device Companion App**, developed and maintained by each of the headset manufacturers, provides a quick introduction to your Windows Mixed Reality headset. On headsets with built-in Bluetooth capability, the Device Companion app enables restoring Motion Controllers to their factory Bluetooth pairing. Some headsets (such as the Samsung Odyssey, and Samsung Odyssey+) also use the Device Companion App to deliver headset firmware updates from the headset manufacturer. This app is downloaded automatically the first time your headset is plugged in and can be found in the Windows Start Menu.

## Windows 10 release notes - May 2020

The **Windows 10 May 2020 Update (v2004)** includes new features for Windows Mixed Reality (VR) headsets, such as the ability to launch Win32 applications in the mixed reality home. HoloLens (1st gen) is in Long Term Servicing (LTS), with servicing updates to be released monthly.

Upgrading to the latest PC release for Windows Mixed Reality immersive (VR) headsets, open **Settings > Update & Security** and select **Check for updates**. On a Windows 10 PC, you can also manually install the **Windows 10 May 2020 Update** using the [Windows media creation tool](https://www.microsoft.com/software-download/windows10).

**Latest release for Desktop**: Windows 10 v2004 (10.0.19041.264)

### Updates for Windows Mixed Reality immersive headsets

#### Introducing the new Microsoft Edge

As [previously announced](/windows/mixed-reality/new-microsoft-edge), we've made updates to better support using the new Microsoft Edge browser in Windows Mixed Reality. The new Microsoft Edge adopts the Chromium open-source project to create better web compatibility for customers and less fragmentation of the web for all web developers. It also supports WebXR, the new standard for creating immersive web experiences for VR headsets, in place of WebVR.

#### Improved Settings for WMR

Thanks to your feedback, we've added and clarified settings on the Headset display page:

* **Visual quality of my home** - changing these settings affects only the mixed reality home environment (Cliff House and Skyloft):

* **Adjust level of detail and quality of effects in the mixed reality home** - this changes some of the rendering affects we use in the home. In particular, the visual quality of different materials (wood, concrete, and so on) will scale as you change this setting from low to high.

* **Change app window resolution** - by default, most 2D windows launched in the home are launched with a 720-p resolution. While you can manually resize them horizontally & vertically, you can also opt to have them all launch at 1080p instead. Previously this option was available as the Very high (beta) option under Visual quality. We've appropriately split it out as a separate setting now.

* **Experience options** - these options adjust the mixed reality experience to reduce load on systems where the hardware might struggle to keep up with an unrestricted 90 fps. You can explicitly enable or disable these additional settings, or choose Let Windows decide and let our heuristics continue deciding when to toggle these on and off.

* **Resolution** - if you have a high-resolution headset like the HP Reverb, we support running it at its native resolution, or at a reduced resolution for performance reasons. Earlier headsets, like the Samsung Odyssey and Odyssey+, only support a single resolution so you can't change this setting on those headsets.

* **Frame rate** - you can now manually set the frame rate of the headset display, or continue to let Windows use its heuristics to determine if 60 Hz or 90 Hz is more appropriate.

* **Calibration** - as before, you can adjust your IPD (interpupillary distance) if supported by your headset.

* **Input switching** - toggle the input focus switching (Win+Y) behavior to be automatic (based on presence sensor feedback) or manual.

#### New Cortana app

This update to Windows includes the latest version of the Cortana app, which is currently US English-only and no longer supports certain mixed-reality specific commands such as "Take a picture" and "Take a video." You' can use the new Cortana to launch apps, and it also supports new productivity focused commands like, "When's my next meeting?" or "Send an email to <name> that I'm running late."
    
#### Additional updates in available in 19041.546 (released October 2020)

This desktop monthly servicing update includes the following changes for Windows Mixed Reality devices: 
* Reduces distortions and aberrations in Windows Mixed Reality head-mounted displays (HMD). 
* Adds support for upcoming HP Windows Mixed Reality motion controllers. 
* Changes the behavior of the 90-Hz refresh rate setting in Windows Mixed Reality to no longer automatically switch back to 60 Hz in certain cases when 90 Hz cannot be achieved. 

#### Help us improve!

We continually look to improve compatibility.  If you find your favorite classic Win32 application not behaving correctly while in Windows Mixed Reality, submit feedback via our [Feedback Hub](https://support.microsoft.com//help/4021566/windows-10-send-feedback-to-microsoft-with-feedback-hub).

### Prior release notes

* [Release notes - May 2019](release-notes-may-2019.md)
* [Release notes - October 2018](release-notes-october-2018.md)
* [Release notes - April 2018](release-notes-april-2018.md)
* [Release notes - October 2017](release-notes-october-2017.md)
* [Release notes - August 2016](release-notes-august-2016.md)
* [Release notes - May 2016](release-notes-may-2016.md)
* [Release notes - March 2016](release-notes-march-2016.md)

## Mixed Reality headset and motion controller driver release history ###

This driver is automatically downloaded and installed via Windows Update, but download links are provided inline:

#### Windows 10, version 2004 (May 2020 Update) ####

   | Version          | Release Date          | Major changes                                                 |
   |------------------|-----------------------|---------------------------------------------------------------|
   | [10.0.19041.2041](https://www.microsoft.com/download/details.aspx?id=102903)  | March 23, 2021  | Compatible with Windows 10, version 1903, and newer.<br/><ul><li>Update the winding order of the hidden area mesh for the HP Reverb G2 to be consistent with other headsets.</li><li>Visuals quality improvements for the HP Reverb G2 headsets.</li><li>Windows Mixed Reality headset platform and reliability improvements.</li>|
   | [10.0.19041.2037](https://www.microsoft.com/en-us/download/details.aspx?id=102527)  | December 10, 2020  | Compatible with Windows 10, version 1903, and newer.<br/><ul><li>New controller firmware for the HP Controller to address an issue where some controllers have non-functioning triggers.</li>|
   | [10.0.19041.2034](https://www.microsoft.com/en-us/download/details.aspx?id=102156)  | October 8, 2020  | Compatible with Windows 10, version 1903, and newer.<br/><ul><li>Official support for the HP Reverb G2, HP Omnicept, and the new HP Controller.</li><li>Minor display corrections for HP Reverb and Samsung Odyssey+ headsets. (Requires [OS Build 19041.546](https://support.microsoft.com/en-us/help/4577063/windows-10-update-kb4577063) or higher or [OS Builds 18362.1110 and 18363.1110](https://support.microsoft.com/en-us/help/4577062/windows-10-update-kb4577062) or higher).</li><li>Improvements to computer power state transition from sleep to reduce SWW 1-4 errors.</li><li>Windows Mixed Reality headset platform minor fixes and reliability improvements.|
   | [10.0.19041.1009](https://www.microsoft.com/en-us/download/details.aspx?id=101260)  | May 7, 2020      | Compatible with Windows 10, version 1903, and newer.<br/><ul><li>Windows Mixed Reality headset platform minor fixes and reliability improvements.</li></ul>  |

#### Windows 10, version 1903 (May 2019 Update) ####

   | Version          | Release Date          | Major changes                                                 |
   |------------------|-----------------------|---------------------------------------------------------------|
   | [10.0.18362.1162](https://www.microsoft.com/en-us/download/details.aspx?id=100421)  | October 14, 2019      | Compatible with Windows 10, version 1809, and newer.<br/><ul><li>Windows Mixed Reality headset platform minor fixes.</li></ul>  | 
   | [10.0.18362.1062](https://www.microsoft.com/en-us/download/details.aspx?id=58492)  | June 24, 2019      | Compatible with Windows 10, version 1809, and newer.<br/><ul><li>Windows Mixed Reality headset platform and reliability improvements around sleeping computers and power state transitions.</li></ul>  | 
   | [10.0.18362.1024](https://www.microsoft.com/en-us/download/details.aspx?id=58225)  | May 1, 2019      | Compatible with Windows 10, version 1809, and newer.<br/><ul><li>Contains firmware update for 2017 Acer, Asus, Dell, Fujitsu, HP, Lenovo, and Medion Windows Mixed Reality headsets. This firmware update improves headset display compatibility and reliability with certain graphics adapters or graphics drivers.</li><li>Windows Mixed Reality headset platform and reliability improvements</li></ul>  | 

#### Windows 10, version 1803 (April 2018 Update), and version 1809 (October 2018 Update) ####

   | Version          | Release Date          | Major changes                                                 |
   |------------------|-----------------------|---------------------------------------------------------------|
   | [10.0.17763.1069](https://www.microsoft.com/en-us/download/details.aspx?id=57702)  | January 2, 2019      | Compatible with Windows 10, version 1803, and newer.<br/><ul><li>Headset tracking jitter and stutter fixes</li><li>Flashlight mode reliability fixes</li></ul>  | 
   | [10.0.17760.1000](https://www.microsoft.com/en-us/download/details.aspx?id=57358)  | October 1, 2018      | Initial public release of the driver for Windows 10, version 1809.<br/>Compatible with Windows 10, version 1803, and newer.<br/><ul><li>Enables new Windows Mixed Reality features, such as flashlight mode, in Windows 10, version 1809</li><li>Headset tracking and reliability improvements</li><li>Motion controller tracking and performance improvements</li><li>USB performance and improvements</li></ul>  | 
   | [10.0.17134.1004](https://www.microsoft.com/en-us/download/details.aspx?id=56845)  | April 27, 2018      | Initial public release of the driver for Windows 10, version 1803<br/> <ul><li>Headset tracking and reliability improvements</li><li>Motion controller tracking and performance improvements</li></ul>  |

#### Windows 10, version 1709 (Fall Creators Update) ####

   | Version          | Release Date          | Major changes                                                 |
   |------------------|-----------------------|---------------------------------------------------------------|
   | [10.0.16299.1070](https://www.microsoft.com/en-us/download/details.aspx?id=56571)  | February 6, 2018    | <ul><li>Official support for 3Glasses Blubur S2 Mixed Reality headset</li></ul> |
   | [10.0.16299.1062](https://www.microsoft.com/en-us/download/details.aspx?id=56332)  | December 19, 2017   | <ul><li>Resolves HID issue leading to *Something Went Wrong* error code 2181038087-7 on some PCs</li><li>Various stability and reliability fixes</li></ul> |
   | [10.0.16299.1058](https://www.microsoft.com/en-us/download/details.aspx?id=56277)  | December 5, 2017    | <ul><li>Improved headset tracking</li><li>Motion controller touchpad responsiveness improvements</li><li>Resolves issue where driver installation could sometimes fail</li><li>Various stability and reliability fixes</li></ul> |
   | [10.0.16299.1042](https://www.microsoft.com/en-us/download/details.aspx?id=56265)  | November 21, 2017   | <ul><li>Resolves an issue that led to headset displays sometimes going black during use</li><li>Resolves an issue that sometimes led to Motion Controllers disappearing</li><li>Presence sensor performance improvements for the Dell Visor headset</li><li>Various stability and reliability fixes</li></ul> |
   | 10.0.16299.1036  | November 7, 2017    | <ul><li>Motion Controller throwing mechanic improvements:<ul><li>Velocity will now be reported properly when position accuracy is approximate, so you can now throw behind your head!</li><li>Example code for throwing can be found in the "ThrowingStarter" unity package [here](https://github.com/keluecke/MixedRealityToolkit-Unity/tree/master/External/Unitypackages/). Open the throwing scene to get started</li></ul></li><li>Improved Motion Controller battery reporting</li><li>Various stability and reliability fixes</li></ul> |
   | 10.0.16299.1012  | October 17, 2017    | Initial public release of the driver                              |

### Mixed Reality motion controller model driver release history ###

This driver is also automatically downloaded and installed via Windows Update, but download links are provided inline:

#### Windows 10, version 2004 (May 2020 Update)

| Version          | Release Date          | Major changes                                                 |
   |------------------|-----------------------|---------------------------------------------------------------|
   | [10.0.19041.2034](https://www.microsoft.com/en-us/download/details.aspx?id=102155)  | September 16, 2020      | Initial public release of the driver for the new HP Motion Controllers. Compatible with Windows 10, version 1903, and newer. This driver is compatible only with new HP Motion Controllers.  |

#### Windows 10, version 1803 (April 2018 Update), and version 1809 (October 2018 Update) ####

   | Version          | Release Date          | Major changes                                                 |
   |------------------|-----------------------|---------------------------------------------------------------|
   | [10.0.17737.1000](https://www.microsoft.com/en-us/download/details.aspx?id=57359)  | October 1, 2018      | Initial public release of the driver for Windows 10, version 1809. Compatible with Windows 10, version 1803, and newer.  |
   | [10.0.17079.1000](https://www.microsoft.com/en-us/download/details.aspx?id=57002)  | April 17, 2018      | Initial public release of the driver for Windows 10, version 1803.  |

#### Windows 10, version 1709 (Fall Creators Update) ####

   | Version          | Release Date          | Major changes                                                 |
   |------------------|-----------------------|---------------------------------------------------------------|
   | [10.0.16291.1000, 10.0.16299.1012](https://www.microsoft.com/download/details.aspx?id=56414)  | October 17, 2017    | Initial public release of the driver                          |

### Mixed Reality Portal release history ###

In Windows 10, version 1809 and newer, [Mixed Reality Portal](https://www.microsoft.com/store/apps/9NG1H8B3ZC7M) is updated via the Microsoft Store app.

#### Windows 10, version 1809 and newer ####

   | Version            | Release Date          | Major changes                                                 |
   |--------------------|-----------------------|---------------------------------------------------------------|
   | 2000.21051.1282.0  | June 8, 2021          | <ul><li>Adds troubleshooting links to the Get Help app for common headset errors.</li><li>Addresses an issue where the headset device companion app might be skipped during initial setup.</li><li>Updates the system requirements page with additional information for high-resolution headsets.</li><li>Updates the splash screen and landing page with new visuals.</li></ul>  |
   | 2000.21041.1051.0  | April 26, 2021        | <ul><li>Updates the app icon for Mixed Reality Portal.</li></ul>  |
   | 2000.20111.1381.0  | December 10, 2020     | <ul><li>Updates the landing page of Mixed Reality Portal.</li><li>Reduces headset connectivity errors during firmware updates. </li></ul>  |
   | 2000.20071.1133.0  | August 5, 2020        | <ul><li>Support for [OpenXR](/windows/mixed-reality/openxr) to pause the preview window.</li></ul>  | 
   | 2000.20041.1212.0  | May 11, 2020          | <ul><li>Addresses a timing issue that was resulting in an inconsistent 15-5 error.</li><li>Improved support for running Windows Mixed Reality with no internet connection.</li><li>Improved support for pairing motion controllers via **Setup controllers**.</li></ul>  | 
   | 2000.20031.1202.0  | April 14, 2020        | <ul><li>Support for signing up for information, tips, and offers about Windows Mixed Reality.</li></ul>  | 
   | 2000.20011.1312.0  | February 11, 2020     | <ul><li>Improved support for applications using [OpenXR](/windows/mixed-reality/openxr) on devices with the May 2019 Update.</li><li>Addresses accessibility and keyboard focus issues</li></ul>  | 
   | 2000.19101.1211.0  | November 11, 2019     | <ul><li>Addresses an issue that prevents you from toggling room boundary visuals.</li><li>Addresses an issue that prevents you from centering a headset during room boundary setup.</li></ul>  | 
   | 2000.19081.1301.0  | September 23, 2019    | <ul><li>Addresses an issue where headsets with hardware problems were shown an incorrect error message. Users that received a 1-4 error code on previous versions may now receive a more specific error code for their device state.</li></ul>  |
   | 2000.19071.1302.0  | August 13, 2019     | <ul><li>Support for applications using [OpenXR](/windows/mixed-reality/openxr) on devices with the May 2019 Update.</li></ul>  | 
   | 2000.19061.1011.0  | July 16, 2019         | <ul><li>Support for JSON configuration options to customize app behavior. Read more at https://docs.microsoft.com/windows/mixed-reality/location-based-experiences#setup.</li></ul>  | 

### SteamVR release history ###

Valve's release notes for SteamVR can be found here: [https://steamcommunity.com/app/250820](https://steamcommunity.com/app/250820)

### Windows Mixed Reality for SteamVR release history ###

Our release notes for the Windows Mixed Reality for SteamVR component can be found here: [http://steamcommunity.com/games/719950/announcements/](http://steamcommunity.com/games/719950/announcements/)

---
title: Software overview and release history
description: An overview of the major software components for Windows Mixed Reality, immersive headsets, and their release history.
author: qianw211
ms.author: v-qianwen
ms.date: 09/30/2021
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, software components, release history, release notes, version history
appliesto:
    - Windows 10 and Windows 11
---

# Mixed Reality software overview and release history

## Introduction to Mixed Reality software

Windows Mixed Reality consists of the following major software components:

1. **Mixed Reality Portal**, which provides the main Windows Mixed Reality experience
    * In Windows 10, versions 1709 and 1803: Mixed Reality Portal is a key component of the Windows 10 operating system updated via Windows Update.
    * In Windows 10, versions 1809 and newer, and Windows 11: Mixed Reality Portal is updated via the Microsoft Store app. More information can be found on the [Get Mixed Reality Portal page](https://www.microsoft.com/p/mixed-reality-portal/9ng1h8b3zc7m).
2. The **Mixed Reality feature-on-demand package** (FOD), automatically downloaded and installed during Mixed Reality Portal's first-run. More information about the FOD package can be found [here](/windows/application-management/manage-windows-mixed-reality)
3. The **Mixed Reality headset and motion controller driver**, also known as the HoloLens Sensors driver, is the key driver package that enables Windows Mixed Reality headsets to work with Windows Mixed Reality. This is automatically downloaded and installed via Windows Update the first time your Mixed Reality headset is plugged in, and is regularly updated via Windows Update
4. The **Mixed Reality motion controller model drivers** contain the 3D models of the Mixed Reality motion controllers and needed for third-party Mixed Reality experiences. This is automatically downloaded and installed via Windows Update the first time your Mixed Reality motion controllers are paired to your PC, and is updated via Windows Update
5. **Windows 10, version 1709 (the Fall Creator's Update) or newer** and **Windows 11** contain key OS components and technologies that enable Windows Mixed Reality

Using Windows Mixed Reality in SteamVR requires the following software:

6. **SteamVR**, developed and maintained by Valve Corporation that enables virtual reality apps and games on Steam. More information can be found [here](https://go.microsoft.com/fwlink/?linkid=862788)
7. The **Windows Mixed Reality for SteamVR** component, which bridges SteamVR with Windows Mixed Reality. More information about this component can be found on the [Windows Mixed Reality for SteamVR page](http://store.steampowered.com/app/719950/Windows_Mixed_Reality_for_SteamVR/)

Managing your Windows Mixed Reality headset:

8. The **Device Companion App**, developed and maintained by each of the headset manufacturers, provides a quick introduction to your Windows Mixed Reality headset. On headsets with built-in Bluetooth capability, the Device Companion app enables restoring Motion Controllers to their factory Bluetooth pairing. Some headsets (such as the Samsung Odyssey, and Samsung Odyssey+) also use the Device Companion App to deliver headset firmware updates from the headset manufacturer. This app is downloaded automatically the first time your headset is plugged in and can be found in the Windows Start Menu.

## Windows 11 release notes - October 2021

### Infinite Expanse

<img src="images\infinite-expanse-win11.png" alt="The Infinite Explanse environment">

<br>

* New virtual home environment for Windows Mixed Reality devices featuring a significant reduction in scope and size, streamlined down to singular stage instead of the more feature-rich Cliffhouse. 
* Built with performance in mind, the Infinite Expanse was designed to address long-standing customer requests for a less resource-intensive virtual home environment that allows customers to get the best performance out of their games and experiences. 
* This new virtual home environment can be found in the **Pins Panel** within the **Places** menu. 

### SteamVR boot with Mixed Reality Portal launch

* New setting available to automatically launch SteamVR when WMR launches, allowing you to bypass WMR home space and jump directly into SteamVR.
   * This new setting can be found in the **Settings** app under **Mixed Reality > Startup and Desktop > Automatic Startup**.
	
### New startup experience settings

* New settings available to better configure your ideal startup experience by increasing your level of control over when Mixed Reality Portal launches.
* You can now control whether or not Mixed Reality Portal launches when a device is connected or when the presence sensor is activated, as well as control how the virtual Desktop app opens.
* These new settings can be found in the **Settings** app under **Mixed Reality > Startup and Desktop**
    * Toggle to start MRP on HMD plug-in.
    * Toggle to start MRP when presence is detected.
    * Toggle Open Desktop app on desktop app focus.

### Prior release notes

* [Release notes - May 2020](release-notes-may-2020.md)
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
   | 2000.19061.1011.0  | July 16, 2019         | <ul><li>Support for JSON configuration options to customize app behavior. Read more at [setup for location based entertainment with Windows Mixed Reality](/windows/mixed-reality/location-based-experiences#setup).</li></ul>  | 

### SteamVR release history ###

Valve's release notes for SteamVR can be found here: [https://steamcommunity.com/app/250820](https://steamcommunity.com/app/250820)

### Windows Mixed Reality for SteamVR release history ###

Our release notes for the Windows Mixed Reality for SteamVR component can be found here: [http://steamcommunity.com/games/719950/announcements/](http://steamcommunity.com/games/719950/announcements/)

---
title: Mixed Reality software overview and release history
description: An overview of the major software components for Windows Mixed Reality, and their release history
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, software components, release history, release notes, version history
---


# Mixed Reality software overview and release history

## Introduction to Mixed Reality software

Windows Mixed Reality consists of the following major software components:

1. **Mixed Reality Portal**, which provides the main Windows Mixed Reality experience
    * In Windows 10, versions 1709 and 1803, Mixed Reality Portal is a key component of the Windows 10 operating system and is updated via Windows Update.
    * In Windows 10, version 1809 and newer, Mixed Reality Portal is updated via the Microsoft Store app.
2. The **Mixed Reality feature-on-demand package** (FOD), automatically downloaded and installed during Mixed Reality Portal's first-run. More information about the FOD package can be found [here](https://docs.microsoft.com/windows/application-management/manage-windows-mixed-reality)
3. The **Mixed Reality headset and motion controller driver**, also known as the HoloLens Sensors driver, is the key driver package that enables Windows Mixed Reality headsets to work with Windows Mixed Reality. This is automatically downloaded and installed via Windows Update the first time your Mixed Reality headset is plugged in, and is regularly updated via Windows Update
4. The **Mixed Reality motion controller model drivers** contains the 3D models of the Mixed Reality motion controllers and needed for third-party Mixed Reality experiences. This is automatically downloaded and installed via Windows Update the first time your Mixed Reality motion controllers are paired to your PC, and is updated via Windows Update
5. **Windows 10, version 1709 (the Fall Creator's Update) or newer** contains key OS components and technologies that enable Windows Mixed Reality

In addition, using Windows Mixed Reality in SteamVR requires the following software:

6. **SteamVR**, developed and maintained by Valve Corporation that enables virtual reality apps and games on Steam. More information can be found [here](https://go.microsoft.com/fwlink/?linkid=862788)
7. The **Windows Mixed Reality for SteamVR** component, which bridges SteamVR with Windows Mixed Reality. More information about this component can be found [on the Windows Mixed Reality for SteamVR page](http://store.steampowered.com/app/719950/Windows_Mixed_Reality_for_SteamVR/)

Managing your Windows Mixed Reality headset:

8. The **Device Companion App**, developed and maintained by each of the headset manufacturers, provides a quick introduction to your Windows Mixed Reality headset. On headsets with built-in Bluetooth capability, the Device Companion app enables restoring Motion Controllers to their factory Bluetooth pairing. Some headsets (such as the Samsung Odyssey, and Samsung Odyssey+) also use the Device Companion App to deliver headset firmware updates from the headset manufacturer. This app is downloaded automatically the first time your headset is plugged in and can be found in the Windows Start Menu.


## Release history ##

### Mixed Reality headset and motion controller driver release history ###

This driver is automatically downloaded and installed via Windows Update, but download links are provided inline:


#### Windows 10, version 2004 (May 2020 Update) ####

   | Version          | Release Date          | Major changes                                                 |
   |------------------|-----------------------|---------------------------------------------------------------|
   | [10.0.19041.1009](https://www.microsoft.com/en-us/download/details.aspx?id=101260)  | May 7th, 2020      | Compatible with Windows 10, version 1903, and newer.<br/><ul><li>Windows Mixed Reality headset platform minor fixes and reliability improvements.</li></ul>  | 


#### Windows 10, version 1903 (May 2019 Update) ####

   | Version          | Release Date          | Major changes                                                 |
   |------------------|-----------------------|---------------------------------------------------------------|
   | [10.0.18362.1162](https://www.microsoft.com/en-us/download/details.aspx?id=100421)  | October 14th, 2019      | Compatible with Windows 10, version 1809, and newer.<br/><ul><li>Windows Mixed Reality headset platform minor fixes.</li></ul>  | 
   | [10.0.18362.1062](https://www.microsoft.com/en-us/download/details.aspx?id=58492)  | June 24th, 2019      | Compatible with Windows 10, version 1809, and newer.<br/><ul><li>Windows Mixed Reality headset platform and reliability improvements around sleeping computers and power state transitions.</li></ul>  | 
   | [10.0.18362.1024](https://www.microsoft.com/en-us/download/details.aspx?id=58225)  | May 1st, 2019      | Compatible with Windows 10, version 1809, and newer.<br/><ul><li>Contains firmware update for 2017 Acer, Asus, Dell, Fujitsu, HP, Lenovo and Medion Windows Mixed Reality headsets. This firmware update improves headset display compatibility and reliability with certain graphics adapters and/or graphics drivers.</li><li>Windows Mixed Reality headset platform and reliability improvements</li></ul>  | 


#### Windows 10, version 1803 (April 2018 Update) and version 1809 (October 2018 Update) ####

   | Version          | Release Date          | Major changes                                                 |
   |------------------|-----------------------|---------------------------------------------------------------|
   | [10.0.17763.1069](https://www.microsoft.com/en-us/download/details.aspx?id=57702)  | January 2nd, 2019      | Compatible with Windows 10, version 1803, and newer.<br/><ul><li>Headset tracking jitter and stutter fixes</li><li>Flashlight mode reliability fixes</li></ul>  | 
   | [10.0.17760.1000](https://www.microsoft.com/en-us/download/details.aspx?id=57358)  | October 1st, 2018      | Initial public release of the driver for Windows 10, version 1809.<br/>Compatible with Windows 10, version 1803, and newer.<br/><ul><li>Enables new Windows Mixed Reality features, such as flashlight mode, in Windows 10, version 1809</li><li>Headset tracking and reliability improvements</li><li>Motion controller tracking and performance improvements</li><li>USB performance and improvements</li></ul>  | 
   | [10.0.17134.1004](https://www.microsoft.com/en-us/download/details.aspx?id=56845)  | April 27th, 2018      | Initial public release of the driver for Windows 10, version 1803<br/> <ul><li>Headset tracking and reliability improvements</li><li>Motion controller tracking and performance improvements</li></ul>  |


#### Windows 10, version 1709 (Fall Creators Update) ####

   | Version          | Release Date          | Major changes                                                 |
   |------------------|-----------------------|---------------------------------------------------------------|
   | [10.0.16299.1070](https://www.microsoft.com/en-us/download/details.aspx?id=56571)  | February 6th, 2018    | <ul><li>Official support for 3Glasses Blubur S2 Mixed Reality headset</li></ul> |
   | [10.0.16299.1062](https://www.microsoft.com/en-us/download/details.aspx?id=56332)  | December 19th, 2017   | <ul><li>Resolves HID issue leading to *Something Went Wrong* error code 2181038087-7 on some PCs</li><li>Various stability and reliability fixes</li></ul> |
   | [10.0.16299.1058](https://www.microsoft.com/en-us/download/details.aspx?id=56277)  | December 5th, 2017    | <ul><li>Improved headset tracking</li><li>Motion controller touchpad responsiveness improvements</li><li>Resolves issue where driver installation could sometimes fail</li><li>Various stability and reliability fixes</li></ul> |
   | [10.0.16299.1042](https://www.microsoft.com/en-us/download/details.aspx?id=56265)  | November 21st, 2017   | <ul><li>Resolves an issue that led to headset displays sometimes going black during use</li><li>Resolves an issue that sometimes led to Motion Controllers disappearing</li><li>Presence sensor performance improvements for the Dell Visor headset</li><li>Various stability and reliability fixes</li></ul> |
   | 10.0.16299.1036  | November 7th, 2017    | <ul><li>Motion Controller throwing mechanic improvements:<ul><li>Velocity will now be reported properly when position accuracy is approximate, so you can now throw behind your head!</li><li>Example code for throwing can be found in the "ThrowingStarter" unity package [here](https://github.com/keluecke/MixedRealityToolkit-Unity/tree/master/External/Unitypackages/). Open the throwing scene to get started</li></ul></li><li>Improved Motion Controller battery reporting</li><li>Various stability and reliability fixes</li></ul> |
   | 10.0.16299.1012  | October 17th, 2017    | Initial public release of the driver                              |

### Mixed Reality motion controller model driver release history ###

This driver is also automatically downloaded and installed via Windows Update, but download links are provided inline:

#### Windows 10, version 1803 (April 2018 Update) and version 1809 (October 2018 Update) ####

   | Version          | Release Date          | Major changes                                                 |
   |------------------|-----------------------|---------------------------------------------------------------|
   | [10.0.17737.1000](https://www.microsoft.com/en-us/download/details.aspx?id=57359)  | October 1st, 2018      | Initial public release of the driver for Windows 10, version 1809. Compatible with Windows 10, version 1803, and newer.  |
   | [10.0.17079.1000](https://www.microsoft.com/en-us/download/details.aspx?id=57002)  | April 17th, 2018      | Initial public release of the driver for Windows 10, version 1803.  |

#### Windows 10, version 1709 (Fall Creators Update) ####

   | Version          | Release Date          | Major changes                                                 |
   |------------------|-----------------------|---------------------------------------------------------------|
   | [10.0.16291.1000, 10.0.16299.1012](https://www.microsoft.com/download/details.aspx?id=56414)  | October 17th, 2017    | Initial public release of the driver                          |

### Mixed Reality Portal release history ###

In Windows 10, version 1809 and newer, [Mixed Reality Portal](https://www.microsoft.com/store/apps/9NG1H8B3ZC7M) is updated via the Microsoft Store app.

#### Windows 10, version 1809 and newer ####

   | Version            | Release Date          | Major changes                                                 |
   |--------------------|-----------------------|---------------------------------------------------------------|
   | 2000.20071.1133.0  | August 5, 2020        | <ul><li>Support for [OpenXR](https://docs.microsoft.com/windows/mixed-reality/openxr) to pause the preview window.</li></ul>  | 
   | 2000.20041.1212.0  | May 11, 2020          | <ul><li>Addresses a timing issue that was resulting in an inconsistent 15-5 error.</li><li>Improved support for running Windows Mixed Reality with no internet connection.</li><li>Improved support for pairing motion controllers via **Set up controllers**.</li></ul>  | 
   | 2000.20031.1202.0  | April 14, 2020        | <ul><li>Support for signing up for information, tips and offers about Windows Mixed Reality.</li></ul>  | 
   | 2000.20011.1312.0  | February 11, 2020     | <ul><li>Improved support for applications using [OpenXR](https://docs.microsoft.com/windows/mixed-reality/openxr) on devices with the May 2019 Update.</li><li>Addresses accessibility and keyboard focus issues</li></ul>  | 
   | 2000.19101.1211.0  | November 11, 2019     | <ul><li>Addresses an issue that prevents you from toggling room boundary visuals.</li><li>Addresses an issue that prevents you from centering a headset during room boundary setup.</li></ul>  | 
   | 2000.19081.1301.0  | September 23, 2019    | <ul><li>Addresses an issue where headsets encountering hardware problems were shown an incorrect error message. Users that received a 1-4 error code on previous versions may now receive a more specific error code for their device state.</li></ul>  |
   | 2000.19071.1302.0  | August 13th, 2019     | <ul><li>Support for applications using [OpenXR](https://docs.microsoft.com/windows/mixed-reality/openxr) on devices with the May 2019 Update.</li></ul>  | 
   | 2000.19061.1011.0  | July 16, 2019         | <ul><li>Support for JSON configuration options to customize app behavior. Read more at https://docs.microsoft.com/windows/mixed-reality/location-based-experiences#setup.</li></ul>  | 

### SteamVR release history ###

Valve's release notes for SteamVR can be found here: [https://steamcommunity.com/app/250820](https://steamcommunity.com/app/250820)

### Windows Mixed Reality for SteamVR release history ###

Our release notes for the Windows Mixed Reality for SteamVR component can be found here: [http://steamcommunity.com/games/719950/announcements/](http://steamcommunity.com/games/719950/announcements/)

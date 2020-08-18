---
title: Release notes - May 2020
description: Windows Mixed Reality release notes for the Windows 10 May 2020 Update (also known as 2004).
author: tmlyon
ms.author: tmlyon
ms.date: 05/27/2020
ms.topic: article
keywords: release notes, version, windows 10, build, 20H1, os, may 2020, 2004
---



# Release notes - May 2020

The **Windows 10 May 2020 Update (v2004)** includes new features for Windows Mixed Reality (VR) headsets, such as the ability to launch Win32 applications in the mixed reality home. HoloLens (1st gen) is in Long Term Servicing (LTS), with servicing updates to be released monthly.

To update to the latest release on PC for Windows Mixed Reality immersive (VR) headsets, open the **Settings** app, go to **Update & Security**, then select the **Check for updates** button. On a Windows 10 PC, you can also manually install the **Windows 10 May 2020 Update** using the [Windows media creation tool](https://www.microsoft.com/software-download/windows10).

**Latest release for Desktop**: Windows 10 v2004 (10.0.19041.264)

## Updates for Windows Mixed Reality immersive headsets

### Introducing the new Microsoft Edge
As [previously announced](https://docs.microsoft.com/windows/mixed-reality/new-microsoft-edge), we've made updates to better support using the new Microsoft Edge browser in Windows Mixed Reality. The new Microsoft Edge adopts the Chromium open source project to create better web compatibility for customers and less fragmentation of the web for all web developers. It also supports WebXR, the new standard for creating immersive web experiences for VR headsets, in place of WebVR.

### Improved Settings for WMR
Thanks to your feedback, we've added and clarified settings on the Headset display page:

* **Visual quality of my home** - changing these settings affects only the mixed reality home environment (Cliff House and Skyloft):

* **Adjust level of detail and quality of effects in the mixed reality home** - this changes some of the rendering affects we use in the home. In particular, the visual quality of different materials (wood, concrete, etc.) will scale as you change this setting from low to high.

* **Change app window resolution** - by default, most 2D windows launched in the home are launched with a 720p resolution. While you can manually resize them horizontally & vertically, you can also opt to have them all launch at 1080p instead. Previously this option was available as the Very high (beta) option under Visual quality. We've appropriately split it out as a separate setting now.

* **Experience options** - these options adjust the mixed reality experience to reduce load on systems where the hardware might struggle to keep up with an unrestricted 90 fps. You can choose to explicitly enable or disable these additional settings, or choose Let Windows decide and let our heuristics continue deciding when to toggle these on and off.

* **Resolution** - if you have a high-resolution headset like the HP Reverb, we support running it at its native resolution, or at a reduced resolution for performance reasons. Earlier headsets, like the Samsung Odyssey and Odyssey+, only support a single resolution so you won't be able to change this setting on those headsets.

* **Frame rate** - you can now manually set the frame rate of the headset display, or continue to let Windows use its heuristics to determine if 60 Hz or 90 Hz is more appropriate.

* **Calibration** - as before, you can adjust your IPD (interpupillary distance) if supported by your headset.

* **Input switching** - toggle the input focus switching (Win+Y) behavior to be automatic (based on presence sensor feedback) or manual.

### New Cortana app
This update to Windows includes the latest version of the Cortana app, which is currently US English-only and no longer supports certain mixed-reality specific commands such as "Take a picture" and "Take a video." You'll still be able to use the new Cortana to launch apps, and it also supports new productivity focused commands like, "When's my next meeting?" or "Send an email to <name> that I'm running late."

#### Please help us improve!
We continually look to improve compatibility.  If you find your favorite classic Win32 application not behaving correctly while in Windows Mixed Reality, please submit feedback via our [Feedback Hub](https://support.microsoft.com//help/4021566/windows-10-send-feedback-to-microsoft-with-feedback-hub).

## Prior release notes

* [Release notes - May 2019](release-notes-may-2019.md)
* [Release notes - October 2018](release-notes-october-2018.md)
* [Release notes - April 2018](release-notes-april-2018.md)
* [Release notes - October 2017](release-notes-october-2017.md)
* [Release notes - August 2016](release-notes-august-2016.md)
* [Release notes - May 2016](release-notes-may-2016.md)
* [Release notes - March 2016](release-notes-march-2016.md)

## See also
* [Immersive headset support (external link)](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/troubleshooting-windows-mixed-reality)
* [HoloLens support (external link)](https://support.microsoft.com/products/hololens)
* [Install the tools](install-the-tools.md)
* [Give us feedback](give-us-feedback.md)

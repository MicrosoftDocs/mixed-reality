---
title: Windows Mixed Reality and the new Microsoft Edge
description: Get ready for the new Microsoft Edge in Windows Mixed Reality. Includes changes to expect, updates to look out for, and known issues.
author: mattzmsft
ms.author: mazeller
ms.date: 01/15/2020
ms.topic: article
keywords: edge, new, immersive web, microsoft edge, browser, vr
---

# Windows Mixed Reality and the new Microsoft Edge

The [new Microsoft Edge is now available for download](https://blogs.windows.com/windowsexperience/?p=173496), but customers can also [wait for it to be installed in a future update to Windows 10](https://blogs.windows.com/msedgedev/2020/01/15/upgrading-new-microsoft-edge-79-chromium/), following a measured roll-out approach over the next several months. 

With this news, **we wanted to let Windows Mixed Reality VR headset customers know what to expect from the new Microsoft Edge and inform you of some pending updates that will improve your web browsing experience in Windows Mixed Reality**.

## Introducing the new Microsoft Edge

The new Microsoft Edge [adopts the Chromium open source project](https://blogs.windows.com/windowsexperience/2018/12/06/microsoft-edge-making-the-web-better-through-more-open-source-collaboration/) on the desktop to create better web compatibility for customers and less fragmentation of the web for all web developers. It will also support WebXR at launch, the new standard for creating immersive web experiences for VR headsets, in place of WebVR.

>[!IMPORTANT]
>When you install Microsoft Edge on an up-to-date Windows 10 device, it will replace the previous (legacy) version on your PC.

## Getting ready for the new Microsoft Edge

Windows Mixed Reality VR headset customers who want to use the new Microsoft Edge in the mixed reality home should **upgrade to Windows 10 Version 1903 or later for native support of Win32 applications (like the new Microsoft Edge)** in the mixed reality home. Check Windows Update or [manually install the latest version of Windows 10](https://www.microsoft.com/en-us/software-download/windows10).

For the best possible Microsoft Edge experience in the mixed reality home, we also recommend waiting for **some key Windows Mixed Reality optimizations for the new Microsoft Edge arriving with the 2020-01 Cumulative update for Windows 10 Version 1903 (or later)**, which should be available in Windows Update by the end of January.

>[!IMPORTANT]
>If you opt to download the new Microsoft Edge before taking these updates, there will be some known issues with its behavior in Windows Mixed Reality (which you can read about below).

## Known issues

### Known issues resolved by the 2020-01 Cumulative update for Windows 10 Version 1903 (or later)

- Launching any Win32 app, including the new Microsoft Edge, causes the headset display to briefly freeze.
- The Microsoft Edge tile disappears from the Windows Mixed Reality Start menu (you can find it in the “Classic apps” folder).
- Windows from the previous Microsoft Edge are still placed around the mixed reality home, but cannot be used. Attempting to activate those windows launches Edge inside of the Desktop app.
- Selecting a hyperlink in the mixed reality home launches a web browser on the desktop instead of the mixed reality home.
- The WebVR Showcase app is present in the mixed reality home, despite WebVR no longer being supported.
- General improvements to keyboard launch and visuals.

### Additional known issues

-	Websites open in Windows Mixed Reality will be lost when Mixed Reality Portal closes, though the Microsoft Edge windows will remain where they were placed in the mixed reality home.
-	Audio from Microsoft Edge windows is not spatialized.
-	**Fixed in 360 Viewer extension version 2.3.8**: Opening a 360 video from YouTube in Windows Mixed Reality may result in the video being distorted in the headset. Restarting Edge should invisibly update the 360 Viewer extension to resolve this issue. You can confirm which version of the extension you have by entering `edge://system/` in the address bar and selecting the **Expand** button next to "extensions."
-	During Windows Mixed Reality sessions, virtual monitors will appear as generic physical monitors in Settings > System > Display.
- Hybrid GPU systems are not yet fully supported in the new Microsoft Edge when entering immersive sessions.




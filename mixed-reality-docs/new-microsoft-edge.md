---
title: Windows Mixed Reality and the new Microsoft Edge
description: Get ready for the new Microsoft Edge in Windows Mixed Reality. Includes changes to expect, updates to look out for, and known issues.
author: mattzmsft
ms.author: mazeller
ms.date: 08/04/2020
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

### Monitor and input handling issues

After taking the 2020-01 Cumulative update for Windows 10 Version 1903 (or later), virtual monitors will appear as generic physical monitors in **Settings > System > Display** during Windows Mixed Reality sessions. Some customers, especially those with more than one physical monitor, may notice issues with desktop layout and input handling as a result.

**Why this happens**

Support for classic Win32 applications in Windows Mixed Reality was introduced with the [Windows 10 May 2019 Update](release-notes-may-2019.md). To enable this support, a virtual monitor must be created to host the Win32 application. Each time a new Win32 application is launched, another virtual monitor has to be created. Unfortunately, creating a virtual monitor is an intensive task that can cause the headset display to briefly freeze. Customers offered feedback that this was an uncomfortable and disruptive experience. Because of that feedback, alongside increased usage of Win32 applications, we made the decision to pre-allocate three virtual monitors during startup of Windows Mixed Reality to prevent this disruption and enable customers to launch up to three concurrent Win32 applications without experiencing the headset display freeze.

**Workaround**

We've since received feedback that some customers, especially those with multiple physical monitors, would prefer to disable this virtual monitor pre-allocation. To give customers control and choice we've enabled a workaround that involves changing a registry key value, available with the "2020-07 Cumulative Update Preview for Windows 10 Version 2004 (KB4568831)."

>[!NOTE]
>Modifying registry key values is intended for advanced users.

>[!WARNING]
>Disabling virtual monitor pre-allocation may result in your headset display briefly freezing when you launch a Win32 application (such as Steam, the new Microsoft Edge, or Google Chrome) in Windows Mixed Reality.

To disable virtual monitor pre-allocation:
1. Check **Windows Update** for "2020-07 Cumulative Update Preview for Windows 10 Version 2004 (KB4568831)" and install the update when available (you may find the update under **Optional updates available**)
2. Launch **Registry Editor**
3. Navigate to "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Holographic\"
4. If the "PreallocateVirtualMonitors" REG_DWORD is not present, create it by selecting **Edit > New > DWORD (32-bit) Value** and entering PreallocateVirtualMonitors as the name
5. If the "PreallocateVirtualMonitors" REG_DWORD is present (or you just created it), double-click the entry and change "Value data" from 1 (its default value) to 0 (zero)
    * TRUE - 1
    * FALSE - 0

Virtual monitors will now allocate when you attempt to launch a Win32 application in Windows Mixed Reality instead of pre-allocating. To reset this and re-enable virtual monitor pre-allocation, return the DWORD "Value data" to 1.

### Additional known issues

-	Websites open in Windows Mixed Reality will be lost when Mixed Reality Portal closes, though the Microsoft Edge windows will remain where they were placed in the mixed reality home.
- WebXR experiences, including the 360 Viewer extension, may not launch correctly on PCs with a Hybrid GPU setup. You may be able to work around this issue by selecting your dedicated GPU as the default GPU in your graphics card software.
-	Audio from Microsoft Edge windows is not spatialized.
-	**Fixed in 360 Viewer extension version 2.3.8**: Opening a 360 video from YouTube in Windows Mixed Reality may result in the video being distorted in the headset. Restarting Edge should invisibly update the 360 Viewer extension to resolve this issue. You can confirm which version of the extension you have by entering `edge://system/` in the address bar and selecting the **Expand** button next to "extensions."

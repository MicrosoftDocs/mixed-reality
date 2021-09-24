---
title: Windows Mixed Reality and the new Microsoft Edge
description: Learn about the new Microsoft Edge for Mixed Reality, including what to expect, updates to look out for, and known issues.
author: mattzmsft
ms.author: v-vtieto
ms.date: 09/24/2021
ms.topic: article
keywords: edge, new, immersive web, microsoft edge, browser, vr, 360, 360 video, 360 viewer, webxr, webvr
---

# The new Microsoft Edge for Windows Mixed Reality

The [new Microsoft Edge is now available for download](https://blogs.windows.com/windowsexperience/?p=173496), but customers can also [wait for a future update to install it with Windows 10](https://blogs.windows.com/msedgedev/2020/01/15/upgrading-new-microsoft-edge-79-chromium/), following a measured roll-out approach over the next several months. 

With this news, **we wanted to let Windows Mixed Reality VR headset customers know what to expect from the new Microsoft Edge and show off pending updates for an improved browsing experience in Windows Mixed Reality**.

## Introducing the new Microsoft Edge

The new Microsoft Edge [adopts the Chromium open source project](https://blogs.windows.com/windowsexperience/2018/12/06/microsoft-edge-making-the-web-better-through-more-open-source-collaboration/) on the desktop to create better compatibility for customers and less fragmentation of the web for web developers. It will also support WebXR at launch, the new standard for creating immersive web experiences for VR headsets, in place of WebVR.

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
- Windows from the previous Microsoft Edge are still placed around the mixed reality home, but cannot be used. Attempting to activate those windows launches Edge in the Desktop app.
- Selecting a hyperlink in the mixed reality home launches a web browser on the desktop instead of the mixed reality home.
- The WebVR Showcase app is present in the mixed reality home, despite WebVR no longer being supported.
- General improvements to keyboard launch and visuals.

### Monitor and input handling issues

After taking the 2020-01 Cumulative update for Windows 10 Version 1903 (or later), virtual monitors will appear as generic physical monitors in **Settings > System > Display** during Windows Mixed Reality sessions. Some customers, especially with more than one physical monitor, may notice issues with desktop layout and input handling as a result.

**Why this happens**

Support for classic Win32 applications in Windows Mixed Reality was introduced with the [Windows 10 May 2019 Update](/windows/mixed-reality/enthusiast-guide/release-notes-may-2019). To enable this support, a virtual monitor must be created to host the Win32 application. Each time a new Win32 application is launched, another virtual monitor has to be created. Unfortunately, creating a virtual monitor is an intensive task that can cause the headset display to briefly freeze. Customers offered feedback that this was an uncomfortable and disruptive experience. Because of feedback and increased Win32 application usage, we made the decision to pre-allocate three virtual monitors during startup of Windows Mixed Reality. This prevents disruption and enables customers to launch up to three concurrent Win32 applications without experiencing the headset display freeze.

**Workaround**

We've since received feedback that some customers, especially those with multiple physical monitors, would prefer to disable this virtual monitor pre-allocation. To give customers control, we've enabled a workaround that involves changing a registry key value, which is available with the following Windows Updates:

- 2020-07 Cumulative Update Preview for Windows 10 Version 2004 (KB4568831)
- 2020-10 Cumulative Update Preview for Windows 10 Version 1909 (KB4580386)
- 2020-10 Cumulative Update Preview for Windows 10 Version 1903 (KB4580386)

>[!NOTE]
>Modifying registry key values is intended for advanced users.

>[!WARNING]
>Disabling virtual monitor pre-allocation may result in your headset display briefly freezing when you launch a Win32 application (such as Steam, the new Microsoft Edge, or Google Chrome) in Windows Mixed Reality.

To disable virtual monitor pre-allocation:
1. Check **Windows Update** for one of the Windows 10 Cumulative Update Preview versions listed above, and install the update when available. You may find the update under **Optional updates** or **Advanced options** on the Windows Update settings page
2. Launch **Registry Editor**
3. Navigate to "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Holographic\"
4. If the "PreallocateVirtualMonitors" REG_DWORD isn't present, create it by selecting **Edit > New > DWORD (32-bit) Value** and entering PreallocateVirtualMonitors as the name
5. If the "PreallocateVirtualMonitors" REG_DWORD is present (or you just created it), double-click the entry and change "Value data" from 1 (its default value) to 0 (zero)
    * TRUE - 1
    * FALSE - 0

Virtual monitors will now allocate when you attempt to launch a Win32 application in Windows Mixed Reality instead of pre-allocating. To reset this and re-enable virtual monitor pre-allocation, return the DWORD "Value data" to 1.

### Other known issues

-	Audio from Microsoft Edge windows isn't spatialized.

## See Also

* [WebXR Overview](../develop/javascript/webxr-overview.md)
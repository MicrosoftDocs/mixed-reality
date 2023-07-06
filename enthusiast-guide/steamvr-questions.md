---
title: SteamVR FAQs
description: SteamVR Windows Mixed Reality troubleshooting that goes beyond our standard consumer support documentation.
author: qianwen
ms.author: qianwen
ms.date: 09/24/2021
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Troubleshoot, Errors, Help, Support, SteamVR
---


# SteamVR FAQs

## How can I play SteamVR games in my Windows Mixed Reality headset

1. [Download and install SteamVR](https://steamcdn-a.akamaihd.net/client/installer/SteamWindowsMRInstaller.exe). The SteamVR tutorial should start automatically when you start SteamVR.
2. Connect your headset to your PC and turn on your motion controllers.
3. Once Windows Mixed Reality home has loaded and your controllers are visible, open the Steam app on your desktop.
4. Use the Steam app to launch a SteamVR game from your Steam library. To launch SteamVR games without taking off your headset, find and launch them under Windows Mixed Reality's **Start > All Apps**.

## A message says “To use SteamVR with Windows Mixed Reality, you need to install the latest Windows Update" or "Windows Developer Mode Required"

1. Make sure your PC is running the latest version of Windows 10 or Windows 11. Go to **Settings > System > About**, and under "Windows specifications", make sure "OS Build" is 16299.64 or greater.
2. Make sure you don’t have any updates waiting to download or install. Go to **Settings > Update & Security > Windows Update** and select "Check for updates". You may have to check multiple times until no further updates are available and then restart your PC.

## SteamVR is crashing after updating Windows

Some older versions of Windows Mixed Reality for SteamVR are no longer compatible with Windows. To ensure that your version of Windows Mixed Reality for SteamVR is current:

1. In your Steam library, go to **Software > Windows Mixed Reality for SteamVR**.
2. Right-click it and go to "Properties".
3. Select the "Update" tab and "Always keep this application up to date".
4. Force the update by going to the "Local Files" tab and selecting “Verify integrity of application files”.
5. Restart Steam and SteamVR.

If SteamVR is still crashing after updating, you may have two installations of Windows Mixed Reality for SteamVR on your machine. To confirm:

1. Locate ```%localappdata%\openvr\openvrpaths.vrpath``` and open it in Notepad.
2. Look in the "external drivers" sections look for multiple entries for "MixedRealityVRDriver"
   ```json
   "external_drivers" : [
      "D:\\Steam\\steamapps\\common\\MixedRealityVRDriver",
      "E:\\Steam\\steamapps\\common\\MixedRealityVRDriver"
   ],
   ```
3. If you see multiple entries, remove the older of the two entries. Once you have only one entry, there should no longer be a comma at the end of the line. For example:
   ```json
   "external_drivers" : [
      "D:\\Steam\\steamapps\\common\\MixedRealityVRDriver"
   ],
   ```
4. Save the file and close it.
5. Restart Steam and SteamVR.

## My controllers aren't working as expected in SteamVR

1. Close SteamVR.
2. Return to Windows Mixed Reality home and confirm that your controllers are working.
3. Launch the SteamVR experience again and your controllers should be back to normal.
4. If issues persist, file feedback using the [Windows Feedback Hub](https://support.microsoft.com/en-us/help/4021566/windows-10-send-feedback-to-microsoft-with-feedback-hub-app) under the Mixed Reality category and include SteamVR in the summary.

You'll use your motion controllers differently in different games. Here are a few basics to help you get started:
* To open the Steam dashboard, press straight down on the left thumbstick.
* To exit a SteamVR game and return to the Windows Mixed Reality home, press the Windows button. Then select the Mixed Reality Home button that appears on-screen.

## My left and right controllers are reversed in SteamVR

Start the game with your controllers off and then turn on the left controller, followed by the right one.

## My games are running slowly

1. Make sure that your PC meets the specifications for SteamVR in Windows Mixed Reality and the game you're playing.
2. In Mixed Reality Portal on your desktop, select "Pause" to stop desktop preview.
3. Go to **Settings > System > About** and under "Windows specifications", make sure "OS Build" is 16299.64 or later.
4. Make sure your PC has the latest graphics drivers ("Check for Updates" in Windows Update).
5. Check "Task Manager" to see what other processes might be consuming resources on your PC.
6. Check to see if Steam is downloading a game in the background, which consumes resources and makes games run poorly.
7. A small class of apps that don't have a visible window (for example, SteamVR Home), have a known performance issue. Most apps don't fall into this category, and a fix will be available in a future update.

If you're still running into unexpected performance issues, send us feedback using the [Windows Feedback Hub](https://support.microsoft.com/en-us/help/4021566/windows-10-send-feedback-to-microsoft-with-feedback-hub-app). Make sure to follow the instructions to [include a SteamVR Performance Trace](using-steamvr-with-windows-mixed-reality.md#sharing-feedback-on-steamvr).

## SteamVR is showing a compositor error (for example, "Shared IPC Compositor Connect Failed (400)").

This can happen if your headset and primary monitor are on two different video adapters. Attach your monitor to the same adapter as your headset and configure it as the primary monitor in **Settings app > System > Display**.

## SteamVR content appears in the wrong place, like beneath the floor or above my head

Reset your position:

1. Select the left controller's thumbstick to bring up the "SteamVR Dashboard".
2. Select the "Settings" button.
3. Select "Reset Seated Position".

## My Steam app closed unexpectedly

The Steam app will close if:

* You lock your PC screen
* Remove your headset
* Switch users
* Your PC goes to sleep

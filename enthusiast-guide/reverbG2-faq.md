---
title: HP Reverb G2 FAQs
description: Commonly asked questions about using HP Reverb G2 headset
ms.author: v-hferrone
ms.date: 09/15/2020
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Troubleshoot, Errors, Help, Support, Performance
appliesto:
    - Windows 10
---

# HP Reverb G2 Frequently Asked Questions

## Is there a specific order I should follow to connect my headset cables to a PC

HP Recommends:

- Connect the 6-meter cable to the headset first before connecting to the PC or power supply.
- Leave the 6-meter cable connected to the headset after initial installation.
- When the headset is not in use, disconnect the power adapter from the 6-meter cable.

## What should I do to get a crisper image

There are a few things you can try if you feel that your display looks a little blurry:

- Make sure that your headset is on your head correctly so that your eyes are centered with regards to the lenses.
- Try to adjust the IPD (interpupillary distance). Note that Reverb G2 uses a hardware IPD. To change it, look for IPD adjustment on your headset.
- If you need glasses or contacts, they are still required.
- Check your lenses if they need to be cleaned (microfiber cloth only – no fluids).
- Due to the advanced design of the headset there may be some minor image ghosting in the first few minutes when starting the device while cold until the LCDs have the opportunity to warm up.

## I am getting a 7-14 “Something Went Wrong” error when I plug in my headset

If you are seeing a 7-14 “something went wrong” error, please try the following steps:

- Make sure that you have the most recent drivers installed.
- Try plugging the cable into a different USB-3.0 port.
- Please use the USB C to A adapter included to try different ports.

Try plugging the cable into a different USB Hub.  

> [!NOTE]
> HP recommends using only USB controllers built into the motherboard with Reverb G2
> devices.
> If you are unable to connect your device, please contact [HP Support](https://support.hp.com/us-en)

## I am getting a 13-14 “Something Went Wrong” error when my PC resumes from hibernate (S4)

Sometimes during the resume process, the video card cannot establish a connection, so unplugging the USB Type C from your PC and plugging it back in may help to establish a connection.

## The Mixed Reality Portal says “Can't run mixed reality on this headset” but this worked fine with my previous WMR headset

This may happen because your HP Reverb G2 requires a more powerful PC to ensure the best experience. For more information, please review the minimum [PC requirements](windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md##Compatibility-guidelines)

## It looks like my left display is stretched, and the right display is off-centered and half black

This can happen when your headset is not running at the native resolution. Due to the nature of the high-resolution displays in the HP Reverb G2 HMD, not all systems will be able to render the native resolution. There is a fix coming in a future Windows Update that will address the rendering issue when the headset is not at the native resolution.

There are a few reasons why your system is not able to render at the native resolution:

- The DisplayPort on the system might not be 1.3 compatible, or it might not support all 4 lanes.
- If you are using an adapter, it might not support be HBR3 compatible, or it might not support all 4 lanes.
- If your system has a hybrid GPU, that might be limiting the bandwidth available to the DisplayPort.

## Why are my HP Motion Controller models not showing up correctly in a game

While many games will work immediately with HP Motion Controllers, some games have dependencies on existing controllers features and might therefore have some issues:

- Wrong model displayed: fixing this requires a game update. Usually, this does not block any features of the game but might lead to confusion or even visual artifacts.
- Dependency on the Touchpad or more generally on the controller's input layout. SteamVR allows to create custom bindings to help circumvent this kind of issue:
    - Windows Mixed Reality for SteamVR includes custom bindings for some games. These bindings are used automatically when the game is started, and no user action is needed.
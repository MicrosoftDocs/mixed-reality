---
title: Updating your SteamVR application for Windows Mixed Reality
description: 
author: 
ms.author: thmignon
ms.date: 2/28/2018
ms.topic: article
keywords: 
---



# Updating your SteamVR application for Windows Mixed Reality

We encourage developers to test and optimize their SteamVR experiences to run on Windows Mixed Reality headsets. This documentation covers common improvements developers can make to ensure that their experience runs great on Windows Mixed Reality.

## Initial setup instructions

To start testing out your game or app on Windows Mixed Reality make sure to first follow our [getting started guide.](http://aka.ms/WindowsMixedRealitySteamVR)

## Controller Models
1. If your app renders controller models:
* Use the [Windows Mixed Reality motion controller models](motion-controllers.md#rendering-the-motion-controller-model)
* Use IVRRenderModel::GetComponentState to get local transforms to component parts (eg. Pointer pose)
2. Experiences that have a notion of handedness should get hints from the input APIs to differentiate controllers [(Unity example)](gestures-and-motion-controllers-in-unity.md#unity-buttonaxis-mapping-table)

## Controls

When designing or adjusting your control layout keep in mind the following set of reserved commands:
1. Clicking down the **left analog thumbstick** is reserved for the **Steam Dashboard**.
2. Clicking down the **right analog thumbstick** is reserved for switching **controller handedness**
3. The **Windows button** will always return users to the Windows Mixed Reality home.

If possible, default to thumb stick based teleportation to match the [Windows Mixed Reality home](navigating-the-windows-mixed-reality-home.md#getting-around-your-home) teleportation behavior

## Tooltips and UI

Many VR games take advantage of motion controller tooltips and overlays to teach users the most important commands for their game or app. When tuning your application for Windows Mixed reality we recommend reviewing this part of your experience to make sure the tooltips map to the Windows controller models.

Additionally if there are any points in your experience where you display images of the controllers make sure to provide updated images using the Windows Mixed Reality motion controllers.

## Haptics

Haptic feedback (vibration) for motion controllers is not yet enabled in the Windows Mixed Reality for SteamVR. This is something we are looking at for a future update.

## Windows Mixed Reality logo

To display Windows Mixed Reality support for your title, go to the "Edit Store Page" link on your App Landing Page, click the "Basic Info" tab, and scroll down to "Virtual Reality." Uncheck the "Hide Windows Mixed Reality" and then publish to the store.

## Bugs and feedback

Your feedback is invaluable when it comes to improving the Windows Mixed Reality SteamVR experience. Please submit all feedback and bugs through the [Windows Feedback Hub](https://docs.microsoft.com/en-us/windows/mixed-reality/enthusiast-guide/filing-feedback). Here are some [tips on how to make your SteamVR feedback as helpful as possible](https://docs.microsoft.com/en-us/windows/mixed-reality/enthusiast-guide/using-steamvr-with-windows-mixed-reality#sharing-feedback-on-steamvr).

If you have questions or comments to share, you can also reach us on our [Steam forum](http://steamcommunity.com/app/719950/discussions/).

## FAQs and troubleshooting

If you're running into general issues setting up or playing your experience, [check out the latest troubleshooting steps](https://docs.microsoft.com/en-us/windows/mixed-reality/enthusiast-guide/troubleshooting-windows-mixed-reality#steamvr).

## See also
* [Install the tools](install-the-tools.md)
* [Headset and motion controller driver history](https://docs.microsoft.com/en-us/windows/mixed-reality/enthusiast-guide/mixed-reality-software)
* [Windows Mixed Reality minimum PC hardware compatibility guidelines](https://docs.microsoft.com/en-us/windows/mixed-reality/enthusiast-guide/windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines)
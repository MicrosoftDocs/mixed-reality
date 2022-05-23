---
title: Updating SteamVR apps for Windows Mixed Reality
description: Best practices for updating your SteamVR application to maximize compatibility with Windows Mixed Reality headsets.
author: thmignon
ms.author: dacoulte
ms.date: 03/21/2018
ms.topic: article
keywords: SteamVR, Compatibility, porting, HoloLens 1st gen, mixed reality headset, windows mixed reality headset, migration, Windows 10, Steam, motion controllers, haptics
---


# Updating SteamVR apps for Windows Mixed Reality

We encourage developers to test and optimize their SteamVR experiences to run on Windows Mixed Reality headsets. This documentation covers common improvements you can make to get your experiences running great on Windows Mixed Reality.

## Initial setup instructions

To start testing out your game or app on Windows Mixed Reality make sure to first follow our [getting started guide.](/windows/mixed-reality/enthusiast-guide/using-steamvr-with-windows-mixed-reality)

## Controller Models

1. If your app renders controller models:
    * Use the [Windows Mixed Reality motion controller models](../../design/motion-controllers.md#rendering-the-motion-controller-model)
    * Use IVRRenderModel::GetComponentState to get local transforms to component parts (for example, Pointer pose)
2. Experiences that have a notion of handedness should get hints from the input APIs to differentiate controllers [(Unity example)](../unity/motion-controllers-in-unity.md#unity-buttonaxis-mapping-table)

## Controls

When designing or adjusting your control layout, keep in mind the following set of reserved commands:
1. Clicking down the **left and right analog thumbstick** is reserved for the **Steam Dashboard**.

> [!NOTE]
> If you're using an HP Reverb G2 controller, clicking the right menu button is reserved for the **Steam Dashboard**.

2. The **Windows button** will always return users to the Windows Mixed Reality home.

If possible, default to thumbstick-based teleportation to match the [Windows Mixed Reality home](../../discover/navigating-the-windows-mixed-reality-home.md#getting-around-your-home) teleportation behavior

## Tooltips and UI

Many VR games take advantage of motion controller tooltips and overlays to teach users their app or games most important commands. When tuning your application for Windows Mixed reality, we recommend reviewing this part of your experience to make sure the tooltips map to the Windows controller models.

Additionally if there are any points in your experience where you display images of the controllers make sure to provide updated images using the Windows Mixed Reality motion controllers.

## Haptics

Beginning with the [Windows 10 April 2018 Update](/windows/mixed-reality/enthusiast-guide/release-notes-april-2018), haptics are now supported for SteamVR experiences on Windows Mixed Reality. If your SteamVR app or game already includes support for haptics, it should now work (with no additional work) with [Windows Mixed Reality motion controllers](../../design/motion-controllers.md).

Windows Mixed Reality motion controllers use a standard haptics motor, as opposed to the linear actuators found in some other SteamVR motion controllers. This can lead to a slightly different-than-expected user experience. So, we recommend testing and tuning your haptics design with Windows Mixed Reality motion controllers. For example, sometimes short haptic pulses (5-10 ms) are less noticeable on Windows Mixed Reality motion controllers. To produce a more noticeable pulse, experiment with sending a longer “click” (40-70 ms) to give the motor more time to spin up before being told to power off again.

## Launching SteamVR apps from Windows Mixed Reality Start menu

For VR experiences distributed through Steam, we've [updated Windows Mixed Reality for SteamVR](https://steamcommunity.com/games/719950/announcements/detail/1687045485866139800) along with the latest [Windows releases](https://insider.windows.com). SteamVR titles now show up in the Windows Mixed Reality Start menu in the "All apps" list automatically.

## Windows Mixed Reality logo

To display Windows Mixed Reality support for your title, go to the "Edit Store Page" link on your App Landing Page, select the "Basic Info" tab, and scroll down to "Virtual Reality." Uncheck the "Hide Windows Mixed Reality" and then publish to the store.

## Bugs and feedback

Your feedback is invaluable when it comes to improving the Windows Mixed Reality SteamVR experience. Submit all feedback and bugs through the [Windows Feedback Hub](/windows/mixed-reality/enthusiast-guide/filing-feedback). Here are some [tips on how to make your SteamVR feedback as helpful as possible](/windows/mixed-reality/enthusiast-guide/using-steamvr-with-windows-mixed-reality#sharing-feedback-on-steamvr).

If you have questions or comments to share, you can also reach us on our [Steam forum](https://steamcommunity.com/app/719950/discussions/).

## FAQs and troubleshooting

If you're running into general issues setting up or playing your experience, [check out the latest troubleshooting steps](/windows/mixed-reality/enthusiast-guide/troubleshooting-windows-mixed-reality#steamvr).

## See also

* [Install the tools](../install-the-tools.md)
* [Headset and motion controller driver history](/windows/mixed-reality/enthusiast-guide/mixed-reality-software)
* [Windows Mixed Reality minimum PC hardware compatibility guidelines](/windows/mixed-reality/enthusiast-guide/windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines)
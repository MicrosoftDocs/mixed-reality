---
title: HoloLens troubleshooting
description: Troubleshooting steps for Microsoft HoloLens.
author: mattzmsft
ms.author: mazeller
ms.date: 03/21/2018
ms.topic: article
keywords: issues, bug, troubleshoot, fix, help, support, HoloLens
---



# HoloLens Troubleshooting

## My HoloLens is unresponsive or won’t boot

If your HoloLens won't boot:
* If the LEDs by the power button don't light up, or only 1 LED briefly blinks, you may need to charge your HoloLens.
* If the LEDs light up when you press the power button but you can't see anything on the displays, hold the power button until all 5 of the LEDs by the power button turn off.

If your HoloLens becomes frozen or unresponsive:
* Turn off your HoloLens by pressing the power button until all 5 of the LEDs by the power button turn themselves off, or for 10 seconds if the LEDs are unresponsive. Press the power button again to boot.

If these steps don't work:
* You can try [recovering your device](reset-or-recover-your-hololens.md).

## Holograms don't look good or are moving around.

If your holograms are unstable, jumpy, or don’t look right, try one of these fixes:
* Clean your device visor and make sure nothing is obstructing the sensors.
* Make sure there’s enough light in your room.
* Try walking around and looking at your surroundings so HoloLens can scan them more completely.
* Try running the Calibration app. It calibrates your HoloLens to work best for your eyes. Go to **Settings** > **System** > **Utilities**. Under Calibration, select **Open Calibration**.
* If you’re still having trouble after running the Calibration app, use the Sensor Tuning app to tune your device sensors. Go to **Settings** > **System** > **Utilities**. Under Sensor tuning, select **Open Sensor Tuning**.

## HoloLens doesn’t respond to my gestures.

To make sure HoloLens can see your gestures, keep your hand in the gesture frame, which extends a couple of feet on either side of you. When HoloLens can see your hand, the cursor will change from a dot to a ring. Learn more about using [gestures](gestures.md).

If your environment is too dark, HoloLens might not see your hand, so make sure there’s enough light.

If your visor has fingerprints or smudge, please use the microfiber cleaning cloth that came with the HoloLens to clean your visor gently.

## HoloLens doesn’t respond to my voice commands.

If Cortana isn’t responding to your voice commands, make sure Cortana is turned on. On the All apps list, select Cortana > Menu > Notebook > Settings to make changes. To learn more about what you can say, see Use your voice to control HoloLens.

## I can’t place holograms or see holograms I previously placed.

If HoloLens can’t map or load your space, it will enter Limited mode and you won’t be able to place holograms or see holograms you’ve placed. Here are some things to try:
* Make sure there’s enough light in your environment so HoloLens can see and map the space.
* Make sure you’re connected to a Wi-Fi network. If you’re not connected to Wi-Fi, HoloLens can’t identify and load a known space.
* If you need to create a new space, connect to Wi-Fi, then restart your HoloLens.
* To see if the correct space is active, or to manually load a space, go to **Settings** > **System** > **Spaces**.
* If the correct space is loaded and you’re still having problems, the space may be corrupt. To fix this, select the space, then select Remove. Once the space is removed, HoloLens will start mapping your surroundings and create a new space.

## My HoloLens frequently enters Limited mode or shows a “Tracking lost” message.

If your device often shows a "limited mode" or "tracking lost" message, try the suggestions from [My Holograms don't look good or are moving around](#holograms-dont-look-good-or-are-moving-around).

## My HoloLens can’t tell what space I’m in.

If your HoloLens can’t automatically identify and load the space you’re in, make sure you’re connected to Wi-Fi, there’s plenty of light in the room, and there haven’t been any major changes to the surroundings. You can also load a space manually or manage your spaces by going to **Settings** > **System** > **Spaces**.

## I’m getting a “low disk space” error.

You’ll need to free up some storage space by doing one or more of the following:
* Delete some unused spaces. Go to **Settings** > **System** > **Spaces**, select a space you no longer need, and then select **Remove**.
* Remove some of the holograms you’ve placed.
* Delete some pictures and videos in the Photos app.
* Uninstall some apps from your HoloLens. In the All apps list, tap and hold the app you want to uninstall, and then select **Uninstall**.

## My HoloLens can’t create a new space.

The most likely problem is that you’re running low on storage space. Try one of the [tips above](#im-getting-a-low-disk-space-error) to free up some disk space.

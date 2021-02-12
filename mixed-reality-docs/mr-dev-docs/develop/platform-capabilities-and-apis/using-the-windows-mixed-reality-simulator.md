---
title: Using the Windows Mixed Reality simulator
description: The Windows Mixed Reality simulator allows you to test mixed reality apps on your PC without a Windows Mixed Reality immersive headset.
author: pbarnettms
ms.author: pbarnett
ms.date: 04/25/2019
ms.topic: article
keywords: Windows Mixed Reality, Simulator, Testing
---


# Using the Windows Mixed Reality simulator

The Windows Mixed Reality simulator allows you to test mixed reality apps on your PC without a Windows Mixed Reality immersive headset. The simulator is available with the Windows 10 Creators Update. The simulator is similar to the [HoloLens Emulator](using-the-hololens-emulator.md), though the simulator doesn't use a virtual machine. Simulated apps run in your Windows 10 desktop user session, just like they would if you were using an immersive headset. The human and environmental inputs read by the sensors on an immersive headset are instead simulated using your keyboard, mouse, or Xbox controller. Apps don't need any modification to run in the simulator, and don't know they aren't running on an immersive headset.

## Enabling the Windows Mixed Reality simulator

1. **Enable Developer mode** from Settings -> Update and Security -> For developers
2. Launch the **Mixed Reality Portal** from the desktop
3. If this is your first time launching the portal, you'll need to go through the setup experience
   1. Select **Get started**
   2. Select **I agree** to accept the agreement
   3. Select **Set up for simulation (for developers)** to continue through setup without a physical device
   4. Select **Set up** to confirm your choice
4. Select the **For developers** button on the left side of the Mixed Reality Portal
5. Turn the Simulation toggle switch to **On**
   * Enabling simulation installs and enables the left simulated 6-DOF controller by default.  Before the Windows 10 May 2019 update, installing a simulated 6-DOF controller requires administrator permissions.  Accept the User Account Control dialog if one appears.

You should now be running with simulation!

If you want to disable Developer mode in Settings, you should first turn the Simulation toggle switch to **Off** in the **For developers** section of the Mixed Reality Portal.

## Deploying apps to the Mixed Reality simulator

Since the simulator runs on your local PC without a Virtual Machine, you can deploy your Universal Windows apps to the **Local Machine** when debugging.

## Basic simulator input

Controlling the simulator is similar to many common 3D video games and the [HoloLens emulator](using-the-hololens-emulator.md). There are input options available using the keyboard, mouse, or Xbox controller.

You control the simulator by directing the actions of a simulated user wearing an immersive headset. Your actions move the simulated user and cause interactions with apps that respond as they would on an immersive headset.
* **Walk forward, back, left, and right** - Use the W,A,S, and D keys on your keyboard, or the left stick on an Xbox controller.
* **Look up, down, left, and right** - Select and drag the mouse, use the arrow keys on your keyboard, or the right stick on an Xbox controller.
* **Action button press on controller** - Right-click the mouse, press the Enter key on your keyboard, or use the A button on an Xbox controller.
* **Home button press on controller** - Press the Windows key or F2 key on your keyboard, or press the B button on an Xbox controller.
* **Controller movement for scrolling** - Hold the Alt key and the right mouse button, then drag the mouse up / down. In an Xbox controller, hold down the right trigger and A button and move the right stick up and down.

## Tracked controllers

The Mixed Reality simulator can simulate up to two hand-held tracked motion controllers. Enable them using the toggle switches in the Mixed Reality Portal. Each simulated controller has:
* Position and orientation in space
* Home button
* Menu button
* Grip button
* Touchpad
* Thumbstick
* Battery level

## Next Development Checkpoint

If you're following the Unity development checkpoint journey we've laid out, you're in the midst of the deployment stage. From here, you can continue to the next [topic](../../develop/unity/unity-development-overview.md#4-deploying-to-a-device-or-emulator) or jump directly to adding advanced services.

> [!div class="nextstepaction"]
> [Advanced services](../../develop/unity/unity-development-overview.md#5-adding-services)


## See also
* [Using the HoloLens emulator](using-the-hololens-emulator.md)
* [Advanced Mixed Reality Simulator Input](advanced-hololens-emulator-and-mixed-reality-simulator-input.md)
* [Spatial mapping in Unity](../../develop/unity/spatial-mapping-in-unity.md)
* [Spatial mapping in DirectX](../../develop/native/spatial-mapping-in-directx.md)

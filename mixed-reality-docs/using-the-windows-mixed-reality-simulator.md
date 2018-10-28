---
title: Using the Windows Mixed Reality simulator
description: The Windows Mixed Reality simulator allows you to test mixed reality apps on your PC without a Windows Mixed Reality immersive headset. 
author: JonMLyons
ms.author: jlyons
ms.date: 03/21/2018
ms.topic: article
keywords: Windows Mixed Reality, Simulator, Testing
---



# Using the Windows Mixed Reality simulator

The Windows Mixed Reality simulator allows you to test mixed reality apps on your PC without a Windows Mixed Reality immersive headset. It is available beginning with the Windows 10 Creators Update. The simulator is similar to the [HoloLens emulator](using-the-hololens-emulator.md), though the simulator does not use a virtual machine. Apps running in the simulator run in your Windows 10 desktop user session, just like they would if you were using an immersive headset. The human and environmental input that would usually be read by the sensors on an immersive headset are instead simulated using your keyboard, mouse, or Xbox controller. Apps don't need to be modified to run in the simulator, and don't know that they aren't running on an immersive headset.

## Enabling the Windows Mixed Reality simulator
1. **Install the latest Windows Insider Preview Build** - 64-bit version is required. See [here](install-the-tools.md#installation-checklist) for more details.
2. **Enable Developer mode** from Settings -> Update and Security -> For developers
3. Launch the **Mixed Reality Portal** from the desktop
4. If this is your first time launching the portal, you'll need to go through the setup experience
  a. Click **Get started**
  b. Click **I agree** to accept the agreement
  c. Click **Set up for simulation (for developers)** to proceed through setup without a physical device
  d. Click **Set up** to confirm your choice
5. Click the **For developers** button on the left side of the Mixed Reality Portal
6. Turn the Simulation toggle switch to **On**
  a. This requires admin permissions and you must accept the User Account Control dialog that appears

You should now be running with simulation!

## Deploying apps to the Mixed Reality simulator

Since the simulator runs on your local PC without a Virtual Machine, you can simply deploy your Universal Windows apps to the **Local Machine** when debugging.

## Basic simulator input

Controlling the simulator is very similar to many common 3D video games and the [HoloLens emulator](using-the-hololens-emulator.md). There are input options available using the keyboard, mouse, or Xbox controller.

You control the simulator by directing the actions of a simulated user wearing an immersive headset. Your actions move the simulated user and cause interactions with apps that respond as they would on an immersive headset.
* **Walk forward, back, left, and right** - Use the W,A,S, and D keys on your keyboard, or the left stick on an Xbox controller.
* **Look up, down, left, and right** - Click and drag the mouse, use the arrow keys on your keyboard, or the right stick on an Xbox controller.
* **Action button press on controller** - Right-click the mouse, press the Enter key on your keyboard, or use the A button on an Xbox controller.
* **Home button press on controller** - Press the Windows key or F2 key on your keyboard, or press the B button on an Xbox controller.
* **Controller movement for scrolling** - Hold the Alt key, hold the right mouse button, and drag the mouse up / down, or in an Xbox controller hold the right trigger and A button down and move the right stick up and down.

## Tracked controllers

The Mixed Reality simulator can simulate up to two hand-held tracked motion controllers. Enable them using the toggle switches in the Mixed Reality Portal. Each simulated controller has:
* Position in space
* Home button
* Menu button
* Grip button
* Touchpad

## See also
* [Advanced Mixed Reality Simulator Input](advanced-hololens-emulator-and-mixed-reality-simulator-input.md)
* [Spatial mapping in Unity](spatial-mapping-in-unity.md)
* [Spatial mapping in DirectX](spatial-mapping-in-directx.md)

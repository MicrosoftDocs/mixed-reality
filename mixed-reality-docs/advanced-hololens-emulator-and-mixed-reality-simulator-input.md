---
title: Advanced HoloLens Emulator and Mixed Reality Simulator input
description: Detailed instructions for using the keyboard, mouse, and X-Box controller to simulate input for the HoloLens emulator and Windows Mixed Reality simulator.
author: JonMLyons
ms.author: jlyons
ms.date: 05/21/2018
ms.topic: article
keywords: HoloLens, Emulator, Simulation, Windows Mixed Reality
---



# Advanced HoloLens Emulator and Mixed Reality Simulator input

Most emulator users will only need to use the basic input controls for the [HoloLens emulator](using-the-hololens-emulator.md#basic-emulator-input) or the [Windows Mixed Reality simulator](using-the-windows-mixed-reality-simulator.md#basic-simulator-input). The details below are for advancd users who have found a need to simulate more complex types of input.

## Concepts

To get started controlling the virtual input to the HoloLens emulator and Windows Mixed Reality simulator, you should first understand a few concepts.

Motion is controlled with both rotation and translation (movement) along three axes.
* **Yaw**: Turn left or right.
* **Pitch**: Turn up or down.
* **Roll**: Roll side-to-side.
* **X**: Move left or right.
* **Y**: Move up or down.
* **Z**: Move forward or backward.

[Gesture](gestures.md) and motion controller input are mapped closely to how they physical devices:
* **Action**: This simulates the action of pressing the forefinger to the thumb or pulling the action button on a controller. For example, the Action input can be used to simulate the air-tap gesture, to scroll through content, and to press-and-hold.
* **[Bloom](gestures.md#bloom) or Home**: The HoloLens bloom gesture or a controller's Home button is used to return to the shell and to perform system actions.

You can also control the state of simulated sensor input:
* **Reset**: This will return all simulated sensors to their default values.
* **Tracking**: Cycles through the positional tracking modes. This includes:
   * **Default**: The OS chooses the best tracking mode based upon the requests made of the system.
   * **Orientation**: Forces Orientation-only tracking, regardless of the requests made of the system.
   * **Positional**: Forces Positional tracking, regardless of the requests made of the system.

## Types of input

The following table shows how each type of input maps to the keyboard, mouse, and Xbox controller. Each type has a different mapping depending on the input control mode; more information on input control modes is provided later in this document.

|  |  Keyboard |  Mouse |  Xbox controller | 
|----------|----------|----------|----------|
|  Yaw |  Left / right arrows |  Drag Left / Right |  Right thumbstick left / right | 
|  Pitch |  Up / down arrows |  Drag up / down |  Right thumbstick up / down | 
|  Roll |  Q / E |  |  DPad left / right | 
|  X |  A / D |  |  Left thumbstick left / right | 
|  Y |  Page up / page down |  |  DPad up / down | 
|  Z |  W / S |  |  Left thumbstick up / down | 
|  Action |  Enter or space |  Right button |  A button or either trigger | 
|  Bloom |  F2 or Windows key (Windows key only works with the HoloLens emulator) |  |  B button | 
|  Controller grip button |  G (Windows Mixed Reality simulator-only) |  |  | 
|  Controller menu button |  M (Windows Mixed Reality simulator-only) |  |  | 
|  Controller touchpad touch |  U (Windows Mixed Reality simulator-only) |  |  | 
|  Controller touchpad press |  P (Windows Mixed Reality simulator-only) |  |  | 
|  Reset |  Escape key |  |  Start button | 
|  Tracking |  T or F3 |  |  X button | 

## Input control modes

The emulator can be controlled in multiple modes, which impact how the controls are interpreted. The input modes are:
* **Default mode**: The default mode combines the most common operations for ease of use. This is the most commonly used mode.
* **Hands or controller mode**: The HoloLens emulator simulates gesture input with hands, while the Windows Mixed Reality simulator simulates tracked controllers. To enter this mode, press and hold an alt key on the keyboard: use left alt for the left hand/controller, and/or use right alt for the right hand/controller. You can also press and hold a shoulder button on the Xbox controller to enter this mode: press the left shoulder for the left hand/controller, and/or press the right shoulder for the right hand/controller.
   * Hands are typically not visible to the HoloLens emulator - they are made visible briefly when performing gestures such as [air-tap](gestures.md#air-tap) and bloom using the default input mode. This is a difference from tracked controllers in the Mixed Reality simulator. The corresponding Hand is also made visible when you enter hands mode, or when you click "Turn On" in the **Simulation** tab, which is located in the **Additional Tools** pane. * **Head mode**: The head mode applies controls, where appropriate, exclusively to the head. To enter head mode, press and hold the H key on the keyboard.

The following table shows how each input mode maps each type of input:

|  |  Default |  Hand/controller (Hold alt / shoulder) |  Head (Hold H) | 
|----------|----------|----------|----------|
|  Yaw |  Turn body left / right |  Move hand left / right |  Turn head left / right | 
|  Pitch |  Turn head up / down |  Move hand up / down |  Turn head Up / down | 
|  Roll |  Roll head left / right |  |  Roll head left / right | 
|  X |  Slide body left / right |  Move hand/controller left / right |  Turn head left / right | 
|  Y |  Move body up / down |  Move hand/controller up / down |  Turn head up / down | 
|  Z |  Move body forward / backward |  Move hand/controller forward / backward |  Turn head up / down | 
|  Action |  Perform action |  Perform action |  | 
|  Bloom / Home |  Perform bloom gesture or Home button press |  Perform bloom gesture or Home button press |  | 
|  Reset |  Reset to defaults |  Reset to defaults |  Reset to defaults | 
|  Tracking |  Cycle tracking |  Cycle tracking |  Cycle tracking | 

## Controlling an app

This article has described the complete set of input types and input modes that are available in the HoloLens emulator and Windows Mixed Reality simulator. The following set of controls is suggested for day-to-day use:

|  Operation |  Keyboard and mouse |  Controller | 
|----------|----------|----------|
|  Body X |  A / D |  Left thumbstick left / right | 
|  Body Y |  Page up / page down |  DPad up / down | 
|  Body Z |  W / S |  Left thumbstick up / down | 
|  Body Yaw |  Drag mouse left / right |  Right thumbstick left / right | 
|  Head Yaw |  H + drag mouse left / right |  H (on Keyboard) + right thumbstick left / right | 
|  Head Pitch |  Drag mouse up / down |  Right thumbstick up / down | 
|  Head Roll |  Q / E |  DPad left / right | 
|  Hand X |  Alt + drag mouse left / right |  Shoulder + right thumbstick left / right | 
|  Hand Y |  Alt + drag mouse up / down |  Shoulder + right thumbstick up / down | 
|  Hand Z |  Alt + W / S |  Shoulder + left thumbstick up / down | 
|  Action |  Right mouse button |  Trigger | 
|  Bloom / Home |  F2 or Windows key (Windows key is only for the HoloLens emulator) |  B button | 
|  Reset |  Escape |  Start button | 
|  Tracking |  T |  X button | 
|  Scrolling |  Alt + right mouse button + drag mouse up / down |  Shoulder + trigger + right thumbstick up / down | 

## See also
* [Install the tools](install-the-tools.md)
* [Using the HoloLens emulator](using-the-hololens-emulator.md)
* [Using the Windows Mixed Reality simulator](using-the-windows-mixed-reality-simulator.md)

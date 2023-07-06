---
title: Advanced HoloLens Emulator and Mixed Reality Simulator
description: Detailed instructions for using the keyboard, mouse, and Xbox controller to simulate input for the HoloLens Emulator and Windows Mixed Reality simulator.
author: pbarnettms
ms.author: pbarnett
ms.date: 06/8/2020
ms.topic: article
keywords: HoloLens, Emulator, Simulation, Windows Mixed Reality, mixed reality headset, windows mixed reality headset, virtual reality headset
---


# Advanced HoloLens Emulator and Mixed Reality Simulator input

Most emulator users will only need to use the basic input controls for the [HoloLens Emulator](using-the-hololens-emulator.md#basic-emulator-input) or the [Windows Mixed Reality simulator](using-the-windows-mixed-reality-simulator.md#basic-simulator-input). The details below are for advanced users who have found a need to simulate more complex types of input.

## Concepts

To get started controlling the virtual input to the HoloLens Emulator and Windows Mixed Reality simulator, you should first understand a few concepts.

Motion refers to controlling and changing the position and orientation of something in the scene. For a targeted controllable object, motion is controlled with both rotation and translation (movement) along three axes.
* **Yaw**: Turn left or right.
* **Pitch**: Turn up or down.
* **Roll**: Roll side-to-side.
* **X**: Move left or right.
* **Y**: Move up or down.
* **Z**: Move forward or backward.

Gesture and motion controller input are mapped closely to physical devices:
* **Action**: Simulates the action of pressing the forefinger to the thumb or pulling the action button on a controller. For example, the Action input can be used to simulate the air-tap gesture, to scroll through content, and to press-and-hold.
* **[Bloom](../../design/system-gesture.md#bloom)/System gesture or Home**: The HoloLens bloom/system gesture or a controller's Home button is used to return to the shell and to fire system actions.

Hands have a rich representation in HoloLens 2.  In addition to being tracked/not tracked and usable for driving gestures, hands now have an articulated skeleton model fit to them and exposed to the developer.  The skeleton model has 26 tracked points on each hand.  
* **Joint**: One of 20 tracked positions for a given tracked hand with an associated point in 3d space.
* **Pose**: A complete collection of all of the Joints in a tracked hand, 26 Joints in all. 

We don't currently expose direct control of individual joint positions through the emulator, but you can set them through the simulation API. We have a set of useful representative poses that the emulator allows you to toggle between.

You can also control the state of simulated sensor input:
* **Reset**: Returns all simulated sensors to their default values.  Starting with the HoloLens 2 Emulator, a reset can be scoped to one or both hands. Engage the desired hand(s) using the modifier key(s) or button(s) (Left and/or Right Alt, or the left and/or right bumper on the gamepad).
* **Tracking**: Cycles through the positional tracking modes, including:
  * **Default**: The OS chooses the best tracking mode based upon the requests made of the system.
   * **Orientation**: Forces Orientation-only tracking, no matter the system requests.
   * **Positional**: Forces Positional tracking, no matter the system requests.

## Types of input

The following table shows how each type of input maps to the keyboard, mouse, and Xbox controller. Each type has a different mapping depending on the input control mode. You can find more information on input control modes later in this document.

| Input |  Keyboard |  Mouse |  Xbox controller | 
|----------|----------|----------|----------|
|  Yaw |  Left / right arrows |  Drag Left / Right |  Right thumbstick left / right | 
|  Pitch |  Up / down arrows |  Drag up / down |  Right thumbstick up / down | 
|  Roll |  Q / E |  |  DPad left / right | 
|  X |  A / D |  |  Left thumbstick left / right | 
|  Y |  Page up / page down |  |  DPad up / down | 
|  Z |  W / S |  |  Left thumbstick up / down | 
|  Action |  Enter or space |  Right button |  A button or either trigger | 
|  Bloom/System |  F2 or Windows key |  |  B button | 
|  Controller grip button / Hand grasp |  G  |  |  | 
|  Controller menu button |  M  |  |  | 
|  Controller touchpad touch |  U  |  |  | 
|  Controller touchpad press |  P  |  |  | 
|  Controller thumbstick press |  K  |  |  | 
|  Left controller tracking state |  F9 |  |  | 
|  Right controller tracking state |  F10 |  |  | 
|  Hand 'Close' Pose | 7 |  |  |
|  Hand 'Open' Pose (default) | 8 |  |  |
|  Hand 'Point' Pose | 9 |  |  |
|  Hand 'Pinch' Pose | 0 |  |  |
|  Reset |  Escape key |  |  Start button | 
|  Tracking |  T or F3 |  |  X button | 


Note: The controller buttons can be targeted to one hand/controller or the other using the hand targeting modifiers.

## Targeting 

Some of the above input concepts stand on their own.  Action, Bloom/System, Reset, and Tracking are complete concepts, don't need, and are not affected by, any additional modifiers for targeting.  The remaining concepts can be applied to one of multiple targets. We have introduced ways for you to specify which intended target your command should be applied to.  In all cases, it's possible to specify through the UI or through keyboard presses, which object to target.  In some cases, it's also possible to specify with the xbox controller directly. 

The following table describes the options for targeting, and the way to activate each of them.

| Object | Keyboard Modifier | Controller Modifier | Emulator UI Modifier |
|----------|----------|----------|----------|
| Body | (default) | (default) | (default) |
| Head | Hold H | (Not available) | (Not available) |
| Left Hand/Controller | Hold Left Alt button | Hold Left Shoulder Button | Left-Hand pushpin | 
| Right Hand/Controller | Hold Right Alt Button | Hold Right Shoulder Button | Right-Hand pushpin |
| Eyes | Hold Y | (Not available) | Eyes Pushpin |
  
The following table shows how each target modifier maps each of the core movement input concepts

| Input | Default (Body) |  Hand/controller (Hold Alt, hold gamepad shoulder button, or toggle UI pushpin) |  Head (Hold H)  |  Eyes (Hold Y or toggle UI pushpin) |
|----------|----------|----------|----------|----------|
|  Yaw |  Turn body left / right |  Move hand left / right |  Turn head left / right | Eye gaze looks left/right |
|  Pitch |  Turn head up / down |  Move hand up / down |  Turn head Up / down | Eye gaze looks up/down | 
|  Roll |  Roll head left / right |  |  Roll head left / right | (No action) |
|  X |  Slide body left / right |  Move hand/controller left / right |  Turn head left / right | (No Action) |
|  Y |  Move body up / down |  Move hand/controller up / down |  Turn head up / down | (No Action) |
|  Z |  Move body forward / backward |  Move hand/controller forward / backward |  Turn head up / down | (No Action) |
 
 
## Controlling an app

The following set of controls is suggested for day-to-day use:

|  Operation |  Keyboard and mouse |  Controller | 
|----------|----------|----------|
|  Body X |  A / D |  Left thumbstick left / right | 
|  Body Y |  Page up / page down |  DPad up / down | 
|  Body Z |  W / S |  Left thumbstick up / down | 
|  Body Yaw |  Drag mouse left / right |  Right thumbstick left / right | 
|  Head Yaw |  H + drag mouse left / right |  H (on Keyboard) + right thumbstick left / right | 
|  Head Pitch |  Drag mouse up / down |  Right thumbstick up / down | 
|  Head Roll |  Q / E |  DPad left / right | 
|  Hand/Controller X |  Alt + A / D |  Shoulder + left thumbstick left / right | 
|  Hand/Controller Y |  Alt + Page up / page down |  Shoulder + DPad up / down | 
|  Hand/Controller Z |  Alt + W / S |  Shoulder + Left thumbstick up / down | 
|  Hand/Controller Yaw |  Alt + drag mouse left / right |  Shoulder + right thumbstick left / right | 
|  Hand/Controller Pitch |  Alt + drag mouse up / down |  Shoulder + right thumbstick up / down | 
|  Hand/Controller Roll |  Alt + Q / E |  Shoulder + DPad left / right | 
|  Action |  Right mouse button |  Trigger | 
|  Bloom / System / Home |  F2 or Windows key |  B button | 
|  Reset |  Escape |  Start button | 
|  Tracking |  T |  X button | 
|  Scrolling |  Alt + right mouse button + drag mouse up / down |  Shoulder + trigger + right thumbstick up / down | 
|  Move/rotate faster | Left or right Shift key | Press and hold the right thumbstick |
|  Move/rotate slow | Left or right Ctrl key | Press and hold the left thumbstick |

## Using a Windows Mixed Reality immersive headset and motion controllers with the HoloLens 2 Emulator

When using a Windows Mixed Reality immersive headset with the HoloLens 2 Emulator, movement and rotation are automatically mapped to headset movement and rotation.  Motion controller position and orientation are automatically mapped to hand position and orientation in the emulator.  The table below lists additional actions available when using a motion controller.

> [!NOTE]
> When using a headset, standard keyboard, mouse, and gamepad controls are automatically ignored.

|  Operation |  Action |  Notes | 
|----------|----------|----------|
|  Body X |  Thumbstick Left / Right |   | 
|  Body Z |  Thumbstick Forward / Back |   | 
|  Body Y |  Keyboard Page Up /Down | Ensure that Windows Mixed Reality has focus.  Press Win+Y if focus is on the Windows Desktop to return focus to Windows Mixed Reality. |
|  Eyes Look Left / Right |  DPad Left / Right | |
|  Eyes Look Up / Down | DPad Up / Down | |
|  Tap | Trigger | |
|  Pinch/Grasp | Grip button | |
|  System Gesture | Menu button | |
|  Reset Position | Thumbstick click | |

## Perception Simulation Control Panel keyboard shortcuts

You can access the Perception Simulation Control panel and enable or disable PC input devices with the following keyboard shortcuts.

| Operation | Shortcut | Description/Notes |
|-----------|----------|-------------|
| Toggle 'Use keyboard for simulation' | F4 | When turned off, keyboard input goes to the HoloLens or Windows Mixed Reality application. |
| Toggle 'Use mouse for simulation' | F5 | When turned off, mouse input goes to the Mixed Reality environment (Windows Mixed Reality only) |
| Toggle 'Use gamepad for simulation' | F6 | When turned off, gamepad input is ignored by simulation |
| Show or hide the control panel | F7 | |
| Set keyboard focus to the control panel | F8 | If the panel is not currently visible, it will be shown first. |
| Dock or undock the panel to/from the emulator or Mixed Reality Portal window | F9 | If the window is closed when undocked, it's docked and hidden. |

## See also
* [Install the tools](../install-the-tools.md)
* [Using the HoloLens emulator](using-the-hololens-emulator.md)
* [Using the Windows Mixed Reality simulator](using-the-windows-mixed-reality-simulator.md)

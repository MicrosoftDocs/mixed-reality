---
title: Advanced HoloLens Emulator and Mixed Reality Simulator input
description: Detailed instructions for using the keyboard, mouse, and X-Box controller to simulate input for the HoloLens emulator and Windows Mixed Reality simulator.
author: ChimeraScorn
ms.author: cwhite
ms.date: 02/24/2018
ms.topic: article
keywords: HoloLens, Emulator, Simulation, Windows Mixed Reality
---



# Advanced HoloLens Emulator and Mixed Reality Simulator input

Most emulator users will only need to use the basic input controls for the [HoloLens emulator](using-the-hololens-emulator.md#basic-emulator-input) or the [Windows Mixed Reality simulator](using-the-windows-mixed-reality-simulator.md#basic-simulator-input). The details below are for advanced users who have found a need to simulate more complex types of input.

> [!NOTE]
> More guidance specific to HoloLens 2 [coming soon](index.md#news-and-notes).

## Concepts

To get started controlling the virtual input to the HoloLens emulator and Windows Mixed Reality simulator, you should first understand a few concepts.

Motion refers to controlling and changing the position and orientation of something in the scene. For a targeted controllable object, motion is controlled with both rotation and translation (movement) along three axes.
* **Yaw**: Turn left or right.
* **Pitch**: Turn up or down.
* **Roll**: Roll side-to-side.
* **X**: Move left or right.
* **Y**: Move up or down.
* **Z**: Move forward or backward.

[Gesture](gestures.md) and motion controller input are mapped closely to how they physical devices:
* **Action**: This simulates the action of pressing the forefinger to the thumb or pulling the action button on a controller. For example, the Action input can be used to simulate the air-tap gesture, to scroll through content, and to press-and-hold.
* **[Bloom](gestures.md#bloom) or Home**: The HoloLens bloom gesture or a controller's Home button is used to return to the shell and to perform system actions.

Hands have a rich reprresentation in HoloLens V2.  In addition to being tracked/not tracked, and usable for driving gestures, hands now have an articulated skeleton model fit to them and exposed to the developer.  This introduces 20 tracked points on each hand.  
* **Joint**: One of twenty tracked positions for a given tracked hand. This will have a point is 3d space associated with it.
* **Pose**: A complete collection of all of the Joints in a tracked hand. At this time, this is a collection of 20 Joints. 

At this time, we do not expose direct control of each joint position individually through the emulator UI. though you may set them through the simulation API. Rather, we have a set of useful representative poses that the emulator allows you to toggle between.

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
|  Set Hand Pose | 7, 8, 9, or 0 |  |  |
|  Reset |  Escape key |  |  Start button | 
|  Tracking |  T or F3 |  |  X button | 


Note: In the Windows Mixed Reality simulator only, the controller buttons can be targetted to one hand or the other using the hand targeting modifiers.

## Targeting 

Some of the above input concepts stand on their own.  Action, Bloom, Reset, and Tracking are complete concepts, do not need, and are not affected by, any additional modifiers for targeting.  However, the remaining concepts can be applied to one of multiple targets. We have introduced ways for you to specify which intended target your command should be applied to.  In all cases, it is possible to specify through the UI or through keyboard presses, which object to targtet.  In some cases, it is also possible to specify with the xbox controller directly. 

The following table describe the options for targeting, and the way to activate each of them.

| Object | Keyboard Modifier | Controller Modifier | Emulator UI Modifier |
|----------|----------|----------|----------|
| Body | <default> | <default> | <default> |
| Head | Hold H | <None available> | Head Pushpin in the UI |
| Left Hand/Controller | Left Alt button | Left Shoulder Button | Left Hand PushPin | 
| Right Hand/Controller | Right Alt Button | Right Shoulder Button | Right Hand PushPin |
| Eyes | Hold Y | <No contoller modifier available> | Eyes pushpin |
  
The following table shows how each target modifier maps each of the core movement input concepts

|  Default (Body) |  Hand/controller (Hold alt / shoulder) |  Head (Hold H)  |  Eyes (Hold Y) |
|----------|----------|----------|----------|
|  Yaw |  Turn body left / right |  Move hand left / right |  Turn head left / right | Eye gaze looks left/right |
|  Pitch |  Turn head up / down |  Move hand up / down |  Turn head Up / down | Eye gaze looks up/down | 
|  Roll |  Roll head left / right |  |  Roll head left / right | (No action) |
|  X |  Slide body left / right |  Move hand/controller left / right |  Turn head left / right | (No Action) |
|  Y |  Move body up / down |  Move hand/controller up / down |  Turn head up / down | (No Action) |
|  Z |  Move body forward / backward |  Move hand/controller forward / backward |  Turn head up / down | (No Action) |
 
Note: In the Windows Mixed Reality simulator only, the controller buttons can be targetted to one hand or the other using the hand targeting modifiers. Likewise, in the HoloLens emulator only, the articulated hand pose's can be targetted to one hand or the other using the hand modifiers. 
 
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

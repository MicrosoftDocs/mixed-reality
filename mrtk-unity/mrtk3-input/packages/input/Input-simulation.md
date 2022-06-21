---
title: Input simulation -- MRTK3
description: Input simulation in MRTK3
author: davidkline-ms
ms.author: davidkl
ms.date: 6/7/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, Mixed Reality Toolkit, input simulation
---

# Input simulation -- MRTK3

With MRTK's input simulation, you can test various types of interactions in the Unity editor without building and deploying them to a device. The input simulation allows you to quickly iterate your ideas in the design and development process. Use keyboard and mouse combinations to control simulated inputs.

The Input Simulation Service emulates the behavior of devices and platforms that may not be available in the Unity editor. Examples include:

- HoloLens or VR device head tracking
- HoloLens hand gestures
- HoloLens 2 articulated hand tracking
- HoloLens 2 eye-tracking

> [!WARNING]
> Input simulation doesn't work when using Unity's XR Holographic Emulation > Emulation Mode = "Simulate in Editor." Unity's in-editor simulation will take control away from MRTK's input simulation. To use MRTK's input simulation, you'll need to set XR Holographic Emulation to:

  Emulation Mode = _"None"_.

## How to use MRTK3 Input simulation (MRTK3 Input Simulator Default Controls)

### Camera

#### Movement

| Action            | Device(s) | Controls                | Control Set | Notes |
| ----------------- | --------- | ----------------------- | ----------- | ----- |
| Move horizontally | Keyboard  | A / D                   | All         |       |
|                   | Keyboard  | Left / Right Arrows     | All         |       |
| Move vertically   | Keyboard  | Q / E or Page Up / Down | All         |       |
|                   | Keyboard  | Page Up / Page Down     | All         |       |
| Move in depth     | Keyboard  | W / S                   | All         |       |
|                   | Keyboard  | Up / Down Arrows        | All         |       |

#### Rotation

| Action | Device(s) | Controls                       | Control Set | Notes |
| ------ | --------- | ------------------------------ | ----------- | ----- |
| Pitch  | Mouse     | Right Button + Forward / Back  | All         |       |
| Yaw    | Mouse     | Right Button + Left / Right    | All         |       |
| Roll   | Mouse     | Right Button + Wheel Up / Down | All         |       |

### Eye Gaze

> [!NOTE]
> To better match the behavior of hardware that provides eye tracking support, when enabled, simulated eye gaze is always tracked.

#### Look

| Action            | Device(s)        | Controls                 | Control Set | Notes |
| ----------------- | ---------------- | ------------------------ | ----------- | ----- |
| Look horizontally | Keyboard + Mouse | Tab + Mouse Left / Right | All         |       |
| Look vertically   | Keyboard + Mouse | Tab + Mouse Up / Down    | All         |       |

### Left Hand / Controller

#### Tracking

| Action             | Device(s) | Controls   | Control Set | Notes                                                      |
| ------------------ | --------- | ---------- | ----------- | ---------------------------------------------------------- |
| Latched tracking   | Keyboard  | T          | All         | Toggles the left hand on/off at a pre-determined location  |
| Momentary tracking | Keyboard  | Left Shift | All         | Toggles the left hand on/off at the current mouse location |
|                    | Keyboard  | Left Alt   | MRTK v3     |                                                            |
|                    | Keyboard  | Left Ctrl  | MRTK v2     |                                                            |

#### Movement

| Action            | Device(s)        | Controls                           | Control Set | Notes |
| ----------------- | ---------------- | ---------------------------------- | ----------- | ----- |
| Move horizontally | Keyboard + Mouse | Left Shift + Mouse Left / Right    | All         |       |
| Move vertically   | Keyboard + Mouse | Left Shift + Mouse Up / Down       | All         |       |
| Move in depth     | Keyboard + Mouse | Left Shift + Mouse Wheel Up / Down | All         |       |

#### Rotation

| Action | Device(s)        | Controls                          | Control Set | Notes |
| ------ | ---------------- | --------------------------------- | ----------- | ----- |
| Pitch  | Keyboard + Mouse | Left Alt + Mouse Forward / Back   | MRTK v3     |       |
|        | Keyboard + Mouse | Left Ctrl + Mouse Forward / Back  | MRTK v2     |       |
| Yaw    | Keyboard + Mouse | Left Ctrl + Mouse Left / Right    | MRTK v3     |       |
|        | Keyboard + Mouse | Left Ctrl + Mouse Left / Right    | MRTK v2     |       |
| Roll   | Keyboard + Mouse | Left Alt + Mouse Wheel Up / Down  | MRTK v3     |       |
|        | Keyboard + Mouse | Left Ctrl + Mouse Wheel Up / Down | MRTK v2     |       |

#### Interaction

| Action           | Device(s)        | Controls                       | Control Set | Notes |
| ---------------- | ---------------- | ------------------------------ | ----------- | ----- |
| Grip (button)    | Keyboard         | Left Shift + G                 | All         |       |
|                  | Keyboard         | Left Alt + G                   | MRTK v3     |       |
|                  | Keyboard         | Left Ctrl + G                  | MRTK v2     |       |
| Trigger (button) | Keyboard + Mouse | Left Shift + Left Mouse Button | All         |       |
|                  | Keyboard + Mouse | Left Alt + Left Mouse Button   | MRTK v3     |       |
|                  | Keyboard + Mouse | Left Ctrl + Left Mouse Button  | MRTK v2     |       |

#### Poses

| Action              | Device(s) | Controls       | Control Set | Notes                                                                                                         |
| ------------------- | --------- | -------------- | ----------- | ------------------------------------------------------------------------------------------------------------- |
| Change Neutral Pose | Keyboard  | Left Shift + P | All         | Switches the neutral (at rest) hand pose between flat and the ready position.                                 |
| Face the Camera     | Keyboard  | Left Shift + F | All         | Toggles the controller rotation between facing the camera and being aligned with the camera's forward vector. |

### Right Hand / Controller

#### Tracking

| Action             | Device(s) | Controls   | Control Set | Notes                                                      |
| ------------------ | --------- | ---------- | ----------- | ---------------------------------------------------------- |
| Latched tracking   | Keyboard  | Y          | All         | Toggles the left hand on/off at a pre-determined location  |
| Momentary tracking | Keyboard  | Space      | All         | Toggles the left hand on/off at the current mouse location |
|                    | Keyboard  | Left Ctrl  | MRTK v3     |                                                            |
|                    | Keyboard  | Right Ctrl | MRTK v2     |                                                            |

#### Movement

| Action            | Device(s)        | Controls                      | Control Set | Notes |
| ----------------- | ---------------- | ----------------------------- | ----------- | ----- |
| Move horizontally | Keyboard + Mouse | Space + Mouse Left / Right    | All         |       |
| Move vertically   | Keyboard + Mouse | Space + Mouse Up / Down       | All         |       |
| Move in depth     | Keyboard + Mouse | Space + Mouse Wheel Up / Down | All         |       |

#### Rotation

| Action | Device(s)        | Controls                           | Control Set | Notes |
| ------ | ---------------- | ---------------------------------- | ----------- | ----- |
| Pitch  | Keyboard + Mouse | Left Ctrl + Mouse Forward / Back   | MRTK v3     |       |
|        | Keyboard + Mouse | Right Ctrl + Mouse Forward / Back  | MRTK v2     |       |
| Yaw    | Keyboard + Mouse | Left Ctrl + Mouse Left / Right     | MRTK v3     |       |
|        | Keyboard + Mouse | Right Ctrl + Mouse Left / Right    | MRTK v2     |       |
| Roll   | Keyboard + Mouse | Left Ctrl + Mouse Wheel Up / Down  | MRTK v3     |       |
|        | Keyboard + Mouse | Right Ctrl + Mouse Wheel Up / Down | MRTK v2     |       |

#### Interaction

| Action           | Device(s)        | Controls                       | Control Set | Notes |
| ---------------- | ---------------- | ------------------------------ | ----------- | ----- |
| Grip (button)    | Space + G        | All                            |             |
|                  | Keyboard         | Left Ctrl + G                  | MRTK v3     |       |
|                  | Keyboard         | Right Ctrl + G                 | MRTK v2     |       |
| Trigger (button) | Keyboard + Mouse | Space + Left Mouse Button      | All         |       |
|                  | Keyboard + Mouse | Left Ctrl + Left Mouse Button  | MRTK v3     |       |
|                  | Keyboard + Mouse | Right Ctrl + Left Mouse Button | MRTK v2     |       |

#### Poses

| Action              | Device(s) | Controls  | Control Set | Notes                                                                                                         |
| ------------------- | --------- | --------- | ----------- | ------------------------------------------------------------------------------------------------------------- |
| Change Neutral Pose | Keyboard  | Space + P | All         | Switches the neutral (at rest) hand pose between flat and the ready position.                                 |
| Face the Camera     | Keyboard  | Space + F | All         | Toggles the controller rotation between facing the camera and being aligned with the camera's forward vector. |

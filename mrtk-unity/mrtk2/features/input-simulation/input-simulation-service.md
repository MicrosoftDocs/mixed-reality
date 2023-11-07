---
title: Input simulation service
description: Documentation on Input simulation service in MRTK
author: CDiaz-MS
ms.author: cadia
ms.date: 01/12/2021
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK,
---

# Input simulation service &#8212; MRTK2

![MRTK Input Simulation](../images/input-simulation/MRTK_InputSimulation_Hero.jpg)

With MRTK's input simulation, you can test various types of interactions in the Unity editor without building and deploying to a device. This allows you quickly iterate your ideas in the design and development process. Use keyboard and mouse combinations to control simulated inputs.

The Input Simulation Service emulates the behavior of devices and platforms that may not be available in the Unity editor. Examples include:

* HoloLens or VR device head tracking
* HoloLens hand gestures
* HoloLens 2 articulated hand tracking
* HoloLens 2 eye tracking
* VR device controllers

> [!WARNING]
> This does not work when using Unity's XR Holographic Emulation > Emulation Mode = "Simulate in Editor". Unity's in-editor simulation will take control away from MRTK's input simulation. In order to use the MRTK input simulation service, you will need to set XR Holographic Emulation to Emulation Mode = *"None"*

## How to use MRTK Input simulation 

Input simulation is enabled by default in the profiles that ship with MRTK. You can simply click **Play** button to run the scene with input simulation support.

* Press **W, A, S, D, Q, E** keys to move the camera.
* Hold the **Right mouse button** and move the mouse to look around.
* To bring up the simulated hands, press **Space bar(Right hand)** or **Left Shift key(Left hand)**
* To keep simulated hands in the view, press **T** or **Y** key
* To rotate simulated hands, press and hold **Ctrl key** and move mouse

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4OYrm]

## In editor input simulation cheat sheet

Press **Left Ctrl + H** in the HandInteractionExamples scene to bring up a cheat sheet with Input simulation controls.

> ![MRTK Input Simulation Cheat Sheet](../images/input-simulation/MRTK_InputSimulation_CheatSheet.png)


## Enabling the input simulation service

Under the Input System Data provider configuration, the Input Simulation service can be configured with the following.

* **Type** must be *Microsoft.MixedReality.Toolkit.Input > InputSimulationService*.
* **Supported Platform(s)** by default includes all *Editor* platforms, since the service uses keyboard and mouse input.

> [!NOTE]
> The Input Simulation service can be used on other platform endpoints such as standalone by changing the **Supported Platform(s)** property to include the desired targets.
> <br/><img src="../images/input-simulation/InputSimulationSupportedPlatforms.gif" alt="Input Simulation Supported Platforms" width="550px">

## Camera control

Head movement can be emulated by the Input Simulation Service.

### Rotating the camera

1. Hover over the viewport editor window.
    *You may need to click the window to give it input focus if button presses don't work.*
1. Press and hold the **Mouse Look Button** (default: Right mouse button).
1. Move the mouse in the viewport window to rotate the camera.
1. Use the scroll wheel to roll the camera around the view direction.

Camera rotation speed can be configured by changing the **Mouse Look Speed** setting in the input simulation profile.

Alternatively, use the **Look Horizontal**/**Look Vertical** axes to rotate the camera (default: game controller right thumbstick).

### Moving the camera

Use the **Move Horizontal**/**Move Vertical** axes to move the camera (default: WASD keys or game controller left thumbstick).

Camera position and rotation angles can be set explicitly in the tools window, as well. The camera can be reset to its default using the **Reset** button.

> [!VIDEO https://www.youtube.com/embed/Z7L4I1ET7GU]

## Controller simulation

The input simulation supports emulated controller devices (i.e. motion controllers and hands). These virtual controllers can interact with any object that supports regular controllers, such as buttons or grabbable objects.

### Controller simulation mode

In the [input simulation tools window](#input-simulation-tools-window) the **Default Controller Simulation Mode** setting switches between three distinct input models. This default mode can also be set in the input simulation profile.

* *Articulated Hands*: Simulates a fully articulated hand device with joint position data.

   Emulates HoloLens 2 interaction model.

   Interactions that are based on the precise positioning of the hand or use touching can be simulated in this mode.

* *Hand Gestures*: Simulates a simplified hand model with air tap and basic gestures.

   Emulates [HoloLens interaction model](/windows/mixed-reality/gestures).

   Focus is controlled using the Gaze pointer. The *Air Tap* gesture is used to interact with buttons.

* *Motion Controller*: Simulates a motion controller used with VR headsets that works similarly to far interactions with Articulated Hands.

   Emulates VR headset with controllers interaction model.

   The trigger, grab and menu keys are simulated via keyboard and mouse input.

### Simulating controller movement

Press and hold the **Left/Right Controller Manipulation Key** (default: *Left Shift* for left controller and *Space* for right controller) to gain control of either controller. While the manipulation key is pressed, the controller will appear in the viewport. Once the manipulation key is released, the controllers will disappear after a short **Controller Hide Timeout**.

Controllers can be toggled on and frozen relative to the camera in the [input simulation tools window](#input-simulation-tools-window) or by pressing the **Toggle Left/Right Controller Key** (default: *T* for left and *Y* for right). Press the toggle key again to hide the controllers again. To manipulate the controllers, the **Left/Right Controller Manipulation Key** needs to be held. Double tapping the **Left/Right Controller Manipulation Key** can also toggle the controllers on/off.

Mouse movement will move the controller in the view plane. Controllers can be moved further or closer to the camera using the **mouse wheel**.

To rotate controllers using the mouse, hold both the **Left/Right Controller Manipulation Key** (*Left Shift* or *Space*) *and* the **Controller Rotate Button** (default: *Left Ctrl* button) and then move the mouse to rotate the controller. Controller rotation speed can be configured by changing the **Mouse Controller Rotation Speed** setting in the input simulation profile.

All hand placement can also changed in the [input simulation tools window](#input-simulation-tools-window), including resetting hands to default.

### Additional profile settings

* **Controller Depth Multiplier** controls the sensitivity of the mouse scroll wheel depth movement. A larger number will speed up controller zoom.
* **Default Controller Distance** is the initial distance of controllers from the camera. Clicking the **Reset** button controllers will also place controllers at this distance.
* **Controller Jitter Amount** adds random motion to controllers. This feature can be used to simulate inaccurate controller tracking on the device, and ensure that interactions work well with noisy input.

> [!VIDEO https://www.youtube.com/embed/uRYfwuqsjBQ]

### Hand gestures

Hand gestures such as pinching, grabbing, poking, etc. can also be simulated.

1. Enable hand control using the **Left/Right Controller Manipulation Key** (*Left Shift* or *Space*)

2. While manipulating, press and hold a mouse button to perform a hand gesture.

Each of the mouse buttons can be mapped to transform the hand shape into a different gesture using the *Left/Middle/Right Mouse Hand Gesture* settings. The *Default Hand Gesture* is the shape of the hand when no button is pressed.

> [!NOTE]
> The *Pinch* gesture is the only gesture that performs the "Select" action at this point.

### One-hand manipulation

1. Press and hold **Left/Right Controller Manipulation Key** (*Left Shift* or *Space*)
2. Point at object
3. Hold mouse button to pinch
4. Use your mouse to move the object
5. Release the mouse button to stop interaction

> [!VIDEO https://www.youtube.com/embed/rM0xaHam6wM]

### Two-hand manipulation

For manipulating objects with two hands at the same time, the persistent hand mode is recommended.

1. Toggle on both hands by pressing the toggle keys (*T/Y*).
1. Manipulate one hand at a time:
    1. Hold **Space** to control the right hand
    1. Move the hand to where you want to grab the object
    1. Press the **left mouse button** to activate the *Pinch* gesture.
    1. Release **Space** to stop controlling the right hand. The hand will be frozen in place and be locked into the *Pinch* gesture since it is no longer being manipulated.
1. Repeat the process with the other hand, grabbing the same object in a second spot.
1. Now that both hands are grabbing the same object, you can move either of them to perform two-handed manipulation.

> [!VIDEO https://www.youtube.com/embed/Qol5OFNfN14]

### GGV (Gaze, Gesture, and Voice) interaction

By default, GGV interaction is enabled in-editor while there are no articulated hands present in the scene.

1. Rotate the camera to point the gaze cursor at the interactable object (right mouse button)
1. Click and hold **left mouse button** to interact
1. Rotate the camera again to manipulate the object

You can turn this off by toggling the *Is Hand Free Input Enabled* option inside the Input Simulation Profile.

In addition, you can use simulated hands for GGV interaction

1. Enable GGV simulation by switching **Hand Simulation Mode** to *Gestures* in the [Input Simulation Profile](#enabling-the-input-simulation-service)
1. Rotate the camera to point the gaze cursor at the interactable object (right mouse button)
1. Hold **Space** to control the right hand
1. Click and hold **left mouse button** to interact
1. Use your mouse to move the object
1. Release the mouse button to stop interaction

> [!VIDEO https://www.youtube.com/embed/6841rRMdqWw]

### Raising Teleport Events

To raise the teleport event in input simulation, configure the Hand Gesture Settings in the Input Simulation Profile so that one performs the **Teleport Start** Gesture while the other performs the **Teleport End** Gesture. 
The **Teleport Start** gesture will bring up the Teleport Pointer, while the **Teleport End** gesure will complete the teleport action and move the user.

The y-position of your resulting teleport is dependent on the camera's displacement along the y-axis. In editor, this is 0 by default, so use the **Q** and **E** keys to adjust it to the appropriate height.

![Input Simulation Teleport Settings](../images/input-simulation/InputSimulationTeleport.gif)

### Motion controller interaction

The simulated motion controllers can be manipulated the same way articulated hands are. The interaction model is similar to far interaction of articulated hand while the trigger, grab and menu keys are mapped to *left mouse button*, *G* and *M* key respectively.

### Eye tracking

[Eye tracking simulation](../input/eye-tracking/eye-tracking-basic-setup.md#simulating-eye-tracking-in-the-unity-editor) can be enabled by checking the **Simulate Eye Position** option in the
[Input Simulation Profile](#enabling-the-input-simulation-service). This should not be used with GGV or motion controller
style interactions (so ensure that **Default Controller Simulation Mode** is set to *Articulated Hand*).

## Input simulation tools window

Enable the input simulation tools window from the  **Mixed Reality** > **Toolkit** > **Utilities** > **Input Simulation** menu. This window provides access to the state of input simulation during play mode.

## Viewport buttons (optional)

A prefab for in-editor buttons to control basic hand placement can be specified in the input simulation profile under **Indicators Prefab**. This is an optional utility, the same features can be accessed in the [input simulation tools window](#input-simulation-tools-window).

> [!NOTE]
> The viewport indicators are disabled by default, as they currently can sometimes interfere with Unity UI interactions. See issue [#6106](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/6106). To enable, add the InputSimulationIndicators prefab to **Indicators Prefab**.

Hand icons show the state of the simulated hands:

* ![Untracked hand icon](../images/input-simulation/MRTK_InputSimulation_HandIndicator_Untracked.png) The hand is not tracking. Click to enable the hand.
* ![Tracked hand icon](../images/input-simulation/MRTK_InputSimulation_HandIndicator_Tracked.png "Tracked hand icon") The hand is tracked, but not controlled by the user. Click to hide the hand.
* ![Controlled hand icon](../images/input-simulation/MRTK_InputSimulation_HandIndicator_Controlled.png "Controlled hand icon") The hand is tracked and controlled by the user. Click to hide the hand.
* ![Reset hand icon](../images/input-simulation/MRTK_InputSimulation_HandIndicator_Reset.png "Reset hand icon") Click to reset the hand to default position.


## See also

* [Input System profile](../input/input-providers.md).

---
title: Using the HoloLens emulator
description: The HoloLens emulator allows you to test holographic apps on your PC without a physical HoloLens.
author: JonMLyons
ms.author: jlyons
ms.date: 03/21/2018
ms.topic: article
keywords: HoloLens, emulator
---



# Using the HoloLens emulator

The HoloLens emulator allows you to test holographic apps on your PC without a physical HoloLens and comes with the [HoloLens development toolset](install-the-tools.md). The emulator uses a Hyper-V virtual machine. The human and environmental inputs that would usually be read by the sensors on the HoloLens are instead simulated using your keyboard, mouse, or Xbox controller. Apps don't need to be modified to run on the emulator and don't know that they aren't running on a real HoloLens.
* [Get the HoloLens emulator!](install-the-tools.md)

If you're looking to develop Mixed Reality apps or games for Desktop PCs, check out the [Windows Mixed Reality simulator](using-the-windows-mixed-reality-simulator.md), which lets you simulate desktop headsets instead.

## Deploying apps to the HoloLens emulator
1. Load your app solution in Visual Studio 2015.
* Note: When using Unity, build your project from Unity and then load the built solution into Visual Studio as usual.
2. Ensure the Platform is set to **x86**.
3. Select the **HoloLens Emulator** as the target device for debugging.
4. Go to **Debug > Start Debugging** or press **F5** to launch the emulator and deploy your app for debugging.

The emulator may take a minute or more to boot when you first start it. We recommend that you keep the emulator open during your debugging session so you can quickly deploy apps to the running emulator.

## Basic emulator input

Controlling the emulator is very similar to many common 3D video games. There are input options available using the keyboard, mouse, or Xbox controller. You control the emulator by directing the actions of a simulated user wearing a HoloLens. Your actions move that simulated user around and apps running in the emulator respond like they would on a real device.
* **Walk forward, back, left, and right** - Use the W,A,S, and D keys on your keyboard, or the left stick on an Xbox controller.
* **Look up, down, left, and right** - Click and drag the mouse, use the arrow keys on your keyboard, or the right stick on an Xbox controller.
* **Air tap gesture** - Right-click the mouse, press the Enter key on your keyboard, or use the A button on an Xbox controller.
* **Bloom gesture** - Press the Windows key or F2 key on your keyboard, or press the B button on an Xbox controller.
* **Hand movement for scrolling** - Hold the Alt key, hold the right mouse button, and drag the mouse up / down, or in an Xbox controller hold the right trigger and A button down and move the right stick up and down.

## Anatomy of the HoloLens emulator

### Main window

When the emulator launches, you will see a window which displays the HoloLens OS.

![HoloLens emulator main window](images/emulator-890px.png)

### Toolbar

To the right of the main window, you will find the emulator toolbar. The toolbar contains the following buttons:
* ![Close icon](images/emulator-close.png) **Close**: Closes the emulator.
* ![Minimize icon](images/emulator-minimize.png) **Minimize**: Minimizes the emulator window.
* ![Human input icon](images/emulator-control.png) **Human Input**: Mouse and Keyboard are used to simulate human [input to the emulator](#basic-emulator-input).
* ![Keyboard and mouse input icon](images/emulator-input.png) **Keyboard and Mouse Input**: Keyboard and mouse input are passed directly to the HoloLens OS as keyboard and mouse events as if you connected a Bluetooth keyboard and mouse.
* ![Fit to screen icon](images/emulator-fit.png) **Fit to Screen**: Fits the emulator to screen.
* ![Zoom icon](images/emulator-zoom.png) **Zoom**: Make the emulator larger and smaller.
* ![Help icon](images/emulator-help.png) **Help**: Open emulator help.
* ![Open device portal icon](images/emulator-deviceportal.png) **Open Device Portal**: Open the Windows Device Portal for the HoloLens OS in the emulator.
* ![Tools icon](images/emulator-tools.png) **Tools**: Open the **Additional Tools** pane.

### Simulation tab

The default tab within the **Additional Tools** pane is the **Simulation** tab.

![HoloLens emulator 'Additional Tools' pane](images/emulator-simulation-500px.png)

The Simulation tab shows the current state of the simulated sensors used to drive the HoloLens OS within the emulator. Hovering over any value in the Simulation tab will provide a tooltip describing how to control that value.

### Room tab

The emulator simulates world input in the form of the spatial mapping mesh from simulated "rooms". This tab lets you pick which room to load instead of the default room.

![HoloLens emulator 'Rooms' tab](images/emulator-room-500px.png)

Simulated rooms are useful for testing your app in multiple environments. Several rooms are shipped with the emulator and once you install the emulation, you will find them in %ProgramFiles(x86)%\Program Files (x86)\Microsoft XDE\10.0.11082.0\Plugins\Rooms. All of these rooms were captured in real environments using a HoloLens:
* **DefaultRoom.xef** - A small living room with a TV, coffee table, and two sofas. Loaded by default when you start the emulator.
* **Bedroom1.xef** - A small bedroom with a desk.
* **Bedroom2.xef** - A bedroom with a queen size bed, dresser, nightstands, and walk-in closet.
* **GreatRoom.xef** - A large open space great room with living room, dining table, and kitchen.
* **LivingRoom.xef** - A living room with a fireplace, sofa, armchairs, and a coffee table with a vase.

You can also record your own rooms to use in the emulator using the Simulation page of the [Windows Device Portal](using-the-windows-device-portal.md) on your HoloLens.

On the emulator, you will only see holograms that you render and you will not see the simulated room behind the holograms. This is in contrast to the real HoloLens where you see both blended together. If you want to see the simulated room in the HoloLens emulator, you will need to update your app to render the spatial mapping mesh in the scene.

### Account Tab

The Account tab allows you to configure the emulator to sign-in with a Microsoft Account. This is useful for testing API's that require the user to be signed-in with an account. After checking the box on this page, subsequent launches of the emulator will ask you to sign-in, just like a user would the first time the HoloLens is started.

## See also
* [Advanced HoloLens Emulator and Mixed Reality Simulator input](advanced-hololens-emulator-and-mixed-reality-simulator-input.md)
* [HoloLens emulator software history](hololens-emulator-archive.md)
* [Spatial mapping in Unity](spatial-mapping-in-unity.md)
* [Spatial mapping in DirectX](spatial-mapping-in-directx.md)

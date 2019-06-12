---
title: Using the HoloLens Emulator
description: The HoloLens Emulator allows you to test mixed reality apps on your PC without a physical HoloLens.
author: pbarnettms
ms.author: pbarnett
ms.date: 04/25/2019
ms.topic: article
ms.localizationpriority: high
keywords: HoloLens, emulator
---



# Using the HoloLens Emulator

The HoloLens Emulator allows you to test holographic apps on your PC without a physical HoloLens and comes with the HoloLens development toolset. The emulator uses a Hyper-V virtual machine. The human and environmental inputs that would usually be read by the sensors on the HoloLens are instead simulated using your keyboard, mouse, or Xbox controller. Apps don't need to be modified to run on the emulator and don't know that they aren't running on a real HoloLens.

If you're looking to develop Windows Mixed Reality immersive (VR) headset apps or games for desktop PCs, check out the [Windows Mixed Reality simulator](using-the-windows-mixed-reality-simulator.md), which lets you simulate desktop headsets instead.


## Installing the HoloLens Emulator
Download the HoloLens Emulator and holographic project templates.

Versions: 
* [HoloLens 2 Emulator and holographic project templates](https://go.microsoft.com/fwlink/?linkid=2095316).
* [HoloLens Emulator (1st Gen) and holographic project templates](https://go.microsoft.com/fwlink/?linkid=2065980).

You can find older builds of the HoloLens Emulator on the [HoloLens Emulator archive](hololens-emulator-archive.md) page.

### HoloLens Emulator system requirements

The HoloLens Emulator uses Hyper-V with RemoteFx (1st Gen Emulator) or GPU-PV (HoloLens 2 Emulator) for hardware accelerated graphics. To use the emulator, make sure your PC meets these hardware requirements:
* 64-bit Windows 10 Pro, Enterprise, or Education 
    >[!NOTE]
    >Windows 10 Home edition does not support Hyper-V or the HoloLens Emulator.  
    >The HoloLens 2 Emulator requires the Windows 10 October 2018 update or newer.
* 64-bit CPU
* CPU with 4 cores (or multiple CPUs with a total of 4 cores)
* 8 GB of RAM or more
* In the BIOS, the following features must be [supported and enabled](http://blogs.technet.com/b/iftekhar/archive/2010/08/09/enable-hardware-settings-in-bios-to-run-hyper-v.aspx):
   * Hardware-assisted virtualization
   * Second Level Address Translation (SLAT)
   * Hardware-based Data Execution Prevention (DEP)
* GPU requirements
   * DirectX 11.0 or later
   * WDDM 1.2 graphics driver or later (1st Gen)
   * WDDM 2.5 graphics driver (HoloLens 2 Emulator)
   * The emulator might work with an unsupported GPU, but will be significantly slower

If your system meets the above requirements, **please ensure that the "Hyper-V" feature has been enabled on your system** through Control Panel -> Programs -> Programs and Features -> Turn Windows Features on or off -> ensure that "Hyper-V" is selected for the Emulator installation to be successful.

## Deploying apps to the HoloLens Emulator

1. Load your app solution in Visual Studio.
    >[!NOTE]
    >When using Unity, build your project from Unity and then load the built solution into Visual Studio as usual.
2. For the HoloLens Emulator (1st Gen), ensure the Platform is set to **x86**. For the HoloLens 2 Emulator ensure the Platform is set to **x86** or **x64**.
3. Select the desired **HoloLens Emulator** version as the target device for debugging.
4. Go to **Debug > Start Debugging** or press **F5** to launch the emulator and deploy your app for debugging.

The emulator may take a minute or more to boot when you first start it. We recommend that you keep the emulator open during your debugging session so you can quickly deploy apps to the running emulator.

## Basic emulator input

Controlling the emulator is very similar to many common 3D video games. There are input options available using the keyboard, mouse, or Xbox controller. You control the emulator by directing the actions of a simulated user wearing a HoloLens. Your actions move that simulated user around and apps running in the emulator respond like they would on a real device.

The cursor on HoloLens (1st Gen) follows head movement and rotation.  In the HoloLens 2 Emulator, the cursor follows hand movement and orientation.

* **Walk forward, back, left, and right** - Use the W,A,S, and D keys on your keyboard, or the left stick on an Xbox controller.
* **Look up, down, left, and right** - Click and drag the mouse, use the arrow keys on your keyboard, or the right stick on an Xbox controller.
* **Air tap gesture** - Right-click the mouse, press the Enter key on your keyboard, or use the A button on an Xbox controller.
* **Bloom/System gesture** - Press the Windows key or F2 key on your keyboard, or press the B button on an Xbox controller.
* **Hand movement for scrolling** - Hold the Alt key, hold the right mouse button, and drag the mouse up / down, or in an Xbox controller hold the right trigger and A button down and move the right stick up and down.
* **Hand movement and orientation** (HoloLens 2 Emulator only) - Hold the Alt key and drag the mouse up / down / left / right to move the hand, or use the arrow keys and Q / E to rotate and tilt the hand.  For an Xbox controller, hold the left or right bumper and use the left thumbstick to move the hand left / right / forward / back, the right thumbstick to rotate it, and up / down on the Dpad to raise or lower the hand.

## Anatomy of the HoloLens 2 Emulator 

### Main window

![HoloLens 2 Emulator main window](images/emulator2-900px.png)

### Toolbar

To the right of the main window, you will find the emulator toolbar. The toolbar contains the following buttons:
* ![Close icon](images/emulator-close.png) **Close**: Closes the emulator.
* ![Minimize icon](images/emulator-minimize.png) **Minimize**: Minimizes the emulator window.
* ![Simulation_icon](images/emulator-simulation-panel.png) **Simulation Control Panel**: Show or hide the [Simulation Control panel](#simulation-control-panel) for configuring and controlling [input to the emulator](#basic-emulator-input).
* ![Fit to screen icon](images/emulator-fit.png) **Fit to Screen**: Fits the emulator to screen.
* ![Zoom icon](images/emulator-zoom.png) **Zoom**: Make the emulator larger and smaller.
* ![Help icon](images/emulator-help.png) **Help**: Open emulator help.
* ![Open device portal icon](images/emulator-deviceportal.png) **Open Device Portal**: Open the Windows Device Portal for the HoloLens OS in the emulator.
* ![Tools icon](images/emulator-tools.png) **Tools**: Open the **Additional Tools** pane.

### Simulation Control Panel

The Simulation Control Panel allows you to view the current position and orientation of the simulated human and simulated input devices.  It also allows you to configure both simulated input, such as showing or hiding one or both hands, and devices used for controlling simulated input such as your PC's keyboard, mouse and gamepad.

![Simulation control panel](images/emulator-simulation-control-panel.png)

* To hide or show the simulation panel, click the toolbar button or press F7 on your keyboard.
* Hover the mouse over a control or field to display a tooltip which contains keyboard, mouse and gamepad controls for it.
* To show or hide a hand, toggle the appropriate switch under Left hand or Right hand.
* To control the hand, use either the left or right Alt keys on your keyboard or the left or right bumper on the gamepad.
* To direct all input to one or both hands, click the pushpin button under the toggle switch.  This is the equivalent of holding the Alt key for the hand.
* To control the eye gaze direction, click the pushpin in the "Eyes" section.  This is the equivalent of holding down the 'Y' key on the keyboard.
* To load a room recording, click the "Load" button in the "Recording" section.  See [simulated rooms](#simulated-rooms) for more information.
* To adjust the speed that the simulated human or simulated input devices will move or rotate in response to keyboard, mouse or gamepad input, click the gear icon next to "Input settings" and adjust the sliders.
* By default, keyboard input controls the simulated human and simulated input.  To have your PC's keyboard input sent through to the HoloLens, uncheck "Use keyboard for simulation."  F4 is the shortcut key for this setting.
* If the simulation panel is already visible, pressing F8 will move keyboard focus to it.
* To undock the simulation panel from the emulator window, click the button at the bottom of the panel or press F9 on your keyboard.  Closing the window or pressing F9 again will return the window to the emulator.
* The simulation control panel can be launched as a separate application, allowing you to connect to and control the HoloLens 2 Emulator, a HoloLens 2 device, or Windows Mixed Reality simulation by running PerceptionSimulationInput.exe from %ProgramFiles(x86)%\Windows Kits\10\Microsoft XDE\10.0.18362.0\.

### Account Tab

The Account tab allows you to configure the emulator to sign-in with a Microsoft Account. This is useful for testing APIs that require the user to be signed-in with an account.  Toggling this option will require that you completely close and restart the HoloLens Emulator for the setting to take effect.  If this option is enabled, subsequent launches of the emulator will ask you to sign-in, just like a user would the first time the HoloLens is started.  To quickly enter your credentials using your PC's keyboard, first turn off "Use keyboard for simulation" in the Simulation Control Panel, or press F4 on your keyboard to toggle the keyboard setting on or off.

### Optional Settings Tab

The Optional Settings tab will display a control to enable or disable hardware accelerated graphics.  Hardware accelerated graphics will be used by default if supported by the driver for your PC's graphics adapter.  If your graphics adapter's driver does not support GPU-PV, this option will not be visible.

### Diagnostics Tab

The Diagnostics tab shows the emulator's IP address in the form of a link to Windows Device Portal along with the status of the virtual GPU.


## Anatomy of the HoloLens (1st Gen) emulator

### Main window

When the emulator launches, you will see a window which displays the HoloLens OS.

![HoloLens Emulator main window](images/emulator-890px.png)

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

![HoloLens Emulator 'Additional Tools' pane](images/emulator-simulation-500px.png)

The Simulation tab shows the current state of the simulated sensors used to drive the HoloLens OS within the emulator. Hovering over any value in the Simulation tab will provide a tooltip describing how to control that value.

### Room tab

The emulator simulates world input in the form of the spatial mapping mesh from simulated "rooms". This tab lets you pick which room to load instead of the default room.

![HoloLens Emulator 'Rooms' tab](images/emulator-room-500px.png)

See [simulated rooms](#simulated-rooms) for more information.

### Account Tab

The Account tab allows you to configure the emulator to sign-in with a Microsoft Account. This is useful for testing API's that require the user to be signed-in with an account. After checking the box on this page, subsequent launches of the emulator will ask you to sign-in, just like a user would the first time the HoloLens is started.

## Simulated Rooms

Simulated rooms are useful for testing your app in multiple environments. Several rooms are shipped with the emulator and once you install the emulation, you will find them in %ProgramFiles(x86)%\Windows Kits\10\Microsoft XDE\\(version)\Plugins\Rooms. All of these rooms were captured in real environments using a HoloLens:
* **DefaultRoom.xef** - A small living room with a TV, coffee table, and two sofas. Loaded by default when you start the emulator.
* **Bedroom1.xef** - A small bedroom with a desk.
* **Bedroom2.xef** - A bedroom with a queen size bed, dresser, nightstands, and walk-in closet.
* **GreatRoom.xef** - A large open space great room with living room, dining table, and kitchen.
* **LivingRoom.xef** - A living room with a fireplace, sofa, armchairs, and a coffee table with a vase.

You can also record your own rooms to use in the emulator using the Simulation page of the [Windows Device Portal](using-the-windows-device-portal.md) on your HoloLens (1st Gen).

In the emulator, you will only see holograms that you render and you will not see the simulated room behind the holograms. This is in contrast to the real HoloLens where you see both blended together. If you want to see the simulated room in the HoloLens Emulator, you will need to update your app to render the spatial mapping mesh in the scene.

## Troubleshooting

You may see an error while installing the emulator that you need *"Visual Studio 2015 Update 1 and UWP tools version 1.2"*. There are three possible causes of this error:
* You do not have a recent enough version of Visual Studio (Visual Studio 2019, Visual Studio 2017, or Visual Studio 2015 Update 1 or later). To correct this, install the latest release of Visual Studio.
* You have a recent enough version of Visual Studio, but you do not have the Universal Windows Platform (UWP) tools installed. This is an optional feature for Visual Studio.

You may also see an error installing the emulator on a non-Pro/Enterprise/Education SKU of Windows or if you do not have Hyper-V feature enabled.
* Please read the [system requirements](#hololens-emulator-system-requirements) section above for a complete set of requirements.
* Please also ensure that Hyper-V feature has been enabled on your system.

If your installation completes successfully, but you do not see the HoloLens Emulator as an option for deployment and debugging, please check the following:
* Your Visual Studio project configuration is set to x86 (HoloLens 1st Gen) or x86 or x64 (HoloLens 2 Emulator).
* If using Visual Studio 2019, the Platform Toolset in your project configuration is set to v142.

If your installation completes successfully, but Visual Studio displays an error attempting to launch the HoloLens Emulator, please try the following:
* Run Visual Studio as Administrator
* If you have only ever had Visual Studio 2019 installed, verify that the registry value "KitsRoot10" at HKEY_LOCAL_MACHINE\Software\Microsoft\Windows Kits\Installed Roots points to your 32-bit Program Files folder (e.g., "C:\Program Files (x86)\Windows Kits\10").  If it does not, uninstall the HoloLens Emulator, change the registry value to your 32-bit Program Files folder, then reinstall the HoloLens Emulator.  This issue is addressed in Visual Studio 2019 16.0.3.

If the emulator displays an "Invalid Byte Encoding" error dialog on launch:
* Delete all files in %localappdata%\Microsoft\XDE\HCS and try again.

If your debug target list in Visual Studio is empty (for example, "Start" is the only option) and you've followed all troubleshooting steps above:
* Delete the 'ConfigurationCache' folder in %localappdata%\Microsoft\VisualStudio\\<*installation id*>\CoreCon and try again.

If your system hangs when the emulator is starting, disable hardware acceleration for emulator graphics.
* Create a registry DWORD value named "DisableGPU" at HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\XDE\10.0 and set its value to 1.

## See also
* [Advanced HoloLens Emulator and Mixed Reality Simulator input](advanced-hololens-emulator-and-mixed-reality-simulator-input.md)
* [HoloLens Emulator software history](hololens-emulator-archive.md)
* [Spatial mapping in Unity](spatial-mapping-in-unity.md)
* [Spatial mapping in DirectX](spatial-mapping-in-directx.md)

---
title: Headset Display FAQs
description: Display Windows Mixed Reality troubleshooting for headset display issues that goes beyond our standard consumer support documentation.
author: qianw211
ms.author: qianwen
ms.date: 09/30/2020
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Troubleshoot, Errors, Help, Support
appliesto:
    - Windows 10 and Windows 11
---

# Headset display FAQs

## My headset displays are black

* Check your PC's performance and stability:
    * Use the Task Manager to see if any processes are maxing out your CPU, GPU, or disk drives.
    * Check the “Application” and “System” logs in **Event Viewer > Windows Logs** to see if an app is crashing and generating Windows Error Reporting (WER) reports.
    * Check Windows Update to make sure your version of Windows is current. You may have to select "Check for Updates" multiple times.
* Check app and game stability:
    * Ensure that your PC meets the minimum system requirements of any app or game that's not running correctly.
    * Make sure your GPU driver version is recent, and check for any new performance and compatibility issues and regressions on new drivers.
    * If you're using SteamVR apps and games, make sure SteamVR and the Windows Mixed Reality for SteamVR components are up to date.
* Check cable connectivity and compatibility issues:
    * Make sure that the HDMI or DisplayPort cable is plugged in all the way.
    * If you're using an HDMI adapter (for example, a Mini DisplayPort to HDMI adapter), make sure it's compatible with Windows Mixed Reality. The adapter must support HDMI 2.0, and there are many older adapters that only support 1080p. See [Recommended adapters for Windows Mixed Reality](recommended-adapters-for-windows-mixed-reality-capable-pcs.md).
    * Plug order can be important. Connect the HDMI or DisplayPort adapter to your PC before connecting the headset to the adapter, especially if you're using a USB-C to HDMI or USB-C to Displayport adapter.
    * Try removing extension cables if you're using them.
* Check port compatibility:
    * Test a display by connecting it with the port you're using for your headset. Some PC's may have more than one port for connecting displays, but not all of them may be active.
    * Some PC's may contain ports for both an integrated graphics processing unit (iGPU) and a discrete graphics processing unit (dGPU). Make sure that your headset's HDMI or DisplayPort cable is connected to your dGPU.<ul>
        * On desktop PC's, dGPU ports can be identified by locating the dGPU bracket containing one or more rows of ports that mainly include HDMI or DisplayPort ports. The dGPU bracket is likely located at the rear of the desktop and secured to the case with screws. This bracket lies below your motherboard's ports (USB, LAN, audio, etc) that are surrounded by a metal shield.
        * On laptops that include both an iGPU and dGPU, dGPU ports can be more difficult to identify and are not always included. You can identify if a port connects to your dGPU by connecting a display to it:</ul><ol>
            1. Go to **Settings > System > Display**.
            2. Connect the display. Identify and select the display's number in the Settings window.
            3. Go to **Advanced display settings**.</ol></ol>
Here, the GPU that the port to your display is connected to will be indicated. If the displayed GPU model matches the name of a dGPU, your headset can be connected to that port as long as your headset's display cable is compatible with the HDMI or DisplayPort revision the port uses. Other ports may or may not connect to the dGPU as well. On occasion, laptop manufacturers may include features to switch port connectivity between the iGPU and dGPU, check the manual for your laptop on your laptop manufacturer's website.</li></li></li>
* Check graphics card and driver compatibility:
    * Double check your GPU driver version. Make sure it's recent, but also pay attention to any new performance and compatibility issues and regressions on brand new drivers.
    * If you're using Mixed Reality on a laptop and you've installed a newer graphics driver from the graphics card manufacturer's website, try downgrading to the latest graphics card driver provided on your PC manufacturer's website, or on Windows Update.
    * If you have multiple PCs monitors connected to your PC, try temporarily disconnecting all but one PC monitor.
    * If you've set a custom refresh rate for your PC monitor, try temporarily reverting to a standard refresh rate, such as 60 Hz.
    * If you've recently changed your graphics card without reinstalling Windows, check that the headset monitor still has the correct driver installed. With your headset plugged in, confirm that "Mixed Reality headset" is listed under the Monitors node in Device Manager.
    * If your PC has a Nvidia graphics card, make sure that Nvidia's 3D Vision software is disabled.
    * On some graphics cards (especially older cards), the HDMI port may not support HDMI 2.0 or may not be fully compatible with Windows Mixed Reality. Try using your graphics card's DisplayPort with a [DisplayPort 1.2 to HDMI 2.0 adapter](recommended-adapters-for-windows-mixed-reality-capable-pcs.md).
    * HP Omen PCs with HP product number 1RJ99EA#ABU have HDMI ports that are incompatible with Windows Mixed Reality (open the "HP Support Assistant" and the number will be listed towards the bottom of the app).
    * If your PC has an AMD R9-series graphics card and you're using a Samsung Mixed Reality headset, update your headset's firmware to version 1.0.8 or newer to use the HDMI port of your graphics card with the headset.
    * If you're using a Surface Book 2, make sure you're using the [Surface USB-C to HDMI adapter](recommended-adapters-for-windows-mixed-reality-capable-pcs.md).
* Check for a Mixed Reality headset hardware issue:
    * To confirm or rule out hardware issues with your headset, connect your Mixed Reality headset to another PC.
    * Check for PC compatibility and setup issues first, as the symptoms are similar.
* Make sure the USB cable is plugged into a USB 3.0 or faster port. USB 3.0 ports have SS (Super Speed) next to them and are often colored blue.

## My headset display occasionally turns black after some use

* Try disabling any USB suspend or power-saving features on your PC. For example, in **Settings > System > Power & Sleep > [USB selective suspend](/windows-hardware/drivers/usbcon/usb-selective-suspend)**, the "Allow the computer to turn off this device to save power" setting in Device Manager, and any USB power-saving settings in your PC's firmware.
* Temporarily disconnect any other USB devices and peripherals connected to your PC.
* Check that your GPU driver version is recent, and check for any new performance and compatibility issues and regressions on new drivers.

## One of the displays on my headset is black

* If you're using an HDMI adapter, make sure it supports HDMI 2.0.
* Remove any USB and HDMI extension cables that you may be using.
* Make sure your graphics driver is current.
* Try the Mixed Reality headset on another PC.

## My headset displays turn blue and then Mixed Reality Portal reinitializes

This typically indicates an occasional USB controller reliability issue on your PC:

* Try another USB port. Your PC may have multiple USB 3.0 controllers.
* Remove any extension cables (if applicable).
* Unplug all other USB devices from your PC.
* Connect an externally powered USB 3.0 hub to your PC, and connect your headset to the hub.
* If you're using a Desktop PC, consider purchasing a USB 3.0 PCIe card to add another USB controller to your PC.

## My headset causes my PC to hang or show a black screen while starting up

On some PCs, leaving your headset plugged in before turning on or while rebooting your PC may interfere with its startup process. Your PC could select the headset displays as the "primary monitor" to show PC startup progress, not start up properly, or "hang" or produce a beeping error code. The behavior depends on the PC make and model or the make and model of the graphics card. To fix this:

* Connect your headset to a different port on your graphics card (you may need to use an adapter to use the other ports).
* Make sure your PC's BIOS / UEFI firmware is up to date (but only update your PC's BIOS / UEFI firmware if you're comfortable doing so).

## My PC or headset displays flicker, flash, or remain black when using a Surface PC

* Make sure you're using an HDMI adapter that supports HDMI 2.0. Many older HDMI adapters only support 1080p resolution, which is insufficient for Mixed Reality headsets.
* Make sure your graphics driver is up to date. Check Windows Update and the PC or graphics card manufacturer's website for an updated graphics driver.
* Some Surface devices are incompatible with Windows Mixed Reality. Learn more about [Surface compatibility and requirements](windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md#windows-mixed-reality-and-surface).

## My headset display doesn't work after I shut down and do a fast startup

Unplug the HDMI or DisplayPort cable and the USB cable from the headset and then plug them back in.

## I'm getting a "The install class is not present or is invalid" error in Device Manager

If you see "HoloLens Sensors" with a yellow exclamation mark in Device Manager, select the device for additional details. If you see a message saying "The drivers for this device aren't installed. (Code 28)--The install class isn't present or is invalid", this is typically because your PC is running [Windows 10 N](https://support.microsoft.com/en-us/help/4039813/media-feature-pack-for-windows-10-n-october-2017). N editions of Windows 10 and Windows 11 don't support Windows Mixed Reality, and you'll need to install a non-N version of Windows 10 or Windows 11.

## The images shown on the headset's displays appear warped or incorrectly scaled.

This issue is likely caused by your headset's or graphics cards drivers or Windows software experiencing problems with adjusting the displayed content to appear correctly on your headset. To fix this:

* Turn off any features that may allow your PC to use a pixel resolution higher than your display. These features are present in your graphics card manufacturer's software. You can access this software by doing the following:
    * Right click on your desktop background > Select "Show more options" (only required for Windows 11) > Select the name of the application matching the name of your graphics card's manufacturer.  
* Reinstall your headset drivers.
    1 Go to Device Manager.
    2 Expand the Mixed Reality devices section. 
    3 Right click and uninstall your Mixed Reality device's drivers from your PC. 
    4 Disconnect your headset from your PC and plug it back in after a restart.
* Reset the external display cache in the registry. 
    1 Open Registry Editor and navigate to **HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers**. 
    2 Expand the GraphicsDrivers tab. 
    3 Right-click and delete the following subkeys: **Configuration**, **Connectivity** and **ScaleFactors**.
    4 Restart your PC.
* Reinstall your graphics drivers.
    1 Go to Device Manager.
    2 Expand the Display adapters section. 
    3 Right click and uninstall your graphics card's drivers from your PC, along with the driver software.
* Completely uninstall Windows Mixed Reality and its related components.
    1 Go to **Settings > Mixed reality > Uninstall**.
    2 Uninstall Windows Mixed Reality. Follow any instructions if shown.
    3 Go to **Settings > Apps** and locate Mixed Reality Portal. 
    4 Select Mixed Reality Portal and uninstall.
    5 Open File Explorer and navigate to the Windows folder. Go to **This PC > Devices and Drives > Windows (C:) > Windows**.
    6 If the folder exists, right click on the **Holoshell** folder and delete it.

## My Mixed Reality home environment displays double vision and is jittery or stutters when I move my head.

On a laptop with integrated graphics and a Nvidia GPU, an error occurs after a period of time that appears to cause a previous frame to display after the next frame, resulting in double vision the faster you move your head in a yaw, pitch, or roll movement. The issue appears to be on drivers after Nvidia Graphics Driver 436.48.  Installing this driver will fix the issue until Nvidia solves the problem in the updated drivers. For a direct install of Nvidia Graphics Driver 436.48, visit [NVIDIA](https://www.nvidia.com/Download/driverResults.aspx/152007/en-us).

## I’m uncomfortable in my headset

For general info about comfort in Windows Mixed Reality, see [Windows Mixed Reality immersive headset health, safety, and comfort](wmr-health-safety-comfort.md). For details about your specific headset, check with the headset manufacturer.

## How can I get a clearer view in my headset

Try adjusting the fit of your headset. Move it up and down, or left and right, on your face and adjust the straps so it feels snug.

If your headset has a knob to adjust calibration, adjust its calibration settings. If it doesn’t, go to **Settings > Mixed reality > Visual quality** and adjust the calibration there. For more information on calibration for your specific device, check with your headset manufacturer.

## The content in my headset appears choppy

Your PC may not be able to render content to the headset fast enough, resulting in a low framerate. This may be due to your PC's system resources being consumed by other apps or processes, or your application being too demanding for your PC. To fix:

1. Open Task Manager to make sure that your PC has enough system resources. Your memory should have at least 400 MB of free space available, and disk IO should be below 80%. Close all unneeded programs to free up your memory and lower background CPU and disk usage.
2. Reduce detail settings in your application.
3. Go to **Settings > Mixed Reality > Headset Display** to reduce the amount of detail shown in the Windows Mixed Reality home.
4. Make sure you have the latest graphics drivers for your hardware. See the [graphics driver section](before-you-start.md#make-sure-you-have-a-compatible-graphics-driver).

## The environment moves smoothly, but my point of view in the environment keeps shifting or jittering.

The tracking system is having issues with tracking your playspace. To fix:

1 Make sure the room has enough light.
2 Set up your room boundary in the Mixed Reality Portal again.
3 If it still doesn't work, go to **Settings > Mixed Reality > Environment** to clear your environment data.
4 Set up your room boundary in the Mixed Reality Portal.
5 If the problem persists, contact [customer support](https://support.microsoft.com/).

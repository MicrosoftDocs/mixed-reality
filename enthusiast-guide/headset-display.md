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

* Check your PC performance and stability:
    * Use the Task Manager to see if any processes are maxing out your PC's CPU, GPU, or disk drives.
    * Check the “Application” and “System” logs in **Event Viewer > Windows Logs** to see if an app is crashing and generating Windows Error Reporting (WER) reports.
    * Check Windows Update to make sure your version of Windows is current. You may have to select "Check for Updates" multiple times.
* Check app and game stability:
    * Ensure that your PC meets the minimum system requirements of any app or game that's not running correctly.
    * Make sure your GPU driver version is recent, and check for any new performance and compatibility issues and regressions on new drivers.
    * If you're using SteamVR apps and games, make sure SteamVR and the Windows Mixed Reality for SteamVR components are up to date.
* Check HDMI adapter compatibility:
    * Make sure that the HDMI cable is plugged in all the way.
    * If you're using an HDMI adapter (for example, a Mini DisplayPort to HDMI adapter), make sure it's compatible with Windows Mixed Reality. The adapter must support HDMI 2.0, and there are many older adapters that only support 1080p. See [Recommended adapters for Windows Mixed Reality](recommended-adapters-for-windows-mixed-reality-capable-pcs.md).
    * Plug order can be important. Connect the HDMI adapter to your PC before connecting the headset to the adapter, especially if you're using a USB-C to HDMI adapter.
    * Try removing extension cables if you're using them.
* Check graphics card and driver compatibility:
    * Try your PC's HDMI port with a PC monitor. Some PCs may have more than one HDMI port, and not all of them may be active.
    * If your PC has an integrated graphics processing unit (iGPU) and a discrete graphics processing unit (dGPU), make sure that you're plugged into your dGPU's HDMI port.
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
* Make sure your graphics driver is up to date. Check Windows Update and the PC manufacturer's website for an updated graphics driver.
* Some Surface devices are incompatible with Windows Mixed Reality. Learn more about [Surface compatibility and requirements](windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md#windows-mixed-reality-and-surface).

## My headset display doesn't work after I shut down and do a fast startup

Unplug the HDMI cable and the USB cable from the headset and then plug them back in.

## My headset displays are choppy, but Mixed Reality Portal's preview window appears fine

* Make sure your PC's system resources (CPU, memory, and hard drive) are available and not consumed by another app or process.
* Update your graphics driver.

## I'm getting a "The install class is not present or is invalid" error in Device Manager

If you see "HoloLens Sensors" with a yellow exclamation mark in Device Manager, select the device for additional details. If you see a message saying "The drivers for this device aren't installed. (Code 28)--The install class isn't present or is invalid", this is typically because your PC is running [Windows 10 N](https://support.microsoft.com/en-us/help/4039813/media-feature-pack-for-windows-10-n-october-2017). N editions of Windows 10 and Windows 11 don't support Windows Mixed Reality, and you'll need to install a non-N version of Windows 10 or Windows 11.

## My WMR environment is jittery or stutters when I move my head and displays double vision

On a laptop with integrated graphics and a Nvidia GPU, an error occurs after a period of time that appears to cause a previous frame to display after the next frame, resulting in double vision the faster you move your head in a yaw, pitch, or roll movement. The issue appears to be on drivers after Nvidia Graphics Driver 436.48.  Installing this driver will fix the issue until Nvidia solves the problem in the updated drivers. For a direct install of Nvidia Graphics Driver 436.48, visit [NVIDIA](https://www.nvidia.com/Download/driverResults.aspx/152007/en-us).

## I’m uncomfortable in my headset

For general info about comfort in Windows Mixed Reality, see [Windows Mixed Reality immersive headset health, safety, and comfort](wmr-health-safety-comfort.md). For details about your specific headset, check with the headset manufacturer.

## How can I get a clearer view in my headset

Try adjusting the fit of your headset. Move it up and down, or left and right, on your face and adjust the straps so it feels snug.

If your headset has a knob to adjust calibration, adjust its calibration settings. If it doesn’t, go to **Settings > Mixed reality > Visual quality** and adjust the calibration there. For more information on calibration for your specific device, check with your headset manufacturer.

## I frequently see a black border around the view in the headset. Sometimes it's like I'm looking down a tunnel

This means that the application isn't able to hit frame rate on your PC and the system is using old frames to render the view in the headset. Since applications only render the part of the world you're looking at, if they don't consistently hit their frame rates, the system will try to render the world from a previous point of view and will fill in the missing details with black. If this happens frequently:

1. Close or stop all unneeded programs to free up memory and CPU.
2. Reduce detail settings in your application.
3. Go to **Settings > Mixed Reality > Headset Display** to reduce the amount of detail shown in the Windows Mixed Reality home.

## The view in the headset is jittering and stuttering a lot

The system may not be able to render content to the headset, or the tracking system may be experiencing problems:

1. Open Task Manager to make sure that your PC has enough compute resources. You should have 80% of CPU free, 400 MB of RAM, and disk IO should be below 80%.
2. Make sure you have the latest graphics drivers for your hardware. See the [graphics driver section](before-you-start.md#make-sure-you-have-a-compatible-gpu-driver).
3. Make sure the room has enough light.
4. Unplug the device, close Windows Mixed Reality, and plug it in again.
5. Restart your PC.
6. If the problem persists, contact [customer support](https://support.microsoft.com/).
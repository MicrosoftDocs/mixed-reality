---
title: Headset connectivity FAQs
description: Headset connectivity Windows Mixed Reality headset connectivity troubleshooting that goes beyond our standard consumer support documentation.
author: hferrone
ms.author: v-hferrone
ms.date: 09/15/2020
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Troubleshoot, Errors, Help, Support, Headset
appliesto:
    - Windows 10
---

# Headset connectivity FAQs

## My Headset will not wake up

If your headset is sleeping and clicking the wake up button does not work, restart your PC.

## My computer does not have an HDMI and/or Display Port

You may need to use an adapter. Go [here](recommended-adapters-for-windows-mixed-reality-capable-pcs.md) for a list of supported adapters.

## Can I use USB or HDMI and/or DisplayPort extension cables with Windows Mixed Reality headsets

Windows Mixed Reality headsets don't officially support the use of USB, HDMI, or DisplayPort extension cables. If you're using these cables, the Mixed Reality experience may be affected because of variances in signal integrity and bus power between your PC's USB controller and the Mixed Reality headset. Try using your headset without extension cables if:

* The headset display briefly shows a blue screen and then turns black and Mixed Reality Portal restarts or completely de-enumerates during use
* The headset audio cuts out or becomes glitchy
* The headset flickers between black and the correct display

## I am getting a "Check your display cable" error

* If you're using any adapters to connect your headset to your PC, make sure they support Windows Mixed Reality and are 4K capable. Also try connecting the adapter to the PC before connecting the headset to the adapter.
* Try using a different HDMI or DisplayPort port.
* Connect your headset to a DisplayPort 1.2 or later, or HDMI 1.4 or later. Make sure the port corresponds with the most advanced graphics card on your PC.
* If your PC has both integrated and discrete graphics, make sure you're using the HDMI or DisplayPort port on your active graphics card. This may mean that you'll need to connect your PC display to a non-HDMI port.
* If your PC has both integrated and discrete graphics, and the integrated graphics are older and doesn't support Windows Mixed Reality, try disabling the integrated GPU.
* Connect a PC monitor to your PC's HDMI or DisplayPort port. Make sure your graphics drivers are up to date. Download and install the drivers directly from AMD, Nvidia, or Intel, as they'll likely be newer than what's published to Windows Update.
* If you have an external monitor plugged into an HDMI port, try plugging it into a DisplayPort instead, and use the HDMI port for your headset.
* Make sure that you plugged your headset's HDMI cable into an "HDMI out" port on your PC, not an "HDMI in" port.
* Windows may be unable to detect the display cable connection. Open the Device Manager and see if the headset is listed under "Monitors". If not, select **Action > Scan for hardware changes**.

## A message says "Put on your headset" but I have my headset on

When you put on your headset, Windows Mixed Reality may need a few seconds to reload your space. If this message doesn't go away, make sure the protective sticker has been removed from the proximity sensor on the inside of the headset between the lenses. Contact your headset manufacturer if the problem persists.

## A message says "Connect your headset" but I’ve plugged in my headset

- Make sure the headset's USB and HDMI or DisplayPort cables are connected to the correct ports on your PC. Here's how to identify the correct ports:

    - USB 3.0 ports have a special logo with an "SS" mark (indicating "SuperSpeed"). The port's inside piece is normally blue, but older USB 2.0 ports are typically black or white on the inside.
    - If your computer has two HDMI or DisplayPort ports, use the one that connects to the graphics card, not the computer's motherboard. It's not always obvious, which is which, though discrete ports are often located in an expansion slot on the computer. If you try one port and it doesn't work, try the other.

- Unplug and plug in the USB and HDMI or DisplayPort cables from your headset to make sure they're securely connected. When plugging in the USB cable, try not to pause during insertion of the USB cable.
- Try an externally powered USB 3.0 hub if you're seeing partial enumeration of the headset, for example, a series of USB devices enumerate, but nothing under "Mixed Reality headsets" in Device Manager.
- Go to the headset manufacturer’s website and update the drivers and firmware for your headset.
- Connect your headset to another PC and open Device Manager. Even if that PC isn't fully compatible with Windows Mixed Reality, you can check to see if your headset enumerates. If your headset doesn't enumerate on multiple PCs, it could have a hardware issue.

> [!NOTE]
> For Surface users: Earlier versions of the Surface Dock and Surface Book USB Hub firmware update software are incompatible with Mixed Reality headsets. If you get a "Connect your headset" message on a Surface PC, check if any devices are reporting a "Code 10: The device can't start" error in Device Manager. If so, [remove the conflicting driver](https://support.microsoft.com/en-us/help/4032123/kinect-sensor-is-not-recognized-on-a-surface-book). You should only need to do this once.

Note for Windows 10-N users: If your PC is running Windows 10 N, you'll see a "Code 28: The install class isn't present or is invalid" error in Device Manager after plugging in your Mixed Reality headset. N editions of Windows 10 are not supported by Windows Mixed Reality. Follow these [instructions](headset-display.md#im-getting-a-the-install-class-is-not-present-or-is-invalid-error-in-device-manager) for more information.

## A message says "Check your USB cable" or "Insufficient USB speed"

* Make sure that you're using a supported USB 3.0 port on your PC:

    * Make sure that your headset's USB cable is plugged in all the way.
    * Run the [Windows Mixed Reality Portal](install-windows-mixed-reality.md#launch-mixed-reality-portal) to make sure your PC's USB 3.0 controller is supported.
    * Connect your headset to the other USB 3.0 ports on your PC. Some PCs have more than one USB 3.0 controller.
    * Temporarily disconnect all of the USB devices attached to your PC, and only connect your headset.
    * On custom-built PCs, even though a port may be marked as a USB 3.0 port, it may be connected to a USB 2.0 controller. With your headset connected, open Device Manager, locate, and single click any of the devices enumerated from your headset, then go to **View > Devices by connection**.
* Try your headset on another PC. If that other PC isn't fully compatible with Windows Mixed Reality, check in Device Manager to see if you see the "insufficient USB speed" message. If it doesn't enumerate properly on multiple PCs, your headset could be defective.
* Remove any extenders or hubs between the headset and the computer.

## The Mixed Reality Portal did not launch after I plugged in my headset

Your headset might not have been detected properly because of an underlying issue. Launch the Mixed Reality Portal manually and look for any error messages that appear.

## My headset stopped working when my PC goes into sleep or hibernation mode, or when restarting my PC with my headset attached

1. Open Device Manager and confirm that your headset is listed under "Mixed Reality devices".
2. Select your headset under "Mixed Reality devices" and confirm that the device status indicates "This device is working properly".
3. If you see a "Code 43" error saying the device has stopped working, or if you don't see your headset listed under "Mixed Reality devices", unplug and replug in your headset's USB cable. Microsoft is investigating a potential software/driver interoperability issue, which may result in this error. This issue affects a small number of PCs, and is expected to be resolved in a future update to the Mixed Reality headset driver.

## My headset causes my PC to generate a Bug Check (blue screen) when I put my PC to sleep or when it is in hibernation mode

Make sure you are on the 10.0.19041.2034 driver or newer.

## The headset driver did not install automatically when I plugged in the headset

On new PCs, or PCs with a newly installed copy of Windows 10, the headset driver could be queued behind other Windows updates and may not install immediately.

1. Go to **Start > Device Manager** and look under "Mixed Reality devices" for your headset. The device status should indicate that "The device is working properly".
2. Right-click on the device and select "Update driver".

If that didn't work, try to uninstall the driver:

1. Go to **Start > Device Manager** and look under "Mixed Reality devices" for your headset. The device status should indicate that "The device is working properly".
2. Right-click on the device and select "Uninstall Device".
3. In the new popup that appears, select the check box "Delete the driver software for this device" and then select "Uninstall".
4. When that completes, unplug the headset from your PC, and plug it back in. Windows Update will now download and install a new driver.

Note:  If you have an N edition of Windows, you'll need to switch to a regular edition of Windows 10 to use Windows Mixed Reality.
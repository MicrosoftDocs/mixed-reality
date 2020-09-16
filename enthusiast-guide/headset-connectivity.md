---
title: Headset connectivity FAQs
description: Advanced Windows Mixed Reality troubleshooting that goes beyond our standard consumer support documentation.
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Troubleshoot, Errors, Help, Support, Headset
---


# Headset connectivity FAQs

## My computer does not have an HDMI and/or Display Port.
You may need to use an adapter. Go [here](recommended-adapters-for-windows-mixed-reality-capable-pcs.md) for a list of supported adapters.

## Can I use USB or HDMI and/or DisplayPort extension cables with Windows Mixed Reality headsets?
Windows Mixed Reality headsets do not officially support the use of USB, HDMI, or DisplayPort extension cables. Using these cables may significantly impact your Mixed Reality experience because of variances in resulting signal integrity and bus power between your PC's USB controller and the Mixed Reality headset. If the headset display briefly shows a blue screen and then turns black and Mixed Reality Portal restarts or completely de-enumerates during use, or if the headset audio cuts out or becomes glitchy, or if the headset flickers between black and the correct display, try using your headset without extension cables.

## I am getting a "Check your display cable" error.

* If you are using any adapters to connect your headset to your PC, make sure they support Windows Mixed Reality (the adapter must be 4K capable). Also try connecting the adapter to the PC before connecting the headset to the adapter.
* Try using a different HDMI and/or DisplayPort port.
* Connect your headset to a DisplayPort 1.2 or later, or HDMI 1.4 or later. Make sure the port corresponds with the most advanced graphics card on your PC.
* If your PC has both integrated and discrete graphics, make sure you're using the HDMI and/or DisplayPort port on your active graphics card. This may mean that you'll need to connect your PC display to a non-HDMI port.
* If your PC has both integrated and discrete graphics, and the integrated graphics is older and does not support Windows Mixed Reality, try disabling the integrated GPU.
* Connect a PC monitor to your PC's HDMI and/or DisplayPort port. Make sure your graphics drivers are up to date. Download and install the ones from AMD, Nvidia or Intel directly as they will likely be newer than what's published to Windows Update.
* If you have an external monitor plugged into an HDMI port, try plugging it into a DisplayPort instead, and use the HDMI port for your headset.
* Make sure that you plugged your headset's HDMI cable into an "HDMI out" port on your PC, not an "HDMI in" port.
* Windows may be unable to detect the display cable connection. Open the Device Manager and see if the headset is listed under "Monitors". If not, select **Action > Scan for hardware changes**. 

## A message says "Put on your headset" but I have my headset on.

When you put on your headset, Windows Mixed Reality may need a few seconds to reload your space. If this message doesn't go away, make sure the protective sticker has been removed from the proximity sensor, which is on the inside of the headset between the lenses. If this doesn't resolve the problem, contact your headset manufacturer.

## A message says "Connect your headset" but I’ve plugged in my headset.

1. Make sure the headset's USB and HDMI and/or DisplayPort cables are connected to the correct ports on your PC. Here is how to identify the correct ports:
    * USB 3.0 ports have a special logo with an "SS" mark (indicating "SuperSpeed"). The port's inside piece is normally blue, whereas older USB 2.0 ports are typically black or white on the inside.
    * If your computer has two HDMI and/or DisplayPort ports, use the one that connects to the graphics card, not the computer's motherboard. It's not always obvious which is which, though discrete ports are often located in an expansion slot on the computer. If you try one port and it doesn't work, try the other.
2. Unplug and plug in the USB and HDMI and/or DisplayPort cables from your headset to make sure they are securely connected. When plugging in the USB cable, try not to pause during insertion of the USB cable.
3. Open Device Manager and confirm that your headset is listed under "Mixed Reality devices". When you select your headset, the device status should say "This device is working properly". Yellow exclamation marks on devices in Device Manager indicate errors.
    * If "Hololens Sensors" is listed with a yellow exclamation mark in Device Manager, select the device. If you see a "Code 10: The drivers for this device are not installed. There are no compatible drivers for this device", [manually install the headset driver](headset-connectivity.md#the-headset-driver-did-not-install-automatically-when-i-plugged-in-the-headset).
    * If you use multiple Mixed Reality headsets on your PC and have manually installed the Mixed Reality headset driver, the manual driver update may only apply to the headset connected at the time and not to other headsets. In this case, you'll see "Code 31: This device is not working properly because Windows cannot load the drivers required for this device. (Code 31). The ALPC message requested is no longer available" in Device Manager. In **Device Manager > Mixed Reality devices**, right-click on your headset and select "Uninstall device". Select "OK" to confirm and then unplug and replug your headset.
4. If you're seeing partial enumeration of the headset (a series of USB devices enumerate, but nothing under "Mixed Reality headsets" in Device Manager), try an externally powered USB 3.0 hub.
5. Go to the headset manufacturer’s website and update the drivers and firmware for your headset.
6. Connect your headset to another PC and open Device Manager. Even if that PC is not fully compatible with Windows Mixed Reality, you can check to see if your headset enumerates. If your headset does not enumerate on multiple PCs, it could have a hardware issue.

Note for Surface users: Earlier versions of the Surface Dock and Surface Book USB Hub firmware update software are incompatible with Mixed Reality headsets. If you get a "Connect your headset" message on a Surface PC, check to see if any devices are reporting a "Code 10: The device cannot start" error in Device Manager. If so, [remove the conflicting driver](https://support.microsoft.com/en-us/help/4032123/kinect-sensor-is-not-recognized-on-a-surface-book). You should only need to do this once.

Note for Windows 10 N users: If your PC is running Windows 10 N, you'll see a "Code 28: The install class is not present or is invalid" error in Device Manager after plugging in your Mixed Reality headset. N editions of Windows 10 are not supported by Windows Mixed Reality. Follow these [instructions](headset-display.md#im-getting-a-the-install-class-is-not-present-or-is-invalid-error-in-device-manager) for more information.

This information is also displayed in a [troubleshooting flowchart](headset-connectivity-flowchart.md). 

## A message says "Check your USB cable" or "Insufficient USB speed".

* Make sure that you're using a supported USB 3.0 port on your PC:
    * Make sure that your headset's USB cable is plugged in all the way.
    * Run the [Windows Mixed Reality Portal](install-windows-mixed-reality.md#launch-mixed-reality-portal) to make sure your PC's USB 3.0 controller is supported.
    * Connect your headset to the other USB 3.0 ports on your PC. Some PCs have more than one USB 3.0 controller.
    * Temporarily disconnect all of the USB devices attached to your PC, and only connect your headset.
    * On custom-built PCs, even though a port may be marked as a USB 3.0 port, it may be connected to a USB 2.0 controller. With your headset connected, open Device Manager, locate and single click any of the devices enumerated from your headset, then go to **View > Devices by connection**.
* Try your headset on another PC. If that other PC is not fully compatible with Windows Mixed Reality, check in Device Manager to see if you see the "insufficient USB speed" message. If it does not enumerate properly on multiple PCs, your headset could be defective.
* Remove any extenders or hubs between the headset and the computer.

## The Mixed Reality Portal did not launch after I plugged in my headset.

The headset might not have been detected properly because of an underlying issue. Launch the Mixed Reality Portal manually and look for any error messages that appear. 

## My headset stopped working when my PC goes into sleep or hibernation mode, or when restarting my PC with my headset attached.

1. Open Device Manager and confirm that your headset is listed under "Mixed Reality devices".
2. Select your headset under "Mixed Reality devices" and confirm that the device status indicates "This device is working properly".
3. If you see a "Code 43" error indicating that the device has stopped working, or if you don't see your headset listed under "Mixed Reality devices", unplug and replug in your headset's USB cable. Microsoft is investigating a potential software/driver interoperability issue which may result in this error. This issue affects a small number of PCs, and is expected to be resolved in a future update to the Mixed Reality headset driver.

## My headset causes my PC to generate a Bug Check (blue screen) when I put my PC to sleep or when it is in hibernation mode.
Make sure you are on the 10.0.18362.1062 driver or newer.

## The headset driver did not install automatically when I plugged in the headset.

On new PCs, or PCs with a newly installed copy of Windows 10, the headset driver could be queued behind other Windows updates and may not install immediately. To install it manually:
1. Go to **Start > Device Manager** and look under "Other devices" for a "HoloLens Sensors" device with a yellow exclamation mark:
![View of Device Manager HoloLens Sensors](images/hololenssensors.png)
2. Right click on the device and select properties. If the device's properties read "The drivers for this device are not installed (Code 28)", close the window and proceed. If there is another message, follow troubleshooting steps on the rest of this page.
![Code 28 of HoloLens Sensors in Device Manager](images/code28.png)
3. Right click on the device again and select "Update Drivers..." and then "Search automatically for updated driver software"
After the device updates, you should see your headset listed under "Mixed Reality devices" in Device Manager:
![Mixed Reality Device appear in Device Manager](images/mixedrealitydevices.png)

If the manual install doesn’t work, or you don't find the driver under Other Devices, then you probably need to uninstall the existing driver and reinstall it. To do that:
1. Go to **Start > Device Manager** and look under "Mixed Reality devices" for your headset. The device status should indicate that "The device is working properly".
2. Right-click on the device and select "Uninstall Device".
3. In the new popup that appears, select the check box "Delete the driver software for this device" and then select "Uninstall".
4. When that completes, unplug the headset from your PC, and plug it back in. Windows Update will now download and install a new driver.

Note:  If you have an N edition of Windows, you will need to switch to a regular edition of Windows 10 to use Windows Mixed Reality.



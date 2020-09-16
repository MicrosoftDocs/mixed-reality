---
title: Get help with PC compatibility in Windows Mixed Reality
description: Help resource for PC compatibility issues when working with Windows Mixed Reality.
author: hferrone
ms.author: v-hferrone
ms.date: 09/15/2020
ms.topic: article
ms.localizationpriority: high
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Feedback, Feedback Hub, bugs
appliesto:
    - Windows 10
---

# Get help with PC compatibility in Windows Mixed Reality

When you set up Windows Mixed Reality or run the [Windows Mixed Reality PC Check](https://www.microsoft.com/p/windows-mixed-reality-pc-check/9nzvl19n7cnc?rtc=1#activetab=pivot:overviewtab) app on your computer, you'll get a report on whether your PC is ready to run it. Here are some details on what you might see. 

[Just show me the specs](windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md)

## You're good to go
Good news—your PC can run Windows Mixed Reality. But keep in mind that there's still variation among computer hardware and configuration, so the mixed reality experience might not be the same on every PC. 

## Supports some features
Your PC should be able to run some Windows Mixed Reality experiences, but might not provide the best possible experience. Graphics might lag, some apps and games might not perform well, and some might not run at all. 

Here are the messages you might see, and what to do about them:

### This PC has an integrated graphics card with single-channel RAM

Integrated graphics cards will provide the best Windows Mixed Reality experience on PCs with dual-channel RAM. If you run into performance problems, try one of the following:

* Install a [compatible discrete graphics card](windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md#compatibility-guidelines).
* Install an additional RAM stick to create dual-channel RAM. 
* Switch to a [compatible PC](https://www.microsoft.com/mixed-reality/windows-mixed-reality?rtc=1).

### This PC has a hybrid graphics configuration with an incompatible PCIe link

PCIe stands for *Peripheral Component Interconnect Express*. This is the connection that a PC uses to communicate with a graphics card. Your configuration might work, but if you run into problems, you'll need to switch to a [compatible PC](https://www.microsoft.com/mixed-reality/windows-mixed-reality?rtc=1).

### This PC's graphics driver might not work well with Windows Mixed Reality

If you run into problems, try downloading a new graphics driver using Windows Update (**Start > Settings > Update & security > Check for updates**)—or go to your PC manufacturer or graphics card manufacturer's website. 

> [!div class="nextstepaction"]
> [Check for updates](ms-settings:windowsupdate?activationSource=SMC-Article-4045777)

If that doesn't work, you'll need to add a [compatible graphics card](windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md#compatibility-guidelines) or switch to a [compatible PC](https://www.microsoft.com/mixed-reality/windows-mixed-reality?rtc=1).

### This PC's processor might not work well with Windows Mixed Reality

This PC's processor might not work well with Windows Mixed Reality, because it doesn't have enough cores. If Windows Mixed Reality doesn't run well, replace the processor with a [compatible one](windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md) or switch to a [compatible PC](https://www.microsoft.com/mixed-reality/windows-mixed-reality?rtc=1).

### This PC might not have a compatible USB configuration

If you run into problems running Windows Mixed Reality, try the following:

* Plug your headset into a different USB port, if available.
* If that doesn't work, uninstall your PC's current USB driver, and then reinstall a Microsoft driver:

1. Select **Start**, and then type "device manager" in the **Search** box.
2. Select **Device Manager** from the results.
3. Expand the category for Universal Serial Bus controllers, look at the devices listed, and uninstall any incompatible drivers.
    * If the list includes an “eXtensible Host Controller” item that does not have “Microsoft” at the end of the device name, that driver isn't compatible with Windows Mixed Reality. You’ll need to uninstall it. To uninstall a driver, right-click the device in the list and select **Uninstall device**. Select the **Delete the driver software for this device** check box, then select **Uninstall**.
    * If the list includes an "eXtensible Host Controller" item that includes "Etron" in the name, that USB controller isn't compatible with Windows Mixed Reality. You'll need to use a different USB port on the PC or purchase a different USB 3.0 host controller.
4. Restart your PC.
5. Return to Device Manager and locate the eXtensible Host Controller item again. If you now see “Microsoft” at the end of the device name, you’re good to go. If not, repeat the uninstall steps to remove any additional non-Microsoft versions of the driver.
* If that still doesn't work, add a PCIe USB card to your PC.

### This PC doesn't have Bluetooth 4.0 for controllers.

Bluetooth 4.0 is required for mixed reality motion controllers on some headsets. You can still use Windows Mixed Reality with an Xbox controller or with a mouse and keyboard, or you can use a USB Bluetooth adapter to connect motion controllers to your PC. [See recommended adapters](recommended-adapters-for-windows-mixed-reality-capable-pcs.md)

### Depending on your headset, you may need a Bluetooth adapter to use motion controllers

Some headsets have Bluetooth built in so that controllers can pair directly to the headsets. Others require a Bluetooth radio in the PC (or a separate dongle) to use motion controllers. [See recommended adapters](recommended-adapters-for-windows-mixed-reality-capable-pcs.md)

### This PC doesn't have a self-powered USB port

A self-powered USB 3.0 port is needed to connect a Windows Mixed Reality headset. Connect a powered USB 3.0 hub to the PC and use that to connect your headset.

### This PC should work, but you'll have the best experience with a high-performance Intel® processor

This PC should work, but a high-performance Intel processor will provide the best experience. We recommend an 8th Gen Intel® Core™ or 7th Gen Intel® Core™ i5 processor.

## Can't run mixed reality
Here are the messages you might see, and what to do about them:

### This PC's graphics card won't work with Windows Mixed Reality

This PC's graphics card is not compatible with Windows Mixed Reality. You'll need to add a [compatible graphics card](windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md#compatibility-guidelines) or switch to a [compatible PC](https://www.microsoft.com/mixed-reality/windows-mixed-reality?rtc=1).

### This PC's graphics driver won't work with Windows Mixed Reality
This PC's graphics driver won't work with Windows Mixed Reality. Try downloading a new graphics driver using Windows Update (**Start > Settings > Update & security > Check for updates**)—or go to your PC manufacturer or graphics card manufacturer's website. 

> [!div class="nextstepaction"]
> [Check for updates](ms-settings:windowsupdate?activationSource=SMC-Article-4045777)

If that doesn't work, you'll need to add a [compatible graphics card](windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md#compatibility-guidelines) or switch to a [compatible PC](https://www.microsoft.com/mixed-reality/windows-mixed-reality?rtc=1).

### This PC's processor won't work with Windows Mixed Reality

This PC's processor doesn't supprot AVX/Popcnt instructions. To run Windows Mixed Reality, you'll need to replace it with a [compatible graphics card](windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md#compatibility-guidelines) or switch to a [compatible PC](https://www.microsoft.com/mixed-reality/windows-mixed-reality?rtc=1).

### This PC doesn't have enough free disk space to run Windows Mixed Reality

Windows Mixed Reality requires 10GB of free disk space for setup and best performance. Clear some space on your drive, then try setup again.

### This PC is running an edition of Windows that doesn't support Windows Mixed Reality

Windows Mixed Reality works on Windows 10 Home and Windows 10 Pro. You'll need to install one of those editions in order to use Windows Mixed Reality.

### This PC isn't running the latest version of Windows 10

Windows Mixed Reality requires the Windows 10 Fall Creators Update. [Update your PC](https://support.microsoft.com/help/4028685) and try again.

### This PC has no USB 3.0 port

You'll need a USB 3.0 port to connect a Windows Mixed Reality headset. If you're using a desktop PC, add a PCIe USB card. If you're using a laptop, you'll need to switch to a [compatible PC](https://www.microsoft.com/mixed-reality/windows-mixed-reality?rtc=1).

### You can't run this app via remote desktop

To use Windows Mixed Reality, you'll a PC with a monitor connected. If you are using a virtual machine or don't have a monitor, try using a virtual display adapter. This is a device that plugs into the PC's DisplayPort and emulates a computer display. 

## Getting the best performance
Some hardware configurations might cause performance problems with Windows Mixed Reality. For problems like slow loading, choppy visuals, or poor visual quality, try these common fixes:

* Close any open apps running on your PC desktop.
* If you’re using a USB-C or DisplayPort to HDMI adapter, try a different one. See recommended adapters
* If there are extra monitors connected to the PC’s graphics card, disconnect them.
* Try downloading some different mixed reality apps from the Windows Store—some may work better with your computer setup.

> [!NOTE]
> If you see a message that says, "This hardware configuration might work with Windows Mixed Reality, but it hasn't been tested yet," you could run into some performance issues when running Windows Mixed Reality for long sessions .

## See also
* [Ask the community](https://answers.microsoft.com)
* [Contact us for support](https://support.microsoft.com/contactus/)
* [Troubleshooting](troubleshooting-windows-mixed-reality.md)


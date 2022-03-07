---
title: Windows Mixed Reality PC Check app
description: How to find and use the Windows Mixed Reality PC Check app to test your PC's compatibility before purchasing a Windows Mixed Reality headset.
author: sean-kerawala
ms.author: sekerawa
ms.date: 09/16/2020
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, compatible, compatibility, PC, system requirements
appliesto:
    - Windows 10
---

# Windows Mixed Reality PC Check app

The **[Windows Mixed Reality PC Check](https://www.microsoft.com/store/p/windows-mixed-reality-pc-check/9nzvl19n7cnc)** app is the best way to make sure your PC is ready to run Windows Mixed Reality. The Windows Mixed Reality PC Check app only works on PCs with at least Windows 10 Version 1607 installed. To check your version of Windows, type "winver" in the search bar and run the command. For Windows 10 versions earlier than 1607, the app will still show up in the Store, but you'll get an error when you try to install.

<a href="https://www.microsoft.com/store/productid/9NZVL19N7CNC"><img alt="Download Windows Mixed Reality PC Check app" src="images/WMR-PC-Check-app.png"/></a>

After running the app, you'll get one of the following messages:

* **You're good to go.** Your PC has what it takes to run Windows Mixed Reality.
* **You’re nearly there.** This PC can run Windows Mixed Reality, but some features might be limited.
* **Can't run mixed reality.** This PC doesn't meet the minimum requirements needed to run Windows Mixed Reality.

You'll then get an analysis of your PC against the required hardware, drivers, and operating system.
![Screenshot of Windows Mixed Reality PC Check](images/screenshot-mr-pc-check.jpg) 

<table>
<tr>
<th>Icon</th><th>What it means</th>
</tr><tr>
<td> <img alt="Succeeded" width="30" height="30" src="images/glyph-succeeded.png" /></td><td>Your PC passes the required item.</td>
</tr><tr>
<td> <img alt="Warning" width="30" height="30" src="images/glyph-warning.png" /></td><td>There may be issues with your PC for the given requirement. If you run into any issues, you may need to troubleshoot or upgrade your PC.</td>
</tr><tr>
<td> <img alt="Error" width="30" height="30" src="images/glyph-error.png" /></td><td>Your PC doesn't meet the requirements for the specified item.</td>
</tr>
</table>

## Get help with Windows Mixed Reality PC Check results

You'll get a compatibility report when you set up Windows Mixed Reality or run the Windows Mixed Reality PC Check app on your computer. Here are some details on what you might see.

### ![You're good to go](images/glyph-succeeded.png)

Good news—your PC can run Windows Mixed Reality. Keep in mind that there's still variation among computer hardware and configuration. The mixed reality experience might not be the same on every PC.

>[!NOTE]
>If you see a message that says, "This hardware configuration might work with Windows Mixed Reality, but it hasn't been tested yet," you could run into some performance issues when running Windows Mixed Reality for long sessions.

### ![You're nearly there](images/glyph-warning.png)

Your PC should be able to run Windows Mixed Reality, but might not provide the best possible experience. Graphics may lag, some apps and games may not run well, and some might not run at all.

Here are the messages you might see, and what to do about them:

#### This PC has an integrated graphics card with single-channel RAM

Integrated graphics cards will provide the best Windows Mixed Reality experience on PCs with dual-channel RAM. If you run into performance problems:

* Install a [compatible discrete graphics card](windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md).
* Install an additional RAM stick to create dual-channel RAM.
* Switch to a [compatible PC](https://www.microsoft.com/windows/windows-mixed-reality-devices).

#### This PC has a hybrid graphics configuration with an incompatible PCIe link

PCIe stands for *Peripheral Component Interconnect Express*. This is the connection that a PC uses to communicate with a graphics card. Your configuration might work, but if you run into problems, you'll need to switch to a [compatible PC](https://www.microsoft.com/windows/windows-mixed-reality-devices).

#### This PC's graphics driver might not work well with Windows Mixed Reality

If you run into problems, try downloading a new graphics driver using Windows Update (**Start > Settings > Update & security > Check for updates**)—or go to your PC manufacturer or graphics card manufacturer's website.

If that doesn't work, you'll need to add a [compatible graphics card](windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md) or switch to a [compatible PC](https://www.microsoft.com/windows/windows-mixed-reality-devices).

#### This PC's processor might not work well with Windows Mixed Reality

This PC's processor might not work well with Windows Mixed Reality, because it doesn't have enough cores. If Windows Mixed Reality doesn't run well, update to a [compatible one](windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md) or switch to a [compatible PC](https://www.microsoft.com/windows/windows-mixed-reality-devices).

#### This PC might not have a compatible USB configuration

If you run into problems running Windows Mixed Reality:

* Plug your headset into a different USB port, if available.
* If that doesn't work, uninstall your PC's current USB driver, and then reinstall a Microsoft driver:

1. Select **Start**, and then type **"device manager"** in the Search box.
1. Select **Device Manager** from the results.
1. Expand the category for Universal Serial Bus controllers, look at the devices listed, and uninstall any incompatible drivers. 
 * If the list includes an “eXtensible Host Controller” item without “Microsoft” at the end of the device name, the driver isn't compatible with Windows Mixed Reality. You’ll need to uninstall it. To uninstall a driver, right-click the device in the list and select **Uninstall device**. Select the **Delete the driver software for this device** check box, then select **Uninstall**.
 * If the list includes an "eXtensible Host Controller" item that includes "Etron" in the name, that USB controller isn't compatible with Windows Mixed Reality. You'll need to use a different USB port on the PC or purchase a different USB 3.0 host controller.
1. Restart your PC. 
1. Return to Device Manager and locate the eXtensible Host Controller item again. If you now see “Microsoft” at the end of the device name, you’re good to go. If not, repeat the uninstall steps to remove any additional non-Microsoft versions of the driver.
* If that still doesn't work, add a PCIe USB card to your PC.

#### This PC doesn't have Bluetooth 4.0 for controllers.

#### This PC doesn't have a self-powered USB port.

#### This PC should work, but you'll have the best experience with a high-performance Intel® processor.

### ![Can't run mixed reality](images/glyph-error.png)

 [Get help with Windows Mixed Reality PC Check results](https://support.microsoft.com/en-us/help/4045777/windows-10-get-help-with-pc-compatibility-in-windows-mixed-reality)

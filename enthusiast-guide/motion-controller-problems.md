---
title: Motion controller FAQs
description: Controllers Windows Mixed Reality troubleshooting that goes beyond our standard consumer support documentation.
author: sean-kerawala
ms.author: sekerawa
ms.date: 09/15/2020
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Troubleshoot, Errors, Help, Support, Motion controllers
appliesto:
    - Windows 10
---

# Motion controller FAQs

## What do the vibrations and lights mean

The LED constellation ring and haptics indicate the state of the motion controller.

| State    | Behavior associated with the state | How to get to/out of the state |
|----------------------------|-----------------------------|----------------------------------------------------------------------|
| **Power on**               | LEDs turn on and controller vibrates once. | Press and hold the Windows button on controller for two seconds to turn on the controller.  |
| **Power off**              |  LEDs turn off and controller vibrates twice. | Press and hold the Windows button on controller for four seconds to turn off controller.   |
| **Sleeping**               |  LEDs turn off and blink every three seconds while in sleeping state. | The controller enters the sleeping state automatically when it’s motionless for 30 seconds. The controller wakes when it detects motion, except if the device isn't paired with the host PC. Press the button to wake it in that case. |
| **Pairing**                |  LEDs slowly pulse while in pairing mode, and go solid when exiting pairing mode. The controller vibrates once if pairing was successful or three times if pairing is unsuccessful and then times out. | Press and hold the pairing button inside battery case for three seconds.     |
| **Controller connects/disconnects from PC** |  The controller vibrates once on PC connection or disconnection. | Happens when the controller successfully connects to the PC after you turn it on, or if the controller disconnects from the PC during use.|
| **Low Battery Level**      | Haptics are disabled when the battery is low (there's no LED indication). The battery indicator icon on the controller handle in headset will show 1/4 full when the battery is low. | Replace your batteries. | 
| **Critical Battery Level** |  The controller vibrates three times when you turn it on and then automatically turns off. The battery indicator icon will turn red. | Replace the batteries. If the problem persists, [restore the device to its factory settings](motion-controller-problems.md#how-can-i-restore-the-controllers-to-factory-settings)|

## My Motion controllers aren't working properly

If your [motion controllers](controllers-in-wmr.md) aren’t working, connecting, or showing an image of the controllers when you’re wearing your headset:

1. Make sure your controllers are turned on. To turn them on, press and hold the Windows button for two seconds.
2. Make sure the controllers are fully charged and replace the batteries if they aren't.
3. Turn the controllers off and on again while holding them in front of you. Press and hold the Windows button for four seconds to turn off a controller. Press and hold it again for two seconds to turn it on.
4. Check if your motion controllers are [paired correctly](controllers-in-wmr.md#pair-motion-controllers).
5. Check the motion controllers LEDs: Brightly lit controllers are paired and connected, dimly lit controllers aren't connected.
6. Go to **Start  > Mixed Reality Portal** on your PC and select "Menu". You should see your motion controllers listed, along with a status message:
    * Ready – The controllers are all set.
    * Lost tracking – Mixed Reality Portal can’t find your controllers. Hold them in front of your headset and restart them by pressing the Windows button for four seconds, then again for two seconds.
    * Low battery – Replace the controller batteries.
7. If you're using an external USB Bluetooth Adapter, make sure it’s plugged into a USB 2.0 port (they're often but not always black). It should also be plugged in as far as possible from any other wireless transmitters or USB flash drives, including the USB connector for your headset. 
8. Go to **Device Manager > Bluetooth** and look for one adapter to check that there’s only one Bluetooth radio in the PC. If you're using the desktop PC configuration with built-in radio, check if an external antenna is connected. If there's no external antenna connected, it can cause tracking issues. Or use an external Bluetooth dongle (USB), disable the internal Bluetooth capability, and retry pairing and connecting.
9. If the Bluetooth settings window is open in the background, many extra calls are made to the Bluetooth protocol. Close it.
10. Check the virtual battery level on the motion controller by turning the controllers over in mixed reality to see the battery icon. Wait about 15 seconds before reading the level, since the reported level is higher than the actual level immediately after connecting a controller. Replace the batteries if the icon is red.
11. Remove Bluetooth headphones and speakers in **Settings > Devices > Bluetooth & other devices**, and turn off the devices. Use the headphone jack or built-in speakers on your mixed reality headset for the best audio experience.
12. Remove other Bluetooth devices that may be paired with your PC, such as headphones or gamepads. Go to **Settings > Devices > Bluetooth & other devices**, select the devices, and then "Remove device".
13. Unplug the USB cable on your headset and plug it back into the PC to restart Windows Mixed Reality.
14. Controller lights flash when they're undergoing a firmware update. Wait for the update to complete and the controllers should appear in Mixed Reality.
15. Make sure your PC is connected to a 5-GHz Wi-Fi network. If your laptop is connected to a 2.4-GHz Wi-Fi network, it's typically sharing the Bluetooth connection. This may negatively impact either Wi-Fi or Bluetooth performance, depending on the product design. Change the preferred band to 5 GHz in the network adapter settings. If your network doesn't support 5 GHz, a Bluetooth dongle can be used instead of the internal Bluetooth capability.
16. If your Bluetooth settings have motion controllers already paired, Windows won’t discover the new devices until those are removed. If they have been added using a specific dongle, they can be only removed with that dongle.
17. If your PC has built-in Bluetooth and you’re having connection problems, try using a USB Bluetooth adapter. To do this, turn off your built-in Bluetooth radio in Device Manager and then pair your other Bluetooth devices with the new adapter.

## My controllers jitter, get stuck, or flicker and disappear in mixed reality

* If your PC is running on 2.4-GHz wifi, switch to 5-GHz wifi. 
* If you're using an external Bluetooth adapter, make sure it's plugged into a USB 2.0 port (which is often, but not always, black), away from other wireless transmitters or USB flash drives.
* Run the Bluetooth Troubleshooter in **Settings > Update & Security > Troubleshoot > Bluetooth**.

## My controller is stuck in an infinite reboot

This is a critical battery indicator. Put fresh batteries in the device, and if the issue persists, [reset the controller to factory settings](motion-controller-problems.md#how-can-i-restore-the-controllers-to-factory-settings).

## The Mixed Reality Portal is working, but my controllers are tracking poorly (flying away, shaking, etc.)

1. Lighting conditions can affect tracking. Make sure that you aren't exposed to direct sunlight and have minimal point light sources visible to your HMD (for example, strings of lights like a christmas tree).
2. These symptoms are caused by failures to communicate between the controller and the host PC, and indicate poor Bluetooth link quality. See [questions about Bluetooth](motion-controller-problems.md#how-can-i-tell-if-im-using-bluetooth-technology).

## Motion controller LEDs are not lit, but the buttons and thumbstick still work in Mixed Reality Portal

The Motion Controller calibration cache may be corrupt. To delete the cache, run the following command in an Administrator Command Prompt:

`rmdir /S /Q C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Windows\MotionController\Calibration`

This folder isn't accessible in Windows Explorer and can only be modified from an Administrator Command Prompt. After you've deleted the folder, restart your PC and reconnect your motion controllers to restore the calibration files.

## My controller looks like a Vive/Oculus, has strange orientation, or the buttons are incorrectly mapped

The website likely doesn’t have full motion controller support.

## My motion controllers do not appear in SteamVR apps and games

First, make sure that your controller's batteries are charged. The controllers won't work if the batteries are dead or dying

If you can see your controllers in the Cliff House but not in SteamVR apps and games, the motion controller model driver may not be installed properly. To check that the motion controller model driver is correctly installed:

1. Turn on both of your motion controllers. Check if your motion controllers are [paired correctly](controllers-in-wmr.md#pair-motion-controllers).
2. Go to **Device Manager > Human Interface Devices** and look for "Motion controller".
3. Double-click each "Motion Controller" device and go to the "Driver" tab. Confirm that the driver version listed corresponds to one of [these versions](mixed-reality-software.md#mixed-reality-motion-controller-model-driver-release-history).
4. If the driver version doesn't match or you can't find a device called "Motion controller", run Windows Update.  This will automatically download and install the driver. If you're on a PC that has enterprise policies or if Windows Update is otherwise restricted, you may need to install the motion controller model driver manually. To do this, visit [this page](mixed-reality-software.md#mixed-reality-motion-controller-model-driver-release-history) and look for the driver version corresponding to your controller hardware. Installation instructions are available on the download page.

## The controller firmware update takes longer than two minutes

Check the [Bluetooth questions section](motion-controller-problems.md#how-can-i-tell-if-im-using-bluetooth-technology). Poor Bluetooth link quality usually causes these problems.

## I inserted fresh batteries but the controller virtual battery level does not indicate full level

Motion controller battery level is tuned for AA batteries. Some low voltage rechargeable batteries may not report as full although they're fully charged.

## My Samsung motion controller’s touchpad is off-center or has a dead spot

This is probably a hardware defect and you should go back to your retailer or equipment manufacturer for a replacement or exchange.

## How can I restore the controllers to factory settings

Restore it to factory conditions (you'll need fresh batteries):

1. Unplug and power off the controllers.
2. Open the battery cover.
3. Insert your new batteries.
4. Press and hold the pairing button (the tab at the bottom under the batteries).
5. While holding the pairing button, power on the controller by pressing and holding the Windows button for five seconds (keep both buttons depressed).
6. Release the buttons and wait for controller to power on. This takes up to 15 seconds and there are no indicators when device recovery is happening. If device powers on immediately on button release, the recovery button sequence didn't get registered and you need to try again.
7. If the controllers were paired to your PC, go to **Settings > Bluetooth > other devices** and select “Motion Controller”, and "Remove device" to remove controller associations from Bluetooth settings.
8. [Pair the controllers](controllers-in-wmr.md#pair-motion-controllers) with the headset or PC again.
9. After connecting with the host and headset, the device will update to the latest available firmware.

## Can I pair my Xbox controller to my PC so I can use it in headset

You can pair a Bluetooth Xbox controller to use it with your headset by following [these instructions](https://support.xbox.com/help/hardware-network/accessories/connect-and-troubleshoot-xbox-one-bluetooth-issues).

If you have a wired Xbox controller, plug it in to your PC.

Some games and apps use the Xbox controller differently than it's used in mixed reality. To use the controller for a game or app, select "Use as gamepad" on the app bar or say, "Use as gamepad." To switch the controller back to mixed reality, select "Use as gamepad"  again, or say "Use with gaze." 

## How do I pair new controllers if Windows Mixed Reality is already set up on my PC

If you're pairing your controllers to your headset, use the companion app (the [Mixed Reality Portal](install-windows-mixed-reality.md#launch-mixed-reality-portal) can help you find a companion app to launch or give you a list of companion apps that you can select from).

## How can I return my controllers to their factory pairing

To return the motion controllers to their factory pairing, or to pair them with a Windows Mixed Reality headset with built-in Bluetooth radio, run the headset's device companion app and follow the instructions for motion controller pairing. For example, the "Acer OJO 500" app or the "Samsung HMD Odyssey+ Setup" app automatically installed the first time the headset is plugged in.

## My motion controllers are not pairing to my PC

* If the controllers don’t turn on, insert fresh batteries. If this doesn’t fix it, restore the device to its factory settings by powering on the device while holding down the pairing buttons. For more information, see the [device recovery steps](motion-controller-problems.md#how-can-i-restore-the-controllers-to-factory-settings).
* If the controllers turn on while you're using an external Bluetooth adapter, make sure the adapter is plugged into a USB 2.0 port (which is often, but not always, black), away from other wireless transmitters or USB flash drives. If it still doesn’t work, run the Bluetooth Troubleshooter in Settings > Update & Security > Troubleshoot > Bluetooth.
* If you're using a Qualcomm adapter and the PC just crashed, restart the PC.
* Try restarting the motion controllers that aren’t pairing, one at a time, then restart the PC.
* The motion controller cache may be corrupt. To fix this problem, see these [steps](motion-controller-problems.md#motion-controller-leds-are-not-lit-but-the-buttons-and-thumbstick-still-work-in-mixed-reality-portal).
* If steps fix the problem, you should contact the manufacturer.

## My paired controllers don’t show up in the Mixed Reality Portal

* Hold the controllers in front of your headset and restart them by pressing the Windows button for four seconds, then again for two seconds.
* If your controllers show as connected, unpair them and go through the [pairing process](controllers-in-wmr.md#pair-motion-controllers) again.
* If the controller LEDs are cycling with one quadrant of lights turning on and off at a time, they're undergoing a firmware update. Wait for the update to complete and the controllers should appear in Mixed Reality.
* If an external Bluetooth adapter is used, make sure the adapter is plugged into a USB 2.0 port (which is black), away from other wireless transmitters or USB 3.0 devices.
* If the PC just crashed and a Qualcomm adapter is being used, a reset may not work. To fix this, unplug the power from the back of the computer (or if on a laptop, hold down the power button for 10 seconds) and restart the PC.
* Run the Bluetooth troubleshooter in **Settings > Update & Security > Troubleshoot > Bluetooth**.  

## I'm trying to pair my controllers, but they never show up in the "Add a new device menu" in Bluetooth settings

Check that you don't have controllers paired already. If you do, remove them and try again. Restart the PC if the problem persists. If that fails, see more [information about Bluetooth](motion-controller-problems.md#how-can-i-tell-if-im-using-bluetooth-technology).

Note: If another set of motion controllers is paired with your PC, you'll need to unpair those controllers before pairing new ones. If you paired a set of motion controllers with your current PC and then paired them with a second PC, you'll need to unpair and re-pair them with the current PC before using them again.

## How can I tell if I'm using Bluetooth technology

Motion controllers use the same Bluetooth technology found in many consumer devices and are designed to work with the Bluetooth capability included in any recent PC. Your PC should have Bluetooth radio if it passed the mixed reality compatibility check. To verify:

* Open "Device Manager".
* Expand the Bluetooth section and look for an adapter.

![Screenshot of an Example Device Manager. The Adapter is the Bluetooth radio.](images/devicemanagerbtadapterpic.png)

If your PC doesn’t have Bluetooth, use Pluggable USB Bluetooth 4.0 Low Energy Micro Adapter.

## Wi-Fi slows down on my notebook when motion controllers are turned on

Your notebook may share its Wi-Fi antenna with Bluetooth when connected to a 2.4-GHz access point. Check in Device Manager if you can switch band preference to 5 GHz. If a 5-GHz network isn't available and performance is severely affected, consider using a Bluetooth dongle.

![Wifi band selection settings can be found through device manager](images/wifi5ghz.png)

## My PC has Bluetooth technology but I'm having problems with my controllers

Motion controllers should work with other Bluetooth keyboards, mice, and game controllers. The experience will vary depending on the model of keyboard, mouse, or game controller you use. Here are some things you can do to improve performance:

* If your computer has Bluetooth but you're still having problems with the motion controllers, consider replacing your Bluetooth radio with a Pluggable external Bluetooth adapter plugged into USB. You can only have one Bluetooth radio adapter active at a time. If you plug in an external radio along with an existing radio, you need to disable your existing Bluetooth radio in Device Manager. Right-click on the adapter and select "Disable Device" and unpair/re-pair all of your previous Bluetooth devices.
* If you're using a USB Bluetooth adapter, connect it to a USB 2.0 port (2.0 ports are often black and aren’t labeled "SS"), if available. The port should be physically separated from:
    - the HMD USB connector
    - flash drives
    - hard drives
    - wireless USB receivers like those for keyboards/mice
Ideally, plug the USB Bluetooth adapter into the opposite side of the computer as far as possible from these other connectors.
* Close the Bluetooth settings window if it's open. Leaving it open in the background means that many extra calls are made to the Bluetooth protocol.
* If your headset is paired to your PC, use the Windows Bluetooth driver stack and don't install any third-party Bluetooth driver stacks. Third-party software may not work correctly.
* Disable "Show notification to connect using Swift Pair" setting under "Bluetooth & other devices" to reduce host radio scanning activity.
* If you're using an internal Bluetooth card, make sure that you're using an external Bluetooth antenna or you may experience tracking issues. If this doesn’t work, use an external Bluetooth dongle (USB) after disabling the internal Bluetooth.
* The device should appear under the "Mouse, Keyboard & Pen" category in the Bluetooth settings. If it is under "Other devices", then unpair and pair the device.
* Remove, unpair, and power off Bluetooth headphones and speakers. These aren't supported with Windows Mixed Reality. Use the headphone jack or built-in speakers on your Mixed Reality headset for the best audio experience.

## My second controller takes a long time to reconnect

Some older Intel radios experience this issue if motion controllers are powered on at the same time. Avoid powering on controllers at the same time.

## My Qualcomm Bluetooth radio cannot pair controllers after a PC crash

Qualcomm (QCA) Bluetooth radio drivers before 10.0.0.448 may end up in bad state after a Windows crash. Power off the PC completely to workaround this problem.

## I'm experiencing poor controller tracking with Marvell radio

Go to **Device Manager > Bluetooth > Marvell AVASTAR Bluetooth Radio Adapter > Properties > Driver** and make sure that you're using driver 15.68.9210.47 or later.

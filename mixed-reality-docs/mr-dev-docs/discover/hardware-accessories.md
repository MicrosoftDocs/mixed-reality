---
title: Hardware accessories
description: Describes the types of accessories available to use with Windows Mixed Reality, and how to set them up.
author: mattzmsft
ms.author: mazeller
ms.date: 05/20/2020
ms.topic: article
keywords: how-to, accessories, bluetooth, bt, controller, gamepad, clicker, xbox, hardware, mixed reality headset, windows mixed reality headset, virtual reality headset, motion controller
---

# Hardware accessories

Windows Mixed Reality devices support accessories. You can use Bluetooth or USB ports to pair supported accessories to an immersive headset from your PC.

For information about using Bluetooth accessories with HoloLens, see [Connect to Bluetooth and USB-C devices](/hololens/hololens-connect-devices).

Windows Mixed Reality immersive headsets require accessories for input beyond [gaze](../design/gaze-and-commit.md) and [voice](../design/voice-input.md). Supported accessories include **keyboard and mouse**, **gamepad**, and **[motion controllers](../design/motion-controllers.md)**.

## Pairing Bluetooth accessories

Pairing a Bluetooth peripheral with an immersive headset is similar to pairing a Bluetooth peripheral with a Windows 10 desktop or mobile device:

1. From the Start Menu, open the **Settings** app
2. Go to **Devices**
3. Turn on the Bluetooth radio if it's off using the slider switch
4. Place your Bluetooth device in pairing mode. This process varies from device to device, but on most Bluetooth devices press and hold one or more buttons.
5. Wait for the name of the device to show up in the list of Bluetooth devices. When it does, select the device then select the **Pair** button. If you have many Bluetooth devices nearby, you may need to scroll to the bottom of the Bluetooth device list to see the device you're trying to pair.
6. When pairing Bluetooth peripherals with input capability (for example: Bluetooth keyboards), a 6-digit or an 8-digit pin may be displayed. Be sure to type that pin on the peripheral and then press enter to complete pairing with the headset.

## Motion controllers

Windows Mixed Reality [motion controllers](../design/motion-controllers.md) are supported by immersive headsets, but not HoloLens. These controllers offer precise and responsive movement tracking in your field of view. Sensors in the immersive headset do the tracking, meaning there's no need to install hardware on the walls in your space. Each controller features several methods of input.

![Windows Mixed Reality motion controllers](../design/images/winmr-ck-1080x1080-350px.jpg)

## Bluetooth keyboards

English language Qwerty Bluetooth keyboards can be paired and used anywhere you can use the holographic keyboard. Getting a quality keyboard makes a difference, so we recommend the [Microsoft Universal Foldable Keyboard](https://www.microsoft.com/accessories/products/keyboards/universal-foldable-keyboard/gu5-00001) or the [Microsoft Designer Bluetooth Desktop](https://www.microsoft.com/accessories/products/keyboards/designer-bluetooth-desktop/7n9-00001).

## Bluetooth gamepads

You can use a controller with apps and games that specifically enable gamepad support. Gamepads cannot be used to control the HoloLens user interface.

Xbox Wireless Controllers that come with the Xbox One S or sold as accessories for the Xbox One S feature Bluetooth connectivity, so you can use them with HoloLens and immersive headsets. The Xbox Wireless Controller [must be updated](https://support.xbox.com/xbox-one/accessories/update-controller-for-stereo-headset-adapter) before it can be used with HoloLens.

Other brands of Bluetooth gamepads may work with Windows Mixed Reality devices, but support will vary by application.

## Other Bluetooth accessories

As long as the peripheral supports either the Bluetooth HID or GATT profiles, it can pair with HoloLens. Other Bluetooth HID and GATT devices besides keyboard, mice, and the HoloLens Clicker may require a companion application on Microsoft HoloLens to be fully functional.

Unsupported peripherals include:

* Peripherals in the Bluetooth audio profiles aren't supported.
* Bluetooth audio devices such as speakers and headsets may be available in the Settings app, but aren't supported with Microsoft HoloLens as an audio endpoint.
* Bluetooth-enabled phones and PCs aren't supported for pairing and file transfers.

## Unpairing a Bluetooth peripheral

1. From the Start Menu, open the **Settings** app
2. Go to **Devices**
3. Turn on the Bluetooth radio if it's off
4. Find your device in the list of available Bluetooth devices
5. Select your device from the list and then select the **Remove** button
---
title: Connecting to Wi-Fi on HoloLens
description: Instructions on how to connect to wireless internet with HoloLens and how to identify the device's IP address.
author: mattzmsft
ms.author: mazeller
ms.date: 03/21/2018
ms.topic: article
keywords: HoloLens, wifi, wireless, internet, ip, ip address
---



# Connecting to Wi-Fi on HoloLens

HoloLens contains a 802.11ac-capable, 2x2 Wi-Fi radio. Connecting HoloLens to a Wi-Fi network is similar to connecting a Windows 10 Desktop or Mobile device to a Wi-Fi network.

## Connecting to a Wi-Fi network on HoloLens
1. [Bloom](gestures.md#bloom) to the **Start Pins**
2. Select the **Settings** app from the Start Pins or from the **More Apps** section (click on the '+' and gaze to Settings)
3. Place the **Settings** app in your world
4. Gaze to **Network & Internet** and select
5. Make sure Wi-Fi is turned on
6. Select a Wi-Fi network from the list
7. Type in the Wi-Fi network password (if needed)

![Wifi Settings](images/wifi-hololens-600px.jpg)

## Disabling Wi-Fi on Microsoft HoloLens

**Using Settings**
1. Bloom to the **Start Pins**
2. Gaze and select the **Settings App** (expand more apps using the '+' sign and browse to the Settings App)
3. Place the **Settings App** in your world
4. Gaze to select **Network & Internet**
5. Move the slider switch to the OFF position. This will turn off the RF components of the Wi-Fi radio and disable all Wi-Fi functionality on Microsoft HoloLens. Note, HoloLens will not be able to automatically load your [spaces](environment-considerations-for-hololens.md#spaces) when the Wi-Fi radio is disabled.
6. Move the slider switch to the ON position to turn on the Wi-Fi radio and restore Wi-Fi functionality on Microsoft HoloLens. The selected OFF or ON Wi-Fi radio state will persist across reboots.

**Using Windows Device Portal**
1. Establish a [device portal](using-the-windows-device-portal.md#networking) connection to the target HoloLens
2. Navigate to the **Networking** page
3. Select an available network
4. Select **Connect**
5. The device portal session will be terminated after the device obtains a new IP address.

## Checking if you are connected to a Wi-Fi network
1. [Bloom](gestures.md#bloom) to pull up the [Start Menu](navigating-the-windows-mixed-reality-home.md#start-menu)
2. Look at the top left of the Start Menu for Wi-Fi status. The state of Wi-Fi and the SSID of the connected network will be shown.

## Identifying the HoloLens IP Address on the Wi-Fi network

**Using Settings**
1. [Bloom](gestures.md#bloom) to pull up the [Start menu](navigating-the-windows-mixed-reality-home.md#start-menu)
2. Place the **Settings** app in your world
3. Gaze to **Network & Internet** and select
4. Gaze to **Advanced Options** and select

The IP address will be shown next to **IPv4 address**

**Using Cortana**

Say "*Hey Cortana, What's my IP address?*" Cortana will display and read out your IP address.

**Using Windows Device Portal**
1. Open the [device portal](using-the-windows-device-portal.md#networking) in a web browser on your PC
2. Navigate to the networking section

Your IP address and other network information will be displayed there. This method allows for easy copy and paste of the IP address on your development PC.

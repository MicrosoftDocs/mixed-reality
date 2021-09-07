---
title: Keyboard, mouse, and controller overview
description: Gives an overview of how to work with keyboard, mouse, and game controllers.
author: mikeriches
ms.author: mriches
ms.date: 09/03/21
ms.topic: article
keywords: Windows Mixed Reality, keyboard, mouse, game controller, xbox controller, HoloLens, desktop, walkthrough, sample code
---

# Keyboard, mouse, and controller input overview

Keyboards, mice, and game controllers can all be useful forms of input for Windows Mixed Reality devices. Bluetooth keyboards and mice are both supported on HoloLens, for use with debugging your app or as an alternate form of input. Windows Mixed Reality also supports immersive headsets attached to PCs - where mice, keyboards, and game controllers have historically been the norm.

To use keyboard input on HoloLens, pair a Bluetooth keyboard to your device or use virtual input via the Windows Device Portal. To use keyboard input while wearing a Windows Mixed Reality immersive headset, assign input focus to mixed reality by putting on the device or using the Windows Key + Y keyboard combination. Keep in mind that apps intended for HoloLens must provide functionality without these devices attached.

## Important guidelines for keyboard and mouse input

There are some key differences in how code can be used on Microsoft HoloLens--which is a device that relies primarily on natural user input--and what is available on a Windows Mixed Reality-enabled PC.
* You can’t rely on keyboard or mouse input to be present. All of your app's functionality must work with gaze, gesture, and speech input.
* When a Bluetooth keyboard is attached, it can be helpful to enable keyboard input for any text that your app might ask for. This can be a great supplement for dictation, for example.
* When it comes to designing your app, don’t rely on (for example) WASD and mouse look controls for your game. HoloLens is designed for the user to walk around the room. In this case, the user controls the camera directly. An interface for driving the camera around the room with move/look controls won't provide the same experience.
* Keyboard input is an excellent way to control your app or game engine debugging, especially since the user won't be required to use the keyboard. Wiring it up is the same as you're used to, with CoreWindow event APIs. In this scenario, you might choose to implement a way to configure your app to route keyboard events to a "debug input only" mode during your debug sessions.
* Bluetooth controllers work as well.

## See also
* [Hardware accessories](../../discover/hardware-accessories.md)
* [C++ code samples](../native/keyboard-mouse-and-controller-input-cpp.md)
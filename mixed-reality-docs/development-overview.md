---
title: Development overview
description: This article outlines the basic building blocks of developing a Windows Mixed Reality app.
author: mattzmsft
ms.author: mazeller
ms.date: 03/21/2018
ms.topic: article
keywords: getting started, basics, HoloLens, immersive headset, unity, visual studio
---



# Development overview

Mixed reality apps are built with the [Universal Windows Platform](https://dev.windows.com/en-us/getstarted). All mixed reality apps are Universal Windows apps, and all Universal Windows apps can be made to run on Windows Mixed Reality devices. With Windows 10 and familiarity with middleware tools like Unity, you can start building mixed reality experiences today.

>[!VIDEO https://www.youtube.com/embed/A784OdX8xzI]

## Basics of mixed reality development

[Mixed reality](mixed-reality.md) experiences are enabled by new Windows features for environmental understanding. These enable developers to place a [hologram](hologram.md) in the real world, and allow users to move through digital worlds by literally walking about. 

These are the core building blocks for mixed reality development:

<table>
<tr>
<th>Input</th><th style="width:150px"> <a href="hololens-hardware-details.md">HoloLens</a></th><th style="width:150px"> <a href="immersive-headset-hardware-details.md">Immersive headsets</a></th>
</tr><tr>
<td> <a href="gaze.md">Gaze</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td>
</tr><tr>
<td> <a href="gestures.md">Gestures</a></td><td style="text-align: center;">✔️</td><td></td>
</tr><tr>
<td> <a href="voice-input.md">Voice</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td>
</tr><tr>
<td> <a href="hardware-accessories.md">Gamepad</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td>
</tr><tr>
<td> <a href="motion-controllers.md">Motion controllers</a></td><td></td><td style="text-align: center;">✔️</td>
</tr><tr>
<th> Perception and spatial features</th> <th><a href="hololens-hardware-details.md">HoloLens</a></th><th> <a href="immersive-headset-hardware-details.md">Immersive headsets</a></th>
</tr><tr>
<td> <a href="coordinate-systems.md">World coordinates</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td>
</tr><tr>
<td> <a href="spatial-sound.md">Spatial sound</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td>
</tr><tr>
<td> <a href="spatial-mapping.md">Spatial mapping</a></td><td style="text-align: center;">✔️</td><td></td>
</tr>
</table>



The basic interaction model for [HoloLens](hololens-hardware-details.md) is [gaze](gaze.md), [gesture](gestures.md), and [voice](voice-input.md), sometimes referred to as *GGV*. [Windows Mixed Reality immersive headsets](immersive-headset-hardware-details.md) also use gaze and voice, but swap [motion controllers](motion-controllers.md) for gestures.

All mixed reality devices benefit from the input ecosystem available to Windows, including mouse, keyboard, gamepads, and more. With HoloLens, [hardware accessories](hardware-accessories.md) are connected via Bluetooth. With immersive headsets, accessories connect to the host PC via Bluetooth, USB, and other supported protocols.

The environmental understanding features like [coordinates](coordinate-systems.md), [spatial sound](spatial-sound.md), and [spatial mapping](spatial-mapping.md) provide the necessary capabilities for mixing reality. Spatial mapping is unique to HoloLens, and enables holograms to interact with both the user and the physical world around them. Coordinate systems allow the user's movement to affect movement in the digital world.

Holograms are made of light and sound, which rely on [rendering](rendering.md). Understanding the experience of placement and persistence, as demonstrated in the [Windows Mixed Reality home](navigating-the-windows-mixed-reality-home.md) (sometimes called the "shell") is a great way ground yourself in the user experience.

## Tools for developing for mixed reality

The tools you use will depend on the [style of app](app-views.md) you want to build.
* [Apps with a 2D view](building-2d-apps.md) leverage tools for building Universal Windows Platform apps suited for environments like Windows Phone, PC, and tablets. These apps are experienced as 2D projections placed in the Windows Mixed Reality home, and can work across multiple device types (including phone and PC).
* Immersive and holographic apps need tools designed to take advantage of the Windows Mixed Reality APIs. We [recommend using Unity](unity-development-overview.md) to build mixed reality apps. Developers interested in building their own engine can [use DirectX and other Windows APIs](directx-development-overview.md).

Regardless of the type of app you're building, these tools will facilitate your app development experience:
* [Visual Studio and the Windows SDK](using-visual-studio.md)
* [Windows Device Portal](using-the-windows-device-portal.md)
* [HoloLens emulator](using-the-hololens-emulator.md)
* [Windows Mixed Reality simulator](using-the-windows-mixed-reality-simulator.md)
* [App quality criteria](app-quality-criteria.md)

## See also
* [Install the tools](install-the-tools.md)
* [Mixed Reality Academy tutorials](academy.md)
* [Open source projects](open-source-projects.md)
* [MR Basics 100: Getting started with Unity](holograms-100.md)
* [Windows Mixed Reality minimum PC hardware compatibility guidelines](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines)
* [Submitting an app to the Windows Store](submitting-an-app-to-the-microsoft-store.md)

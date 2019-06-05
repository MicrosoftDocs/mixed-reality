---
layout: LandingPage
title: Development
description: Mixed reality developer documentation for HoloLens and immersive headsets.
author: grbury
ms.author: grbury
ms.date: 02/12/2019
ms.topic: article
ms.localizationpriority: high
keywords: Mixed Reality, develop, development, HoloLens, unity, directx
---

# Development launchpad

## Article categories


<ul class="panelContent cardsF">
    <li>
        <div class="cardSize">
            <div class="cardPadding">
                <div class="card">
                    <div class="cardImageOuter">
                        <div class="cardImage">
                            <img src="images/GetStartedIcon.png" alt="Get started icon">
                        </div>
                    </div>
                    <div class="cardText">
                        <h3>Get started</h3>
                        <p>
                            <a href="mixed-reality.md">What is mixed reality?</a>
                        </p>
                        <p>
                            <a href="install-the-tools.md">Install the tools</a>
                        </p>
                        <p>
                            <a href="mrlearning-base-ch1.md">MR learning: HoloLens 2 and MRTK v2</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </li>
        <li>
        <div class="cardSize">
            <div class="cardPadding">
                <div class="card">
                    <div class="cardImageOuter">
                        <div class="cardImage">
                            <img src="images/HoloLens_Icon_120x130.png" alt="Devices icon">
                        </div>
                    </div>
                    <div class="cardText">
                        <h3>Devices</h3>
                          <p>
                            <a href="https://www.microsoft.com/hololens/hardware" target="_blank">HoloLens 2</a>
                        </p>
                        <p>
                            <a href="hololens-hardware-details.md">HoloLens (1st gen)</a>
                        </p>
                        <p>
                            <a href="immersive-headset-hardware-details.md">Immersive headsets</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </li>
    <li>
        <div class="cardSize">
            <div class="cardPadding">
                <div class="card">
                    <div class="cardImageOuter">
                        <div class="cardImage">
                            <img src="images/AzureSpatialAnchors_Icon_120x130.png" alt="Azure Spatial Anchors icon">
                        </div>
                    </div>
                    <div class="cardText">
                        <h3>Services</h3>
                        <p>
                            <a href="https://docs.microsoft.com/azure/spatial-anchors" target="_blank">Azure Spatial Anchors</a>
                        </p>
                        <p>
                            <a href="https://docs.microsoft.com/azure/cognitive-services/speech-service/" target="_blank">Speech Services</a>
                        </p>
                        <p>
                            <a href="https://docs.microsoft.com/azure/cognitive-services/computer-vision/" target="_blank">Vision Services</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </li>
    <li>
        <div class="cardSize">
            <div class="cardPadding">
                <div class="card">
                    <div class="cardImageOuter">
                        <div class="cardImage">
                            <img src="images/Unity_Icon_120x130.png" alt="Developer techologies icon">
                        </div>
                    </div>
                    <div class="cardText">
                        <h3>Developer technologies</h3>
                        <p>
                            <a href="unity-development-overview.md">Unity</a>
                        </p>
                        <p>
                            <a href="directx-development-overview.md">Custom engine (DirectX)</a>
                        </p>
                        <p>
                            Unreal - coming soon!
                        </p>                
                    </div>
                </div>
            </div>
        </div>
    </li>
    <li>
        <div class="cardSize">
            <div class="cardPadding">
                <div class="card">
                    <div class="cardImageOuter">
                        <div class="cardImage">
                            <img src="images/PortingGuides-icon_120x130.png" alt="Porting guides icon">
                        </div>
                    </div>
                    <div class="cardText">
                        <h3>Porting guides</h3>
                        <p>
                            <a href="mrtk-porting-guide.md">Updating apps to HoloLens 2<br>from HoloLens (1st gen)</a>
                        </p>
                        <p>
                            <a href="https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/HTKToMRTKPortingGuide.html">Mixed Reality Toolkit (MRTK)<br>API porting guide</a>
                        </p>
                        <p>
                            <a href="porting-guides.md">Immersive headset apps</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </li>
    <li>
        <div class="cardSize">
            <div class="cardPadding">
                <div class="card">
                    <div class="cardImageOuter">
                        <div class="cardImage">
                            <img src="images/App_patterns_Icon_120x130.png" alt="Development fundamentals icon">
                        </div>
                    </div>
                    <div class="cardText">
                        <h3>Development fundamentals</h3>
                        <p>
                            <a href="Interaction-fundamentals.md">Instinctual interactions</a>
                        </p>
                        <p>
                            <a href="rendering.md">Holographic rendering</a>
                        </p>
                         <p>
                            <a href="testing-your-app-on-hololens.md">Testing</a>
                        </p>                    
                    </div>
                </div>
            </div>
        </div>
    </li>    
</ul>

## Overview

Mixed reality apps are built with the [Universal Windows Platform](https://dev.windows.com/getstarted). All mixed reality apps are Universal Windows apps, and all Universal Windows apps can be made to run on Windows Mixed Reality devices. With Windows 10 and familiarity with middleware tools like Unity, you can start building mixed reality experiences today.

<br>

>[!VIDEO https://www.youtube.com/embed/A784OdX8xzI]

## Basics of mixed reality development

[Mixed reality](mixed-reality.md) experiences are enabled by new Windows features for environmental understanding. These enable developers to place a [hologram](hologram.md) in the real world, and allow users to move through digital worlds by literally walking about. 

These are the core building blocks for mixed reality development:

<table>
<tr>
<th style="width:175px">Input</th><th style="width:125px; text-align: center;"><a href="hololens-hardware-details.md">HoloLens (1st gen)</a></th><th style="width:125px; text-align: center;">HoloLens 2</a></th><th style="width:125px; text-align: center;"> <a href="immersive-headset-hardware-details.md">Immersive headsets</a></th>
</tr><tr>
<td> <a href="gaze.md">Head gaze</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td>
</tr><tr>
<td> <a href="gaze.md">Eye gaze</a></td><td></td><td style="text-align: center;">✔️</td><td></td>
</tr><tr>
 <td> <a href="gestures.md">Articulated hands</a></td><td></td><td style="text-align: center;">✔️</td><td></td>
</tr><tr>
<td> <a href="gestures.md">Gestures</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td><td></td>
</tr><tr>
<td> <a href="voice-input.md">Voice</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td>
</tr><tr>
<td> <a href="hardware-accessories.md">Gamepad</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td>
</tr><tr>
<td> <a href="motion-controllers.md">Motion controllers</a></td><td></td><td></td><td style="text-align: center;">✔️</td>
</tr><tr>
<th style="width:175px">Perception and spatial features</th><th style="width:125px; text-align: center;"><a href="hololens-hardware-details.md">HoloLens (1st gen)</a></th><th style="width:125px; text-align: center;">HoloLens 2</a></th><th style="width:125px; text-align: center;"> <a href="immersive-headset-hardware-details.md">Immersive headsets</a></th>
</tr><tr>
<td> <a href="coordinate-systems.md">World coordinates</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td>
</tr><tr>
<td> <a href="spatial-sound.md">Spatial sound</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td>
</tr><tr>
<td> <a href="spatial-mapping.md">Spatial mapping</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td><td></td>
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


---
title: Perception simulation
description: A guide to using the Perception Simulation library to automate simulated input for immersive applications
author: pbarnettms
ms.author: pbarnett
ms.date: 05/12/2020
ms.topic: article
keywords: HoloLens, simulation, testing
---

# Perception simulation overview

Do you want to build an automated test for your app? Do you want your tests to go beyond component-level unit testing and really exercise your app end-to-end? Perception Simulation is what you're looking for. The Perception Simulation library sends human and world input data to your app so you can automate your tests. For example, you can simulate the input of a human looking to a specific, repeatable position and then use a gesture or motion controller.

Perception Simulation can send simulated input like this to a physical HoloLens, the HoloLens emulator (first gen), the HoloLens 2 Emulator, or a PC with Mixed Reality Portal installed. Perception Simulation bypasses the live sensors on a Mixed Reality device and sends simulated input to applications running on the device. Applications receive these input events through the same APIs they always use and can't tell the difference between running with real sensors versus Perception Simulation. Perception Simulation is the same technology used by the HoloLens emulators to send simulated input to the HoloLens Virtual Machine.

[Learn about using Perception Simulation in your code (C#)](../native/perception-simulation-cs.md)


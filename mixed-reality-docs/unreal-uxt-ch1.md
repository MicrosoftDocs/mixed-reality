---
title: 1. Getting started
description: Part 1 of 6 in a tutorial series to build a simple chess app using Unreal Engine 4 and the Mixed Reality Toolkit UX Tools plugin
author: hferrone
ms.author: v-haferr
ms.date: 5/5/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, mixed reality, tutorial, getting started, mrtk, uxt, UX Tools, documentation
---

# 1. Getting started

Whether you're new to mixed reality or a seasoned pro, this is the place to start your journey with [HoloLens 2](https://docs.microsoft.com/en-us/windows/mixed-reality/) and [Unreal Engine](https://www.unrealengine.com/en-US/). This tutorial series will give you a step by step guide on how to build an interactive chess app with the [UX Tools plugin](https://github.com/microsoft/MixedReality-UXTools-Unreal) - part of the [Mixed Reality Toolkit for Unreal](https://github.com/microsoft/MixedRealityToolkit-Unreal). The plugin will help you add common UX features to your projects with code, blueprints, and examples. 

![End scene in viewport](images/unreal-uxt/5-endscene.PNG)

By the end of the series you'll have hands-on experience with:
* Starting a new project
* Setting up for mixed reality
* Working with user input
* Adding buttons
* Playing on an emulator or device

If you have any questions, check out our [Unreal development overview](https://docs.microsoft.com/en-us/windows/mixed-reality/unreal-development-overview).

## Prerequisites
Make sure you've met the following requirements before jumping in:
* Windows 10 1809 or later
* Windows 10 SDK 10.0.18362.0 or later
* [Unreal Engine](https://www.unrealengine.com/en-US/get-now) 4.25 or later
* Microsoft HoloLens 2 device [configured for development](using-visual-studio.md#enabling-developer-mode) or Emulator
* Visual Studio 2019 with the workloads below

### Installing Visual Studio 2019
The last step is to setup Visual Studio as follows:
1. Install the latest version of [Visual Studio 2019](https://visualstudio.microsoft.com/downloads/)
2. Install the following [workloads](https://docs.microsoft.com/en-us/visualstudio/install/modify-visual-studio?view=vs-2019#modify-workloads):
    * Desktop development with C++
    * .NET desktop development
    * Universal Windows Platform development

3. Install the following [components](https://docs.microsoft.com/en-us/visualstudio/install/modify-visual-studio?view=vs-2019#modify-individual-components):
    * Compilers, build tools, and runtimes > MSVC v142 - VS 2019 C++ ARM64 build tools (latest version)

That's it! You're all set to move on to starting the chess app project.

[Next section: 2. Initializing your project and first application](unreal-uxt-ch2.md)
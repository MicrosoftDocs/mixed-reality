---
title: Starting from a Template Project
description: Setting up your first MRTK3 project
author: RogPodge
ms.author: roliu
ms.date: 1/13/2023
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, initial setup, setup, Mixed Reality Toolkit, MRTK
---

# Initial Setup for MRTK3

Welcome to the MRTK3 public preview! Since MRTK3 is a collection of loosely coupled packages, consuming MRTK3 is done differently than the way you consume MRTK 2.x. We don't ship MRTK as a Unity project, so you're expected to either use our example template project, which is preconfigured to consume all MRTK packages (easier to get started), or start fresh with a new project (gives you more control, recommended).

You're not expected to consume every MRTK package. See [which features are useful to you](packages/packages-overview.md) and add only the dependencies that matter.

## Acquiring the MRTK3 Template Project

The easiest way to acquire and try out MRTK3 is to explore our preconfigured project which contains references to all of the current MRTK3 packages. Clone our project at [our GitHub repo](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/mrtk3) and check out the `mrtk3` branch. After that, you can simply launch Unity (2020.3.33f1 or newer) on the `MRTKDevTemplate` project under `UnityProjects` and start playing with the [sample scenes](scenes.md) in the Editor by using remoting or deploying them to devices.

If you work with Git using the command line, you can clone the repo while specifying the `mrtk3` branch: `git clone --branch mrtk3 https://github.com/microsoft/MixedRealityToolkit-Unity.git`

For information on the sample scenes included in the preview, see [Using and creating scenes](scenes.md).

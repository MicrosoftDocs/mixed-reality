---
title: Installation Guide
description: Guide for installating Graphics Tools in a new Unreal project.
author: Cameron Micka
ms.author: thmicka
ms.date: 12/07/2020
ms.localizationpriority: high
keywords: Unreal, Unreal Engine, UE4, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, GT, Graphics Tools, Graphics, Rendering, Materials, Optimization
---

# Installation Guide

## Prerequisites

Before getting started with Graphics Tools, make sure that you have [installed the required tools](https://docs.microsoft.com/windows/mixed-reality/install-the-tools?tabs=unreal).

## Getting the prebuilt plugin

If you just want to add Graphics Tools to your game project, the quickest way is through the packaged plugin provided in the release page:
1. Download the packaged plugin zip from the [latest release](https://github.com/microsoft/MixedReality-GraphicsTools-Unreal/releases) page (e.g. _GTTools.0.1.0.zip_).
1. Unzip the file directly into your project's _Plugins_ folder. The _Plugins_ folder should be located at the root of your project, where the _.uproject_ file is. Create it if it doesn't exist.
1. Make sure your game project is a code one, as opposed to blueprint-only, if you are planning to package it for HoloLens. Otherwise UE will fail to package it because it can't build the plugin sources.
1. Open your project and enable the _GT Tools_ plugin in the plugins menu. 

You now have access to all of the plugin features.

## Next steps

* [HoloLens 2 tutorial series](https://docs.microsoft.com/windows/mixed-reality/unreal-uxt-ch1)
* [Unreal development journey](https://docs.microsoft.com/windows/mixed-reality/unreal-development-overview)

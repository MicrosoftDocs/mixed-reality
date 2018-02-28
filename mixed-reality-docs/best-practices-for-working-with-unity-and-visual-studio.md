---
title: Best practices for working with Unity and Visual Studio
description: 
author: 
ms.author: mazeller
ms.date: 2/28/2018
ms.topic: article
keywords: 
---



# Best practices for working with Unity and Visual Studio

A developer creating a holographic application with Unity will need to switch between Unity and Visual Studio to build the application package that is deployed to HoloLens. By default two instances of Visual Studio are required (one to modify Unity scripts and one to deploy to the device and debug). The following procedure allows development using single Visual Studio instance, reduces the frequency of exporting Unity projects, and improves the debugging experience.

## Improving iteration time

A common workflow problem when working with Unity and Visual Studio is having multiple windows of Visual Studio open and the need to constantly switch between Visual Studio and Unity to iterate.
1. **Unity** - for modifying the scene and exporting a Visual Studio solution
2. **Visual Studio (1)** - for modifying scripts
3. **Visual Studio (2)** - for building and deploying the Unity exported Visual Studio solution to the device

Luckily, there's a way to streamline to a single instance of Visual Studio and cut down on frequent exports from Unity.

When [exporting your project from Unity](exporting-and-building-a-unity-visual-studio-solution.md), check the **Unity C# Projects** checkbox in the "File > Build Settings" menu. Now, the project you export from Unity includes all of your project's C# scripts and has several benefits:
* Use the same instance of Visual Studio for writing scripts and building/deploying your project
* Export from Unity only when the scene is changed in the Unity Editor; changing the contents of scripts can be done in Visual Studio without re-exporting.

With **Unity C# Projects** enabled, only one instance of each program need be opened:
1. **Unity** - for modifying the scene and exporting a Visual Studio solution
2. **Visual Studio** - for modifying scripts then building and deploying the Unity exported Visual Studio solution to the device

## Visual Studio Tools for Unity

Download [Visual Studio Tools for Unity](https://visualstudiogallery.msdn.microsoft.com/8d26236e-4a64-4d64-8486-7df95156aba9)

**Benefits of Visual Studio Tools for Unity**
* Debug Unity in-editor play mode from Visual Studio by putting breakpoints, evaluating variables and complex expressions.
* Use the Unity Project Explorer to find your script with the exact same hierarchy that Unity displays.
* Get the Unity console directly inside Visual Studio.
* Use wizards to quickly create or navigate to scripts.

## Expose C# class variables for easy tuning

Make C# class variables public to expose them in the editor UI. This makes it possible to easily tweak variables while playing in-editor. This is especially useful for tuning interaction mechanic properties.

## Regenerate UWP Visual Studio solutions after Windows SDK or Unity upgrade

UWP Visual Studio solutions checked in to source control can get out-of-date after upgrading to a new Windows SDK or Unity engine. You can resolve this after the upgrade by building a new UWP solution from Unity, then merging any differences into the checked-in solution.

## Use text-format assets for easy comparison of content changes

Storing assets in text format makes it easier to review content change diffs in Visual Studio. You can enable this in "Edit > Project Settings > Editor" by changing **Asset Serialization** mode to **Force Text**. However, merging text asset file changes is error-prone and not recommended, so consider enabling exclusive binary checkouts in your source control system.
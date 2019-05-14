---
title: Best practices for working with Unity and Visual Studio
description: Tips and tricks to streamline the workflow of creating a mixed reality application with Unity and Visual Studio.
author: mattzmsft
ms.author: mazeller
ms.date: 03/21/2018
ms.topic: article
keywords: deploy, unity, visual studio, HoloLens, HoloLens 2, immersive headset
---

# Best practices for working with Unity and Visual Studio

A developer creating a mixed reality application with Unity will need to switch between Unity and Visual Studio to build the application package that is deployed to HoloLens and/or an immersive headset. By default two instances of Visual Studio are required (one to modify Unity scripts and one to deploy to the device and debug). The following procedure allows development using single Visual Studio instance, reduces the frequency of exporting Unity projects, and improves the debugging experience.

## Improving iteration time

Support for .NET scripting back-end in Unity is being deprecated in Unity 2018 and removed in Unity 2019+. Thus, it is advised to switch to [IL2CPP](https://docs.unity3d.com/Manual/IL2CPP.html). However, this may incur longer build times from Unity to Visual Studio. To improve for faster iteration, one should set up their environment for best compilation results.

1) Leverage incremental building by building your project to the same directory every time, re-using the pre-built files there
2) Disable anti-malware software scans for your project & build folders
   - Open **Virus & threat protection** under your Windows 10 settings app
   - Select **Manage Settings** under **Virus & threat protection settings**
   - Select **Add or remove exclusions** under the **Exclusions** section
   - Click **Add an exclusion** and select the folder contain your Unity project code and build outputs
3) Utilize an SSD for building

Please read [Optimizing Build Times for IL2CPP](https://docs.unity3d.com/Manual/IL2CPP-OptimizingBuildTimes.html) for more info. Also please read [Debugging on IL2CPP Scripting Back-end](https://docs.unity3d.com/Manual/windowsstore-debugging-il2cpp.html).

Further, consider installing the [*UnityScriptAnalyzer* Visual Studio extension](https://github.com/Microsoft/MixedRealityCompanionKit/tree/master/UnityScriptAnalyzer). This tool analyzes your Unity C# scripts for code that may be able to be written in a more optimized manner.

## Visual Studio Tools for Unity

Download [Visual Studio Tools for Unity](https://docs.microsoft.com/en-us/visualstudio/cross-platform/getting-started-with-visual-studio-tools-for-unity?view=vs-2019)

**Benefits of Visual Studio Tools for Unity**
* Debug Unity in-editor play mode from Visual Studio by putting breakpoints, evaluating variables and complex expressions.
* Use the Unity Project Explorer to find your script with the exact same hierarchy that Unity displays.
* Get the Unity console directly inside Visual Studio.
* Use wizards to quickly create or navigate to scripts.

## Expose C# class variables for easy tuning

There are two ways to expose class variables. The recommended way to do so is to add the [SerializeField] attribute to your private variables. This allows them to be accessed from the editor but not programatically exposed.  The other option is to make C# class variables public to expose them in the editor UI. 

Both approaches make it possible to easily tweak variables while playing in-editor. This is especially useful for tuning interaction mechanic properties.

## Regenerate UWP Visual Studio solutions after Windows SDK or Unity upgrade

UWP Visual Studio solutions checked in to source control can get out-of-date after upgrading to a new Windows SDK or Unity engine. You can resolve this after the upgrade by building a new UWP solution from Unity, then merging any differences into the checked-in solution.

## Use text-format assets for easy comparison of content changes

Storing assets in text format makes it easier to review content change diffs in Visual Studio. You can enable this in "Edit > Project Settings > Editor" by changing **Asset Serialization** mode to **Force Text**. However, merging text asset file changes is error-prone and not recommended, so consider enabling exclusive binary checkouts in your source control system.

## See also
- [Visual Studio Tools for Unity](https://visualstudiogallery.msdn.microsoft.com/8d26236e-4a64-4d64-8486-7df95156aba9)
- [Optimizing Build Times for IL2CPP](https://docs.unity3d.com/Manual/IL2CPP-OptimizingBuildTimes.html)
- [*UnityScriptAnalyzer* Visual Studio extension](https://github.com/Microsoft/MixedRealityCompanionKit/tree/master/UnityScriptAnalyzer)
---
title: Using the Windows namespace with Unity apps for HoloLens
description: Explains how to make use of WinRT APIs in your Unity project for HoloLens.
author: MikeRiches
ms.author: mriches
ms.date: 03/21/2018
ms.topic: article
keywords: Unity, WinRT, windows mixed reality, API, walkthrough 
---

# Using the Windows namespace with Unity apps for HoloLens

This page describes how to make use of WinRT APIs in your Unity project for HoloLens.

## Conditionally include WinRT API calls

WinRT APIs can be leveraged for Unity projects built for the Universal Windows Platform and Xbox One platform; any code that you write in Unity scripts that target WinRT APIs must be conditionally included for only those builds. 

This can be done via two steps in Unity:
1) API compatibility level must be set to **.NET 4.6** or **.NET Standard 2.0** in the player settings
    - **Edit** > **Project Settings** > **Player** > **Configuration** > **Api Compatibility Level** to **.NET 4.6** or **.NET Standard 2.0**
2) The preprocessor directive **ENABLE_WINMD_SUPPORT** must be wrapped around any WinRT-leveraged code

The following code snippet is from the Unity manual page for [Universal Windows Platform: WinRT API in C# scripts](http://docs.unity3d.com/Manual/windowsstore-scripts.html). In this example, an advertising ID is returned, but only on UWP and Xbox One builds:

```
using UnityEngine;
public class WinRTAPI : MonoBehaviour {
    void Update() {
        auto adId = GetAdvertisingId();
        // ...
    }

    string GetAdvertisingId() {
        #if ENABLE_WINMD_SUPPORT
            return Windows.System.UserProfile.AdvertisingManager.AdvertisingId;
        #else
            return "";
        #endif
    }
}
```

## Edit your scripts in a Unity C# project

When you double-click a script in the Unity editor, it will by default launch your script in an editor project. The WinRT APIs will appear to be unknown because the Visual Studio project does not reference the Windows Runtime. Further, the **ENALBE_WINMD_SUPPORT** directive will be undefined and any *#if* wrapped code will be ignored until you build your project into a UWP Visual Studio solution.

## See also
* [Exporting and building a Unity Visual Studio solution](exporting-and-building-a-unity-visual-studio-solution.md)
* [Windows Runtime Support Unity](https://docs.unity3d.com/Manual/IL2CPP-WindowsRuntimeSupport.html)
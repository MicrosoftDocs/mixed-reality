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

WinRT APIs will only be used in Unity project builds that target Windows 8, Windows 8.1, or the Universal Windows Platform; any code that you write in Unity scripts that targets WinRT APIs must be conditionally included for only those builds. This is done using the NETFX_CORE or WINDOWS_UWP preprocessor definitions. This rule applies to using statements, as well as other code.

The following code snippet is from the Unity manual page for [Universal Windows Platform: WinRT API in C# scripts](http://docs.unity3d.com/Manual/windowsstore-scripts.html). In this example, an advertising ID is returned, but only on Windows 8.0 or higher target builds:

```
using UnityEngine;
public class WinRTAPI : MonoBehaviour {
    void Update() {
        auto adId = GetAdvertisingId();
        // ...
    }

    string GetAdvertisingId() {
        #if NETFX_CORE
            return Windows.System.UserProfile.AdvertisingManager.AdvertisingId;
        #else
            return "";
        #endif
    }
}
```

## Edit your scripts in a Unity C# project

When you double-click a script in the Unity editor, it will by default launch your script in an editor project. The WinRT APIs will appear to be unknown for two reasons: NETFX_CORE is not defined in this environment, and the project does not reference the Windows Runtime. If you use the [recommended export and built settings](exporting-and-building-a-unity-visual-studio-solution.md), and edit the scripts in that project instead, it will define NETFX_CORE and also include a reference to the Windows Runtime; with this configuration in place, WinRT APIs will be available for IntelliSense.

Note that your Unity C# project can also be used to debug through your scripts using F5 remote debugging in Visual Studio. If you do not see IntelliSense working the first time that you open your Unity C# project, close the project and re-open it. IntelliSense should start working.

## See also
* [Exporting and building a Unity Visual Studio solution](exporting-and-building-a-unity-visual-studio-solution.md)

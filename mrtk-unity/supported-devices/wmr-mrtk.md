---
title: Deploying to Hololens and WMR headsets
description: Documentation to Build and Deploy Apps into various devices.
author: polar-kev
ms.author: kesemple
ms.date: 01/12/2021
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Visual Studio
---

# Deploying to Hololens and WMR headsets

There are two ways to deploy applications built with MRTK to your windows device, the Univeral Windows Platform (UWP) and the Standalone Platform. Applications built for HoloLens 1 or HoloLens 2 must target UWP, while applications built for WMR headsets may target either UWP or Standalone.

## Building and deploying MRTK to HoloLens 1, HoloLens 2 and WMR headsets (UWP)

Instructions on how to build and deploy for **HoloLens 1** and **HoloLens 2** (UWP) can be found at [building your application to device](/windows/mixed-reality/mrlearning-base-ch1#build-your-application-to-your-device). These steps also allow you to deploy to **WMR headsets**.

> [!NOTE]
> When deploying your application to your device in Visual Studio, you need to configure Visual Studio slightly differently depending on the device. The configurations are as follows
>
>| Platform | Configuration | Architecture | Target |
|---|---|---|---|
| HoloLens 2 | Release or Master | ARM64 | Device |
| HoloLens 1 | Release or Master | x86 | Device |
| WMR Headsets | Release or Master | x64 | Local Machine |

**Tip:** When building for HoloLens 1, HoloLens 2, or WMR, it is recommended that the build settings "Target SDK Version"
and "Minimum Platform Version" look like they do in the picture below:

![Build window](../features/images/getting-started/BuildWindow.png)

The other settings can be different (for example, Build Configuration/Architecture/Build Type and others can always
be changed inside the Visual Studio solution).

Make sure that the "Target SDK Version" dropdown includes the option "10.0.18362.0" - if this is missing,
[the latest Windows SDK](https://developer.microsoft.com/windows/downloads/windows-10-sdk) needs to be installed.

### Unity 2019.3 and HoloLens

If a HoloLens app appears as a 2D panel on device, make sure the following settings have been configured in Unity 2019.3.x before deploying your UWP app:

If using the legacy XR:

1. Navigate to Edit > Project Settings, Player
1. Under **XR Settings** in the UWP tab, make sure **Virtual Reality Supported** is enabled and the **Windows Mixed Reality** SDK has been added to SDKs.
1. Build and deploy in Visual Studio

If using the XR-Plugin:

1. Follow the steps found in [Getting Started with XRSDK](../configuration/getting-started-with-mrtk-and-xrsdk.md)
1. Make sure the configuration profile is the **DefaultXRSDKConfigurationProfile**
1. Navigate to **Edit > Project Settings, XR-Plugin Management** and make sure **Windows Mixed Reality** is enabled.
1. Build and deploy in Visual Studio

>[!IMPORTANT]
> If using Unity 2019.3.x, select **ARM64** and not **ARM** as the build architecture in Visual Studio. With the default Unity settings in Unity 2019.3.x, a Unity app will not deploy to a HoloLens if ARM is selected due to a Unity bug. This can be tracked on [Unity's issue tracker](https://issuetracker.unity3d.com/issues/enabling-graphics-jobs-in-2019-dot-3-x-results-in-a-crash-or-nothing-rendering-on-hololens-2).
>
> If the ARM architecture is required, navigate to **Edit > Project Settings, Player**, and under the **Other Settings** menu disable **Graphics Jobs**. Disabling **Graphics Jobs** will allow the app to deploy using the ARM build architecture for Unity 2019.3.x, but ARM64 is recommended.

## Building and deploying MRTK to WMR Headsets (Standalone)

Standalone builds of MRTK can be used on WMR headsets. A Standalone build for a WMR headset requires the following extra steps:

> [!NOTE]
> Unity's XR SDK also supports native WMR in Standalone builds, but does not require SteamVR or WMR plugin. These steps are required for Unity's legacy XR.

1. Install [Steam](https://store.steampowered.com/about/)
1. Install [SteamVR](https://store.steampowered.com/app/250820/SteamVR/)
1. Install the [WMR Plugin](https://store.steampowered.com/app/719950/Windows_Mixed_Reality_for_SteamVR/)

### How to use WMR plugin

1. Open Steam and search for the Windows Mixed Reality Plugin
    - Make sure SteamVR is closed before launching the WMR Plugin. Launching the WMR plugin also launches SteamVR.
    - Make sure the WMR headset is plugged in.

    ![WMR Plugin Search](../features/images/build-deploy/WMR/SteamSearchWMRPlugin.png)

1. Select **Launch** for the Windows Mixed Reality for SteamVR Plugin.

    ![WMR Plugin](../features/images/build-deploy/WMR/WMRPlugin.png)

    - SteamVR and the WMR plugin will launch and a new tracking status window for the WMR headset will appear.
    - For more information visit the [Windows Mixed Reality Steam Documentation](https://support.microsoft.com/help/4053622/windows-10-play-steamvr-games-in-windows-mixed-reality)

        ![WMR Launch Appearance](../features/images/build-deploy/WMR/WMRPluginActive.png)

1. In Unity, with your MRTK scene open, navigate to **File > Build Settings**

1. Build the scene
    - Select **Add Open Scene**
    - Make sure the Platform is **Standalone**
    - Select **Build**
    - Choose the location for the new build in File Explorer

    ![Build Settings for Standalone](../features/images/build-deploy/WMR/BuildSettingsStandaloneUnity.png)

1. A new Unity executable will be created, to launch your app select the Unity executable in File Explorer.

    ![File Explorer Unity](../features/images/build-deploy/WMR/FileExplorerUnityExe.png)

## See also

- [Android and iOS Support](using-ar-foundation.md)
- [Leap Motion Support](leap-motion-mrtk.md)
- [Detecting Platform Capabilities](detecting-platform-capabilities.md)
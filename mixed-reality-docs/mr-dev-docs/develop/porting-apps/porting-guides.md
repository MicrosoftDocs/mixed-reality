---
title: Port VR apps to Windows Mixed Reality
description: Walk through requirements, common steps, and Unity-specific steps for porting existing immersive Unity applications to Windows Mixed Reality.
author: JBrentJ
ms.author: alexturn
ms.date: 05/21/2022
ms.topic: how-to
keywords: port, unity, unreal, middleware, engine, UWP, Win32, porting, HoloLens 1st gen, mixed reality headset, windows mixed reality headset, migration, Windows 10, input mapping, 
ms.custom: kr2b-contr-experiment
---

# Port VR apps to Windows Mixed Reality

Windows 10 includes support for immersive and holographic headsets. Other devices like the Oculus Rift or HTC Vive have dependencies on libraries that exist above the operating system's platform API. To bring existing Win32 Unity VR apps over to Windows Mixed Reality, you need to retarget vendor-specific VR SDK usage to [Unity's cross-vendor VR APIs and plugins](../../../develop/unity/choosing-unity-version.md).

Porting VR apps to Windows Mixed Reality requires the following high-level processes:

1. Make sure your PC is running the **Windows 10 Fall Creators Update (16299)**.
1. Upgrade to the latest version of your graphics or game engine. Game engines must support the **Windows 10 SDK version 10.0.15063.0** or higher.
1. Upgrade middleware, plug-ins, and components. If your app contains any components, upgrade to the latest versions.
1. Target the latest Unity version and OpenXR plugin. Remove dependencies on duplicate SDKs. Depending on which device your content targeted, remove or conditionally compile out that SDK.
1. Work through build issues specific to your app, your engine, and your component dependencies.

## Common porting steps

Start with the following common porting steps:

1. Make sure you have the right development hardware. The [VR enthusiast guide](/windows/mixed-reality/enthusiast-guide/windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines) lists the recommended development hardware.

1. Upgrade to the latest flight of Windows 10.
   1. Install the [Windows 10 Creators Update](https://www.microsoft.com/software-download/windows10)
   1. [Join the Windows Insider Program](https://insider.windows.com).
   1. [Enable Developer Mode](/windows/uwp/get-started/enable-your-device-for-development)
   1. [Switch to the Windows Insider Fast flights](/archive/blogs/uktechnet/joining-insider-preview) through **Settings > Update & Security Section**.

   > [!NOTE]
   > The Windows Mixed Reality platform is still under active development. Join the Windows Insider Program to access the Windows Insider Fast flight. Don't get preview builds from the Insider Skip Ahead ring, because those builds aren't the most stable for mixed reality development.

1. If you're using Visual Studio, upgrade to the most recent build. See [Install the tools](../install-the-tools.md#installation-checklist) under Visual Studio 2022. Be sure to install the **Game Development with Unity** workload.

## Unity porting steps

[!INCLUDE[](includes/unity-porting-guidance.md)]

## See also

- [Unity OpenXR Plugin](https://docs.unity3d.com/Packages/com.unity.xr.openxr@0.1/manual/index.html)
- [Windows Mixed Reality minimum PC hardware compatibility guidelines](/windows/mixed-reality/enthusiast-guide/windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines)
- [Understand performance for Mixed Reality](../advanced-concepts/understanding-performance-for-mixed-reality.md)
- [Performance recommendations for Unity](../unity/performance-recommendations-for-unity.md)
- [Motion controllers](../../design/motion-controllers.md)
- [Motion controllers in Unity](../unity/motion-controllers-in-unity.md)
- [UnityEngine.XR.InputTracking](https://docs.unity3d.com/ScriptReference/XR.InputTracking.html)


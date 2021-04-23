---
title: Porting VR apps to Windows Mixed Reality
description: A step-by-step walkthrough explaining how to port an existing immersive application to Windows Mixed Reality.
author: JBrentJ
ms.author: alexturn
ms.date: 12/9/2020
ms.topic: article
keywords: port, unity, unreal, middleware, engine, UWP, Win32, porting, HoloLens 1st gen, mixed reality headset, windows mixed reality headset, migration, Windows 10, input mapping, 
---

# Porting VR apps to Windows Mixed Reality

Windows 10 includes support for immersive and holographic headsets. If you've built content for other devices like the Oculus Rift or HTC Vive, they have dependencies on libraries that exist above the operating system's platform API. Bringing existing Win32 Unity VR apps over to Windows Mixed Reality involves retargeting usage of vendor-specific VR SDKs to Unity's cross-vendor VR APIs.

## Porting requirements

At a high level, the following steps are involved in porting existing content:
1. **Make sure your PC is running the Windows 10 Fall Creators Update (16299).** We no longer recommend receiving preview builds from the Insider Skip Ahead ring, as those builds won't be the most stable for mixed reality development.
2. **Upgrade to the latest version of your graphics or game engine.** Game engines will need to support the Windows 10 SDK version 10.0.15063.0 (released in April 2017) or higher.
3. **Upgrade any middleware, plug-ins, or components.** If your app contains any components, it's a good idea to upgrade to the latest version.
4. **Remove dependencies on duplicate SDKs**. Depending on which device your content was targeting, you'll need to remove or conditionally compile out that SDK so you can target the Windows APIs instead. An example of this scenario would be SteamVR.
5. **Work through build issues.** At this point, the porting exercise is specific to your app, your engine, and the component dependencies you have.

## Common porting steps

### 1. Make sure you have the right development hardware

The [VR enthusiast guide](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines) page lists the recommended development hardware.

### 2. Upgrade to the latest flight of Windows 10

The Windows Mixed Reality platform is still under active development. We recommend [joining the Windows Insider Program](https://insider.windows.com/) to access the "Windows Insider Fast" flight.
1. Install the [Windows 10 Creators Update](https://www.microsoft.com/software-download/windows10)
2. [Join](https://insider.windows.com/) the Windows Insider Program.
3. Enable [Developer Mode](/windows/uwp/get-started/enable-your-device-for-development)
4. Switch to the [Windows Insider Fast flights](/archive/blogs/uktechnet/joining-insider-preview) through **Settings > Update & Security Section**

### 3. Upgrade to the most recent build of Visual Studio
* If you're using Visual Studio, then upgrade to the most recent build
* See [Install the tools](../install-the-tools.md#installation-checklist) page under Visual Studio 2019

### 4. Choose the correct Adapter
* In systems like notebooks with two GPUs, [target the correct adapter](../native/rendering-in-directx.md#hybrid-graphics-pcs-and-mixed-reality-applications). This applies to Unity and native DirectX apps where a ID3D11Device is created, either explicitly or implicitly (Media Foundation), for its functionality.

## Unity porting guidance

[!INCLUDE[](includes/unity-porting-guidance.md)]

## Unreal porting guidance

> [!IMPORTANT]
> If you're using HP Reverb G2 controllers, please refer to [this article](../unreal/unreal-reverb-g2-controllers.md) for additional input mapping instructions.

## See also
* [Windows Mixed Reality minimum PC hardware compatibility guidelines](/windows/mixed-reality/enthusiast-guide/windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines)
* [Understanding Performance for Mixed Reality](../platform-capabilities-and-apis/understanding-performance-for-mixed-reality.md)
* [Performance Recommendations for Unity](../unity/performance-recommendations-for-unity.md)
* [Motion controllers](../../design/motion-controllers.md)
* [Motion controllers in Unity](../unity/motion-controllers-in-unity.md)
* [UnityEngine.XR.WSA.Input](https://docs.unity3d.com/ScriptReference/XR.WSA.Input.InteractionManager.html)
* [UnityEngine.XR.InputTracking](https://docs.unity3d.com/ScriptReference/XR.InputTracking.html)
* [Porting guides](porting-guides.md)
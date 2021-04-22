---
title: Install the tools
description: Start here with the most current versions of Unity, Visual Studio, and tools recommended for HoloLens and VR development.
author: thetuvix
ms.author: alexturn
ms.date: 04/13/2021
ms.topic: article
ms.localizationpriority: high
keywords: up-to-date, tools, get started, basics, unity, visual studio, toolkit, mixed reality headset, windows mixed reality headset, virtual reality headset, installation, Windows, HoloLens, emulator, unreal, openxr
---

# Install the tools

Get the tools you need to build applications for Microsoft HoloLens and Windows Mixed Reality immersive (VR) headsets. There is no separate SDK for Windows Mixed Reality development; you'll use Visual Studio with the Windows 10 SDK.

Don't have a mixed reality device? You can install the [HoloLens emulator](platform-capabilities-and-apis/using-the-hololens-emulator.md) to test some functionality of mixed reality apps without a HoloLens. You can also use the [Windows Mixed Reality simulator](platform-capabilities-and-apis/using-the-windows-mixed-reality-simulator.md) to test your mixed reality apps for immersive headsets. 

We recommend installing either the Unity or Unreal game engine as the easiest way to get started creating mixed reality apps. However, you can also build against DirectX if you'd like to use a custom engine.

If you're using Unity, you can use [Mixed Reality Toolkit for Unity](https://github.com/Microsoft/MixedRealityToolkit-Unity)'s input simulation to test various types of input interactions such as hand-tracking and eye-tracking input. For Unreal projects, use the [UX Tools plugin](https://github.com/microsoft/MixedReality-UXTools-Unreal) to test common input interactions and user experience features.

>[!TIP]
>Bookmark this page and check it regularly to keep up-to-date on the most recent version of each tool recommended for mixed reality development.

<br>

## Installation checklist

| Tool | Notes |
|---------|---------|
| ![Windows logo](images/Windows10_logo.png)<br><br><a href="https://www.microsoft.com/software-download/windows10" target="_blank">**Windows 10** (Manual install link)</a><br><br>Install the most recent version of Windows 10 so your PC's operating system matches the platform for which you're building mixed reality applications.  | **Installing Windows 10** <br> You can install the most recent version of Windows 10 via Windows Update in Settings or by creating installation media, using the link in the left column. <br><br>See [current release notes](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/release-notes-october-2018.md) for information about the newest mixed reality features available with each release of Windows 10. **Enable developer mode on your PC** at Settings > Update & Security > For developers. <br><br> **Note for enterprise and corporate-managed PCs**<br>If your PC is managed by an your organization's IT department, you might need to contact them in order to update. <br><br> **'N' versions of Windows**<br> Windows Mixed Reality immersive (VR) headsets are not supported on 'N' versions of Windows. |
| ![Visual Studio logo image](images/visualstudio_logo.png)<br><br><a href="https://visualstudio.microsoft.com/downloads/" target="_blank">**Visual Studio 2019 (16.8 or higher)** (Install link)</a> <br><br>Fully-featured integrated development environment (IDE) for Windows and more. You'll use Visual Studio to write code, debug, test, and deploy. | **Installing Visual Studio 2019** <br> Be sure you install the following workloads: <br><br>*● Desktop development with C++*<br>*● Universal Windows Platform (UWP) development*<br><br>Within the UWP workload, be sure to check the following optional component if you'll be developing for HoloLens:<br><br>*● USB Device Connectivity*<br><br>**Note about USB Connectivity**<br>You need to check the box **IP over USB** during installation, which isn't checked by default. This is required to communicate with a HoloLens over USB.<br><br>**Note about Unity**<br>Unless you're intentionally trying to install a newer (non-LTS) version of Unity, we recommend *not* installing the Unity workload as part of Visual Studio installation, and instead install the **Unity 2019 LTS** stream.<br><br>**Known issues**<br>There are some known issues with debugging mixed reality apps in Visual Studio 2019 version 16.0.  Please ensure that you update to **Visual Studio 2019 version 16.8 or higher**. |
| ![Windows logo](images/Windows10_logo.png)<br><br><a href="https://developer.microsoft.com//windows/downloads/windows-10-sdk" target="_blank">**Windows 10 SDK (10.0.18362.0)** (Manual install link)</a> <br><br>Provides the latest headers, libraries, metadata, and tools for building Windows 10 apps on HoloLens 2. | **To build HoloLens 2 apps, you must install the Windows SDK, build 18362 or later.**<br> <br> If you are only developing applications for desktop Windows Mixed Reality headsets or HoloLens (1st gen), you can use the Windows SDK installed by Visual Studio 2017. |
| ![Visual Studio logo](images/HoloLensIcon.jpg)<br><br><a href="https://go.microsoft.com/fwlink/?linkid=2160829" target="_blank">**HoloLens 2 Emulator (Windows Holographic, version 20H2 April 2021 Update)** (Install link: 10.0.19041.1144)</a><br> <br><a href="https://go.microsoft.com/fwlink/?linkid=2065980" target="_blank">**HoloLens (1st gen) Emulator** (Install link: 10.0.17763.134)</a> <br><br>The emulator lets you run applications on a HoloLens virtual machine image without a physical HoloLens.<br> <br> | See [Using the HoloLens emulator](../develop/platform-capabilities-and-apis/using-the-hololens-emulator.md) for more information on getting started with the emulator.<br> <br> **Your system must support Hyper-V** for the emulator installation to succeed. Reference the System Requirements section below for details. <br> <br> **Note on HoloLens (1st gen) Emulator** <br>  Visual Studio 2017 is required to successfully complete the installation. If you're installing the HoloLens (1st gen) emulator with Visual Studio 2019 you need to deselect the VS templates and [install them from the Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=WindowsMixedRealityteam.WindowsMixedRealityAppTemplatesVSIX). |

## Install your engine of choice

Now that you have your Windows 10, Visual Studio, and Windows 10 SDK ready to go, let's install and setup the engine of your choice. 

If you still need to choose an engine, see the [Introduction to Mixed Reality development](./development.md?tabs=unity#what-technology-path-are-you-interested-in). 

[!INCLUDE[](includes/tools-overview.md)]

## Set up your PC for HoloLens development

The Windows 10 SDK works best on the Windows 10 operating system. This SDK is also supported on Windows 8.1, Windows 8, Windows 7, Windows Server 2012, Windows Server 2008 R2. Note that not all tools are supported on older operating systems.

> [!NOTE]
> You can develop and deploy your apps for HoloLens, VR immersive headsets, or both. Make sure you fulfill the requirements below depending on your needs.

When setting up your development PC for HoloLens development, please make sure it meets the system requirements for <a href="https://unity3d.com/unity/system-requirements" target="_blank">Unity</a> or [Unreal](https://docs.unrealengine.com/GettingStarted/RecommendedSpecifications/index.html and <a href="//visualstudio/releases/2019/system-requirements" target="_blank">Visual Studio</a>. If you want to run your app on a HoloLens device, you need to follow the [Windows Device Portal setup instructions](../platform-capabilities-and-apis/using-the-windows-device-portal.md#setting-up-hololens-to-use-windows-device-portal). If you plan on using the [HoloLens emulator](../platform-capabilities-and-apis/using-the-hololens-emulator.md), you'll want to make sure your PC meets the [HoloLens emulator system requirements](../platform-capabilities-and-apis/using-the-hololens-emulator.md#hololens-emulator-system-requirements) as well.

To get started with the HoloLens emulator, see [Using the HoloLens emulator](../platform-capabilities-and-apis/using-the-hololens-emulator.md).

If you plan to develop for both HoloLens and Windows Mixed Reality immersive (VR) headsets, use the system recommendations and requirements in the section below.

### Troubleshooting

#### Setting Developer Mode is grayed out

If you're running into issues enabling Developer Mode on your device you might not be the [device owner](/hololens/security-adminless-os). In multi-user mode, the person who uses the device first is the device owner - any subsequent users won't have the required permissions to enable Developer Mode or other configuration changes. However, there is an exception where the first user may not be the device owner in an Autopilot environment, which is detailed in the [HoloLens security documentation](/hololens/security-adminless-os#device-owner).

Possible solutions include:

* Having the device owner turn Developer Mode on before passing the device to other users or developers
* Suggesting that your IT/MDM Admin enables CSP [Policy ApplicationManagement/AllowDeveloperUnlock](/windows/client-management/mdm/policy-csp-applicationmanagement#applicationmanagement-allowdeveloperunlock) for the specific device or a developer device group. 
    * This policy can be set by [Provisioning Packages](/hololens/hololens-provisioning) or via [MDM for HoloLens devices](/hololens/hololens-mdm-configure)
* Using the [Advanced Recovery Companion (ARC)](/hololens/hololens-recovery)

> [!NOTE]
> You can learn more about device management in the **[HoloLens device management](/hololens/hololens-csp-policy-overview)** overview.

#### I can't deploy over USB

If you're not able to deploy an application directly over USB, make sure you've met all the installation requirements listed above and follow our [step-by-step tutorial](../unity/tutorials/mr-learning-base-02.md#building-your-application-to-your-hololens-2).

## Immersive (VR) headset requirements

>[!NOTE]
>The following guidelines are the current minimum and recommended specs for your immersive (VR) headset *development PC*, and are updated regularly.

>[!WARNING]
>Do not confuse this with the [minimum PC hardware compatibility guidelines](/windows/mixed-reality/enthusiast-guide/windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines), which outlines the *consumer PC specs* to which you should target your immersive (VR) headset app or game.

If your immersive headset development PC does not have full-sized HDMI and/or USB 3.0 ports, you'll need [adapters](/windows/mixed-reality/enthusiast-guide/recommended-adapters-for-windows-mixed-reality-capable-pcs) to connect your headset.

There are currently [known issues](/windows/mixed-reality/enthusiast-guide/troubleshooting-windows-mixed-reality) with some hardware configurations, particularly notebooks that have hybrid graphics.

<table>
<tr>
<th></th><th> Minimum</th><th> Recommended</th>
</tr><tr>
<td> Processor</td><td> <b>Notebook:</b> Intel Mobile Core i5 7th generation CPU, Dual-Core with Hyper Threading <b>Desktop:</b> Intel Desktop i5 6th generation CPU, Dual-Core with Hyper Threading <b>OR</b> AMD FX4350 4.2Ghz Quad-Core equivalent</td><td> <b>Desktop:</b> Intel Desktop i7 6th generation (6 Core) <b>OR</b> AMD Ryzen 5 1600 (6 Core, 12 threads)</td>
</tr><tr>
<td> GPU</td><td> <b>Notebook:</b> NVIDIA GTX 965M, AMD RX 460M (2GB) equivalent or greater DX12 capable GPU <b>Desktop:</b> NVIDIA GTX 960/1050, AMD Radeon RX 460 (2GB) equivalent or greater DX12 capable GPU</td><td><b>Desktop:</b> NVIDIA GTX 980/1060, AMD Radeon RX 480 (2GB) equivalent or greater DX12 capable GPU</td>
</tr><tr>
<td> GPU driver WDDM version</td><td colspan="2"> WDDM 2.2 driver</td>
</tr><tr>
<td> Thermal Design Power</td><td colspan="2"> 15W or greater</td>
</tr><tr>
<td> Graphics display ports</td><td colspan="2"> 1x available graphics display port for&#160;headset (HDMI 1.4 or DisplayPort 1.2 for 60Hz headsets, HDMI 2.0 or DisplayPort 1.2 for 90Hz headsets)</td>
</tr><tr>
<td> Display resolution</td><td colspan="2"> Resolution: SVGA (800x600) or greater Bit depth: 32 bits of color per pixel</td>
</tr><tr>
<td> Memory</td><td> 8&#160;GB of RAM or greater</td><td> 16 GB of RAM or greater</td>
</tr><tr>
<td> Storage</td><td colspan="2"> &gt;10 GB additional free space</td>
</tr><tr>
<td> USB Ports</td><td colspan="2"> 1x available USB port for headset (USB 3.0 Type-A) <b>Note: USB must supply a minimum of 900mA</b></td>
</tr><tr>
<td> Bluetooth</td><td colspan="2"> Bluetooth 4.0 (for accessory connectivity)</td>
</tr>
</table>

[!INCLUDE[](includes/tools-next-steps.md)]
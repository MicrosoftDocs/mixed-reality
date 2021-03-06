---
title: Install the tools
description: MRTK-Unity, Install the tools documentation page
author: polar-kev
ms.author: kesemple
ms.date: 03/02/2021
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, mixed reality toolkit, Install, up-to-date, tools, get started, basics, unity, visual studio, toolkit, mixed reality headset, windows mixed reality headset, virtual reality headset, installation, Windows, HoloLens, emulator
---

# Install the tools

Get the tools you need to build applications for Microsoft HoloLens and Windows Mixed Reality immersive (VR) headsets. There is no separate SDK for Windows Mixed Reality development; you'll use Visual Studio with the Windows 10 SDK.

Don't have a mixed reality device? You can install the [HoloLens emulator](https://docs.microsoft.com/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-hololens-emulator)  to test some functionality of mixed reality apps without a HoloLens. You can also use the [Windows Mixed Reality simulator](https://docs.microsoft.com/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-windows-mixed-reality-simulator)  to test your mixed reality apps for immersive headsets.

This page will guide you through installing the tools you need to use the MRTK with Unity. If you're interested in exploring other Mixed Reality development platforms, check out the [Introduction to Mixed Reality development](https://docs.microsoft.com/windows/mixed-reality/develop/development?tabs=unity) page.

You can use [Mixed Reality Toolkit for Unity](https://github.com/Microsoft/MixedRealityToolkit-Unity)'s input simulation to test various types of input interactions such as hand-tracking and eye-tracking.

|TIP: Bookmark this page and check it regularly to keep up-to-date on the most recent version of each tool recommended for mixed reality development.|
|---|

## Installation checklist

| Tool | Notes |
|---------|---------|
| ![Windows logo](images/Windows10_logo.png)<br><br><a href="https://www.microsoft.com/software-download/windows10" target="_blank">**Windows 10** (Manual install link)</a><br><br>Install the most recent version of Windows 10 so your PC's operating system matches the platform for which you're building mixed reality applications.  | **Installing Windows 10** <br> You can install the most recent version of Windows 10 via Windows Update in Settings or by creating installation media, using the link in the left column. <br><br>See [current release notes](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/mixed-reality-software) for information about the newest mixed reality features available with each release of Windows 10. **Enable developer mode on your PC** at Settings > Update & Security > For developers. <br><br> **Note for enterprise and corporate-managed PCs**<br>If your PC is managed by an your organization's IT department, you might need to contact them in order to update. <br><br> **'N' versions of Windows**<br> Windows Mixed Reality immersive (VR) headsets are not supported on 'N' versions of Windows. |
| ![Visual Studio logo image](images/visualstudio_logo.png)<br><br><a href="https://visualstudio.microsoft.com/downloads/" target="_blank">**Visual Studio 2019 (16.8 or higher)** (Install link)</a> <br><br>Fully-featured integrated development environment (IDE) for Windows and more. You'll use Visual Studio to write code, debug, test, and deploy. | **Installing Visual Studio 2019** <br> Be sure you install the following workloads: <br><br>*● Desktop development with C++*<br>*● Universal Windows Platform (UWP) development*<br><br>Within the UWP workload, be sure to check the following optional component if you'll be developing for HoloLens:<br><br>*● USB Device Connectivity*<br><br>**Note about Unity**<br>Unless you're intentionally trying to install a newer (non-LTS) version of Unity for a specific purpose, we recommend *not* installing the Unity workload as part of Visual Studio installation, and instead install the **Unity 2019 LTS** stream as noted below.<br><br>**Known issues**<br>There are some known issues with debugging mixed reality apps in Visual Studio 2019 version 16.0.  Please ensure that you update to **Visual Studio 2019 version 16.8 or higher**. |
| ![Windows logo](images/Windows10_logo.png)<br><br><a href="https://developer.microsoft.com//windows/downloads/windows-10-sdk" target="_blank">**Windows 10 SDK (10.0.18362.0)** (Manual install link)</a> <br><br>Provides the latest headers, libraries, metadata, and tools for building Windows 10 apps on HoloLens 2. | **To build HoloLens 2 apps, you must install the Windows SDK, build 18362 or later.**<br> <br> If you are only developing applications for desktop Windows Mixed Reality headsets or HoloLens (1st gen), you can use the Windows SDK installed by Visual Studio 2019. |
| ![Visual Studio logo](images/HoloLensIcon.jpg)<br><br><a href="https://go.microsoft.com/fwlink/?linkid=2154784" target="_blank">**HoloLens 2 Emulator (Windows Holographic, version 20H2 February 2021 Update)** (Install link: 10.0.19041.1134)</a><br> <br><a href="https://go.microsoft.com/fwlink/?linkid=2065980" target="_blank">**HoloLens (1st gen) Emulator** (Install link: 10.0.17763.134)</a> <br><br>The emulator lets you run applications on a HoloLens virtual machine image without a physical HoloLens.<br> <br> | See [Using the HoloLens emulator](https://docs.microsoft.com/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-hololens-emulator) for more information on getting started with the emulator.<br> <br> **Your system must support Hyper-V** for the emulator installation to succeed. Reference the System Requirements section below for details. <br> <br> **Note on HoloLens (1st gen) Emulator** <br>. If you're installing the HoloLens (1st gen) emulator with Visual Studio 2019 you need to deselect the VS templates and [install them from the Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=WindowsMixedRealityteam.WindowsMixedRealityAppTemplatesVSIX). |

## Unity

Now that you have your Windows 10, Visual Studio, and Windows 10 SDK ready to go, let's use Unity as an engine to build on.

### 1. Download the latest version

We recommend the [Unity LTS (Long Term Support)](https://unity3d.com/unity/qa/lts-releases) stream as the best version to use when starting new projects, updating to its latest revision to pick up the latest stable fixes.

* The current recommendation is to use [Unity 2019.4 LTS](https://unity3d.com/unity/qa/lts-releases?version=2019.4). Unity 2018.4 LTS is also supported.
* If you would like to use the [Mixed Reality OpenXR](https://docs.microsoft.com/windows/mixed-reality/develop/unity/openxr-getting-started) preview features with MRTK, you will need Unity 2020.2 or higher.
* If you need to use a different version of Unity for specific reasons, Unity supports side-by-side installs of different versions.

### 2. Install the Mixed Reality Feature Tool

The [Mixed Reality Feature Tool](https://docs.microsoft.com/windows/mixed-reality/develop/unity/welcome-to-mr-feature-tool) is a new way for developers to discover and add Mixed Reality feature packages into Unity projects.

You can search packages by name or category, see their dependencies, and even view proposed changes to your projects manifest file before importing. Once you've validated the packages you want, the Mixed Reality Feature tool will download them into the Unity project of your choice.

#### Importing the Mixed Reality Toolkit

You can download the Mixed Reality Toolkit package by following the [installation and usage instructions](https://docs.microsoft.com/windows/mixed-reality/develop/unity/welcome-to-mr-feature-tool#system-requirements) and selecting the Mixed Reality Toolkit Foundation package.

If you prefer to manually download MRTK packages from Github, visit the Release page at [Mixed Reality Toolkit-Unity (GitHub)](https://github.com/microsoft/MixedRealityToolkit-Unity/releases).

### 3. Set up your PC for Mixed Reality development

The Windows 10 SDK works best on the Windows 10 operating system. This SDK is also supported on Windows 8.1, Windows 8, Windows 7, Windows Server 2012, Windows Server 2008 R2. Note that not all tools are supported on older operating systems.

| Note: You can develop and deploy your apps for HoloLens, VR immersive headsets, or both. Make sure you fulfill the requirements below depending on your needs. |
|---|

#### For HoloLens development

When setting up your development PC for HoloLens development, please make sure it meets the system requirements for both [Unity](https://docs.unity3d.com/Manual/system-requirements.html) and Visual Studio. If you want to run your app on a HoloLens device, you need to follow the [Windows Device Portal setup instructions](https://docs.microsoft.com/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-windows-device-portal#setting-up-hololens-to-use-windows-device-portal). If you plan on using the [HoloLens emulator](https://docs.microsoft.com/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-hololens-emulator), you'll want to make sure your PC meets the [HoloLens emulator system requirements](https://docs.microsoft.com/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-hololens-emulator#hololens-emulator-system-requirements) as well.

To get started with the HoloLens emulator, see [Using the HoloLens emulator](https://docs.microsoft.com/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-hololens-emulator).

If you plan to develop for both HoloLens and Windows Mixed Reality immersive (VR) headsets, use the system recommendations and requirements in the section below.

### HoloLens troubleshooting

Setting Developer Mode is grayed out

If you're running into issues enabling Developer Mode on your device you might not be the [device owner](https://docs.microsoft.com/hololens/security-adminless-os). In multi-user mode, the person who uses the device first is the device owner - any subsequent users won't have the required permissions to enable Developer Mode or other configuration changes. However, there is an exception where the first user may not be the device owner in an Autopilot environment, which is detailed in the [HoloLens security documentation](https://docs.microsoft.com/hololens/hololens2-compliance).

Possible solutions include:

* Having the device owner turn Developer Mode on before passing the device to other users or developers
* Suggesting that your IT/MDM Admin enables [CSP Policy ApplicationManagement/AllowDeveloperUnlock](https://docs.microsoft.com/windows/client-management/mdm/policy-csp-applicationmanagement#applicationmanagement-allowdeveloperunlock) for the specific device or a developer device group.
This policy can be set by [Provisioning Packages](https://docs.microsoft.com/hololens/hololens-provisioning) or via [MDM for HoloLens devices](https://docs.microsoft.com/hololens/hololens-mdm-configure)
* Using the [Advanced Recovery Companion (ARC)](https://docs.microsoft.com/hololens/hololens-recovery)

| Note: You can learn more about device management in the HoloLens device management overview.|
|---|

I can't deploy over USB

If you're not able to deploy an application directly over USB, make sure you've met all the installation requirements listed above and follow our [step-by-step tutorial](https://docs.microsoft.com/windows/mixed-reality/develop/unity/tutorials/mr-learning-base-02#building-your-application-to-your-hololens-2).

Immersive (VR) headset requirements

| Note: The following guidelines are the current minimum and recommended specs for your immersive (VR) headset development PC, and are updated regularly.|
|---|

| Warning: Do not confuse this with the [minimum PC hardware compatibility guidelines](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines), which outlines the consumer PC specs to which you should target your immersive (VR) headset app or game.|
|---|

If your immersive headset development PC does not have full-sized HDMI and/or USB 3.0 ports, you'll need [adapters ](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/recommended-adapters-for-windows-mixed-reality-capable-pcs)to connect your headset.

There are currently [known issues](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/troubleshooting-windows-mixed-reality) with some hardware configurations, particularly notebooks that have hybrid graphics.

. | Minimum | Recommended
--- |--- |---
Processor | Notebook: Intel Mobile Core i5 7th generation CPU, Dual-Core with Hyper Threading Desktop: Intel Desktop i5 6th generation CPU, Dual-Core with Hyper Threading OR AMD FX4350 4.2Ghz Quad-Core equivalent| Desktop: Intel Desktop i7 6th generation (6 Core) OR AMD Ryzen 5 1600 (6 Core, 12 threads) GPU | Notebook: NVIDIA GTX 965M, AMD RX 460M (2GB) equivalent or greater DX12 capable GPU Desktop: NVIDIA GTX 960/1050, AMD Radeon RX 460 (2GB) equivalent or greater DX12 capable GPU | Desktop: NVIDIA GTX 980/1060, AMD Radeon RX 480 (2GB) equivalent or greater DX12 capable GPU
GPU driver WDDM version | WDDM 2.2 driver
Thermal Design Power | 15W or greater
Graphics display ports | 1x available graphics display port for headset (HDMI 1.4 or DisplayPort 1.2 for 60Hz headsets, HDMI 2.0 or DisplayPort 1.2 for 90Hz headsets)
Display resolution | Resolution: SVGA (800x600) or greater Bit depth: 32 bits of color per pixel
Memory | 8 GB of RAM or greater | 16 GB of RAM or greater
Storage | >10 GB additional free space
USB Ports | 1x available USB port for headset (USB 3.0 Type-A) Note: USB must supply a minimum of 900mA
Bluetooth | Bluetooth 4.0 (for accessory connectivity)

## Next Development Checkpoint

Now that you've got the the tools installed, we recommend following our MRTK HoloLens 2 tutorials series.
> [!div class="nextstepaction"]
> [HoloLens 2 Tutorial Series](https://docs.microsoft.com/windows/mixed-reality/develop/unity/tutorials/mr-learning-base-02)
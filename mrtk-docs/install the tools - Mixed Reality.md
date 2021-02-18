---
title: Install the tools - Mixed Reality
description: MRTK Install the tools documentation page
author: ebavliya-MS
ms.author: ebevliya
ms.date: 02/17/2021
ms.localizationpriority: high
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Install, tools
---

# Install the tools

Get the tools you need to build applications for Microsoft HoloLens and Windows Mixed Reality immersive (VR) headsets. There is no separate SDK for Windows Mixed Reality development; you'll use Visual Studio with the Windows 10 SDK.

Don't have a mixed reality device? You can install the [HoloLens emulator](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-hololens-emulator)  to test some functionality of mixed reality apps without a HoloLens. You can also use the [Windows Mixed Reality simulator](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-windows-mixed-reality-simulator)  to test your mixed reality apps for immersive headsets.

We recommend installing Unity as the easiest way to get started creating mixed reality apps.

You can use [Mixed Reality Toolkit for Unity](https://github.com/Microsoft/MixedRealityToolkit-Unity) 's input simulation to test various types of input interactions such as hand-tracking and eye-tracking input. 

|TIP: Bookmark this page and check it regularly to keep up-to-date on the most recent version of each tool recommended for mixed reality development.|
|---|

# Installation checklist

## Installing Windows 10 
[Manual Install Link](https://www.microsoft.com/en-us/software-download/windows10)

Install the most recent version of Windows 10 so your PC's operating system matches the platform for which you're building mixed reality applications.

You can install the most recent version of Windows 10 via Windows Update in Settings or by creating installation media, using the [link](https://www.microsoft.com/en-us/software-download/windows10).

See [current release notes](https://docs.microsoft.com/en-us/windows/mixed-reality/enthusiast-guide/mixed-reality-software) for information about the newest mixed reality features available with each release of Windows 10. Enable developer mode on your PC at Settings > Update & Security > For developers.

#### Note for enterprise and corporate-managed PCs
If your PC is managed by your organization's IT department, you might need to contact them in order to update.

#### 'N' versions of Windows
Windows Mixed Reality immersive (VR) headsets are not supported on 'N' versions of Windows.

## Installing Visual Studio 2019
[Install Link](https://visualstudio.microsoft.com/downloads/)

Fully-featured integrated development environment (IDE) for Windows and more. You'll use Visual Studio to write code, debug, test, and deploy.

Be sure you install the following workloads:

* Desktop development with C++
*  Universal Windows Platform (UWP) development

Within the UWP workload, be sure to check the following optional component if you'll be developing for HoloLens:

*  USB Device Connectivity

#### Note about Unity
Unless you're intentionally trying to install a newer (non-LTS) version of Unity for a specific purpose, we recommend not installing the Unity workload as part of Visual Studio installation, and instead install the **Unity 2019 LTS** stream as noted below.

#### Known issues
There are some known issues with debugging mixed reality apps in Visual Studio 2019 version 16.0. Please ensure that you update to **Visual Studio 2019 version 16.8 or higher**.

## Installing Windows 10 SDK
[Manual Install Link](https://developer.microsoft.com/en-us/windows/downloads/windows-10-sdk/)

Provides the latest headers, libraries, metadata, and tools for building Windows 10 apps on HoloLens 2.

**To build HoloLens 2 apps, you must install the Windows SDK, build 18362 or later.**

If you are only developing applications for desktop Windows Mixed Reality headsets or HoloLens (1st gen), you can use the Windows SDK installed by Visual Studio 2017.

## Installing HoloLens Emulator
[HoloLens 2 Emulator Install Link - Windows Holographic, version 20H2 February 2021 Update 10.0.19041.1134](https://go.microsoft.com/fwlink/?linkid=2154784)

[HoloLens 1st gen  Emulator Install Link](https://go.microsoft.com/fwlink/?linkid=2065980)

The emulator lets you run applications on a HoloLens virtual machine image without a physical HoloLens.

See Using the [HoloLens emulator](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-hololens-emulator) for more information on getting started with the emulator.

**Your system must support Hyper-V** for the emulator installation to succeed. Reference the System Requirements section below for details.

#### Note on HoloLens (1st gen) Emulator
Visual Studio 2017 is required to successfully complete the installation. If you're installing the HoloLens (1st gen) emulator with Visual Studio 2019 you need to deselect the VS templates and [install them from the Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=WindowsMixedRealityteam.WindowsMixedRealityAppTemplatesVSIX).

# Unity
Now that you have your Windows 10, Visual Studio, and Windows 10 SDK ready to go, let's use Unity as an engine to build on.

** 1. Download the latest version**

We recommend the [Unity LTS (Long Term Support)](https://unity3d.com/unity/qa/lts-releases) stream as the best version to use when starting new projects, updating to its latest revision to pick up the latest stable fixes.

* The current recommendation is to use [Unity 2019.4 LTS](https://unity3d.com/unity/qa/lts-releases?version=2019.4), which is the LTS build required for MRTK v2 below.
* If you need to use a different version of Unity for specific reasons, Unity supports side-by-side installs of different versions.

**2. Install the Mixed Reality Feature Tool

The [Mixed Reality Feature Tool](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/unity/welcome-to-mr-feature-tool) is a new way for developers to discover and add Mixed Reality feature packages into Unity projects.

You can search packages by name or category, see their dependencies, and even view proposed changes to your projects manifest file before importing. Once you've validated the packages you want, the Mixed Reality Feature tool will download them into the project of your choice.

### Importing the Mixed Reality Toolkit

[Mixed Reality Toolkit (MRTK)](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/unity/mrtk-getting-started) is an open-source, cross-platform development kit for mixed reality applications.

Install the Mixed Reality Toolkit package by following the [installation and usage instructions](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/unity/welcome-to-mr-feature-tool#system-requirements) and selecting the Mixed Reality Toolkit Foundation package.
We recommend completing the getting started section in our curated[ HoloLens](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/unity/unity-development-overview?tabs=mrtk%2Carr%2Chl2#1-getting-started) or [VR](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/unity/unity-development-wmr-overview?tabs=mrtk#1-getting-started) development journeys. If you're already following the Unity development for HoloLens journey, finish up the rest of the setup steps listed below and continue on to the HoloLens 2 Getting Started tutorials.

| Important: Note that installation instructions are targeted for the latest stable combination of MRTK and Unity releases, which are MRTK 2.5.1 and Unity 2019.4 LTS.|
|---|

| Note: If you don't want to use MRTK for Unity, you'll need to script all interactions and behaviors yourself.|
|---|


[Mixed Reality Toolkit-Unity (GitHub)](https://github.com/Microsoft/MixedRealityToolkit-Unity)

**Other tools [optional]**

[Mixed Reality Companion Kit (GitHub)](https://github.com/Microsoft/MixedRealityCompanionKit) - code bits and components that might not run directly on HoloLens or immersive (VR) headsets, but instead pair with them to build experiences targeting Windows Mixed Reality.

[Mixed Reality Toolkit - Common (GitHub)](https://github.com/Microsoft/MixedRealityToolkit) - a collection of shared scripts and components.

** 3. Set up your PC for Mixed Reality development

The Windows 10 SDK works best on the Windows 10 operating system. This SDK is also supported on Windows 8.1, Windows 8, Windows 7, Windows Server 2012, Windows Server 2008 R2. Note that not all tools are supported on older operating systems.

| Note: You can develop and deploy your apps for HoloLens, VR immersive headsets, or both. Make sure you fulfill the requirements below depending on your needs. |
|---|

**For HoloLens development**

When setting up your development PC for HoloLens development, please make sure it meets the system requirements for both [Unity](https://docs.unity3d.com/Manual/system-requirements.html) and Visual Studio. If you want to run your app on a HoloLens device, you need to follow the [Windows Device Portal setup instructions](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-windows-device-portal#setting-up-hololens-to-use-windows-device-portal). If you plan on using the [HoloLens emulator](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-hololens-emulator), you'll want to make sure your PC meets the [HoloLens emulator system requirements](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-hololens-emulator#hololens-emulator-system-requirements) as well.

To get started with the HoloLens emulator, see [Using the HoloLens emulator](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-hololens-emulator).

If you plan to develop for both HoloLens and Windows Mixed Reality immersive (VR) headsets, use the system recommendations and requirements in the section below.

**HoloLens troubleshooting**

Setting Developer Mode is grayed out
If you're running into issues enabling Developer Mode on your device you might not be the [device owner](https://docs.microsoft.com/en-us/hololens/security-adminless-os). In multi-user mode, the person who uses the device first is the device owner - any subsequent users won't have the required permissions to enable Developer Mode or other configuration changes. However, there is an exception where the first user may not be the device owner in an Autopilot environment, which is detailed in the [HoloLens security documentation](https://docs.microsoft.com/en-us/hololens/hololens2-compliance).

Possible solutions include:

* Having the device owner turn Developer Mode on before passing the device to other users or developers
* Suggesting that your IT/MDM Admin enables [CSP Policy ApplicationManagement/AllowDeveloperUnlock](https://docs.microsoft.com/en-us/windows/client-management/mdm/policy-csp-applicationmanagement#applicationmanagement-allowdeveloperunlock) for the specific device or a developer device group.
This policy can be set by [Provisioning Packages](https://docs.microsoft.com/en-us/hololens/hololens-provisioning) or via [MDM for HoloLens devices](https://docs.microsoft.com/en-us/hololens/hololens-mdm-configure)
* Using the [Advanced Recovery Companion (ARC)](https://docs.microsoft.com/en-us/hololens/hololens-recovery)

| Note: You can learn more about device management in the HoloLens device management overview.|
|---|

I can't deploy over USB

If you're not able to deploy an application directly over USB, make sure you've met all the installation requirements listed above and follow our [step-by-step tutorial](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/unity/tutorials/mr-learning-base-02#building-your-application-to-your-hololens-2).

Immersive (VR) headset requirements

| Note: The following guidelines are the current minimum and recommended specs for your immersive (VR) headset development PC, and are updated regularly.|
|---|

| Warning: Do not confuse this with the [minimum PC hardware compatibility guidelines](https://docs.microsoft.com/en-us/windows/mixed-reality/enthusiast-guide/windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines), which outlines the consumer PC specs to which you should target your immersive (VR) headset app or game.|
|---|

If your immersive headset development PC does not have full-sized HDMI and/or USB 3.0 ports, you'll need [adapters ](https://docs.microsoft.com/en-us/windows/mixed-reality/enthusiast-guide/recommended-adapters-for-windows-mixed-reality-capable-pcs)to connect your headset.

There are currently [known issues](https://docs.microsoft.com/en-us/windows/mixed-reality/enthusiast-guide/troubleshooting-windows-mixed-reality) with some hardware configurations, particularly notebooks that have hybrid graphics.

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

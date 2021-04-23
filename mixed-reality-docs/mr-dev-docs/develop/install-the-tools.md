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

> [!div class="nextstepaction"]
> [Choosing your engine](unity/choosing-an-engine.md) 

## Troubleshooting

### Setting Developer Mode is grayed out

If you're running into issues enabling Developer Mode on your device you might not be the [device owner](/hololens/security-adminless-os). In multi-user mode, the person who uses the device first is the device owner - any subsequent users won't have the required permissions to enable Developer Mode or other configuration changes. However, there is an exception where the first user may not be the device owner in an Autopilot environment, which is detailed in the [HoloLens security documentation](/hololens/security-adminless-os#device-owner).

Possible solutions include:

* Having the device owner turn Developer Mode on before passing the device to other users or developers
* Suggesting that your IT/MDM Admin enables CSP [Policy ApplicationManagement/AllowDeveloperUnlock](/windows/client-management/mdm/policy-csp-applicationmanagement#applicationmanagement-allowdeveloperunlock) for the specific device or a developer device group. 
    * This policy can be set by [Provisioning Packages](/hololens/hololens-provisioning) or via [MDM for HoloLens devices](/hololens/hololens-mdm-configure)
* Using the [Advanced Recovery Companion (ARC)](/hololens/hololens-recovery)

> [!NOTE]
> You can learn more about device management in the **[HoloLens device management](/hololens/hololens-csp-policy-overview)** overview.

#### I can't deploy over USB

If you're not able to deploy an application directly over USB, make sure you've met all the installation requirements listed above and follow our [step-by-step tutorial](unity/tutorials/mr-learning-base-02.md#building-your-application-to-your-hololens-2).

## Next steps

[!INCLUDE[](includes/tools-next-steps.md)]
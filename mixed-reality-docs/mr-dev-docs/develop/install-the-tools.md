---
title: Install the tools
description: Start here with the most current versions of Unity, Visual Studio, and tools recommended for HoloLens and VR development.
author: thetuvix
ms.author: alexturn
ms.date: 8/9/2022
ms.topic: article
ms.localizationpriority: high
keywords: up-to-date, tools, get started, basics, unity, visual studio, toolkit, mixed reality headset, windows mixed reality headset, virtual reality headset, installation, Windows, HoloLens, emulator, unreal, openxr
---

# Install the tools

Get the tools you need to build applications for Microsoft HoloLens and Windows Mixed Reality immersive (VR) headsets. There is no separate SDK for Windows Mixed Reality development; you'll use Visual Studio with the Windows 10 or Windows 11 SDK.

Don't have a mixed reality device? You can install the [HoloLens emulator](advanced-concepts/using-the-hololens-emulator.md) to test some functionality of mixed reality apps without a HoloLens. You can also use the [Windows Mixed Reality simulator](advanced-concepts/using-the-windows-mixed-reality-simulator.md) to test your mixed reality apps for immersive headsets.

We recommend installing either the Unity or Unreal game engine as the easiest way to get started creating mixed reality apps. However, you can also build against DirectX if you'd like to use a custom engine.

If you're using Unity, you can use [Mixed Reality Toolkit for Unity](https://github.com/Microsoft/MixedRealityToolkit-Unity)'s input simulation to test various types of input interactions, such as hand-tracking and eye-tracking input. For Unreal projects, use the [UX Tools plugin](https://github.com/microsoft/MixedReality-UXTools-Unreal) to test common input interactions and user experience features.

>[!TIP]
>Bookmark this page and check it regularly to keep up-to-date on the most recent version of each tool recommended for mixed reality development.

<br>

## Installation checklist

| Tool | Notes |
|---------|---------|
| ![Windows logo](images/Windows10_logo.png)<br><br><a href="https://www.microsoft.com/software-download/windows10" target="_blank">**Windows 10** (Manual install link)</a> or <a href="https://www.microsoft.com/software-download/windows11" target="_blank">**Windows 11** (Manual install link)</a><br><br>Install the most recent version of Windows 10 or 11. | **Installing Windows 10** <br> You can install the most recent versions of Windows 10 or 11 via Windows Update in Settings or by creating installation media using the links in the column to the left. <br><br>See [current release notes](/hololens/hololens-release-notes) for information about the newest mixed reality features available with each release of Windows 10 or 11. **Enable developer mode on your PC** at Settings > Update & Security > For developers. <br><br> **Note for enterprise and corporate-managed PCs**<br>If your PC is managed by an your organization's IT department, you might need to contact them in order to update. <br><br> **'N' versions of Windows**<br> Windows Mixed Reality immersive (VR) headsets are not supported on 'N' versions of Windows. |
| ![Visual Studio logo image](images/visualstudio_logo.png)<br><br><a href="https://visualstudio.microsoft.com/downloads/" target="_blank">**Visual Studio 2022** (Install link)</a> <br><br>Fully-featured integrated development environment (IDE) for Windows and more. You'll use Visual Studio to write code, debug, test, and deploy. | **Installing Visual Studio 2022** <br> Be sure you install the following workloads: <br><br>*● .NET desktop development*<br>*● Desktop development with C++*<br>*● Universal Windows Platform (UWP) development*<br>*● Game development with Unity (**if planning to use Unity**)* <br><br> **Note:** Some of these workloads may be pre-installed if you've installed Unity first. Make sure you have all of these workloads for a successful deployment.  <br><br>Within the UWP workload, **make sure the following components are included for installation**:<br><br>*● Windows 10 SDK version 10.0.19041.0 or 10.0.18362.0, or Windows 11 SDK<br>*● USB Device Connectivity (required to deploy/debug to HoloLens over USB)*<br>*● C++ (v142) Universal Windows Platform tools (required when using Unity)*<br><br>**Note about HoloLens (1st gen) and desktop Windows Mixed Reality headsets**<br>If you are only developing applications for desktop Windows Mixed Reality headsets or HoloLens (1st gen), you can use Visual Studio 2017 and use the Windows SDK installed by it. |
| ![Visual Studio logo](images/HoloLensIcon.jpg)<br><br><a href="https://go.microsoft.com/fwlink/?linkid=2248589" target="_blank">**HoloLens 2 Emulator (Windows Holographic, version 23H2 October 2023 Update)** (Install link: 10.0.22621.1244)</a><br> <br><a href="https://go.microsoft.com/fwlink/?linkid=2065980" target="_blank">**HoloLens (1st gen) Emulator** (Install link: 10.0.17763.134)</a> <br><br>The optional emulator lets you run applications on a HoloLens virtual machine image without a physical HoloLens.<br> <br> | See [Using the HoloLens emulator](../develop/advanced-concepts/using-the-hololens-emulator.md) for more information on getting started with the optional emulator.<br> <br> **Your system must support Hyper-V** for the emulator installation to succeed. Reference the System Requirements section below for details. <br> <br> **Note on HoloLens (1st gen) Emulator** <br>  Visual Studio 2017 is required to successfully complete the installation. If you're installing the HoloLens (1st gen) emulator with Visual Studio 2022 you need to deselect the VS templates and [install them from the Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=WindowsMixedRealityteam.WindowsMixedRealityAppTemplatesVSIX). |

## Install your engine of choice

Now that you have your Windows 10 or 11, Visual Studio, and Windows 10 or 11 SDK ready to go, let's install and set up the engine of your choice.

> [!div class="nextstepaction"]
> [Choosing your engine](choosing-an-engine.md)

## Troubleshooting

### Setting Developer Mode is grayed out

If you're running into issues enabling Developer Mode on your device you might not be the [device owner](/hololens/security-adminless-os). In multi-user mode, the person who uses the device first is the device owner--any subsequent users won't have the required permissions to enable Developer Mode or other configuration changes. However, there is an exception where the first user may not be the device owner in an Autopilot environment, which is detailed in the [HoloLens security documentation](/hololens/security-adminless-os#device-owner).

Possible solutions include:

* Having the device owner turn Developer Mode on before passing the device to other users or developers
* Suggesting that your IT/MDM Admin enables CSP [Policy ApplicationManagement/AllowDeveloperUnlock](/windows/client-management/mdm/policy-csp-applicationmanagement#applicationmanagement-allowdeveloperunlock) for the specific device or a developer device group.
    * This policy can be set by [Provisioning Packages](/hololens/hololens-provisioning) or via [MDM for HoloLens devices](/hololens/hololens-mdm-configure)
* Using the [Advanced Recovery Companion (ARC)](/hololens/hololens-recovery)

> [!NOTE]
> You can learn more about device management in the **[HoloLens device management](/hololens/hololens-csp-policy-overview)** overview.

#### I can't deploy over USB

If you're not able to deploy an application directly over USB, make sure you've met all the installation requirements listed above and follow our [step-by-step tutorial](/training/paths/beginner-hololens-2-tutorials/#building-your-application-to-your-hololens-2).

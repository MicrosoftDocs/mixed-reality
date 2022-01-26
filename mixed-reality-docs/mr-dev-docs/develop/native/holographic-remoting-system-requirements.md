---
title: Holographic Remoting System Requirements
description: Learn about the Holographic Remoting system requirements.
author: vimusc
ms.author: vimusch
ms.date: 01/20/2022
ms.topic: article
keywords: openxr, unity, hololens 2, mixed reality, MRTK, Mixed Reality Toolkit, augmented reality, virtual reality, mixed reality headsets, learn, tutorial, getting started, holographic remoting, desktop, requirements, streaming
---

# Holographic Remoting System Requirements

This chapter lists the minimum system requirements to work with Holographic Remoting.

## Remote PC

- Windows 10 version 1903 or higher or Windows 11.
- Up-to-date graphics drivers.
- GPU with H264 video **encode** support.
- Optional: GPU with H265 video **encode** support.

## Player PC

- Windows 10 version 1903 or higher or Windows 11.
- Up-to-date graphics drivers.
- GPU with H264 video **decode** support.
- Optional: GPU with H265 video **decode** support.

> [!NOTE]
> The player PC requirements are only relevant if your player application runs on a Windows PC with Windows Mixed Reality instead of the HoloLens 2.

The table below helps to find which GPUs support hardware video encoding and decoding:

|GPU manufacturer|Supported models|
|----------------|----------------|
|NVIDIA|Check the support matrix [at the bottom of this page](https://developer.nvidia.com/video-encode-decode-gpu-support-matrix)|
|AMD|Check the support matrix [on this page](https://en.wikipedia.org/wiki/Unified_Video_Decoder#UVD_6)|
|Intel|Skylake and newer CPUs|

Even though the correct H265 codec might be installed, security properties on the codec DLLs may cause codec initialization failures. The [troubleshooting](holographic-remoting-troubleshooting.md) section describes steps on how to solve this problem.

> [!Important]
> Windows update doesn't always deliver the very latest GPU drivers. Check your GPU manufacturer's website for latest drivers:
> - [**AMD drivers**](https://www.amd.com/en/support)
> - [**Intel drivers**](https://www.intel.com/content/www/us/en/support/detect.html)
> - [**NVIDIA drivers**](https://www.nvidia.com/Download/index.aspx)

## Network

A stable, low-latency network connection between the player and remote is critical for a good user experience.

## Software

The following software must be installed on a developer PC:

- The latest version of Visual Studio 2019 [download](https://visualstudio.microsoft.com/vs/older-downloads/)
  - Workloads:
    - Desktop development with C++
    - Universal Windows Platform development
  - Individual components:
    - Windows 10 SDK (10.0.19041.0)
    - MSVC v142 - VS 2019 C++ (x64/x86|ARM|ARM64) build tools (newest)
    - MSVC v142 - VS 2019 C++ (x64/x86|ARM|ARM64) Spectre-mitigated libs (newest)
    - Net Native
    - .Net Framework 4.5 targeting pack
    - Nuget Package manager
    - C++ 2019 Redistributable Update
    - C++ Universal Windows Platform support for v142 build tools (ARM64)
    - C++/WinRT
    - Windows Universal C Runtime

## See Also

* [Holographic Remoting Overview](holographic-remoting-overview.md)
* [Holographic Remoting Terminology](holographic-remoting-terminology.md)

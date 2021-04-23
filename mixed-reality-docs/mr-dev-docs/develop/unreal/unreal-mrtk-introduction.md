---
title: Introducing MRTK for Unreal
description: Get started with everything the Mixed Reality Toolkit for Unreal has to offer new mixed reality developers.
author: hferrone
ms.author: v-hferrone
ms.date: 01/08/2021
ms.topic: article
ms.localizationpriority: high
keywords: Windows Mixed Reality, test, Mixed Reality Toolkit, MRTK version 2, MRTK, tools, SDK, HoloLens, HoloLens 2, mixed reality headset, windows mixed reality headset, virtual reality headset, cross-platform
---

# Introducing MRTK for Unreal

![MRTK](../../design/images/MRTK_UX_Hero.png)

## What is Mixed Reality Toolkit (MRTK)?

MRTK is an amazing open-source toolkit that has been around since the HoloLens was first released. The toolkit wouldn't be where it is today without the hard work of our contributing developer community. 

The Mixed Reality Toolkit for Unreal (MRTK-Unreal) is a set of components, in the form of plugins, samples and documentation, designed to help development of Mixed Reality applications using the Unreal Engine. Currently, the toolkit consists of:
* [UX Tools for Unreal](https://github.com/microsoft/MixedReality-UXTools-Unreal), which provides code, blueprints, and examples to implement UX features for Hololens 2 applications.
* [Graphics Tools for Unreal](https://github.com/microsoft/MixedReality-GraphicsTools-Unreal), which helps improve the visual fidelity of Mixed Reality applications while staying within performance budgets.

<br>

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4IkCG]

Take a look at [MRTK's documentation on GitHub](https://microsoft.github.io/MixedReality-UXTools-Unreal/README.html) and get started with [UX Tools](https://microsoft.github.io/MixedReality-UXTools-Unreal/Docs/Installation.html) or [Graphics Tools](https://github.com/microsoft/MixedReality-GraphicsTools-Unreal/blob/main/Docs/Installation.md) installation guides.

### Modular

We've built MRTK Unreal in a modular way, so you don't need to take every bit of the toolkit into your project. You can pick and choose the plugins you need, and add or remove them whenever you see fit. This approach keeps your project size smaller and makes it easier to manage.  

### Performant

Working with mobile platforms, we constructed MRTK Unreal with performance in mind. This is super important and we wanted to ensure that the tools aren't going to work against you.

## Download the latest version

We recommend installing [Unreal Engine version 4.25](https://docs.unrealengine.com//GettingStarted/Installation/index.html) or later to take full advantage of built-in HoloLens support.

Go to the **Library** tab in the Epic Games Launcher, select the dropdown arrow next to **Launch** and click **Options**. Under **Target Platforms**, select **HoloLens 2** and click **Apply**.
![Unreal Install Option HoloLens 2](../../../develop/images/Unreal_Install_Option_HoloLens2.png)

## Import Mixed Reality Toolkit for Unreal

![MRTK](../../../design/images/MRTK_UX_Hero.png)

Mixed Reality Toolkit (MRTK) is an open-source, cross-platform development kit for mixed reality applications. MRTK provides a cross-platform input system, foundational components, and common building blocks for spatial interactions. The toolkit is intended to accelerate the development of applications targeting Microsoft HoloLens, Windows Mixed Reality immersive (VR) headsets, and the OpenVR platform.

For installation, we recommend completing the [Getting Started section](../../unreal/unreal-development-overview.md#1-getting-started) of our curated [Unreal development journey](../../unreal/unreal-development-overview.md). If you're already following the Unreal development journey, finish up the rest of the setup steps listed below and continue on to the [HoloLens 2 Getting Started tutorials](../../unreal/tutorials/unreal-uxt-ch1.md).

:::row:::
    :::column:::
        <a href="https://github.com/Microsoft/MixedRealityToolkit-Unreal" target="_blank">![Unity logo image](../../images/MRTK-Unreal-Banner.png)<br>**Mixed Reality Toolkit-Unreal (GitHub)**</a><br>
    :::column-end:::
:::row-end:::

> [!NOTE]
> If you don't want to use MRTK for Unreal, you'll need to script all interactions and behaviors yourself.

## See also

* [Install the tools](../install-the-tools.md)
* [Developing with MRTK for Unreal](unreal-development-overview.md)
* [UX Tools - Installation guide (GitHub)](https://microsoft.github.io/MixedReality-UXTools-Unreal/Docs/Installation.html)
* [UX Tools- Documentation home (GitHub)](https://microsoft.github.io/MixedReality-UXTools-Unreal/README.html)
* [Graphics Tools - Installation guide (GitHub)](https://github.com/microsoft/MixedReality-GraphicsTools-Unreal/blob/main/Docs/Installation.md)
* [Graphics Tools - Documentation home (GitHub)](https://github.com/microsoft/MixedReality-GraphicsTools-Unreal/)
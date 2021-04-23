---
title: Choosing your developer pipeline
description: Stay up to date on the latest Unity development pipeline recommendations for HoloLens application development.
author: hferrone
ms.author: v-hferrone
ms.date: 04/22/2021
ms.topic: article
keywords: mixedrealitytoolkit, mixedrealitytoolkit-unity, mixed reality headset, windows mixed reality headset, virtual reality headset, unity
---

# Choosing your developer pipeline

![Unity logo banner](../../images/unity_logo_banner.png)<br>

While we currently **recommend installing Unity 2019.4 LTS and using Legacy Built-in XR** for Mixed Reality development, you can build apps with other Unity configurations as well.

## Mixed Reality Toolkit (Recommended)

Microsoft’s current recommended Unity configuration for HoloLens 2 is the Mixed Reality Toolkit...

### Install the Mixed Reality Feature Tool

The [Mixed Reality Feature Tool](../../unity/welcome-to-mr-feature-tool.md) is a new way for developers to discover and add Mixed Reality feature packages into Unity projects. 

You can search packages by name or category, see their dependencies, and even view proposed changes to your projects manifest file before importing. Once you've validated the packages you want, the Mixed Reality Feature tool will download them into the project of your choice.

### Importing the Mixed Reality Toolkit for Unity

![MRTK](../../../design/images/MRTK_UX_Hero.png)

[Mixed Reality Toolkit](../../unity/mrtk-getting-started.md) (MRTK) is an open-source, cross-platform development kit for mixed reality applications. 

* Install the Mixed Reality Toolkit package by following the [installation and usage instructions](../../unity/welcome-to-mr-feature-tool.md#system-requirements) and selecting the **Mixed Reality Toolkit Foundation** package.

We recommend completing the getting started section in our curated [HoloLens](../../unity/unity-development-overview.md#1-getting-started) or [VR](../../unity/unity-development-wmr-overview.md#1-getting-started) development journeys. If you're already following the Unity development for HoloLens journey, finish up the rest of the setup steps listed below and continue on to the [HoloLens 2 Getting Started tutorials](../../unity/tutorials/mr-learning-base-01.md).

> [!IMPORTANT]
> Note that installation instructions are targeted for the latest stable combination of MRTK and Unity releases, which are **MRTK 2.6.1** and **Unity 2019.4 LTS**.

> [!NOTE]
> If you don't want to use MRTK for Unity, you'll need to [script all interactions and behaviors yourself](../../unity/configure-unity-project.md).

:::row:::
    :::column:::
        <a href="https://github.com/Microsoft/MixedRealityToolkit-Unity" target="_blank">![Unity banner](../../images/MRTK-Unity-Banner.png)<br>**Mixed Reality Toolkit-Unity (GitHub)**</a><br>
    :::column-end:::
:::row-end:::

## Manual 

TBD...
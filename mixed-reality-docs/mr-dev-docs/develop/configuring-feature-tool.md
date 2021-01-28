---
title: Configuring the Mixed Reality Feature Tool
description: Learn how to download and install Mixed Reality Unity packages from the MR Feature Tool for HoloLens and VR development.
author: davidkline-ms
ms.author: v-hferrone
ms.date: 01/27/2021
ms.topic: article
ms.localizationpriority: high
keywords: up-to-date, tools, get started, basics, unity, visual studio, toolkit, mixed reality headset, windows mixed reality headset, virtual reality headset, installation, Windows, HoloLens, emulator, unreal, openxr
---

# Configuring the Mixed Reality Feature Tool

When using the Mixed Reality Feature Tool, you have access to three different settings categories that you can customize at will:

* [Download settings](#download-settings)
* [Feature settings](#feature-settings)
* [Import settings](#import-settings)

![Settings](images/FeatureToolSettings.png)

## Download settings

### Overwrite existing package files

Enabling this setting causes package files to be downloaded every time they're acquired. 
* **We recommend leaving this option disabled to reduce network bandwidth usage**
* By default, previously acquired package files aren't re-downloaded

### Package cache

Change this setting to update the location where feature packages are downloaded.

> [!NOTE]
> This setting is **read-only** in this release. Future releases may make this setting configurable.

## Feature settings

### Include preview releases

Enable this setting to acquire preview releases.
* By default, preview releases aren't shown in the Mixed Reality Feature Tool 

> [!NOTE]
> A preview release is defined as containing the **"-preview"** designation in the package version.

## Import settings

### Replace existing package files

By default, the Mixed Reality Feature Tool removes previous copies of the packages being imported to reduce the file size and unnecessary computations. 
* Uncheck this setting to keep all versions

### Project relative import path

Change this setting to update project folder path where feature packages are copied on import. 
* For example, if the project folder is **C:\GalaxyExplorer**, the fully qualified import path will be **C:\GalaxyExplorer\Packages\MixedReality**.

> [!NOTE]
> This setting is **read-only** in this release. Future releases may make this setting configurable.

## See also

- [Welcome to the Mixed Reality Feature Tool](welcome-to-mr-feature-tool.md)
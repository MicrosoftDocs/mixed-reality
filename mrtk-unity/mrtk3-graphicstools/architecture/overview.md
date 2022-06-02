---
title: Graphics Tools Overview
description: High level architecture overview of Graphics Tools
author: Cameron-Micka
ms.author: thmicka
ms.date: 05/31/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Graphics Tools, MRGT, MR Graphics Tools
---

# Architecture overview

Graphics Tools is a [Unity package](https://docs.unity3d.com/Manual/PackagesList.html) that is designed for independent use or with other packages inside the Mixed Reality Toolkit (MRTK). Many developers use Graphics Tools on its own, but also inadvertently when pulled in as a dependency to another MRTK package.

The package contains functionality that fall into three categories: editor, runtime, and samples. The following sections explain each category.

## Editor

Everything within the editor directory contains functionality that helps developers at edit time. Examples are custom inspectors, shader GUIs, property drawers, or even shaders that only render in the Unity Editor.

## Runtime

The runtime directory contains most of the package's functionality and included all code and content that can be compiled into a player build. This directory is broken into coarse feature areas and asset folders for commonly used shaders, textures, and models.  

> [!TIP]
> The editor and runtime directory's contain their own [assembly definitions](https://docs.unity3d.com/Manual/ScriptCompilationAssemblyDefinitionFiles.html). The editor assembly definition references the runtime assembly definition but not vice versa.

## Samples

Samples exist under the `Samples~` directory as outlined by Unity's [sample recommendations](https://docs.unity3d.com/Manual/cus-samples.html). The '~' character prevents the `Samples~` folder for being imported by Unity. This is ideal when including the package via the package manager.

Samples should be used to gleam example usage and not used directly in production. Sample code and content do **not** follow [semantic versioning](https://semver.org/) and is subject to breaking changes.

> [!NOTE]
> Each sample is independent and doesn't share content with other samples. The means content duplication between samples may exist.

## See also

* [Connection between Mixed Reality Toolkit to Mixed Reality Graphics Tools](mrgt-mrtk.md)

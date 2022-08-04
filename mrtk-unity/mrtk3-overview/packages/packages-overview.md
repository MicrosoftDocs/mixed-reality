---
title: Package overview
description: Mixed Reality Toolkit 3 for developers - Package overview.
author: MaxWang-MS
ms.author: wangmax
ms.date: 6/3/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, packages
---

# Using MRTK3 packages

Microsoft MRTK3 is distributed as a set of packages that are imported into Unity using the Mixed Reality Feature Tool for Unity and the Unity Package Manager (UPM). These packages enable developers to customize the MRTK within their projects.

## Dependencies

Some MRTK3 packages require additional packages, provided by Microsoft and/or Unity, in order to correctly function. Some of these packages are optional and will enable additional functionality.

The following diagram illustrates the relationship between MRTK packages and some of the Unity dependencies.

![MRTK3 Package Graph](../images/MRTK3_Packages.png)

> [!Note]
> When importing packages using the Mixed Reality Feature Tool, dependency management is automatically performed.

The following table describes the Mixed Reality Toolkit package dependencies.

| Display name | Package name | Description | Required  | Optional  |
| ----------- | ----------- | --------- | -------- | ---------- |
| MRTK Core Definitions |  com.microsoft.mrtk.core | Shared definitions, utilities and components. | <ul> <li> com.unity.xr.interaction.toolkit </li> <li> com.unity.xr.management </li> </ul> | |
| MRTK Accessibility | com.microsoft.mrtk.accessibility | Definitions, features and subsystem for building accessible mixed reality experiences. | <ul> <li> com.microsoft.mrtk.core </li> <li> com.microsoft.mrtk.graphicstools.unity </li> <li> com.unity.textmeshpro </li> </ul> | |
| MRTK Audio Effects | com.microsoft.mrtk.audio | Effects and features that enhance the audio in mixed reality experiences. | <ul> <li> com.microsoft.mrtk.core </li> </ul> | |
| MRTK Data Binding and Theming | com.microsoft.mrtk.data | Support for data binding and UI element theming. | <ul> <li> com.microsoft.mrtk.core </li> <li> com.unity.nuget.newtonsoft-json </li> <li> com.unity.textmeshpro </li> </ul> |  |
| MRTK Diagnostics | com.microsoft.mrtk.diagnostics | Diagnostics and performance monitoring subsystems and tools. | <ul> <li> com.microsoft.mrtk.core </li> <li> com.unity.xr.management </li> </ul> | |
| MRTK Environment | com.microsoft.mrtk.environment | Environmental features and subsystems, such as Spatial Awareness and boundaries. | <ul> <li> com.microsoft.mrtk.core </li> <li> com.unity.xr.management </li> </ul> |  |
| MRTK Extended Assets | com.microsoft.mrtk.extendedassets | Additional audio, font, texture and other assets for use in applications. | <ul> <li> com.microsoft.mrtk.standardassets </li> <li> com.microsoft.mrtk.graphicstools.unity </li> </ul> | |
| MRTK Graphics Tools | com.microsoft.mrtk.graphicstools.unity | Shaders, textures, materials and models. | | <ul> <li> com.unity.render-pipelines.universal </li> </ul> |
| MRTK Input | com.microsoft.mrtk.input | Input components including support for articulated hands, offline speech recognition and in-editor input simulation. | <ul> <li> com.microsoft.mrtk.core </li> <li> com.microsoft.mrtk.graphicstools.unity </li> <li> com.unity.xr.interaction.toolkit </li> <li> com.unity.inputsystem </li> <li> com.unity.xr.management </li> <li> com.unity.xr.openxr </li> <li> com.unity.xr.arfoundation </li> </ul> | |
| MRTK Spatial Manipulation | com.microsoft.mrtk.spatialmanipulation | Spatial positioning and manipulation components and utilities, including solvers. | <ul> <li> com.microsoft.mrtk.core </li> <li> com.microsoft.mrtk.uxcore </li> <li> com.unity.inputsystem </li> <li> com.unity.xr.interaction.toolkit </li> </ul> | <ul> <li> com.microsoft.mrtk.input </li> </ul> |
| MRTK Standard Assets | com.microsoft.mrtk.standardassets | Standard assets, including materials and textures, for use by applications. | <ul> <li> com.microsoft.mrtk.graphicstools.unity </li> </ul> | |
| MRTK UX Components | com.microsoft.mrtk.uxcomponents | MRTK UX component library, containing prefabs, visuals, pre-made controls, and everything to get started building 3D user interfaces for mixed reality. | <ul> <li> com.microsoft.mrtk.uxcore </li> <li> com.microsoft.mrtk.spatialmanipulation </li> <li> com.microsoft.standardassets </li> </ul> | <ul> <li> com.microsoft.mrtk.data </li> </ul> |
| MRTK UX Core | com.microsoft.mrtk.uxcore | Core interaction and visualization scripts for building MR user interface components.\n\nNote: this is intended to be consumed in order to build UX libraries. To build MR interfaces with a pre-existing library of components, see com.microsoft.mrtk.uxcomponents. | <ul> <li> com.microsoft.mrtk.core </li> <li> com.microsoft.mrtk.graphicstools.unity </li> <li> com.unity.inputsystem </li> <li> com.unity.textmeshpro </li> <li> com.unity.xr.interaction.toolkit </li> </ul> | <ul> <li> com.microsoft.mrtk.data </li> </ul> |
| MRTK Windows Speech | com.microsoft.mrtk.windowsspeech | Speech subsystem implementation for native Windows speech APIs. Allows for the use of native Windows speech recognition to fire events and drive XRI interactions. | <ul> <li> com.microsoft.mrtk.core </li> </ul> | |

## Running package tests

Some MRTK packages contain tests used to validate the included components. In some cases, these tests require additional MRTK packages not asserted as dependencies.

> [!NOTE]
> When importing packages into Unity, test assemblies aren't compiled by default. To enable compilation of tests, please use the `testables` element of the project's `manifest.json` file.

In order to place minimal overhead on applications importing the Mixed Reality Toolkit, dependencies are asserted only for runtime requirements. The following table describes the additional packages required to enable compiling and running the included test assemblies.

| Display name | Package name | Test requirements |
| ------------ | ------------ | ----------------- |
| MRTK Core Definitions | com.microsoft.mrtk.core  | |
| MRTK Accessibility | com.microsoft.mrtk.accessibility | |
| MRTK Data Binding and Theming | com.microsoft.mrtk.data | |
| MRTK Diagnostics | com.microsoft.mrtk.diagnostics | |
| MRTK Environment | com.microsoft.mrtk.environment | |
| MRTK Extended Assets | com.microsoft.mrtk.extendedassets | |
| MRTK Input | com.microsoft.mrtk.input |  |
| MRTK Spatial Manipulation | com.microsoft.mrtk.spatialmanipulation | <ul> <li> com.microsoft.mrtk.input </li> </ul> |
| MRTK Standard Assets | com.microsoft.mrtk.standardassets | |
| MRTK UX Components | com.microsoft.mrtk.uxcomponents | <ul> <li> com.microsoft.mrtk.input </li> </ul> |
| MRTK UX Core | com.microsoft.mrtk.uxcore | <ul> <li> com.microsoft.mrtk.input </li> </ul> |
| MRTK Windows Speech | com.microsoft.mrtk.windowsspeech | |

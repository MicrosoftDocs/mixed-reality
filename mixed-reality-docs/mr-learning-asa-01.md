---
title: Azure Spatial Anchors tutorials - 1. Introduction
description: Complete this course to learn how to implement Azure Spatial Anchors within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
ms.localizationpriority: high
---

<!-- TODO: Sync entire Introduction page with Base and Sharing -->
# 1. Introduction

<!-- TODO: Most likely remove this section, design seems outdated and not seeing it being used in new tutorials. Waiting confirmation from MS
## Device support
-->

## Overview

<!-- TODO: Consider change "Welcome to the second..." something like "This tutorial builds on the Getting started tutorial series and uses the RoverWhateverName prefab you created during those tutorials. You can continue building on the Unity project or etc..." -->
Welcome to the second of three series of HoloLens 2 tutorials. Through this tutorial series, you will learn the fundamentals of Azure Spatial Anchors and leverage the power it holds, to anchor the RoverModule_Complete prefab you built in the previous series [Getting started tutorials](mr-learning-base-01.md), to the real world.

In the next series [Multi-user capabilities tutorials](mr-learning-sharing-01.md), you will learn how to leverage the power of Photon and ASA to make a shared experience that updates in real time.

Tutorials in this series:

1. [Introduction](mr-learning-asa-01.md)
2. [Getting started with Azure Spatial Anchors](mr-learning-asa-02.md)
3. [Saving, retrieving, and sharing Azure Spatial Anchors](mr-learning-asa-03.md)
4. [Displaying Azure Spatial Anchor feedback](mr-learning-asa-04.md)
5. [Azure Spatial Anchors for Android and iOS](mr-learning-asa-05.md)

## Objectives

<!-- TODO: Update to exact wording used in the following tutorials' Objectives section -->
* Learn the fundamentals of developing with Azure Spatial Anchors for HoloLens 2
* Learn how to create spatial anchors and fetch them from Azure
* Learn how to achieve spatial alignment across multiple app sessions
* Learn how to achieve spatial alignment between multiple devices
* Learn how to set up a UI panel that displays important information about the current ASA session
* Learn about and explore feedback elements that the ASA SDK makes available to users
* Learn how to build your project to Android device using Unity's AR Foundation and ARCore XR Plugin.
* Learn how to build your project to iOS device using Unity's AR Foundation and ARKit XR Plugin.

## Prerequisites

* A Windows 10 computer configured with the correct [tools installed](install-the-tools.md)
* Windows 10 SDK 10.0.18362.0 or later
* A HoloLens 2 device [configured for development](using-visual-studio.md#enabling-developer-mode)
* <a href="https://docs.unity3d.com/Manual/GettingStartedInstallingHub.html" target="_blank">Unity Hub</a> with Unity 2019.3.15 installed and the Universal Windows Platform Build Support module added
* Complete the [Create a Spatial Anchors resource](https://docs.microsoft.com/azure/spatial-anchors/quickstarts/get-started-unity-hololens#create-a-spatial-anchors-resource) section of the [Quickstart: Create a Unity HoloLens app that uses Azure Spatial Anchors](https://docs.microsoft.com/azure/spatial-anchors/quickstarts/get-started-unity-hololens) tutorial
* Completed the [Getting started tutorials](mr-learning-base-01.md) series or some basic prior experience with Unity and MRTK
* If you intend to deploy to Android as well as HoloLens
  * A <a href="https://developer.android.com/studio/debug/dev-options" target="_blank">developer enabled</a> and <a href="https://developers.google.com/ar/discover/supported-devices" target="_blank">ARCore capable</a>
 Android device with USB connection to your Windows or macOS computer
  * <a href="https://docs.unity3d.com/Manual/GettingStartedInstallingHub.html" target="_blank">Unity Hub</a> with Unity 2019.3.10 installed and the Android Build Support module added
* If you intend to deploy to iOS as well as HoloLens
  * A macOS computer with the the latest version of <a href="https://geo.itunes.apple.com/us/app/xcode/id497799835?mt=12" target="_blank">Xcode</a> and <a href="https://cocoapods.org" target="_blank">CocoaPods</a> installed
  * An <a href="https://developer.apple.com/documentation/arkit/verifying_device_support_and_user_permission" target="_blank">ARKit compatible</a> iOS device with USB connection to your macOS computer
  * <a href="https://docs.unity3d.com/Manual/GettingStartedInstallingHub.html" target="_blank">Unity Hub</a> with Unity 2019.3.X installed and the iOS Build Support module added

> [!IMPORTANT]
> The recommended Unity version for this tutorial series is Unity 2019.3.X. This supersedes any Unity version requirements or recommendations stated in the prerequisites linked above.

[Next Tutorial: 2. Getting started with Azure Spatial Anchors](mr-learning-asa-02.md)

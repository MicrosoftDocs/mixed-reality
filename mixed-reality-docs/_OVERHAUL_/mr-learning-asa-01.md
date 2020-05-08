---
title: Azure Spatial Anchors tutorials - 1. Getting started with Azure Spatial Anchors
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
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
Welcome to the second series of the HoloLens 2 tutorials. In this four-part tutorial series, you will learn the fundamentals of Azure Spatial Anchors.

<!-- TODO: For the following four paragraphs, consider changing to list so it's more like a table of content and easier to read -->
<!-- TODO: For the following four paragraphs, consider removing reference to first, second, etc. since values won't match tutorial number -->
In this first tutorial, [Getting started with Azure Spatial Anchors](mr-learning-asa-02.md), you will explore the various steps required to start and stop an Azure session and create, upload, and download Azure anchors on a single device.

In the second tutorial, [Saving, retrieving, and sharing Azure Spatial Anchors](mr-learning-asa-03.md), you will learn how to save Azure Spatial Anchors across multiple app sessions by saving anchor information to the HoloLens 2's storage and how to share this anchor information to other devices for a multi-device anchor alignment.

In the third tutorial, [Displaying Azure Spatial Anchor feedback](mr-learning-asa-04.md), you will learn how to provide users with feedback about anchor events and statuses when using Azure Spatial Anchors.

In the fourth tutorial, [Azure Spatial Anchors for Android and iOS](mr-learning-asa-05.md), you will learn how to build and deploy your project to Android and iOS devices.

## Objectives

<!-- TODO: Update to exact wording used in the following tutorials' Objectives section -->
* Learn how to create spatial anchors and fetch them from Azure
* Learn how to achieve spatial alignment across multiple app sessions
* Learn how to achieve spatial alignment between multiple devices
* Learn how to configure, build, and deploy the MRTK and ASA based project to Android and iOS

## Prerequisites

* A Windows 10 computer configured with the correct [tools installed](install-the-tools.md)
* Windows 10 SDK 10.0.18362.0 or later
* A HoloLens 2 device [configured for development](using-visual-studio.md#enabling-developer-mode)
* <a href="https://docs.unity3d.com/Manual/GettingStartedInstallingHub.html" target="_blank">Unity Hub</a> with Unity 2019.3.10 installed and the Universal Windows Platform Build Support module added
* Complete the [Create a Spatial Anchors resource](https://docs.microsoft.com/azure/spatial-anchors/quickstarts/get-started-unity-hololens#create-a-spatial-anchors-resource) section of the [Quickstart: Create a Unity HoloLens app that uses Azure Spatial Anchors](https://docs.microsoft.com/azure/spatial-anchors/quickstarts/get-started-unity-hololens) tutorial
* Completed the [Getting started tutorials](mrlearning-base.md) series or some basic prior experience with Unity and MRTK
* If you intend to deploy to Android as well as HoloLens
  * A <a href="https://developer.android.com/studio/debug/dev-options" target="_blank">developer enabled</a> and <a href="https://developers.google.com/ar/discover/supported-devices" target="_blank">ARCore capable</a>
 Android device with USB connection to your Windows or macOS computer
  * <a href="https://docs.unity3d.com/Manual/GettingStartedInstallingHub.html" target="_blank">Unity Hub</a> with Unity 2019.3.10 installed and the Android Build Support module added
* If you intend to deploy to iOS as well as HoloLens
  * A macOS computer with the the latest version of <a href="https://geo.itunes.apple.com/us/app/xcode/id497799835?mt=12" target="_blank">Xcode</a> and <a href="https://cocoapods.org" target="_blank">CocoaPods</a> installed
  * An <a href="https://developer.apple.com/documentation/arkit/verifying_device_support_and_user_permission" target="_blank">ARKit compatible</a> iOS device with USB connection to your macOS computer
  * <a href="https://docs.unity3d.com/Manual/GettingStartedInstallingHub.html" target="_blank">Unity Hub</a> with Unity 2019.3.10 installed and the iOS Build Support module added

> [!IMPORTANT]
> The recommended Unity version for this tutorial series is Unity 2019.3.10. This supersedes any Unity version requirements or recommendations stated in the prerequisites linked above.

<!-- TODO: Consider adding a 'What you will create' section with animations/images -->
## What you will create

[Next tutorial: 2. Getting started with Azure Spatial Anchors](mr-learning-asa-02.md)

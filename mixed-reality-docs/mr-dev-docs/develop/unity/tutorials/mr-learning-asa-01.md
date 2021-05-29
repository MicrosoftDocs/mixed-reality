---
title: Introduction to the Azure Spatial Anchors tutorials
description: Complete this course to learn how to implement Azure Spatial Anchors in a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/05/2021
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens, MRTK, mixed reality toolkit, UWP, Azure spatial anchors, ios, android, Windows 10, ARCore, macOS, Android Build Support, ARKit
ms.localizationpriority: high
---

# 1. Introduction to the Azure Spatial Anchors tutorials

Welcome to the Azure Spatial Anchors tutorials! Through this tutorial series, you will learn the fundamentals of <a href="https://azure.microsoft.com/services/spatial-anchors" target="_blank">Azure Spatial Anchors</a> (ASA) and how to anchor a complete mixed reality experience in the real world. You will also learn how to deploy your project to Android and iOS.

Tutorials in this series:

1. [Introduction](mr-learning-asa-01.md) (You're already here)
2. [Getting started with Azure Spatial Anchors](mr-learning-asa-02.md)
3. [Saving, retrieving, and sharing Azure Spatial Anchors](mr-learning-asa-03.md)
4. [Displaying Azure Spatial Anchor feedback](mr-learning-asa-04.md)
5. [Azure Spatial Anchors for Android and iOS](mr-learning-asa-05.md)

## Objectives

* Learn how to create spatial anchors and fetch them from Azure
* Learn how to achieve spatial alignment across app sessions
* Learn how to achieve spatial alignment between multiple devices
* Learn how to prepare, build, and deploy your project to Android and iOS

## Prerequisites

* A Windows 10 computer configured with the correct [tools installed](../../install-the-tools.md)
* Windows 10 SDK 10.0.18362.0 or later version
* A HoloLens 2 device [configured for development](../../platform-capabilities-and-apis/using-visual-studio.md#enabling-developer-mode)
* <a href="https://docs.unity3d.com/Manual/GettingStartedInstallingHub.html" target="_blank">Unity Hub</a> with Unity 2020 / 2019 LTS installed and the Universal Windows Platform Build Support module added
* Completed the [Create a Spatial Anchors resource](/azure/spatial-anchors/quickstarts/get-started-unity-hololens#create-a-spatial-anchors-resource) section of the [Quickstart: Create a Unity HoloLens app that uses Azure Spatial Anchors](/azure/spatial-anchors/quickstarts/get-started-unity-hololens) tutorial
* Finished the [Getting started tutorials](mr-learning-base-01.md) series or some basic prior experience with Unity and MRTK
* If you intend to deploy to Android as well as HoloLens
  * A <a href="https://developer.android.com/studio/debug/dev-options" target="_blank">developer enabled</a> and <a href="https://developers.google.com/ar/discover/supported-devices" target="_blank">ARCore capable</a>
     Android device with USB connection to your Windows or macOS computer
  * <a href="https://docs.unity3d.com/Manual/GettingStartedInstallingHub.html" target="_blank">Unity Hub</a> with Unity 2020 / 2019 LTS installed and the Android Build Support module added
* If you intend to deploy to iOS as well as HoloLens
  * A macOS computer with the latest version of <a href="https://geo.itunes.apple.com/us/app/xcode/id497799835?mt=12" target="_blank">Xcode</a> and <a href="https://cocoapods.org" target="_blank">CocoaPods</a> installed
  * An <a href="https://developer.apple.com/documentation/arkit/verifying_device_support_and_user_permission" target="_blank">ARKit compatible</a> iOS device with USB connection to your macOS computer
  * <a href="https://docs.unity3d.com/Manual/GettingStartedInstallingHub.html" target="_blank">Unity Hub</a> with Unity 2020 / 2019 LTS installed and the iOS Build Support module added

> [!Important]
> This tutorial series supports Unity 2020 LTS(currently 2020.3.x) if you are using Open XR or Windows XR Plugin and also Unity 2019 LTS (currently 2019.4.x) if you are using Legacy WSA or Windows XR Plugin. This supersedes any Unity version requirements stated in the prerequisites linked above.

> [!div class="nextstepaction"]
> [Next Tutorial: 2. Getting started with Azure Spatial Anchors](mr-learning-asa-02.md)

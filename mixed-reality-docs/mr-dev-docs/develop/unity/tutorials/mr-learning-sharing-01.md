---
title: Introduction to the Multi-user capabilities tutorials 
description: Complete this course to learn how to implement shared multi-user experiences in a HoloLens 2 application.
author: jessemcculloch
ms.author: vinnietieto
ms.date: 03/22/2022
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens, multi-user capabilities, Photon, MRTK, mixed reality toolkit, UWP
ms.localizationpriority: high
---

# 1. Introduction to the Multi-user capabilities tutorials

Welcome to the Multi-User Capabilities tutorials! Through this tutorial series, you will learn the fundamentals of building a multi-user experience using <a href="https://www.photonengine.com/PUN" target="_blank">Photon Unity Networking</a> (PUN). PUN is one of several networking options available to mixed reality developers to create shared experiences.

Tutorials in this series:

* [Setting up Photon Unity Networking](mr-learning-sharing-02.md)
* [Connecting multiple users](mr-learning-sharing-03.md)
* [Sharing object movements with multiple users](mr-learning-sharing-04.md)

## Objectives

* Learn how to create a PUN app and connect your Unity project to it
* Learn how to connect multiple users in a shared experience
* Learn how to share the object movements with other users

## Prerequisites

* A Windows 10 computer configured with the correct [tools installed](../../install-the-tools.md)
* Windows 10 SDK 10.0.18362.0 or later
* A HoloLens 2 device [configured for development](../../advanced-concepts/using-visual-studio.md#enabling-developer-mode)
* <a href="https://docs.unity3d.com/Manual/GettingStartedInstallingHub.html" target="_blank">Unity Hub</a> with Unity 2020 LTS installed and the Universal Windows Platform Build Support module added
* Completed the [Getting started tutorials](/learn/paths/beginner-hololens-2-tutorials/) series or some basic prior experience with Unity and MRTK
* If you intend to deploy to Android as well as HoloLens
  * A <a href="https://developer.android.com/studio/debug/dev-options" target="_blank">developer enabled</a> and <a href="https://developers.google.com/ar/discover/supported-devices" target="_blank">ARCore capable</a>
 Android device with USB connection to your Windows or macOS computer
  * <a href="https://docs.unity3d.com/Manual/GettingStartedInstallingHub.html" target="_blank">Unity Hub</a> with Unity 2020 LTS installed and the Android Build Support module added
* If you intend to deploy to iOS as well as HoloLens
  * A macOS computer with the latest version of <a href="https://geo.itunes.apple.com/us/app/xcode/id497799835?mt=12" target="_blank">Xcode</a> and <a href="https://cocoapods.org" target="_blank">CocoaPods</a> installed
  * An <a href="https://developer.apple.com/documentation/arkit/verifying_device_support_and_user_permission" target="_blank">ARKit compatible</a> iOS device with USB connection to your macOS computer
  * <a href="https://docs.unity3d.com/Manual/GettingStartedInstallingHub.html" target="_blank">Unity Hub</a> with Unity 2020 LTS installed and the iOS Build Support module added

> [!IMPORTANT]
> The recommended Mixed Reality Toolkit version for this tutorial series is MRTK 2.7.

> [!IMPORTANT]
> The recommended Unity version for this tutorial series is Unity 2020 LTS. This supersedes any Unity version requirements stated in the prerequisites linked above.

> [!div class="nextstepaction"]
> [Next Tutorial: 2. Setting up Photon Unity Networking](mr-learning-sharing-02.md)
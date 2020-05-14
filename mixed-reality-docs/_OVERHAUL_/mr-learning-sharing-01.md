---
title: Multi-user capabilities tutorials - 1. Setting up Photon Unity Networking
description: Complete this course to learn how to implement multi-user shared experiences within a HoloLens 2 application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
ms.localizationpriority: high
---

# 1. Introduction

## Overview

Welcome to the third series of the HoloLens 2 tutorials. In this four-part tutorial series, you will learn the fundamentals of building a muilt-user experience using Photon. Photon is one of several networking options available to Mixed Reality developers to create shared experiences.

In the first tutorial, [Setting up Photon Unity Networking](mr-learning-sharing-02.md) you will learn how to prepare for creating a shared experience using Photon Unity Networking (PUN). You will learn how to create a Photon PUN application, import Photon PUN assets into your Unity project, and connect your Unity project to the Photon PUN application.

In the second tutorial, [Connecting multiple users](mr-learning-sharing-03.md) you will learn how to connect multiple users as part of a live shared experience. By the end of the tutorial you will be able to run the application on multiple devices and have each user see the avatar of other users move in real-time.

In the third tutorial, [Sharing object movements with multiple users](mr-learning-sharing-04.md) you will learn how to share the movements of objects so that all participants of a shared experience can collaborate and view each others' interactions.

in the fourth tutorial, [Integrating Azure Spatial Anchors into a shared experience](mr-learning-sharing-05.md) you will learn how to integrate Azure Spatial Anchors (ASA) into the shared experience. ASA allows multiple devices to have a common reference to the physical world so that the users see each other in their actual physical location and see the shared experience in the same place.

## Objectives

* Learn how to create a Photon PUN application
* Learn how to find and import the Photon PUN assets
* Learn how to connect your Unity project to the Photon PUN application
* Learn how to connect multiple users in a shared experience
* Learn how to configure your project to share the movements of objects
* Learn how to build a basic multi-user collaborative application
* Integrate ASA into a shared experience for multi-device alignment
* Learn the fundamentals of how ASA works in the context of a local shared experience

## Prerequisites

>[!TIP]
>If you have not completed the [Getting started tutorials](mr-learning-base-01.md) and [Azure Spatial Anchors tutorials](mr-learning-asa-01.md) tutorial series yet, it's recommended that you complete those tutorials first.

* A Windows 10 PC configured with the correct [tools installed](install-the-tools.md)
* Windows 10 SDK 10.0.18362.0 or later
* Some basic C# programming ability
* A HoloLens 2 device [configured for development](using-visual-studio.md#enabling-developer-mode)
* <a href="https://docs.unity3d.com/Manual/GettingStartedInstallingHub.html" target="_blank">Unity Hub</a> with Unity 2019.3.X installed and the Universal Windows Platform Build Support module added
* Complete the [Create a Spatial Anchors resource](https://docs.microsoft.com/azure/spatial-anchors/quickstarts/get-started-unity-hololens#create-a-spatial-anchors-resource) section of the [Quickstart: Create a Unity HoloLens app that uses Azure Spatial Anchors](https://docs.microsoft.com/azure/spatial-anchors/quickstarts/get-started-unity-hololens) tutorial


> [!IMPORTANT]
> The recommended Unity version for this tutorial series is Unity 2019.3.X. This supersedes any Unity version requirements or recommendations stated in the prerequisites linked above.

[Next tutorial: 2. Setting up Photon Unity Networking](mr-learning-sharing-02.md)

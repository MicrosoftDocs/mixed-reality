---
title: Introduction to the MRTK tutorials
description: This course shows you how to use the Mixed Reality Toolkit (MRTK) to create a mixed reality application from scratch.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/05/2021
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens, MRTK, mixed reality toolkit, solvers, eye-tracking, voice commands
ms.localizationpriority: high
---

# 1. Introduction to the MRTK tutorials

Welcome to the Getting Started tutorial series! Over the course of these tutorials, you'll learn about the Mixed Reality Toolkit (MRTK) and some of the features it has to offer. You'll also build a mixed reality experience where the user can explore a hologram modeled after NASA's Mars Curiosity Rover. By the end of this series, you'll have a firm grasp of MRTK and how it can speed up your development process.

Tutorials in this series are meant to be sequential, so please go through them in the correct order:

1. [Introduction](mr-learning-base-01.md) (You're already here)
2. [Initializing your project and deploying your first application](mr-learning-base-02.md)
3. [Configuring the MRTK profiles](mr-learning-base-03.md)
4. [Positioning objects in the scene](mr-learning-base-04.md)
5. [Creating dynamic content using Solvers](mr-learning-base-05.md)
6. [Creating user interfaces](mr-learning-base-06.md)
7. [Interacting with 3D objects](mr-learning-base-07.md)
8. [Using eye-tracking](mr-learning-base-08.md)
9. [Using voice commands](mr-learning-base-09.md)

## Objectives

* Learn how to configure Unity for MRTK
* Learn how to build and deploy to your device
* Learn how to use some of MRTK's key features
* Create a complete mixed reality experience

## Prerequisites

* A Windows 10 PC configured with the correct [tools installed](../../install-the-tools.md)
* [Windows 10 SDK](https://developer.microsoft.com/windows/downloads/windows-10-sdk/) 10.0.18362.0 or later
* A HoloLens 2 device [configured for development](../../platform-capabilities-and-apis/using-visual-studio.md#enabling-developer-mode)

* <a href="https://docs.unity3d.com/Manual/GettingStartedInstallingHub.html" target="_blank">Unity Hub</a> with Unity 2019 LTS (currently 2019.4.x) or Unity 2020 LTS(currently 2020.3.x) installed and the Universal Windows Platform Build Support module added

When installing Unity, please make sure to check following components under **'Platforms'**.

* **Universal Windows Platform Build Support**
* **Windows Build Support (IL2CPP)**

![Unity Universal Windows Platform Build Support option](../../../develop/images/Unity_Install_Option_UWP.png)

If you installed Unity without these options, you can add them through **'Add Modules'** menu in Unity Hub.

![Unity Windows Build Support option](../../../develop/images/Unity_Install_Option_UWP2.png)

> [!CAUTION]
> The recommended MRTK version for this tutorial series is MRTK 2.7.

> [!CAUTION]
> This tutorial series supports Unity 2019 LTS (currently 2019.4.x) if you are using Legacy WSA or Windows XR Plugin and also Unity 2020 LTS(currently 2020.3.x) if you are using Windows XR Plugin or Open XR. This supersedes any Unity version requirements stated in the prerequisites linked above.

> [!div class="nextstepaction"]
> [Next Tutorial: 2. Initializing your project and deploying your first application](mr-learning-base-02.md)

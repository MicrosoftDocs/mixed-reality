---
title: Managed debugging with Unity IL2CPP
description: This article covers how to run a managed debugger on your Unity IL2CPP UWP project.
author: keveleigh
ms.author: kurtie
ms.date: 06/13/19
ms.topic: article
keywords: unity, visual studio, debugging, il2cpp
---

# Managed debugging with Unity IL2CPP

Follow these steps to attach a managed debugger to your Unity IL2CPP UWP build. This guide was originally developed for HoloLens and HoloLens 2.

1. Make sure **InternetClientServer** and **PrivateNetworkClientServer** are checked in Unity under the UWP Publishing Settings Capabilities.

    ![UWP Publishing Settings Capabilities](images/il2cpp-debugging-capabilities.png)

1. Unity UWP build settings:
    - Development Build
    - Script Debugging
    - Wait for Managed Debugger (optional)

    ![UWP Build Settings](images/il2cpp-debugging-build.png)

1. Build in Unity.
1. Build and deploy (Debug or Release, not Master) from the Visual Studio solution to your device. Optionally, verify **Internet (Client & Server)** and **Private Networks (Client & Server)** in the capabilities list in Package.appxmanifest in the solution.
1. Start the app on your device. Make sure your device is connected to the same network as your PC.
1. Make sure the device **is not** connected to your PC via USB.
1. Go to the Visual Studio solution that's created when you double click a script in Unity, where you can view and edit your C# scripts.
1. Debug -> Attach Unity Debugger. Look for your device in the list.

    ![Attach Unity Debugger](images/il2cpp-debugging-attach.png)

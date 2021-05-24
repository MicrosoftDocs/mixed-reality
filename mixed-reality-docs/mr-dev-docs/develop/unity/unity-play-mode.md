---
title: Unity Play Mode
description: Learn how to use Play Mode in the Unity editor to preview your application changes on a device without deploying an app.
author: jonmlyons
ms.author: jlyons
ms.date: 03/21/2018
ms.topic: article
keywords: Unity, remoting, holographic remoting, holographic remoting player, HoloLens, mixed reality headset, windows mixed reality headset, virtual reality headset, unity play mode
---

# Unity Play Mode

A fast way to work on your Unity project is to use "Play Mode", which runs your app locally in the Unity editor on your PC. Unity uses Holographic Remoting to provide a fast way to preview your content on a real HoloLens device. Play Mode can also be used with a Windows Mixed Reality headset attached to your development PC.

## Holographic Remoting setup

1. First, you need to [install the Holographic Remoting Player app](https://www.microsoft.com/store/productId/9NBLGGH4SV40) from the Microsoft Store on your HoloLens 2
2. Run the Holographic Remoting Player app on HoloLens 2 and you'll see the version number and IP address to connect to
    * You'll need v2.4 or later to work with the OpenXR plugin

    ![Screenshot of the Holographic Remoting Player running in the HoloLens](images/openxr-features-img-01.png)

## Holographic Remoting in Unity Editor play mode

Building a UWP Unity project in Visual Studio project and then packaging and deploying it to a HoloLens 2 device can take some time. One solution is to enable the Holographic Editor Remoting feature, which lets you debug your C# script using “Play” mode directly to a HoloLens 2 device over your network. This scenario avoids the overhead of building and deploying a UWP package to remote device.

1. Follow the steps in [Holographic Remoting setup](#holographic-remoting-setup)
2. Open **Windows > XR > OpenXR Editor Remoting**:

    ![Screenshot of project settings panel open in the Unity Editor with XR Plug-in management highlighted](images/openxr-features-img-02.png)

3. Input the IP address you get from the Holographic Remoting app, and select **Enable Editor Remoting**

    ![Screenshot of project settings panel open in the Unity Editor with Features highlighted](images/openxr-features-img-03.png)

Now you can click the “Play” button to play your Unity app into the Holographic Remoting app on your HoloLens. You can also [attach Visual Studio to Unity](/visualstudio/gamedev/unity/get-started/using-visual-studio-tools-for-unity?pivots=windows) to debug C# scripts in the play mode.

> [!NOTE]
> As of version 0.1.0, the Holographic Remoting runtime doesn’t support Anchors, and ARAnchorManager functionalities will not work through remoting.  This feature is coming in future releases.

## Unity Play Mode with Holographic Remoting

With Holographic Remoting, you can experience your app on the HoloLens while it runs in the Unity editor on your PC. Gaze, gesture, voice, and spatial mapping input is sent from your HoloLens to your PC. Rendered frames are then sent back to your HoloLens. This is a great way to quickly debug your app without building and deploying a full project.
1. On your HoloLens, go to the **Microsoft Store** and install the **[Holographic Remoting Player](https://www.microsoft.com/store/p/holographic-remoting-player/9nblggh4sv40)** app.
2. On your HoloLens, start the **Holographic Remoting Player** app.
3. In Unity, go to the **Window** menu, expand the **XR** submenu, and select **Holographic Emulation**.
4. Set **Emulation Mode** to **Remote to Device**.
5. For **Remote Machine**, enter the IP address of your HoloLens.
6. Select **Connect**. You should see **Connection Status** change to **Connected** and see the screen go blank in the HoloLens.
7. Select the **Play** button to start Play Mode and experience the app on your HoloLens.

Holographic Remoting requires a fast PC and Wi-Fi connection. You can find more details in the [Holographic Remoting Player](../platform-capabilities-and-apis/holographic-remoting-player.md) documentation.

For best results, make sure your app properly sets the [focus point](focus-point-in-unity.md). This helps Holographic Remoting to best adapt your scene to the latency of your wireless connection.

## See Also
* [Holographic Remoting Player](../platform-capabilities-and-apis/holographic-remoting-player.md)

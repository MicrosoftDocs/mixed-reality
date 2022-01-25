---
title: HoloLens (1st gen) Basics 100 - Getting started with Unity
description: Learn how to create your first basic mixed reality "hello world" application for HoloLens and Windows Mixed Reality devices.
author: keveleigh
ms.author: kurtie
ms.date: 10/22/2019
ms.topic: article
keywords: mixed reality, Windows Mixed Reality, HoloLens, immersive, vr, mr, get started, hologram, academy, tutorial, Mixed Reality Academy, unity, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# HoloLens (1st gen) Basics 100: Getting started with Unity

>[!IMPORTANT]
>The Mixed Reality Academy tutorials were designed with HoloLens (1st gen), Unity 2017, and Mixed Reality Immersive Headsets in mind.  As such, we feel it is important to leave these tutorials in place for developers who are still looking for guidance in developing for those devices. These tutorials will **_not_** be updated with the latest toolsets or interactions being used for HoloLens 2 and may not be compatible with newer versions of Unity.  They will be maintained to continue working on the supported devices. [A new series of tutorials](mrlearning-base.md) has been posted for HoloLens 2.

This tutorial will walk you through creating a basic mixed reality app built with Unity.

## Device support

<table>
<tr>
<th>Course</th><th style="width:150px"> <a href="/hololens/hololens1-hardware">HoloLens</a></th><th style="width:150px"> <a href="/windows/mixed-reality/enthusiast-guide/immersive-headset-hardware-details">Immersive headsets</a></th>
</tr><tr>
<td>MR Basics 100: Getting started with Unity</td><td style="text-align: center;"> ✔️</td><td style="text-align: center;"> ✔️</td>
</tr>
</table>

## Prerequisites

* A Windows 10 PC configured with the correct [tools installed](../../install-the-tools.md).

## Chapter 1 - Create a New Project

>[!VIDEO https://www.youtube.com/embed/2L5IFO0hnYA]

To build an app with Unity, you first need to create a project. This project is organized into a few folders, the most important of which is your Assets folder. This is the folder that holds all assets you import from digital content creation tools such as Maya, Max Cinema 4D or Photoshop, all code you create with Visual Studio or your favorite code editor, and any number of content files that Unity creates as you compose scenes, animations and other Unity asset types in the editor.

To build and deploy UWP apps, Unity can export the project as a Visual Studio solution that will contain all necessary asset and code files.

1. Start Unity
2. Select **New**
3. Enter a project name (e.g. "MixedRealityIntroduction")
4. Enter a location to save your project
5. Ensure the **3D** toggle is selected
6. Select **Create project**

Congrats, you are all setup to get started with your mixed reality customizations now.

## Chapter 2 - Setup the Camera

>[!VIDEO https://www.youtube.com/embed/eP1ZwB4wSNA]

The Unity Main Camera handles head tracking and stereoscopic rendering. There are a few changes to make to the Main Camera to use it with mixed reality.

1. Select File > New Scene

First, it will be easier to lay out your app if you imagine the starting position of the user as (**X**: 0, **Y**: 0, **Z**: 0). Since the Main Camera is tracking movement of the user's head, the starting position of the user can be set by setting the starting position of the Main Camera.

1. Select **Main Camera** in the **Hierarchy** panel
2. In the **Inspector** panel, find the **Transform** component and change the **Position** from (**X**: 0, **Y**: 1, **Z**: -10) to (**X**: 0, **Y**: 0, **Z**: 0)

Second, the default Camera background needs some thought.

**For HoloLens applications**, the real world should appear behind everything the camera renders, not a Skybox texture.

1. With the **Main Camera** still selected in the **Hierarchy** panel, find the **Camera** component in the **Inspector** panel and change the **Clear Flags** dropdown from **Skybox** to **Solid Color**.
2. Select the **Background** color picker and change the **RGBA** values to (0, 0, 0, 0)

**For mixed reality applications targeted to immersive headsets**, we can use the default Skybox texture that Unity provides.

1. With the **Main Camera** still selected in the **Hierarchy** panel, find the **Camera** component in the **Inspector** panel and keep the **Clear Flags** dropdown to **Skybox**.

Third, let us consider the near clip plane in Unity and prevent objects from being rendered too close to the users eyes as a user approaches an object or an object approaches a user.

**For HoloLens applications**, the near clip plane can be set to the [HoloLens recommended](../camera-in-unity.md#using-clipping-planes) 0.85 meters.

1. With the **Main Camera** still selected in the **Hierarchy** panel, find the **Camera** component in the **Inspector** panel and change the **Near Clip Plane** field from the default **0.3** to the HoloLens recommended **0.85**.

**For mixed reality applications targeted to immersive headsets**, we can use the default setting that Unity provides.

1. With the **Main Camera** still selected in the **Hierarchy** panel, find the **Camera** component in the **Inspector** panel and keep the **Near Clip Plane** field to the default **0.3**.

Finally, let us save our progress so far. To save the scene changes, select **File > Save Scene As**, name the scene **Main**, and select **Save**.

## Chapter 3 - Setup the Project Settings

>[!VIDEO https://www.youtube.com/embed/ItRoiXccC0g]

In this chapter, we will set some Unity project settings that help us target the Windows Holographic SDK for development. We will also set some quality settings for our application. Finally, we will ensure our build targets are set to Universal Windows Platform.

### Unity performance and quality settings

**Unity quality settings for HoloLens**

![Unity quality settings for HoloLens](images/qualitysettings.png)

Since maintaining high framerate on HoloLens is so important, we want the quality settings tuned for fastest performance. For more detailed performance information, [Performance recommendations for Unity](../performance-recommendations-for-unity.md).

1. Select **Edit > Project Settings > Quality**
2. Select the **dropdown** under the **Universal Windows Platform** logo and select **Very Low**. You'll know the setting is applied correctly when the box in the Universal Windows Platform column and **Very Low** row is green.

**For mixed reality applications targeted to occluded displays**, you can leave the quality settings to its default values.

### Target Windows 10 SDK

**Target Windows Holographic SDK**

![Target Windows Holographic SDK](../images/xrsettings.png)

We need to let Unity know that the app we are trying to export should create an [immersive view](../../../design/app-views.md) instead of a 2D view. We do this by enabling Virtual Reality support on Unity targeting the Windows 10 SDK.

1. Go to **Edit > Project Settings > Player**.
2. In the **Inspector Panel** for Player Settings, select the **Universal Windows Platform** icon.
3. Expand the **XR Settings** group.
4. In the **Rendering** section, check the **Virtual Reality Supported** checkbox to add a new **Virtual Reality SDKs** list.
5. Verify that **Windows Mixed Reality** appears in the list. If not, select the **+** button at the bottom of the list and choose **Windows Mixed Reality**.

>[!NOTE]
>If you do not see the **Universal Windows Platform** icon, double check to make sure you selected Universal Windows Platform Build Support during installation. If not, you may need to reinstall Unity with the correct Windows installation.

Awesome job on getting all the project settings applied. Next, let us add a hologram!

## Chapter 4 - Create a cube

>[!VIDEO https://www.youtube.com/embed/qKcK1Yuj-HQ]

Creating a cube in your Unity project is just like creating any other object in Unity. Placing a cube in front of the user is easy because Unity's coordinate system is mapped to the real world - where one meter in Unity is approximately one meter in the real world.

1. In the top left corner of the **Hierarchy** panel, select the **Create** dropdown and choose **3D Object > Cube**.
2. Select the newly created **Cube** in the **Hierarchy** panel
3. In the **Inspector** find the **Transform** component and change **Position** to (**X**: 0, **Y**: 0, **Z**: 2). *This positions the cube 2 meters in front of the user's starting position.*
4. In the **Transform** component, change **Rotation** to (**X**: 45, **Y**: 45, **Z**: 45) and change **Scale** to (**X**: 0.25, **Y**: 0.25, **Z**: 0.25). *This scales the cube to 0.25 meters.*
5. To save the scene changes, select **File > Save Scene**.

## Chapter 5 - Verify on device from Unity editor

>[!VIDEO https://www.youtube.com/embed/vmCfiIdRb6Q]

Now that we have created our cube, it is time to do a quick check in device. You can do this directly from within the Unity editor.

### Initial setup

1. On your development PC, in Unity, open **File > Build Settings** window.
2. Change **Platform** to **Universal Windows Platform** and click **Switch Platform**

### For HoloLens use Unity Remoting

1. On your HoloLens, install and run the [Holographic Remoting Player](../../native/holographic-remoting-player.md), available from the Windows Store. Launch the application on the device, and it will enter a waiting state and show the IP address of the device. Note down the IP.
2. Open **Window > XR > Holographic Emulation**.
3. Change **Emulation Mode** from **None** to **Remote to Device**.
4. In **Remote Machine**, enter the IP address of your HoloLens noted earlier.
5. Click **Connect**.
6. Ensure the **Connection Status** changes to green **Connected**.
7. Now you can now click **Play** in the Unity editor.

You will now be able to see the cube in device and in the editor. You can pause, inspect objects, and debug just like you are running an app in the editor, because that's essentially what's happening, but with video, audio, and device input transmitted back and forth across the network between the host machine and the device.

### For other mixed reality supported headsets

1. Connect the headset to your development PC using the USB cable and the HDMI or display port cable.
2. Launch the **Mixed Reality Portal** and ensure you have completed the first run experience.
3. From Unity, you can now press the Play button.

You will now be able to see the cube rendering in your mixed reality headset and in the editor.

## Chapter 6 - Build and deploy to device from Visual Studio

>[!VIDEO https://www.youtube.com/embed/USSu8yHUdbk]

We are now ready to compile our project to Visual Studio and deploy to our target device.

### Export to the Visual Studio solution

1. Open **File > Build Settings** window.
1. Click **Add Open Scenes** to add the scene.
1. Change **Platform** to **Universal Windows Platform** and click **Switch Platform**.
1. In **Universal Windows Platform** settings, ensure **SDK** is **Universal 10**.
1. For Target device, leave to **Any Device** for occluded displays or switch to **HoloLens**.
1. **UWP Build Type** should be **D3D**.
1. **UWP SDK** could be left at **Latest installed**.
1. Click **Build**.
1. In the file explorer, click **New Folder** and name the folder **"App"**.
1. With the **App** folder selected, click the **Select Folder** button.
1. When Unity is done building, a Windows File Explorer window will appear.
1. Open the **App** folder in file explorer.
1. Open the generated Visual Studio solution (MixedRealityIntroduction.sln in this example)

### Compile the Visual Studio solution

Finally, we will compile the exported Visual Studio solution, deploy it, and try it out on the device.

1. Using the top toolbar in Visual Studio, change the target from **Debug** to **Release** and from **ARM** to **X86**.

The instructions differ for deploying to a device versus the emulator. Follow the instructions that match your setup.

### Deploy to mixed reality device over Wi-Fi

1. Click on the arrow next to the **Local Machine** button, and change the deployment target to **Remote Machine**.
2. Enter the IP address of your mixed reality device and change **Authentication Mode** to Universal (Unencrypted Protocol) for HoloLens and **Windows** for other devices.
3. Click **Debug > Start without debugging**.

**For HoloLens**, If this is the first time deploying to your device, you will need to pair [using Visual Studio](../../advanced-concepts/using-visual-studio.md).

### Deploy to mixed reality device over USB

Ensure you device is plugged in via the USB cable.

1. **For HoloLens**, click on the arrow next to the **Local Machine** button, and change the deployment target to **Device**.
2. **For targeting occluded devices attached to your PC**, keep the setting to Local Machine. Ensure you have the **Mixed Reality Portal** running.
3. Click **Debug > Start without debugging**.

### Deploy to Emulator

1. Click on the arrow next to the **Device** button, and from drop down select **HoloLens Emulator**.
2. Click **Debug > Start without debugging**.

### Try out your app

Now that your app is deployed, try moving all around the cube and observe that it stays in the world in front of you.

## See also

* [Unity development overview](../unity-development-overview.md)
* [Best practices for working with Unity and Visual Studio](../best-practices-for-working-with-unity-and-visual-studio.md)
* [MR Basics 101](holograms-101.md)
* [MR Basics 101E](holograms-101e.md)
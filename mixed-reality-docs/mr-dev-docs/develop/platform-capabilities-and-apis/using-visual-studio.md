---
title: Using Visual Studio to deploy and debug
description: Learn how to build, debug, and deploy apps for HoloLens and Windows Mixed Reality using Visual Studio.
author: pbarnettms
ms.author: pbarnett
ms.date: 04/13/2020
ms.topic: article
ms.localizationpriority: high
keywords: Visual Studio, HoloLens, Mixed Reality, debug, deploy
---


# Using Visual Studio to deploy and debug

Whether you're using DirectX or Unity to develop your mixed reality app, Visual Studio is your go-to tool for debugging and deployment. In this section, you will learn how to:
* Deploy applications to your HoloLens or Windows Mixed Reality immersive headset through Visual Studio.
* Use the HoloLens emulator built in to Visual Studio.
* Debug mixed reality apps.

## Prerequisites
1. See [Install the Tools](../../develop/install-the-tools.md) for installation instructions.
2. Create a new Universal Windows app project in Visual Studio.  For HoloLens (1st gen), use Visual Studio 2017 or newer.  For HoloLens 2, use Visual Studio 2019 16.2 or newer. C# and C++ are supported. (Or follow the instructions to [create an app in Unity](../../develop/unity/tutorials/holograms-100.md).)

## Enabling Developer Mode

Start by enabling **Developer Mode** on your device, so Visual Studio can connect to it.

### HoloLens
1. Turn on your HoloLens and put on the device.
2. Use the [start gesture](../../design/system-gesture.md) to launch the main menu.
3. Select the **Settings** tile to launch the app in your environment.
4. Select the **Update** menu item.
5. Select the **For developers** menu item.
6. Enable **Developer Mode** to [deploy apps from Visual Studio](using-visual-studio.md) to your HoloLens.
7. Optional: Scroll down and also enable **Device Portal**, which lets you connect to the [Windows Device Portal](using-the-windows-device-portal.md) on your HoloLens from a web browser.

### Windows PC

If you're working with a Windows Mixed Reality headset connected to your PC, you must enable **Developer Mode** on the PC.
1. Go to **Settings**
2. Select **Update and Security**
3. Select **For developers**
4. Enable **Developer Mode**, read the disclaimer for the setting you chose, then select Yes to accept the change.

## Deploying an app over Wi-Fi - HoloLens (1st gen)
1. Select an **x86** build configuration for your app</br>
![x86 build configuration in Visual Studio](images/x86setting.png)</br>
2. Select **Remote Machine** in the deployment target drop-down menu</br>
![Remote machine deployment target in Visual Studio](images/remotemachinesetting.png)</br>
3. For C++ and JavaScript projects, go to **Project > Properties > Configuration Properties > Debugging**. For C# projects, a dialog will automatically appear to configure your connection.
  a. Enter the IP address of your device in the **Address** or **Machine Name** field. Find the IP address on your HoloLens under **Settings > Network & Internet > Advanced Options**, or you can ask Cortana "What is my IP address?"
  b. Set Authentication Mode to **Universal (Unencrypted protocol)**</br>
  ![Remote connection dialog in Visual Studio](images/remotedeploy.png)</br>
4. Select **Debug > Start debugging** to deploy your app and start debugging</br>
![Start Without Debugging in Visual Studio](images/deploywithdebugging.png)</br>
5. The first time you deploy an app to your HoloLens from your PC, you'lll be prompted for a PIN. Follow the **Pairing your device** instructions below.

## Deploying an app over Wi-Fi - HoloLens 2
1. Select an **ARM** or **ARM64** build configuration for your app</br>
![ARM64 build configuration in Visual Studio](images/arm64setting.png)</br>
2. Select **Remote Machine** in the deployment target drop-down menu</br>
![Remote machine deployment target in Visual Studio](images/remotemachinesetting_arm64.png)</br>
3. For C++ and JavaScript projects, go to **Project > Properties > Configuration Properties > Debugging**. For C# projects, a dialog will automatically appear to configure your connection.
  a. Enter the IP address of your device in the **Address** or **Machine Name** field. Find the IP address on your HoloLens under **Settings > Network & Internet > Advanced Options**, or you can ask Cortana "What is my IP address?"
  b. Set the Authentication Mode to **Universal (Unencrypted protocol)**</br>
  ![Remote connection dialog in Visual Studio](images/remotedeploy.png)</br>
4. Select **Debug > Start debugging** to deploy your app and start debugging</br>
![Start Without Debugging in Visual Studio](images/deploywithdebugging.png)</br>
5. The first time you deploy an app to your HoloLens from your PC, you'll be prompted for a PIN. Follow the **Pairing your device** instructions below.

If your HoloLens IP address changes, you can change the IP address of the target machine by going to **Project > Properties > Configuration Properties > Debugging**

## Deploying an app over USB - HoloLens (1st gen)
1. Select an **x86** build configuration for your app</br>
![x86 build configuration in Visual Studio](images/x86setting.png)</br>
2. Select **Device** in the deployment target drop-down menu</br>
![Device deployment in Visual Studio](images/buildsettingsusbdeploy.png)</br>
3. Select **Debug > Start debugging** to deploy your app and start debugging</br>
![Start Without Debugging in Visual Studio](images/deploywithdebugging.png)</br>
4. The first time you deploy an app to your HoloLens from your PC, you'll be prompted for a PIN. Follow the **Pairing your device** instructions below.

## Deploying an app over USB - HoloLens 2

>[!VIDEO https://channel9.msdn.com/Shows/Docs-Mixed-Reality/Deploying-your-HoloLens-2-application/player?format=ny]

1. Select an **ARM** or **ARM64** build configuration for your app</br>
![ARM64 build configuration in Visual Studio](images/arm64setting.png)</br>
2. Select **Device** in the deployment target drop-down menu</br>
![Device deployment in Visual Studio](images/buildsettingsusbdeploy_arm64.png)</br>
3. Select **Debug > Start debugging** to deploy your app and start debugging</br>
![Start Without Debugging in Visual Studio](images/deploywithdebugging.png)</br>
4. The first time you deploy an app to your HoloLens from your PC, you'll be prompted for a PIN. Follow the **Pairing your device** instructions below.

## Deploying an app to your Local PC - immersive headset

To use a Windows Mixed Reality immersive headset that connects to your PC or the [Mixed Reality simulator](using-the-windows-mixed-reality-simulator.md):
1. Select an **x86** or **x64** build configuration for your app
2. Select **Local Machine** in the deployment target drop-down menu
3. Select **Debug > Start debugging** to deploy your app and start debugging

## Pairing your device

The first time you deploy an app from Visual Studio to your HoloLens, you'll be prompted for a PIN. On the HoloLens, generate a PIN by launching the Settings app, go to **Update > For Developers**, and tap on **Pair**. When the PIN is displayed on your HoloLens, type it into Visual Studio. After pairing is complete, tap **Done** on your HoloLens to dismiss the dialog. This PC is now paired with the HoloLens and you can deploy apps automatically. Repeat these steps for every PC that's used to deploy apps to your HoloLens.

To unpair your HoloLens from all paired computers:
* Launch the **Settings** app, go to **Update > For Developers**, and tap on **Clear**.

## Deploying an app to the HoloLens (1st gen) Emulator
1. Make sure you've **[installed the HoloLens Emulator](../install-the-tools.md)**.
2. Select an **x86** build configuration for your app.</br>
![x86 build configuration in Visual Studio](images/x86setting.png)</br>
3. Select **HoloLens Emulator** in the deployment target drop-down menu</br>
![Emulator target in Visual Studio](images/deployemulator.png)</br>
4. Select **Debug > Start debugging** to deploy your app and start debugging</br>
![Start Without Debugging in Visual Studio](images/deploywithdebugging.png)</br>

## Deploying an app to the HoloLens 2 Emulator
1. Make sure you've **[installed the HoloLens Emulator](../install-the-tools.md)**.
2. Select an **x86** or **x64** build configuration for your app.</br>
![x86 build configuration in Visual Studio](images/x86setting.png)</br>
3. Select **HoloLens 2 Emulator** in the deployment target drop-down menu</br>
![Emulator target in Visual Studio](images/deployemulator2.png)</br>
4. Select **Debug > Start debugging** to deploy your app and start debugging</br>
![Start Without Debugging in Visual Studio](images/deploywithdebugging.png)</br>

## Graphics Debugger for HoloLens (1st gen)

The Visual Studio Graphics Diagnostics tools are helpful when writing and optimizing a Holographic app. See [Visual Studio Graphics Diagnostics on MSDN](https://msdn.microsoft.com/library/hh315751.aspx) for full details.

**To Start the Graphics Debugger**
1. Follow the instructions above to target a device or emulator
2. Go to **Debug > Graphics > Start Diagnostics**
3. The first time you start diagnostics with a HoloLens, you may get an "access denied" error. Reboot your HoloLens to let the updated permissions take effect and try again.

## Profiling

The Visual Studio profiling tools allow you to analyze your app's performance and resource use. This includes tools to optimize CPU, memory, graphics, and network use. See [Run diagnostic tools without debugging on MSDN](https://msdn.microsoft.com/library/dn957936.aspx) for full details.

**To Start the Profiling Tools with HoloLens**
1. Follow the instructions above to target a device or emulator
2. Go to **Debug > Start Diagnostic Tools Without Debugging...**
3. Select the tools you want to use
4. Select **Start**
5. The first time you start diagnostics without debugging with a HoloLens, you may get an "access denied" error. Reboot your HoloLens to let the updated permissions take effect and try again.

## Debugging an installed or running app

You can use Visual Studio to debug an installed Universal Windows app without deploying from a Visual Studio project. This is useful if you want to debug an installed app package or debug an app that's already running.
1. Go to **Debug -> Other Debug Targets -> Debug Installed App Package**
2. Select the **Remote Machine** target for HoloLens or **Local Machine** for immersive headsets.
3. Enter your device’s **IP address**
4. Choose the **Universal** Authentication Mode
5. The window shows both running and inactive apps. Pick the one what you’d like to debug.
6. Choose the type of code to debug (Managed, Native, Mixed)
7. Select **Attach** or **Start**

## Next Development Checkpoint

If you're following the Unity development checkpoint journey we've laid out, you're in the midst of the deployment stage. From here, you can continue to the next topic:

> [!div class="nextstepaction"]
> [Deploying to HoloLens emulator](using-the-hololens-emulator.md)

Or jump directly to adding advanced services:

> [!div class="nextstepaction"]
> [Advanced services](../../develop/unity/unity-development-overview.md#5-adding-services)

You can always go back to the [Unity development checkpoints](../../develop/unity/unity-development-overview.md#4-deploying-to-a-device-or-emulator) at any time.

## See also
* [Install the tools](../install-the-tools.md)
* [Using the HoloLens emulator](using-the-hololens-emulator.md)
* [Deploying and debugging Universal Windows Platform (UWP) apps](https://msdn.microsoft.com/library/windows/apps/xaml/mt613243.aspx)
* [Enable your device for development](https://docs.microsoft.com/windows/uwp/get-started/enable-your-device-for-development)

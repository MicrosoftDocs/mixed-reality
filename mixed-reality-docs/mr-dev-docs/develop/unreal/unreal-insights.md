---
title: Profiling with Unreal Insights
description: Learn how to use Unreal Insights on HoloLens 2.
author: sean-kerawala
ms.author: sekerawa
ms.date: 12/10/2020
ms.topic: article
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, development, profling, unreal insights, documentation, guides, features, holograms, game development, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Profiling with Unreal Insights

[Unreal Insights](https://docs.unrealengine.com/TestingAndOptimization/PerformanceAndProfiling/UnrealInsights/Overview/index.html) is a profiling system that collects, analyzes, and visualizes data from Unreal Engine. The profiling system can help you find optimization bottlenecks and areas where you apps performance could use a boost. Normally, you enable Unreal Insights right from the editor, but for HoloLens 2 you'll need to use the command line.

## Setup

Unreal lets you to create and configure a "Custom Profile" in the HoloLens launcher with the command line parameters that enable Unreal Insights.

1. Find the IP address of your computer using the **ipconfig** command on the command prompt. The IP address is the IPv4 address listed by ipconfig. Keep this in mind for later when you set Command Line Parameters.

> [!IMPORTANT]
> If you're behind a VPN, you may need to provide the IP address provided via the VPN instead.

![Screenshot of command line results for ipconfig command](images/unreal-insights-img-01.png)

2. Open **Project Settings** from the "Edit" toolbar in the main editor window.

![Screenshot of Edit dropdown with Project Settings highlighted](images/unreal-insights-img-15.png)

3. Scroll down the left panel until you find the **Platforms** header and select **HoloLens**.

![Screenshot of the Platforms section in the Project Settings left panel with HoloLens highlighted](images/unreal-insights-img-15.png)

4. Confirm that the **Capabilities** section has "Internet Client", "Internet Client Server", and "Private Network Client Server" selected.

![Screenshot of Capabilities options with Internet Client, Internet Client Server, and Private Network Client Server selected](images/unreal-insights-img-14.png)

## Launch

1. Open **Project Launcher** from the UE4 panel under the **Launch** button:

![Screenshot of launch options with project launcher highlighted](images/unreal-insights-img-07.png)

2. Select the **+** button to create a custom profile under **Custom Launch Profiles**. Once created, you can always edit this profile later:

![Screenshot of project launcher with custom launch profiles highlighted](images/unreal-insights-img-08.png)

3. Select **edit profile** button on the HoloLens custom launch profile. In the **Build** section, check **Build UAT** and set **Additional Command Line Parameters**.
   - Try these for starters: **-tracehost=IP_OF_YOUR_PC -trace=Log,Bookmark,Frame,CPU,GPU,LoadTime,File,Net**
   - You can find a complete list of available launch parameters in the [Unreal Insights reference documentation](https://docs.unrealengine.com/TestingAndOptimization/PerformanceAndProfiling/UnrealInsights/Reference/index.html).

> [!NOTE]
> "IP_OF_YOUR_PC" is the IP address we found in step 1. This is the IP address of the computer running Unreal Insights, NOT the IP address of the HoloLens.

> [!IMPORTANT]
> Traces can get large very quickly. Enable only those channels you need to keep trace size low.

![Screenshot of Build options in profile configuration](images/unreal-insights-img-17.png)

4. Select **Cook** to **By the Book** to enable copying to device. Make sure your maps are selected in **Cooked Maps**.

![Screenshot of cook options in profile configuration with cook by the book and HoloLens highlighted](images/unreal-insights-img-09.png)

5. Set **How would you like to package the build** to **Package & store locally**. Note the file path you choose, as you will need this later.

![Screenshot of package options in profile configuration set to package and store locally](images/unreal-insights-img-18.png)

6. Set **How would you like to deploy the build?** to **Do not deploy**.

![Screenshot of deploy options in profile configuration with deploy set to do not deploy](images/unreal-insights-img-19.png)

8. Select **Back** to return to the root of the **Project Launcher** dialog
9. Back in the editor, Click **Launch** on your custom launch profile

![Screenshot of custom launch profiles](images/unreal-insights-img-13.png)

10. Watch as your project is built, and then deploy the appxbundle (in the package path from step 5) to your HoloLens through the device portal

11. Launch Unreal Insights. The Unreal Insights executable is stored in the binaries engine folder, usually as follows: "C:\Program Files\Epic Games\UE_4.26\Engine\Binaries\Win64\UnrealInsights.exe"

![Screenshot of unreal insights executable running](images/unreal-insights-img-12.png)

12. Launch the app on your HoloLens.

## Profiling

Back in Unreal Insights, select the **Live** connection to your device to start profiling

The custom profile is shared between projects. From here on out, you can use the custom profile you created instead of having to do this every time. You only need to recreate the connection to the device every time you start Unreal with steps 3 to 6 in the [setup section](#setup).

## See also

- [Unreal Insights documentation](https://docs.unrealengine.com/TestingAndOptimization/PerformanceAndProfiling/UnrealInsights/index.html)

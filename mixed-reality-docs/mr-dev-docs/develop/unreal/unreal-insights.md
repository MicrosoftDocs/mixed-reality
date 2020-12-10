---
title: Profiling with Unreal Insights
description: Learn how to use Unreal Insights on HoloLens 2.
author: sajidfarooq
ms.author: v-hferrone
ms.date: 12/10/2020
ms.topic: article
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, development, profling, unreal insights, documentation, guides, features, holograms, game development, mixed reality headset, windows mixed reality headset, virtual reality headset
---


# Profiling with Unreal Insights 

[Unreal Insights](https://docs.unrealengine.com/TestingAndOptimization/PerformanceAndProfiling/UnrealInsights/Overview/index.html) is a profiling system that collects, analyzes, and visualizes data from Unreal Engine. The profiling system can help you find optimization bottlenecks and areas where you apps performance could use a boost. Normally, you enable Unreal Insights right from the editor, but for HoloLens 2 you'll need to use the command line.  

## Setup

<!-- TODO: More detail on why this is important -->
Unreal lets you to create and configure a "Custom Profile" in the HoloLens launcher with the command line parameters that enable Unreal Insights.

1.	Find the IP address of your computer using the **ipconfig** command on the command prompt. Keep this in mind for later when you set Command Line Parameters

<!-- TODO: Where/how do they launch unreal insights? -->
2.	Launch Unreal Insights BEFORE app launch, otherwise Unreal Insights wont be able to initialize appropriately before the app
3.	Go to the top of the Unreal Engine panel and open **Device Manager** under the **Launch** button
4.	Select **Add an Unlisted Device** and choose **Hololens**
6.	If you're using IPoverUSB, enter 127.0.0.1:10080 as the Device Identifier. Enter your HoloLens user and password in their respective fields and fill **Display Name** as you wish
7.	Your HoloLens should appear in the device list of the device manager

## Launch

1.	Open **Project Launcher** from the UE4 panel under the **Launch** button
2.	Select **edit profile** button on the HoloLens custom launch profile and configure:
    * You may want to check **Do you wish to archive?** in the **Archive** section to retain the generated .appxbundle rather than deleting to save disk space. Specify a location for the .appxbundle and switch to a development build if you wish
4.	Set **How would you like to deploy the build?** to **Copy to device** to activate the **Launch** section of the UI
5.	Set **Additional Command Line Parameters** in the **Launch** section. The parameters will be written into a ue4commandline.txt file, packaged into the bundle, and used at launch. 
    <!-- TODO: Need more detail on what this parameter does and where to find others. -->
    * Try these for starters: **-tracehost=IP_OF_YOUR_PC -trace=Log,Bookmark,Frame,CPU,GPU,LoadTime,File,Net**
6.	Select **Back** to return to the root of the **Project Launcher** dialog
7.	Back in the editor, Click **Launch** on your custom launch profile
8.	Watch as your project is packaged up, installed on your device, and launched
9.	Back in Unreal Insights, select the **Live** connection to your device to start profiling

The custom profile is shared between projects. From here on out, you can use the custom profile you created instead of having to do this every time. You only need to recreate the connection to the device every time you start Unreal (steps 4,5 and 6).

> [!NOTE]
> Traces can get large very quickly, so only enable the channels you need to keep trace size small.

## See also
* [Unreal Insights documentation](https://docs.unrealengine.com/TestingAndOptimization/PerformanceAndProfiling/UnrealInsights/index.html)


---
title: Spatial audio tutorials - 1. Adding spatial audio to your project
description: Add the Microsoft Spatializer plugin to your Unity project to access HoloLens2 HRTF hardware offload.
author: kegodin
ms.author: kegodin
ms.date: 12/01/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens2, spatial audio
---

# 1. Adding spatial audio to your project

Welcome to the spatial audio module of the HoloLens 2 tutorials. This module shows how to use spatialization offload on HoloLens 2 in a Unity project, including enabling reverb and applying spatialization to common types of sounds in mixed reality applications. See the [spatializer GitHub repository](https://microsoft.visualstudio.com/Analog/_git/mixedreality.spatialaudio.unity?path=%2FSamples%2FMicrosoftSpatializerSample&version=GBuser%2Fkegodin%2Finitiallearningmodule) to download a completed Unity project of this tutorial sequence. 

For our recommendations on using sounds in mixed reality, and when to enable spatialization on sounds in your application, see [spatial sound design](https://docs.microsoft.com/windows/mixed-reality/spatial-sound-design).

## Objectives
In this first chapter, you'll:
* Create a Unity project and import MRTK
* Import the Microsoft spatializer plugin
* Enable the Microsoft spatializer plugin
* Enable spatial audio on your developer workstation

## Create a project and import MRTK
Create an empty Unity 3D project and follow the instructions at [MRTK NuGet instructions](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/MRTKNuGetPackage.html) to use Nuget to install MRTK.

## Set up MRTK in your project
See Chapter 1 of the [MR Learning Base Module](https://docs.microsoft.com/en-us/windows/mixed-reality/mrlearning-base-ch1) to set up your project to use MRTK. Because you've already installed MRTK using NuGet, you can skip the step to import the MRTK .unitypackage, moving on to the setup instructions.

## Import the Microsoft Spatializer plugin
The Microsoft spatializer plugin enables spatialization hardware acceleration on HoloLens2 and is available via Nuget. Open the file **Assets/NuGet.config** in your Unity project to add the Microsoft Spatializer package feed, by adding the following element to the **packageSources** element: 
> [!NOTE]
> TODO: Change the link below to the public NuGet feed before publishing this page

```xml
<add key="Spatializer" value="https://pkgs.dev.azure.com/microsoft/_packaging/Microsoft.SpatialAudio.Unity/nuget/v2/" />
```

After editing, your NuGet.config will look like this:
> [!NOTE]
> TODO: Change the link below to the public NuGet feed before publishing this page

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
    <packageSources>
       <add key="NuGet" value="http://www.nuget.org/api/v2/" />
       <add key="Spatializer" value="https://pkgs.dev.azure.com/microsoft/_packaging/Microsoft.SpatialAudio.Unity/nuget/v2/" />
    </packageSources>
    <disabledPackageSources />
    <activePackageSource>
       <add key="All" value="(Aggregate source)" />
    </activePackageSource>
    <config>
       <add key="repositoryPath" value="./Packages" />
       <add key="DefaultPushSource" value="http://www.nuget.org/api/v2/" />
    </config>
</configuration>
```

## Enable the Microsoft Spatializer plugin
After importing the plugin, enable the Microsoft spatializer plugin. Open **Edit -> Project Settings -> Audio**, and change **Spatializer Plugin** to "Microsoft Spatializer".

![Project Settings showing spatializer plugin](images/spatial-audio/project-settings.png)

## Enable spatial audio on your developer workstation
On desktop versions of Windows, spatial sound is disabled by default. To enable testing your project in the Unity Editor, right-click on the volume icon in the task bar and enable Spatial sound. Choose **Windows Sonic for Headphones** to match the algorithm used on HoloLens2.

![Desktop spatial audio settings](images/spatial-audio/desktop-audio-settings.png)


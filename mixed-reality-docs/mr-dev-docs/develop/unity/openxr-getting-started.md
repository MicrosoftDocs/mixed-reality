---
title: Using the Mixed Reality OpenXR Plugin for Unity
description: 
author: hferrone
ms.author: alexturn
ms.date: 12/1/2020
ms.topic: article
keywords: openxr, unity, hololens, hololens 2, mixed reality, MRTK, Mixed Reality Toolkit, augmented reality, virtual reality, mixed reality headsets, learn, tutorial, getting started
---


# Using the Mixed Reality OpenXR Plugin for Unity

Starting with Unity version 2020.2, Microsoft’s Mixed Reality OpenXR Plugin package is available using the Unity Package Manager (UPM).

## Installing Unity’s OpenXR and XR Plugin Management packages

Before using the Mixed Reality OpenXR Plugin, you need to install Unity’s “OpenXR XR Plugin” and “XR Plugin Management” packages:

1. In the Unity Editor, navigate to **Window > Package Manager**, select **Packages: Unity Registry**, and search for**XR Plugin Management**
2. Select **Install**   
3. Once installation is complete, search for **OpenXR XR Plugin** and select **Install**

![Screenshot of the Unity Package Manager window open in the Unity editor](images/openxr-img-01.png)

> [!NOTE]
> If you're not targeting HoloLens 2, you can skip to [configuring the XR Plugin Management for OpenXR](#configure-xr-plugin-management-for-openxr).

## Installing Mixed Reality features using the Unity Package Manager

The Unity Package Manager uses a manifest file named *manifest.json* to determine which packages to install and the registries they can be installed from.

> [!IMPORTANT]
> OpenXR is still experimental in Unity and this process may change over time as we work to optimize the developer experience.

### Registering the Mixed Reality component server

The manifest.json file in the Packages folder needs to have the Mixed Reality scoped registry added for each project that uses OpenXR. To properly modify manifest.json to support Mixed Reality:

1.	Open **<projectRoot>/Packages/manifest.json** in a text editor like Visual Studio Code
2.	At the top of the manifest file, add the Mixed Reality server to the scoped registry section and save the file

```
{
  "scopedRegistries": [
    {
      "name": "Microsoft Mixed Reality",
      "url": "https://pkgs.dev.azure.com/aipmr/MixedReality-Unity-Packages/_packaging/Unity-packages/npm/registry/",
      "scopes": [
        "com.microsoft.mixedreality"
      ]
    }
  ],
```

### Adding the Mixed Reality OpenXR Plugin package

Once the Microsoft Mixed Reality scoped registry has been added to the manifest, the OpenXR package can be specified.
To add the OpenXR package, modify the dependencies section of the Packages/manifest.json file:

```
  "dependencies": {
    "com.microsoft.mixedreality.openxr": "1.0",
```

## Managing OpenXR features with the Unity Package Manager

Once the OpenXR package has been added to the package manifest, it can be managed using the Unity Package Manager user interface.  

![Screenshot of the Unity Package Manager open in the Unity Editor with Mixed Reality OpenXR Plugin highlighted](images/openxr-img-02.png)

> [!Note] 
> If the OpenXR package is removed using the Unity Package Manager, you'll have to re-add it using the previously described steps.

## Configure XR Plugin Management for OpenXR

To set OpenXR as the the runtime in Unity: 

1. In the Unity Editor, navigate to **Edit > Project Settings**
2. In the list of Settings, select **XR Plugin Management**
3. Select **Initialize XR on Startup** and **OpenXR (Preview)**
4. If targeting HoloLens 2, select **Windows Mixed Reality Feature Set**

![Screenshot of the project settings panel open in the Unity editor with XR Plug-in management highlighted](images/openxr-img-03.png)

5. Select **OpenXR** under the XR Plug-in Management package
6. Set Render Mode to **Single Pass Instanced**
7. Set Depth Submission Mode to *Depth 16 Bit**

You're now ready to begin developing with OpenXR in Unity!  Continue on to the next section to learn how to use the OpenXR samples.

## Using OpenXR examples

To utilize one or more of the examples, please use the following steps:

### HoloLens 2 samples

1. In the Unity Editor, navigate to **Window > Package Manager**
2. In the list of packages, select **Mixed Reality OpenXR Plugin**
3. Locate the sample in the **Samples** list and select **Import**

![Screenshot of Unity Package Manager open in Unity editor with Mixed Reality OpenXR Plugin selected and import button highlighted](images/openxr-img-04.png)

### For all other OpenXR samples

1. In the Unity Editor, navigate to **Window > Package Manager**
2. In the list of packages, select **OpenXR XR Plugin**
3. Locate the sample in the **Samples** list and select **Import**

> [!NOTE]
>  When a package is updated, Unity provides the option to update imported samples.  Updating an imported sample will overwrite any changes that have been made to the sample and associated assets.
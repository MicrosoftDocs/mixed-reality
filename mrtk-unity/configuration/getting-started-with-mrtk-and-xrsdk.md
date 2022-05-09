---
title: Getting started with MRTK and XR SDK
description: Landing page for MRTK with XR SDK
author: keveleigh
ms.author: kurtie
ms.date: 01/12/2021
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, XRSDK, XR SDK
---
# Getting started with MRTK and XR SDK

XR SDK is Unity's [new XR pipeline in Unity 2019.3 and beyond](https://blogs.unity3d.com/2020/01/24/unity-xr-platform-updates/). In Unity 2019, it provides an alternative to the existing XR pipeline. In Unity 2020, it is the only XR pipeline in Unity.

## Prerequisites

To get started with the Mixed Reality Toolkit, follow [the provided steps](/windows/mixed-reality/develop/install-the-tools#importing-the-mixed-reality-toolkit) to add MRTK to a project.

## Configuring Unity for the XR SDK pipeline

The XR SDK pipeline currently supports 3 platforms: Windows Mixed Reality, Oculus, and OpenXR. The sections below will cover the steps needed to configure XR SDK for each platform.

### Windows Mixed Reality

Go into **Unity's Package Manager** and install the Windows XR Plugin package, which adds support for Windows Mixed Reality on XR SDK. This will pull down a few dependency packages as well.

1. Ensure that the following all successfully installed:
   * XR Plugin Management
   * Windows XR Plugin
   * XR Legacy Input Helpers

2. Go to **Edit > Project Settings**.
3. Click on the XR Plug-in Management tab in the Project Settings window.
4. Go to the Universal Windows Platform settings and ensure Windows Mixed Reality is checked under Plug-in Providers.
5. Ensure that Initialize XR on Startup is checked.
6. (**_Required for in-editor HoloLens Remoting, otherwise optional_**) Go to the Standalone settings and ensure Windows Mixed Reality is checked under Plug-in Providers. Also ensure that Initialize XR on Startup is checked.

    ![XR Plugin management with Standalone tab selected](images/xr-management-img-02.png)

7. (**_Optional_**) Click on the Windows Mixed Reality tab under XR Plug-in Management and create a custom settings profile to change the defaults. If the list of settings are already there, no profile needs to be created.

    ![XR Plugin management with Windows tab selected](images/xr-management-img-01.png)

### Oculus

1. Follow the [How to configure Oculus Quest in MRTK using the XR SDK pipeline](../supported-devices/oculus-quest-mrtk.md) guide to the end. The guide outlines the steps needed to configure both Unity and MRTK to use the XR SDK pipeline for the Oculus Quest.

### OpenXR

> [!IMPORTANT]
> OpenXR in Unity is only supported on Unity 2020.2 and higher.
> It also only supports x64, ARM, and ARM64 builds.

1. Follow the [Using the Mixed Reality OpenXR Plugin for Unity](/windows/mixed-reality/develop/unity/mixed-reality-openxr-plugin) guide, including the steps for configuring XR Plugin Management and Optimization to install the OpenXR plug-in to your project. Ensure that the following have successfully installed:
   1. XR Plugin Management
   1. OpenXR Plugin
   1. Mixed Reality OpenXR Plugin
1. Go to Edit > Project Settings.
1. Click on the XR Plug-in Management tab in the Project Settings window.
1. Ensure that Initialize XR on Startup is checked.
1. (**_Optional_**) If targeting HoloLens 2, make sure you're on the UWP platform and select Microsoft HoloLens Feature Set

![Plugin management OpenXR](../features/images/xrsdk/PluginManagementOpenXR.png)

> [!NOTE]
> If you have a pre-existing project that is using MRTK from UPM, make sure that the following line is in the **link.xml** file located in the MixedRealityToolkit.Generated folder.

`<assembly fullname = "Microsoft.MixedReality.Toolkit.Providers.OpenXR" preserve="all"/>`

> [!NOTE]
> For the initial release of MRTK and OpenXR, only the HoloLens 2 articulated hands and Windows Mixed Reality motion controllers are natively supported. Support for additional hardware will be added in upcoming releases.

## Configuring MRTK for the XR SDK pipeline

::: moniker range=">= mrtkunity-2021-05"
Use any of the default MRTK profiles, which are all configured across Unity's XR pipelines. The previous "DefaultOpenXRConfigurationProfile" and "DefaultXRSDKConfigurationProfile" are now labeled obsolete.
::: moniker-end
::: moniker range="< mrtkunity-2021-05"
If using OpenXR, choose "DefaultOpenXRConfigurationProfile" as the active profile or clone it to make customizations.

If using other XR runtimes in the XR Plug-in Management configuration, like Windows Mixed Reality or Oculus, choose "DefaultXRSDKConfigurationProfile" as the active profile or clone it to make customizations.

These profiles are set up with the correct systems and providers, where needed. See [the profiles docs](../features/profiles/profiles.md#xr-sdk) for more information on profile and sample support with XR SDK.
::: moniker-end

To migrate an existing profile to XR SDK, the following services and data providers should be updated.
::: moniker range=">= mrtkunity-2021-05"
You will be able to see the new data providers under the XR SDK tab in Unity 2019, or in the main/only view in Unity 2020+, where legacy XR doesn't exist.

![The XR SDK tab](../features/images/xrsdk/XrsdkTabView.png)
::: moniker-end

### Camera

::: moniker range=">= mrtkunity-2021-05"
Add the following data providers
::: moniker-end
::: moniker range="< mrtkunity-2021-05"
From [`WindowsMixedReality.WindowsMixedRealityCameraSettings`](xref:Microsoft.MixedReality.Toolkit.WindowsMixedReality.WindowsMixedRealityCameraSettings)

![Legacy camera settings](../features/images/xrsdk/CameraSystemLegacy.png)

to
::: moniker-end

::: moniker range=">= mrtkunity-2021-05"
| OpenXR Plugin | Windows XR Plugin |
|---------------|-------------------|
| [`XRSDK.OpenXR.OpenXRCameraSettings`](xref:Microsoft.MixedReality.Toolkit.XRSDK.OpenXR.OpenXRCameraSettings) | [`XRSDK.WindowsMixedReality.WindowsMixedRealityCameraSettings`](xref:Microsoft.MixedReality.Toolkit.XRSDK.WindowsMixedReality.WindowsMixedRealityCameraSettings) |
| [`GenericXRSDKCameraSettings`](xref:Microsoft.MixedReality.Toolkit.XRSDK.GenericXRSDKCameraSettings) | [`GenericXRSDKCameraSettings`](xref:Microsoft.MixedReality.Toolkit.XRSDK.GenericXRSDKCameraSettings) |
::: moniker-end
::: moniker range="< mrtkunity-2021-05"
| OpenXR Plugin | Windows XR Plugin |
|---------------|-------------------|
| | [`XRSDK.WindowsMixedReality.WindowsMixedRealityCameraSettings`](xref:Microsoft.MixedReality.Toolkit.XRSDK.WindowsMixedReality.WindowsMixedRealityCameraSettings) |
| [`GenericXRSDKCameraSettings`](xref:Microsoft.MixedReality.Toolkit.XRSDK.GenericXRSDKCameraSettings) | [`GenericXRSDKCameraSettings`](xref:Microsoft.MixedReality.Toolkit.XRSDK.GenericXRSDKCameraSettings) |
::: moniker-end

![XR SDK camera settings](../features/images/xrsdk/CameraSystemXRSDK.png)

### Input

::: moniker range=">= mrtkunity-2021-05"
Add the following data providers
::: moniker-end
::: moniker range="< mrtkunity-2021-05"
From [`WindowsMixedReality.Input.WindowsMixedRealityDeviceManager`](xref:Microsoft.MixedReality.Toolkit.WindowsMixedReality.Input.WindowsMixedRealityDeviceManager)

![Legacy input settings](../features/images/xrsdk/InputSystemWMRLegacy.png)

to
::: moniker-end

| OpenXR Plugin | Windows XR Plugin |
|---------------|-------------------|
| [`OpenXRDeviceManager`](xref:Microsoft.MixedReality.Toolkit.XRSDK.OpenXR.OpenXRDeviceManager) | [`XRSDK.WindowsMixedReality.WindowsMixedRealityDeviceManager`](xref:Microsoft.MixedReality.Toolkit.XRSDK.WindowsMixedReality.WindowsMixedRealityDeviceManager) |

__OpenXR__:

![OpenXR input settings](../features/images/xrsdk/InputSystemOpenXR.png)

__Windows Mixed Reality__:

![XR SDK input settings](../features/images/xrsdk/InputSystemWMRXRSDK.png)

### Boundary

::: moniker range=">= mrtkunity-2021-05"
Add the following data providers
::: moniker-end
::: moniker range="< mrtkunity-2021-05"
From [`MixedRealityBoundarySystem`](xref:Microsoft.MixedReality.Toolkit.Boundary.MixedRealityBoundarySystem)

![Legacy boundary settings](../features/images/xrsdk/BoundarySystemLegacy.png)

to
::: moniker-end

| OpenXR Plugin | Windows XR Plugin |
|---------------|-------------------|
| [`XRSDKBoundarySystem`](xref:Microsoft.MixedReality.Toolkit.XRSDK.XRSDKBoundarySystem) | [`XRSDKBoundarySystem`](xref:Microsoft.MixedReality.Toolkit.XRSDK.XRSDKBoundarySystem) |

![XR SDK boundary settings](../features/images/xrsdk/BoundarySystemXRSDK.png)

### Spatial awareness

::: moniker range=">= mrtkunity-2021-05"
Add the following data providers
::: moniker-end
::: moniker range="< mrtkunity-2021-05"
From [`WindowsMixedReality.SpatialAwareness.WindowsMixedRealitySpatialMeshObserver`](xref:Microsoft.MixedReality.Toolkit.WindowsMixedReality.SpatialAwareness.WindowsMixedRealitySpatialMeshObserver)

![Legacy spatial awareness settings](../features/images/xrsdk/SpatialAwarenessLegacy.png)

to
::: moniker-end

::: moniker range=">= mrtkunity-2021-05"
| OpenXR Plugin | Windows XR Plugin |
|---------------|-------------------|
| [`XRSDK.OpenXR.OpenXRSpatialAwarenessMeshObserver`](xref:Microsoft.MixedReality.Toolkit.XRSDK.OpenXR.OpenXRSpatialAwarenessMeshObserver) (for UWP) | [`XRSDK.WindowsMixedReality.WindowsMixedRealitySpatialMeshObserver`](xref:Microsoft.MixedReality.Toolkit.XRSDK.WindowsMixedReality.WindowsMixedRealitySpatialMeshObserver) (for UWP) |
| [`XRSDK.GenericXRSDKSpatialMeshObserver`](xref:Microsoft.MixedReality.Toolkit.XRSDK.GenericXRSDKSpatialMeshObserver) (for non-UWP) | |
::: moniker-end
::: moniker range="< mrtkunity-2021-05"
| OpenXR Plugin | Windows XR Plugin |
|---------------|-------------------|
| [`XRSDK.GenericXRSDKSpatialMeshObserver`](xref:Microsoft.MixedReality.Toolkit.XRSDK.GenericXRSDKSpatialMeshObserver) | [`XRSDK.WindowsMixedReality.WindowsMixedRealitySpatialMeshObserver`](xref:Microsoft.MixedReality.Toolkit.XRSDK.WindowsMixedReality.WindowsMixedRealitySpatialMeshObserver) |
::: moniker-end

![XR SDK spatial awareness settings](../features/images/xrsdk/SpatialAwarenessXRSDK.png)

### Controller mappings

If using custom controller mapping profiles, open one of them and run the Mixed Reality Toolkit -> Utilities -> Update -> Controller Mapping Profiles menu item to ensure the new XR SDK controller types are defined.

## See also

* [Getting started with AR development in Unity](https://docs.unity3d.com/Manual/AROverview.html)
* [Getting started with VR development in Unity](https://docs.unity3d.com/Manual/VROverview.html)

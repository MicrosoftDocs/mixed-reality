---
title: Profiles
description: Documentation Profiles in MRTK
author: RogPodge
ms.author: roliu
ms.date: 01/12/2021
ms.localizationpriority: high
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Profiles,
---

# Profiles

One of the main ways that the MRTK is configured is through the profiles available in the foundation package. The main [`MixedRealityToolkit`](xref:Microsoft.MixedReality.Toolkit.MixedRealityToolkit) object in a scene will have the active profile, which is a ScriptableObject. The top level MRTK Configuration Profile contains sub-profile data for each core of the primary core systems, each of which are designed to configure the behavior of their corresponding subsystems. Furthermore, these sub-profiles are also ScriptableObjects and thus can contain references to other profile objects one level below them. There is essentially an entire tree of connected profiles that make up the configuration information for how to initialize the MRTK subsystems and features.

For example, the input system's behavior is governed by an input system profile, like the `DefaultMixedRealityInputSystemProfile` (Assets/MRTK/SDK/Profiles).

<img src="../images/profiles/input_profile.png" width="650px" alt="Input profile" style="display:block;">
<sup>Profile Inspector</sup>

## Background

Profiles are mainly intended to support specific scenarios across multiple devices, which are handled via the data providers. This way, an app can be designed as device-agnosticly as possible and let the MRTK and the profile's data providers handle cross-platform support.

There are also profiles built around the input features of specific devices, such as the HoloLens 1 profile which defaults to GGV-style interactions.

## XR SDK

Currently, there are two profiles provided for XR SDK, `DefaultXRSDKConfigurationProfile` and `DefaultHoloLens2XRSDKConfigurationProfile`. As a result, not all samples scenes are fully supported due to scene- and scenario-specific configurations. Any samples that use `DefaultMixedRealityToolkitConfigurationProfile` and `DefaultHoloLens2ConfigurationProfile` _can_ be swapped over to their corresponding XR SDK profiles. If you're using OpenXR with XR SDK, use the `DefaultOpenXRConfigurationProfile` instead.

Additional work is being undertaken to ease configuration and support all sample scenes, allowing for both legacy XR and XR SDK to be configured side-by-side. See issue [#9419](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/9419) for tracking.

See [Configuring MRTK for the XR SDK pipeline](../../configuration/getting-started-with-mrtk-and-xrsdk.md#configuring-mrtk-for-the-xr-sdk-pipeline) for more information on converting profiles between legacy XR and XR SDK.

## Default profile

The MRTK provides a set of default profiles which cover most platforms and scenarios that the MRTK supports. For example, when you select the `DefaultMixedRealityToolkitConfigurationProfile` (Assets/MRTK/SDK/Profiles) you will be able to try out scenarios on VR (OpenVR, WMR) and HoloLens (1 and 2).

Note that because this is a general use profile, it's not optimized for any particular use case. If you want to have
more performant/specific settings that are better on other platforms, see the other profiles below, which are slightly tweaked to be better on their respective platforms.

## HoloLens 2 profile

The MRTK also provides a default profile that is optimized for deployment and testing on
the HoloLens 2: `DefaultHoloLens2ConfigurationProfile` (Assets/MRTK/SDK/Profiles/HoloLens2).

When prompted to choose a profile for the MixedRealityToolkit object, use this profile instead
of the default selected profile.

The key differences between the HoloLens2 profile and the Default Profile are:

**Disabled** features:

- [Boundary system](../boundary/boundary-system-getting-started.md)
- [Teleport system](../teleport-system/teleport-system.md)
- [Spatial awareness system](../spatial-awareness/spatial-awareness-getting-started.md)
- [Hand mesh visualization](../input/hand-tracking.md) (due to performance overhead)

**Enabled** systems:

- The [eye tracking provider](../input/eye-tracking/eye-tracking-main.md)
- Eye input simulation

Camera profile settings are set to match so that the editor quality and player quality are the same. This is different from the default camera profile where opaque displays are set to a higher quality. This change means that in-editor quality will be lower, which will more closely match what will be rendered on the device.

> [!NOTE]
> The Spatial Awareness system is turned off by default based on client feedback - it is an interesting visualization to see
> initially but is typically turned off to avoid the visual distraction and the additional performance hit of
> having it on. The system can be re-enabled by following the [instructions here](../spatial-awareness/spatial-awareness-getting-started.md).

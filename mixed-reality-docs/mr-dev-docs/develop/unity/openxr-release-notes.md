---
title: Mixed Reality OpenXR plugin release notes
description: Stay up-to-date on the latest release notes and upgrades to the Mixed Reality OpenXR plugin.
author: hferrone
ms.author: v-vtieto
ms.date: 06/18/2021
ms.topic: article
ms.localizationpriority: high
keywords: up-to-date, tools, get started, basics, unity, visual studio, toolkit, mixed reality headset, windows mixed reality headset, virtual reality headset, installation, Windows, HoloLens, emulator, unreal, openxr
---

# Mixed Reality OpenXR plugin release notes

## 1.1.1 - 2021-10-15

* Fixed a bug where projects would fail to build if the project also referenced DotNetWinRT package.

## 1.1.0 - 2021-10-07

* Added new APIs for spatial anchor transfer batch: Microsoft.MixedReality.OpenXR.XRAnchorTransferBatch
* Supports the XRMeshSubsystem through OpenXR scene understanding extensions.
* Supports OpenXR remoting runtime 2.7, with Spatial Anchor Store and Surface mapping in Holographic Remoting apps.
* Removed direct package dependency to ARSubsystem package.  It's now implicit through ARFoundation package.
* Fixed a bug where Unity's UI froze briefly when Holographic Remoting failed to connect to remote player app.
* Fixed a bug where persisted anchor may lead to error saying "An item with the same key has already been added."
* Supports the ratified "XR_MSFT_scene_understanding" extension instead of "_preview3" version.
* Fixed a bug where projects would fail to build with Windows XR Plugin installed and app remoting enabled.

## 1.0.3 - 2021-09-07

* Supports the OpenXR spatial anchor persistence MSFT extension.
* Fixed a bug where Editor Remoting settings are present in PackageSettings instead of UserSettings.
* Fixed a bug where some anchors could fail to be persisted after clearing the XRAnchorStore.
* Fixed a bug where extra anchors were created when switching between Unity scenes.

## 1.0.2 - 2021-08-05

* Depends on Unity's 1.2.8 OpenXR plugin.
* Fixed a bug where ARAnchors were occasionally not removed properly.
* Fixed a bug where invalid ARAnchor changes were occasionally reported after restarting Holographic Remoting for Play Mode.
* Fixed a bug where view configurations were not properly reported when using Holographic Remoting for Play Mode.
* Added more specific settings validation with more precise messages when using Holographic Remoting for Play Mode.
* Added validation for "Initialize XR on Startup" setting when using Holographic Remoting for Play Mode.

## 1.0.1 - 2021-07-13

* Depends on Unity's 1.2.3 OpenXR plugin.
* Updated Holographic Remoting runtime to 2.6.0
* Removed the "Holographic Remoting for Play Mode" feature group from Unity settings UX and kept the feature independent.
* Fixed a bug where build process cannot find the app.cpp when building a XAML-type Unity project.

## 1.0.0 - 2021-06-18

* Fixed a bug where the XRAnchorSubsystem was always started on app start regardless ARAnchorManager's present.
* Fixed a bug where the reprojection mode didn't work properly.

## 1.0.0-preview.2 - 2021-06-14

* Depends on Unity’s 1.2.2 OpenXR plugin.
* Changed Holographic Remoting features in to individual feature groups.
* Fixed a bug where “Apply HoloLens 2 project settings” changes project color space. This is no longer needed after Unity OpenXR 1.2.0 plugin.
* Fixed a bug where a input device get connected without disconnect after application suspended and resumed.
* Added support for detecting plugin and current tracking states via ARSession.
* Fixed a bug where the “AR Default Plane” ARFoundation prefab wouldn’t be visible.

## 1.0.0-preview.1 - 2021-06-02

* Supports OpenXR scene understanding MSFT extensions instead of preview extensions.
* Plane detection on HoloLens 2 no longer requires preview versions of the Mixed Reality OpenXR runtimes.

## 0.9.5 - 2021-05-21

* Depends on Unity’s 1.2.0 OpenXR Plugin
* Adapted to the new feature UI (in OpenXR Plugin 1.2.0) for configuration.
* Fixed a bug where the locatable camera provider wasn’t properly unregistering.
* Cleaned up some extra usages of [Preserve].
* Update “HP Reverb G2 Controller (OpenXR)” name in the input system UI.

## 0.9.4 - 2021-05-20

* Depends on Unity’s 1.2.0 OpenXR Plugin.
* Added new C# API to get motion controller glTF model.
* Added new C# API to get enabled view configurations and set reprojection settings.
* Added new C# API to set additional settings for computing meshes with XRMeshSubsystem.
* Added new C# API to configure and subscribe to gesture recognition events.
* Added Windows->XR->Editor Remoting settings dialog.
* Added ARM support for HoloLens UWP applications.

## 0.9.3 - 2021-04-29

* Fixed a bug where Holographic remoting connection is not reliable
* Fixed a bug where the VR rendering performance is sub-optimum after upgrade to Unity’s 1.1.1 OpenXR plugin.

## 0.9.2 - 2021-04-21

* Plane detection on HoloLens 2 in plugin version 0.9.1 will work with version 105 of the Mixed Reality OpenXR preview runtime.
* Plane detection on HoloLens 2 in plugin version 0.9.2 will work with version 106 of the Mixed Reality OpenXR preview runtime.
* Removed some unused callbacks from InputProvider to prevent calls like XRInputSubsystem.* GetTrackingOriginMode (which aren’t managed by our input system) from returning success with misleading values.
* Split out deprecated version of XRAnchorStore into its own file to prevent Unity console warning.

## 0.9.1 - 2021-04-20

* Depends on Unity’s 1.1.1 OpenXR Plugin.
* Added support for Holographic Remoting application for UWP platform.
* Fix UnityException where XRAnchorStore was trying to get a settings instance outside the main thread.

## 0.9.0 - 2021-03-29

* Added support for spatial mapping via XRMeshSubsystem and ARMeshManager.
* Added new C# API to get OpenXR handles to support other Unity packages consumes OpenXR extensions.
* Added new C# API to interop with Windows.Perception APIs to support other Unity packages consuming Perception WinRT APIs.
* Removed interaction profiles from required features in Windows Mixed Reality feature set, so developers can choose the motion controllers they tested with.
* Added Holographic editor remoting feature validator to help users to setup editor remoting properly.
* Fixed a bug where Unity editor crashes when exiting Holographic editor remoting mode after connection failure.
* Fixed a bug where unpremultipled alpha textures leads to sub-optimum performance on HoloLens 2.
* Fixed a bug where hand tracking was not located correctly when the scene origin was at floor level.
* Fixed a bug where hand mesh tracking disappear after leaving and loading a new scene.
* Fixed a bug where locatable camera provider didn’t properly clean up.
* Changed the namespace of XRAnchorStore API to Microsoft.MixedReality.OpenXR.

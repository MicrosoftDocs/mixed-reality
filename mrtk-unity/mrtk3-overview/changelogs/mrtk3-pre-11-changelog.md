---
title: MRTK3 pre.11 changelog
description: Changelog for MRTK3 pre.11
author: MaxWang-MS
ms.author: wangmax
ms.date: 9/12/2022
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, MRTK3 preview, MRTK3 public preview, changelog, MRTK3 changelog
---

# Changelog for MRTK3 pre.11

### [pre.11] - 2022-09-12 - `fa26baf`
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/). The release announcement is available [here](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/...............) under the [releases category of the discussions tab in our repo](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/categories/releases).

### Added
- Added a unified `IPoseSource` interface for sharing pose logic across several components
- Added support support for Unity's Project Validation system
- Added 3D app icon setting for UWP
- Added menu items to intelligently create canvas-based buttons in the hierarchy
- Added BurstAotSettings to the sample Unity project
- Added the ability to load controller models from the platform
- Added `CameraFOVChecker` from MRTK2

### Changed
- **Breaking:** `CameraCache` is now removed in favor of Unity's performant `Camera.main` implementation
- **Breaking:** The UX prefabs are now split into two packages: `MRTK UX Components` and `MRTK UX Components (Non-Canvas)`
- **Breaking:** Changed the default color space to Linear and adjusted materials accordingly
- **Breaking:** Removed empty `GazeController`
- Updated MRTK3 Core Definitions' dependencies to require Unity's XR Core Utilities 2.1.0-pre.1
- Updated the Mixed Reality OpenXR plugin to 1.5.0
- Updated the Unity OpenXR plugin to 1.5.1
- Moved to a custom `AndroidManifest.xml` file to enable `TouchScreenKeyboard` on Meta Quest
- Improved the visual and default configuration of TabView
- Refactored `HandBasedPoseSource` out of `HandJointPoseSource`
- Updated `InterfaceSelector` to use Unity `TypeCache`
- Updated Microsoft.Unity.Analyzers.dll to 1.14.0
- Updated dependencies in package manifests
- Removed  old No Pre Init loader
- Updated FollowJoint to use serialization callbacks for migration
- Moved the magic window sample into its own scene
- Updated hand menu & near menu prefabs and examples to be canvas-based
- Updated tracking state mapping for base hand controller prefab
- Obsoleted `ArticulatedHandController`'s `PinchPose`
- Improved reset logic for hand data
- Removed duplicate `PlayspaceUtilities.ReferenceTransform.rotation` application in `MRTKRayInteractor`

### Fixed
- Fixed an issue in StateViz preventing it from keeping track of individual colors
- Fixed a warning message from the cheese model
- Fixed a warning message from the MRTK Logo model
- Fixed some physics issues related to `ObjectManipulator` and the `HandInteractionExample` scene
- Fixed incorrect transition time and missing font icon reference in the Action Button prefab
- Fixed eye gaze simulation when XR isn't enabled

## Known issues

When the following conditions are met:
- Oculus OpenXR is selected as the Play Mode OpenXR Runtime for the standalone platform, and
- Initialize XR on Startup is checked for the standalone platform, and
- The computer is not connected to a headset (via cable or wireless),

Unity editor may frequently freeze. This is a Unity bug introduced in Unity OpenXR plugin 1.5.
To workaround the issue, please use a non-Oculus Play Mode OpenXR Runtime for the standalone platform, or uncheck Initialize XR on Startup under **Edit** > **Project Settings** > **XR Plug-in Management** > **Standalone** while iterating in the editor, or connect to a headset before entering play mode in editor.

## Breaking changes

- The UX prefabs are now split into two packages: `MRTK UX Components` and `MRTK UX Components (Non-Canvas)`
    - TODO: more explanation
- Changed the default color space to Linear and adjusted materials accordingly
    - TODO: more explanation
- `CameraCache` is now removed in favor of Unity's performant `Camera.main` implementation
    - TODO: more explanation
- Removed empty `GazeController`
    - `ArticulatedHandController` provides equivalent functionality
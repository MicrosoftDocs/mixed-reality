---
title: MRTK3 pre.9 changelog
description: Changelog for MRTK3 pre.9
author: maxwang-ms
ms.author: wangmax
ms.date: 08/08/2022
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, MRTK3 preview, MRTK3 public preview, changelog, MRTK3 changelog
---

# Changelog for MRTK3 pre.9

## [pre.9] - 2022-08-03 - `2ed522e`

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/). The full release announcement is available [here](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/10824) under the [releases category of the discussions tab in our repo](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/categories/releases).

### Added
- Added tracking state actions to MRTK Default Input Actions
- Added a fallback to an internal hand ray implementation in `ArticulatedHandController` when no pointing pose is available
- Added a fallback to the palm pose rotation in `GazePinchInteractor` if the parent controller's bound device has no rotation action bound
- Added an example script for curving Canvas ScrollRects. See it in action in the `VirtualizedScrollRectList` sample scene, or try adding it to your own ScrollRect! Thanks @maluoi!
- Added `maintainGlobalSize` option to `BoundsHandleInteractable`, to allow developers to customize handle size behavior as `BoundsControl` grows and shrinks

### Changed
- Improved performance on pre-2021 Unity projects by removing `HasFlag` calls
- Improved performance in certain hot paths by trimming LINQ and GetComponent calls
- Changed XR Rig prefab to bind `XRController`s to the new tracking state actions
- Updated some TrackedHandJoint enum references to the new names
- Updated XRI to 2.0.2
- Made `BoundsHandleInteractable` `public`, instead of `internal`

### Fixed
- Fixed a bug in the index finger length calculation in `MRTKHandsAggregator`
- Fixed `TapToPlace` hiding `OnDisable` in the base class
- Fixed `FontIconExample`'s description plate to not be "wonky" anymore
- Fixed a null reference exception in solver registration
- Fixed the znear/far values being poorly configured in the sample project
- Fixed some sample scenes missing the `SampleSceneHandMenu`
- Fixed the icons on the `SampleSceneHandMenu`
- Fixed `allowSwitchOff` in `ToggleCollection` not being applied correctly when set in the editor at runtime
- Fixed the "Select" voice command keyboard not working in MRTK3 on OpenXR. Note: the fix requires Mixed Reality OpenXR plugin 1.5 or above
- Fixed the Action Button prefab using the wrong kind of TextMeshPro
- Fixed audio spatialization settings on the audio example scenes
- Fixed button problems in the audio example scenes
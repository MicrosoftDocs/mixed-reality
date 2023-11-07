---
title: MRTK3 pre.13 changelog
description: Changelog for MRTK3 pre.13
author: Zee2
ms.author: finnsinclair
ms.date: 1/5/2023
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, MRTK3 preview, MRTK3 public preview, changelog, MRTK3 changelog
---

# Changelog for MRTK3 pre.13

## [pre.13] - 2023-1-5 - [`a918e44`](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/commit/a918e44)

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/). The full release announcement is available [here](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/11351) under the [releases category of the discussions tab in our repo](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/categories/releases).

### Added

- Added reasonable-default ARCore loader/settings assets to MRTKDevTemplate ([#11167](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11167))
- Added Unity's Android logcat package for improved debugging on Android ([#11167](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11167))
- Added missing `.npmrc`s in individual packages ([#11136](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11136))
- Added `IsContextuallyRelevant` to `DescribableObject` ([#11143](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11143))
- Added a handy `HasAnyControls` utility method to check if an action has any controls bound ([#11181](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11181))
- Added support for custom min/max ranges for sliders ([#11192](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11192))
- Added `SpeechRecognitionSubsystem` definition ([#11157](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11157))
- Added `WindowsSpeechRecognition` implementation of the `SpeechRecognitionSubsystem` ([#11157](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11157))
- Added new physically accurate options for customizing rigidbody grab and fling behavior ([#11032](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11032))
- Added a button to automatically populate an empty MRTK Profile field with the default MRTK profile asset ([#11259](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11259))
- Added a default Audio Mixer + mixer group for use with the new spatializer package ([#11271](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11271))
- Added a `SpatializationMixer` property to `MRTKProfile` so scripts can look up a reference to the correct spatializer mixer to use at runtime ([#11271](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11271))
- Added `ConfigureSpatializationSettings` which can be used to ensure audio sources are properly connected to the spatializer mixer at runtime ([#11271](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11271))
- Added additional UI controls (`UI/MRTK/Canvas`, `UI/MRTK/Canvas + Graphic Raycasting`, `UI/MRTK/Plate`, and `UI/MRTK/List Menu`) to the `UI/MRTK/` menu. ([#11281](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11281))
- Added the brand-new, overhauled Dialog 2.0 API for efficient and extensible runtime dialog popups ([#11113](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11113))
- Added tests for the new Dialog 2.0 API ([#11113](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11113))
- Added math utilities for dealing with byte buffers ([#11209](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11209))
- Added `WindowsTextToSpeechSubsystem` implementation ([#11209](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11209))
- Added a parameter to control the max length of the hand ray gradient ([#11313](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11313))
- Added `USE_INPUTSYSTEM_POSE_CONTROL` define symbol to opt in to the input system pose refactor

### Changed

- Excluded Oculus Integration Package from git tracking, for better development workflow while using OIP + OpenXR ([#11167](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11167))
- Changed background of default Android app icon to black ([#11167](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11167))
- Added `HandheldRAInputDevice` pose paths to our camera pose driver ([#11167](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11167))
- Bumped minimum Android SDK version to 29 ([#11167](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11167))
- Removed `DescribableFlag` ([#11143](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11143))
- Changed `StatefulInteractable` to use new-ish C# syntax for implicit backing fields ([#11144](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11144))
- Bumped MR OpenXR Plugin version to 1.6.0 ([#11163](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11163))
- Bumped XRI version to 2.2 ([#11164](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11164))
- Refactored out EventSystems in sample scenes to a reusable prefab that contains an `XRUIInputModule` ([#11170](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11170))
- Reserialized hand controller prefabs + cleaned up overrides ([#11182](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11182))
- Removed unnecessary `HandsAggregatorConfig` type ([#11157](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11157))
- Overhauled the algorithms for rigidbody grab and fling, using critically dampened springs, new optional torque settings, and ensured all physics operations were occurring in FixedUpdate (Thanks @NorbertNemec!) ([#11032](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11032))
- Bumped sample project version to 2020.3.42f1 and indicated that it's our new minimum version (for IL2CPP fixes) ([#11213](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11213))
- Renamed UITearsheet to NonCanvasUITearsheet ([#11255](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11255))
- Renamed ObjectBarExample to NonCanvasObjectBarExample ([#11255](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11255))
- Renamed UIBackplateExample to NonCanvasUIBackplateExample ([#11255](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11255))
- **Breaking:** Refactored `DescribableObject*` into `AccessibleObject*` ([#11261](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11261))
- **Breaking:** Replaced `ComponentRole` enum with a set of scriptable objects for better extensibility ([#11261](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11261))
- Updated Microsoft Spatializer to v2.37 ([#11271](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11271))
- Changed default UWP OpenXR settings to include the Microsoft Motion Controller interaction profile, to match Standalone ([#11194](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11194))
- Moved existing/legacy Dialog APiI into the `UX.Deprecated` namespace and into the `Legacy Dialog` folder ([#11113](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11113))
- Updated MR OpenXR Plugin to 1.7.0 ([#11303](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11303))
- **Breaking:** Refactored `TextToSpeechSubsystem.Speak` into `TextToSpeechSubsystem.TrySpeak`, returning a `Task<bool>` for async TTS jobs ([#11209](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11209))
- Style updates and cleanup, including using tuple swaps, more (safe) use of `??=`, `TryGetComponent`, `SetPositionAndRotation`, and other optimizations ([#11314](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11314))
- **Breaking:** Burninated all API surface that marked obsolete more than 5 months ago ([#11326](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11326))
- **Breaking (Editor only):** Removed `MixedRealityInspectorUtility`, moving part of its functionality into `InspectorUIUtility` and the rest into `MRTKEditorStyles` ([#11330](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11330))
- **Breaking (Editor only):** Refactored `MixedRealityStylesUtility` into `MRTKEditorStyles` ([#11330](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11330))
- **Breaking (Editor only):** Removed scriptable object foldout utility (will be replaced by the new XR Coreutils Datums) ([#11330](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11330))
- Reorganized folders inside `Core/Editor` ([#11330](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11330))
- Improved doccomments/documentation for several core utilities and types ([#11330](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11330))
- **Breaking (Editor only):** Renamed various `*Inspector` classes to `*Editor` for clarity and consistency ([#11330](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11330))

### Fixed

- Fixed uses of `InputActionProperty`s not properly using `Enable/DisableDirectAction` ([#11133](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11133))
- Fixed `InterfaceSelectorDrawer` not accounting for the type being an array/list ([#11183](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11183))
- Fixed `GrabBar` material's incorrect package location ([#11180](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11180))
- Fixed a bug where the reticle didn't get disabled when its visual script was disabled ([#11204](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11204))
- Fixed rotation singularity errorspam when setting reticle orientation ([#11204](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11204))
- Fixed missing Follow functionality in legacy/non-Canvas Slate prefab ([#11255](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11255))
- Removed extraneous click handlers from Slate buttons that would cause the slate to close ([#11255](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11255))
- Fixed incorrect icons on the base Slate prefab ([#11255](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11255))
- Removed broken prefab references in the tearsheet scene ([#11255](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11255))
- Fixed "Using the Dialog control with the Canvas Dialog prefab from the UX components throws an exception" #10888  ([#11113](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11113))
- Fixed "UI Tear Sheet Dialog examples have an additional PressableButton spanning the width as the expected two buttons" #10893 ([#11113](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11113))
- Fixed "Dialog near/far broken; needs to be refactored to properly scalable Canvas dialogs" #10812 ([#11113](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11113))
- Resolved "Unit tests for MRTK3 Dialog" #11223 ([#11113](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11113))
- Fixed "PressableButton inspector throws errors when no BoxCollider present" #11270 ([#11296](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11296))
- Fixed "PressableButton inspector doesn't visualize changes to push planes when manually entered" #11295 ([#11296](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11296))
- Fixed build error caused by breakage in Unity OpenXR Plugin ([#11303](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11303))
- Fixed Android build issues and icon import errors ([#11307](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11307))
- Fixed hand interaction polyfill not updating the UI Press controller state ([#11307](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11325))
- Fixed the grab interactor + NearInteractionModeDetector colliders blocking mouse clicks in-editor ([#11328](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11328))
- Fixed incorrect/out of date materials on the rigged hands (optimize/correct for Linear colorspace) ([#11329](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11329))
- Cleaned up some dead code related to legacy Profiles ([#11330](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11330))
- Fixed leftover legacy Dialog window in DialogExample scene ([#11336](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11336))
- Fixed missing hand menu in VanillaUGUIExample scene ([#11336](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11336))
- Fixed incorrect assembly version number for the accessibility package ([#11342](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11342))

## Known issues

- There's a performance regression with the hand ray gradient visuals that causes a small per-frame memory allocation. We'll be fixing this very soon, and you can see more details here [#11343](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11343) and here [#11344](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11344).

## Breaking changes

- There have been some breaking API changes in editor code. Unless you've written custom editor code that depends on `MixedRealityStylesUtility` or `MixedRealityInspectorUtility`, you'll be unaffected.
- See above changelog for several breaking changes to the `TextToSpeechSubsystem` API.
- See above changelog for several breaking changes to the `com.microsoft.mrtk.accessibility` package.
- API that has been already marked obsolete for more than 5 months has been removed; see above for details.

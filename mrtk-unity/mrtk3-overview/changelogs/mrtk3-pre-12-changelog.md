---
title: MRTK3 pre.12 changelog
description: Changelog for MRTK3 pre.12
author: Zee2
ms.author: finnsinclair
ms.date: 10/21/2022
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, MRTK3 preview, MRTK3 public preview, changelog, MRTK3 changelog
---

# Changelog for MRTK3 pre.12

### [pre.12] - 2022-10-21 - `2186746`
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/). The full release announcement is available [here](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/11130) under the [releases category of the discussions tab in our repo](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/categories/releases).

### Added
- Added single-arg overload to `ForceSetToggled` for easier use with UnityEvents ([#11028](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11028))
- Added `PoseSourceDriver` ([#11047](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11047))
- Added planar projection support to `UGUIInputAdapterDraggable` that works across both graphic and physics raycasters ([#11051](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11051))
- Re-added support for pausing tests during debugging ([#11053](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11053))
- Added missing ARFoundation dependency to `mrtk.input` ([#11070](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11070))
- Added describable object features to the Accessibility package (WIP) ([#11021](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11021))
- Added definitions for the future text-to-speech subsystem ([#11076](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11076))
- Added `TransformPose` and `InverseTransformPose` helpers to `PlayspaceUtilities` for properly transforming poses into and out of OpenXR scene-origin-space ([#11035](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11035))
- Ported the remaining missing MRTK2 constraints; note, these will be deprecated soon and replaced with a new, unified system for computing constraints, solvers, and elastics under one "roof"! ([#11085](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11085))
- Added validation rules recommending a glTF importer package ([#11089](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11089))
- Added new sample scene demonstrating recently-added legacy MRTKv2 constraints ([#11104](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11104))

### Changed
- Reticle improvements ([#11022](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11022))
    - Separated reticle logic from line visual logic
    - Added support for swappable reticle icons on the default reticle prefab
    - Added support for showing reticle on non-interactable surfaces
- Removed `IMRTKInteractorVisual` ([#11043](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11043))
- Made `SimulatedEyeGazeDevice` public so developers can check for its existence if necessary ([#11040](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11040))
- Updated VisualProfiler dependency to 2.2.0 ([#11048](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11048))
- Removed custom raycast behavior from `PlatformAwarePhysicsRaycaster` ([#11051](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11051))
- ...which optimized the performance of `PlatformAwarePhysicsRaycaster`
- Removed projection logic from `CanvasProxyInteractor` ([#11051](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11051))
- `UGUIInputAdapterDraggable` now implements `IInitializePotentialDragHandler`, allowing us to disable drag-thresholding ([#11051](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11051))
- Updated XR Core Utils dependency to `2.1.0` ([#11054](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11054))
- Removed unused `DisabledInteractorTypes` collection from `MRTKBaseInteractable` ([#11061](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11061))
- **Prefab breaking:** Simplified NearMenu and HandMenu prefabs to use only a single modular prefab ([#11030](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11030))
    - See Action Item above for migration, .zip attached
- **Breaking-ish:** Removed environment package ([#11069](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11069))
- Reorganized interactor visual components to allow future use of `IXRCustomReticleProvider` ([#11066](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11066))
- **Breaking:** Refactored the XR Rig and `PlayspaceUtilities` to properly take user's height relative to the floor into account; user's head will now be placed at their proper absolute height, based on either Guardian/Chaperone floor calibration or a fallback height value specified in the `XROrigin` ([#11035](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11035))
- Deprecated `PlayspaceUtilities.ReferenceTransform`, see `PlayspaceUtilities.XROrigin.CameraFloorOffsetObject` and `PlayspaceUtilities.TransformPose(Pose pose)` ([#11035](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11035))
- Adjusted all sample scene content to be placed at head height ([#11035](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11035))
- Removed extraneous ProxyInteractors from sample scenes ([#11035](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11035))
- Refactored input simulator to use `Pose` structs for internally managing device and HMD poses ([#11035](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11035))
- Changed `SqueezableBoxVisuals` to allow no box renderer ([#11087](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11087))
- Moved some leftover scripts from `uxcomponents` to `uxcore` ([#11090](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11090))

### Fixed
- Fixed incorrect backplate material on the new HandMenu/NearMenu prefabs ([#11009](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11009))
- Fixed incorrect corner radii on the new HandMenu/NearMenu prefabs ([#11012](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11012))
- Fixed ToggleCollection behavior when a toggle slot is null ([#11034](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11034))
- Fixed incorrect gazepinch manipulation calculations causing wonky slider + rotation manipulations ([#11056](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11056))
- Fixed gnarly bug with FuzzyGaze target selection + testing ([#11059](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11059))
- Fixed wonky mouse interactions when dragging sliders with orthographic UI cameras by overhauling 2D->3D mouse projection logic ([#11051](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11051))
- Fixed the first select/pinch not firing ([#11060](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11060))
- Fixed various spelling/linting/formatting issues ([#11072](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11072))
- Fixed Ray reticles having the incorrect orientation relative to the surface normal when the user selects ([#11074](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11074))
- Fixed incorrect manipulations with ObjectManipulator when the HostTransform is changed at runtime ([#11075](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11075))
- Fixed LoFiAudio sample scene ([#11035](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11035))
- Fixed SpatialMapping example scene ([#11035](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11035))
- Fixed wonky FuzzyGaze example scene materials ([#11035](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11035))
- Fixed incorrect coordinate space transformations in `PolyfillHandRayPoseSource` ([#11035](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11035))
- Fixed incorrect coordinate space transformations in `ArticulatedHandController` ([#11035](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11035))
- Fixed warning spam from `ReticleMagnetism` regarding closest-point checks on concave meshes. Thanks @camnewnham! ([#11096](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11096))
- Fixed the controller model loader endlessly spamming warnings when on a platform that doesn't support controller models ([#11068](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11068))
- Fixed bugs with how constraints were computed for ObjectManipulators with off-center host transforms ([#11086](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/11086))

## Known issues

- Ray reticles and proximity lights can still jitter in some contexts due to update order issues

## Breaking changes

- The MRTK XR rig has been significantly changed; the user's head will now be at their true, floor-calibrated height, or 1.6m on platforms that don't offer floor-height-calibration.
    - The content in your application will either need to be raised to head height, or if true head height is not desired for your application, select Device-relative mode in the `XROrigin`'s Tracking Origin Mode and set the vertical offset to zero meters.
- We've simplified the hand menu and near menu prefabs; we don't officially offer individual prefabs for each dimension of menu. This removal might break some prefab references, so check out the `OldPrefabs.zip` attached below if you need copies of the old prefabs to fix your references. 
    - [OldPrefabs.zip](https://github.com/microsoft/MixedRealityToolkit-Unity/files/9834344/OldPrefabs.zip)
 - We've removed the environment package. We recommend using Unity's built-in support for playspace boundary queries instead, as well as ARFoundation's `ARMeshManager` for scene reconstruction.

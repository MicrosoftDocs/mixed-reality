---
title: MRTK3 pre.10 changelog
description: Changelog for MRTK3 pre.10
author: Zee2
ms.author: finnsinclair
ms.date: 08/19/2022
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, MRTK3 preview, MRTK3 public preview, changelog, MRTK3 changelog
---

# Changelog for MRTK3 pre.10

## [pre.10] - 2022-08-19 - [`0aebad7`](https://github.com/microsoft/MixedRealityToolkit-Unity/commit/0aebad7)

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/). The full release announcement is available [here](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/10902) under the [releases category of the discussions tab in our repo](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/categories/releases).

### Added

- Added `RiggedHandMeshVisualizer` with associated hand meshes + shaders
- Added URP support for new hand shader
- Added scene name label to sample scene hand menu
- Added option to BoundsControl to scale about the object's center (Thanks @camnewnham!)
- Added `com.microsoft.mrtk.tools` package
- Added a wizard for creating new XR subsystems
- Added `IModeManagedInteractor`, which interactors can implement in order to inform the mode manager of their controller GameObject
- Added `FlatscreenModeDetector`, which detects when flatscreen/2D input should be available.
- Added a flatscreen mode to the InteractionModeManager
- Added support for arbitrary primary/secondary Handshapes with simulated hands in-editor (👌✌)
- Added whiteboard + Canvas examples to HandInteractionExamples sample scene
- Added MagicWindow sample materials + test object to HandInteractionExamples sample scene
- Added See-it-Say-it label components (to be integrated at a later date)
- Added visual feedback to non-Canvas toggle switch affordances

### Changed

- Updated the MR OpenXR plugin to 1.4.4
- Moved several example assets out of StandardAssets (more slimming of StandardAssets is on the way!)
- Updated README with more comprehensive information about supported devices, preview status, and other useful info
- Removed "programmer art" grab reticle
- **Breaking:** InteractionModeManager now works with arbitrary GameObjects instead of only XR controllers
- `CanvasProxyInteractor` is now managed by the InteractionModeManager (implementing the new `IModeManagedInteractor`)
- Optimized `UGUIInputAdapter` to no longer perform repeated expensive queries when no proxy interactor is available
- **Breaking:** `Gesture` and `GestureId` refactored to `Handshape` and `HandshapeId`
- UI polish on the About window
- Polish and visual improvements to sample scenes
- Adjusted margin on legacy ObjectBar prefabs
- Cleaned up extraneous dependencies in asmdefs
- Rewrote font icon selector UI for improved usability, zoomability/scrolling

### Fixed

- Fixed some minor warnings
- Fixed reticles not rendering/hit-testing on Canvas elements
- Fixed BoundsControl not finding ConstraintManagers when not explicitly assigned
- Fixed ToggleCollection bug when the default toggled index was the last element in the list
- Fixed erratic poke reticle behavior when gaining/losing tracking
- Fixed some sample scene objects missing scale constraints
- Fixed simulated devices resetting/breaking when editor/application loses focus
- Fixed (most) tests failing in batch mode by properly leveraging `InputTestFixture`
- Fixed `UGUIInputAdapater`s from loudly complaining if no proxy interactor is available
- Fixed incorrect piano sample event assignments
- Fixed handray fallback behaving incorrectly when rig was transformed

## Known issues

Erroneous thumb joint rotations on Quest will cause deformed thumbs. Hand meshes should render correctly in-editor and on HoloLens (if enabled).

## Breaking changes

- Some parts of the InteractionModeManager interface have changed.
  - `RegisterInteractor` and `UnregisterInteractor` take an `XRBaseController` instead of an `XRBaseControllerInteractor`.
  - `SetInteractionMode` now takes a GameObject instead of an `XRBaseController`.
  - If you've made overrides to your InteractionModeManager in a rig prefab variant, please take care to examine your mode configurations and ensure they are correct after this update! We've changed some of the serialized mode configurations to take advantage of the new mode management features.
- `Gesture`s renamed to `Handshape`s
  - Reducing confusion between poses, gestures, and handshapes
  - `GestureId` renamed to `HandshapeId`
  - In the test harness, `TestHand` and `InputTestUtilities` have several methods renamed and changed to accept `HandshapeId`s

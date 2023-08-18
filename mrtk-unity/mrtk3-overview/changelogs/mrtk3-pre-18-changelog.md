---
title: MRTK3 pre.18 changelog
description: Changelog for MRTK3 pre.18
author: AMollis
ms.author: amollis
ms.date: 8/21/2023
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, MRTK3 preview, MRTK3 public preview, changelog, MRTK3 changelog
---

# Changelog for MRTK3 pre.18

## [pre.18] - 2023-8-21 - [`a194901`](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/commit/a1949013355f7b3561681faf2971647ccd4c6fc4)

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). The full release announcement is available [here](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/discussions/categories/releases) under the [releases category of the discussions tab in our repo](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/categories/releases).

### Added

- A sample scene For Spatial Mouse; ([#11683](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11683))
- A `ComponentCache<T>` class has been added to help cache commonly queries scene components. ([11686](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11686))
- More sample scenes from MRTK2. ([11710](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11710), [11733](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11733), [11734](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11734), [11736](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11736), [11740](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11740), [11744](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11744), [11748](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11748))
- The `UnboundedTrackingMode` component was added to replace the soon-to-be deprecated `Microsoft.MixedReality.OpenXR.EyeLevelSceneOrigin` in Microsoft's Mixed Reality OpenXR Plugin. ([11750](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11750))
- Contribution guidelines have been published to the MRTK3 project. ([10](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/pull/10), [17](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/pull/17))
- More project maintainers from Qualcomm, Magic Leap, and Microsoft have been added. ([7](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/pull/7), [18](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/pull/18), [19](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/pull/19), [21](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/pull/21), [22](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/pull/22))

### Changed

- MRTK3 now requires `com.unity.inputsystem` version 1.6.1 to address Mouse Input issues on HoloLens. ([11661](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11661))
- The `CameraSettingsManager` component is now on the MRTK XR Rig prefab. This component auto configures the main camera's settings based on the device's display type (`Transparent` or `Opaque`). ([11684](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11684), [11685](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11685))
- Refactored duplicate `LocateTargetHitPoint` methods to a common, shared location. ([11699](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11699))
- Moved some misplaced control prefabs to proper directories. ([11707](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11707))
- The `UnboundedTrackingMode` component was added to the MRTK XR Rig prefab. This change only impacts HoloLens 2 applications. ([11750](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11750))
- Changed how applications can create custom reticles in MRTK3. It should be easier now. ([11758](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11758), [9](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/pull/9))
- All namespaces have had `Microsoft` removed, so to align with new MRTK organization. ([1](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/pull/1))
- MRTK3 is now licensed under [BSD 3-Clause](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/blob/main/LICENSE.md). ([2](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/pull/2), [30](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/pull/30))

### Deprecated

- The `com.microsoft.*` packages are now deprecated. Switch to the `org.mixedrealitytoolkit.*` packages instead. ([#31](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/pull/31), [#32](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/pull/32), [#34](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/pull/34))
  
### Removed

- Removed the `SpatializationMixer` property from MRTK3 settings. This property wasn't used in the MRTK3 packages, so was removed for now. This property can be added later, once it has a well-defined use within the MRTK3 packages. ([11681](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11681), [11694](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11694))
- Removed `IVariableReticle` and replaced with `IReticleVisual` and `IVariableProgressReticle`. Depending on the scenario, applications should implement one or both of the new interfaces. ([11758](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11758), [9](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/pull/9))
  
### Fixed

- MRTK3 now compiles in Unity 2022 without automated code changes. ([11668](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11668))
- *See-it-say-it* labels now appear when looking at a button. ([11677](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11677))
- *See-it-say-it* labels only appear if speech input is available. ([11677](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11677))
- The diction example scene works better with the speech recognition subsystem. ([11696](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11696))
- Bounds control handles now reappear after a game object is re-enabled. ([11698](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11698))
- Fixed XML summary block warnings. ([11706](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11706), [11719](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11719), [11723](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11723), [11724](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11724))
- Slider now works with values outside of the default range. ([11742](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11742))
- Cursor visuals are more stability. ([11739](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11739))
- The bounds control no longer "flattens" when applied to a 2D surface. ([12](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/pull/12))

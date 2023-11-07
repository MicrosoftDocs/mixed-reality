---
title: MRTK3 pre.16 changelog
description: Changelog for MRTK3 pre.16
author: AMollis
ms.author: amollis
ms.date: 5/30/2023
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, MRTK3 preview, MRTK3 public preview, changelog, MRTK3 changelog
---

# Changelog for MRTK3 pre.16

## [pre.16] - 2023-5-30 - [`b4b1684`](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/commit/b4b16846089de0fb5349e31bc26b8609e4bd5b04)

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/). The full release announcement is available [here](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/11586) under the [releases category of the discussions tab in our repo](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/categories/releases).

### Added

- Added Non-native Keyboard to MRTK3 ([#11549](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11549))
- Added Dictation to Non-Native Keyboard ([#11560](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11560))
- Added Multi-Line, RTL Text, and Better Caret Support to Keyboard Preview and Non-Native Keyboard ([#11566](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11566))
- Added a release candidate pipeline ([#11562](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11562))

### Changed

- Updated MRTK3 package dependencies that weren't updated to use com.unity.xr.interaction.toolkit 2.3.0 ([#11542](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11542))
- Modified the CI pipeline to produce packages with a date code and an optional prerelease tag ([#11546](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11546))
- Updated Non-Canvas Dialog Prefab ([#11563](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11563))

### Fixed

- Fixed edge case duplication bug in VirtualizedScrollRectList ([#11538](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11538))
- Fixed SolverHandler issues when `Handedness` flag is set to `Everything` (that is, 0xFFFFFFFF or -1) ([#11543](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11543))
- Fixed MRTK3's Tap to Place solver to work with any hand and interactor ([#11545](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11545))
- Fixed execution order with ProximityLights ([#11575](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11575))

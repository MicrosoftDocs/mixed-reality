---
title: MRTK3 pre.14 changelog
description: Changelog for MRTK3 pre.14
author: AMollis
ms.author: amollis
ms.date: 4/27/2023
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, MRTK3 preview, MRTK3 public preview, changelog, MRTK3 changelog
---

# Changelog for MRTK3 pre.14


## [pre.14] - 2022-1-24 - [`4381709`](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity/commit/4381709)

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/). The full release announcement is available [here](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/11395) under the [releases category of the discussions tab in our repo](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/categories/releases).

### Added

- Added an option to use scalar distance instead of final displacement for toggling the bounds mode ([#11264](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11264))
- Added a validator rule to enforce linear color space ([#11353](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11353))

### Changed

- Moved the spatialization mixer from the core package into the example project ([#11370](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11370))
- Renamed speech-related subsystems ([#11348](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11348))
- Made `PokeInteractor` actually use the system-defined poke radius ([#11372](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11372))
- Marked existing data binding and theming package as experimental ([#11381](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11381))
- Improved subsystem query API ([#11333](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11333))

### Fixed

- Fixed incorrect assembly version for accessibility package ([#11368](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11368))
- Fixed missing null-check in `UGUIInputAdapterDraggable` ([#11355](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11355))
- Fixed broken pinch amount polyfill ([#11383](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11383))
- Fixed typo in `SolverHandler` + reverted prior change that broke hand constraints ([#11392](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11392))
- Fixed warnings and missing null-checks ([#11382](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11382))
- Fixed duplicated using statement ([#11393](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11393))
- Fixed ray visuals allocating every frame ([#11344](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11344))

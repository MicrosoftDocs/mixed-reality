---
title: MRTK3 pre.17 changelog
description: Changelog for MRTK3 pre.17
author: AMollis
ms.author: amollis
ms.date: 5/30/2023
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, MRTK3 preview, MRTK3 public preview, changelog, MRTK3 changelog
---

# Changelog for MRTK3 pre.17

## [pre.17] - 2023-6-28 - [`702ee31`](https://github.com/microsoft/MixedRealityToolkit-Unity/commit/702ee31f9a34382d5ce1a444a8bba07405a63e3c)

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/). The full release announcement is available [here](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/categories/releases) under the [releases category of the discussions tab in our repo](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/categories/releases).

### Added

- Added scale and rotate cursor ([#11603](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11603))
- Added spatial mouse (experimental) ([#11643](https://github.com/microsoft/MixedRealityToolkit-Unity/commit/64922a342b7812f218dc4375c37f6f25ca7dfac1))
- Added touch and far ray list scrolling (experimental) ([#11642](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11642))
- Added missing `<summary>` tag documentation to public classes and members. ([#11614](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11614), [#11634](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11634), [#11622](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11622), [#11654](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11654))

### Changed

- Updated GraphicsTools package to 0.5.12 in samples and package dependencies ([#11638](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11638))
- Updated MRTK3's min Unity input system to 1.5.1 so to avoid stack overflows caused by 1.5.0 ([#11609](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11609))
- Marked `NonNativeKeyboard`, `VirtualizedScrollRectList`, accessibility types, and data binding types as experimental ([#11630](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11630))
- Updated material and texture serializations to Unity 2021 ([#11579](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11579))
- Changed `XRSubsystemHelpers` to use interfaces for MRTK subsystems ([#11641](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11641) and [#11651](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11651))

### Fixed

- Fixed z-fighting in MRTK3's non native keyboard prefab ([#11658](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11658))
- Fixed z-Fighting with MRTK3 canvas toggle buttons ([#11610](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11610))
- Fixed Gaze Input so that it falls back to head gaze when the eye-gaze device loses tracking ([#11601](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11601))
- Fixed NonNativeKeyboard Sprite References ([#11608](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11608))
- Fixed MRTK cross package dependencies ([#11623](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11623))

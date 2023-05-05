---
title: MRTK3 pre.15 changelog
description: Changelog for MRTK3 pre.15
author: AMollis
ms.author: amollis
ms.date: 4/27/2023
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, MRTK3 preview, MRTK3 public preview, changelog, MRTK3 changelog
---

# Changelog for MRTK3 pre.15

## [pre.15] - 2023-4-28 - [`41a7766`](https://github.com/microsoft/MixedRealityToolkit-Unity/commit/41a77667c6d514a40b1269c6256b248b97539545)

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/). The full release announcement is available [here](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/11395) under the [releases category of the discussions tab in our repo](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/categories/releases).

### Added

- Added RequiresHover field to StatefulInteractable ([#11394](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11394))
- Added TransformExtensions class and unit tests ([#11435](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11435))
- Added See-It Say-It Example Scene ([#11446](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11446))
- Add support for custom voices on WindowsTextToSpeechSubsystem ([#11458](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11460))
- Added See-It Say-It Labels To Buttons ([#11466](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11466))
- Added Min Max Scale Constraints to Sample Scenes and Fixed Inspector Highlight ([#11497](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11497))
- Added Additional Sample Scenes ([#11522](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11522))
  
### Changed

- Removed DrawIf usage from AnimationEffect ([#11438](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11438))
- Updated MRTK3's minimum supported XRI version XRI 2.3 ([#11452](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11452))
- Changed SpeechInteractor so voice commands enabled when an interactable isHovered ([#11462](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11462))
- Removing VisualProfiler from MRTK3, in favor of the one available at https://github.com/microsoft/VisualProfiler-Unity.git ([#11473](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11473))
- Upgrade MRTK3's minimum Unity version to 2021 LTS ([#11465](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11465))

### Fixed

- Switch hands in SolverHandler when interactor is not actively hovering (
[#11441](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11441))
- Lock position of hand when rotating in simulator ([#11457](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11457)) 
- Fix input simulator Face Camera action ([#11460](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11460)) 
- Updated sample scene to support spatial audio ([#11469](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11469))
- Fixed Constraints Inspector Highlight ([#11497](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11497))
- Fixed two hand object manipulation of type scaling not scaling the right way in MRTK3 ([#11516](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11516))
- Fixed Tap-to-Place Slover ([#11522](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/11522))

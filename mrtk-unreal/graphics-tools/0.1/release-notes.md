---
title: Release Notes
description: Release notes for the latest GT release.
author: cameron-micka
ms.author: thmicka
ms.date: 01/04/2021
ms.localizationpriority: high
keywords: Unreal, Unreal Engine, UE4, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, GT, Graphics Tools, release notes
---

# Graphics Tools 0.1.0 Release Notes

- [What's New](#whats-new)
- [Breaking Changes](#breaking-changes)
- [Known Issues](#known-issues)

The first release of the Graphics Tools supports only HoloLens 2. Support for other MR platforms remains a goal for us but is not the current focus.

Unreal 4.26.x required.

## What's new

Everything is new because this is the first release of Graphics Tools. Please see the [README](../README.md#graphics-building-blocks) page for a list of features and building blocks.

## Breaking changes

None, since this is the first release.

## Known issues

### M_ShaderBallRimLit Reprojection

The `M_ShaderBallRimLit` material located with the examples plugin may "wobble or smear" on HoloLens 2 because it is a translucent material that does not write depth. Depth is required for all materials to reproject corectly because HoloLens 2 uses [depth based late stage reprojection](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/platform-capabilities-and-apis/hologram-stability#reprojection).

If you run into issues caused by Graphics Tools or have questions about how to do something, please [file an issue](https://github.com/microsoft/MixedReality-GraphicsTools-Unreal/issues/new) on the GitHub repo.

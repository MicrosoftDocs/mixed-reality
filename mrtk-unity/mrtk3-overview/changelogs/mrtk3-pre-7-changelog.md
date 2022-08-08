---
title: MRTK3 pre.7 changelog
description: Changelog for MRTK3 pre.7
author: maxwang-ms
ms.author: wangmax
ms.date: 08/08/2022
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, MRTK3 preview, MRTK3 public preview, changelog, MRTK3 changelog
---

# Changelog for MRTK3 pre.7 - 2022-07-18
The release announcement is available [here](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/10760) under the [releases category of the discussions tab in our repo](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions/categories/releases).

-  [Our first community contribution!] Fixed `WindowsPhraseRecognitionSubsystem` going into an endless Destroy/Start loop (#10632, thanks @LocalJoost!)
- Fixed the Oculus Touch interaction profile not being set by default in sample project (#10692)
- Fixed which OpenXR loader was assigned for UWP (#10692)
- Fixed incorrect formatting/linting (#10691)
- Fixed StateVisualizer not nullchecking its `Tintables` (#10689)
- Improved and simplified subsystems boilerplate to make creating new subsystems a bit less painful (#10694)
- Various CI improvements (#10678, #10699)
- Improved colliders on all pressable surfaces to be more accurate and "skin-tight" (#10700)
- Fixed StateVisualizer freaking out when an Animator is missing (#10703)
- Fixed `LastHoverExit` not being called from buttons due to missing base impl call (#10705)
- Updated MR OpenXR plugin to 1.4.2 (#10709)
- Fixed prefab override/undo behavior in `FontIconSelectorInspector` (#10710)
- Updated descriptions + docs (#10718)
- Removed workaround code for improved performance (#10722)
- Added Fluent icon font (#10706)
- Fixed `HeroShadow.mat` rendering incorrectly (#10725)
- Component governance fixes (#10727, #10730)
- Removing Segoe font family for legal reasons (#10729)
- **[BREAKING!]** Refactoring joint enums to match OpenXR spec (#10739)
- Enabling simple 2D mouse support by default on the MRTK Rig (#10711)
- Updated MR OpenXR plugin, fixing font asset (#10746)
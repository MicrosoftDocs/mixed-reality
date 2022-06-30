---
title: MRTK 2.8.0 release notes
description: Release notes for MRTK version 2.8.0
author: RogPodge
ms.author: roliu
ms.date: 05/26/2022
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, XRSDK, Legacy XR, Leap Motion, Ultraleap, OpenXR
ms.localizationpriority: high
monikerRange: '>= mrtkunity-2022-05'
---

# Microsoft Mixed Reality Toolkit 2.8.0 Release Notes

## What's new in 2.8.0

### Communities help everyone get to where they are going

The release of MRTK 2.8.0 brings in several bug fixes for community-filed issues and some new features that you, the MRTK community have requested! 

Today we would like to announce MRTK3 as the name that we'll be calling the next version of MRTK! With the next version of MRTK gleaming in the horizon, we want to remind everyone how important the MRTK community's contributions have been to shaping MRTK into what it is today and what it'll be in the future. We would love if you looked over the MRTK3 section of the MRTK Roadmap and watch our [GDC 2022 Creating Cross-Platform Mixed Reality Experiences panel](https://www.youtube.com/watch?v=8i3caXfE318&t=8s), and then bring your thoughts and ideas to the MRTK repository's [Discussions board](https://github.com/microsoft/MixedRealityToolkit-Unity/discussions) or [file a Feature Request issue](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/) and tag 'MRTK3'! We're looking forward to sharing more MRTK3 information with you soon and hearing your feedback.

While you're waiting for more, we hope that you enjoy MRTK 2.8.0's new features, performance improvements, and bug fixes! One last note from us before we dive into the release details. MRTK is a collaborative project. Everyone that contributes to MRTK is forever remembered, with our thanks on our [Authors page](../contributing/authors.md). Without your input MRTK wouldn't be as great as it is, so thank you to every individual that has helped shape MRTK into an amazing set of building blocks for VR and AR experiences!

### OpenXR support

We've dramatically improved our support for the OpenXR pipeline as of 2.8.0, specifically for Oculus Quest and other non-HoloLens devices! The [Microsoft OpenXR plugin](/windows/mixed-reality/develop/unity/mixed-reality-openxr-plugin) with the OpenXR pipeline is what we recommend for deploying your projects to HoloLens, Quest, and other platforms when using the latest versions of Unity 2020 LTS and Unity 2021 LTS. If you find any issues while using MRTK with the OpenXR pipeline, [file an issue](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/) on our GitHub repository.

### Gaze + Pinch

MRTK v2.8.0 added a new and experimental input method Gaze + Pinch. You can now target an object by looking at it and selecting it with a pinch gesture. [#10193](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10193)

### PinchSliderBox + PinchSpring

MRTK v2.8.0 now has support for two new experimental UX components that have been requested by our partners and designers. [#6445](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/6445)

![Sample of PinchSliderBox running](https://user-images.githubusercontent.com/13305729/67987465-afb05a00-fbea-11e9-81fe-c323f2366b52.gif)

### Graduated Step Slider

Merged step slider and touch functionality into the pinch slider and graduated from experimental. [#9983](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9983)

![Step Slider](https://user-images.githubusercontent.com/39840334/122488212-d410a400-cf91-11eb-8d31-fc7584ddc465.gif)

### Performance Improvements

MRTK 2.8.0 runs significantly smoother with these major performance improvements. 

- Don't do raycasts for the GazeProvider if its behavior is set [#10340](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10340)
- Better handling for excess proximity lights [#10241](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10241)
- Assorted perf improvements in hot code paths [#10601](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10601)

### Visualization Improvements

MRTK 2.8.0 now has a default controller and hand visualization for when a platform doesn't provide any controller or hand visualizations. With the Microsoft OpenXR package, you don't need to import the Oculus Integration package to have the Oculus hand or controller visualizations.

- Controller model fallbacks [#10568](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10568)
- Oculus visualization now integrated with MRTK [#10067](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10067)

### MRTK 2.8.0 Improvements and Bug Fixes

#### Profile Improvements

MRTK 2.8.0 has a few improvements to our profiles. Managing gaze and pointer behavior should be much easier now.

- Pointer profile layer mask rework [#10508](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10508)
- Clarifying raycast layermask descriptions and fixed teleport pointer overloading definitions [#10507](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10507)
- HandTracking Profile Hand Mesh Refactor [#10608](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10608)
- Make eye gaze capability setting in configurator more consistent with the current MRTK profile [#10525](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10525)
- Fixed issue where hand joint lookup would throw dictionary exceptions for visualizers [#10574](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/100574)
- Fix single-frame cursor flickering [#10436](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10436)
- Fixed issue where cursors would elongate in special circumstances [#10503](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10503)
- Fixed issues where rayDistance and rayStepIndex were calculated incorrectly [#10506](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10506)

#### Input Improvements 

- Input Source Parent no longer cached [#10561](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10561)
- Fixed issue where gaze provider gets forcibly reset on profile modification [#10510](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10510)
- Fixed inconsistent interaction behavior for overlapping objects [#10188](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10188)
- Fixing difference in hand ray pointing math between left and right hands [#10492](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10492)
- PokePointer and TouchableVolume fix for packed scenes and nested set-ups [#10531](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10531)

#### Additional features, improvements and API changes:

- Adapt obsolete method/property usage for compatibility with Mixed Reality OpenXR 1.4.0 [#10524](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10524)
- Add support for "select" voice command with Windows XR Plugin [#10533](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10533) 
- OpenXR general hand interaction support [#10538](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10538)
- Fix issue where WMR controllers weren't reporting spatial data in "controller" mode when hand joints were enabled [#10547](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10547)
- Update TetheredPlacement.cs to use local pose [#10566](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10566) 
- Pr fixes, Oculus Integration 39.0 compatibility [#10576](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10576)
- Guard planefinding native DLL package calls only to Windows [#10595](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10595)
- Moving Scene Query code out of the Focus Provider. Improved Sphere Pointer performance [#10146](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10146)
- (**Breaking**) Fix handness -> handedness [#10273](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10273)
- Add synchronous CloseImmediate() functions to IProgressIndicator [#10323](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10323)
- Unifying articulated hand visualizer scripts [#10555](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10555)
- Make ObjectManipulator Start and OnPointerX functions Virtual [#9981](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9981)
- Make the ObservedObjectParent public via the BaseSpatialObserver class [#9995](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/9995)
- Execution order/priority system for TransformConstraint [#10028](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10028)
- Add support for embedded packages in the dependency window [#10042](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10042)
- Made Near Pointers usable on controllers. [#10059](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10059)
- Introducing an enum and controlling the behavior [#10078](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10078)
- Added option to only have slider sounds play during manipulation [#10081](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10081)
- MRTK TMP Sprite shader addition [#10096](https://github.com/microsoft/MixedRealityToolkit-Unity/pull/10096)
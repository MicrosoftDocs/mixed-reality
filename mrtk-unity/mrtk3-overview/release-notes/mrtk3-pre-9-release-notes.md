---
title: MRTK3 pre.9 release notes
description: Release notes for MRTK3 pre.9
author: maxwang-ms
ms.author: wangmax
ms.date: 08/08/2022
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, MRTK3 preview, MRTK3 public preview
---

# MRTK3 pre.9 release notes

![Bannerpre 9](images/MRTK3-pre.9.svg)

We're pleased to announce the `pre.9` release for MRTK3. It's a snapshot of all MRTK3 packages as of today, and it's now available on the MR Feature Tool. Make sure to enable preview packages!

As always, a huge thank-you to all of the intrepid MR enthusiasts and developers with us on the MRTK3 preview journey. We are extremely thankful for your input, your bug reports, feature requests, blog posts, and all of the other amazing ways you've shown interest and support! We definitely couldn't do it without all your support and engagement.

Today's update has some nice bug fixes, better defaults for the sample project, and fully functional interactions with Quest hand tracking. As of this release, you should have full-functional hand rays, grabbing, and poking on Quest, essentially at parity with HoloLens 2. You may notice slightly more wobbly hand rays on Quest; we're actively working on improving our ray fallback.

# Changelog
### [pre.9] - 2022-08-03 - `2ed522e`
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

### Added
- Added tracking state actions to MRTK Default Input Actions
- Added a fallback to an internal hand ray implementation in `ArticulatedHandController` when no pointing pose is available
- Added a fallback to the palm pose rotation in `GazePinchInteractor` if the parent controller's bound device has no rotation action bound
- Added an example script for curving Canvas ScrollRects. See it in action in the `VirtualizedScrollRectList` sample scene, or try adding it to your own ScrollRect! Thanks @maluoi!
- Added `maintainGlobalSize` option to `BoundsHandleInteractable`, to allow developers to customize handle size behavior as `BoundsControl` grows and shrinks

### Changed
- Improved performance on pre-2021 Unity projects by removing `HasFlag` calls
- Improved performance in certain hot paths by trimming LINQ and GetComponent calls
- Changed XR Rig prefab to bind `XRController`s to the new tracking state actions
- Updated some TrackedHandJoint enum references to the new names
- Updated XRI to 2.0.2
- Made `BoundsHandleInteractable` `public`, instead of `internal`

### Fixed
- Fixed a bug in the index finger length calculation in `MRTKHandsAggregator`
- Fixed `TapToPlace` hiding `OnDisable` in the base class
- Fixed `FontIconExample`'s description plate to not be "wonky" anymore
- Fixed a null reference exception in solver registration
- Fixed the znear/far values being poorly configured in the sample project
- Fixed some sample scenes missing the `SampleSceneHandMenu`
- Fixed the icons on the `SampleSceneHandMenu`
- Fixed `allowSwitchOff` in `ToggleCollection` not being applied correctly when set in the editor at runtime
- Fixed the "Select" voice command keyboard not working in MRTK3 on OpenXR
- Fixed the Action Button prefab using the wrong kind of TextMeshPro
- Fixed audio spatialization settings on the audio example scenes
- Fixed button problems in the audio example scenes

## Known issues

We uncovered some minor issues as part of our build call for `pre.8`, so check the issues tab and filter by MRTK3 to see what we're currently tracking.

## Breaking changes

No breaking changes this time. Stay tuned in the future, though! We might be doing some breaking things to `BoundsControl` and the Constraints/Solvers system in the near future.

## Thanks!

It's been a pleasure talking with everyone in the community. If you haven't had a chance, [check out @LocalJoost's great blog post about migrating an MRTK2 app to MRTK3.](https://techcommunity.microsoft.com/t5/mixed-reality-blog/guest-blog-from-mrtk2-to-mrtk3-going-cross-platform-with/ba-p/3577325) Stay in touch! Feel free to reach out on any of our social media handles, websites, or just post discussions here in GitHub.

Thanks again! 👓👐
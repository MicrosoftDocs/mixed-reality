---
title: MRTK3 pre.7 release notes
description: Release notes for MRTK3 pre.7
author: maxwang-ms
ms.author: wangmax
ms.date: 08/08/2022
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, MRTK3 preview, MRTK3 public preview
---

# MRTK3 pre.7 release notes

![MRTK3_PRE7](images/MRTK3-pre.7.png)

Hello reality mixers!

We're pleased to announce the `pre.7` release for MRTK3. It's a snapshot of all MRTK3 packages as of... right now, and is available as a numbered `pre.7` release on the MR Feature Tool. 

I wanted to take a moment to thank everyone who's with us on this exciting public preview journey, both those who are taking the leap early and trying out the future of MRTK, as well as those who have been actively reporting issues, engaging in discussion, and even contributing some fixes back already! We definitely didn't expect such amazing community engagement this early on in the MRTK3 journey, and so we're grateful and excited to be working with you all.

A note on versioning: as a reminder, we are *currently* versioning all MRTK3 packages in lockstep as we release this private preview update, but in the near future/GA we will be moving to independent semantically versioned packages. So, don't be too worried if suddenly your version numbers stop lining up! We intend for this versioning scheme to more clearly communicate patch/minor/breaking changes, and make the inter-package dependencies clearer and less directly coupled.

With that out of the way, let's talk about everything we've added/fixed/changed since the last public preview release!

## Changelog

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

## Known issues

All of the existing known issues in the docs should still apply. In addition, check the current issue board and filter by `label:MRTK3` for active MRTK3 issues.

The most notable issue that folks will see is that Quest still lacks proper Grab/Select actions when using hand tracking. We're actively working on this issue, but it requires both some changes on the MR OpenXR plugin side and some changes on our side (#10749). Stay tuned!

## Breaking changes

The only breaking change for this release is the formatting of the `TrackedHandJoint` enum. We've reshuffled some of the indices to match OpenXR format, so check your indices and makes sure they point to the joint(s) you actually want!

## Thanks!

Thanks again for all of the amazing engagement, support, and interest we've received over the past month. Please keep it up, and feel free to ping us here, on Slack, or reach out directly on socials if you have any questions, concerns, or even just want to say hi. We don't bite! Thanks for being awesome and stay tuned for more updates.
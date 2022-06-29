---
title: Roadmap
description: MRTK Roadmap Outline
author: polar-kev
ms.author: kurtie
ms.date: 11/18/2021
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, roadmap, v3
---

# Roadmap &#8212; MRTK2

Here is our vision for major work in Mixed Reality Toolkit for calendar year 2021 and 2022. This work is under development, and target dates are estimates only.

## Current release

Microsoft Mixed Reality Toolkit v2.7.2

## Upcoming releases

| Product | Description | Timeline | Project board |
| --- | --- | --- | --- |
| [MRTK v2.7.3](#273) | A minor release with targeted bug fixes | Dec 2021 | [MRTK v2.7.3 Milestones](https://github.com/microsoft/MixedRealityToolkit-Unity/milestone/25) |
| [MRTK v2.8.0](#280) | Next iteration of MRTK with bug fixes and minor improvements | Spring 2022 | [MRTK v2.8.0 Milestones](https://github.com/microsoft/MixedRealityToolkit-Unity/milestone/22) |
| [MRTK v3.0.0 Public Preview](#300) | A new major release of MRTK with an all new architecture | Spring/Summer 2022 |[MRTK v3.0.0 Milestones](https://github.com/microsoft/MixedRealityToolkit-Unity/milestone/18) |

The MRTK team is currently focusing on the development MRTK v3, which introduces a new architecture. The architecture addresses several pain points being vocalized by the community. We are a lean team, and we need to move away from our typical 8-12 week release cadence in order to focus our attention on building up the core of MRTK v3. We would like to share it with the public and start accepting contributions from the community soon.

Release details, including backlog items, can be found on the [GitHub milestone pages](https://github.com/Microsoft/MixedRealityToolkit-Unity/milestones). The complete set of open issues can also be found on [GitHub](https://github.com/microsoft/MixedRealityToolkit-Unity/issues).


> When Unity releases an LTS (Long Term Support) product, Mixed Reality Toolkit will update to the LTS release. Although Mixed Reality Toolkit runs on the latest non-beta (ex: 2021.2) tech branch version of Unity, version 2021.2 is not officially supported.

## Mixed Reality Toolkit (MRTK) roadmap

### **2.7.3**
MRTK 2.7.3 will be released in December 2021. This release will address important bugs reported in GitHub. You can see those bugs listed here, [MRTK v2.7.3 Milestones](https://github.com/microsoft/MixedRealityToolkit-Unity/milestone/25).

Status: in development

Target Time: early December 2021


### **2.8.0**

As we transition to MRTK v3, MRTK v2 will prioritize bug fixes and stability over new feature development in MRTK 2.8 and later. We continue to encourage the developer community to take advantage of the open source nature of MRTK, and submit PR's for new features you would like to have. We also encourage the community to comment in the [MRTK Github repo](https://github.com/microsoft/MixedRealityToolkit-Unity/issues) on issues you want to see fixed.

For the latest status of the release, please visit the [milestone page](https://github.com/microsoft/MixedRealityToolkit-Unity/milestone/22).

Status: gathering feedback

Target time: Spring 2022

Themes:

- Ensure MRTK builds on Unity 2021
- Bug fixes
- Stability 


### **3.0.0**
A preview of MRTK v3 will be released in the spring/summer of 2022, featuring an all new architecture for developing rich MR experiences. MRTK v3 will have a minimum requirement of Unity 2020.3 LTS.

Status: in development

Target time: Public Preview Spring/Summer 2022

Our focuses for MRTK v3 include the following:

- Build on top of OpenXR and Unity's XR Interaction Toolkit (XRI)
- Independent subsystems that can easily be integrated with non-MRTK code
- Performance improvements
- Components ready for enterprise scale
- Cross-platform device support
- Flexible and scalable layout tools
- Data-driven UI
- Theming system to quickly apply your brand to UI
- Accessibility options

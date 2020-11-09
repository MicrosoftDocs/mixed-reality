---
title: Getting started with MRTK version 2
description: For new developers who are interested in leveraging MRTK
author: cre8ivepark
ms.author: dongpark
ms.date: 05/15/2019
ms.topic: article
ms.localizationpriority: high
keywords: Windows Mixed Reality, test, Mixed Reality Toolkit, MRTK version 2, MRTK, tools, SDK, HoloLens, HoloLens 2
---

# Getting started with MRTK for Unity
![MRTK](../../design/images/MRTK_UX_Hero.png)

## What is Mixed Reality Toolkit (MRTK)?
The MRTK is an amazing open source toolkit that has been around since the HoloLens was first released, and would not be where it is today without the hard work of our developer community who have contributed to it. Over the past 3 years, we have listened to the feedback of our developer community, and built MRTK v2 to take the biggest concerns into account.  

MRTK for Unity is an open-source, cross-platform development kit for mixed reality applications. MRTK provides a cross-platform input system, foundational components, and common building blocks for spatial interactions. MRTK version 2 is intended to accelerate the development of applications targeting Microsoft HoloLens, Windows Mixed Reality immersive (VR) headsets and OpenVR platform. The project is aimed at reducing barriers to entry, creating mixed reality applications, and contributing back to the community as we all grow.

<br>

>[!VIDEO https://channel9.msdn.com/Shows/Docs-Mixed-Reality/Setting-up-your-HoloLens-2-development-environment/player?format=ny]

See the [MRTK's documentation on GitHub](https://microsoft.github.io/MixedRealityToolkit-Unity/README.html) to explore more. To get started, follow the steps on the [Installation guide](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/Installation.html) page.


## New with MRTK v2
We want to stress our commitment to these platform tools.  In fact, we leveraged MRTK version 2 to develop our inbox experiences, such as the out-of-box setup experience (OOBE) and our Mixed Reality Tips application. You can also expect to see new HoloLens 2 capabilities first exposed through MRTK because we believe it’s the best way to develop on our platform. 

### Modular
We have built it in a modular way, so there's no need to take every bit of the toolkit into your project.  There are actually a few benefits to this.  It keeps your project size smaller, and makes it easier to manage.  Additionally, because it’s built with scriptable objects and is interface-driven, it’s also possible for you to replace the components that are included with your own, to support other services, systems, and platforms.

### Cross-platform
Speaking of other platforms, it has cross-platform support.  And while this doesn’t mean every single platform is supported out of the box, we have made sure none of the toolkit code will break when you switch your build target to other platforms.  The robustness and extensibility with the modular design sets you up on a good path to be able to support multiple platforms, such as ARCore, ARKit, and OpenVR.

### Performant
Working with mobile platforms, we constructed it with performance in mind.  This is super important, and we wanted to ensure that the tools are not going to work against you.

## See also
* [Install the tools](../install-the-tools.md)
* [MRTK - Installation guide (GitHub)](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/Installation.html)
* [MRTK - Documentation home (GitHub)](https://microsoft.github.io/MixedRealityToolkit-Unity/README.html)
* [Porting from HoloToolkit/MRTK to MRTK version 2 (GitHub)](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/HTKToMRTKPortingGuide.html)

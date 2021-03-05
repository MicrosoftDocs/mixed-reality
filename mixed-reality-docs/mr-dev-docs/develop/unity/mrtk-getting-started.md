---
title: Introducing MRTK for Unity
description: Get started with everything the cross-platform Mixed Reality Toolkit has to offer new mixed reality developers.
author: cre8ivepark
ms.author: dongpark
ms.date: 05/15/2019
ms.topic: article
ms.localizationpriority: high
keywords: Windows Mixed Reality, test, Mixed Reality Toolkit, MRTK version 2, MRTK, tools, SDK, HoloLens, HoloLens 2, mixed reality headset, windows mixed reality headset, virtual reality headset, cross-platform
---

# Introducing MRTK for Unity

![MRTK](../../design/images/MRTK_UX_Hero.png)

## What is Mixed Reality Toolkit (MRTK)?

MRTK is an amazing open-source toolkit that has been around since the HoloLens was first released. The toolkit wouldn't be where it is today without the hard work of our contributing developer community. Over the past three years, we've listened to the feedback of our developer community, and built MRTK v2 to take the biggest concerns into account.  

MRTK for Unity is an open-source, cross-platform development kit for mixed reality applications. The easiest way to install the toolkit is with our new Mixed Reality Feature Tool application. Follow our [installation and usage instructions](welcome-to-mr-feature-tool.md) and select the **Mixed Reality Toolkit Foundation** package in the Mixed Reality Toolkit category.

MRTK for Unity provides a cross-platform input system, foundational components, and common building blocks for spatial interactions. MRTK version 2 intends to speed up application development for Microsoft HoloLens, Windows Mixed Reality immersive (VR) headsets, and OpenVR platform. The project is aimed at reducing barriers to entry, creating mixed reality applications, and contributing back to the community as we all grow.

<br>

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4IkCG]

Take a look at [MRTK's documentation](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/) for more feature details.

## New with MRTK v2

We want to stress our commitment to these platform tools.  In fact, we used MRTK version 2 to develop our inbox experiences, such as the out-of-box setup experience (OOBE) and our Mixed Reality Tips application. You can also expect to see new HoloLens 2 capabilities first exposed through MRTK because we believe it’s the best way to develop on our platform.

### Modular

We have built it in a modular way, so you don't need to take every bit of the toolkit into your project.  There are actually a few benefits to this.  It keeps your project size smaller, and makes it easier to manage.  Additionally, because it’s built with scriptable objects and is interface-driven, it’s also possible for you to replace the components that are included with your own, to support other services, systems, and platforms.

### Cross-platform

Speaking of other platforms, it has cross-platform support.  And while this doesn’t mean every single platform is supported, we have made sure none of the toolkit code will break when you switch your build target to other platforms.  The robustness and extensibility of the modular design sets your apps up to support multiple platforms, such as ARCore, ARKit, and OpenVR.

### Performant

Working with mobile platforms, we constructed it with performance in mind.  This is super important, and we wanted to ensure that the tools aren't going to work against you.

## See also

* [Install the tools](../install-the-tools.md)
* [Mixed Reality Feature Tool](welcome-to-mr-feature-tool.md)
* [Developing with MRTK for Unity](unity-development-overview.md)
* [MRTK - Documentation home](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/)
* [Porting from HoloToolkit/MRTK to MRTK version 2](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/updates-deployment/htk-to-mrtk-porting-guide)

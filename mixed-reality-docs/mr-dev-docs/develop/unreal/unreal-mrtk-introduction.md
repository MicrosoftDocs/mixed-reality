---
title: Introducing MRTK for Unreal
description: Get started with everything the cross-platform Mixed Reality Toolkit has to offer new mixed reality developers.
author: hferrone
ms.author: v-hferrone
ms.date: 01/08/2021
ms.topic: article
ms.localizationpriority: high
keywords: Windows Mixed Reality, test, Mixed Reality Toolkit, MRTK version 2, MRTK, tools, SDK, HoloLens, HoloLens 2, mixed reality headset, windows mixed reality headset, virtual reality headset, cross-platform
---

# Introducing MRTK for Unreal

![MRTK](../../design/images/MRTK_UX_Hero.png)

## What is Mixed Reality Toolkit (MRTK)?

MRTK is an amazing open-source toolkit that has been around since the HoloLens was first released. The toolkit wouldn't be where it is today without the hard work of our contributing developer community. 

The Mixed Reality Toolkit for Unreal (MRTK-Unreal) is a set of components, in the form of plugins, samples and documentation, designed to help development of Mixed Reality applications using the Unreal Engine. Currently the toolkit consists of the [UX Tools for Unreal](https://github.com/microsoft/MixedReality-UXTools-Unreal), providing code, blueprints and examples to implement UX features for Hololens 2.applications.

<br>

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4IkCG]

Take a look at [MRTK's documentation on GitHub](https://github.com/microsoft/MixedReality-UXTools-Unreal/blob/public/0.11.x/README.md) and get started with the [installation guide](https://microsoft.github.io/MixedReality-UXTools-Unreal/Docs/Installation.html).

### New with UX Tools v0.11

We want to stress our commitment to these platform tools.  In fact, we used MRTK version 2 to develop our inbox experiences, such as the out-of-box setup experience (OOBE) and our Mixed Reality Tips application. You can also expect to see new HoloLens 2 capabilities first exposed through MRTK because we believe it’s the best way to develop on our platform. 

### Modular

We have built it in a modular way, so you don't need to take every bit of the toolkit into your project.  There are actually a few benefits to this.  It keeps your project size smaller, and makes it easier to manage.  Additionally, because it’s built with scriptable objects and is interface-driven, it’s also possible for you to replace the components that are included with your own, to support other services, systems, and platforms.

### Cross-platform

Speaking of other platforms, it has cross-platform support.  And while this doesn’t mean every single platform is supported, we have made sure none of the toolkit code will break when you switch your build target to other platforms.  The robustness and extensibility of the modular design sets your apps up to support multiple platforms, such as ARCore, ARKit, and OpenVR.

### Performant

Working with mobile platforms, we constructed it with performance in mind.  This is super important, and we wanted to ensure that the tools aren't going to work against you.

## See also

* [Install the tools](../install-the-tools.md)
* [Developing with MRTK for Unreal](unreal-development-overview.md)
* [MRTK for Unreal - Installation guide (GitHub)](https://microsoft.github.io/MixedReality-UXTools-Unreal/Docs/Installation.html)
* [MRTK for Unreal - Documentation home (GitHub)](https://github.com/microsoft/MixedReality-UXTools-Unreal/blob/public/0.11.x/README.md)
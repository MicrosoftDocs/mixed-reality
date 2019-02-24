---
title: Getting your app ready for HoloLens 2
description: Targeted at developers who have an existing app on HoloLens (1st gen) and/or older MRTK, and looking to port to MRTK version 2 and HoloLens 2.
author: author:grbury
ms.author: grbury
ms.date: 02/22/19
ms.topic: article
keywords: Windows Mixed Reality, test, MRTK, MRTK version 2, HoloLens 2
---

# Getting your existing app ready for HoloLens 2

If you have an existing HoloLens app built in Unity, here is your best bet - start with current HoloLens (1st gen),  latest Visual Studio, Unity 2018.3.x, and MRTK version 2 Beta.
MRTK version 2 is the new toolkit on top of Unity supporting both HoloLens (1st gen) and HoloLens 2, and where all of the new HoloLens 2 capabilities will be added, such as hand interactions and eye tracking.

For more information on specific API differences between HTK/MRTK and MRTK version 2, see the porting guide on the <a href="https://github.com/Microsoft/MixedRealityToolkit-Unity/wiki/Moving-your-project-from-HoloToolkit-2017-to-MixedRealityToolkit-v2" target="_blank">MRTK Version 2 wiki</a>.


## Pre-work to do without a HoloLens 2 device

* Move existing apps to Unity 2018.3 and verify it works with on HoloLens (1st gen)
* In Visual Studio, try building for ARM, and assess if there are missing ARM libraries/dependencies.  Note: Unity 2018 supports ARM32.  You need Unity 2019.1 or later to use ARM64.
* Move existing apps to MRTK version 2 and verify it works with on HoloLens (1st gen)

We’ve found it easier to diagnose ARM build gaps prior to updating to MRTK version 2.<br>
If the above three are error-free, then you are in a good place to get your app ported to HoloLens 2.

Once HoloLens 2 components and capabilities are available in MRTK version 2, you can simulate the hand interactions directly in Unity, and develop against the new APIs for hand interactions and eye tracking.  The HoloLens 2 device is required to create a great experience, but at least you could start learning in the tools and documentation.


## See also
* [Getting started with MRTK version 2](mrtk-getting-started.md)
* [Install the tools](install-the-tools.md)


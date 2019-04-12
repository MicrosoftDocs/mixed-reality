-
--
title: Getting your app ready for HoloLens 2
description: Targeted at developers who have an existing app on HoloLens (1st gen) and/or older MRTK, and looking to port to MRTK version 2 and HoloLens 2.
author: author:grbury
ms.author: grbury
ms.date: 04/12/19
ms.topic: article
keywords: Windows Mixed Reality, test, MRTK, MRTK version 2, HoloLens 2
---

# Getting your existing app ready for HoloLens 2

If you have an existing HoloLens app built in Unity, here is your best bet - start with current HoloLens (1st gen),  latest Visual Studio, Unity 2018.3.x, and MRTK version 2.
MRTK version 2 is the new toolkit on top of Unity supporting both HoloLens (1st gen) and HoloLens 2, and where all of the new HoloLens 2 capabilities have been added, such as hand interactions and eye tracking.

For more information on specific API differences between HTK/MRTK and MRTK version 2, see the porting guide on the [MRTK Version 2 wiki](https://github.com/Microsoft/MixedRealityToolkit-Unity/wiki/Moving-your-project-from-HoloToolkit-2017-to-MixedRealityToolkit-v2).


## Pre-work to do without a HoloLens 2 device

* Move existing apps to Unity 2018.3 and verify it works with on HoloLens (1st gen).
* Move existing apps to [IL2CPP](https://docs.unity3d.com/Manual/IL2CPP.html) and verify it works with on HoloLens (1st gen).
* In Visual Studio, try building for ARM, and assess if there are missing ARM libraries/dependencies.  Note: Unity 2018 supports ARM32.  You need Unity 2019.1 or later to use ARM64.
* Move existing apps to MRTK version 2 and verify it works with on HoloLens (1st gen).

We’ve found it easier to diagnose ARM build gaps prior to updating to MRTK version 2.<br>
If the above three are error-free, then you are in a good place to get your app ported to HoloLens 2.

Now that HoloLens 2 components and capabilities are available in MRTK version 2, as of RC1, you can simulate the hand interactions directly in Unity, and develop against the new APIs for hand interactions and eye tracking.  The HoloLens 2 device is required to create a great experience, but at least you could start learning in the tools and documentation.


## Updating interaction model for HoloLens 2

Once you have your app ported and prepped for HoloLens 2, you are ready to consider updating your interaction model and hologram designs/placement.
Coming from HoloLens (1st gen), your app likely has a gaze and commit interaction model, with holograms relatively far away to fit into the field of view.

Steps to update your app design to be best for HoloLens 2:
1.	MRTK components: Per the pre-work, if you added MRTK v2, there are various components/scripts to leverage that have been designed and optimized for HoloLens 2.

2.	Interaction model: Consider updating your interaction model.  For most scenarios, we recommend switching from gaze and commit to hands.  With your holograms typically being out of arms reach, switching to hands will result in far interaction pointing rays and grab gestures.
Note: there are scenarios where a hands-free interaction model is required, such as a task worker holding tools, and there is specific design guidance for such cases. 

3.	Hologram placement: After switching to a hands interaction model, consider moving some holograms closer to directly interact with the holograms with your hands, using near interaction grab gestures.  The types of holograms recommended to move closer to directly grab or interact are small target menus, controls, buttons, and smaller holograms that fit within the HoloLens 2 field of view when grabbing and inspecting the hologram.
<br>
Every app and scenario is different, and we’ll continue to refine and post design guidance based on feedback and continued learnings.



<br>
<br>

## Additional learnings from moving apps from x86 to ARM

Straight Unity apps are simple as you can build an ARM appx bundle or deploy directly to the device and it runs.
The challenge comes when the Unity app uses native plugins.  All of the native plugins need to be upgraded to VS2017 and rebuilt for ARM, and with Unity 2019, ARM64.

One app, used the AudioKinetic Wwise plugin for Unity, and the version used didn’t have a UWP ARM plugin. It took several days to re-work the sound in the application to work on ARM.

In other cases, a UWP/ARM plugin may not exist for app-required plugins, blocking the ability to port and run on HoloLens 2.  Engagement with the plugin provider may be needed to unblock and support ARM.

The minfloat (and variants such as min16float, minint, etc…) in shaders may behave differently on HoloLen 2 than on HoloLens (1st gen). Specifically, these guarantee that “at least the specified number of bits will be used”. On Intel/Nvidia GPUs, these are largely just treated as 32 bits. On ARM, the number of bits specified is actually respected. That means that in practice, these numbers may have less precision/range on HoloLens 2 than they did on HoloLens (1st gen).

The _asm instructions don’t appear to work on ARM, meaning any code using _asm instructions will have to be rewritten.

The SIMD instruction set is not supported on ARM. This means various headers, such as xmmintrin.h, emmintrin.h, tmmintrin.h, and immintrin.h are not available on ARM.

The shader compiler on ARM runs during the first draw call after the shader has been loaded or something the shader relies on has changed, not at shader load time. The impact on framerate can be very noticeable, depending on how many shaders need to be compiled. This has various implications for how shaders should be handled/packaged/updated differently on HoloLens 2 vs HoloLens (1st gen).



## See also
* [Getting started with MRTK version 2](mrtk-getting-started.md)
* [Install the tools](install-the-tools.md)


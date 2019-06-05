---
title: Getting your app ready for HoloLens 2
description: Targeted at developers who have an existing app on HoloLens (1st gen) and/or older MRTK, and looking to port to MRTK version 2 and HoloLens 2.
author: grbury
ms.author: grbury
ms.date: 04/12/19
ms.topic: article
ms.localizationpriority: high
keywords: Windows Mixed Reality, test, MRTK, MRTK version 2, HoloLens 2
---

# Getting your existing app ready for HoloLens 2

This guide is specifically tailored to help developers who have an existing Unity app for HoloLens (1st gen) to port their application for the new HoloLens 2 device. There are four key steps to porting a HoloLens (1st gen) Unity app to HoloLens 2. The sections below will detail information for each stage. 

| Step 1 | Step 2 | Step 3 | Step 4 |
|----------|-------------------|-------------------|-------------------|
| ![Visual Studio logo](images/visualstudio_logo.png) | ![Unity logo](images/unity_logo.png)| ![Unity icon](images/hololens2_icon.jpg) | ![MRTK logo](images/MRTKIcon.jpg) |
| Download latest tools | Update Unity Project | Compile for ARM | Migrate to MRTK v2

It is **highly recommended** that, before beginning the porting process, developers utilize source control to save a snapshot of the original state of their app. Additionally, it is recommended to *save* checkpoint states at various points during the process. It can also be very helpful to have another Unity instance of the original app to allow for side-by-side comparison during the port process. 

> [!NOTE]
> Before porting, ensure you have the latest tools installed for Windows Mixed Reality development. For most existing HoloLens developers, this will primarily involve updating to the latest Visual Studio 2017 and installing the appropriate Windows SDK. The content below will dive further into different Unity versions and the Mixed Reality Toolkit version 2.
>
> For more information, please see [Install the tools](install-the-tools.md).

## Migrate project to latest version of Unity

If using the MRTK v2, then Unity 2018 LTS will be the best long-term support path with no breaking changes in Unity or in MRTK.  The recommended Unity build, per the above "install the tools" is Unity 2018.3, which will become the LTS release for Unity 2018.  Further, the MRTK v2 will always guarantee support for Unity 2018 LTS but not necessarily guarantee support for every iteration of Unity 2019.x. 

To help clarify additional differences between Unity 2018.3.x or Unity 2019.1.x, below outlines the trade-offs between these two versions, with the primary difference of significance being the ability to compile for ARM64 in Unity 2019. 

Developers should assess any [plugin dependencies](https://docs.unity3d.com/Manual/Plugins.html) that currently exist in their project and whether or not these DLLs can be built for ARM64. If a hard dependency plugin cannot be built for ARM64, then one will have to utilize Unity 2018 LTS.


| Unity 2018.3.x | Unity 2019.1+ |
|----------|-------------------|
| ARM32 build support | ARM32 and ARM64 build support |
| Stable LTS build release | Beta stability |
| [.NET Scripting back-end](https://docs.unity3d.com/Manual/windowsstore-dotnet.html) *deprecated* | [.NET Scripting back-end](https://docs.unity3d.com/Manual/windowsstore-dotnet.html) *removed* |
| UNET Networking *deprecated* | UNET Networking *deprecated* |

## Update scene/project settings in Unity

After updating to Unity 2018.3.x or Unity 2019+, it is recommended to update particular settings in Unity for optimal results on device. These settings are outlined in detail under **[Recommended settings for Unity](Recommended-settings-for-Unity.md)**.

It should be re-iterated that the [.NET Scripting back-end](https://docs.unity3d.com/Manual/windowsstore-dotnet.html) is being deprecated in Unity 2018 and *removed* in Unity 2019 and thus, developers should strongly consider switching their project over to [IL2CPP](https://docs.unity3d.com/Manual/IL2CPP.html). 

> [!NOTE]
> IL2CPP scripting back-end can cause longer build times from Unity to Visual Studio and thus developers should setup their developer machine for [optimizing IL2CPP build times](https://docs.unity3d.com/Manual/IL2CPP-OptimizingBuildTimes.html).
> Furthermore, it may be beneficial to setup a [Cache Server](https://docs.unity3d.com/Manual/CacheServer.html), especially for Unity projects with a large amount of assets (excluding script files) or constantly changing scenes/assets. When opening a project, Unity stores qualifying assets into an internal cache format on the developer machine. Items must be re-imported and thus re-processed when modified. This process can be done once and saved in a Cache Server and consequently shared with other developers to save time, instead of every developer processing the re-import of new changes locally.

After addressing any breaking changes after moving to the updated Unity version, developers should build and test their current apps on HoloLens (1st gen). Further, this is a good point to create and save a commit for source control. 

## Compile dependencies/plugins for ARM processor

HoloLens (1st gen) executed applications on an x86 processor while the new HoloLens 2 device utilizes an ARM processor. Thus, existing applications need to be ported over to support ARM. As noted earlier, Unity 2018 supports compiling for ARM32 apps while Unity 2019+ supports compiling for ARM64 apps. Developing for ARM64 applications is generally preferred as there is a material difference in performance. However, this requires all [plugin dependencies](https://docs.unity3d.com/Manual/Plugins.html) to also be built for ARM64. 

Review all DLL dependencies in your application currently. If a dependency is no longer needed, it is advisable to remove it from your project. For remaining plugins that are required, ingest the respective ARM32 or ARM64 binaries into your Unity project. 

After ingesting the relevant DLLs, build a Visual Studio solution from Unity and then compile an AppX for ARM in Visual Studio to test that your application can be built for ARM processors. This another point where it is advised to save a commit in your source control solution. 

## Update to MRTK version 2

MRTK version 2 is the new toolkit on top of Unity supporting both HoloLens (1st gen) and HoloLens 2, and where all of the new HoloLens 2 capabilities have been added, such as hand interactions and eye tracking.

### Prepare for the migration

Before ingesting the new [*.unitypackage files for MRTK v2](https://github.com/Microsoft/MixedRealityToolkit-Unity/releases), it is recommended to take an inventory of **1) any custom-built code that integrates with MRTK v1** and **2) any custom-built code for input interactions or UX components**. The most common and prevalent conflict for a Mixed Reality developer ingesting the new MRTK v2 will involve input and interactions. Thus, it is advised to begin reading and understanding the [MRTK v2 input model](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/Input/Overview.html).

Finally, the new MRTK v2 has transitioned from a model of scripts and in-scene manager objects to a configuration and services provider architecture. This results in a cleaner scene hierarchy and architecture model but requires a learning curve for understanding the new configuration profiles. Thus, please read the [Mixed Reality Toolkit Configuration Guide](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/MixedRealityConfigurationGuide.html) to start becoming familiar with the important settings and profiles to adjust to the needs of your application. 

### Perform the migration

After importing MRTK v2, your Unity project will likely have many compiler related errors. These are most commonly due to the new namespace structure and new component names. Proceed to resolve these errors by modifying your scripts to the new namespaces and components. 

For more information on specific API differences between HTK/MRTK and MRTK version 2, see the porting guide on the [MRTK Version 2 wiki](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/HTKToMRTKPortingGuide.html).

### Best practices

- Prefer use of the MRTK Standard shader
- Work on one breaking change type at a time (ex: IFocusable to IMixedRealityFocusHandler)
- Test after every change and utilize source control
- Use default MRTK UX (buttons, slates, etc) when possible
- Try to refrain from modifying MRTK files directly, instead create wrappers around MRTK components
    - This will protect against future MRTK ingestions and updates
- Review & explore sample scenes provided in MRTK (especially *HandInteractionExamples.scene*)
- Rebuild canvas-based UI with quads, colliders and TextMeshPro text instead

### Testing your application

Now that HoloLens 2 components and capabilities are available in MRTK version 2, as of [RC1](https://github.com/Microsoft/MixedRealityToolkit-Unity/releases/tag/v2.0.0-RC1), you can simulate the hand interactions directly in Unity, and develop against the new APIs for hand interactions and eye tracking.  The HoloLens 2 device is required to create a great experience, but at least one could start learning in the tools and documentation. Further, MRTK v2 supports development on HoloLens (1st gen) and thus, traditional input models such as select via air-tap can still be tested on HoloLens (1st gen) devices. 

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


## Additional learnings from moving apps from x86 to ARM

- Straight Unity apps are simple as you can build an ARM appx bundle or deploy directly to the device and it runs.
The challenge comes when the Unity app uses native plugins.  All of the native plugins need to be upgraded to VS2017 and rebuilt for ARM, and with Unity 2019, ARM64.

- One app, used the AudioKinetic Wwise plugin for Unity, and the version used didn’t have a UWP ARM plugin. It took several days to re-work the sound in the application to work on ARM.

- In other cases, a UWP/ARM plugin may not exist for app-required plugins, blocking the ability to port and run on HoloLens 2.  Engagement with the plugin provider may be needed to unblock and support ARM.

- The minfloat (and variants such as min16float, minint, etc…) in shaders may behave differently on HoloLen 2 than on HoloLens (1st gen). Specifically, these guarantee that “at least the specified number of bits will be used”. On Intel/Nvidia GPUs, these are largely just treated as 32 bits. On ARM, the number of bits specified is actually respected. That means that in practice, these numbers may have less precision/range on HoloLens 2 than they did on HoloLens (1st gen).

- The _asm instructions don’t appear to work on ARM, meaning any code using _asm instructions will have to be rewritten.

- The SIMD instruction set is not supported on ARM. This means various headers, such as xmmintrin.h, emmintrin.h, tmmintrin.h, and immintrin.h are not available on ARM.

- The shader compiler on ARM runs during the first draw call after the shader has been loaded or something the shader relies on has changed, not at shader load time. The impact on framerate can be very noticeable, depending on how many shaders need to be compiled. This has various implications for how shaders should be handled/packaged/updated differently on HoloLens 2 vs HoloLens (1st gen).

## See also
* [Getting started with MRTK version 2](mrtk-getting-started.md)
* [MRTK Version 2 HowTo](https://microsoft.github.io/MixedRealityToolkit-Unity/External/HowTo/README.html)
* [Install the tools](install-the-tools.md)
* [Recommended settings for Unity](recommended-settings-for-unity.md)
* [Understanding performance for Mixed Reality](understanding-performance-for-mixed-reality.md)


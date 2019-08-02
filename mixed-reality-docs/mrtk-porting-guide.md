---
title: Getting your application ready for HoloLens 2
description: Targeted at developers who have an existing app on HoloLens (1st gen) and/or older MRTK, and looking to port to MRTK version 2 and HoloLens 2.
author: grbury
ms.author: grbury
ms.date: 04/12/19
ms.topic: article
ms.localizationpriority: high
keywords: Windows Mixed Reality, test, MRTK, MRTK version 2, HoloLens 2
---

# Getting your existing application ready for HoloLens 2

This guide is tailored to help developers who have an existing Unity application for HoloLens (1st gen) to port their application for the HoloLens 2 device. There are four key steps to porting a HoloLens (1st gen) Unity application to HoloLens 2. The sections below  detail information for each stage. 

| Step 1 | Step 2 | Step 3 | Step 4 |
|----------|-------------------|-------------------|-------------------|
| ![Visual Studio logo](images/visualstudio_logo.png) | ![Unity logo](images/unity_logo.png)| ![Unity icon](images/hololens2_icon.jpg) | ![MRTK logo](images/MRTKIcon.jpg) |
| Download latest tools | Update Unity Project | Compile for ARM | Migrate to MRTK v2

It is **highly recommended** that, before beginning the porting process, developers use source control to save a snapshot of the original state of their application. Additionally, it is recommended to *save* checkpoint states at various points during the process. It can also be very helpful to have another Unity instance of the original applicaiton to allow for side-by-side comparison during the porting process. 

> [!NOTE]
> Before porting, ensure you have the latest tools installed for Windows Mixed Reality development. For most existing HoloLens developers, this primarily involves updating to the latest version of Visual Studio 2019, and installing the appropriate Windows SDK. The content that follows dives further into different Unity versions and the Mixed Reality Toolkit (MRTK) Version 2.
>
> For more information, please see [Install the tools](install-the-tools.md).

## Migrate project to latest version of Unity

If you are using [MRTK v2](https://github.com/microsoft/MixedRealityToolkit-Unity), then [Unity 2018 LTS](https://unity3d.com/unity/qa/lts-releases) is the best long-term support path with no breaking changes in Unity or in MRTK. Also, the MRTK v2 always guarantees support for Unity 2018 LTS, but does not necessarily guarantee support for every iteration of Unity 2019.x. 

To help clarify additional differences between [Unity 2018 LTS](https://unity3d.com/unity/qa/lts-releases) and Unity 2019.1.x, the following outlines the trade-offs between these two versions. The primary difference between the two is the ability to compile for ARM64 in Unity 2019. 

Developers should assess any [plugin dependencies](https://docs.unity3d.com/Manual/Plugins.html) that currently exist in their project, and whether or not these DLLs can be built for ARM64. If a hard dependency plugin cannot be built for ARM64, then you will have to use Unity 2018 LTS.


| Unity 2018.3.x | Unity 2019.1+ |
|----------|-------------------|
| ARM32 build support | ARM32 and ARM64 build support |
| Stable LTS build release | Beta stability |
| [.NET Scripting back-end](https://docs.unity3d.com/Manual/windowsstore-dotnet.html) *deprecated* | [.NET Scripting back-end](https://docs.unity3d.com/Manual/windowsstore-dotnet.html) *removed* |
| UNET Networking *deprecated* | UNET Networking *deprecated* |

## Update scene/project settings in Unity

After updating to [Unity 2018 LTS](https://unity3d.com/unity/qa/lts-releases) or Unity 2019+, it is recommended to update particular settings in Unity for optimal results on the device. These settings are outlined in detail under **[Recommended settings for Unity](Recommended-settings-for-Unity.md)**.

It should be re-iterated that the [.NET scripting back-end](https://docs.unity3d.com/Manual/windowsstore-dotnet.html) is being deprecated in Unity 2018 and *removed* in Unity 2019. Dvelopers should strongly consider switching their project over to [IL2CPP](https://docs.unity3d.com/Manual/IL2CPP.html). 

> [!NOTE]
> IL2CPP scripting back-end can cause longer build times from Unity to Visual Studio, and developers should set up their developer machine for [optimizing IL2CPP build times](https://docs.unity3d.com/Manual/IL2CPP-OptimizingBuildTimes.html).
> It might also be beneficial to set up a [cache server](https://docs.unity3d.com/Manual/CacheServer.html), especially for Unity projects with a large amount of assets (excluding script files) or constantly changing scenes and assets. When opening a project, Unity stores qualifying assets into an internal cache format on the developer machine. Items must be re-imported and re-processed when modified. This process can be done once and saved in a cache server and consequently shared with other developers to save time, as opposed to every developer processing the re-import of new changes locally.

After addressing any breaking changes after moving to the updated Unity version, developers should build and test their current applicationss on HoloLens (1st gen). This is a good time to create and save a commit into source control. 

## Compile dependencies/plugins for ARM processor

HoloLens (1st gen) executes applications on an x86 processor while the HoloLens 2 uses an ARM processor. Therfore, existing HoloLens applications need to be ported over to support ARM. As noted earlier, Unity 2018 LTS supports compiling for ARM32 apps while Unity 2019.x supports compiling for ARM64 apps. Developing for ARM64 applications is generally preferred as there is a material difference in performance. However, this requires all [plugin dependencies](https://docs.unity3d.com/Manual/Plugins.html) to also be built for ARM64. 

Review all DLL dependencies in your application. It is advisable to remove from your project any depencency that is no longer needed. For remaining plugins that are required, ingest the respective ARM32 or ARM64 binaries into your Unity project. 

After ingesting the relevant DLLs, build a Visual Studio solution from Unity, and then compile an AppX for ARM in Visual Studio to test that your application can be built for ARM processors. It is advised to save the applicaiton as a commit in your source control solution. 

## Update to MRTK version 2

[MRTK Version 2](https://github.com/microsoft/MixedRealityToolkit-Unity) is the new toolkit on top of Unity that supports both HoloLens (1st gen) and HoloLens 2, and where all of the new HoloLens 2 capabilities have been added, such as hand interactions and eye tracking.

Please read the following for more information on using MRTK version 2:
- [MRTK Landing Page](https://microsoft.github.io/MixedRealityToolkit-Unity/README.html)
- [Getting started with MRTK](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/GettingStartedWithTheMRTK.html)
- [MRTK Hands](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/InputSystem/HandTracking.html)
- [MRTK Eye Tracking](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_Main.html)

### Prepare for the migration

Before ingesting the new [*.unitypackage files for MRTK v2](https://github.com/Microsoft/MixedRealityToolkit-Unity/releases), it is recommended to take an inventory of **1) any custom-built code that integrates with MRTK v1** and **2) any custom-built code for input interactions or UX components**. The most common and prevalent conflict for a mixed reality developer ingesting MRTK v2 involves input and interactions. It is advised to begin reading and understanding the [MRTK v2 input model](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/Input/Overview.html).

Finally, the new [MRTK v2](https://github.com/microsoft/MixedRealityToolkit-Unity) has transitioned from a model of scripts and in-scene manager objects to a configuration and services provider architecture. This results in a cleaner scene hierarchy and architecture model but requires a learning curve for understanding the new configuration profiles. Thus, please read the [Mixed Reality Toolkit Configuration Guide](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/MixedRealityConfigurationGuide.html) to start becoming familiar with the important settings and profiles to adjust to the needs of your application. 

### Perform the migration

After importing [MRTK v2](https://github.com/microsoft/MixedRealityToolkit-Unity), your Unity project most likely has many compiler related errors. These are commonly due to the new namespace structure and new component names. Proceed to resolve these errors by modifying your scripts to the new namespaces and components. 

For more information on specific API differences between HTK/MRTK and MRTK Version 2, see the porting guide on the [MRTK Version 2 wiki](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/HTKToMRTKPortingGuide.html).

### Best practices

- Prefer use of the [MRTK standard shader](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_MRTKStandardShader.html).
- Work on one breaking change type at a time (ex: IFocusable to [IMixedRealityFocusHandler](https://microsoft.github.io/MixedRealityToolkit-Unity/api/Microsoft.MixedReality.Toolkit.Input.IMixedRealityFocusHandler.html)).
- Test after every change and use source control.
- Use default MRTK UX (buttons, slates, etc) when possible.
- Refrain from modifying MRTK files directly; create wrappers around MRTK components.
    - This protects against future MRTK ingestions and updates.
- Review and explore sample scenes provided in the MRTK, especially *HandInteractionExamples.scene*.
- Rebuild canvas-based UI with quads, colliders, and TextMeshPro text.
- Enable [Depth Buffer Sharing](camera-in-unity.md#sharing-your-depth-buffers-with-windows) and/or [set focus point](focus-point-in-unity.md); use a 16-bit depth buffer for better performance. Ensure when rendering color, to also render depth. Unity generally does not write depth for transparent and text gameobjects. 
- Set Single Pass Instanced Rendering Path.
- Utilize the [Hololens 2 configuration profile for MRTK](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/Profiles/Profiles.html#hololens-2-profile)

### Testing your application

Now that HoloLens 2 components and capabilities are available in MRTK Version 2, as of [RC1](https://github.com/Microsoft/MixedRealityToolkit-Unity/releases/tag/v2.0.0-RC1), you can simulate hand interactions directly in Unity as well as develop with the new APIs for hand interactions and eye tracking. The HoloLens 2 device is required to create a satisfying user experience. Your are encouraged to start studying the documentation and tools for greaer understanding. [MRTK v2](https://github.com/microsoft/MixedRealityToolkit-Unity) supports development on HoloLens (1st gen), and traditional input models, such as select via air-tap can be tested on HoloLens (1st gen). 

## Updating your interaction model for HoloLens 2

Once your application is ported and prepped for HoloLens 2, you're ready to consider updating your interaction model and hologram design placements.
In HoloLens (1st gen), your application likely has a gaze and commit interaction model with holograms relatively far away to fit into the field of view.

Steps to update your application design to be best suited for HoloLens 2:
1.	MRTK components: Per the pre-work, if you added [MRTK v2](https://github.com/microsoft/MixedRealityToolkit-Unity), there are various components/scripts to leverage that have been designed and optimized for HoloLens 2.

2.	Interaction model: Consider updating your interaction model. For most scenarios, we recommend switching from gaze and commit to hands. With your holograms typically being out of arms reach, switching to hands results in far interaction pointing rays and grab gestures.

3.	Hologram placement: After switching to a hands interaction model, consider moving some holograms closer to directly interact with them with your hands using near interaction grab gestures. The types of holograms recommended to move closer to directly grab or interact are small target menus, controls, buttons, and smaller holograms that fit within the HoloLens 2 field of view when grabbing and inspecting the hologram.
<br>
Every application and scenario is different, and we’ll continue to refine and post design guidance based on feedback and continued learnings.


## Additional caveats and learnings about moving applications from x86 to ARM

- Straight-forward Unity applications are simple because you can build an ARM application bundle or deploy directly to the device for the bundle to run. Some Unity native plugins can present certain development challenges. Because of this, you must upgrade all Unity native plugins to Visual Studio 2019, and then rebuilt for ARM with Unity 2019, ARM64.

- One application used the Unity AudioKinetic Wwise plugin, and that version of Unity did not have a UWP ARM plugin, which caused a considerable effort to re-work sound capabilities into the applicaion in question to run on ARM. Ensure that all required plugins for you development plans are installed and available in Unity.

- In some cases, a UWP/ARM plugin might not exist for application-required plugins, which blocks the ability to port the application and run it on HoloLens 2. Contact your plugin provider to resolve the issue and provide support for ARM.

- The minfloat (and variants such as min16float, minint, etc…) in shaders might behave differently on HoloLen 2 than on HoloLens (1st gen). Specifically, these guarantee that at least the specified number of bits will be used. On Intel/Nvidia GPUs for instance, these are largely just treated as 32 bits. On ARM, the number of bits specified is actually adhered to. That means in practice, these numbers might have less precision or range on HoloLens 2 than they did on HoloLens (1st gen).

- The _asm instructions don’t appear to work on ARM, meaning any code using _asm instructions must be rewritten.

- The SIMD instruction set is not supported on ARM because various headers, such as xmmintrin.h, emmintrin.h, tmmintrin.h, and immintrin.h, are not available on ARM.

- The shader compiler on ARM runs during the first draw call after the shader has been loaded or something the shader relies on has changed, not at shader load time. The impact on framerate can be very noticeable, depending on how many shaders need to be compiled. This has various implications for how shaders should be handled, packaged, updated differently on HoloLens 2 vs HoloLens (1st gen).

## See also
* [Install the tools](install-the-tools.md)
* [Getting started with MRTK version 2](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/GettingStartedWithTheMRTK.html)
* [HTK APIs to MRTK APIs](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/HTKToMRTKPortingGuide.html)
* [Recommended settings for Unity](recommended-settings-for-unity.md)
* [Understanding performance for Mixed Reality](understanding-performance-for-mixed-reality.md)


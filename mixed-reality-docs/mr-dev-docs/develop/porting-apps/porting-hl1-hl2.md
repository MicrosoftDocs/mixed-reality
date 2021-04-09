---
title: Porting HoloLens (1st Gen) apps to HoloLens 2
description: Designed for developers who have an existing app on HoloLens (1st gen) and older MRTK versions who are looking to port to MRTK version 2 and HoloLens 2.
author: hferrone
ms.author: grbury
ms.date: 12/9/2020
ms.topic: article
ms.localizationpriority: high
keywords: Windows Mixed Reality, test, MRTK, MRTK version 2, HoloLens 2, unity, porting, HoloLens 1st gen, mixed reality headset, windows mixed reality headset, virtual reality headset, migration, best practices, ARM
---

# Porting HoloLens (1st Gen) apps to HoloLens 2

This guide is tailored to help developers with an existing Unity application for HoloLens (1st gen) port their application for the HoloLens 2 device. There are four key steps to porting a HoloLens (1st gen) Unity application to HoloLens 2. 

The sections below detail information for each stage:

| Step 1 | Step 2 | Step 3 | Step 4 |
|----------|-------------------|-------------------|-------------------|
| ![Visual Studio logo](../images/visualstudio_logo.png) | ![Unity logo](../../design/images/logo-unity.png)| ![Unity icon](../unity/images/hololens2_icon.jpg) | ![MRTK logo](../../design/images/74-12.png) |
| Download latest tools | Update Unity Project | Compile for ARM | Migrate to MRTK v2

## Prerequisites

We **highly recommended** using source control to save a snapshot your applications original state before starting the porting process. Additionally, we recommend *saving* checkpoint states at various times during the process. It can also be helpful to have another Unity instance of the original application to compare side by side during the porting process. 

> [!NOTE]
> Before porting, ensure you have the latest tools installed for Windows Mixed Reality development. For most existing HoloLens developers, this involves updating to the latest version of Visual Studio 2019 and installing the appropriate Windows SDK. The content that follows dives further into different Unity versions and the Mixed Reality Toolkit (MRTK) Version 2.
>
> For more information, please see [Install the tools](../install-the-tools.md).

## Migrate project to the latest version of Unity

If you're using [MRTK v2](https://github.com/microsoft/MixedRealityToolkit-Unity), [Unity 2019 LTS](https://unity3d.com/unity/qa/lts-releases) is the best long-term support path with no breaking changes in Unity or in MRTK. Assess any [plugin dependencies](https://docs.unity3d.com/Manual/Plugins.html) that currently exist in your project, and determine whether these DLLs can be built for ARM64. For projects with a hard ARM64 dependent plugin, you may need to continue building your app for ARM.

<!-- MRTK v2 always guarantees support for Unity 2018 LTS, but does not necessarily guarantee support for every iteration of Unity 2019.x.

To help clarify additional differences between [Unity 2018 LTS](https://unity3d.com/unity/qa/lts-releases) and Unity 2019.x, the following table outlines the trade-offs between the two versions. The primary difference between the two is the ability to compile for ARM64 in Unity 2019.

| Unity 2018 LTS | Unity 2019.x |
|----------|-------------------|
| ARM32 build support | ARM32 and ARM64 build support |
| Stable LTS build release | Beta stability |
| [.NET Scripting back-end](https://docs.unity3d.com/2018.4/Documentation/Manual/windowsstore-dotnet.html) *deprecated* | [.NET Scripting back-end](https://docs.unity3d.com/2018.4/Documentation/Manual/windowsstore-dotnet.html) *removed* |
| UNET Networking *deprecated* | UNET Networking *deprecated* |

-->

## Update scene/project settings in Unity

After updating to [Unity 2019 LTS](https://unity3d.com/unity/qa/lts-releases), it's recommended that you update particular settings in Unity for optimal results on the device. These settings are outlined in detail under [recommended settings for Unity](../unity/Recommended-settings-for-Unity.md).

To reiterate, the [.NET scripting back-end](https://docs.unity3d.com/Manual/windowsstore-dotnet.html) is being deprecated in Unity 2018 and **removed** in Unity 2019. Developers should strongly consider switching their project to [IL2CPP](https://docs.unity3d.com/Manual/IL2CPP.html).

> [!NOTE]
> IL2CPP scripting back-end can cause longer build times from Unity to Visual Studio, and developers should set up their developer machine for [optimizing IL2CPP build times](https://docs.unity3d.com/Manual/IL2CPP-OptimizingBuildTimes.html).
> It might also be beneficial to set up a [cache server](https://docs.unity3d.com/Manual/CacheServer.html), especially for Unity projects with a large amount of assets (excluding script files) or constantly changing scenes and assets. When opening a project, Unity stores qualifying assets into an internal cache format on the developer machine. Items must be re-imported and re-processed when modified. This process can be done once and saved in a cache server and consequently shared with other developers to save time, as opposed to every developer processing the re-import of new changes locally.

After addressing any breaking changes from moving to the updated Unity version, build and test your current applications on HoloLens (1st gen). This is a good time to create and save a commit into source control.

## Compile dependencies/plugins for ARM processor

HoloLens (1st gen) executes applications on an x86 processor while the HoloLens 2 uses an ARM processor. Existing HoloLens applications need to be ported over to support ARM. As noted earlier, Unity 2018 LTS supports compiling ARM32 apps while Unity 2019.x supports compiling ARM32 and ARM64 apps. Developing for ARM64 applications is preferred, as there's a material difference in performance. However, this requires all [plugin dependencies](https://docs.unity3d.com/Manual/Plugins.html) to also be built for ARM64.

Review all DLL dependencies in your application. We recommend removing dependencies that are no longer needed for your project. For remaining plugins that are required, ingest the respective ARM32 or ARM64 binaries into your Unity project.

After ingesting the relevant DLLs, build a Visual Studio solution from Unity and compile an AppX for ARM in Visual Studio to test your application can be built for ARM processors. It's advised to save the application as a commit in your source control solution.

> [!IMPORTANT]
> Application's using MRTK v1 can be run on HoloLens 2 after changing the build target to ARM, assuming that all other requirements are met. This includes making sure you have ARM versions of all your plugins. However, your app won't have access to HoloLens 2 specific functions like articulated hand and eye tracking. MRTK v1 and MRTK v2 have different namespaces that allow both versions to be in the same project, which is useful for transitioning from one to the other.

## Update to MRTK version 2

[MRTK Version 2](https://github.com/microsoft/MixedRealityToolkit-Unity) is the new toolkit on top of Unity that supports both HoloLens (1st gen) and HoloLens 2. It's also where all the new HoloLens 2 capabilities have been added, such as hand interactions and eye tracking.

Check out the following resources for more information on using MRTK version 2:

- [MRTK - Documentation home](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity)
- [Installation guide](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/install-the-tools)
- [MRTK - Hand tracking](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/features/input/hand-tracking)
- [MRTK - Eye tracking](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/features/input/eye-tracking/eye-tracking-main)

### Prepare for the migration

Before ingesting the new [*.unitypackage files for MRTK v2](https://github.com/Microsoft/MixedRealityToolkit-Unity/releases), it's recommended to take an inventory of **1) any custom-built code that integrates with MRTK v1** and **2) any custom-built code for input interactions or UX components**. The most common and prevalent conflict for a mixed reality developer ingesting MRTK v2 involves input and interactions. It's advised to begin reading and understanding the [MRTK v2 input model](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/features/input/overview).

Finally, the new [MRTK v2](https://github.com/microsoft/MixedRealityToolkit-Unity) has transitioned from a model of scripts and in-scene manager objects to a configuration and services provider architecture. This results in a cleaner scene hierarchy and architecture model, but requires a learning curve for understanding the new configuration profiles. Read the [Mixed Reality Toolkit Configuration Guide](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/configuration/mixed-reality-configuration-guide) to start becoming familiar with the important settings and profiles to adjust to the needs of your application.

### Migrating the project

After importing [MRTK v2](https://github.com/microsoft/MixedRealityToolkit-Unity), your Unity project most likely has many compiler-related errors. These are commonly because of the new namespace structure and new component names. continue to resolve these errors by modifying your scripts to the new namespaces and components.

For information on the specific API differences between HTK/MRTK and MRTK v2, see the porting guide on the [MRTK Version 2 wiki](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/updates-deployment/htk-to-mrtk-porting-guide).

### Best practices

- Prefer use of the [MRTK standard shader](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/features/rendering/mrtk-standard-shader).
- Work on one breaking change type at a time (ex: IFocusable to [IMixedRealityFocusHandler](https://docs.microsoft.com/dotnet/api/microsoft.mixedreality.toolkit.input.imixedrealityfocushandler)).
- Test after every change and use source control.
- Use default MRTK UX (buttons, slates, and so on), when possible.
- Refrain from modifying MRTK files directly; create wrappers around MRTK components.
  - This action eases future MRTK ingestion and updates.
- Review and explore sample scenes provided in the MRTK, especially *HandInteractionExamples.scene*.
- Rebuild canvas-based UI with quads, colliders, and TextMeshPro text.
- Enable [Depth Buffer Sharing](../unity/camera-in-unity.md#sharing-depth-buffers) or [set focus point](../unity/focus-point-in-unity.md); prefer to use a 16-bit depth buffer for better performance. Ensure when rendering color, to also render depth. Unity generally doesn't write depth for transparent and text gameobjects.
- Set Single Pass Instanced Rendering Path.
- Use the [HoloLens 2 configuration profile for MRTK](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/features/profiles/profiles#hololens-2-profile)

### Testing your application

In MRTK Version 2, you can simulate hand interactions directly in Unity and develop with the new APIs for hand interactions and eye tracking. The HoloLens 2 device is required to create a satisfying user experience. You're encouraged to start studying the documentation and tools for greater understanding. [MRTK v2](https://github.com/microsoft/MixedRealityToolkit-Unity) supports development on HoloLens (1st gen) and traditional input models, such as select via air-tap can be tested on HoloLens (1st gen). 

## Updating your interaction model for HoloLens 2

> [!CAUTION]
> If your project is using any of the XR.WSA APIs, these are being phased out in favor of Unity's new XR input APIs in future Unity releases. You can find more information about the [XR input APIs here](https://docs.unity3d.com/Manual/xr_input.html).

Once your application is ported and prepped for HoloLens 2, you're ready to consider updating your interaction model and hologram design placements.
In HoloLens (1st gen), your application likely has a gaze and commit interaction model with holograms relatively far away to fit into the field of view.

Steps to update your application design to be best suited for HoloLens 2:
1.	MRTK components: Per the pre-work, if you added [MRTK v2](https://github.com/microsoft/MixedRealityToolkit-Unity), there are various components/scripts to leverage that have been designed and optimized for HoloLens 2.

2.	Interaction model: Consider updating your interaction model. For most scenarios, we recommend switching from gaze and commit to hands. With your holograms typically being out of arms-reach, switching to hands results in far interaction pointing rays and grab gestures.

3.	Hologram placement: After switching to a hands interaction model, consider moving some holograms closer to directly interact with them, by using near-interaction grab gestures with your hands. The types of holograms recommended to move closer to directly grab or interact are small target menus, controls, buttons, and smaller holograms that fit within the HoloLens 2 field of view when grabbing and inspecting the hologram.
<br>
Every application and scenario are different, and we’ll continue to refine and post design guidance based on feedback and continued learnings.


## Additional caveats and learnings about moving applications from x86 to ARM

- Straight-forward Unity applications are simple because you can build an ARM application bundle or deploy directly to the device for the bundle to run. Some Unity native plugins can present certain development challenges. Because of this, you must upgrade all Unity native plugins to Visual Studio 2019 and then rebuild for ARM.

- One application used the Unity AudioKinetic Wwise plugin and that version of Unity didn't have a UWP ARM plugin, which caused a considerable effort to rework sound capabilities into the application in question to run on ARM. Ensure that all required plugins for your development plans are installed and available in Unity.

- In some cases, a UWP/ARM plugin might not exist for application-required plugins, which blocks the ability to port the application and run it on HoloLens 2. Contact your plugin provider to resolve the issue and provide support for ARM.

- The minfloat (and variants such as min16float, minint, and so on) in shaders might behave differently on HoloLens 2 than on HoloLens (1st gen). Specifically, these guarantee that at least the specified number of bits will be used. On Intel/Nvidia GPUs, minfloats are largely treated as 32 bits. On ARM, the number of bits specified is actually adhered to. That means in practice, these numbers might have less precision or range on HoloLens 2 than they did on HoloLens (1st gen).

- The _asm instructions don’t appear to work on ARM, meaning any code using _asm instructions must be rewritten.

- ARM doesn't support the SIMD instruction set because various headers, such as xmmintrin.h, emmintrin.h, tmmintrin.h, and immintrin.h, aren't available on ARM.

- The shader compiler on ARM runs during the first draw call after the shader has been loaded or something the shader relies on has changed, not at shader load time. The impact on framerate can be noticeable, depending on how many shaders need to be compiled, with implications for how shaders should be handled, packaged, updated differently on HoloLens 2 vs HoloLens (1st gen).

## See also

* [Install the tools](../install-the-tools.md)
* [MRTK - Installation guide](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/install-the-tools)
* [MRTK - Documentation home](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity)
* [Porting from HoloToolkit/MRTK to MRTK version 2](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/updates-deployment/htk-to-mrtk-porting-guide)
* [Recommended settings for Unity](../unity/recommended-settings-for-unity.md)
* [Understanding performance for Mixed Reality](../platform-capabilities-and-apis/understanding-performance-for-mixed-reality.md)

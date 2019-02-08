---
title: Performance recommendations for immersive headset apps
description: Instructions for improving performance, and information related to performance 
author: keluecke
ms.author: keluecke
ms.date: 03/21/2018
ms.topic: article
keywords: Performance, Speed, Perf, Slow, Fast, Immersive, Unity, Render, Render Target, Viewport, Scale, Improve, Adaptive, GPU, CPU, analysis, quality, bucket, Tools, optimise, Analyzers, graphics, buckets, toolkit, framerate, fps, time, dynamic, information, info
---



# Performance recommendations for immersive headset apps

## Hardware targets

**Windows Mixed Reality Ultra PCs** will consist of [desktops and laptops with discrete graphics (plus additional requirements)](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines) and will support experiences at 90Hz.

**Windows Mixed Reality PCs** will consist of [desktops and laptops with integrated graphics (plus additional requirements)](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines) and will support experiences at 60Hz. To more easily distinguish the two PC targets, we'll refer to these PCs as "core" (differentiated from "ultra") through the rest of this article.

If you target just Windows Mixed Reality Ultra PCs for your experience, it will have more power at its disposal, but you'll also be limiting your audience. Conversely, if you target Windows Mixed Reality "core" PCs for your experience, you'll have a much larger audience, but won't be offering unique performance value to customers with higher-end Windows Mixed Reality Ultra PCs. Thus, a hybrid approach for your VR experience may be the best of both worlds.

We recommend testing your app on the lowest-end hardware in each category you intend to support. When targeting Windows Mixed Reality Ultra PC's, that would be a PC with an NVidia GTX 1050 or Radeon RX 460 GPU. Since laptops often have additional performance constraints, we recommend testing with a laptop with one of those GPUs. A list of Windows Mixed Reality PCs and Windows Mixed Reality Ultra PCs you can purchase for testing purposes will be coming soon.

## Performance targets

### Framerate targets

The target framerate for your VR experience on Windows Mixed Reality immersive headsets will be either 60Hz or 90Hz depending on which [Windows Mixed Reality compatible PCs](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines) you wish to support.

For the PC you're currently using, you can determine its target framerate by checking the [holographic frame duration](https://docs.microsoft.com/uwp/api/Windows.Graphics.Holographic.HolographicFrame#Duration), or, in Unity, checking the device’s [refresh rate](https://docs.unity3d.com/ScriptReference/XR.XRDevice-refreshRate.html).

## Optimizing performance for Unity apps

Unity has many resources available with guidance on how to optimize your app:
* [Optimisation for VR in Unity](https://unity3d.com/learn/tutorials/topics/virtual-reality/optimisation-vr-unity)
* [Performance Optimization Tutorial](https://unity3d.com/learn/tutorials/topics/performance-optimization)
* [Optimizing Graphics Rendering in Unity Games](https://unity3d.com/learn/tutorials/temas/performance-optimization/optimizing-graphics-rendering-unity-games)
* [Optimizing Graphics Performance](https://docs.unity3d.com/Manual/OptimizingGraphicsPerformance.html)

Hitting performance targets on Windows Mixed Reality PCs usually has two phases. First, improvement of the overall performance of the app without downgrading the experience. Second, finding performance/design tradeoffs that can be made on lower end machines to hit framerate. These tradeoffs include things like modifying assets, behavior, and quality settings.

### Performance toolkit

We have provided a series of tools in the Mixed Reality Toolkit to help find and evaluate these tradeoffs, as well as provided the scaffolding to allow apps to only make these tradeoffs on machines where they are necessary. You may find these as a [Unity package on GitHub](https://github.com/keluecke/MixedRealityToolkit-Unity/blob/master/External/Unitypackages/AdaptivePerformance.unitypackage). The tools in this package are:
* **Performance Display**: This will overlay the app’s current and target framerates, as well as any other information you choose to show. Use this tool to identify scene and computers where your app does not hit framerate and evaluate the performance impact of design tradeoffs. To use this package, find the PerformanceDisplay prefab in the prefabs folder and drag it onto your main camera.
* **Adaptive Performance**: This tool is the heart of the toolkit. Use it to define different levels of performance settings and switch between them. In this script you may define performance buckets that may include changes to quality settings, viewport scale, as well as triggers to change things like materials on objects. To see the effect a design tradeoff has on the performance of your app, apply in one of these buckets and use FPSDisplay to compare frame rate with and without it.
* **Viewport Scale Manager**: This tool manages the [viewport scale](performance-recommendations-for-immersive-headset-apps.md#dynamic-resolution-scaling) rendered.
* **Quality Manager**: This tool makes it easy to change the [unity quality settings](https://docs.unity3d.com/Manual/class-QualitySettings.html) while running the game.
* **Shader Control**: This tool enables apps to use simpler shaders on lower end machines. This script subscribes the `OnPerformanceBucketChanged` event in `AdaptivePerformance.cs` and looks for a bucket value called `ShaderLevel` to determine which material to use. The script must configured for each object that needs a material change.
* **GPU Whitelist**: This class identifies the GPU manufacturer and type and groups them into loose performance buckets. This can help you to pick a starting performance bucket that is most likely to work out well for users. It also contains a function for reporting machine configuration through unity analytics. We recommend whenever your app switches buckets, it sends this information along with the bucket you are switching into in order to track performs on different systems.
* **Performance Counter**: This tool contains logic to measure the framerate of your app adapt your settings accordingly. It relies on the adaptive performance tool and requires defined performance buckets. More information is at the very end of [Adapting app quality to each machine](performance-recommendations-for-immersive-headset-apps.md).

### Performance analysis

To do an initial performance test, we recommend having at least the PerformanceDisplay and ViewportScaleManager imported and working in your project. Then build a version of your app in Unity that is not a developer build. Target ‘Master’ and ‘x64’ in your Visual Studio configuration and run the built app on a minimum spec computer without debugging attached. With this build look at how the actual framerate compares with the target framerate. Run through your whole experience this way to see where the biggest changes need to be made. If your framerate is consistently below the target, try to figure out which of the following three places your bottleneck is:
1. **GPU**. The rending of objects.
2. **App thread on the CPU**. Unity’s game logic, including everything called in ‘Update’, physics and animation.
3. **Render thread on the CPU**. This thread does all the background work queuing work for the GPU.

To figure this out, you may try decreasing the viewport scaling factor. If that improves your framerate, then you are likely GPU bound. Conversely, if decreasing the viewport does not improve your FPS, then you are likely CPU bound. You may use the [Unity Profiler](performance-recommendations-for-immersive-headset-apps.md#unity-performance-profiler) to help understand if you are CPU bound on the render or app thread. The [Windows Performance Analyzer](performance-recommendations-for-immersive-headset-apps.md#windows-performance-analyzer) is another tool that is quite good at identifying this which of the three places you are bound on.

**GPU bound scenes**

There are quite a few things you can do on a GPU bound game. The first step is to start identifying issues with a profiler. Either the [Unity frame debugger](performance-recommendations-for-immersive-headset-apps.md#unity-frame-debugger) or Intel GPA (especially if you have an intel GPU to test on) will work well for this. Some easy things to look for here are:
1. **Reduce the number of full screen passes**.
  * **Use [single pass instanced rendering](https://docs.unity3d.com/Manual/SinglePassStereoRenderingHoloLens.html)**. This might involve modifying some shaders, but should give you a performance boost without reducing graphic quality.
  * **Turn off [HDR](https://docs.unity3d.com/Manual/HDR.html)**. HDR requires an extra texture copy per frame. Disabling this should get you a performance win.
  * **Remove, replace or reduce MSAA**. Anti-aliasing is quite expensive and hardware MSAA can be quite slow on lower end machines. Unity allows you to turn this off or reduce the number of passes in its [quality settings](https://docs.unity3d.com/Manual/class-QualitySettings.html) or you can try some software ones such as FXAA in Unity's post effect pipeline.
  * **Use Unity's [post effects pipeline](https://www.assetstore.unity3d.com/en/#!/content/83912)**. If you are using more than one post processing effect, you may want to consider removing some or combining them, either manually or with this pipeline.
2. **Reduce poly count**. You may want to create lower poly models for many of your most complicated assets. [Simplygon](https://www.simplygon.com/) can automate this. Unity's [LOD System](https://docs.unity3d.com/Manual/LevelOfDetail.html) is useful here and can be configured in your [Unity Settings](https://docs.unity3d.com/Manual/class-QualitySettings.html)
3. **Reduce number of particles**. Particle effects can be quite expensive, and sometimes having fewer can still give you the effect you want without reducing framerate.
4. **Reduce the resolution**. You can take advantage of [dynamic resolution scaling](performance-recommendations-for-immersive-headset-apps.md#dynamic-resolution-scaling) or decide to reduce the [default render target size](performance-recommendations-for-immersive-headset-apps.md#default-render-target-size).
5. **Improve shader performance**. If you find an object with a high render time on its own, you can try swapping out the shader for some of the fast shaders found in the [Mixed Reality Toolkit](https://github.com/Microsoft/MixedRealityToolkit-Unity/tree/master/Assets/HoloToolkit/Utilities/Shaders). You can also optimize your shaders yourself. Unity can compile your shaders for you and show you how many operations they call, which can help compare relative speed. To see this, navigate to a shader in your project menu, and in the inspector menu click the “compile and show code” button. A Visual Studio window should open with stats like these:

**Shader stats output:**
```
// Stats for Vertex shader:
//        d3d11: 39 math
// Stats for Fragment shader:
//        d3d11: 4 math, 1 texture
```

**App thread CPU bound scenes**

For reducing app thread time, the [Unity Profiler](performance-recommendations-for-immersive-headset-apps.md#unity-performance-profiler) is your friend. Strategies we've found useful are:
1. **Cache data, and avoid expensive calls**:
  * GetComponent
  * FindObjectOfType
  * RaycastAll
  * Anything that traverses the scene graph.
  * Even static accessors, like Vector3.zero, are faster when cached as class variables.
2. **Simplify animations**. Often similar effects can be achieved by simplifying animations, or removing extra ones.
3. **Pool your objects**. [Object pooling](https://unity3d.com/learn/tutorials/topics/scripting/object-pooling) can be extremely effective especially if allocations are costing you performance.
4. **Simplify physics**. Reducing the number of iterations can improve performance significantly. Unfortunately, this usually has behavior consequences, so make sure to *test these changes*.
5. **Reduce complexity of tools**. Inverse kinematics and path finding can both be quite expensive, if you are using a complex algorithm like this, try to find simpler algorithms or adjust thier settings to improve performance.

**Render thread CPU bound scenes**

If your game is render thread bound, as shown by either the [Unity Profiler](performance-recommendations-for-immersive-headset-apps.md#unity-performance-profiler) or the [Windows Performance Analyzer](#windows-performance-analyzer), try:
1. **Use [single pass instanced rendering](https://docs.unity3d.com/Manual/SinglePassStereoRenderingHoloLens.html)**. This might involve modifying some shaders, but can roughly cut your render thread time in half, as you no longer need to do two scene traversals.
2. **Follow [Unity’s excellent guide](https://unity3d.com/learn/tutorials/temas/performance-optimization/optimizing-graphics-rendering-unity-games)** on the topic. Starting from the ‘Graphics jobs’ section, this article has an extensive list of suggestions for this problem.

Once you've improved performance across your app, you can use the same tool to set up adaptive quality and viewport adjustment for your app.

### Adapting app quality to each machine

After adding this package to you project, you'll need to predefine a set of performance buckets corresponding to your different quality levels. The set must be ordered in a list starting with the highest performance settings (lower quality, small viewport) and going up to the lowest performance settings (high quality, full viewport). The set of buckets is hard coded as an array field in `AdaptivePerformance.cs` script. You should see something like this: 

**Adaptive Performance Bucket Set:**
```
private PerformanceBucket[] perfBucketList=
    {
         new PerformanceBucket()
         {
             QualityLevel = 0,
             ViewportScale = 0.5f,
             ShaderLevel = 1
         },
         new PerformanceBucket()
         {
             QualityLevel = 5,
             ViewportScale = 1f,
             ShaderLevel = 0
        }
    };
```

These buckets should correspond to the settings you test and feel work well together, giving you better performance at potentially worse visual quality. Aside from the [viewport scale](performance-recommendations-for-immersive-headset-apps.md#dynamic-resolution-scaling) and the [Unity quality level](https://docs.unity3d.com/Manual/class-QualitySettings.html), there is also a ‘shader level’ example. This demonstrates how the adaptive performance toolkit may be extended beyond the parameters we provide by default.

To use the shader level, you need to add the `ShaderControl` component to the object who’s material you want to manage dynamically. In the inspector, add the default material as first entry in the material list. Then add more materials as needed. The first (the default) material is expected to be the most expensive. Materials in the following entries should be computationally less expensive than the preceding materials. The ShaderControl subscribes to get callbacks from AdaptivePerfomance when a performance bucket changes. When a bucket change occurs, if the component has a material with the same level as indicated by the new performance bucket, the said material will be used to render the object, improving performance.

You may add other values to buckets to tune other settings that you find improve performance. For example, you may want a parameter modifying the number of particles generated by particle effects. You could also add a “graphics tier” manager, similar to the quality manager already in the tool that allows you to change to different [graphics tiers](https://docs.unity3d.com/Manual/class-GraphicsSettings.html) dynamically.

**Choosing the correct bucket for a machine**

Choosing the correct bucket for a given machine has a few steps:
1. **Make an educated guess**. You may use the GPUWhitelist tool as a starting place to guess at the best settings when a user first runs your app.
2. **Adapt to a better bucket**. This tool contains logic for changing buckets automatically if you are missing your framerate target, or if your performing extremely well.
3. **Override with user setting**. The user knows what they want best! We recommend you expose your buckets in your UI and allow the user to pick between them if they desire.
4. **Improve your starting guess**. In the GPUWhitelist class, we provide the ` LogSystemInfo` function for sending back telemetry for which bucket each configuration ends up on. We recommend calling this on `AdaptivePerformance.cs`’s `ApplyBucketSettings` event to collect data on the best bucket for a given configuration. You may then use that collected data to improve your initial guess.

By default, the ‘adapt to a better bucket’ part of this is not running and can be turned on in `AdaptivePerformance.cs`. See [the readme] for more details.

When the adaptive manager is running it will analyze the performance over a period of time before making decision whether to move to a different quality bucket. Currently the adaptive manager supports 2 analyzers:

**Frame rate analyzer**

The frame rate analyzer measures the FPS over a time sample of half a second. When it accumulates samples over a period of 1 minute, the analyzer will check if at least 80% of the samples meet the target frame rate. If less than that meet the target frame rate, the adaptive manager switches to a lower quality bucket. If we are meeting the target frame rate consistently over 3 minutes, the adaptive manager will try a higher quality bucket. Note that if we had previously switched from a higher quality bucket to a lower quality bucket, the adaptive manager will not attempt a higher quality bucket if frame rate is consistently on target. All of these numbers are tunable constants defined at the top of ` FrameRateAdaptiveAnalyzer` in ` PerformanceAnalyzers.cs`

**GPU render time analyzer**

The GPU render time analyzer measures render time on the GPU. If that time exceeds 95% of the target time consistently for 5 frames, the adaptive manager will switch to a lower quality bucket. If the time is consistently less than 75% of the target time over the course of 5 frames, the adaptive manager will try a higher quality bucket. These numbers are tunable constants at the top of the ` GpuTimeAdaptiveAnalyzer ` class within ` PerformanceAnalyzers.cs`.

*Note*: Using this method has an impact on app performance, so we recommend going with the frame rate based method.

## Content guidance

### Considerations for Windows Mixed Reality "core" PCs

In order to hit performance goals on [Windows Mixed Reality "core" PCs](performance-recommendations-for-immersive-headset-apps.md#hardware-targets), you may need to reduce your quality settings in Unity, and/or reduce the viewport for those devices. Both of these modifications will have visual fidelity implications, however, low framerate can induce motion sickness in users, and we **strongly** recommend considering hitting the target framerate as a **requirement** for running your game. If you decide that the loss of visual fidelity in your game would be too great on lower spec machines, update your Windows Store description to discourage users with lower specifications from buying your game.

### Default render target size

[Windows Mixed Reality immersive headsets](immersive-headset-hardware-details.md) contain lenses which distort the presented image to give higher pixel density in the center of view, and lower pixel density in the periphery. In order to have the highest visual fidelity on Windows Mixed Reality Ultra devices, we set the render target’s pixel density to match the highly-dense center of the lens area. As this high pixel density is constant across the whole render target, we end up with a higher resolution than the headset's display. By contrast, other VR platforms may default to the render size of the display, which would require you to increase this size to get the correct pixel density in the center of the lensed image. This means that if you keep the default settings, your app may be rendering more pixels compared to other VR platforms, which might decrease performance but increase visual fidelity. If you have found on other platforms that you need to increase your render scale in order to achieve this high pixel density (in Unity 2017 the line would be something like `UnityEngine.XR.XRSettings.renderScale = 1.x`), you likely will want to remove this logic for our platform as it won’t gain you any added visual fidelity, and will cost you performance.

In order to hit the more difficult performance target of Windows Mixed Reality "core" PCs, we also lower the resolution target.

For either sort of device you may want to scale the default resolution target smaller in order to get back some GPU memory and reduce the number of rendered pixels. You may do this by setting the **"Windows.Graphics.Holographic.RenderTargetSizeScaleFactorRequest"** key in the property bag on the **CoreApplication**, however, it needs to be done before you create your holographic space and cannot be changed once you create your holographic space. In order to help you determine what systems might need such a change, we have provided a sample project you may use to get information about the system you are running on [here](https://github.com/keluecke/MixedRealityToolkit/tree/master/SystemInfoHelper/).

If you are running in C++ or with the IL2CPP backend of unity, add the following code to the Initialize function in your app.cpp file: 

**Sample C++ code for setting render scale with SystemInfoHelper Project:**
```
auto holographicDisplay = Windows::Graphics::Holographic::HolographicDisplay::GetDefault();
if (nullptr != holographicDisplay)
{
	double targetRenderScale = 1.0; auto systemInfo = ref new SystemInfoHelper::SystemInfo(holographicDisplay->AdapterId);
	SystemInfoHelper::RenderScaleOverride^ renderScaleOverride = systemInfo->ReadRenderScaleSpinLockSync();
	if (renderScaleOverride == nullptr || renderScaleOverride->MaxVerticalResolution != (int)holographicDisplay->MaxViewportSize.Height)
	{
		if (renderScaleOverride != nullptr)
		{
			// this deletes the file where we read the override values 
			// it is async but we shouldn't have to wait for it to finish 
			systemInfo->InvalidateRenderScaleAsync();
		}
		/// You may insert logic here to help you determine what your resolution 
		/// should be if you don't have one saved. SystemInfoHelper has some  
		/// functions that may be useful for this
		if (holographicDisplay->MaxViewportSize.Height < 1300.0)
			//  Performance constrained systems that are throttled by the OS will have a 
			//  max resolution of 1280x1280
		{
			// Set default render scale for performance constrained  systems here
			targetRenderScale = 0.8;
		}
	}
	else
	{
		targetRenderScale = renderScaleOverride->RenderScaleValue;
	}
	CoreApplication::Properties->Insert("Windows.Graphics.Holographic.RenderTargetSizeScaleFactorRequest", targetRenderScale);
}
```

As this value must be set before you can actually run your program and do any performance evaluation, you may find that you need to adjust it's value for the next startup. SystemInfoHelper has the ability to save and load a different value that you find might better suit how your app actually runs on the hardware.

### Dynamic resolution scaling

Viewport scaling (dynamic resolution scaling) is the practice of rendering your image to a smaller render target then your output device can display, and sampling from those pixels to display your final image. It trades visual fidelity for speed. Windows Mixed Reality devices support viewport scaling at a platform level. This means if you set the viewport to be smaller (in Unity: `UnityEngine.XR.XRSettings.renderViewportScale = 0.7f`) Unity will inform the platform it is rendering to a smaller section of the render target, and the platform will composite its display from that smaller section of the render target.

## Performance Tools

### Visual Studio

[Visual Studio Graphics Diagnostics](https://docs.microsoft.com/visualstudio/debugger/graphics/visual-studio-graphics-diagnostics) can debug immersive applications running on Windows Mixed Reality. Please note that GPU Usage is not supported for Window Mixed Reality.

### Windows Performance Analyzer

The Windows Performance Analyzer is particularly useful for identifying where you bottleneck is, as well as ensuring that you are taking full advantage of your PC’s resources. There are usually three places where your app can be performance constrained: App thread or render thread on the CPU, or GPU. This tool is great for finding out which ones are causing you the biggest issue. There is a great tutorial for using this [here](https://docs.unity3d.com/uploads/ExpertGuides/Analyzing_your_game_performance_using_Event_Tracing_for_Windows.pdf).

### Unity Performance Profiler

[The Unity Profiler](https://docs.unity3d.com/Manual/Profiler.html) is particularly useful if you are CPU bound, as it will show you how long you are spending in each update function. The most accurate performance measurements will come from profiling a deployed UWP app. To profile on a built UWP app, make sure you have turned on the InternetClient capability build with the developer build checkbox marked. To turn on InternetClient capability, go to Edit > Project Settings > Player, select “Publisher Settings” and under “Capabilities” check “InternetClient”. If you already know that you need to improve performance in a given scene, you may use play mode to iterate quickly, and you will likely see proportionate improvements in your UWP solution. If your bottleneck is in the GPU, you can still start with the Unity Profiler and make significant process. You may, for example, isolate which object seems to be causing you the most render issues by turning off all object in the unity hierarchy and turning them on selectively until you find one that takes a particularly ling time to render. Once you have discoved that, you can either try to simplify the object, or improve performance in its shader. The [Mixed Reality Toolkit](https://github.com/Microsoft/MixedRealityToolkit-Unity/tree/master/Assets/HoloToolkit/Utilities/Shaders) has some excellent, fast shaders that might be helpful.

### Unity Frame Debugger

The [Unity Frame Debugger](https://docs.unity3d.com/Manual/FrameDebugger.html) is useful if you are GPU bound. Pay attention to the draw order and the number of passes your app makes.

### Windows Device Portal

The [Windows Device Portal](using-the-windows-device-portal.md) lets you configure and manage your device remotely over a network or USB connection. It also provides [advanced diagnostic tools](https://docs.microsoft.com/windows/uwp/debug-test-perf/device-portal) to help you troubleshoot and view the real time performance of your Windows device.

### Intel® Graphics Performance Analyzers (Intel® GPA)

[Intel® Graphics Performance Analyzers (Intel® GPA)](https://software.intel.com/gpa) added support for Windows Mixed Reality on [December 21st 2017](https://software.intel.com/en-us/articles/intel-gpa-release-notes). The [Getting Started for Windows* Host](https://software.intel.com/en-us/gpa_getting_started_win#Analyzing_Microsoft_Windows_Mixed_Reality_Applications_on_Windows_Host) documentation has more details.

### Intel® Power Gadget

[Intel® Power Gadget](https://software.intel.com/en-us/articles/intel-power-gadget-20) is a software-based power usage monitoring tool enabled for Intel® Core™ processors (from 2nd Generation up to 6th Generation Intel® Core™ processors), Intel® Atom™ processors not supported. It includes an application, driver, and libraries to monitor and estimate real-time processor package power information in watts using the energy counters in the processor.

## See also
* Intel
  * [VR content developer guide](https://software.intel.com/en-us/articles/vr-content-developer-guide)
  * [How to plan optimizations with Unity](https://software.intel.com/en-us/articles/how-to-plan-optimizations-with-unity)
  * [Render queue ordering in Unity](https://www.youtube.com/watch?v=ijK8hI7pGZs)
  * [Optimizing VR hit game *Space Pirate Trainer*](https://software.intel.com/en-us/articles/optimizing-vr-hit-game-space-pirate-trainer-to-perform-on-intel-integrated-graphics)
* Unity
  * [Analyzing your game performance using Event Tracing for Windows](https://docs.unity3d.com/uploads/ExpertGuides/Analyzing_your_game_performance_using_Event_Tracing_for_Windows.pdf)
* [Performance recommendations for HoloLens apps](performance-recommendations-for-hololens-apps.md)
* [Case study - Scaling Datascape across devices with different performance](case-study-scaling-datascape-across-devices-with-different-performance.md)

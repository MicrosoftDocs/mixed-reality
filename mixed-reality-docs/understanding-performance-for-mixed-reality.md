---
title: Understanding Performance for Mixed Reality
description: Advanced topics and details on optimizing performance for Windows Mixed Reality Apps
author: Troy-Ferrell
ms.author: trferrel
ms.date: 3/26/2019
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Performance, Optimization, CPU, GPU
---

# Understanding performance for mixed reality

This article is an introduction into rationalizing the significance of performance for your Mixed Reality app.  User experience can be greatly degraded if your application does not run at optimal frame rate. Holograms will appear unstable and head tracking of the environment will be inaccurate leading to an poor experience for the user. Indeed, performance must be considered as a first class feature for Mixed Reality development and not a stabilization, end of cycle task.

For review, the performant framerate values for each target platform are listed below.

| Platform | Target Frame Rate |
|----------|-------------------|
| [HoloLens](hololens-hardware-details.md) | 60 FPS |
| [Windows Mixed Reality Ultra PCs](immersive-headset-hardware-details.md) | 90 FPS |
| [Windows Mixed Reality PCs](immersive-headset-hardware-details.md) | 60 FPS |

The framework below gives a general outline for best practices and understandings towards hitting target frame rates. To dive further into details, consider reading the [performance recommendations for Unity article](performance-recommendations-for-unity.md). In particular, this related article will discuss how to measure framerate in your Unity Windows Mixed Reality app as well as steps to take in the Unity environment to improve performance.

## Understanding performance bottlenecks

If your app has an underperforming framerate, the first step is to analyze and understand where your application is computationally intensive. There are two primary processors responsible for the work to render your scene: the CPU and the GPU. Each of these two components handle different operations and stages of your Mixed Reality app. There are three key places where bottlenecks may occur. 

1. **App Thread - CPU** -
    This thread is responsible for your app logic. This includes processing input, animations, physics, and other app logic/state
2. **Render Thread - CPU to GPU** - 
    This thread is responsible for submitting your draw calls to the GPU. When your app wants to render an object such as a cube or model, this thread sends a request to the GPU, which has an architecture optimized for rendering, to perform these operations.
3. **GPU** - 
    This processor most commonly handles the graphics pipeline of your application to transform 3D data (models, textures, etc) into pixels and ultimately produce a 2D image to submit to your device's screen.

![Lifetime of a Frame](images/lifetime-of-a-frame.png)

Generally, HoloLens applications will be GPU bounded. However, this does not hold true in every application and thus it is recommended to use the tools & techniques below to get to ground-truth for your particular app.

## How to analyze your application

There are many tools that allow you as a developer to understand the performance profile of your Mixed Reality application. These will enable you to both target where you have bottlenecks and how they are manifesting themselves to debug them.

This is a list of popular and powerful tools to gain deep profiling information for your application.
- [Intel Graphics Performance Analyzers](https://software.intel.com/gpa)
- [Visual Studio Graphics Debuggers](https://docs.microsoft.com/visualstudio/debugger/graphics/visual-studio-graphics-diagnostics?view=vs-2017)
- [Unity Profiler](https://docs.unity3d.com/Manual/Profiler.html)
- [Unity Frame Debugger](https://docs.unity3d.com/Manual/FrameDebugger.html)

### How to profile in any environment

There is a simple test to quickly determine if you are likely GPU bounded or CPU bounded in your application. If you decrease the resolution of the render target output, there are less pixels to calculate and thus, less work the GPU needs to perform to render an image. Viewport scaling (dynamic resolution scaling) is the practice of rendering your image to a smaller render target then your output device can display. The device will up-sample from the smaller set of pixels to display your final image.

After decreasing rendering resolution, if:
1) Application framerate **increases**, then you are likely **GPU Bounded**
1) Application framerate **unchanged**, then you are likely **CPU Bounded**

>[!NOTE]
>Unity provides the ability to easily modify the render target resolution of your application at runtime through the *[XRSettings.renderViewportScale](https://docs.unity3d.com/ScriptReference/XR.XRSettings-renderViewportScale.html)* property. The final image presented on device has a fixed resolution. The platform will sample the lower resolution output to build a higher resolution image for rendering on displays. 
>
>```CS
>UnityEngine.XR.XRSettings.renderScale = 0.7f;
>```

## How to improve your application

### CPU performance recommendations

Generally, most work in a mixed reality application on the CPU involves performing the "simulation" of the scene and processing extensive unique application logic. Thus, the following areas are usually targeted for optimization.

- Animations
- Simplify Physics
- Memory allocations
- Complex algorithms (i.e inverse kinematics, path-finding)

### GPU performance recommendations

#### Understanding bandwidth vs fill rate
When rendering a frame on the GPU, an application is generally either bounded by memory bandwidth or fill rate.

- **Memory bandwidth** is the rate of reads and writes the GPU can perform from memory
    - To identify bandwidth limitations, reduce texture quality and check if framerate improved.
    - In Unity, this can be done by changing **Texture Quality** in **Edit** > **Project Settings** > **[Quality Settings](https://docs.unity3d.com/Manual/class-QualitySettings.html)**.
- **Fill rate** refers to the throughput of rendered pixels that can be drawn per second by the GPU.
    - To identify fill rate limitations, decrease the display resolution and check if framerate improved. 
    - In Unity, this can be done via the  *[XRSettings.renderViewportScale](https://docs.unity3d.com/ScriptReference/XR.XRSettings-renderViewportScale.html)* property

Memory bandwidth generally involves optimizations to either
1) decrease texture resolutions
2) utilize less textures (i.e normals, specular, etc)

Fill rate is primarily focused on reducing the number of operations that need to be computed for a final rendered pixel. Examples of this commonly fall into reducing
1) number of objects to render/process
2) number of operations per shader
3) number of GPU stages to final result (geometry shaders, post-processing effects, etc)
4) number of pixels to render (i.e display resolution)

#### Reduce poly count
Higher polygon counts result in more operations for the GPU and reducing the number of polygons in your scene will reduce the amount of time to render that geometry. There are other factors involved as well in shading the geometry that can still be expensive but polygon count is the base metric to determine how expensive a scene will be to render.

#### Limit overdraw

High overdraw occurs when multiple objects are rendered but not outputted to the screen as they are hidden by another, generally closer, occluding object. Imagine looking at a wall that had multiple rooms and geometry behind it. All of the geometry would be processed for rendering but only the opaque wall really needs to be rendered as it occludes the view of all other content. This results in wasteful operations that are not needed for the current view.

#### Shaders

Shaders are small programs that run on the GPU and generally determine two important steps in rendering:
1) which object's vertices should be drawn on the screen and where they are in screen space (i.e the Vertex shader)
    - The Vertex shader is generally executed per vertex for every GameObject
2) what to color those pixels (i.e the Pixel shader)
    - The Pixel shader is executed per pixel for the texture being rendered for device present

Typically shaders perform many transformations and lighting calculations. Although complex lighting models, shadows, and other operations can generate fantastic results, they also come with a price. Reducing the number of operations computed in shaders can greatly reduce the overall work needed to be done by a GPU per frame.

##### Shader coding recommendations

- Use bilinear filtering whenever possible
- Rearrange expressions to use MAD intrinsics in order to do a multiply and an add at the same time
- Precalculate as much as possible on the CPU and pass as constants to the material
- **Favor moving operations from the pixel shader to the vertex shader**
    - Generally the # of vertices << # of pixels (i.e 720p == 921,600 pixels, 1080p == 2,073,600 pixels, etc)

#### Remove GPU stages
Post-processing effects can be very expensive and generally inhibit the fill rate of your application. This also includes anti-aliasing techniques such as MSAA. On HoloLens, it is recommended to avoid these techniques entirely. Furthermore, additional shader stages such as geometry, hull, and compute shaders should be avoided when possible.

## Memory recommendations
Excessive memory allocation & deallocation operations can have adverse effects on your holographic application resulting in inconsistent performance, frozen frames, and other detrimental behavior. It is especially important to understand memory considerations when developing in Unity since memory management is controlled by the garbage collector.

#### Object pooling

Object pooling is a popular technique to reduce the cost of continuous allocations & deallocations of objects. This is done by allocating a large pool of identical objects and re-using inactive, available instances from this pool instead of constantly spawning and destroying objects over time. Object pools are great for re-useable components that have variable lifetime during an app.

## See also
- [Performance recommendations for Unity](performance-recommendations-for-unity.md)
- [Recommended settings for Unity](recommended-settings-for-unity.md)

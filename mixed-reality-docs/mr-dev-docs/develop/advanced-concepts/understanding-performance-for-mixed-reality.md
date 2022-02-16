---
title: Understanding Performance for Mixed Reality
description: Learn advanced information and details for analyzing and optimizing Windows Mixed Reality app performance.
author: hferrone
ms.author: v-vtieto
ms.date: 08/16/2021
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Performance, Optimization, CPU, GPU
---

# Understanding performance for mixed reality

This article is an introduction to understanding the significance of performance for your Mixed Reality app.  User experience can be greatly degraded if your application doesn't run at optimal frame rate. Holograms will appear unstable and head tracking of the environment will be inaccurate, leading to a poor experience for the user. Performance must be considered a first class feature for mixed reality development and not a polish task.

We recently released an application called Quality Fundamentals that covers common performance, design, and environment issues and solutions for HoloLens 2 apps. This app is a great visual demo for the content the follows.

> [!div class="nextstepaction"]
> [Download the Quality Fundamentals app](https://www.microsoft.com/en-us/p/quality-fundamentals/9mwz852q88fw)

The performant framerate values for each target platform are listed below.

| Platform | Target Frame Rate |
|----------|-------------------|
| [HoloLens](/hololens/hololens1-hardware) | 60 FPS |
| [Windows Mixed Reality Ultra PCs](/windows/mixed-reality/enthusiast-guide/immersive-headset-hardware-details) | 90 FPS |
| [Windows Mixed Reality PCs](/windows/mixed-reality/enthusiast-guide/immersive-headset-hardware-details) | 60 FPS |

The framework below outlines best practices for hitting target frame rates. For tips on measuring and improving framerate in the Unity environment, we recommend that you read the [performance recommendations for Unity article](../unity/performance-recommendations-for-unity.md) 

## Understanding performance bottlenecks

If your app has an underperforming framerate, the first step is to analyze and understand where your application is computationally intensive. There are two primary processors responsible for the work to render your scene: the CPU and the GPU, each handling different aspects of your Mixed Reality app. The three key places where bottlenecks may occur are: 

1. **App Thread - CPU** -
    Responsible for your app logic, including processing input, animations, physics, and other app logic.
2. **Render Thread - CPU to GPU** - 
    Responsible for submitting your draw calls to the GPU. When your app wants to render an object such as a cube or model, this thread sends a request to the GPU to do the operations.
3. **GPU** - 
    Most commonly handles the graphics pipeline of your application to transform 3D data (models, textures, and so on) into pixels. It ultimately produces a 2D image to submit to your device's screen.

![Lifetime of a Frame](images/lifetime-of-a-frame.png)

Generally, HoloLens applications will be GPU bound, but not always. Use the tools and techniques below to understand where your particular app is bottlenecked.

## How to analyze your application

There are many tools that allow you to understand the performance profile and potential bottlenecks in your mixed reality application. 

Below are some common tools to help you gather deep profiling information for your application:
- [Intel Graphics Performance Analyzers](https://software.intel.com/gpa)
- [Visual Studio Graphics Debuggers](/visualstudio/debugger/graphics/visual-studio-graphics-diagnostics)
- [Unity Profiler](https://docs.unity3d.com/Manual/Profiler.html)
- [Unity Frame Debugger](https://docs.unity3d.com/Manual/FrameDebugger.html)
- [Unreal Insights](../unreal/unreal-insights.md)
- [PIX](https://devblogs.microsoft.com/pix/)
- [GPU Pofiling in Unreal](https://docs.unrealengine.com/en-US/TestingAndOptimization/PerformanceAndProfiling/GPU/index.html)

### How to profile in any environment

One way to determine if your app is GPU or CPU bound is to lower the resolution of the render target output. By reducing the number of pixels to calculate, you'll reduce your GPU load. The device will render to a smaller texture, then up-sample to display your final image.

After lowering rendering resolution, if:
1) Application framerate **increases**, then you're likely **GPU Bound**
1) Application framerate **unchanged**, then you're likely **CPU Bound**

>[!NOTE]
>Unity provides the ability to easily modify the render target resolution of your application at runtime through the *[XRSettings.renderViewportScale](https://docs.unity3d.com/ScriptReference/XR.XRSettings-renderViewportScale.html)* property. The final image presented on device has a fixed resolution. The platform will sample the lower resolution output to build a higher resolution image for rendering on displays. 
>
>```CS
>UnityEngine.XR.XRSettings.renderScale = 0.7f;
>```

## How to improve your application

### CPU performance recommendations

Generally, most work in a mixed reality application on the CPU involves doing the "simulation" of the scene and processing your application logic. The following areas are targeted for optimization:

- Animations
- Physics
- Memory allocations
- Complex algorithms (i.e inverse kinematics, path-finding)

### GPU performance recommendations

#### Understanding bandwidth vs. fill rate
When rendering a frame on the GPU, an application is either bound by memory bandwidth or fill rate.

- **Memory bandwidth** is the rate of reads and writes the GPU can do from memory
    - To identify bandwidth limitations, reduce texture quality and check if the framerate has improved.
    - In Unity, change **Texture Quality** in **Edit** > **Project Settings** > **[Quality Settings](https://docs.unity3d.com/Manual/class-QualitySettings.html)**.
- **Fill rate** refers to the pixels that can be drawn per second by the GPU.
    - To identify fill rate limitations, lower the display resolution and check if framerate improved. 
    - In Unity, use the  *[XRSettings.renderViewportScale](https://docs.unity3d.com/ScriptReference/XR.XRSettings-renderViewportScale.html)* property

Memory bandwidth generally involves optimizations to either:
1) Lower texture resolutions
2) Use fewer textures (normals, specular, and so on)

Fill rate is focused on reducing the number of operations that need to be computed for a final rendered pixel, including:
1) Number of objects to render/process
2) Number of operations per shader
3) Number of GPU stages to final result (geometry shaders, post-processing effects, and so on)
4) Number of pixels to render (display resolution)

#### Reduce polygon count

Higher polygon counts result in more operations for the GPU, so [reducing the number of polygons](/dynamics365/mixed-reality/import-tool/optimize-models#performance-targets) in your scene reduces the render time. There are other factors that make shading the geometry expensive, but polygon count is the simplest metric to determine how much work it will take to render a scene.

#### Limit overdraw

High overdraw occurs when multiple objects are rendered but not shown on screen as they're hidden by an occluding object. Imagine looking at a wall that has objects behind it. All of the geometry would be processed for rendering, but only the opaque wall needs to be rendered, which results in unnecessary operations.

#### Shaders

Shaders are small programs that run on the GPU and do two important steps in rendering:
1) Determining which vertices should be drawn and where they are in screen space (the Vertex shader)
    - The Vertex shader is executed per vertex for every mesh.
2) Determining the color of each pixel (the Pixel shader)
    - The Pixel shader is executed per pixel and rendered by the geometry to the target render texture.

Typically, shaders do many transformations and lighting calculations. Although complex lighting models, shadows, and other operations can generate fantastic results, they also come with a price. Reducing the number of operations computed in shaders can greatly reduce the work needed for the GPU per frame.

##### Shader coding recommendations

- Use bilinear filtering, whenever possible
- Rearrange expressions to use MAD intrinsics to do a multiply and an add at the same time
- Precalculate as much as possible on the CPU and pass as constants to the material
- **Favor moving operations from the pixel shader to the vertex shader**
    - Generally, the number of vertices is much smaller than the number of pixels (720p is 921,600 pixels, 1080p is 2,073,600 pixels, and so on)

#### Remove GPU stages

Post-processing effects can be expensive and increase the fill rate of your application, including anti-aliasing techniques like MSAA. On HoloLens, we recommended avoiding these techniques and additional shader stages such as geometry, hull, and compute shaders.

## Memory recommendations

Excessive memory allocation and deallocation operations can result in inconsistent performance, frozen frames, and other detrimental behavior. It's especially important to understand memory considerations when developing in Unity, since memory management is controlled by the garbage collector.

#### Object pooling

Object pooling is a popular technique to reduce the cost of continuous allocations and deallocations of objects. This is done by allocating a large pool of identical objects and reusing inactive, available instances from this pool instead of constantly spawning and destroying objects over time. Object pools are great for reuseable components that have variable lifetime during an app.

## See also
- [Performance recommendations for Unity](../unity/performance-recommendations-for-unity.md)
- [Recommended settings for Unity](../unity/recommended-settings-for-unity.md)
- [Performance recommendations for Unreal](../unreal/performance-recommendations-for-unreal.md)
- [Material recommendations in Unreal](../unreal/unreal-materials.md)
- [Optimize 3D models](/dynamics365/mixed-reality/import-tool/optimize-models#performance-targets)
- [Best practices for converting and optimizing real-time 3D Models](/dynamics365/mixed-reality/import-tool/best-practices)
- [Performance guidelines for artists and designers for Unreal](https://docs.unrealengine.com/en-US/TestingAndOptimization/PerformanceAndProfiling/Guidelines/index.html)
- [VR best practices for Unreal](https://docs.unrealengine.com/en-US/SharingAndReleasing/XRDevelopment/VR/DevelopVR/ContentSetup/index.html)
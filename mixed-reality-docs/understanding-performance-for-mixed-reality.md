---
title: Understanding Performance for Mixed Reality
description: Advanced topics and details on optimizing performance for Windows Mixed Reality Apps
author: troy-ferrell
ms.author: trferrel
ms.date: 3/26/2019
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Performance, Optimization, CPU, GPU
---

# Understanding performance for mixed reality

This article is an introduction to understanding the significance of performance for your Mixed Reality app.  User experience can be greatly degraded if your application does not run at optimal frame rate. Holograms will appear unstable and head tracking of the environment will be inaccurate, leading to a poor experience for the user. Performance must be considered a first class feature for mixed reality development and not a polish task.

The performant framerate values for each target platform are listed below.

| Platform | Target Frame Rate |
|----------|-------------------|
| [HoloLens](hololens-hardware-details.md) | 60 FPS |
| [Windows Mixed Reality Ultra PCs](immersive-headset-hardware-details.md) | 90 FPS |
| [Windows Mixed Reality PCs](immersive-headset-hardware-details.md) | 60 FPS |

The framework below outlines best practices for hitting target frame rates. If developing in Unity, consider reading the [performance recommendations for Unity article](performance-recommendations-for-unity.md) for tips on measuring and improving framerate in the Unity environment.

## Understanding performance bottlenecks

If your app has an underperforming framerate, the first step is to analyze and understand where your application is computationally intensive. There are two primary processors responsible for the work to render your scene: the CPU and the GPU. Each of these handle different aspects of your Mixed Reality app. There are three key places where bottlenecks may occur: 

1. **App Thread - CPU** -
    This thread is responsible for your app logic. This includes processing input, animations, physics, and other app logic.
2. **Render Thread - CPU to GPU** - 
    This thread is responsible for submitting your draw calls to the GPU. When your app wants to render an object such as a cube or model, this thread sends a request to the GPU to perform these operations.
3. **GPU** - 
    This processor most commonly handles the graphics pipeline of your application to transform 3D data (models, textures, etc.) into pixels. It ultimately produces a 2D image to submit to your device's screen.

![Lifetime of a Frame](images/lifetime-of-a-frame.png)

Generally, HoloLens applications will be GPU bound, but not always. Use the tools and techniques below to understand where your particular app is bottlenecked.

## How to analyze your application

There are many tools that allow you to understand the performance profile of your mixed reality application. These will enable you to find where and why you have bottlenecks, so you can address them.

Below are some common tools to gain deep profiling information for your application:
- [Intel Graphics Performance Analyzers](https://software.intel.com/gpa)
- [Visual Studio Graphics Debuggers](https://docs.microsoft.com/visualstudio/debugger/graphics/visual-studio-graphics-diagnostics?view=vs-2017)
- [Unity Profiler](https://docs.unity3d.com/Manual/Profiler.html)
- [Unity Frame Debugger](https://docs.unity3d.com/Manual/FrameDebugger.html)

### How to profile in any environment

One way to determine if you are GPU bound or CPU bound in your application is to decrease the resolution of the render target output. By reducing the number of pixels to calculate, this will reduce your GPU load. The device will render to a smaller texture, then up-sample to display your final image.

After decreasing rendering resolution, if:
1) Application framerate **increases**, then you are likely **GPU Bound**
1) Application framerate **unchanged**, then you are likely **CPU Bound**

>[!NOTE]
>Unity provides the ability to easily modify the render target resolution of your application at runtime through the *[XRSettings.renderViewportScale](https://docs.unity3d.com/ScriptReference/XR.XRSettings-renderViewportScale.html)* property. The final image presented on device has a fixed resolution. The platform will sample the lower resolution output to build a higher resolution image for rendering on displays. 
>
>```CS
>UnityEngine.XR.XRSettings.renderScale = 0.7f;
>```

## How to improve your application

### CPU performance recommendations

Generally, most work in a mixed reality application on the CPU involves performing the "simulation" of the scene and processing your application logic. The following areas are usually targeted for optimization:

- Animations
- Physics
- Memory allocations
- Complex algorithms (i.e inverse kinematics, path-finding)

### GPU performance recommendations

#### Understanding bandwidth vs. fill rate
When rendering a frame on the GPU, an application is generally either bound by memory bandwidth or fill rate.

- **Memory bandwidth** is the rate of reads and writes the GPU can perform from memory
    - To identify bandwidth limitations, reduce texture quality and check if the framerate has improved.
    - In Unity, this can be done by changing **Texture Quality** in **Edit** > **Project Settings** > **[Quality Settings](https://docs.unity3d.com/Manual/class-QualitySettings.html)**.
- **Fill rate** refers to the pixels that can be drawn per second by the GPU.
    - To identify fill rate limitations, decrease the display resolution and check if framerate improved. 
    - In Unity, this can be done via the  *[XRSettings.renderViewportScale](https://docs.unity3d.com/ScriptReference/XR.XRSettings-renderViewportScale.html)* property

Memory bandwidth generally involves optimizations to either:
1) Decrease texture resolutions
2) Utilize fewer textures (normals, specular, etc.)

Fill rate is focused on reducing the number of operations that need to be computed for a final rendered pixel. This includes reducing:
1) Number of objects to render/process
2) Number of operations per shader
3) Number of GPU stages to final result (geometry shaders, post-processing effects, etc.)
4) Number of pixels to render (display resolution)

#### Reduce polygon count

Higher polygon counts result in more operations for the GPU; [reducing the number of polygons](https://docs.microsoft.com/dynamics365/mixed-reality/import-tool/optimize-models#performance-targets) in your scene will reduce the render time. There are other factors involved in shading the geometry that can be expensive, but polygon count is the simplest metric to determine how expensive a scene will be to render.

#### Limit overdraw

High overdraw occurs when multiple objects are rendered but not shown on screen as they are hidden by an occluding object. Imagine looking at a wall that has objects behind it. All of the geometry would be processed for rendering, but only the opaque wall needs to be rendered. This results in unnecessary operations.

#### Shaders

Shaders are small programs that run on the GPU and perform two important steps in rendering:
1) Determining which vertices should be drawn and where they are in screen space (the Vertex shader)
    - The Vertex shader is generally executed per vertex for every mesh.
2) Determining the color of each pixel (the Pixel shader)
    - The Pixel shader is executed per pixel rendered by the geometry to the texture being rendered to.

Typically, shaders perform many transformations and lighting calculations. Although complex lighting models, shadows, and other operations can generate fantastic results, they also come with a price. Reducing the number of operations computed in shaders can greatly reduce the work needed for the GPU per frame.

##### Shader coding recommendations

- Use bilinear filtering, whenever possible
- Rearrange expressions to use MAD intrinsics in order to do a multiply and an add at the same time
- Precalculate as much as possible on the CPU and pass as constants to the material
- **Favor moving operations from the pixel shader to the vertex shader**
    - Generally, the number of vertices is much smaller than the number of pixels (720p is 921,600 pixels, 1080p is 2,073,600 pixels, etc.)

#### Remove GPU stages

Post-processing effects can be very expensive and increase the fill rate of your application. This includes anti-aliasing techniques such as MSAA. On HoloLens, it is recommended to avoid these techniques entirely, as well as additional shader stages such as geometry, hull, and compute shaders.

## Memory recommendations

Excessive memory allocation and deallocation operations can result in inconsistent performance, frozen frames, and other detrimental behavior. It is especially important to understand memory considerations when developing in Unity, since memory management is controlled by the garbage collector.

#### Object pooling

Object pooling is a popular technique to reduce the cost of continuous allocations and deallocations of objects. This is done by allocating a large pool of identical objects and re-using inactive, available instances from this pool instead of constantly spawning and destroying objects over time. Object pools are great for re-useable components that have variable lifetime during an app.

## See also
- [Performance recommendations for Unity](performance-recommendations-for-unity.md)
- [Recommended settings for Unity](recommended-settings-for-unity.md)
- [Optimize 3D models](https://docs.microsoft.com/dynamics365/mixed-reality/import-tool/optimize-models#performance-targets)
- [Best practices for converting and optimizing real-time 3D Models](https://docs.microsoft.com/dynamics365/mixed-reality/import-tool/best-practices)


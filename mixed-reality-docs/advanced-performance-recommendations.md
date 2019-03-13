---
title: Advanced Performance Recommendations
description: Advanced topics and details on optimizing performance for Windows Mixed Reality Apps
author: Troy-Ferrell
ms.author: trferrel
ms.date: 2/6/2019
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Performance, Optimization, CPU, GPU
---

# Advanced performance recommendations

This article dives into topics that may help optimize performance of your Mixed Reality app and work towards hitting target frame rates. User experience can be greatly degraded if your application does not run at optimal frame rate. For review, the performant framerate values for each target platform are listed below.

| Platform | Target Frame Rate |
|----------|-------------------|
| [HoloLens](hololens-hardware-details.md) | 60 FPS |
| [Windows Mixed Reality Ultra PCs](immersive-headset-hardware-details.md) | 90 FPS |
| [Windows Mixed Reality PCs](immersive-headset-hardware-details.md) | 60 FPS |

>[!NOTE]
>If your application is not meeting frame rate as outlined below, before reviewing details on this page, ensure you have set-up your development environment for best performance wins.
>
> - [Critical Concepts to Ensure Optimal User Experience](ensure-optimal-user-experience.md)
> - [Unity development overview](unity-development-overview.md)
>
> For direction on how to measure your application's framerate, please review this [section](ensure-optimal-user-experience.md#measure-your-frame-rate)

# Understanding performance bottlenecks

If your app has an underperforming framerate, the first step is to analyze and understand where your application is computationally intensive. There are two primary processors responsible for the work to render your scene: the CPU and the GPU. Each of these two components handle different operations and stages of your Mixed Reality app. There are three key places where bottlenecks may occur. 

1. **App Thread - CPU**
    * This thread is responsible for your app logic. This includes processing input, animations, physics, and other app logic/state
2. **Render Thread - CPU to GPU**
    * This thread is responsible for submitting your draw calls to the GPU. When your app wants to render an object such as a cube or model, this thread sends a request to the GPU, which has an architecture optimized for rendering, to perform these operations.
3. **GPU**
    * This processor most commonly handles the graphics pipeline of your application to transform 3D data (models, textures, etc) into pixels and ultimately produce a 2D image to submit to your device's screen.

![Lifetime of a Frame](images/lifetime-of-a-frame.png)

Generally, HoloLens applications will be GPU bounded. However, this does not hold true in every application and thus it is recommended to use the tools & techniques below to get to ground-truth for your particular app.

## How to analyze your application

There are a list of tools that allow you as a developer to understand the performance profile of your Mixed Reality application. These will enable you to both target where you have bottlenecks and how they are manifesting themselves to debug them.

### How to profile with Unity

Unity provides the **[Unity Profiler](https://docs.unity3d.com/Manual/Profiler.html)** built-in which is a great resource to gather valuable performance insights for your particular app. Although one can run the profiler in-editor, these metrics do not represent the true runtime environment and thus, results from this should be used cautiously. It is recommended to remotely profile your application while running on device for most accurate and actionable insights.

Unity provides great documentation for:
1) How to connect the [Unity profiler to UWP applications remotely](https://docs.unity3d.com/Manual/windowsstore-profiler.html)
2) How to effectively [diagnose performance problems with the Unity Profiler](https://unity3d.com/learn/tutorials/temas/performance-optimization/diagnosing-performance-problems-using-profiler-window)

>[!NOTE]
> With the Unity Profiler connected and after adding the GPU profiler (see *Add Profiler* in top right corner), one can see how much time is being spent on the CPU & GPU respectively in the middle of the profiler. This allows the developer to get a quick approximation if their application is CPU or GPU bounded.
>
> ![Unity CPU vs GPU](images/unity-profiler-cpu-gpu.png)

### How to profile in any environment

There is one simple test to quickly determine if you are likely GPU bounded or CPU bounded in your application. If you decrease the resolution of the render target output, there are less pixels to calculate and thus, less work the GPU needs to perform to render an image. Viewport scaling (dynamic resolution scaling) is the practice of rendering your image to a smaller render target then your output device can display. The device will up-sample from the smaller set of pixels to display your final image.

After decreasing rendering resolution, if:
1) Application framerate **increases**, then you are likely **GPU Bounded**
1) Application framerate **unchanged**, then you are likely **CPU Bounded**

>[!NOTE]
>Unity provides the ability to easily modify the render target resolution of your application at runtime through the *[XRSettings.renderViewportScale](https://docs.unity3d.com/ScriptReference/XR.XRSettings-renderViewportScale.html)* property. The final image presented on device has a fixed resolution. The platform will sample the lower resolution output to build a higher resolution image for rendering on displays. 
>
>```CS
>UnityEngine.XR.XRSettings.renderScale = 0.7f;
>```

### Additional performance tools

- [Intel Graphics Performance Analyzers](https://software.intel.com/gpa)
- [Visual Studio Graphics Debuggers](https://docs.microsoft.com/visualstudio/debugger/graphics/visual-studio-graphics-diagnostics?view=vs-2017)
- [Unity Frame Debugger](https://docs.unity3d.com/Manual/FrameDebugger.html)

## How to improve your application

**Table of Contents:**
* [CPU](#CPU-Performance-Recommendations)
* [CPU to GPU](#CPU-to-GPU-Performance-Recommendations)
* [GPU](#GPU-Performance-Recommendations)
* [Memory](#Memory-Recommendations)
* [Startup Performance](#Startup-performance)

### CPU performance recommendations

Generally, most work in a mixed reality application on the CPU involves performing the "simulation" of the scene and processing extensive unique application logic. Thus, the following areas are usually targeted for optimization.

- Animations
- Simplify Physics
- Memory allocations (see [Memory section](#Memory-Recommendations) below)
- Complex algorithms (i.e inverse kinematics, path-finding)

The content below covers more in-depth performance practices, especially targeted for Unity & C# development.

#### Cache references

It is best practice to cache references to all relevant components and GameObjects at initialization. This is because repeating function calls such as *[GetComponent\<T>()](https://docs.unity3d.com/ScriptReference/GameObject.GetComponent.html)* are significantly more expensive relative to the memory cost to store a pointer. This also applies to to the very, regularly used [Camera.main](https://docs.unity3d.com/ScriptReference/Camera-main.html). *Camera.main* actually just uses *[FindGameObjectsWithTag()](https://docs.unity3d.com/ScriptReference/GameObject.FindGameObjectsWithTag.html)* underneath which expensively searches your scene graph for a camera object with the *"MainCamera"* tag.

```CS
using UnityEngine;
using System.Collections;

public class ExampleClass : MonoBehaviour
{
    private Camera cam;
    private CustomComponent comp;

    void Start() 
    {
        cam = Camera.main;
        comp = GetComponent<CustomComponent>();
    }

    void Update()
    {
        // Good
        this.transform.position = cam.transform.position + cam.transform.forward * 10.0f;

        // Bad
        this.transform.position = Camera.main.transform.position + Camera.main.transform.forward * 10.0f;

        // Good
        comp.DoSomethingAwesome();

        // Bad
        GetComponent<CustomComponent>().DoSomethingAwesome();
    }
}
```

>[!NOTE] Avoid GetComponent(string) <br/>
> When using *[GetComponent()](https://docs.unity3d.com/ScriptReference/GameObject.GetComponent.html)*, there are a handful of different overloads. It is important to always use the Type based implementations and never the string-based searching overload. Searching by string in your scene is significantly more costly than searching by Type. <br/>
> (Good) Component GetComponent(Type type) <br/>
> (Good) T GetComponent\<T>() <br/>
> (Bad) Component GetComponent(string)> <br/>

#### Avoid expensive operations

1) **Avoid use of [LINQ](https://docs.microsoft.com/dotnet/csharp/programming-guide/concepts/linq/getting-started-with-linq)**

    Although LINQ can be very clean and easy to read and write, it generally requires much more computation and particularly more memory allocation than writing the algorithm out manually.

    ```CS
    // Example Code
    using System.Linq;

    List<int> data = new List<int>();
    data.Any(x => x > 10);

    var result = from x in data
                 where x > 10
                 select x;
    ```

2) **Common Unity APIs**

    Certain Unity APIs, although useful, can be very expensive to execute. Most of these involve searching your entire scene graph for some matching list of GameObjects. These operations can generally be avoided by caching references or implementing a manager component for the GameObjects in question to track the references at runtime.

        GameObject.SendMessage()
        GameObject.BroadcastMessage()
        UnityEngine.Object.Find()
        UnityEngine.Object.FindWithTag()
        UnityEngine.Object.FindObjectOfType()
        UnityEngine.Object.FindObjectsOfType()
        UnityEngine.Object.FindGameObjectsWithTag()
        UnityEngine.Object.FindGameObjectsWithTag()

>[!NOTE]
> *[SendMessage()](https://docs.unity3d.com/ScriptReference/GameObject.SendMessage.html)* and *[BroadcastMessage()](https://docs.unity3d.com/ScriptReference/GameObject.BroadcastMessage.html)* should be eliminated at all costs. These functions can be on the order of 1000x slower than direct function calls.

3) **Beware of boxing**

    [Boxing](https://docs.microsoft.com/dotnet/csharp/programming-guide/types/boxing-and-unboxing) is a core concept of the C# language and runtime. It is the process of wrapping value-typed variables such as char, int, bool, etc. into reference-typed variables. When a value-typed variable is "boxed", it is wrapped inside of a System.Object which is stored on the managed heap. Thus, memory is allocated and eventually when disposed must be processed by the garbage collector. These allocations and deallocations incur a performance cost and in many scenarios are unnecessary or can be easily replaced by a less expensive alternative.

#### Repeating code paths

Any repeating Unity callback functions (i.e Update) that are executed many times per second and/or frame should be written very carefully. Any expensive operations here will have huge and consistent impact on performance.

1) **Empty callback functions**

    Although the code below may seem innocent to leave in your application, especially since every Unity script auto-initializes with this code block, these empty callbacks can actually become very expensive. Unity operates back and forth over an unmanaged/managed code boundary, between UnityEngine code and your application code. Context switching over this bridge is fairly expensive even if there is nothing to execute. This becomes especially problematic if your app has 100's of GameObjects with components that have empty repeating Unity callbacks.

    ```CS
    void Update()
    {
    }
    ```

>[!NOTE]
> Update() is the most common manifestation of this performance issue but other repeating Unity callbacks such as the following can be equally as bad if not worse: FixedUpdate(), LateUpdate(), OnPostRender", OnPreRender(), OnRenderImage(), etc. 

2) **Operations to favor running once per frame**

    The following Unity APIs are common operations for many Holographic Apps. Although not always possible, the results from these functions can very commonly be computed once and the results re-utilized across the application for a given frame.

    a) Generally it is good practice to have a dedicated Singleton class or service to handle your gaze Raycast into the scene and then re-use this result in all other scene components, instead of making repeated and essentially identical Raycast operations by each component. Of course, some applications may require raycasts from different origins or against different [LayerMasks](https://docs.unity3d.com/ScriptReference/LayerMask.html).

        UnityEngine.Physics.Raycast()
        UnityEngine.Physics.RaycastAll()

    b) Avoid GetComponent() operations in repeated Unity callbacks like Update() by [caching references](#cache-references) in Start() or Awake()

        UnityEngine.Object.GetComponent()

    c) It is good practice to instantiate all objects, if possible, at initialization and use [object pooling](#object-pooling) to recycle and re-use GameObjects throughout runtime of your application

        UnityEngine.Object.Instantiate()

3) **Avoid interfaces and virtual constructs**

    Invoking function calls through interfaces vs direct objects or calling virtual functions can often times be much more expensive than utilizing direct constructs or direct function calls. If the virtual function or interface is unnecessary, then it should be removed. However, the performance hit for these approaches are generally worth the trade-off if utilizing them simplifies development collaboration, code readability, and code maintainability. 

4) **Avoid passing structs by value**

    Unlike classes, structs are value-types and when passed directly to a function, their contents are copied into a newly created instance. This copy adds CPU cost as well as additional memory on the stack. For small structs, the effect is usually very minimal and thus acceptable. However, for functions repeatedly invoked every frame as well as functions taking large structs, if possible modify the function definition to pass by reference. [Learn more here](https://docs.microsoft.com/dotnet/csharp/programming-guide/classes-and-structs/how-to-know-the-difference-passing-a-struct-and-passing-a-class-to-a-method)

#### Miscellaneous

1) **Physics**

    a) Generally, easiest way to improve physics is to limit the amount of time spent on Physics or the number of iterations per second. Of course, this will reduce simulation accuracy. See [TimeManager](https://docs.unity3d.com/Manual/class-TimeManager.html) in Unity

    b) The type of colliders in Unity have widely different performance characteristics. The order below lists the most performant colliders to least performant colliders from left to right. It is most important to avoid Mesh Colliders which are substantially more expensive than the primitive colliders.

        Sphere < Capsule < Box <<< Mesh (Convex) < Mesh (non-Convex)

    See [Unity Physics Best Practices](https://unity3d.com/learn/tutorials/topics/physics/physics-best-practices) for more info

2) **Animations**

    Disable idle animations by disabling the Animator component (disabling the game object won't have the same effect). Avoid design patterns where an animator sits in a loop setting a value to the same thing. There is considerable overhead for this technique, with no effect on the application. [Learn more here](https://docs.unity3d.com/Manual/MecanimPeformanceandOptimization.html)

3) **Complex algorithms**

    If your application is using complex algorithms such as inverse kinematics, path finding, etc, look to find a simpler approach or adjust relevant settings for their performance

### CPU-to-GPU performance recommendations

Generally, CPU-to-GPU performance comes down to the **draw calls** submitted to the graphics card. To improve performance, draw calls need to be strategically **a) reduced** or **b) restructured** for optimal results. Since draw calls themselves are resource-intensive, reducing them will reduce overall work required. Further, state changes between draw calls requires costly validation and translation steps in the graphics driver and thus, restructuring of your application's draw calls to limit state changes(i.e different materials, etc) can boost performance.

Unity has a great article that gives an overview and dives into batching draw calls for their platform.
- [Unity Draw Call Batching](https://docs.unity3d.com/Manual/DrawCallBatching.html)

#### Single pass instanced rendering

Single Pass Instanced Rendering in Unity allows XR applications draw calls for each eye to be reduced down to one instanced draw call. Due to cache coherency between two draw calls, there is also some performance improvement on the GPU as well.

To enable this feature in your Unity Project
1)  Open **Player Settings** (go to **Edit** > **Project Settings** > Player > **Universal Windows Platform tab** > **XR Settings**)
2) Select **Single Pass Instanced (Preview)** from the **Stereo Rendering Method** drop-down menu (**Virtual Reality Supported** should already be checked)

Read the following articles from Unity for details with this rendering approach.
- [How to maximize AR and VR performance with advanced stereo rendering](https://blogs.unity3d.com/2017/11/21/how-to-maximize-ar-and-vr-performance-with-advanced-stereo-rendering/)
- [Single Pass Instancing](https://docs.unity3d.com/Manual/SinglePassInstancing.html) 

>[!NOTE]
> One common issue with Single Pass Instanced Rendering occurs if developers already have existing custom shaders not written for instancing. After enabling this feature, developers may notice some GameObjects only render in one eye. This is because the associated custom shaders do not have the appropriate properties for instancing.
>
> See [Single Pass Stereo Rendering for HoloLens](https://docs.unity3d.com/Manual/SinglePassStereoRenderingHoloLens.html) from Unity for how to address this problem

#### Static batching

Static Batching works for most [Renderer](https://docs.unity3d.com/ScriptReference/Renderer.html) objects in Unity that **1) share the same material** and **2) are all marked as *Static*** (Select an object in Unity and click the checkbox in the top right of the inspector). GameObjects marked as *Static* cannot be moved throughout your application's runtime. Thus, static batching can be difficult to leverage on HoloLens where virtually every object needs to be placed, moved, scaled, etc. For immersive headsets, static batching can dramatically reduce draw calls and thus improve performance.

Read *Static Batching* under [Draw Call Batching in Unity](https://docs.unity3d.com/Manual/DrawCallBatching.html) for more details.

#### Dynamic batching

Since it is problematic to mark objects as *Static* for HoloLens development, dynamic batching can be a great tool to compensate for this lacking feature. Of course, it is can also be useful on immersive headsets as well. Dynamic batching in Unity can be difficult though to enable because GameObjects must **a) share the same Material** and **b) meet a long list of other criteria**.

Read *Dynamic Batching* under [Draw Call Batching in Unity](https://docs.unity3d.com/Manual/DrawCallBatching.html) for the full list. Most commonly, GameObjects become invalid to be batched dynamically because the associated mesh data can be no more than 300 vertices.

#### Other techniques

Batching can only occur if multiple GameObjects are able to share the same material. Typically this will be blocked by the need for GameObjects to have a unique texture for their respective Material. It is common to combine Textures into one big Texture, a method known as [Texture Atlasing](https://en.wikipedia.org/wiki/Texture_atlas).

Further, it is generally preferable to combine meshes into one GameObject where possible and reasonable. Each Renderer in Unity will have it's associated draw call(s) versus submitting a combined mesh under one Renderer. 

>[!NOTE]
> Modifying properties of Renderer.material at runtime will create a copy of the Material and thus potentially break batching. Use Renderer.sharedMaterial to modify shared material properties across GameObjects.

### GPU performance recommendations

#### Understanding bandwidth vs fill rate
When rendering a frame on the GPU, an application is generally either bounded my memory bandwidth or fill rate.

- **Memory bandwidth** is the rate of reads and writes the GPU can perform from memory
    - To identify bandwidth limitations, reduce texture quality and check if framerate improved. In Unity, this can be done by changing Texture Quality in **Edit** > **Project Settings** > **[Quality Settings](https://docs.unity3d.com/Manual/class-QualitySettings.html)**.
- **Fill rate** refers to the throughput of rendered pixels that can be drawn per second by the GPU.
    - To identify fill rate limitations, decrease the display resolution and check if framerate improved. In Unity, this can be done via the  *[XRSettings.renderViewportScale](https://docs.unity3d.com/ScriptReference/XR.XRSettings-renderViewportScale.html)* property

Memory bandwidth generally involves optimizations to either
1) decrease texture resolutions
2) utilize less textures (i.e normals, specular, etc)

Fill rate is primarily focused on reducing the number of operations that need to be computed for a final rendered pixel. Examples of this commonly fall into reducing
1) number of objects to render/process
2) number of operations per shader
3) number of GPU stages to final result (geometry shaders, post-processing effects, etc)
4) number of pixels to render (i.e display resolution)

Learn more about [optimizing graphics rendering in Unity](https://unity3d.com/learn/tutorials/temas/performance-optimization/optimizing-graphics-rendering-unity-games)

#### Reduce poly count
Higher polygon counts result in more operations for the GPU and reducing the number of polygons in your scene will reduce the amount of time to render that geometry. There are other factors involved as well in shading the geometry that can still be expensive but polygon count is the base metric to determine how expensive a scene will be to render. 

Polygon count is usually reduced by either
1) Removing objects from a scene
2) Asset decimation which reduces the number of polygons for a given mesh
3) Implementing a [Level of Detail (LOD) System](https://docs.unity3d.com/Manual/LevelOfDetail.html) into your application which renders far away objects with lower-polygon version of the same geometry

#### Limit overdraw

High overdraw occurs when multiple objects are rendered but not outputted to the screen as they are hidden by another, generally closer, occluding object. Imagine looking at a wall that had multiple rooms and geometry behind it. All of the geometry would be processed for rendering but only the opaque wall really needs to be rendered as it occludes the view of all other content. This results in wasteful operations that are not needed for the current view.

In Unity, one can display overdraw for their scene, by toggling the [**draw mode menu**](https://docs.unity3d.com/Manual/ViewModes.html) in the top left corner of the **Scene view** and selecting **Overdraw**.

Generally, overdraw can be mitigated by culling objects ahead of time before they are sent to the GPU. Unity provides details on implementing [Occlusion Culling](https://docs.unity3d.com/Manual/OcclusionCulling.html) for their engine.

#### Shaders

Shaders are small programs that run on the GPU and generally determine two important steps in rendering:
1) which object's vertices should be drawn to on the screen and where they are in screen space (i.e the Vertex shader)
    - The Vertex shader is generally executed per vertex for every GameObject
2) what to color those pixels (i.e the Pixel shader)
    - The Pixel shader is executed per pixel for the texture being rendered for device present

Typically shaders perform many transformations and lighting calculations. Although complex lighting models, shadows, and other operations can generate fantastic results, they also come with a price. Reducing the number of operations computed in shaders can greatly reduce the overall work needed to be done by a GPU per frame.

##### Understanding shaders in Unity

An easy approximation to compare shaders in performance is to identify the average number of operations each executes at runtime. This can be done fairly easily in Unity.

1) Select your shader asset or select a material, then in top right corner of the inspector window, select the gear icon and then **"Select Shader"**

    ![Select shader in Unity](images/Select-shader-unity.png)
2) With the shader asset selected, click the **"Compile and show code"** button under the inspector window

    ![Compile Shader Code in Unity](images/compile-shader-code-unity.PNG)

3) After compiling, look for the statistics section in the results with the number of different operations for both the vertex and pixel shader (Note: pixel shaders are often also called fragment shaders)

    ![Unity Standard Shader Operations](images/unity-standard-shader-compilation.png)

##### Unity Standard shader alternatives

Instead of using a physically based rendering (PBR) or other high-quality shader, look at utilizing a more performant and cheaper shader. [Mixed Reality Toolkit](https://github.com/Microsoft/MixedRealityToolkit-Unity) provides a [standard shader](https://github.com/Microsoft/MixedRealityToolkit-Unity/blob/htk_release/Assets/HoloToolkit/Common/Shaders/Standard.shader) that has been optimized for mixed reality projects.

Unity also provides an unlit, vertex lit, diffuse, and other simplified shader options that are significantly faster compared to the Unity Standard shader. See [Usage and Performance of Built-in Shaders](https://docs.unity3d.com/Manual/shader-Performance.html) for more detailed information.

##### Shader coding recommendations

- Use bilinear filtering whenever possible
- Rearrange expressions to use MAD intrinsics in order to do a multiply and an add at the same time
- Precalculate as much as possible on the CPU and pass as constants to the material
- Favor moving operations from the pixel shader to the vertex shader
    - Generally the # of vertices << # of pixels (i.e 720p == 921,600 pixels, 1080p == 2,073,600 pixels, etc)

#### Remove GPU stages
Post-processing effects can be very expensive and generally inhibit the fill rate of your application. This also includes anti-aliasing techniques such as MSAA. On HoloLens, it is recommended to avoid these techniques entirely. Furthermore, additional shader stages such as geometry, hull, and compute shaders should be avoided when possible.

### Memory recommendations

Excessive memory allocation & deallocation operations can have adverse effects on your holographic application resulting in inconsistent performance, frozen frames, and other detrimental behavior. It is especially important to understand memory considerations when developing in Unity since memory management is controlled by the garbage collector.

#### Garbage collection

Holographic apps will loose processing compute time to the garbage collector (GC) when the GC is activated to analyze objects that are no longer in scope during execution and their memory needs to be released so it can be made available for re-use. Constant allocations and de-allocations will generally require the garbage collector to run more frequently thus hurting performance and user experience.

Unity has provided an excellent page that explains in detail how the garbage collector works and tips to write more efficient code in regards to memory management.
- [Optimizing garbage collection in Unity games](https://unity3d.com/learn/tutorials/topics/performance-optimization/optimizing-garbage-collection-unity-games?playlist=44069)

One of the most common practices that leads to excessive garbage collection is not caching references to components and classes in Unity development. Any references should be captured during Start() or Awake() and re-used in later functions such as Update() or LateUpdate().

Other quick tips:
- Use the [StringBuilder](https://docs.microsoft.com/dotnet/api/system.text.stringbuilder?view=netframework-4.7.2) C# class to dynamically build complex strings at runtime
- Remove calls to Debug.Log() when no longer needed as they still execute in all build versions of an app
- If your holographic app generally requires lots of memory, consider calling  [_**System.GC.Collect()**_](https://docs.microsoft.com/dotnet/api/system.gc.collect?view=netframework-4.7.2) during loading phases such as when presenting a loading or transition screen

#### Object pooling

Object pooling is a popular technique to reduce the cost of continuous allocations & deallocations of objects. This is done by allocating a large pool of identical objects and re-using inactive, available instances from this pool instead of constantly spawning and destroying objects over time. Object pools are great for re-useable components that have variable lifetime during an app.

- [[Unity] Object Pooling Tutorial](https://unity3d.com/learn/tutorials/topics/scripting/object-pooling) 

### Startup performance

You should consider starting your app with a smaller scene, then using *[SceneManager.LoadSceneAsync](https://docs.unity3d.com/ScriptReference/SceneManagement.SceneManager.LoadSceneAsync.html)* to load the rest of the scene. This allows your app to get to an interactive state as fast as possible. Be aware that there may be a large CPU spike while the new scene is being activated and that any rendered content might stutter or hitch. One way to work around this is to set the AsyncOperation.allowSceneActivation property to false on the scene being loaded, wait for the scene to load, clear the screen to black, and then set back to true to complete the scene activation.

Remember that while the startup scene is loading the holographic splash screen will be displayed to the user.

## See also
- [Optimizing graphics rendering in Unity games](https://unity3d.com/learn/tutorials/temas/performance-optimization/optimizing-graphics-rendering-unity-games?playlist=44069)
- [Optimizing garbage collection in Unity games](https://unity3d.com/learn/tutorials/topics/performance-optimization/optimizing-garbage-collection-unity-games?playlist=44069)
- [Physics Best Practices [Unity]](https://unity3d.com/learn/tutorials/topics/physics/physics-best-practices)
- [Optimizing Scripts [Unity]](https://docs.unity3d.com/Manual/MobileOptimizationPracticalScriptingOptimizations.html)

---
title: Camera setup in Unity
description: Learn how to set up and use Unity's Main Camera for Windows Mixed Reality development to do holographic rendering.
author: keveleigh
ms.author: kurtie
ms.date: 10/22/2019
ms.topic: article
keywords: holotoolkit, mixedrealitytoolkit, mixedrealitytoolkit-unity, holographic rendering, holographic, immersive, focus point, depth buffer, orientation-only, positional, opaque, transparent, clip, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Camera in Unity

When you wear a mixed reality headset, it becomes the center of your holographic world. The Unity [Camera](https://docs.unity3d.com/Manual/class-Camera.html) component will automatically handle stereoscopic rendering and follow your head movement and rotation. However, to fully optimize visual quality and [hologram stability](../platform-capabilities-and-apis/hologram-stability.md), you should set the camera settings described below.

## Setup

1. Go to **Other Settings** section of the **Windows Store Player Settings**
2. Choose **Windows Mixed Reality** as the device, which may be listed as **Windows Holographic** in older versions of Unity
3. Select **Virtual Reality Supported**

>[!NOTE]
>These settings need to be applied to the Camera in each scene of your app.
>
>By default, when you create a new scene in Unity, it will contain a Main Camera GameObject in the Hierarchy which includes the Camera component, but does not have the settings below properly applied.

## Holographic vs. immersive headsets

The default settings on the Unity Camera component are for traditional 3D applications, which need a skybox-like background as they don't have a real world.

* When running on an **[immersive headset](../../discover/immersive-headset-hardware-details.md)**, you're rendering everything the user sees, and so you'll likely want to keep the skybox.
* However, when running on a **holographic headset** like [HoloLens](/hololens/hololens1-hardware), the real world should appear behind everything the camera renders. Set the camera background to be transparent (in HoloLens, black renders as transparent) instead of a Skybox texture:
    1. Select the Main Camera in the Hierarchy panel
    2. In the Inspector panel, find the Camera component and change the Clear Flags dropdown from Skybox to Solid Color
    3. Select the Background color picker and change the RGBA values to (0, 0, 0, 0)

You can use script code to determine at runtime whether the headset is immersive or holographic by checking [HolographicSettings.IsDisplayOpaque](https://docs.unity3d.com/ScriptReference/XR.WSA.HolographicSettings.IsDisplayOpaque.html).

## Positioning the Camera

It will be easier to lay out your app if you imagine the starting position of the user as (X: 0, Y: 0, Z: 0). Since the Main Camera is tracking movement of the user's head, the starting position of the user can be set by setting the starting position of the Main Camera.

1. Select Main Camera in the Hierarchy panel
2. In the Inspector panel, find the Transform component and change the Position from (X: 0, Y: 1, Z: -10) to (X: 0, Y: 0, Z: 0)

   ![Camera in the Inspector pane in Unity](images/maincamera-350px.png)  
   *Camera in the Inspector pane in Unity*

## Clip planes

Rendering content too close to the user can be uncomfortable in mixed reality. You can adjust the [near and far clip planes](../platform-capabilities-and-apis/hologram-stability.md#hologram-render-distances) on the Camera component.

1. Select the Main Camera in the Hierarchy panel
2. In the Inspector panel, find the Camera component Clipping Planes and change the Near textbox from 0.3 to 0.85. Content rendered even closer can lead to user discomfort and should be avoided per the [render distance guidelines](../platform-capabilities-and-apis/hologram-stability.md#hologram-render-distances).

## Multiple Cameras

When there are multiple Camera components in the scene, Unity knows which camera to use for stereoscopic rendering and head tracking based on which GameObject has the MainCamera tag.

## Recentering a seated experience

If you're building a [seated-scale experience](../../design/coordinate-systems.md), you can recenter Unity's world origin at the user's current head position by calling the **[XR.InputTracking.Recenter](https://docs.unity3d.com/ScriptReference/XR.InputTracking.Recenter.html)** method.

## Reprojection modes

Both HoloLens and immersive headsets will reproject each frame your app renders to adjust for any misprediction of the user's actual head position when photons are emitted.

By default:

* **Immersive headsets** will take care of positional reprojection if the app provides a depth buffer for a given frame. Immersive headsets will also adjust your holograms for misprediction in both position and orientation. If a depth buffer isn't provided, the system will only correct mispredictions in orientation.
* **Holographic headsets** like HoloLens will take care of positional reprojection whether the app provides its depth buffer or not.  Positional reprojection is possible without depth buffers on HoloLens as rendering is often sparse with a stable background provided by the real world.

If you know that you're building an [orientation-only experience](coordinate-systems-in-unity.md#building-an-orientation-only-or-seated-scale-experience) with rigidly body-locked content (for example, 360-degree video content), you can explicitly set the reprojection mode to orientation only by setting [HolographicSettings.ReprojectionMode](https://docs.unity3d.com/ScriptReference/XR.WSA.HolographicSettings.ReprojectionMode.html) to [HolographicReprojectionMode.OrientationOnly](https://docs.unity3d.com/ScriptReference/XR.WSA.HolographicSettings.HolographicReprojectionMode.html).

## Sharing your depth buffers with Windows

Sharing your app's depth buffer to Windows each frame will give your app one of two boosts in hologram stability, based on the type of headset you're rendering for:

* **Immersive headsets** can take care of positional reprojection when a depth buffer is provided, adjusting your holograms for misprediction in both position and orientation.
* **Holographic headsets** have a few different methods. HoloLens 1 will automatically select a [focus point](focus-point-in-unity.md) when a depth buffer is provided, optimizing hologram stability along the plane that intersects the most content. HoloLens 2 will stabilize content using [Depth LSR (see Remarks)](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.setfocuspoint).

To set whether your Unity app will provide a depth buffer to Windows:

1. Go to **Edit** > **Project Settings** > **Player** > **Universal Windows Platform tab** > **XR Settings**.
2. Expand the **Windows Mixed Reality SDK** item.
3. Check or uncheck the **Enable Depth Buffer Sharing** check box.  Enable Depth Buffer Sharing is checked by default in new projects, since this feature was added to Unity and will be unchecked by default for older projects that were upgraded.

A depth buffer can improve visual quality so long as Windows can accurately map the normalized per-pixel depth values in your depth buffer back to distances in meters, using the near and far planes you've set in Unity on the main camera.  If your render passes handle depth values in typical ways, you should generally be fine here, though translucent render passes that write to the depth buffer while showing through to existing color pixels can confuse the reprojection.  If you know that your render passes will leave many of your final depth pixels with inaccurate depth values, you are likely to get better visual quality by unchecking "Enable Depth Buffer Sharing".

## Automatic Scene and Camera Setup with Mixed Reality Toolkit 

Follow the [step-by-step](tutorials/mr-learning-base-01.md) guide to add Mixed Reality Toolkit to your Unity project and it will configure your project automatically. You can also manually configure the project without MRTK with the guide in the section below.

## Next Development Checkpoint

If you're following the Unity development journey we've laid out, you're in the midst of exploring the MRTK core building blocks. From here, you can continue to the next building block:

> [!div class="nextstepaction"]
> [Gaze](gaze-in-unity.md)

Or jump to Mixed Reality platform capabilities and APIs:

> [!div class="nextstepaction"]
> [Shared experiences](shared-experiences-in-unity.md)

You can always go back to the [Unity development checkpoints](unity-development-overview.md#2-core-building-blocks) at any time.

## See also

* [Hologram stability](../platform-capabilities-and-apis/hologram-stability.md)
* [MixedRealityToolkit Main Camera.prefab](https://github.com/Microsoft/MixedRealityToolkit-Unity/tree/htk_release/Assets/HoloToolkit/Input/Prefabs)
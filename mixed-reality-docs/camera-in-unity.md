---
title: Camera in Unity
description: How to use Unity's Main Camera for Windows Mixed Reality development to do holographic rendering
author: keveleigh
ms.author: kurtie
ms.date: 03/21/2018
ms.topic: article
keywords: holotoolkit, mixedrealitytoolkit, mixedrealitytoolkit-unity, holographic rendering, holographic, immersive, focus point, depth buffer, orientation-only, positional, opaque, transparent, clip
---



# Camera in Unity

When you wear a mixed reality headset, it becomes the center of your holographic world. The Unity [Camera](http://docs.unity3d.com/Manual/class-Camera.html) component will automatically handle stereoscopic rendering and will follow your head movement and rotation when your project has "Virtual Reality Supported" selected with "Windows Mixed Reality" as the device (in the Other Settings section of the Windows Store Player Settings). This may be listed as "Windows Holographic" in older versions of Unity.

However, to fully optimize visual quality and [hologram stability](hologram-stability.md), you should set the camera settings described below.

>[!NOTE]
>These settings need to be applied to the Camera in each scene of your app.
>
>By default, when you create a new scene in Unity, it will contain a Main Camera GameObject in the Hierarchy which includes the Camera component, but does not have the settings below properly applied.

## Holographic vs. immersive headsets

The default settings on the Unity Camera component are for traditional 3D applications which need a skybox-like background as they don't have a real world.
* When running on an **[immersive headset](immersive-headset-hardware-details.md)**, you are rendering everything the user sees, and so you'll likely want to keep the skybox.
* However, when running on a **holographic headset** like [HoloLens](hololens-hardware-details.md), the real world should appear behind everything the camera renders. To do this, set the camera background to be transparent (in HoloLens, black renders as transparent) instead of a Skybox texture:
    1. Select the Main Camera in the Hierarchy panel
    2. In the Inspector panel, find the Camera component and change the Clear Flags dropdown from Skybox to Solid Color
    3. Select the Background color picker and change the RGBA values to (0, 0, 0, 0)

You can use script code to determine at runtime whether the headset is immersive or holographic by checking [HolographicSettings.IsDisplayOpaque](https://docs.unity3d.com/ScriptReference/XR.WSA.HolographicSettings.IsDisplayOpaque.html).


## Positioning the Camera

It will be easier to lay out your app if you imagine the starting position of the user as (X: 0, Y: 0, Z: 0). Since the Main Camera is tracking movement of the user's head, the starting position of the user can be set by setting the starting position of the Main Camera.
1. Select Main Camera in the Hierarchy panel
2. In the Inspector panel, find the Transform component and change the Position from (X: 0, Y: 1, Z: -10) to (X: 0, Y: 0, Z: 0)

   ![Camera in the Inspector pane in Unity](images/maincamera-350px.png)<br>
   *Camera in the Inspector pane in Unity*

## Clip planes

Rendering content too close to the user can be uncomfortable in mixed reality. You can adjust the [near and far clip planes](hologram-stability.md#hologram-render-distances) on the Camera component.
1. Select the Main Camera in the Hierarchy panel
2. In the Inspector panel, find the Camera component Clipping Planes and change the Near textbox from 0.3 to .85. Content rendered even closer can lead to user discomfort and should be avoided per the [render distance guidelines](hologram-stability.md#hologram-render-distances).

## Multiple Cameras

When there are multiple Camera components in the scene, Unity knows which camera to use for stereoscopic rendering and head tracking by checking which GameObject has the MainCamera tag.

## Recentering a seated experience

If you're building a [seated-scale experience](coordinate-systems.md), you can recenter Unity's world origin at the user's current head position by calling the **[XR.InputTracking.Recenter](https://docs.unity3d.com/ScriptReference/XR.InputTracking.Recenter.html)** method.

## Reprojection modes

Both HoloLens and immersive headsets will reproject each frame your app renders to adjust for any misprediction of the user's actual head position when photons are emitted.

By default:

* **Immersive headsets** will perform positional reprojection, adjusting your holograms for misprediction in both position and orientation, if the app provides a depth buffer for a given frame.  If a depth buffer is not provided, the system will only correct mispredictions in orientation.
* **Holographic headsets** like HoloLens will perform positional reprojection whether the app provides its depth buffer or not.  Positional reprojection is possible without depth buffers on HoloLens as rendering is often sparse with a stable background provided by the real world.

If you know that you are building an [orientation-only experience](coordinate-systems-in-unity.md#building-an-orientation-only-or-seated-scale-experience) with rigidly body-locked content (e.g. 360-degree video content), you can explicitly set the reprojection mode to be orientation only by setting [HolographicSettings.ReprojectionMode](https://docs.unity3d.com/ScriptReference/XR.WSA.HolographicSettings.ReprojectionMode.html) to [HolographicReprojectionMode.OrientationOnly](https://docs.unity3d.com/ScriptReference/XR.WSA.HolographicSettings.HolographicReprojectionMode.html).

## Sharing your depth buffers with Windows

Sharing your app's depth buffer to Windows each frame will give your app one of two boosts in hologram stability, based on the type of headset you're rendering for:
* **Immersive headsets** can perform positional reprojection when a depth buffer is provided, adjusting your holograms for misprediction in both position and orientation.
* **Holographic headsets** like HoloLens will automatically select a [focus point](focus-point-in-unity.md) when a depth buffer is provided, optimizing hologram stability along the plane that intersects the most content.

To set whether your Unity app will provide a depth buffer to Windows:
1. Go to **Edit** > **Project Settings** > **Player** > **Universal Windows Platform tab** > **XR Settings**.
2. Expand the **Windows Mixed Reality SDK** item.
3. Check or uncheck the **Enable Depth Buffer Sharing** check box.  This will be checked by default in new projects created since this feature was added to Unity and will be unchecked by default for older projects that were upgraded.

Providing a depth buffer to Windows can improve visual quality so long as Windows can accurately map the normalized per-pixel depth values in your depth buffer back to distances in meters, using the near and far planes you've set in Unity on the main camera.  If your render passes handle depth values in typical ways, you should generally be fine here, though translucent render passes that write to the depth buffer while showing through to existing color pixels can confuse the reprojection.  If you know that your render passes will leave many of your final depth pixels with inaccurate depth values, you are likely to get better visual quality by unchecking "Enable Depth Buffer Sharing".

## Mixed Reality Toolkit's automatic scene setup
When you import [MRTK release Unity packages](https://github.com/Microsoft/MixedRealityToolkit-Unity/releases) or clone the project from the [GitHub repository](https://github.com/Microsoft/MixedRealityToolkit-Unity), you are going to find a new menu 'Mixed Reality Toolkit' in Unity. Under 'Configure' menu, you will see the menu 'Apply Mixed Reality Scene Settings'. When you click it, it removes the default camera and adds foundational components - [InputManager](https://github.com/Microsoft/MixedRealityToolkit-Unity/blob/master/Assets/HoloToolkit/Input/Prefabs/InputManager.prefab), [MixedRealityCameraParent](https://github.com/Microsoft/MixedRealityToolkit-Unity/blob/master/Assets/HoloToolkit/Input/Prefabs/MixedRealityCameraParent.prefab), and [DefaultCursor](https://github.com/Microsoft/MixedRealityToolkit-Unity/blob/master/Assets/HoloToolkit/Input/Prefabs/Cursor/DefaultCursor.prefab).

![MRTK Menu for scene setup](images/MRTK_Input_Menu.png)<br>
*MRTK Menu for scene setup*

![Automatic scene setup in MRTK](images/MRTK_HowTo_Input1.png)<br>
*Automatic scene setup in MRTK*

## MixedRealityCamera prefab
You can also manually add these from the project panel. You can find these components as prefabs. When you search **MixedRealityCamera**, you will be able to see two different camera prefabs. The difference is, **MixedRealityCamera** is the camera only prefab whereas, **MixedRealityCameraParent** includes additional components for the immersive headsets such as Teleportation, Motion Controller and, Boundary.

![Camera prefabs in MRTK](images/MRTK_HowTo_Input2.png)<br>
*Camera prefabs in MRTK*

**MixedRealtyCamera** supports both HoloLens and immersive headset. It detects the device type and optimizes the properties such as clear flags and Skybox. Below you can find some of the useful properties you can customize such as custom Cursor, Motion Controller models, and Floor.

![Properties for the Motion controller, Cursor and Floor](images/MRTK_HowTo_Input3.png)<br>
*Properties for the Motion controller, Cursor and Floor*

## See also
* [Hologram stability](hologram-stability.md)
* [MixedRealityToolkit Main Camera.prefab](https://github.com/Microsoft/MixedRealityToolkit-Unity/tree/master/Assets/HoloToolkit/Input/Prefabs)

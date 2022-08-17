---
title: Camera setup in Unity
description: Learn how to set up and use Unity's Main Camera for Windows Mixed Reality development to do holographic rendering.
author: keveleigh
ms.author: kurtie
ms.date: 03/25/2021
ms.topic: article
keywords: holotoolkit, mixedrealitytoolkit, mixedrealitytoolkit-unity, holographic rendering, holographic, immersive, focus point, depth buffer, orientation-only, positional, opaque, transparent, clip, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Camera setup in Unity

When you wear a mixed reality headset, it becomes the center of your holographic world. The Unity [Camera](https://docs.unity3d.com/Manual/class-Camera.html) component will automatically handle stereoscopic rendering and follow your head movement and rotation. However, to fully optimize visual quality and [hologram stability](../advanced-concepts/hologram-stability.md), you should set the camera settings described below.

## HoloLens vs VR immersive headsets

The default settings on the Unity Camera component are for traditional 3D applications, which need a skybox-like background as they don't have a real world.

* When running on an **[immersive headset](/windows/mixed-reality/enthusiast-guide/immersive-headset-hardware-details)**, you're rendering everything the user sees, and so you'll likely want to keep the skybox.
* However, when running on a **holographic headset** like [HoloLens](/hololens/hololens2-hardware), the real world should appear behind everything the camera renders. Set the camera background to be transparent (in HoloLens, black renders as transparent) instead of a Skybox texture:
    1. Select the Main Camera in the Hierarchy panel
    2. In the Inspector panel, find the Camera component and change the Clear Flags dropdown from Skybox to Solid Color
    3. Select the Background color picker and change the RGBA values to (0, 0, 0, 0)
        1. If setting this from code, you can use Unity's [`Color.clear`](https://docs.unity3d.com/ScriptReference/Color-clear.html)

[!INCLUDE[](includes/camera/opaque-camera-include.md)]

## Camera setup

Whatever kind of experience you're developing, the Main Camera is always the primary stereo rendering component attached to your device's head-mounted display. It'll be easier to lay out your app if you imagine the starting position of the user as (X: 0, Y: 0, Z: 0). Since the Main Camera is tracking movement of the user's head, the starting position of the user can be set by setting the starting position of the Main Camera.

The central choice you need to make is whether you're developing for HoloLens or VR immersive headsets. Once you've got that, skip to whichever setup section applies.

### HoloLens camera setup

For HoloLens apps, you need to use anchors for any objects you want to lock to the scene environment. We recommend using unbounded space to maximize stability and create anchors in multiple rooms.

[!INCLUDE[](includes/camera/hololens-setup-include.md)]

### VR camera setup

Windows Mixed Reality supports apps across a wide range of [experience scales](../../design/coordinate-systems.md#mixed-reality-experience-scales), from orientation-only and seated-scale apps up through room-scale apps. On HoloLens, you can go further and build world-scale apps that let users walk beyond 5 meters, exploring an entire floor of a building and beyond.

Your first step in building a mixed reality experience in Unity is to determine which [experience scale](../../design/coordinate-systems.md) your app will target:

* [Orientation or seated-scale](../../design/coordinate-systems.md#building-an-orientation-only-or-seated-scale-experience)
* [Standing or room-scale](../../design/coordinate-systems.md#building-a-standing-scale-or-room-scale-experience)
* [World-scale](../../design/coordinate-systems.md#building-a-world-scale-experience)

#### Room-scale or standing experiences

> [!NOTE]
> If you're building for HL2, we recommend creating an eye-level experience, or consider using [Scene Understanding](scene-understanding-sdk.md) to reason about the floor of your scene.

[!INCLUDE[](includes/camera/vr-setup-standing-include.md)]

#### Seated experiences

[!INCLUDE[](includes/camera/vr-setup-seated-include.md)]

### Setting up the camera background

If you're using MRTK, the camera's background is automatically configured and managed. For XR SDK or Legacy WSA projects, we recommend setting the camera's background to solid black on HoloLens and keeping the skybox for VR.

## Using multiple cameras

When there are multiple Camera components in the scene, Unity knows which camera to use for stereoscopic rendering based on which GameObject has the MainCamera tag. In legacy XR, it also uses this tag to sync head tracking. In XR SDK, head tracking is driven by a TrackedPoseDriver script attached to the camera.

## Sharing depth buffers

Sharing your app's depth buffer to Windows each frame will give your app one of two boosts in hologram stability, based on the type of headset you're rendering for:

* **VR immersive headsets** can take care of positional reprojection when a depth buffer is provided, adjusting your holograms for misprediction in both position and orientation.
* **HoloLens headsets** have a few different methods. HoloLens 1 will automatically select a [focus point](focus-point-in-unity.md) when a depth buffer is provided, optimizing hologram stability along the plane that intersects the most content. HoloLens 2 will stabilize content using [Depth LSR (see Remarks)](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.setfocuspoint).

[!INCLUDE[](includes/camera/depth-buffer-include.md)]

## Using clipping planes

Rendering content too close to the user can be uncomfortable in mixed reality. You can adjust the [near and far clip planes](../advanced-concepts/hologram-stability.md#hologram-render-distances) on the Camera component.

1. Select the **Main Camera** in the **Hierarchy** panel
2. In the **Inspector** panel, find the **Camera** component **Clipping Planes** and change the **Near** textbox from **0.3** to **0.85**. Content rendered even closer can lead to user discomfort and should be avoided per the [render distance guidelines](../advanced-concepts/hologram-stability.md#hologram-render-distances).

## Recentering the camera

If you're building a [seated-scale experience](../../design/coordinate-systems.md), you can recenter Unity's world origin at the user's current head position by calling the **[XR.InputTracking.Recenter](https://docs.unity3d.com/ScriptReference/XR.InputTracking.Recenter.html)** method in legacy XR or the **[XRInputSubsystem.TryRecenter](https://docs.unity3d.com/ScriptReference/XR.XRInputSubsystem.TryRecenter.html)** method in XR SDK.

## Teleportation

This feature is typically reserved for VR experiences:

[!INCLUDE[](includes/camera/teleport-include.md)]

## Reprojection modes

Both HoloLens and immersive headsets will reproject each frame your app renders to adjust for any misprediction of the user's actual head position when photons are emitted.

By default:

* **VR immersive headsets** will take care of positional reprojection if the app provides a depth buffer for a given frame. Immersive headsets will also adjust your holograms for misprediction in both position and orientation. If a depth buffer isn't provided, the system will only correct mispredictions in orientation.
* **Holographic headsets** like HoloLens 2 will take care of positional reprojection whether the app provides its depth buffer or not. Positional reprojection is possible without depth buffers on HoloLens as rendering is often sparse with a stable background provided by the real world.

[!INCLUDE[](includes/camera/reprojection-include.md)]

## Next Development Checkpoint

If you're following the Unity development journey we've laid out, you're in the midst of exploring the MRTK core building blocks. From here, you can continue to the next building block:

> [!div class="nextstepaction"]
> [Gaze](gaze-in-unity.md)

Or jump to Mixed Reality platform capabilities and APIs:

> [!div class="nextstepaction"]
> [Shared experiences](shared-experiences-in-unity.md)

You can always go back to the [Unity development checkpoints](unity-development-overview.md#2-core-building-blocks) at any time.

## See also

* [Hologram stability](../advanced-concepts/hologram-stability.md)
* [Experience scales](../../design/coordinate-systems.md#mixed-reality-experience-scales)
* [Spatial stage](../../design/coordinate-systems.md#stage-frame-of-reference)
* [Tracking loss in Unity](tracking-loss-in-unity.md)
* [Spatial anchors](../../design/spatial-anchors.md)
* [Persistence in Unity](persistence-in-unity.md)
* [Shared experiences in Unity](shared-experiences-in-unity.md)
* [Azure Spatial Anchors](/azure/spatial-anchors)
* [Azure Spatial Anchors SDK for Unity](/dotnet/api/Microsoft.Azure.SpatialAnchors)
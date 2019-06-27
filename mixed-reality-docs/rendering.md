---
title: Rendering
description: Holographic rendering enables your app to draw a hologram in a precise location in the world around the user, whether it's precisely placed in the physical world or within a virtual realm you've created.
author: thetuvix
ms.author: alexturn
ms.date: 02/24/2019
ms.topic: article
keywords: rendering, hologram
---



# Rendering

Holographic rendering enables your application to draw a hologram in a precise location in the world around the user, whether it's precisely placed in the physical world or within a virtual realm you've created. [Holograms](hologram.md) are objects made of sound and light. Rendering enables your applicaition to add the light.

## Device support

<table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <tr>
        <td><strong>Feature</strong></td>
        <td><a href="hololens-hardware-details.md"><strong>HoloLens (1st gen)</strong></a></td>
        <td><strong>HoloLens 2</strong></td>
        <td><a href="immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Rendering</td>
        <td>✔️</td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
</table>

## Holographic rendering

Key to holographic rendering is knowing whether you are rendering to a see-through display like HoloLens that lets the user see both the physical world and your holograms together--or an opaque display like a Windows Mixed Reality immersive headset that blocks out the world.

Devices with **see-through displays**, such [HoloLens](hololens-hardware-details.md), add light to the world. Black pixels are fully transparent, while brighter pixels are increasingly opaque. Because the light from the displays is added to the light from the real world, white pixels are somewhat translucent.

While stereoscopic rendering provides one depth cue for your holograms, adding [grounding effects](interaction-fundamentals.md) can help users see more easily what surface a hologram is near. One grounding technique is to add a glow around a hologram on the nearby surface, and then render a shadow against this glow. In this way, your shadow appears to subtract light from the environment. [Spatial sound](spatial-sound.md) is another extremely important depth cue, letting users reason about the distance and relative location of a hologram.

Devices with **opaque displays**, like [Windows Mixed Reality immersive headsets](immersive-headset-hardware-details.md), block out the world. Black pixels are solid black, and any other color appear as that color to the user. Your application is responsible for rendering everything the user sees. This makes it even more important to maintain a constant refresh rate so that users have a comfortable experience.

## Predicted rendering parameters

Mixed reality headsets (both HoloLens and immersive headsets) continually track the position and orientation of the user's head relative to their surroundings. As your application begins preparing its next frame, the system predicts where the user's head will be in the future at the exact moment that the frame shows up on the displays. Based on this prediction, the system calculates the view and projection transforms to use for that frame. Your application **must use these transforms to produce correct results**; if system-supplied transforms are not used, the resulting image will not align with the real world, leading to user discomfort.

Note that to accurately predict when a new frame will reach the displays, the system is constantly measuring the effective end-to-end latency of your application's rendering pipeline. While the system adjusts to the length of your rendering pipeline, you can improve hologram stability by keeping that pipeline as short as possible.

Applications that use advanced techniques to augment the system prediction can override the system view and projection transforms. These applications must must still use system-supplied transforms as a basis for their custom transforms in order to produce meaningful results.

## Other rendering parameters

When rendering a frame, the system specifies the back-buffer viewport in which your application should draw. This viewport is often smaller than the full size of the frame buffer. Regardless of the viewport size, once the frame is rendered by the application, the system upscales the image to fill the entirety of the displays.

For applications that find themselves unable to render at the required refresh rate, [system rendering parameters can be configured](https://docs.microsoft.com/uwp/api/Windows.Graphics.Holographic.HolographicViewConfiguration#Windows_Graphics_Holographic_HolographicViewConfiguration) to reduce memory pressure and rendering cost at the cost of increased pixel aliasing. The back buffer format can also be changed, which for some apps can help to improve memory bandwidth and pixel throughput.

The rendering frustum, resolution, and framerate in which your app is asked to render might also change from frame to frame, and might differ across the left and right eye. For example, when [mixed reality capture](mixed-reality-capture.md) (MRC) is active and the [photo/video camera view configuration](https://docs.microsoft.com/uwp/api/Windows.Graphics.Holographic.HolographicViewConfigurationKind#Windows_Graphics_Holographic_HolographicViewConfigurationKind) is not opted-into, one eye might be rendered with a larger FOV or resolution.

For any given frame, your app *must* render using the view transform, projection transform, and viewport resolution provided by the system. Additionally, your application must never assume that any rendering or view parameter remains fixed from frame-to-frame. Engines like Unity handle all these transforms for you in their own camera objects so that the physical movement of your users and the state of the system is always respected. If your application allows for virtual movement of the user through the world (e.g. using the thumbstick on a gamepad), you can add a parent rig object above the camera that moves it around. This causes the camera to reflect both the user's virtual and physical motion. If your application modifies the view transform, projection transform, or viewport dimension provided by the system, it must inform the system by calling the appropriate [override API](https://docs.microsoft.com/uwp/api/Windows.Graphics.Holographic.HolographicCameraPose#Windows_Graphics_Holographic_HolographicCameraPose).

To enhance the stability of your holographic rendering, your app should provide to Windows each frame the depth buffer it used for rendering. If your app does provide a depth buffer, it should have coherent depth values, with depth expressed in meters from the camera. This enables the system to use your per-pixel depth data to better stabilize content if the user's head ends up slightly offset from the predicted location. If you are not able to provide your depth buffer, you can provide a focus point and normal, defining a plane that cuts through most of your content. If both the depth buffer and a focus plane are provided, the system might use both. In particular, it is helpful to provide both the depth buffer and a focus point that includes a velocity vector when your application displays holograms that are in motion.

Refer to [Rendering in DirectX](rendering-in-directx.md) article for low-level details about his topic.

## Holographic cameras

Windows Mixed Reality introduces the concept of a **holographic camera**. Holographic cameras are similar to the traditional camera found in 3D graphics texts: they define both the extrinsic (position and orientation) and intrinsic camera properties. (For example:, field-of-view is used to view a virtual 3D scene.) Unlike traditional 3D cameras, the application is not in control of the position, orientation, and intrinsic properties of the camera. Rather, the position and orientation of the holographic camera is implicitly controlled by the user's movement. The user's movement is relayed to the application on a frame-by-frame basis via a view transform. Likewise, the camera's intrinsic properties are defined by the device's calibrated optics and relayed frame-by-frame via the projection transform.

In general your application will render for a single stereo camera. However, a robust rendering loop will support multiple cameras, and will support both mono and stereo cameras. For example, the system might ask your application to render from an alternate perspective when the user activates a feature like [mixed reality capture](mixed-reality-capture.md) (MRC), depending on the shape of the headset in question. Applications that can support multiple cameras get them by [opting-in](https://docs.microsoft.com/uwp/api/Windows.Graphics.Holographic.HolographicViewConfiguration#Windows_Graphics_Holographic_HolographicViewConfiguration) to the [kind](https://docs.microsoft.com/uwp/api/Windows.Graphics.Holographic.HolographicViewConfigurationKind#Windows_Graphics_Holographic_HolographicViewConfigurationKind) of cameras they can support.

## Volume rendering

When rendering medical MRIs or engineering volumes in 3D, [volume rendering](volume-rendering.md) techniques are often used. These techniques can be particularly interesting in mixed reality, where users can naturally view such a volume from key angles, simply by moving their head.

## Supported resolutions on HoloLens (1st gen)
> [!NOTE]
> More updates are forthcoming. [View the update list](release-notes-april-2018.md)

* The current and maximum supported resolutions are properties of the [view configuration](https://docs.microsoft.com/uwp/api/Windows.Graphics.Holographic.HolographicViewConfiguration#Windows_Graphics_Holographic_HolographicViewConfiguration). HoloLens is set to the maximum resolution, which is 720p (1268x720), by default.
* The lowest supported viewport size is 50% of 720p, which is 360p (634x360). On HoloLens, this is a ViewportScaleFactor of 0.5.
* Anything lower than 540p is **not recommended** due to visual degradation, but can be used to identify bottle necks in pixel fill rate.

## Supported resolutions on HoloLens 2

> [!NOTE]
> More guidance specific to HoloLens 2 [coming soon](index.md#news-and-notes).


## See also
* [Hologram stability](hologram-stability.md)
* [Rendering in DirectX](rendering-in-directx.md)

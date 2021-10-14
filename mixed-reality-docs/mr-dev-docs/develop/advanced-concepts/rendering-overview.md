---
title: Rendering
description: Learn how holographic rendering enables your app to draw a hologram in a precise location in the world around the user.
author: thetuvix
ms.author: alexturn
ms.date: 02/24/2019
ms.topic: article
keywords: rendering, hologram
---

# Holographic Rendering overview

Holographic rendering enables your application to draw a hologram at a precise location in the world around the user, whether it's precisely placed in the physical world or within a virtual realm you've created. [Holograms](../../discover/hologram.md) are objects made of sound and light. Rendering enables your application to add the light.

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
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens (first gen)</strong></a></td>
        <td><a href="/hololens/hololens2-hardware"><strong>HoloLens 2</strong></td>
        <td><a href="../../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Rendering</td>
        <td>✔️</td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
</table>

## Holographic rendering

Key to holographic rendering is knowing what kind of device is being used. Devices with **see-through displays**, such as [HoloLens](/hololens/hololens1-hardware), add light to the world. Black pixels are fully transparent, while brighter pixels are increasingly opaque. Because the light from the displays is added to the light from the real world, white pixels are translucent.

While stereoscopic rendering provides one depth cue for your holograms, adding [grounding effects](../../design/interaction-fundamentals.md) can help users see more easily what surface a hologram is near. One grounding technique is to add a glow around a hologram on the nearby surface, and then render a shadow against this glow. In this way, your shadow appears to subtract light from the environment. [Spatial sound](../../design/spatial-sound.md) is another important depth cue, letting users reason about the distance and relative location of a hologram.

Devices with **opaque displays**, like [Windows Mixed Reality immersive headsets](../../discover/immersive-headset-hardware-details.md), block out the world. Black pixels are solid black, and any other color appears as that color to the user. Your application is responsible for rendering everything the user sees. This makes it even more important to maintain a constant refresh rate so that users have a comfortable experience.

## Predicted rendering parameters

Mixed reality headsets (both HoloLens and immersive headsets) continually track the position and orientation of the user's head relative to their surroundings. As your application begins preparing its next frame, the system predicts where the user's head will be in the future at the exact moment that the frame shows up on the displays. Based on this prediction, the system calculates the view and the projection transforms to use for that frame. Your application **must use these transforms to produce correct results**. If system-supplied transforms aren't used, the resulting image won't align with the real world, leading to user discomfort.

> [!NOTE]
> To accurately predict when a new frame will reach the displays, the system is constantly measuring the effective end-to-end latency of your application's rendering pipeline. While the system adjusts to the length of your rendering pipeline, you can improve hologram stability by keeping that pipeline as short as possible.

Applications that use advanced techniques to augment the system prediction can override the system view and projection transforms. These applications must still use system-supplied transforms as a basis for their custom transforms to produce meaningful results.

## Other rendering parameters

When rendering a frame, the system specifies the back-buffer viewport in which your application should draw. This viewport is often smaller than the full size of the frame buffer. Whatever the viewport size, once the frame is rendered by the application, the system upscales the image to fill the entirety of the displays.

For applications that find themselves unable to render at the required refresh rate, [system rendering parameters can be configured](/uwp/api/Windows.Graphics.Holographic.HolographicViewConfiguration#Windows_Graphics_Holographic_HolographicViewConfiguration) to reduce memory pressure and rendering cost at the cost of increased pixel aliasing. The back buffer format can also be changed, which for some apps can help to improve memory bandwidth and pixel throughput.

The rendering frustum, resolution, and framerate in which your app is asked to render might also change from frame to frame, and might differ across the left and right eye. For example, when [mixed reality capture](/hololens/holographic-photos-and-videos) (MRC) is active and the [photo/video camera view configuration](/uwp/api/Windows.Graphics.Holographic.HolographicViewConfigurationKind#Windows_Graphics_Holographic_HolographicViewConfigurationKind) isn't opted-into, one eye might be rendered with a larger FOV or resolution.

For any given frame, your app *must* render using the view transform, projection transform, and viewport resolution provided by the system. Additionally, your application must never assume that any rendering or view parameter remains fixed from frame-to-frame. Engines like Unity handle all these transforms for you in their own camera objects so that the physical movement of your users and the state of the system is always respected. If your application allows for virtual movement of the user through the world (e.g. using the thumbstick on a gamepad), you can add a parent rig object above the camera that moves it around. This causes the camera to reflect both the user's virtual and physical motion. If your application modifies the view transform, projection transform, or viewport dimension provided by the system, it must inform the system by calling the appropriate [override API](/uwp/api/Windows.Graphics.Holographic.HolographicCameraPose#Windows_Graphics_Holographic_HolographicCameraPose).

To enhance the stability of your holographic rendering, your app should provide to Windows each frame the depth buffer it used for rendering. If your app does provide a depth buffer, it should have coherent depth values, with depth expressed in meters from the camera. This enables the system to use your per-pixel depth data to better stabilize content if the user's head ends up slightly offset from the predicted location. If you aren't able to provide your depth buffer, you can provide a focus point and normal, defining a plane that cuts through most of your content. If both the depth buffer and a focus plane are provided, the system might use both. In particular, it's helpful to provide both the depth buffer and a focus point that includes a velocity vector when your application displays holograms that are in motion.

Refer to [Rendering in DirectX](../native/rendering-in-directx.md) article for low-level details about this topic.

## Holographic cameras

Windows Mixed Reality introduces the concept of a **holographic camera**. Holographic cameras are similar to the traditional camera found in 3D graphics texts; they define both the extrinsic (position and orientation) and intrinsic camera properties. (For example, field-of-view is used to view a virtual 3D scene.) Unlike traditional 3D cameras, the application isn't in control of the position, orientation, and intrinsic properties of the camera. Rather, the position and orientation of the holographic camera is implicitly controlled by the user's movement. The user's movement is relayed to the application on a frame-by-frame basis via a view transform. Likewise, the camera's intrinsic properties are defined by the device's calibrated optics and relayed frame-by-frame via the projection transform.

In general, your application will render for a single stereo camera. A robust rendering loop will support multiple cameras, and will support both mono and stereo cameras. For example, the system might ask your application to render from an alternate perspective when the user activates a feature like [mixed reality capture](/hololens/holographic-photos-and-videos) (MRC), depending on the headset shape. Applications that can support multiple cameras get them by [opting-in](/uwp/api/Windows.Graphics.Holographic.HolographicViewConfiguration#Windows_Graphics_Holographic_HolographicViewConfiguration) to the [kind](/uwp/api/Windows.Graphics.Holographic.HolographicViewConfigurationKind#Windows_Graphics_Holographic_HolographicViewConfigurationKind) of cameras they can support.

## Volume rendering

When rendering medical MRIs or engineering volumes in 3D, [volume rendering](volume-rendering.md) techniques are often used. These techniques can be interesting in mixed reality, where users can naturally view such a volume from key angles, simply by moving their head.

## Supported resolutions on HoloLens (first gen)

* The max viewport size is a property of the [HolographicDisplay](/uwp/api/windows.graphics.holographic.holographicdisplay). HoloLens is set to the maximum viewport size, which is 720p (1268x720), by default.
* The viewport size can be changed by setting the ViewportScaleFactor on the HolographicCamera. This scale factor is in the range of 0 to 1.
* The lowest supported viewport size on HoloLens (first gen) is 50% of 720p, which is 360p (634x360). This is a ViewportScaleFactor of 0.5.
* Anything lower than 540p isn't recommended because of visual degradation, but can be used to identify bottlenecks in pixel fill rate.

## Supported resolutions on HoloLens 2

* The current and maximum supported render target sizes are properties of the [view configuration](/uwp/api/Windows.Graphics.Holographic.HolographicViewConfiguration#Windows_Graphics_Holographic_HolographicViewConfiguration). HoloLens 2 is set to the maximum render target size, which is 1440x936, by default.
* Apps can change the size of render target buffers by calling the RequestRenderTargetSize method to request a new render target size. A new render target size will be chosen, which meets or exceeds the requested render target size. This API changes the size of the render target buffer, which requires memory reallocation on the GPU. The implications of this include: The render target size can be scaled down to reduce memory pressure on the GPU, and this method shouldn't be called at high frequency.
* Apps can still change the viewport size in the same way that they did for HoloLens 1. There's no added memory reallocation on the GPU, so it can be changed at high frequency, but it cannot be used to reduce memory pressure on the GPU.
* The lowest supported viewport size on HoloLens 2 is 634x412, a ViewportScaleFactor of approximately 0.44 when the default render target size is in use.
* If a render target size is provided which is smaller than the lowest supported viewport size, the viewport scale factor will be ignored.
* Anything lower than 540p isn't recommended because of visual degradation, but can be used to identify bottlenecks in pixel fill rate.



## See also
* [Hologram stability](hologram-stability.md)
* [Rendering in DirectX](../native/rendering-in-directx.md)
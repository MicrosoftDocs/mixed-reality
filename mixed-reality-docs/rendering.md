---
title: Rendering
description: Holographic rendering enables your app to draw a hologram in a precise location in the world around the user, whether it's precisely placed in the physical world or within a virtual realm you've created.
author: thetuvix
ms.author: alexturn
ms.date: 03/21/2018
ms.topic: article
keywords: rendering, hologram
---



# Rendering

Holographic rendering enables your app to draw a hologram in a precise location in the world around the user, whether it's precisely placed in the physical world or within a virtual realm you've created. [Holograms](hologram.md) are objects made of sound and light, and rendering enables your app to add the light.

## Holographic rendering

Key to holographic rendering is knowing whether you are rendering to a see-through display like HoloLens, which lets the user see both the physical world and your holograms together, or an opaque display like a Windows Mixed Reality immersive headset, which blocks out the world.

Devices with **see-through displays**, like [HoloLens](hololens-hardware-details.md), add light to the world. Black pixels will be fully transparent, while brighter pixels will be increasingly opaque. Because the light from the displays is added to the light from the real world, even white pixels are somewhat translucent.

While stereoscopic rendering provides one depth cue for your holograms, adding [grounding effects](interaction-fundamentals.md) can help users see more easily what surface a hologram is near. One grounding technique is to add a glow around a hologram on the nearby surface and then render a shadow against this glow. In this way, your shadow will appear to subtract light from the environment. [Spatial sound](spatial-sound.md) can be another extremely important depth cue, letting users reason about the distance and relative location of a hologram.

Devices with **opaque displays**, like [Windows Mixed Reality immersive headsets](immersive-headset-hardware-details.md), block out the world. Black pixels will be solid black, and any other color will appear as that color to the user. Your app is responsible for rendering everything the user will see, so it's even more important to maintain a constant refresh rate so that users have a comfortable experience.

## Predicted rendering parameters

Mixed reality headsets (both HoloLens and immersive headsets) continually track the position and orientation of the user's head relative to their surroundings. As your app begins preparing its next frame, the system predicts where the user's head will be in the future at the exact moment that the frame will show up on the displays. Based on this prediction, the system calculates the view and projection transforms to use for that frame. Your application **absolutely has to use these transforms to produce correct results**; if system-supplied transforms are not used, the resulting image will not align with the real world, leading to user discomfort.

Note that to accurately predict when a new frame will reach the displays, the system is constantly measuring the effective end-to-end latency of your app's rendering pipeline. While the system will adjust to the length of your rendering pipeline, you can further improve hologram stability by keeping that pipeline as short as possible.

## Other rendering parameters

When rendering a frame, the system will specify the back-buffer viewport in which your application should draw. This viewport will often be smaller than the full size of the frame buffer. Regardless of the viewport size, once the frame has been rendered by the application, the system will upscale the image to fill the entirety of the displays.

For applications that find themselves unable to render at the required refresh rate, [reducing the viewport size](https://docs.microsoft.com/uwp/api/Windows.Graphics.Holographic.HolographicCamera#Windows_Graphics_Holographic_HolographicCamera_ViewportScaleFactor) can be used as a mechanism to reduce rendering cost at the cost of increased pixel aliasing.

The rendering frustum, resolution, and framerate in which your app is asked to render may also change from frame to frame and may differ across the left and right eye. For example, when [mixed reality capture](mixed-reality-capture.md) (MRC) is active, one eye may be rendered with a larger FOV or resolution.

For any given frame, your app *must* render using the view transform, projection transform, and viewport resolution provided by the system. Additionally, your application must never assume that any rendering/view parameter remains fixed from frame-to-frame. Engines like Unity handle all these transforms for you in their own Camera objects, so that the physical movement of your users and the state of the system is always respected. If your app further allows for virtual movement of the user through the world (e.g. using the thumbstick on a gamepad), you can add a parent "rig" object above the camera that moves it around, causing the camera to reflect both the user's virtual and physical motion.

To enhance the stability of your holographic rendering, your app should provide to Windows each frame the depth buffer it used for rendering. If your app does provide a depth buffer, it should have coherent depth values, with depth expressed in meters from the camera. This enables the system to use your per-pixel depth data to better stabilize content if the user's head ends up slightly offset from the predicted location. If you are not able to provide your depth buffer, you should instead provide a focus point and normal, defining a plane that cuts through most of your content. If provided, this plane will be used instead of the depth buffer to do a simpler stabilization of content along that plane.

For all the low-level details here, check out the [Rendering in DirectX](rendering-in-directx.md) article.

## Holographic cameras

Windows Mixed Reality introduces the concept of a **holographic camera**. Holographic cameras are similar to the traditional camera found in 3D graphics texts: they define both the extrinsic (position and orientation) and intrinsic camera properties (ex: field-of-view) used to view a virtual 3D scene. Unlike traditional 3D cameras, the application is not in control of the position, orientation, and intrinsic properties of the camera. Rather, the position and orientation of the holographic camera is implicitly controlled by the user's movement. The user's movement is relayed to the application on a frame-by-frame basis via a view transform. Likewise, the camera's intrinsic properties are defined by the device's calibrated optics and relayed frame-by-frame via the projection transform.

In general your app will be rendering for a single stereo camera. However, a robust rendering loop should support multiple cameras and should support both mono and stereo cameras. For example, the system may ask your app to render from an alternate perspective when the user activates a feature like [mixed reality capture](mixed-reality-capture.md) (MRC), depending on the shape of the headset in question.

## Volume rendering

When rendering medical MRI or engineering volumes in 3D, [volume rendering](volume-rendering.md) techniques are often used. These techniques can be particularly interesting in mixed reality, where users can naturally view such a volume from key angles, simply by moving their head.

## Supported resolutions on HoloLens
* The default and maximum supported resolution is 720p (1268x720).
* The lowest supported viewport size is 50% of 720p (a ViewportScaleFactor of 0.5), which is 360p (634x360).
* Anything lower than 540p is **not recommended** due to visual degradation but can be used to identify bottle necks in pixel fill rate.

## See also
* [Hologram stability](hologram-stability.md)
* [Rendering in DirectX](rendering-in-directx.md)
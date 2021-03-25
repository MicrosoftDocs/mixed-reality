---
title: Focus point in Unity
description: Learn how to manually tune hologram stability in Unity by setting the focus point for HoloLens and Windows Mixed Reality immersive headsets.
author: thetuvix
ms.author: alexturn
ms.date: 03/21/2018
ms.topic: article
keywords: Unity, focus point, focus plane, stabilization plane, stabilization point, reprojection, LSR, depth buffer, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Focus point in Unity

**Namespace:** *UnityEngine.XR.WSA*<br>
**Type**: *HolographicSettings*

Use the [focus point](../platform-capabilities-and-apis/hologram-stability.md#reprojection) to provide HoloLens with a hint about how to best stabilize the holograms currently being displayed.

If you want to set the Focus Point in Unity, it needs to be set every frame using *HolographicSettings.SetFocusPointForFrame()*. When the Focus Point isn't set for a frame, the default stabilization plane is used.

> [!NOTE]
> By default, new Unity projects have the "Enable Depth Buffer Sharing" option set.  With this option, a Unity app running on either an immersive desktop headset or a HoloLens running the Windows 10 April 2018 Update (RS4) or later will submit your depth buffer to Windows to optimize hologram stability automatically, without your app specifying a focus point:
> * On an immersive desktop headset, this will enable per-pixel depth-based reprojection.
> * On a HoloLens running the Windows 10 April 2018 Update or later, this will analyze the depth buffer to pick an optimal stabilization plane automatically.
>
> Either approach should provide even better image quality without explicit work by your app to select a focus point for each frame.  Note that if you do provide a focus point manually, that will override the automatic behavior described above, and will usually reduce hologram stability.  Generally, you should only specify a manual focus point when your app is running on a HoloLens that has not yet been updated to the Windows 10 April 2018 Update.

### Example

There are many ways to set the Focus Point, as suggested by the overloads available on the *SetFocusPointForFrame* static function. Presented below is a simple example to set the focus plane to the provided object for each frame:

```cs
public GameObject focusedObject;
void Update()
{
    // Normally the normal is best set to be the opposite of the main camera's
    // forward vector.
    // If the content is actually all on a plane (like text), set the normal to
    // the normal of the plane and ensure the user does not pass through the
    // plane.
    var normal = -Camera.main.transform.forward;     
    var position = focusedObject.transform.position;
    UnityEngine.XR.WSA.HolographicSettings.SetFocusPointForFrame(position, normal);
}
```

> [!NOTE]
> The simple code above may reduce hologram stability if the focused object ends up behind the user. We generally recommend setting **[Enable Depth Buffer Sharing](camera-in-unity.md#sharing-depth-buffers)** instead of manually specifying a focus point.

## Next Development Checkpoint

If you're following the Unity development journey we've laid out, you're in the midst of exploring the Mixed Reality platform capabilities and APIs. From here, you can continue to the next topic:

> [!div class="nextstepaction"]
> [Tracking loss](tracking-loss-in-unity.md)

Or jump directly to deploying your app on a device or emulator:

> [!div class="nextstepaction"]
> [Deploy to HoloLens or Windows Mixed Reality immersive headsets](../platform-capabilities-and-apis/using-visual-studio.md)

You can always go back to the [Unity development checkpoints](unity-development-overview.md#3-advanced-features) at any time.

### See also

* [Stabilization plane](../platform-capabilities-and-apis/hologram-stability.md#reprojection)

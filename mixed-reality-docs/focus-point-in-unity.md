---
title: Focus point in Unity
description: 
author: 
ms.author: alexturn
ms.date: 2/28/2018
ms.topic: article
keywords: 
---



# Focus point in Unity

**Namespace:** *UnityEngine.WSA.VR*\
 **Type**: *HolographicSettings*

The [focus point](hologram-stability.md#stabilization-plane) can be set to provide HoloLens a hint about how to best perform stabilization on the holograms currently being displayed.

If you want to set the Focus Point in Unity, it needs to be set every frame using HolographicSettings.SetFocusPointForFrame(). If the Focus Point is not set for a frame, the default stabilization plane will be used.

Note that when your Unity app runs on an immersive headset connected to a desktop PC, Unity will submit your depth buffer to Windows to enable per-pixel reprojection, which will usually provide even better image quality without explicit work by the app. If you provide a Focus Point, that will override the per-pixel reprojection, so you should only do so when your app is running on a HoloLens.

### Example

There are many ways to set the Focus Point, as suggested by the overloads available on the SetFocusPointForFrame static function. Presented below is a simple example to set the focus plane to the provided object each frame:

```
public GameObject focusedObject;
void Update()
{
    var normal = -Camera.main.transform.forward;     // Normally the normal is best set to be the opposite of the main camera's forward vector
                            // If the content is actually all on a plane (like text), set the normal to the normal of the plane
                            // and ensure the user does not pass through the plane
    var position = focusedObject.transform.position;
    UnityEngine.VR.WSA.HolographicSettings.SetFocusPointForFrame(position, normal);
}
```

### See also
* [Stabilization plane](hologram-stability.md#stabilization-plane)
---
title: Gaze in Unity
description: Gaze is a primary way for users to target the holograms your app creates in mixed reality.
author: thetuvix
ms.author: alexturn
ms.date: 03/21/2018
ms.topic: article
keywords: gaze, unity, hologram, mixed reality
---



# Gaze in Unity

[Gaze](gaze.md) is a primary way for users to target the [holograms](hologram.md) your app creates in [mixed reality](mixed-reality.md).

## Implementing Gaze

Conceptually, [gaze](gaze.md) is implemented by projecting a ray from the user's head where the headset is, in the forward direction they are facing and determining what that ray collides with. In Unity, the user's head position and direction are exposed through the Unity Main [Camera](camera-in-unity.md), specifically [UnityEngine.Camera.main](http://docs.unity3d.com/ScriptReference/Camera-main.html).[transform.forward](http://docs.unity3d.com/ScriptReference/Transform-forward.html) and [UnityEngine.Camera.main](http://docs.unity3d.com/ScriptReference/Camera-main.html).[transform.position](http://docs.unity3d.com/ScriptReference/Transform-position.html).

Calling [Physics.RayCast](http://docs.unity3d.com/ScriptReference/Physics.Raycast.html) results in a [RaycastHit](http://docs.unity3d.com/ScriptReference/RaycastHit.html) structure which contains information about the collision including the 3D point where collision occurred and the other GameObject the gaze ray collided with.

### Example: Implement Gaze

```cs
void Update()
{
       RaycastHit hitInfo;
       if (Physics.Raycast(
               Camera.main.transform.position,
               Camera.main.transform.forward,
               out hitInfo,
               20.0f,
               Physics.DefaultRaycastLayers))
       {
           // If the Raycast has succeeded and hit a hologram
           // hitInfo's point represents the position being gazed at
           // hitInfo's collider GameObject represents the hologram being gazed at
       }
}
```

### Best Practices

While the example above demonstrates how to do a single raycast in an update loop to find the Gaze target, it is recommended to do this in a single object managing gaze instead of doing this in any object that is potentially interested in the object being gazed at. This lets your app save processing by doing just one gaze raycast each frame.

## Visualizing Gaze

Just like on the desktop where you use a mouse pointer to target and interact with content, you should implement a [cursor](cursors.md) that represents the user's gaze. This gives the user confidence in what they're about to interact with.

## Gaze in Mixed Reality Toolkit
When you import [MRTK release Unity packages](https://github.com/Microsoft/MixedRealityToolkit-Unity/releases) or clone the project from the [GitHub repository](https://github.com/Microsoft/MixedRealityToolkit-Unity), you are going to find a new menu 'Mixed Reality Toolkit' in Unity. Under 'Configure' menu, you will see the menu 'Apply Mixed Reality Scene Settings'. When you click it, it removes the default camera and adds foundational components - [InputManager](https://github.com/Microsoft/MixedRealityToolkit-Unity/blob/master/Assets/HoloToolkit/Input/Prefabs/InputManager.prefab), [MixedRealityCameraParent](https://github.com/Microsoft/MixedRealityToolkit-Unity/blob/master/Assets/HoloToolkit/Input/Prefabs/MixedRealityCameraParent.prefab), and [DefaultCursor](https://github.com/Microsoft/MixedRealityToolkit-Unity/blob/master/Assets/HoloToolkit/Input/Prefabs/Cursor/DefaultCursor.prefab).

![MRTK Menu for scene setup](images/MRTK_Input_Menu.png)<br>
*MRTK Menu for scene setup*

![Automatic scene setup in MRTK](images/MRTK_HowTo_Input1.png)<br>
*Automatic scene setup in MRTK*

### Gaze related scripts in Mixed Reality Toolkit
Mixed Reality Toolkit's [InputManager]() prefab includes [GazeManager.cs](https://github.com/Microsoft/MixedRealityToolkit-Unity/blob/master/Assets/HoloToolkit/Input/Scripts/Gaze/GazeManager.cs) and [Gaze Stabilizer](https://github.com/Microsoft/MixedRealityToolkit-Unity/blob/master/Assets/HoloToolkit/Input/Scripts/Gaze/GazeStabilizer.cs). Under [SimpleSinglePointerSelector](https://github.com/Microsoft/MixedRealityToolkit-Unity/blob/master/Assets/HoloToolkit/Input/Scripts/Focus/SimpleSinglePointerSelector.cs), you can assign your custom Cursor. In default, animated [DefaultCursor](https://github.com/Microsoft/MixedRealityToolkit-Unity/blob/master/Assets/HoloToolkit/Input/Prefabs/Cursor/DefaultCursor.prefab) is assigned.

[Cursor.prefab](https://github.com/Microsoft/MixedRealityToolkit-Unity/tree/master/Assets/HoloToolkit/Input/Prefabs/Cursor) and [CursorWithFeedback.prefab](https://github.com/Microsoft/MixedRealityToolkit-Unity/tree/master/Assets/HoloToolkit/Input/Prefabs/Cursor) shows you how to visualize your Gaze using Cursors.

## See also
* [Camera](camera-in-unity.md)
* [Gaze](gaze.md)
* [Cursors](cursors.md)
* [Gaze targeting](gaze-targeting.md)

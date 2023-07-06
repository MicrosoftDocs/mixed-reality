---
title: Coordinate systems in Unity
description: Learn how to build seated, standing, room-scale, and world-scale mixed reality experiences in Unity.
author: thetuvix
ms.author: alexturn
ms.date: 02/24/2019
ms.topic: article
keywords: coordinate system, spatial coordinate system, orientation-only, seated-scale, standing-scale, room-scale, world-scale, 360 degree, seated, standing, room, world, scale, position, orientation, Unity, anchor, spatial anchor, world anchor, world-locked, world-locking, body-locked, body-locking, tracking loss, locatability, bounds, recenter, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Coordinate systems in Unity

Windows Mixed Reality supports apps across a wide range of experience scales, from orientation-only and seated-scale apps up through room-scale apps. On HoloLens, you can go further and build world-scale apps that let users walk beyond 5 meters, exploring an entire floor of a building and beyond.

Your first step in building a mixed reality experience in Unity is to understand [coordinate systems and choose the experience scale](../../design/coordinate-systems.md) your app will target.

## Building an orientation-only or seated-scale experience

**Namespace:** *UnityEngine.XR*<br>
**Type:** *XRDevice*

To build an **orientation-only** or **seated-scale experience**, you need to set Unity to the Stationary tracking space type. Stationary tracking space sets Unity's world coordinate system to track the [stationary frame of reference](../../design/coordinate-systems.md#spatial-coordinate-systems). In the Stationary tracking mode, content placed in the editor just in front of the camera's default location (forward is -Z) will appear in front of the user when the app launches.

```cs
XRDevice.SetTrackingSpaceType(TrackingSpaceType.Stationary);
```

**Namespace:** *UnityEngine.XR*<br>
**Type:** *InputTracking*

For a pure **orientation-only experience** such as a 360-degree video viewer (where positional head updates would ruin the illusion), you can then set [XR.InputTracking.disablePositionalTracking](https://docs.unity3d.com/ScriptReference/XR.InputTracking-disablePositionalTracking.html) to true:

```cs
InputTracking.disablePositionalTracking = true;
```

For a **seated-scale experience**, to let the user later recenter the seated origin, you can call the [XR.InputTracking.Recenter](https://docs.unity3d.com/ScriptReference/XR.InputTracking.Recenter.html) method:

```cs
InputTracking.Recenter();
```

## Building a standing-scale or room-scale experience

**Namespace:** *UnityEngine.XR*<br>
**Type:** *XRDevice*

For a **standing-scale** or **room-scale experience**, you'll need to place content relative to the floor. You reason about the user's floor using the **[spatial stage](../../design/coordinate-systems.md#spatial-coordinate-systems)**, which represents the user's defined floor-level origin and optional room boundary, set up during first run.

To ensure that Unity is operating with its world coordinate system at floor-level, you can set and test that Unity is using the RoomScale tracking space type:

```cs
if (XRDevice.SetTrackingSpaceType(TrackingSpaceType.RoomScale))
{
    // RoomScale mode was set successfully.  App can now assume that y=0 in Unity world coordinate represents the floor.
}
else
{
    // RoomScale mode was not set successfully.  App cannot make assumptions about where the floor plane is.
}
```
* If SetTrackingSpaceType returns true, Unity has successfully switched its world coordinate system to track the [stage frame of reference](../../design/coordinate-systems.md#spatial-coordinate-systems).
* If SetTrackingSpaceType returns false, Unity was unable to switch to the stage frame of reference, likely because the user has not set up a floor in their environment. While a false return value isn't common, it can happen if the stage is set up in a different room and the device is moved to the current room without the user setting up a new stage.

Once your app successfully sets the RoomScale tracking space type, content placed on the y=0 plane will appear on the floor. The origin at 0, 0, 0 will be the specific place on the floor where the user stood during room setup, with -Z representing the forward direction they were facing during setup.

**Namespace:** *UnityEngine.Experimental.XR*<br>
**Type:** *Boundary*

In script code, you can then call the TryGetGeometry method on the UnityEngine.Experimental.XR.Boundary type to get a boundary polygon, specifying a boundary type of TrackedArea. If the user defined a boundary (you get back a list of vertices), it's safe to deliver a **room-scale experience** to the user, where they can walk around the scene you create.

> [!NOTE]
> The system will automatically render the boundary when the user approaches it. Your app doesn't need to use this polygon to render the boundary itself. However, you may choose to lay out your scene objects using this boundary polygon, to ensure the user can physically reach those objects without teleporting:

```cs
var vertices = new List<Vector3>();
if (UnityEngine.Experimental.XR.Boundary.TryGetGeometry(vertices, Boundary.Type.TrackedArea))
{
    // Lay out your app's content within the boundary polygon, to ensure that users can reach it without teleporting.
}
```

## Building a world-scale experience

**Namespace:** *UnityEngine.XR.WSA*<br>
**Type:** *WorldAnchor*

For true **world-scale experiences** on HoloLens that let users wander beyond 5 meters, you'll need new techniques beyond those used for room-scale experiences. One key technique you'll use is to create a [spatial anchor](../../design/coordinate-systems.md#spatial-anchors) to lock a cluster of holograms precisely in place in the physical world, no matter how far the user has roamed, and then [find those holograms again in later sessions](../../design/coordinate-systems.md#spatial-anchor-persistence).

In Unity, you create a spatial anchor by adding the **WorldAnchor** Unity component to a GameObject.

### Adding a World Anchor

To add a world anchor, call AddComponent\<WorldAnchor\>() on the game object with the transform you want to anchor in the real world.

```cs
WorldAnchor anchor = gameObject.AddComponent<WorldAnchor>();
```

That's it! This game object will now be anchored to its current location in the physical world - you may see its Unity world coordinates adjust slightly over time to ensure that physical alignment. Use [persistence](./spatial-anchors-in-unity.md) to find this anchored location again in a future app session.

### Removing a World Anchor

If you no longer want the GameObject locked to a physical world location and don't intend on moving it this frame, then you can just call Destroy on the World Anchor component.

```cs
Destroy(gameObject.GetComponent<WorldAnchor>());
```

If you want to move the GameObject this frame, you need to call DestroyImmediate instead.

```cs
DestroyImmediate(gameObject.GetComponent<WorldAnchor>());
```

### Moving a World Anchored GameObject

GameObject's cannot be moved while a World Anchor is on it. If you need to move the GameObject this frame, you need to:
1. DestroyImmediate the World Anchor component
2. Move the GameObject
3. Add a new World Anchor component to the GameObject.

```cs
DestroyImmediate(gameObject.GetComponent<WorldAnchor>());
gameObject.transform.position = new Vector3(0, 0, 2);
WorldAnchor anchor = gameObject.AddComponent<WorldAnchor>();
```

### Handling Locatability Changes

A WorldAnchor may not be locatable in the physical world at a point in time. If that occurs, Unity won't be updating the transform of the anchored object. This also can change while an app is running. Failure to handle the change in locatability will cause the object to not appear in the correct physical location in the world.

To be notified about locatability changes:
1. Subscribe to the OnTrackingChanged event
2. Handle the event

The **OnTrackingChanged** event will be called whenever the underlying spatial anchor changes between a state of being locatable vs. not being locatable.

```cs
anchor.OnTrackingChanged += Anchor_OnTrackingChanged;
```

Then handle the event:

```cs
private void Anchor_OnTrackingChanged(WorldAnchor self, bool located)
{
    // This simply activates/deactivates this object and all children when tracking changes
    self.gameObject.SetActiveRecursively(located);
}
```

Sometimes anchors are located immediately. In this case, this isLocated property of the anchor will be set to true when AddComponent\<WorldAnchor\>() returns. As a result, the OnTrackingChanged event won't be triggered. A clean pattern would be to call your OnTrackingChanged handler with the initial IsLocated state after attaching an anchor.

```cs
Anchor_OnTrackingChanged(anchor, anchor.isLocated);
```

## Sharing anchors across devices

Use <a href="/azure/spatial-anchors/overview" target="_blank">Azure Spatial Anchors</a> to create a durable cloud anchor from a local WorldAnchor, which your app can then locate across multiple HoloLens, iOS and Android devices.  By sharing a common spatial anchor across multiple devices, each user can see content rendered relative to that anchor in the same physical location.  This allows for real-time shared experiences.

To get started building shared experiences in Unity, try out the 5-minute <a href="/azure/spatial-anchors/unity-overview" target="_blank">Azure Spatial Anchors Unity quickstarts</a>.

Once you're up and running with Azure Spatial Anchors, you can then <a href="/azure/spatial-anchors/concepts/create-locate-anchors-unity" target="_blank">create and locate anchors in Unity</a>.

## Next Development Checkpoint

If you're following the Unity development checkpoint journey we've laid out, you're in the midst of exploring the Mixed Reality core building blocks. From here, you can continue to the next building block:

> [!div class="nextstepaction"]
> [Gaze](gaze-in-unity.md)

Or jump to Mixed Reality platform capabilities and APIs:

> [!div class="nextstepaction"]
> [Shared experiences](shared-experiences-in-unity.md)

You can always go back to the [Unity development checkpoints](unity-development-overview.md#2-core-building-blocks) at any time.

## See Also
* [Experience scales](../../design/coordinate-systems.md#mixed-reality-experience-scales)
* [Spatial stage](../../design/coordinate-systems.md#stage-frame-of-reference)
* [Tracking loss in Unity](tracking-loss-in-unity.md)
* [Spatial anchors](../../design/spatial-anchors.md)
* [Persistence in Unity](./spatial-anchors-in-unity.md)
* [Shared experiences in Unity](shared-experiences-in-unity.md)
* <a href="/azure/spatial-anchors" target="_blank">Azure Spatial Anchors</a>
* <a href="/dotnet/api/Microsoft.Azure.SpatialAnchors" target="_blank">Azure Spatial Anchors SDK for Unity</a>
---
title: Persistence in older Unity versions
description: Use the Unity WorldAnchorStore persistence feature in older Unity versions to let users pin holograms and find them later over app sessions.
author: thetuvix
ms.author: alexturn
ms.date: 05/05/2022
ms.topic: article
keywords: HoloLens, persistence, Unity, mixed reality headset, windows mixed reality headset, virtual reality headset
ms.custom: kr2b-contr-experiment
---

# Persistence in older Unity versions

When possible, use [World Locking Tools](/mixed-reality/world-locking-tools) instead of `WorldAnchorStore` for persistent world locking. For Unity 2019/2020 with OpenXR or the Windows XR Plugin, use `ARAnchorManager`. For more information, see [Choose your world locking approach](spatial-anchors-in-unity.md#choose-your-world-locking-approach).

This article describes how to use the `WorldAnchorStore` for hologram persistence in older Unity versions or WSA projects.

**Namespace:** *UnityEngine.XR.WSA.Persistence*<br>
**Class:** *WorldAnchorStore*

The persistence feature in Unity creates holographic experiences where holograms stay in specific real-world positions across application instances. Users can pin individual holograms wherever they want, and find them in the same spot over many app sessions.

## Persist holograms across sessions

The `WorldAnchorStore` lets you persist the location of world anchors across sessions. To persist holograms across sessions, keep separate track of `GameObjects` that use a particular world anchor. You can create a `GameObject` root with a world anchor, and anchor child holograms by it with a local position offset.

To load holograms from previous sessions:

1. Get the `WorldAnchorStore`.
2. Load world anchor app data, which gives you the ID of the world anchor.
3. Load the world anchor by its ID.

To save holograms for future sessions:

1. Get the `WorldAnchorStore`.
2. Save a world anchor, specifying an ID.
3. Save app data related to the world anchor along with the ID.

### Get the WorldAnchorStore

Keep a reference to the `WorldAnchorStore`, so you know when it's ready to perform an operation. Since this call is asynchronous, as soon as the app starts up you can call:

```cs
WorldAnchorStore.GetAsync(StoreLoaded);
```

`StoreLoaded` is the handler when the `WorldAnchorStore` finishes loading:

```cs
private void StoreLoaded(WorldAnchorStore store)
{
       this.store = store;
}
```

You now have a reference to the `WorldAnchorStore`, which you can use to save and load specific world anchors.

### Save a world anchor

To save a world anchor, name the world anchor and pass it in the `WorldAnchorStore` you got before. If you try to save two anchors to the same string, `store.Save` returns false. Delete the previous save before saving a new one.

```cs
private void SaveGame()
{
       // Save data about holograms that this world anchor positions
       if (!this.savedRoot) // Only save the root once
       {
              this.savedRoot = this.store.Save("rootGameObject", anchor);
              Assert(this.savedRoot);
       }
}
```

### Load a world anchor

To load a world anchor:

```cs
private void LoadGame()
{
       // Saved data about holograms that this world anchor positions:
       this.savedRoot = this.store.Load("rootGameObject", rootGameObject);
       if (!this.savedRoot)
       {
              // Game root not saved. Re-place objects or start over.
       }
}
```

You can also use `store.Delete()` to remove an anchor you previously saved, and `store.Clear()` to remove all previously saved data.

### Enumerate existing anchors

To list stored anchors, call `GetAllIds`.

```cs
string[] ids = this.store.GetAllIds();
for (int index = 0; index < ids.Length; index++)
{
        Debug.Log(ids[index]);
}
```

## Persist holograms for multiple devices

You can use [Azure Spatial Anchors](/azure/spatial-anchors/overview) to create a durable cloud anchor from a local world anchor. Your app can locate the cloud anchor across multiple HoloLens, iOS, and Android devices, even if the devices aren't together at the same time. Because cloud anchors are persistent, multiple devices can see content rendered relative to that anchor in the same physical location over time.

To get started building shared experiences in Unity, try out the five-minute [Azure Spatial Anchors Unity quickstarts](/azure/spatial-anchors/unity-overview). Once you're up and running with Azure Spatial Anchors, you can [create and locate anchors in Unity](/azure/spatial-anchors/concepts/create-locate-anchors-unity).

## Other development checkpoints

Continue on with the [Unity development checkpoints](unity-development-overview.md#2-core-building-blocks).

Explore other Mixed Reality core building blocks:

> [!div class="nextstepaction"]
> [Spatial mapping](spatial-mapping-in-unity.md)

Start exploring the Mixed Reality platform capabilities and APIs:

> [!div class="nextstepaction"]
> [Shared experiences](shared-experiences-in-unity.md)

## See also

- [World locking and spatial anchors in Unity](spatial-anchors-in-unity.md)
- [Spatial anchor persistence](../../design/coordinate-systems.md#spatial-anchor-persistence)
- [Azure Spatial Anchors](/azure/spatial-anchors)
- [Azure Spatial Anchors SDK for Unity](/dotnet/api/Microsoft.Azure.SpatialAnchors)

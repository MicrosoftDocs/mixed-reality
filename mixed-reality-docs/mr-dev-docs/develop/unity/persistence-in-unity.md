---
title: Persistence in Unity
description: Persistence lets your user's pin individual holograms wherever they want, and then find it later over many uses of your app.
author: thetuvix
ms.author: alexturn
ms.date: 02/24/2019
ms.topic: article
keywords: HoloLens, persistence, Unity, mixed reality headset, windows mixed reality headset, virtual reality headset
---


# Persistence in Unity

**Namespace:** *UnityEngine.XR.WSA.Persistence*<br>
**Class:** *WorldAnchorStore*

The WorldAnchorStore is the key to creating holographic experiences where holograms stay in specific real world positions across instances of the application. Users can then pin individual holograms wherever they want, and find them later in the same spot over many uses of your app.

## How to persist holograms across sessions

The WorldAnchorStore will allow you to persist the location of WorldAnchor's across sessions. To actually persist holograms across sessions, you'll need to separately keep track of your GameObjects that use a particular world anchor. It often makes sense to create a GameObject root with a world anchor and have children holograms anchored by it with a local position offset.

To load holograms from previous sessions:
1. Get the WorldAnchorStore
2. Load app data relating to the world anchor, which gives you the ID of the world anchor
3. Load a world anchor from its ID

To save holograms for future sessions:
1. Get the WorldAnchorStore
2. Save a world anchor specifying an ID
3. Save app data relating to the world anchor along with an ID

### Getting the WorldAnchorStore

You'll want to keep a reference to the WorldAnchorStore so you know when it's ready to perform an operation. Since this is an async call, potentially as soon as start up, you want to call:

```
WorldAnchorStore.GetAsync(StoreLoaded);
```

StoreLoaded in this case is our handler for when the WorldAnchorStore has completed loading:

```
private void StoreLoaded(WorldAnchorStore store)
{
       this.store = store;
}
```

We now have a reference to the WorldAnchorStore, which we'll use to save and load specific World Anchors.

### Saving a WorldAnchor

To save, we simply need to name what we are saving and pass it in the WorldAnchor we got before when we want to save. Note: trying to save two anchors to the same string will fail (store.Save will return false). Delete the previous save before saving the new one:

```
private void SaveGame()
{
       // Save data about holograms positioned by this world anchor
       if (!this.savedRoot) // Only Save the root once
       {
              this.savedRoot = this.store.Save("rootGameObject", anchor);
              Assert(this.savedRoot);
       }
}
```

### Loading a WorldAnchor

And to load:

```
private void LoadGame()
{
       // Save data about holograms positioned by this world anchor
       this.savedRoot = this.store.Load("rootGameObject", rootGameObject);
       if (!this.savedRoot)
       {
              // We didn't actually have the game root saved! We have to re-place our objects or start over
       }
}
```

We additionally can use store.Delete() to remove an anchor we previously saved and store.Clear() to remove all previously saved data.

### Enumerating Existing Anchors

To discover previously stored anchors, call GetAllIds.

```
string[] ids = this.store.GetAllIds();
for (int index = 0; index < ids.Length; index++)
{
        Debug.Log(ids[index]);
}
```

## Persisting holograms for multiple devices

You can use <a href="/azure/spatial-anchors/overview" target="_blank">Azure Spatial Anchors</a> to create a durable cloud anchor from a local WorldAnchor, which your app can then locate across multiple HoloLens, iOS and Android devices, even if those devices aren't present together at the same time.  Because cloud anchors are persistent, multiple devices over time can each see content rendered relative to that anchor in the same physical location.

To get started building shared experiences in Unity, try out the 5-minute <a href="/azure/spatial-anchors/unity-overview" target="_blank">Azure Spatial Anchors Unity quickstarts</a>.

Once you're up and running with Azure Spatial Anchors, you can then <a href="/azure/spatial-anchors/concepts/create-locate-anchors-unity" target="_blank">create and locate anchors in Unity</a>.

## Next Development Checkpoint

If you're following the Unity development checkpoint journey we've laid out, you're in the midst of exploring the Mixed Reality core building blocks. From here, you can continue to the next building block:

> [!div class="nextstepaction"]
> [Spatial mapping](spatial-mapping-in-unity.md)

Or jump to Mixed Reality platform capabilities and APIs:

> [!div class="nextstepaction"]
> [Shared experiences](shared-experiences-in-unity.md)

You can always go back to the [Unity development checkpoints](unity-development-overview.md#2-core-building-blocks) at any time.

## See Also
* [Spatial anchor persistence](../../design/coordinate-systems.md#spatial-anchor-persistence)
* <a href="/azure/spatial-anchors" target="_blank">Azure Spatial Anchors</a>
* <a href="/dotnet/api/Microsoft.Azure.SpatialAnchors" target="_blank">Azure Spatial Anchors SDK for Unity</a>
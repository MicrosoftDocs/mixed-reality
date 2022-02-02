---
title: Shared experiences in Unity
description: Learn how to share the same holograms between multiple users in a Unity application with Azure Spatial Anchors.
author: thetuvix
ms.author: alexturn
ms.date: 02/24/2019
ms.topic: article
keywords: Sharing, Anchor, WorldAnchor, MR Sharing 250, WorldAnchorTransferBatch, SpatialPerception, Azure, Azure Spatial Anchors, ASA, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Shared experiences in Unity

A shared experience lets multiple users, each with their own HoloLens, iOS or Android device, collectively view and interact with the same hologram. Holograms are positioned at a fixed point in space through spatial anchor sharing.

## Azure Spatial Anchors

### Automated with World Locking Tools

As with local anchors, World Locking Tools can use a group of Azure Spatial Anchors to lock entire coordinate spaces relative to the physical world, rather than use individual anchors to lock individual objects. World locking the entire space not only provides an environment that's more conducive to precise layout, it's also more efficient in both developer time and runtime resources.

For further information and samples leveraging Azure Spatial Anchors to share coordinate systems across HoloLens, Android, and iOS devices, as well as persisting spaces across sessions, see the [World Locking Tools documentation](https://docs.microsoft.com/en-us/mixed-reality/world-locking-tools/documentation/howtos/wlt_asa.md).

### Manual configuration of Azure Spatial Anchors

<a href="/azure/spatial-anchors/overview" target="_blank">Azure Spatial Anchors</a> create durable cloud-backed spatial anchors that your app can locate across multiple HoloLens, iOS and Android devices.  By sharing a common spatial anchor across multiple devices, each user can see content rendered relative to that anchor in the same physical location.

You can also use <a href="/azure/spatial-anchors/overview" target="_blank">Azure Spatial Anchors</a> for asynchronous hologram persistence across HoloLens, iOS, and Android devices.  By sharing a durable cloud spatial anchor, multiple devices can observe the same persisted hologram over time, even if those devices aren't present together at the same time.

To get started building shared experiences in Unity, try out the 5-minute <a href="/azure/spatial-anchors/unity-overview" target="_blank">Azure Spatial Anchors Unity quickstarts</a>.

Once Azure Spatial Anchors is set up, you can <a href="/azure/spatial-anchors/concepts/create-locate-anchors-unity" target="_blank">create and locate anchors in Unity</a>.

## Local anchor transfers

In situations where you can't use Azure Spatial Anchors, [local anchor transfers](../../out-of-scope/local-anchor-transfers-in-unity.md) enable one HoloLens device to export an anchor so that a second HoloLens can import it.  This approach is not supported on iOS and Android devices, and provides less robust anchor recall than Azure Spatial Anchors.

## Next Development Checkpoint

If you're following the Unity development journey we've laid out, you're in the midst of exploring the Mixed Reality platform capabilities and APIs. From here, you can continue to the next section:

> [!div class="nextstepaction"]
> [Locatable camera](locatable-camera-in-unity.md)

Or jump directly to deploying your app on a device or emulator:

> [!div class="nextstepaction"]
> [Deploy to HoloLens or Windows Mixed Reality immersive headsets](../advanced-concepts/using-visual-studio.md)

You can always go back to the [Unity development checkpoints](unity-development-overview.md#3-advanced-features) at any time.

## See also
* [Shared experiences in mixed reality](../../design/shared-experiences-in-mixed-reality.md)
* <a href="/azure/spatial-anchors" target="_blank">Azure Spatial Anchors</a>
* <a href="/dotnet/api/Microsoft.Azure.SpatialAnchors" target="_blank">Azure Spatial Anchors SDK for Unity</a>
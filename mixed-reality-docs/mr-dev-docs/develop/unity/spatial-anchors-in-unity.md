---
title: Spatial Anchors in Unity
description: Learn how to create, store, and fetch spatial anchors in Unity mixed reality applications.
author: hferrone
ms.author: v-hferrone
ms.date: 01/22/2021
ms.topic: article
keywords: Unity, spatial anchors, anchor store, HoloLens, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Spatial Anchors in Unity

Spatial anchors save holograms in real-world space between application sessions. Once saved in the HoloLens' anchor store, they can be found and loaded in different sessions and are an ideal fallback when there's no internet connectivity.

> [!IMPORTANT]
> Local anchors are stored on device, while Azure Spatial Anchors are stored in the cloud. If you're looking to use Azure cloud services to store your anchors, we have a document that can walk you through integrating [Azure Spatial Anchors](../mixed-reality-cloud-services.md#azure-spatial-anchors). Note that you can have local and Azure anchors in the same project without conflict.

## Understanding Anchors

[!INCLUDE[](includes/unity-understanding-anchors.md)]

## Using the AnchorStore

[!INCLUDE[](includes/unity-spatial-anchorstore.md)]

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
* [Experience scales](../../design/coordinate-systems.md#mixed-reality-experience-scales)
* [Spatial stage](../../design/coordinate-systems.md#stage-frame-of-reference)
* [Tracking loss in Unity](tracking-loss-in-unity.md)
* [Spatial anchors](../../design/spatial-anchors.md)
* [Shared experiences in Unity](shared-experiences-in-unity.md)
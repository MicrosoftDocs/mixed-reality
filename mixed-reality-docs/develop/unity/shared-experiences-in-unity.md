---
title: Shared experiences in Unity
description: Share the same holograms between multiple users in a Unity application.
author: thetuvix
ms.author: alexturn
ms.date: 02/24/2019
ms.topic: article
keywords: Sharing, Anchor, WorldAnchor, MR Sharing 250, WorldAnchorTransferBatch, SpatialPerception, Azure, Azure Spatial Anchors, ASA
---



# Shared experiences in Unity

A shared experience is one where multiple users, each with their own HoloLens, iOS or Android device, collectively view and interact with the same hologram which is positioned at a fixed point in space. This is accomplished through spatial anchor sharing.

## Azure Spatial Anchors

You can use <a href="https://docs.microsoft.com/azure/spatial-anchors/overview" target="_blank">Azure Spatial Anchors</a> to create durable cloud-backed spatial anchors, which your app can then locate across multiple HoloLens, iOS and Android devices.  By sharing a common spatial anchor across multiple devices, each user can see content rendered relative to that anchor in the same physical location.  This allows for real-time shared experiences.

You can also use <a href="https://docs.microsoft.com/azure/spatial-anchors/overview" target="_blank">Azure Spatial Anchors</a> for asynchronous hologram persistence across HoloLens, iOS and Android devices.  By sharing a durable cloud spatial anchor, multiple devices can observe the same persisted hologram over time, even if those devices are not present together at the same time.

To get started building shared experiences in Unity, try out the 5-minute <a href="https://docs.microsoft.com/azure/spatial-anchors/unity-overview" target="_blank">Azure Spatial Anchors Unity quickstarts</a>.

Once you're up and running with Azure Spatial Anchors, you can then <a href="https://docs.microsoft.com/azure/spatial-anchors/concepts/create-locate-anchors-unity" target="_blank">create and locate anchors in Unity</a>.

## Local anchor transfers

In situations where you cannot use Azure Spatial Anchors, [local anchor transfers](local-anchor-transfers-in-unity.md) enable one HoloLens device to export an anchor to be imported by a second HoloLens device.  Note that this approach provides less robust anchor recall than Azure Spatial Anchors, and iOS and Android devices are not supported by this approach.

## See also
* [Shared experiences in mixed reality](shared-experiences-in-mixed-reality.md)
* <a href="https://docs.microsoft.com/azure/spatial-anchors" target="_blank">Azure Spatial Anchors</a>
* <a href="https://docs.microsoft.com/dotnet/api/Microsoft.Azure.SpatialAnchors" target="_blank">Azure Spatial Anchors SDK for Unity</a>
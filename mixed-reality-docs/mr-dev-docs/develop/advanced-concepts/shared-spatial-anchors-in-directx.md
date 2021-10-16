---
title: Use anchors to share holograms
description: Learn how to synchronize two HoloLens devices by sharing local and Azure spatial anchors in DirectX applications.
author: thetuvix
ms.author: v-vtieto
ms.date: 9/8/2021
ms.topic: article
keywords: HoloLens, synchronize, spatial anchor, transfer, multiplayer, view, scenario, walkthrough, sample code, Azure, Azure Spatial Anchors, ASA
---

# Use anchors to share holograms

> [!NOTE]
> This article relates to the legacy WinRT native APIs.  For new native app projects, we recommend using the **[OpenXR API](../native/openxr-getting-started.md)**.

A shared experience is one where multiple users with their own HoloLens, iOS, or Android device, collectively view and interact with the same hologram. The hologram is positioned at a fixed point in space using spatial anchor sharing.

This article provides brief introductions to Azure Spatial Anchors and local anchors. If you're new to Azure Spatial Anchors, we recommend that you read this [detailed overview](../../design/spatial-anchors.md) first.

## Azure Spatial Anchors

You can use <a href="/azure/spatial-anchors/overview" target="_blank">Azure Spatial Anchors</a> to create durable cloud-backed spatial anchors, which your app can then locate across multiple HoloLens, iOS and Android devices.  By sharing a common spatial anchor across multiple devices, each user can see content rendered relative to that anchor in the same physical location.  This allows for real-time shared experiences.

You can also use <a href="/azure/spatial-anchors/overview" target="_blank">Azure Spatial Anchors</a> for asynchronous hologram persistence across HoloLens, iOS, and Android devices.  By sharing a durable cloud spatial anchor, multiple devices can observe the same persisted hologram over time, even if those devices aren't present together at the same time.

To get started building shared experiences in your HoloLens app, try out the 5-minute <a href="/azure/spatial-anchors/quickstarts/get-started-hololens" target="_blank">Azure Spatial Anchors HoloLens quickstart</a>.

Once you're up and running with Azure Spatial Anchors, you can then <a href="/azure/spatial-anchors/concepts/create-locate-anchors-cpp-winrt" target="_blank">create and locate anchors on HoloLens</a>.  Walkthroughs are available for <a href="/azure/spatial-anchors/create-locate-anchors-overview" target="_blank">Android and iOS</a> as well, enabling you to share the same anchors on all devices.

## Local anchor transfers

In situations where you can't use Azure Spatial Anchors, [local anchor transfers](../../out-of-scope/local-anchor-transfers-in-directx.md) enable one HoloLens device to export an anchor to be imported by a second HoloLens device.  This approach provides less robust anchor recall than Azure Spatial Anchors, and iOS and Android devices are not supported by this approach.

## See also

* [Shared experiences in mixed reality](../native/shared-experiences-in-mixed-reality.md)
* <a href="/azure/spatial-anchors" target="_blank">Azure Spatial Anchors</a>
* <a href="/cpp/api/spatial-anchors/winrt/" target="_blank">Azure Spatial Anchors SDK for HoloLens</a>
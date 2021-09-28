---
title: QR code tracking
description: Learn how to detect QR codes, add webcam capabilities, and manage coordinate systems in mixed reality apps on HoloLens 2.
author: dorreneb
ms.author: v-vtieto
ms.date: 09/28/21
ms.topic: article
keywords: vr, lbe, location based entertainment, vr arcade, arcade, immersive, qr, qr code, hololens2, tracking
---

# QR code tracking

Before getting started here, we recommend that you take a look at our [QR code tracking overview](../platform-capabilities-and-apis/qr-code-tracking-overview.md) article which contains an overview, a device support table, and best practices.

### Detecting QR codes

You can use the QR code detection API in Unity without importing MRTK by installing the NuGet package using [NuGet for Unity](https://github.com/GlitchEnzo/NuGetForUnity). If you want to get a feel for how it works, download the [sample Unity app](https://github.com/chgatla-microsoft/QRTracking/tree/master/SampleQRCodes). The sample app has examples for displaying a holographic square over QR codes and associated data such as GUID, physical size, timestamp, and decoded data.

## Using OpenXR

When using the OpenXR plugin, grab the [`SpatialGraphNodeId` from the QR API](../platform-capabilities-and-apis/qr-code-tracking.md#qr-api-reference) and use the `Microsoft.MixedReality.OpenXR.SpatialGraphNode` API to locate the QR code.

For reference, we have a [QR tracking sample project on GitHub](https://github.com/yl-msft/QRTracking) with more a detailed usage explanation for the [`SpatialGraphNode` API](https://github.com/yl-msft/QRTracking/blob/main/SampleQRCodes/Assets/Scripts/SpatialGraphNodeTracker.cs).

## Getting the coordinate system for a QR code

Each detected QR code exposes a [spatial coordinate system](../../design/coordinate-systems.md) aligned with the QR code at the top-left corner of the fast detection square in the top left:  

![QR code coordinate system](images/Qr-coordinatesystem.png) 

When converted into Unity coordinates, the Z-axis points out of the paper and is left-handed.

## See also
* [QR code tracking overview](../platforms-capabilities-and-apis/qr-code-tracking-overview.md)
* [QR code tracking with native C++ and C## samples](../native/qr-code-tracking-cs-cpp.md)
* [QR code tracking API reference](../api-refs/qr-code-tracking-api-reference.md)
* [Coordinate systems](../../design/coordinate-systems.md)
* <a href="/azure/spatial-anchors/overview" target="_blank">Azure Spatial Anchors</a>
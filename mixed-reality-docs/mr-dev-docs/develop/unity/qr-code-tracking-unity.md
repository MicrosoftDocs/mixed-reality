---
title: QR code tracking
description: Learn how to detect QR codes, add webcam capabilities, and manage coordinate systems in Unity mixed reality apps on HoloLens 2.
author: vtieto
ms.author: vinnietieto
ms.date: 04/13/2022
ms.topic: article
keywords: vr, lbe, location based entertainment, vr arcade, arcade, immersive, qr, qr code, hololens2, tracking
---

# QR code tracking

Before getting started here, we recommend that you take a look at our [QR code tracking overview](../advanced-concepts/qr-code-tracking-overview.md) article which contains an overview, a device support table, and best practices.

### Detecting QR codes

### Adding the webcam capability

You'll need to add the capability `webcam` to your manifest to detect QR codes. This capability is required as the data within detected codes in the user's environment may contain sensitive information.

Permission can be requested by calling `QRCodeWatcher.RequestAccessAsync()`:

_C#:_
```cs
await QRCodeWatcher.RequestAccessAsync();
```

Permission must be requested before you construct a QRCodeWatcher object.

While QR code detection requires the `webcam` capability, the detection occurs using the device's tracking cameras. This provides a wider detection FOV and better battery life compared to detection with the device's photo/video (PV) camera.

You can use the QR code detection API in Unity without importing MRTK by installing the NuGet package using [NuGet for Unity](https://github.com/GlitchEnzo/NuGetForUnity). If you want to get a feel for how it works, download the [sample Unity app](https://github.com/yl-msft/QRTracking). The sample app has examples for displaying a holographic square over QR codes and associated data such as GUID, physical size, timestamp, and decoded data.

## Using OpenXR

When using the OpenXR plugin, grab the [`SpatialGraphNodeId` from the QR API](../native/qr-code-tracking-cs-cpp.md#qr-code-tracking-api-reference) and use the `Microsoft.MixedReality.OpenXR.SpatialGraphNode` API to locate the QR code.

For reference, we have a [QR tracking sample project on GitHub](https://github.com/microsoft/MixedReality-QRCode-Sample) with more a detailed usage explanation for the [`SpatialGraphNode` API](https://github.com/yl-msft/QRTracking/blob/main/SampleQRCodes/Assets/Scripts/SpatialGraphNodeTracker.cs).

## Getting the coordinate system for a QR code

Each detected QR code exposes a [spatial coordinate system](../../design/coordinate-systems.md) aligned with the QR code at the top-left corner of the fast detection square in the top left:  

![QR code coordinate system](images/Qr-coordinatesystem.png) 

When converted into Unity coordinates, the Z-axis points out of the paper and is left-handed.

## See also
* [QR code tracking overview](../advanced-concepts/qr-code-tracking-overview.md)
* [QR code tracking with native C++ and C## samples](../native/qr-code-tracking-cs-cpp.md)
* [QR code tracking API reference](../native/qr-code-tracking-cs-cpp.md)
* [Coordinate systems](../../design/coordinate-systems.md)
* <a href="/azure/spatial-anchors/overview" target="_blank">Azure Spatial Anchors</a>

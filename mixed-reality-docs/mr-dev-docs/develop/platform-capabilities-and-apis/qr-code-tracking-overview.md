---
title: QR code tracking overview
description: Learn how to detect QR codes, add webcam capabilities, and manage coordinate systems in mixed reality apps on HoloLens 2.
author: dorreneb
ms.author: v-vtieto
ms.date: 09/27/21
ms.topic: article
keywords: vr, lbe, location based entertainment, vr arcade, arcade, immersive, qr, qr code, hololens2, tracking
---

# QR code tracking overview

HoloLens 2 can detect QR codes in the environment around the headset, establishing a coordinate system at each code's real-world location. HoloLens 2 can also render holograms in the same location on multiple devices to create a shared experience. Once you enable your device's webcam, you'll be able to recognize QR codes in the latest versions of your projects. Before going to production, we recommend that you follow the [best practices](#best-practices-for-qr-code-detection) we've included at the end of the article.

## Device support

<table>
<tr>
<th>Feature</th><th style="width:150px"> <a href="/hololens/hololens1-hardware">HoloLens (first gen)</a></th><th style="width:150px">HoloLens 2</th><th style="width:150px"> <a href="../../discover/immersive-headset-hardware-details.md">Immersive headsets</a></th>
</tr><tr>
<td> QR code detection</td><td style="text-align: center;">️</td><td style="text-align: center;"> ✔️</td><td style="text-align: center;">✔️</td>
</tr>
</table>

> [!NOTE]
> QR code tracking with immersive Windows Mixed Reality headsets on desktop PCs is supported on Windows 10 Version 2004 and higher. Use the Microsoft.MixedReality.QRCodeWatcher.IsSupported() API to determine whether the feature is supported on the current device.

## Best practices for QR code detection

### Quiet zones around QR Codes

To be read correctly, QR codes require a margin around all sides of the code. This margin must not contain any printed content and should be four modules (a single black square in the code) wide. 

The [QR spec](https://www.qrcode.com/en/howto/code.html) contains more information about quiet zones.

### Lighting and backdrop
QR code detection quality is susceptible to varying illumination and backdrop. 

In a scene with bright lighting, print a code that is black on a gray background. Otherwise, print a black QR code on a white background.

If the backdrop to the code is dark, try a black on gray code if your detection rate is low. If the backdrop is relatively light, a regular code should work fine.

### Size of QR codes
Windows Mixed Reality devices don't work with QR codes with sides smaller than 5 cm each.

For QR codes between 5 cm and 10-cm length sides, you must be fairly close to detect the code. It will also take longer to detect codes at this size. 

The exact time to detect codes depends not only on the size of the QR codes, but how far you're away from the code. Moving closer to the code will help offset issues with size.

### Distance and angular position from the QR code
The tracking cameras can only detect a certain level of detail. For small codes - < 10 cm along the sides - you must be fairly close. For a version 1 QR code varying from 10 cm to 25 cm wide, the minimum detection distance ranges from 0.15 meters to 0.5 meters. 

The detection distance for size increases linearly, but also depends on QR version or module size. The higher the version, the smaller the modules, which can only be detected from a closer position. You can also try micro QR codes if you want the distance of detection to be longer. QR detection works with a range of angles += 45 deg to ensure we have proper resolution to detect the code.

> [!IMPORTANT]
> Always make sure you have enough contrast and a proper border.

### QR codes with logos
QR codes with logos haven't been tested and are currently unsupported.

### Managing QR code data
Windows Mixed Reality devices detect QR codes at the system level in the driver. When the device is rebooted, the detected QR codes are gone and will be redetected as new objects next time.

We recommend configuring your app to ignore QR codes older than a specific timestamp. Currently, the API doesn't support clearing QR code history.

### QR code placement in a space
For recommendations on where and how to place QR codes, refer to [Environment considerations for HoloLens](/hololens/hololens-environment-considerations).

## See also
* [QR code tracking with native C++ and C## samples](../native/qr-code-tracking-cs-cpp.md)
* [QR code tracking in Unity](../unity/qr-code-tracking-unity.md)
* [QR code tracking API reference](../api-refs/qr-code-tracking-api-reference.md)
* [Coordinate systems](../../design/coordinate-systems.md)
* <a href="/azure/spatial-anchors/overview" target="_blank">Azure Spatial Anchors</a>
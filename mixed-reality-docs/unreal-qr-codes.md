---
title: QR codes in Unreal
description: A guide to using QR codes in Unreal
author: hferrone
ms.author: v-haferr
ms.date: 5/5/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, mixed reality, development, features, documentation, guides, holograms, qr codes
---
# QR codes in Unreal

## Overview

HoloLens can locate QR codes in world space to render holograms at known positions in the real world.  This can also be used to render holograms on multiple devices in the same location to create a shared experience. 

## Enabling QR detection

To enable QR detection on HoloLens, ensure the “Webcam” capability is checked in the Unreal editor under Project Settings > Platform > HoloLens > Capabilities.  

Opt into using QR code tracking in Unreal by starting an ARSession with the StartARSession function. 

QR Codes are surfaced through Unreal’s AR tracked geometry system as a tracked image.  To use this, add an AR Trackable Notify component to a Blueprint actor: 

![QR AR Trackable Notify](images/unreal-spatialmapping-artrackablenotify.PNG)

Then go to the component’s details and click on the green “+” button on the events to monitor.  

![QR Events](images/unreal-spatialmapping-events.PNG)

Here, we have subscribed to OnUpdateTrackedImage to render a point in the center of a QR Code and print the QR code’s encoded data. 

![QR Render Example](images/unreal-qr-render.PNG)

First cast the tracked image to an ARTrackedQRCode to verify that the current updated image is a QR code.  Then the encoded data can be retrieved with the QRCode variable.  The top-left of the QR code can be retrieved from the location of GetLocalToWorldTransform.  The dimensions can be retrieved with GetEstimateSize. 

Every QR code also has a unique guid ID: 

![QR Guid](images/unreal-qr-guid.PNG)

## See also
* [QR code tracking](qr-code-tracking.md)
* [Spatial mapping](spatial-mapping.md)
* [Holograms](hologram.m)
* [Coordinate systems](coordinate-systems.md)
* [Environment considerations for HoloLens](hololens-environment-considerations.md)

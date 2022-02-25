---
title: Advanced troubleshooting
description: A strategy for finding where world-locking has gone wrong.
author: fast-slow-still
ms.author: mafinc
ms.date: 10/06/2021
ms.prod: mixed-reality
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Augmented Reality, Mixed Reality, ARCore, ARKit, development, MRTK
---

# A troubleshooting strategy

It's often enough just to think of World Locking Tools (WLT) as a single black box that keeps holograms where they should be. That perspective is useful when things are working correctly, but when the results you're seeing don't match what you expect, it pays to think of the world-locking process as three layers.

The middle layer, the Frozen World Engine (FWE) layer, assumes that an internal network of spatial anchors (layer zero) is stationary in physical space. It uses that network as a reference to lock every point in virtual space to a corresponding point in physical space, creating Locked Space.

The upper layer, the Space Pin layer, assumes that the FWE layer has done its job. The layer applies an interpolated affine transform to the Locked Space to rotate and translate it to align with the user’s specified coordinates at a few reference locations, which are the SpacePin positions.

It's clear, then, that there are three places for something to go wrong.

1. The FWE assumes there will be some tracking error in the spatial anchors and compensates accordingly. But there's a limit to how much error it can filter out. For example, it might ignore outliers, but if all of your spatial anchors are wrong in the same direction, there's no way to detect that. So lower quality spatial anchors will produce a lower quality Locked Space.

1. FWE might get something wrong. For example, it relies on some heuristics to weight some spatial anchors in favor of others. If those heuristics are invalid in your case, then it might be favoring inaccurate anchors over accurate ones.

1. The Space Pin layer is doing a complex analysis and interpolation. With poor tracking causing refit events, it has to do even more adjustment. There are many opportunities for error there as well.

The best approach is to verify from the bottom up. Without using FWE or SpacePins, are your anchors stable in physical space? Or do they drift or otherwise shift in physical space? (Their virtual coordinates are expected to change, but their physical locations aren't.)

If you’ve verified that your spatial anchors are behaving correctly, then try FWE without SpacePins. Things won’t be where you want them, but they should be staying where they are in physical space. Can you verify that that is the case?

Finally, if you have established that the lower two layers are operating as expected, then the Space Pin layer would be suspect for any anomalies.

Identifying the lowest layer that's producing unexpected results is a huge first step in finding and fixing any problems.

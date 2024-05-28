---
title: OpenXR cookbook
description: Find answers to common OpenXR how-to questions.
author: thetuvix
ms.author: alexturn
ms.date: 3/17/2022
ms.topic: article
keywords: OpenXR, Khronos, BasicXRApp, DirectX, native, native app, custom engine, middleware, cookbook, how to, how-to, tips, tricks, FAQ
---

# OpenXR cookbook

Below are some common OpenXR how-to questions that we are often asked as developers dive in on building engines that target the OpenXR API.

## How can my app recenter its reference space?

To recenter a reference space such as `LOCAL` space or `STAGE` space:
1. Call `xrLocateSpace` to find the current location of the `VIEW` reference space within the reference space you are recentering.
2. Call `xrCreateReferenceSpace` again for the reference space you are recentering, adding the current `VIEW` pose to the `poseInReferenceSpace` field on your `XrReferenceSpaceCreateInfo` struct.
3. Call `xrDestroySpace` on the old reference space handle and start using your new recentered reference space in its place.

Be sure to stash away the `XrReferenceSpaceCreateInfo` struct you use in step 2, so that the next time you need to recenter, you can add the then-current `VIEW` pose to the struct's accumulated `poseInReferenceSpace` field.
An alternative is to keep an additional `XrSpace` with an identity `poseInReferenceSpace` solely for determining this offset.

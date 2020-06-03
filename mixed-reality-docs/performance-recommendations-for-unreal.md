---
title: Performance recommendations for Unreal
description: Recommendations for optimal performance for mixed reality apps in Unreal
author: sw5813
ms.author: suwu
ms.date: 5/5/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE4, HoloLens, HoloLens 2, mixed reality, performance, optimization, settings, documentation
---

# Performance recommendations for Unreal

This article builds on the discussion outlined in [performance recommendations for mixed reality](understanding-performance-for-mixed-reality.md) but focuses on learnings specific to the Unreal Engine environment.

## Recommended Unreal project settings

- Use the mobile VR renderer- in your project settings, ensure your target platform is set to "Mobile/Tablet" under "Project – Target Hardware"
- Disable occlusion culling- under "Engine – Rendering" in the "Culling" section, uncheck "Occlusion Culling"
    + If occlusion culling is required because a very detailed scene needs to be rendered, it is recommended that "Support Software Occlusion Culling" is enabled Under "Engine – Rendering". This allows Unreal to do occlusion culling on the CPU and avoid GPU occlusion queries, which perform poorly on HoloLens 2.
- Enable both "Instanced Stereo" and "Mobile Multi-View" under "Engine – Rendering" in the "VR" category. You may need to uncheck "Mobile Post-Processing" in order to be able to check "Mobile Multi-View"

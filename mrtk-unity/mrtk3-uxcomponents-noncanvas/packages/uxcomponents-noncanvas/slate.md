---
title: Slate
description: Slates in MRTK3
author: Zee2
ms.author: finnsinclair
ms.date: 6/6/2022
ms.localizationpriority: high
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, UI, Slate
---

# Slate &#8212; MRTK3

![Slate](../../../mrtk3-overview/images/UXBuildingBlocks/MRTK_UX_v3_Slate.png)

> [!NOTE]
> In the majority of cases, the hybrid Canvas UI prefabs offer a much more powerful designer workflow, with dynamic resizing, reflow, alignment, padding, realtime layouts, and more. [Learn more about how the hybrid Canvas UI system works.](../../../mrtk3-uxcore/packages/uxcore/canvas-ui.md). These prefabs are located in the com.microsoft.mrtk.uxcomponents package. [See the documentation here.](../../../mrtk3-uxcomponents/packages/uxcomponents/overview.md)

The non-Canvas Slate prefab offers a thin window-style control for displaying 2D content, such as plain text and images. It offers a grabbable title bar and *Close* functionality. When building Canvas layouts, consider using a Canvas rounded rect directly as part of your layout.

For smaller, simpler collections of UI, consider using a [near menu](../../../mrtk3-uxcomponents/packages/uxcomponents/near-menu.md) instead.

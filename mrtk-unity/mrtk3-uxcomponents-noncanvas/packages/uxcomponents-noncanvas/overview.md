---
title: UX Components (Non-Canvas)
description: Overview of the UX Components (Non-Canvas) package
author: Zee2
ms.author: finnsinclair
ms.date: 6/6/2022
ms.localizationpriority: high
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, Button, PressableButton, Slider, Toggle
---

# UX Components (Non-Canvas) &#8212; MRTK3

This package contains a library of UX components implementing the [Mixed Reality Design Language](../../../mrtk3-uxcomponents/packages/uxcomponents/mixed-reality-design-language.md) using **non-Canvas, non-RectTransform** components. 

> [!NOTE]
> In the vast majority of cases, the hybrid Canvas UI prefabs offer a much more powerful designer workflow, with dynamic resizing, reflow, alignment, padding, realtime layouts, and more. [Learn more about how the hybrid Canvas UI system works.](../../../mrtk3-uxcore/packages/uxcore/canvas-ui.md). These prefabs are located in the com.microsoft.mrtk.uxcomponents package. [See the documentation here.](../../../mrtk3-uxcomponents/packages/uxcomponents/overview.md)

You should decide carefully when choosing to use non-Canvas prefabs for your project. In the majority of cases, the Canvas prefab library will be more flexible, reusable, and maintainable, especially when you are building large applications with a large number of engineers and designers. In addition, the Canvas-based components offer modern design tooling that most designers expect to be able to use.

The following table outlines a set of criteria you may wish to consider when choosing which components to use for your application. In addition, [please see the documentation](../../../mrtk3-uxcore/packages/uxcore/canvas-ui.md) for a detailed breakdown of how the hybrid Canvas UI systems work, with additional explanations on the corresponding advantages and drawbacks.

|                                 | Canvas | Non-Canvas |
|---------------------------------|--------|------------|
| Resizing and layout             | Realtime resizing, dynamic layout, horizontal/vertical/grid layouts, margin/gutter, padding, flex % | No resizing or layout. Everything is manually positioned and sized by hand. |
| Scrolling/clipping              | Scrolling and per-pixel-accurate clipping (with rounded corners) comes for free. | No scrolling capabilities; clipping requires per-renderer configuration. |
| Size of team + project | Reusable and flexible components make large teams more effective and consistent | Larger number of prefabs and inflexible designs/layout make consistency across large teams difficult
| 2D mouse input                  | Yes                    | Yes |
| Rich volumetric XR input        | Yes                    | Yes |
| Theming                         | Work-in-progress       | com.microsoft.mrtk.data |
| Localization | Work-in-progress | Work-in-progress |
| Number of UI elements on-screen | Best for small layouts | Better batching performance for hundreds/thousands of elements |

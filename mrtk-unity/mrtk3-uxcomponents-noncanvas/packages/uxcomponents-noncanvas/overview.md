---
title: UX Components (Non-Canvas)
description: Overview of the UX Components (Non-Canvas) package
author: marlenaklein-msft
ms.author: marlenaklein
ms.date: 8/30/2023
ms.localizationpriority: high
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, Button, PressableButton, Slider, Toggle
---

# UX Components (Non-Canvas) &#8212; MRTK3

This package contains a library of UX components implementing the [Mixed Reality Design Language](../../../mrtk3-uxcomponents/packages/uxcomponents/mixed-reality-design-language.md) using **non-Canvas, non-RectTransform** components.

You should decide carefully when choosing to use non-Canvas prefabs for your project. In the majority of cases, [the Canvas prefab library](../../../mrtk3-uxcomponents/packages/uxcomponents/overview.md) will be more flexible, reusable, and maintainable, especially when you're building large applications with a large number of engineers and designers. In addition, the Canvas-based components offer [modern design tooling that most designers expect to be able to use.](../../../mrtk3-uxcore/packages/uxcore/canvas-ui.md). There are performance considerations as well, however: the flexibility and feature set of Canvas components can come at a higher cost. If you're building especially large UIs with several hundreds of elements visible at once, you may wish to choose non-Canvas prefabs for improved batching and draw-call efficiency.

The following table outlines a set of criteria you may wish to consider when choosing which components to use for your application. In addition, [see the documentation](../../../mrtk3-uxcore/packages/uxcore/canvas-ui.md) for a detailed breakdown of how the hybrid Canvas UI systems work, with explanations on the corresponding advantages and drawbacks.

| Criteria                        | [Canvas](../../../mrtk3-uxcomponents/packages/uxcomponents/overview.md) | Non-Canvas |
|---------------------------------|--------|------------|
| Resizing and layout             | Realtime resizing, dynamic layout, horizontal/vertical/grid layouts, margin/gutter, padding, flex % | No resizing or layout. Everything is manually positioned and sized by hand. |
| Scrolling/clipping              | Scrolling and per-pixel-accurate clipping (with rounded corners) comes for free. | No scrolling capabilities; clipping requires per-renderer configuration. |
| Size of team + project | Reusable and flexible components make large teams more effective and consistent | Larger number of prefabs and inflexible designs/layout make consistency across large teams difficult
| Learning curve | [Unity UI knowledge + experience recommended](https://learn.unity.com/tutorial/working-with-ui-in-unity) | No prior Unity UI experience required
| 2D mouse input                  | Yes                    | Yes |
| Rich volumetric XR input        | Yes                    | Yes |
| Theming                         | Work-in-progress       | org.mixedrealitytoolkit.data |
| Localization | Work-in-progress | Work-in-progress |
| Number of UI elements on-screen | Best for small layouts | Better batching performance for hundreds/thousands of elements |

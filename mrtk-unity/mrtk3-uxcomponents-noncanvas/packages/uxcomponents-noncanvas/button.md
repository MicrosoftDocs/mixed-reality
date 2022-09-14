---
title: Button (Non-Canvas)
description: Description of non-Canvas button controls in MRTK3
author: Zee2
ms.author: finnsinclair
ms.date: 4/15/2022
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, Button, PressableButton
---

# Button (Non-Canvas) &#8212; MRTK3

![Button Main](../../../mrtk3-overview/images/UXBuildingBlocks/MRTK_UX_v3_Button.png)

When building user interfaces with a *very* large number of controls, or in instances where using RectTransform-based controls is infeasible for layout or performance reasons, MRTK3 offers non-Canvas-based prefabs.

> [!NOTE]
> In the majority of cases, the hybrid Canvas UI prefabs offer a much more powerful designer workflow, with dynamic resizing, reflow, alignment, padding, realtime layouts, and more. [Learn more about how the hybrid Canvas UI system works.](../../../mrtk3-uxcore/packages/uxcore/canvas-ui.md). These prefabs are located in the com.microsoft.mrtk.uxcomponents package. [See the documentation here.](../../../mrtk3-uxcomponents/packages/uxcomponents/overview.md)

## Example scenes

If you're using the development template project, several example scenes are available that demonstrate the available non-Canvas button prefabs.

**UITearSheet.unity** shows all available non-Canvas-based button prefab variants in MRTK.

![Button Example Scene](../../../mrtk3-overview/images/UXBuildingBlocks/Button/MRTK_Button_ExampleScene.png)

## Prefabs (Non-Canvas)

Non-canvas buttons aren't resizable; as a result, a large number of button prefabs are provided in many permutations of size and features. These prefabs are named in the format: **PressableButton_SIZE_STYLE**. For example,

- **PressableButton_32x32mm_IconAndText**: 32x32mm size button with icon and text
- **PressableButton_128x32mm_SinglelineTextWithSubtitle**: 128x32mm size wide button with single line text + subtitle text

## Structure (Non-Canvas)

The following screenshot shows the structure of a non-canvas-based button.

![Non-canvas button structure](../../../mrtk3-overview/images/UXBuildingBlocks/Button/MRTK_Button_Structure.png)

## See more

See the [Canvas-based Button documentation](../../../mrtk3-uxcomponents/packages/uxcomponents/button.md) for more details on the `PressableButton` class, as well as design recommendations for implementing the Mixed Reality Design Language.


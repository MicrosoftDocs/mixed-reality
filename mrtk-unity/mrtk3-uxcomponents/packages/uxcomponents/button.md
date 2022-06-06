---
title: Buttons
description: Description of button-based controls in MRTK3
author: Zee2
ms.author: finnsinclair
ms.date: 4/15/2022
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, Button, PressableButton
---

# Buttons

![Button Main](../../../mrtk3-overview/images/UXBuildingBlocks/MRTK_UX_v3_Button.png)

A button gives the user a way to trigger an immediate action. It's one of the most foundational components in mixed reality, and providing satisfying MRTK provides two categories of button prefabs: canvas-based and non-canvas-based under MRTK UX Components package/Buttons. For more information on canvas vs non-canvas, please see. Both types are using the `PressableButton` script, which is a subclass of [`StatefulInteractable`](../../architecture/interactables.md) extended to include behaviors specific to buttons. For each category you can find various prefabs with different contents (e.g. with ot without an icon) or sizes.

## Example scenes

If you're using the development template project, several example scenes are available that demonstrate the available button prefabs.

**CanvasUITearSheet.unity** shows all available canvas-based button prefab variants in MRTK.

![Canvas Tearsheet](../../../mrtk3-overview/images/UXBuildingBlocks/Button/MRTK_Button_CanvasTearsheet.png)

**CanvasExample.unity** shows some examples of building larger layouts using the Canvas-based components.

![Canvas Example Scene](../../../mrtk3-overview/images/UXBuildingBlocks/Button/MRTK_Button_CanvasExample.png)

**UITearSheet.unity** shows all available non-canvas-based button prefab variants in MRTK.

![Button Example Scene](../../../mrtk3-overview/images/UXBuildingBlocks/Button/MRTK_Button_ExampleScene.png)

## Prefabs (Canvas)

[Canvas-based](../../../mrtk3-uxcore/packages/uxcore/canvas-ui.md) buttons are flexible and configurable, and can be resized to any dimension or proportion. As such, only a small number of button prefabs are provided.

- **EmptyButton** provides the pressable surface/frontplate, holographic backplate, and glow effect. There is no text, icon, label, or other content; this is so that more abstract button-like controls can be built as a variant of this prefab without interfering with the text or icon content.
- **ActionButton** is a simple button that includes an icon, text, and a label. These individual components can be enabled or disabled, and the layout system will adapt accordingly.

Additional "complications" can be added to the button, such as the toggle switch indicator. Features that are not intended to move with the frontplate should be attached to the backplate component.

![Adding a toggle switch](images/toggle-switch.png)

## Prefabs (Non-Canvas)

Non-canvas buttons are not resizable; as a result, a large number of button prefabs are provided in many permutations of size and features. These prefabs are named in the format: **PressableButton_SIZE_STYLE**. For example,

- **PressableButton_32x32mm_IconAndText**: 32x32mm size button with icon and text
- **PressableButton_128x32mm_SinglelineTextWithSubtitle**: 128x32mm size wide button with single line text + subtitle text

## Structure (Canvas)

The different parts of an **ActionButton** can be turned on/off to customize how the button looks and behaves. We've dissected two different possible configurations to show the different parts of the button prefab. Note; the "backglow" is not visible in these screenshots as the button is not actively being pressed.

First, a larger configuration where the main Text object is active and uses inline styles to display both a header and sub-text.
![Large Canvas button structure](images/big-anatomy.png)
Second, a smaller configuration where the Label is active to show a description of the action below the icon. The main Text object is disabled.
![Small Canvas button structure](images/small-anatomy.png)

## Structure (Non-Canvas)

The follow screenshot shows the structure of a non-canvas-based button.

![Non-canvas button structure](../../../mrtk3-overview/images/UXBuildingBlocks/Button/MRTK_Button_Structure.png)

## `PressableButton` class

The `PressableButton` class is derived from `StatefulInteractable` with new and overridden functions specific to buttons. In the inspector you can configure settings related to the volumetric press besides all other configurable settings from `StatefulInteractable`.
![PressableButton inspector screenshot](../../../mrtk3-overview/images/UXBuildingBlocks/Button/MRTK_PressableButton_Inspector.png)

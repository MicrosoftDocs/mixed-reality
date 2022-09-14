---
title: Dialog
description: Description of dialogs in MRTK3
author: Zee2
ms.author: finnsinclair
ms.date: 4/15/2022
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, Dialog, UI
---

# Dialog &#8212; MRTK3

![Dialog](../../../mrtk3-overview/images/UXBuildingBlocks/MRTK_UX_v3_Dialog.png)

> [!NOTE]
> In the majority of cases, the hybrid Canvas UI prefabs offer a much more powerful designer workflow, with dynamic resizing, reflow, alignment, padding, realtime layouts, and more. [Learn more about how the hybrid Canvas UI system works.](../../../mrtk3-uxcore/packages/uxcore/canvas-ui.md). These prefabs are located in the com.microsoft.mrtk.uxcomponents package. [See the documentation here.](../../../mrtk3-uxcomponents/packages/uxcomponents/overview.md)

Dialog controls are UI overlays that provide contextual app information. They often request some action from the user. Use dialogs to notify users of important information or request confirmation or additional info before an action can be completed.

## Example scene and prefabs

DialogExample.unity demonstrates the non-Canvas-based Dialog controls, with several sizes and configurations:

- Dialog_168x88mm.prefab
- Dialog_168x108mm.prefab
- Dialog_168x140mm.prefab

Use `Dialog.InstantiateFromPrefab()` to instantiate (and optionally open) a new dialog. Specify the `Dialog` component on a dialog prefab, the `DialogProperty` object containing information such as title and description text, placement distance (near or far), and whether to open (show) the dialog now. In `DialogProperty` you can specify the dialog options (buttons) to show with `DialogButtonContext[]`. MRTK ships some defaults (`OK`, `OKCancel`, `YesNo`), but you can also create customized `DialogButtonContext`s.

```c#
public static Dialog InstantiateFromPrefab(Dialog dialogComponentOnPrefab, DialogProperty property = null, bool placeForNearInteraction = true, bool openOnInstantiate = false)
```

Example of opening a Small dialog containing a choice message for the user, placed at near interaction range (direct hand interaction)

```c#
Dialog.InstantiateFromPrefab(DialogPrefabSmall, new DialogProperty("Choice Dialog, Small, Near", "This is an example of a small dialog with a choice message for the user, placed at near interaction range", DialogButtonHelpers.YesNo), true, true);
```

For more information, see `DialogExampleController.cs` in DialogExample.unity scene.

---
title: Dialog
description: Description of included dialog prefabs in MRTK3 UX Components
author: Zee2
ms.author: finnsinclair
ms.date: 4/15/2022
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, Dialog, UI
---

# Dialog &#8212; MRTK3

![Dialog](../../../mrtk3-overview/images/UXBuildingBlocks/MRTK_UX_v3_Dialog.png)

Dialogs are short-lived UI views that provide contextual app information. They often request some action from the user and then return the result back to the app's business logic in an asynchronous task or result. Use dialogs to notify users of important information or request confirmation before an action can be completed.

If you're looking for the Dialog API documentation and usage examples, [see the UXCore documentation here.](../../../mrtk3-uxcore/packages/uxcore/dialog-api.md).

## Prefabs

MRTK3 UX Components provides `CanvasDialog.prefab` as a starting point for building responsive, code-driven modal dialogs.

The Canvas-based Dialog prefab uses auto-layout to only show the controls requested through the `IDialog` fluent builder API. Until the subcontrols are requested by the API caller, they'll be disabled, and won't be visible in the layout. As a result, only one Dialog prefab is needed, instead of a wide variety of prefabs for each permutation of button options or text layout.

To use the pre-made UX Components dialog, make sure your `DialogPool` has the prefab set to the correct asset. You can also assign the `DialogPool`'s prefab at runtime through the `DialogPool` API, either through the `Get` parameter or by directly setting the `DialogPrefab` property. [See the Dialog API documentation here for examples of using the DialogPool component.](../../../mrtk3-uxcore/packages/uxcore/dialog-api.md)

Developers can also build their own custom Dialog prefabs. If the custom prefab offers the same features as the base Dialog functionality, no code changes are required, and the base `Dialog` script can be used. If there are added features on the Dialog view that require binding to the `IDialog` API (like new buttons, labels, or other subcontrols) a subclassed implementation of `IDialog` will be required. When building a custom prefab, ensure the various subcontrols have been properly referenced on the `IDialog` MonoBehaviour, or else they will not be bound or hydrated correctly.

## Example scenes

See `DialogExample.unity` for examples of how to spawn Dialogs. For more information, code samples, and details, [see the UXCore documentation here.](../../../mrtk3-uxcore/packages/uxcore/dialog-api.md).
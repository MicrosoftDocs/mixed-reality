---
title: Dialog API
description: Description of the Dialog API in MRTK3 UXCore
author: Zee2
ms.author: finnsinclair
ms.date: 12/19/2022
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, MRTK3, Dialog, UI
---

# Dialog API &#8212; MRTK3

![Dialog](../../../mrtk3-overview/images/UXBuildingBlocks/MRTK_UX_v3_Dialog.png)

Dialogs are short-lived UI views that provide contextual app information. They often request some action from the user and then return the result back to the app's business logic in an asynchronous task or result. Use dialogs to notify users of important information or request confirmation before an action can be completed.

MRTK3 UXCore provides the `IDialog` API, along with the basic `Dialog` implementation and a `DialogPool` for spawning and managing instances. This documentation describes the code-driven fluent API for showing Dialogs from your business logic. For documentation on the prefabs included in the UX Components package, [see the Dialog prefab documentation here.](../../../mrtk3-uxcomponents/packages/uxcomponents/dialog.md)

## Usage

Place a `DialogPool` somewhere in your scene or UI hierarchy. If desired, you can manage your own global `DialogPool` reference with a singleton, manager or other pattern. MRTK itself doesn't exert an opinion on how you maintain a global `DialogPool` reference, but the component must be in your scene somewhere so that the referenced dialog view prefab is included in your build.

`DialogPool` will automatically set its prefab reference to the standard UX Components `CanvasDialog.prefab`, if the package is installed. For more information on the UX Components standard `CanvasDialog.prefab`, [see the documentation here.](../../../mrtk3-uxcomponents/packages/uxcomponents/dialog.md)

Once you've obtained your `DialogPool` reference, you can use a fluent-style builder API to configure and show your dialog.

```csharp
dialogPool.Get()
    .SetHeader("This is the Dialog's header.")
    .SetBody("You can specify the dialog's body text here.")
    .SetPositive("The positive button's label.", (args) => { /* Do thing! */ })
    .Show()
```

Only the sub-controls that are specified in your calls to the builder API will be visible on the reuslting Dialog. For example, the above code sample will result in a Dialog with both header text and body text, but only a single positive-choice button. Additional buttons can be specified by chaining further method calls.

```csharp
// This dialog will show all three buttons.
dialogPool.Get()
    .SetHeader("A header.")
    .SetBody("Foobarbaz!")
    .SetPositive("The positive button's label.", (args) => { /* Do thing! */ })
    .SetNegative("The negative button's label.", (args) => { /* Do another thing! */ })
    .SetNeutral("A neutral option, too!", (args) => { /* Do some neutral thing. */ })
    .Show()
```

The `args` that are passed through the button callbacks will be `DialogButtonEventArgs`, which include both a reference to the `IDialog` that generated the event, as well as the `DialogButtonType` of the button that the user chose.

It's possible that a dialog might be dismissed externally before the user is able to make a decision, either by another dialog being opened or by the dialog being manually dismissed in code. In this case, the callback provided to `SetPositive()` would never be invoked. If you'd like to listen to any event on the dialog, including an external dismissal, you can listen to the `OnDismissed` callback.

```csharp
var dialog = dialogPool.Get()?SetBody("Foobar!");
dialog.OnDismissed += (args) => { /* do things! */ };
dialog.Show();
```

`OnDismissed` will pass a `DialogDismissedEventArgs`, which will contain a `DialogButtonEventArgs` if the user had made a choice, or `null` if the dialog was dismissed for some other reason.

The standard `IDialog.Show()` method is suitable for typical Unity-idiomatic use in non-`async` methods. If you're writing business logic in an `async` context, you can use the `IDialog.ShowAsync()` method to `await` on the result of the dialog with a more expressive syntax.

```csharp
async void SomeAsyncBusinessLogic()
{
    var result = await dialogPool.Get()
                    .SetBody("The await will resolve when the user selects the option.")
                    .SetNeutral("A button!")
                    .ShowAsync();

    Debug.Log("Async dialog says: " + result.Choice?.ButtonText);
}
```

`ShowAsync` will return the same arg type as `OnDismissed`, a `DialogDismissedEventArgs`.

## Example scene and prefabs

For information on the included prefabs and sample scenes, [see the UX Components documentation here.](../../../mrtk3-uxcomponents/packages/uxcomponents/dialog.md)
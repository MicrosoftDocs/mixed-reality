---
title: Migration guide from MRTK2 to MRTK3
description: Mixed Reality Toolkit 3 for developers - Concept migration guide from MRTK2.
author: marlenaklein-msft
ms.author: marlenaklein
ms.date: 4/21/2023
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3
---

# Migration guide from MRTK2 to MRTK3

As you begin using MRTK3, you'll notice that several concepts in MRTK v2 have been changed, replaced, or removed. This document will help bridge the gap between MRTK v2 concepts and their MRTK3 counterparts.

## Interactions 

MRTK3 uses Unity's XR Interaction Toolkit (XRI) framework to handle interaction, and the Unity Input System plus OpenXR for input. 

> [!IMPORTANT]
> For developers new to XRI, we recommend that you first review Unity's [XRI architecture documentation](https://docs.unity3d.com/Packages/com.unity.xr.interaction.toolkit@2.0/manual/architecture.html). All XRI documentation also applies to MRTK3, as most interaction and input features are simply inherited from XRI.


### Terminology

| MRTK v2 term | MRTK3 term | Description |
| ------------ | -------- | ----------- |
| Pointer | Interactor | [Interactors](https://docs.unity3d.com/Packages/com.unity.xr.interaction.toolkit@2.0/api/UnityEngine.XR.Interaction.Toolkit.XRBaseInteractor.html) perform interactions on **Interactables**. Some (but not all) Interactors are driven by Controllers, from which they receive input actions and poses. Other Interactors operate independently of controllers. <br><br> MRTK ships several custom Interactors that provide useful mixed reality interactions on top of the basic Interactors Unity already provides. Custom interactors can be built either through inheritance or by implementing the Interactor interfaces (`IXRHoverInteractor`, `IXRSelectInteractor`, and so forth). For more information, see the [Interactor architecture documentation](interactors.md).
| `NearInteractionGrabbable, NearInteractionTouchable, IMixedRealityPointerHandler` | Interactable | [Interactables](https://docs.unity3d.com/Packages/com.unity.xr.interaction.toolkit@2.0/api/UnityEngine.XR.Interaction.Toolkit.XRBaseInteractable.html) are the recipients of interactions. MRTK ships several custom Interactables that provide useful mixed reality interactions on top of the basic Interactables Unity already provides. Interactables can be built either through inheritance or by implementing the interactable interfaces (`IXRHoverInteractable`, `IXRSelectInteractable`, and so forth). For more information on how MRTK extends XRI interactables, see the [Interactable architecture documentation](interactables.md). |
| Controller | Controller | An [ActionBasedController](https://docs.unity3d.com/Packages/com.unity.xr.interaction.toolkit@2.0/manual/xr-controller-action-based.html) is a collection of Unity Input Actions representing the bindings associated with a particular device. The collection of Input Actions can be derived from multiple devices, as there isn't a 1:1 relationship between `ActionBasedControllers` and underlying input devices. (A `DeviceBasedController` is a 1:1 mapping of an input device, but we don't use them.) <br><br> Many interactors (`ControllerBasedInteractor`s, specifically) listen to Controllers for input actions--in other words, all `ControllerBasedInteractor`s underneath an XRController will share the same select action. |
| Teleport System | Locomotion System | The [Locomotion System](https://docs.unity3d.com/Packages/com.unity.xr.interaction.toolkit@2.0/manual/locomotion-system.html) allows the user to move about the scene during an XR experience. MRTK v2's system allows for basic teleportation and teleport hotspots, with a high degree of customizability for the teleport cursor and pointer behavior. XRI offers the following added capabilities for locomotion: <br> <ul> <li> A Snap Turn Provider that rotates the rig by fixed angles </li> <li> A Continuous Turn Provider that smoothly rotates the rig over time </li> <li> A Continuous Move Provider that smoothly moves the rig over time </li> </ul> |
| Focus Provider | XR Interaction Manager | The [XRInteractionManager](https://docs.unity3d.com/Packages/com.unity.xr.interaction.toolkit@2.0/manual/xr-interaction-manager.html) is the Unity mechanism that serves as the intermediary between the **Interactors** and **Interactables** in the scene. The Unity `XRInteractionManager` synchronizes and arbitrates all interactions between Interactors and Interactables, and allows for significantly greater flexibility when compared to the legacy Focus Provider. |
| Pointer Mediator | Interaction Mode Manager | The new **Interaction Mode Manager** is used to enable/disable sets of interactors depending on context within the scene. See the [mode manager documentation](../../mrtk3-input/packages/input/interaction-mode-manager.md) for more information. |
| SceneQuerymask | Interaction Layers | XRI [interaction layers](https://docs.unity3d.com/Packages/com.unity.xr.interaction.toolkit@2.0/manual/interaction-layers.html) allow developers to filter which Interactors can act upon which Interactables. These layers are distinct from Unity physics layers. |
| Focus | Hover  | Interactors issue **Hovers** on Interactables when the Interactable is a valid target for the Interactor. Generally, a Hover indicates intent from the interactor, such as targeting with a ray, hand proximity for grab, or if the user is looking at the object. |
| Select/Poke/Grab/Voice etc. | Select | Interactors issue **Selects** on Interactables when the Interactable is both a valid target and the Interactor chooses to do so. ControllerBasedInteractors generally emit Selects when their corresponding Controller's select input action fires. Other interactors can have more complex logic for determining when selects should be issued to the targeted Interactable. <br> <br> MRTK v2 handled different kinds of interactions with separate events and codepaths--in other words, a grab was a fundamentally different interaction than a ray click or poke, generated by separate systems. In MRTK3, all of these ways of "selecting" an object are unified under the same **Select** interaction. <br> <br> We strongly discourage developers from building interaction logic that relies on a specific type of interaction; instead, write generalizable code that responds generically to all Selects. This way, your interactions work across all input modalities, and even for types of interactions that have yet to be developed. See the [Interactable architecture](interactables.md) for further reading on why we discourage this course. |
| N/A | Activate | **Activate** is an extra action that can be raised on an object that has already been Selected. For instance, if a user Selects a squirt gun with the grip of the controller, the trigger fires it with an Activate action.  |
| Data Provider | XRSubsystem + Provider | Most data providers are no longer necessary in MRTK3, since the Unity Input System and OpenXR handle most cross-platform input tasks. However, for some outliers that aren't yet covered by Unity, we provide `XRSubsystem`s that can provide data across different platforms--for example, `HandsAggregatorSubsystem` and `SpeechSubsystem`. See the [subsystems architecture documentation](subsystems.md) for more conceptual reading on our subsystems approach. |

<br/>

### Events

| MRTK v2 term | XRI term | Notes |
| ------------ | -------- | ----------- |
| `OnFocusEnter/Exit`	| `FirstHoverEnter`<br>`LastHoverExit` | Note the `First` and `Last` prefixes. These are included in the event names because any number of Interactors can simultaneously hover an Interactable. You can also listen to each individual hover enter/exit with `HoverEnter` and `HoverExit`, although it's less useful than monitoring the overall hover status. |
| `OnPointerDown/Up`  | `FirstSelectEnter`<br>`LastSelectExit` | Note the `First` and `Last` prefixes. These are included in the event names because any number of Interactors can simultaneously select an Interactable (depending on the selection mode). You can also listen to each individual select enter/exit with `SelectEnter` and `SelectExit`, although it's less useful than monitoring the overall selection status.|
| `OnPointerDragged`  | N/A  | Simply poll the `interactorsSelecting` attach transforms with `GetAttachTransform` during a selection. Bear in mind that, depending on the selection mode of the Interactable, an unbounded number of Interactors can select (and manipulate) an Interactable. |
| `OnSourcePoseChanged, OnSourceDetected, OnSourceLost` | N/A | XRI doesn't raise these events. They are handled via the **XRController** monitoring its associated **Input Device**. |

<br/>

## UX Components

For full documentation on MRTK3 UX components, refer to the overviews for the UX packages: [`UX Core`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-uxcore/packages/uxcore/overview), [`UX Components`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-uxcomponents/packages/uxcomponents/overview), and [`UX Components (Non-Canvas)`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-uxcomponents/packages/uxcomponents-noncanvas/overview). A major change in MRTK3 is the emphasis on Canvas UX components, which utilize Unity UI. There is also a package for Non-Canvas UX components. A comparison between Canvas and Non-Canvas UX can be found [here](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-uxcomponents-noncanvas/packages/uxcomponents-noncanvas/overview).


Note: `Hand Coach`, `Tooltips`, `Object Collection`, `AppBar`, and `Progress Indicator` components do not yet exist in MRTK3. Additionally, `Toolbox` and optimized `Text Prefabs` are not yet implemented. This document will be updated as additional MRTK3 UX components are added

<br/>

| MRTK2 | MRTK3 | Notes |
| --- | --- | --- |
| [`Buttons`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/button)| [`Canvas Button`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-uxcomponents/packages/uxcomponents/button) <br/> [`Non-Canvas Button`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-uxcomponents-noncanvas/packages/uxcomponents-noncanvas/button) | In MRTK3, Unity UI based buttons and Collider based buttons are renovated as Canvas and Non-Canvas buttons. <br/><br/> Built in tools to group buttons in MRTK3 include [`Button Group`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-uxcomponents/packages/uxcomponents/button-group) and [`ToggleCollection`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-uxcore/packages/uxcore/toggle-collection). <br/><br/> Samples can be found in the `CanvasUITearsheet` and `NonCanvasUITearsheet` scenes.|
| [`Slider`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/slider)| [`Canvas Slider`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-uxcomponents/packages/uxcomponents/slider) <br/> [`Non-Canvas Slider`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-uxcomponents-noncanvas/packages/uxcomponents-noncanvas/slider) | A sample can be found in the `HandInteractionExamples` scene. |
| [`Dialog`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/dialog)| [`Dialog`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-uxcomponents/packages/uxcomponents/dialog) <br/> [`Dialog API`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-uxcore/packages/uxcore/dialog-api) | A sample can be found in the `DialogExample` scene. |
| [`Scrolling Collection`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/scrolling-object-collection)| [`VirtualizedScrollRectList`](https://learn.microsoft.com/en-us/dotnet/api/microsoft.mixedreality.toolkit.ux.virtualizedscrollrectlist?view=mrtkuxcore-3.0) | A sample can be found in the `VirtualizedScrollRectList` scene. MRTK3 documentation is in currently in progress. |
| [`Slate`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/slate)| [`Slate (Non-Canvas)`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-uxcomponents-noncanvas/packages/uxcomponents-noncanvas/slate) | A sample can be found in the `SlateDrawingExample` scene. |
| [`Hand Menu`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/hand-menu)| [`Hand Menu`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-uxcomponents/packages/uxcomponents/hand-menu) | A sample can be found in the `HandMenuExamples` scene. |
| [`Near Menu`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/near-menu)| [`Near Menu`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-uxcomponents/packages/uxcomponents/near-menu) | A sample can be found in the `NearMenuExamples` scene. |
| [`System Keyboard`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/system-keyboard)| [`System Keyboard`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-input/packages/input/system-keyboard) | A sample can be found in the `NearMenuExamples` scene. |
| [`Fingertip Visualization`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/fingertip-visualization)| `MRTK Poke Veticle Visual` | The `Finger Cursor` script and prefab are replaced in MRTK3 and the index fingertip is visualized via the `MRTK Poke Reticle Visual`, located on the `IndexTip PokeInteractor` on the `MRTK XR Rig`.  <br/> <br/> MRTK3 documentation is in currently in progress.|
| [`Constraint Manager`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/constraint-manager)| [`Constraint Manager`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-spatialmanipulation/packages/spatialmanipulation/constraint-manager) | A sample can be found in the `BoundsControlExamples` scene.|
| [`Bounds Control`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/bounds-control) [`Bounding Box`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/bounding-box)| [`Bounds Control`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-spatialmanipulation/packages/spatialmanipulation/bounds-control) | The `BoundingBox` script has been replaced. `BoundsControl` provides an automatically-sized bounding box, the visuals of which can be customized. There are several `BoundingBox` prefabs which can be used for visuals. <br/><br/> A sample can be found in the `BoundsControlExamples` scene.|
| [`Object Manipulator`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/object-manipulator) [`Manipulation Handler`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/manipulation-handler) | [`Object Manipulator`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-spatialmanipulation/packages/spatialmanipulation/object-manipulator) | Manipulation Handler is deprecated. Use Object Manipulator for the manipulation (move, rotate, scale) of an object by any interactor with a valid attach transform. <br/><br/> MRTK3 documentation is in currently in progress. A sample can be found in the `HandInteractionExamples` scene.|
| [`Interactable`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/interactable)| [`StatefulInteractable`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-overview/architecture/interactables) | A sample can be found in the `InteractableButtonExamples` scene.|
| [`Dwell`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/dwell)| `InteractorDwellManager` | In MRTK2, a `DwellHandler` was attached to objects and provided events for handling the start and end of dwell. In MRTK3, there is an `InteractorDwellManager` on the `GazeInteractor` and `Far Rays` in the `MRTK XR Rig`, which uses `StatefulInteractable` to determine if the object enables dwell or not, and if it does it selects the object for the duration of dwell. <br/> <br/> MRTK3 documentation is in currently in progress.|
| [`Solvers`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/solvers/solver)| [`Solvers`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-spatialmanipulation/packages/spatialmanipulation/solvers/solver) | MRTK3 sample scenes are currently in progress. |
| [`Visual Theming`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk2/features/ux-building-blocks/solvers/visual-themes)| [`Data Binding and Theming`](https://learn.microsoft.com/en-us/windows/mixed-reality/mrtk-unity/mrtk3-data/packages/data/overview) | MRTK3 Data Binding and Theming framework is designed to make it easy to create visual elements that can be populated and updated dynamically at runtime. Not yet integrated with Unity's Canvas-based controls. |

<br/>

## Input Configurations 

### Input Actions

MRTK 3 uses the new **Unity Input System Package** for input actions. Most settings can be configured through an `Input Action` asset.

| Task | MRTK 2 | MRTK 3 |
| --- | --- | --- |
| Create an `Input Action` | [Input Actions Profile](/windows/mixed-reality/mrtk-unity/mrtk2/features/input/input-actions#creating-an-input-action)| [Use an Action Map within the `Input Action` asset.](https://docs.unity3d.com/Packages/com.unity.inputsystem@1.5/manual/Actions.html#creating-actions) |
| Bind an `Input Action` to a `Controller` | [Controller Input Mapping Profile](/windows/mixed-reality/mrtk-unity/mrtk2/features/input/controllers) | [Set the binding for an action with the `Input Action` asset.](https://docs.unity3d.com/Packages/com.unity.inputsystem@1.5/manual/ActionBindings.html)|

<br/>

### Pointers

Pointers are attached to interactors in MRTK3. In the default `MRTK XR Rig`, the interactors are positioned underneath the `MRTK RightHand Controller` and `MRTK LeftHand Controller`.

| Task | MRTK 2 | MRTK 3 |
| --- | --- | --- |
| Set a visual prefab for a pointer         | `Pointer Prefab` property in [MRTK 2 Pointer Configuration Profile.](/windows/mixed-reality/mrtk-unity/mrtk2/features/input/pointers#pointer-options-configuration)| MonoBehaviours onthe `MRTK RightHand Controller` and `MRTK LeftHand Controller` in the `MRTK XR Rig`. For instance, `MRTKPokeReticleVisual`, `MRTKLineVisual`, and `MRTKRayReticleVisual`.                                                                  |
| Limit which layers can be interacted with | `Pointing Raycast Layer Masks`  property in `MRTK Pointer Profile`. This applies to all pointers.                                                                                                                                                                                                                                                                      | `raycastMask` property on the `Interactor` script.                           |
| Set the extent of a pointer raycast             | `Pointing Extent`  property in `MRTK Pointer Profile`. This applies to all pointers.                                                                                                                                                                                                                                                                                   | `maxRaycastDistance` property on the `Interactor` script.                    |
| Set the priority of pointers                  | Controlled by the `DefaultPointerMediator` or an override.                                                                                                                                                                                                                                                                                                          | Configured through the `InteractionModeManager` (an MRTK3 MonoBehaviour). |

<br/>

### Gestures

`Input Actions` can be assigned to various gesture input methods (currently only supported for Windows Recognition on HoloLens 2).

| Task | MRTK 2 | MRTK 3 |
| --- | --- | --- |
| Assign an action to a gesture | Assign gestures to `Input Action` in `MixedRealityGesturesProfile`. | [Gestures on HoloLens 2 are now recognized through the OpenXR plugin.](/dotnet/api/microsoft.mixedreality.openxr.gesturerecognizer)|

<br/>

### Speech Commands
The `KeywordRecognitionSubsystem` can be enabled to allow speech commands in MRTK 3. More information can be found in the documentation on [Speech Input](/windows/mixed-reality/mrtk-unity/mrtk3-input/packages/input/speech).

|  Task |  MRTK 2 |  MRTK 3 |
| --- | --- | --- |
|  Map speech commands to `Input Actions` | `Speech Commands Profile` in the `Input System Profile`. | Call `CreateOrGetEventForKeyword` on the `KeywordRecongitionSubsystem` with your keyword and action. |  

<br/>

### Controller Configuration
|  Task |  MRTK 2 | MRTK 3 |
| --- | --- | --- |
| Configure controller button behavior   | [ControllerMappingProfile](/windows/mixed-reality/mrtk-unity/mrtk2/configuration/mixed-reality-configuration-guide#controller-mapping-configuration)    | [Action Map within the `Input Action` asset.](/windows/mixed-reality/mrtk-unity/mrtk2/features/input/input-actions#creating-an-input-action)
| Set a prefab for controller visualization | [ControllerMappingProfile](/windows/mixed-reality/mrtk-unity/mrtk2/configuration/mixed-reality-configuration-guide#controller-visualization-settings) | Configured in the `XRController` settings. For instance, the `Model Prefab` property in `ArticulatedHandController.` |
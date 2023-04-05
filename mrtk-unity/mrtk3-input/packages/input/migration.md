---
title: Migrating Input Configurations from MRTK 2 to MRTK 3
description: Reference on how to migrate input settings from MRTK 2 to MRTK 3
author: srinjoym
ms.author: srmajumd
ms.date: 4/1/2023
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, input, configuration, profile, input system, Mixed Reality Toolkit
---

# Migrating Input Configurations from MRTK 2 to MRTK 3

## Input Actions

MRTK 3 uses the new **Unity Input System Package** for input actions. Most settings can be configured through an Input Action asset.

| Task | MRTK 2 Location | MRTK 3 Location |
| --- | --- | --- |
| Creating an input action | MRTK 2 Input Actions Profile ([docs](/windows/mixed-reality/mrtk-unity/mrtk2/features/input/input-actions#creating-an-input-action))| Action map within the Input Action Asset ([docs](https://docs.unity3d.com/Packages/com.unity.inputsystem@1.5/manual/Actions.html#creating-actions)) |
| Binding an input action to a controller | MRTK 2 Controller Input Mapping profile ([docs](/windows/mixed-reality/mrtk-unity/mrtk2/features/input/controllers)) | Set binding for an action with the Input Action Asset ([docs](https://docs.unity3d.com/Packages/com.unity.inputsystem@1.5/manual/ActionBindings.html))|

## Pointers

Pointers are attached to interactors in MRTK 3.
 
In the default MRTK XR Rig the interactors are positioned underneath Left and Right-Hand Controller GameObjects.

| Task | MRTK 2 Location | MRTK 3 Location |
| --- | --- | --- |
| Setting visual prefab for pointer         | `Pointer Prefab` property in MRTK 2 Pointer Configuration Profile ([docs](/windows/mixed-reality/mrtk-unity/mrtk2/features/input/pointers#pointer-options-configuration))| MonoBehaviours on Left and Right-Hand Controllers under MRTK XR Rig. Ex: MRTKPokeReticleVisual, MRTKLineVisual, MRTKRayReticleVisual                                                                  |
| Limit which layers can be interacted with | `Pointing Raycast Layer Masks`  property in MRTK Pointer Profile. This applies to all pointers.                                                                                                                                                                                                                                                                      | `raycastMask` property on Interactor script                           |
| Set extent of pointer raycast             | `Pointing Extent`  property in MRTK Pointer Profile. This applies to all pointers.                                                                                                                                                                                                                                                                                   | `maxRaycastDistance` property on Interactor script                    |
| Set priority of pointers                  | Controlled by the `DefaultPointerMediator` or an override                                                                                                                                                                                                                                                                                                          | Configured through the InteractionModeManager (MRTK3 MonoBehaviour) |


## Gestures

Assign input actions to various gesture input methods (currently only Windows Recognition on HL2)
| Task | MRTK 2 Location | MRTK 3 Location |
| --- | --- | --- |
| Assign action to a gesture | Assign gestures to input action in MixedRealityGesturesProfile | Gestures on HoloLens are now recongized through the OpenXR plugin ([docs](/dotnet/api/microsoft.mixedreality.openxr.gesturerecognizer))


## Speech Commands
Enable the KeywordRecognitionSubsystem to enable speech commands on MRTK 3 ([docs]([Speech input - MRTK3 | Microsoft Learn](/windows/mixed-reality/mrtk-unity/mrtk3-input/packages/input/speech)))

|  Task |  MRTK 2 Location |  MRTK 3 Location |
| --- | --- | --- |
|  Mapping speech commands to Input Actions | Speech Commands Profile in MRTK 2 Input System Profile | Call `CreateOrGetEventForKeyword` on the KeywordRecongitionSubsystem with your keyword and action |  

## Controller Configuration
|  Task |  MRTK 2 Location | MRTK 3 Location |
| --- | --- | --- |
| Configure controller button behavior   | MRTK 2 ControllerMappingProfile ([docs](/windows/mixed-reality/mrtk-unity/mrtk2/configuration/mixed-reality-configuration-guide#controller-mapping-configuration))    | Action Map within the Input Action Asset ([docs](/windows/mixed-reality/mrtk-unity/mrtk2/features/input/input-actions#creating-an-input-action))
| Set prefab for controller visualization | MRTK 2 Controller Mapping Profile ([docs](/windows/mixed-reality/mrtk-unity/mrtk2/configuration/mixed-reality-configuration-guide#controller-visualization-settings)) | Configured in XRController settings. Ex: `Model Prefab` property in ArticulatedHandController. |

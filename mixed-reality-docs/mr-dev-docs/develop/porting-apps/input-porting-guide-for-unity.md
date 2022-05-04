---
title: Input porting guide for Unity
description: Learn how to handle input for Windows Mixed Reality in Unity.
author: thetuvix
ms.author: alexturn
ms.date: 05/03/2022
ms.topic: article
keywords: input, unity, porting
---


# Input porting guide for Unity

You can port your input logic to Windows Mixed Reality by using one of two approaches:

- Unity's general `Input.GetButton/GetAxis` APIs that span across multiple platforms.
- The Windows-specific `XR.Input` APIs, which offer richer data specifically for motion controllers and HoloLens hands.

## Unity XR input APIs

Future Unity releases phase out the XR.WSA APIs in favor of the XR SDK. For new projects, it's best to use the XR input APIs from the beginning. For more information, see [Unity XR Input](https://docs.unity3d.com/Manual/xr_input.html).

## General Input.GetButton/GetAxis APIs

Unity currently uses its general `Input.GetButton/Input.GetAxis` APIs to expose input for the [Oculus SDK](https://docs.unity3d.com/Manual/OculusControllers.html) and the [OpenVR SDK](https://docs.unity3d.com/Manual/OpenVRControllers.html). If your apps already use these APIs for input, these APIs are the easiest path to support motion controllers in Windows Mixed Reality. You just need to remap buttons and axes in the Input Manager.

For more information, see the [Unity button/axis mapping table](../unity/motion-controllers-in-unity.md#unity-buttonaxis-mapping-table) and the overview of the [Common Unity APIs](../unity/motion-controllers-in-unity.md#common-unity-apis-inputgetbuttongetaxis).

> [!IMPORTANT]
> If you use HP Reverb G2 controllers, see [HP Reverb G2 Controllers in Unity](../unity/unity-reverb-g2-controllers.md) for further input mapping instructions.

## Windows-specific XR.Input APIs

If your app already builds custom input logic for each platform, you can use the Windows-specific spatial input APIs in the `UnityEngine.XR.Input` namespace. These APIs let you access more information, such as position accuracy or source kind, so you can tell hands and controllers apart on HoloLens.

For more information, see the overview of the [Windows-specific APIs (XR.WSA.Input)](../unity/motion-controllers-in-unity.md#windows-specific-apis-xrwsainput).

> [!NOTE]
> If you use HP Reverb G2 controllers, all input APIs continue to work except for `InteractionSource.supportsTouchpad`, which returns false with no touchpad data.

## Grip pose vs. pointing pose

Windows Mixed Reality supports motion controllers in different form factors. Each controller's design differs in its relationship between the user's hand position and the natural forward direction that apps use for pointing when rendering the controller.

To better represent these controllers, you can investigate two kinds of poses for each interaction source, *grip pose* and *pointer pose*. You express all pose coordinates in Unity world coordinates.

- The **grip pose** represents the location of either the palm of a hand detected by a HoloLens, or the palm holding a motion controller. On immersive headsets, use this pose to render the user's hand or an object held in the user's hand, such as a sword or gun.

  Access the grip pose through either Unity's cross-vendor [XR.InputTracking](https://docs.unity3d.com/ScriptReference/XR.InputTracking.html)`.GetLocalPosition/Rotation` input API, or through the Windows-specific `sourceState.sourcePose.TryGetPosition/Rotation` API, requesting the `Grip` pose.

  - The **grip position** is the palm centroid when holding the controller naturally, adjusted left or right to center the position within the grip.
  - The **grip orientation's right axis** is the ray that's normal to your palm, forward from left palm, backward from right palm, when you completely open your hand to form a flat five-finger pose.
  - The **grip orientation's forward axis** is the ray that points forward through the tube formed by your non-thumb fingers when you close your hand partially, as if holding the controller.
  - The **grip orientation's up axis** is the up axis implied by the right and forward definitions.

- The **pointer pose** represents the tip of the controller pointing forward. This pose is best used to ray cast pointing at UI when you're rendering the controller model itself.

  The pointer pose is available only through the Windows-specific `sourceState.sourcePose.TryGetPosition/Rotation` API, requesting the `Pointer` pose.

## See also
- [Motion controllers](../../design/motion-controllers.md)
- [Motion controllers in Unity](../unity/motion-controllers-in-unity.md)
- [UnityEngine.XR.InputTracking](https://docs.unity3d.com/ScriptReference/XR.InputTracking.html)
- [Porting guides](porting-guides.md)

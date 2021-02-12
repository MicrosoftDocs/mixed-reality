---
title: Input porting guide for Unity
description: Learn how to handle input for Windows Mixed Reality in Unity.
author: thetuvix
ms.author: alexturn
ms.date: 12/9/2020
ms.topic: article
keywords: input, unity, porting
---


# Input porting guide for Unity

You can port your input logic to Windows Mixed Reality using one of two approaches. The first is to use Unity's general Input.GetButton/GetAxis APIs that span across multiple platforms. The second is the Windows-specific XR.WSA.Input APIs, which offer richer data specifically for motion controllers and HoloLens hands.

## General Input.GetButton/GetAxis APIs

Unity currently uses its general Input.GetButton/Input.GetAxis APIs to expose input for [the Oculus SDK](https://docs.unity3d.com/Manual/OculusControllers.html) and [the OpenVR SDK](https://docs.unity3d.com/Manual/OpenVRControllers.html). If your apps are already using these APIs for input, the Input.GetButton/Input.GetAxis APIs are the easiest paths for supporting motion controllers in Windows Mixed Reality. You'll only need to remap buttons and axes in the Input Manager.

For more information, see the [Unity button/axis mapping table](../unity/motion-controllers-in-unity.md#unity-buttonaxis-mapping-table) and the [overview of the common Unity APIs](../unity/motion-controllers-in-unity.md#common-unity-apis-inputgetbuttongetaxis).

## Windows-specific XR.WSA.Input APIs

If your app already builds custom input logic for each platform, you can use the Windows-specific spatial input APIs in the **UnityEngine.XR.WSA.Input** namespace. From there, you access additional information, such as position accuracy or the source kind, letting you tell hands and controllers apart on HoloLens.

For more information, see the [overview of the UnityEngine.XR.WSA.Input APIs](../unity/motion-controllers-in-unity.md#windows-specific-apis-xrwsainput).

## Grip pose vs. pointing pose

Windows Mixed Reality supports motion controllers in different form factors. Each controller's design differs in its relationship between the user's hand position and the natural "forward" direction that apps should use for pointing when rendering the controller.

To better represent these controllers, there are two kinds of poses you can investigate for each interaction source:

* The **grip pose**, which represents the location of either the palm of a hand detected by a HoloLens, or the palm holding a motion controller.
    * On immersive headsets, this pose is best used to render **the user's hand** or **an object held in the user's hand**, such as a sword or gun.
    * The **grip position**: The palm centroid when holding the controller naturally, adjusted left or right to center the position within the grip.
    * The **grip orientation's Right axis**: When you completely open your hand to form a flat 5-finger pose, the ray that is normal to your palm (forward from left palm, backward from right palm)
    * The **grip orientation's Forward axis**: When you close your hand partially, as if holding the controller, the ray that points "forward" through the tube formed by your non-thumb fingers.
    * The **grip orientation's Up axis**: The Up axis implied by the Right and Forward definitions.
    * You can access the grip pose through either Unity's cross-vendor input API (**[XR.InputTracking](https://docs.unity3d.com/ScriptReference/XR.InputTracking.html).GetLocalPosition/Rotation**) or through the Windows-specific API (**sourceState.sourcePose.TryGetPosition/Rotation**, requesting the Grip pose).
* The **pointer pose**, representing the tip of the controller pointing forward.
    * This pose is best used to raycast when **pointing at UI** when you're rendering the controller model itself.
    * Currently, the pointer pose is available only through the Windows-specific API (**sourceState.sourcePose.TryGetPosition/Rotation**, requesting the Pointer pose).

These pose coordinates are all expressed in Unity world coordinates.

## See also
* [Motion controllers]()../../design/motion-controllers.md)
* [Motion controllers in Unity](../unity/motion-controllers-in-unity.md)
* [UnityEngine.XR.WSA.Input](https://docs.unity3d.com/ScriptReference/XR.WSA.Input.InteractionManager.html)
* [UnityEngine.XR.InputTracking](https://docs.unity3d.com/ScriptReference/XR.InputTracking.html)
* [Porting guides](porting-guides.md)

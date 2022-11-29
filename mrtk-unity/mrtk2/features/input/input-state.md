---
title: Input State
description: Documentation on Input States in MRTK
author: keveleigh
ms.author: kurtie
ms.date: 01/12/2021
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, InputState,
---

# Accessing input state in MRTK &#8212; MRTK2

It's possible to directly query the state of all inputs in MRTK by iterating over the controllers attached to the input sources. MRTK also provides convenience methods for accessing the position and rotation of the eyes, hands, head, and motion controller.

See the InputDataExample scene for an example of querying input both via iterating over controllers, and by using the [`InputRayUtils`](xref:Microsoft.MixedReality.Toolkit.Input.InputRayUtils?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) class.

## Example: Access position, rotation of head, hands, eyes in MRTK

MRTK's [`InputRayUtils`](xref:Microsoft.MixedReality.Toolkit.Input.InputRayUtils?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) class provides convenience methods for accessing the hand ray, head ray, eye gaze ray, and motion controller rays.

Add these namespaces to your script:

```c#
using Microsoft.MixedReality.Toolkit.Input;
using Microsoft.MixedReality.Toolkit.Utilities;
```

Sample code:

```c#
// Get the head ray
UnityEngine.Ray headRay = InputRayUtils.GetHeadGazeRay();

// Get the right hand ray
if (InputRayUtils.TryGetHandRay(Handedness.Right, out UnityEngine.Ray rightHandRay))
{
    // Right hand ray is available
}
else
{
    // Right hand ray is not available
}
```

## Example: Access position, rotation of all 6DOF controllers active in scene

Add these namespaces to your script:

```c#
using Microsoft.MixedReality.Toolkit;
using Microsoft.MixedReality.Toolkit.Input;
```

Sample code:

```c#
foreach (IMixedRealityController controller in CoreServices.InputSystem.DetectedControllers)
{
    // Interactions for a controller is the list of inputs that this controller exposes
    foreach (MixedRealityInteractionMapping interactionMapping in controller.Interactions)
    {
        // 6DOF controllers support the "SpatialPointer" type (pointing direction)
        // or "GripPointer" type (direction of the 6DOF controller)
        if (interactionMapping.InputType == DeviceInputType.SpatialPointer)
        {
            Debug.Log("Spatial pointer PositionData: " + interactionMapping.PositionData);
            Debug.Log("Spatial pointer RotationData: " + interactionMapping.RotationData);
        }

        if (interactionMapping.InputType == DeviceInputType.SpatialGrip)
        {
            Debug.Log("Spatial grip PositionData: " + interactionMapping.PositionData);
            Debug.Log("Spatial grip RotationData: " + interactionMapping.RotationData);
        }
    }
}
```

## See also

- [InputEvents](input-events.md)
- [Pointers](pointers.md)
- [HandTracking](hand-tracking.md)

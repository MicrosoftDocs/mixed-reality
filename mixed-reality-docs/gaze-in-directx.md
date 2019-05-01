---
title: Head and eye gaze in DirectX
description: Developer guide for using head gaze and eye tracking in native DirectX apps.
author: caseymeekhof
ms.author: cmeekhof
ms.date: 05/01/2019
ms.topic: article
keywords: gaze, head gaze, head tracking, eye tracking, directx, input, holograms
---

# Head and eye gaze in DirectX

In Windows Mixed Reality, gaze input is used to determine what the user is looking at. This can be used to drive primary input models such as [gaze and commit](gaze-and-commit.md), and also to provide context for other interactions. There are two types of gaze available through the APIs: head gaze and eye gaze.

**Head gaze** represents the direction that the user's head is pointed in.  Think of this literally as the position and forward direction of the device itself. The position in this case is the center point between the two displays.  Head gaze is available on all Mixed Reality devices.  **Eye gaze** represents the real direction that the user's eyes are looking in. It is available on any device that includes an eye tracking system.  Both types of gaze are provided as a ray with an origin and direction. Applications can use this ray to raycast into their scenes and determine what the user is targeting with their head or eyes.

## The basics

Both head and eye gaze rays are accessible through the  [SpatialPointerPose](https://docs.microsoft.com/en-us/uwp/api/Windows.UI.Input.Spatial.SpatialPointerPose) API. Simply call [SpatialPointerPose::TryGetAtTimestamp](https://docs.microsoft.com/en-us/uwp/api/windows.ui.input.spatial.spatialpointerpose.trygetattimestamp) to recieve a new SpatialPointerPose object at the specified timestamp and [coordinate system](coordinate-systems-in-directx.md). This SpatialPointerPose contains a head gaze origin and direction. It also contains an eye gaze origin and direction if eye tracking is available.

## Accessing the head gaze

To access the head gaze, start by calling  [SpatialPointerPose::TryGetAtTimestamp](https://docs.microsoft.com/en-us/uwp/api/windows.ui.input.spatial.spatialpointerpose.trygetattimestamp) to recieve a new SpatialPointerPose object. You need to pass the following parameters.
 - A [SpatialCoordinateSystem](https://docs.microsoft.com/en-us/uwp/api/windows.perception.spatial.spatialcoordinatesystem) that represents the desired coordinate system for the head gaze. This is represented by the *coordinateSystem* variable in the following code. For more information, visit our [coordinate systems](coordinate-systems-in-directx.md) developer guide.
 - A [Timestamp](https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographicframeprediction.timestamp#Windows_Graphics_Holographic_HolographicFramePrediction_Timestamp) that represents the exact time of the head pose requested.  Typically you will use a timestamp that corresponds to the time when the current frame will be displayed. You can get this predicted display timestamp from a  [HolographicFramePrediction](https://docs.microsoft.com/en-us/uwp/api/Windows.Graphics.Holographic.HolographicFramePrediction) object, which is accessible through the current [HolographicFrame](https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographicframe).  This HolographicFramePrediction object is represented by the *prediction* variable in the following code.

 Once you have a valid SpatialPointerPose, the head position and forward direction, are easily available as properties.  The following code snippet shows how to access these.

 ```cpp
using Windows::UI::Input::Spatial;
using Windows::Foundation::Numerics;

SpatialPointerPose^ pointerPose = SpatialPointerPose::TryGetAtTimestamp(coordinateSystem, prediction->Timestamp);
if (pointerPose)
{
	float3 headPosition = pointerPose->Head->Position;
	float3 headForwardDirection = pointerPose->Head->ForwardDirection;

	// Do something with the head gaze
}
```

## Accessing the eye gaze

Accessing the eye gaze is very similar to the head gaze, but requires a bit of extra initialization work to enable.

### Enabling eye tracking

In order to use eye tracking, you must first enable it by requesting access.

### Accessing the eye gaze

The following code shows how to access the latest eye gaze.  Note that the first part of this, getting the [SpatialPointerPose](https://docs.microsoft.com/en-us/uwp/api/Windows.UI.Input.Spatial.SpatialPointerPose), is exactly the same between head gaze and eye gaze.  Feel free to only call [SpatialPointerPose::TryGetAtTimestamp](https://docs.microsoft.com/en-us/uwp/api/windows.ui.input.spatial.spatialpointerpose.trygetattimestamp) once if your app uses both head gaze and eye gaze.

```cpp
using Windows::UI::Input::Spatial;
using Windows::Foundation::Numerics;

SpatialPointerPose^ pointerPose = SpatialPointerPose::TryGetAtTimestamp(coordinateSystem, prediction->Timestamp);
if (pointerPose)
{
	if (pointerPose->Eyes && pointerPose->Eyes->IsCalibrationValid)
	{
		if (pointerPose->Eyes->Gaze)
		{
			auto spatialRay = pointerPose->Eyes->Gaze->Value;
			float3 eyeGazeOrigin = spatialRay.Origin;
			float3 eyeGazeDirection = spatialRay.Direction;

			// Do something with the eye gaze
		}
		else
		{
			// No data for this frame (i.e. eyes are closed)
		}
	}
	else
	{
		// Eye tracking not enabled or user not calibrated
	}
}
```



## Correlating gaze with input source states

In some scenarios, you may find that you need a SpatialPointerPose that corresponds with an event in the past. One example is if you get a 'Select' event from the SpatialInteractionManager, and want to get the gaze ray from the exact time that the user pressed the select button.

Note that the data is tied to a pointer state of some kind. We get this from a spatial input event. The event data object includes a coordinate system, so that you can always relate the gaze direction at the time of the event to whatever spatial coordinate system you need. In fact, you must do so in order to get the pointer pose.

```cpp
// Check for new input state since the last frame.
SpatialInteractionSourceState^ pointerState = m_spatialInputHandler->CheckForInput();
if (pointerState != nullptr)
{
    // When a Pressed gesture is detected, the sample hologram will be repositioned
    // two meters in front of the user.
    m_spinningCubeRenderer->PositionHologram(
        pointerState->TryGetPointerPose(currentCoordinateSystem)
        );
}
```

## See also
* [Hands and controllers in DirectX](hands-and-controllers-in-directx.md)
* [Coordinate systems in DirectX](coordinate-systems-in-directx.md)
* [Gaze and commit input model](gaze-and-commit.md)


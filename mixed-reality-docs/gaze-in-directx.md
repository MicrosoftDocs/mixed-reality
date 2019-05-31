---
title: Head and eye gaze in DirectX
description: Developer guide for using head gaze and eye tracking in native DirectX apps.
author: caseymeekhof
ms.author: cmeekhof
ms.date: 05/09/2019
ms.topic: article
keywords: gaze, head gaze, head tracking, eye tracking, directx, input, holograms
---

# Head and eye gaze input in DirectX

In Windows Mixed Reality, eye and head gaze input is used to determine what the user is looking at. This can be used to drive primary input models such as [head gaze and commit](gaze-and-commit.md), and also to provide context for types of interactions. There are two types of gaze vectors available through the API: head gaze and eye gaze.  Both are provided as a three dimensional ray with an origin and direction. Applications can then raycast into their scenes, or the real world, and determine what the user is targeting.

**Head gaze** represents the direction that the user's head is pointed in. Think of this as the position and forward direction of the device itself, with the position representing the center point between the two displays.  Head gaze is available on all Mixed Reality devices.

**Eye gaze** represents the direction that the user's eyes are looking towards. The origin is located between the user's eyes.  It is available on Mixed Reality devices that include an eye tracking system.

Both head and eye gaze rays are accessible through the  [SpatialPointerPose](https://docs.microsoft.com/en-us/uwp/api/Windows.UI.Input.Spatial.SpatialPointerPose) API. Simply call [SpatialPointerPose::TryGetAtTimestamp](https://docs.microsoft.com/en-us/uwp/api/windows.ui.input.spatial.spatialpointerpose.trygetattimestamp) to receive a new SpatialPointerPose object at the specified timestamp and [coordinate system](coordinate-systems-in-directx.md). This SpatialPointerPose contains a head gaze origin and direction. It also contains an eye gaze origin and direction if eye tracking is available.

## Using head gaze

To access the head gaze, start by calling  [SpatialPointerPose::TryGetAtTimestamp](https://docs.microsoft.com/en-us/uwp/api/windows.ui.input.spatial.spatialpointerpose.trygetattimestamp) to receive a new SpatialPointerPose object. You need to pass the following parameters.
 - A [SpatialCoordinateSystem](https://docs.microsoft.com/en-us/uwp/api/windows.perception.spatial.spatialcoordinatesystem) that represents the desired coordinate system for the head gaze. This is represented by the *coordinateSystem* variable in the following code. For more information, visit our [coordinate systems](coordinate-systems-in-directx.md) developer guide.
 - A [Timestamp](https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographicframeprediction.timestamp#Windows_Graphics_Holographic_HolographicFramePrediction_Timestamp) that represents the exact time of the head pose requested.  Typically you will use a timestamp that corresponds to the time when the current frame will be displayed. You can get this predicted display timestamp from a  [HolographicFramePrediction](https://docs.microsoft.com/en-us/uwp/api/Windows.Graphics.Holographic.HolographicFramePrediction) object, which is accessible through the current [HolographicFrame](https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographicframe).  This HolographicFramePrediction object is represented by the *prediction* variable in the following code.

 Once you have a valid SpatialPointerPose, the head position and forward direction are accessible as properties.  The following code  shows how to access them.

 ```cpp
using namespace winrt::Windows::UI::Input::Spatial;
using namespace winrt::Windows::Foundation::Numerics;

SpatialPointerPose pointerPose = SpatialPointerPose::TryGetAtTimestamp(coordinateSystem, prediction.Timestamp());
if (pointerPose)
{
	float3 headPosition = pointerPose.Head().Position();
	float3 headForwardDirection = pointerPose.Head().ForwardDirection();

	// Do something with the head gaze
}
```

## Using eye gaze

The eye gaze API is very similar to head gaze.  It uses the same  [SpatialPointerPose](https://docs.microsoft.com/en-us/uwp/api/Windows.UI.Input.Spatial.SpatialPointerPose) API, which provides a ray origin and direction that you can raycast against your scene.  The only difference is that you need to explicitly enable eye tracking before using it. For this, you need to do two steps:
1. Request user permission to use eye tracking in your app.
2. Enable the "Gaze Input" capability in your package manifest.

### Requesting access to gaze input
When your app is starting up, call [EyesPose::RequestAccessAsync](https://docs.microsoft.com/en-us/uwp/api/windows.perception.people.eyespose.requestaccessasync#Windows_Perception_People_EyesPose_RequestAccessAsync) to request access to eye tracking. The system will prompt the user if needed, and return [GazeInputAccessStatus::Allowed](https://docs.microsoft.com/en-us/uwp/api/windows.ui.input.gazeinputaccessstatus) once access has been granted. This is an asynchronous call, so it requires a bit of extra management. The following example spins up a detached std::thread to wait for the result, which it stores to a member variable called *m_isEyeTrackingEnabled*.

```cpp
using namespace winrt::Windows::Perception::People;
using namespace winrt::Windows::UI::Input;

std::thread requestAccessThread([this]()
{
	auto status = EyesPose::RequestAccessAsync().get();

	if (status == GazeInputAccessStatus::Allowed)
		m_isEyeTrackingEnabled = true;
	else
		m_isEyeTrackingEnabled = false;
});

requestAccessThread.detach();

```
Starting a detached thread is just one option for handling async calls.  Alternatively, you could use the new [co_await](https://docs.microsoft.com/en-us/windows/uwp/cpp-and-winrt-apis/concurrency) functionality supported by C++/WinRT.
Here is another example for asking for user permission:
-	EyesPose::IsSupported() allows the application to trigger the permission dialog only if there is an eye tracker.
- 	GazeInputAccessStatus m_gazeInputAccessStatus; // This is to prevent popping up the permission prompt over and over again.

```cpp
GazeInputAccessStatus m_gazeInputAccessStatus; // This is to prevent popping up the permission prompt over and over again.

// This will trigger to show the permission prompt to the user.
// Ask for access if there is a corresponding device and registry flag did not disable it.
if (Windows::Perception::People::EyesPose::IsSupported() &&
   (m_gazeInputAccessStatus == GazeInputAccessStatus::Unspecified))
{ 
	Concurrency::create_task(Windows::Perception::People::EyesPose::RequestAccessAsync()).then(
	[this](GazeInputAccessStatus status)
	{
  		// GazeInputAccessStatus::{Allowed, DeniedBySystem, DeniedByUser, Unspecified}
    		m_gazeInputAccessStatus = status;
		
		// Let's be sure to not ask again.
		if(status == GazeInputAccessStatus::Unspecified)
		{
      			m_gazeInputAccessStatus = GazeInputAccessStatus::DeniedBySystem;	
		}
	});
}

```


### Declaring the *Gaze Input* capability

Double click the appxmanifest file in *Solution Explorer*.  Then navigate to the *Capabilities* section and check the *Gaze Input* capability. 

![Gaze input capability](images/gaze-input-capability.png)

This adds the following lines to the *Package* section in the appxmanifest file:
```xml
  <Capabilities>
    <DeviceCapability Name="gazeInput" />
  </Capabilities>
```

### Getting the eye gaze ray
Once you have received access to ET, you are free to grab the eye gaze ray every frame.  Just as with head gaze, get the [SpatialPointerPose](https://docs.microsoft.com/en-us/uwp/api/Windows.UI.Input.Spatial.SpatialPointerPose) by calling [SpatialPointerPose::TryGetAtTimestamp](https://docs.microsoft.com/en-us/uwp/api/windows.ui.input.spatial.spatialpointerpose.trygetattimestamp) with a desired timestamp and coordinate system. The SpatialPointerPose contains an [EyesPose](https://docs.microsoft.com/en-us/uwp/api/windows.perception.people.eyespose) object through the [Eyes](https://docs.microsoft.com/en-us/uwp/api/windows.ui.input.spatial.spatialpointerpose.eyes) property. This is non-null only if eye tracking is enabled. From there you can check if the user in the device has an eye tracking calibration by calling [EyesPose::IsCalibrationValid](https://docs.microsoft.com/en-us/uwp/api/windows.perception.people.eyespose.iscalibrationvalid#Windows_Perception_People_EyesPose_IsCalibrationValid).  Next, use the [Gaze](https://docs.microsoft.com/en-us/uwp/api/windows.perception.people.eyespose.gaze#Windows_Perception_People_EyesPose_Gaze) property to get the a [SpatialRay](https://docs.microsoft.com/en-us/uwp/api/windows.perception.spatial.spatialray) contianing the eye gaze position and direction. The Gaze property can sometimes be null, so be sure to check for this. This can happen is if a calibrated user temporarily closes their eyes.

The following code shows how to access the eye gaze ray.

```cpp
using namespace winrt::Windows::UI::Input::Spatial;
using namespace winrt::Windows::Foundation::Numerics;

SpatialPointerPose pointerPose = SpatialPointerPose::TryGetAtTimestamp(coordinateSystem, prediction.Timestamp());
if (pointerPose)
{
	if (pointerPose.Eyes() && pointerPose.Eyes().IsCalibrationValid())
	{
		if (pointerPose.Eyes().Gaze())
		{
			auto spatialRay = pointerPose.Eyes().Gaze().Value();
			float3 eyeGazeOrigin = spatialRay.Origin;
			float3 eyeGazeDirection = spatialRay.Direction;
			
			// Do something with the eye gaze
		}
	}
}

```

## Correlating gaze with other inputs

Sometimes you may find that you need a [SpatialPointerPose](https://docs.microsoft.com/en-us/uwp/api/windows.ui.input.spatial.spatialpointerpose) that corresponds with an event in the past. For example, if the user performs an Air Tap, your app might want to know what they were looking at. For this purpose, simply using [SpatialPointerPose::TryGetAtTimestamp](https://docs.microsoft.com/en-us/uwp/api/windows.ui.input.spatial.spatialpointerpose.trygetattimestamp) with the predicted frame time would be inaccurate because of the latency between system input processing and display time. In addition, if using eye gaze for targeting, our eyes tend to move on even before finishing a commit action. This is less of an issue for a simple Air Tap, but becomes more critical when combining long voice commands with fast eye movements. One way to handle this scenario is to make an additional call to  [SpatialPointerPose::TryGetAtTimestamp](https://docs.microsoft.com/en-us/uwp/api/windows.ui.input.spatial.spatialpointerpose.trygetattimestamp), using a historical timestamp that corresponds to the input event.  

However, for input that routes through the SpatialInteractionManager, there's an easier method. The [SpatialInteractionSourceState](https://docs.microsoft.com/en-us/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate) has its very own [TryGetAtTimestamp](https://docs.microsoft.com/en-us/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.trygetpointerpose) function. Calling that will provide a perfectly correlated [SpatialPointerPose](https://docs.microsoft.com/en-us/uwp/api/windows.ui.input.spatial.spatialpointerpose) without the guesswork. For more information on working with SpatialInteractionSourceStates, take a look at the [Hands and Motion Controllers in DirectX](hands-and-motion-controllers-in-directx.md) documentation.

## See also
* [Head gaze and commit input model](gaze-and-commit.md)
* [Eye tracking on HoloLens 2](eye-tracking.md)
* [Coordinate systems in DirectX](coordinate-systems-in-directx.md)
* [Voice Input in DirectX](voice-input-in-directx.md)
* [Hands and motion controllers in DirectX](hands-and-motion-controllers-in-directx.md)

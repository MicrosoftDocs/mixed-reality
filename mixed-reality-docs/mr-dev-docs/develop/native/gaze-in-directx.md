---
title: Head and eye gaze in DirectX
description: Learn how to request, use, and unpack raycasting data from head gaze and eye tracking in native DirectX apps.
author: caseymeekhof
ms.author: cmeekhof
ms.date: 08/04/2020
ms.topic: article
keywords: eye-gaze, head-gaze, head tracking, eye tracking, directx, input, holograms, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Head-gaze and eye-gaze input in DirectX

> [!NOTE]
> This article relates to the legacy WinRT native APIs.  For new native app projects, we recommend using the **[OpenXR API](openxr-getting-started.md)**.

In Windows Mixed Reality, eye and head gaze input is used to determine what the user is looking at. You can use the data to drive primary input models like [head-gaze and commit](../../design/gaze-and-commit.md), and provide context for different interaction types. There are two types of gaze vectors available through the API: head-gaze and eye-gaze.  Both are provided as a three-dimensional ray with an origin and direction. Applications can then raycast into their scenes, or the real world, and determine what the user is targeting.

**Head-gaze** represents the direction that the user's head is pointed in. Think of head-gaze as the position and forward direction of the device itself, with the position as the center point between the two displays. Head-gaze is available on all Mixed Reality devices.

**Eye-gaze** represents the direction that the user's eyes are looking towards. The origin is located between the user's eyes.  It's available on Mixed Reality devices that include an eye tracking system.

Both head and eye-gaze rays are accessible through the  [SpatialPointerPose](/uwp/api/Windows.UI.Input.Spatial.SpatialPointerPose) API. Call [SpatialPointerPose::TryGetAtTimestamp](/uwp/api/windows.ui.input.spatial.spatialpointerpose.trygetattimestamp) to receive a new SpatialPointerPose object at the specified timestamp and [coordinate system](coordinate-systems-in-directx.md). This SpatialPointerPose contains a head-gaze origin and direction. It also contains an eye-gaze origin and direction if eye tracking is available.

### Device support

<table>
<colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
</colgroup>
<tr>
     <td><strong>Feature</strong></td>
     <td><a href="/hololens/hololens1-hardware"><strong>HoloLens (1st gen)</strong></a></td>
     <td><a href="https://docs.microsoft.com/hololens/hololens2-hardware"><strong>HoloLens 2</strong></td>
     <td><a href="../../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
</tr>
<tr>
     <td>Head-gaze</td>
     <td>✔️</td>
     <td>✔️</td>
     <td>✔️</td>
</tr>
<tr>
     <td>Eye-gaze</td>
     <td>❌</td>
     <td>✔️</td>
     <td>❌</td>
</tr>
</table>

## Using head-gaze

To access the head-gaze, start by calling  [SpatialPointerPose::TryGetAtTimestamp](/uwp/api/windows.ui.input.spatial.spatialpointerpose.trygetattimestamp) to receive a new SpatialPointerPose object. Pass the following parameters.
 - A [SpatialCoordinateSystem](/uwp/api/windows.perception.spatial.spatialcoordinatesystem) that represents the coordinate system you want for the head-gaze. This is represented by the *coordinateSystem* variable in the following code. For more information, visit our [coordinate systems](coordinate-systems-in-directx.md) developer guide.
 - A [Timestamp](/uwp/api/windows.graphics.holographic.holographicframeprediction.timestamp#Windows_Graphics_Holographic_HolographicFramePrediction_Timestamp) that represents the exact time of the head pose requested.  Typically, you'll use a timestamp that corresponds to the time when the current frame will be displayed. You can get this predicted display timestamp from a  [HolographicFramePrediction](/uwp/api/Windows.Graphics.Holographic.HolographicFramePrediction) object, which is accessible through the current [HolographicFrame](/uwp/api/windows.graphics.holographic.holographicframe).  This HolographicFramePrediction object is represented by the *prediction* variable in the following code.

 Once you have a valid SpatialPointerPose, the head position and forward direction are accessible as properties.  The following code  shows how to access them.

 ```cpp
using namespace winrt::Windows::UI::Input::Spatial;
using namespace winrt::Windows::Foundation::Numerics;

SpatialPointerPose pointerPose = SpatialPointerPose::TryGetAtTimestamp(coordinateSystem, prediction.Timestamp());
if (pointerPose)
{
	float3 headPosition = pointerPose.Head().Position();
	float3 headForwardDirection = pointerPose.Head().ForwardDirection();

	// Do something with the head-gaze
}
```

## Using eye-gaze

For your users to use eye-gaze input, each user has to go through an [eye tracking user calibration](/hololens/hololens-calibration) the first time they use the device. 
The eye-gaze API is similar to head-gaze.
It uses the same [SpatialPointerPose](/uwp/api/Windows.UI.Input.Spatial.SpatialPointerPose) API, which provides a ray origin and direction that you can raycast against your scene.  The only difference is that you need to explicitly enable eye tracking before using it:
1. Request user permission to use eye tracking in your app.
2. Enable the "Gaze Input" capability in your package manifest.

### Requesting access to eye-gaze input

When your app is starting up, call [EyesPose::RequestAccessAsync](/uwp/api/windows.perception.people.eyespose.requestaccessasync#Windows_Perception_People_EyesPose_RequestAccessAsync) to request access to eye tracking. The system will prompt the user if needed, and return [GazeInputAccessStatus::Allowed](/uwp/api/windows.ui.input.gazeinputaccessstatus) once access has been granted. This is an asynchronous call, so it requires a bit of extra management. The following example spins up a detached std::thread to wait for the result, which it stores to a member variable called *m_isEyeTrackingEnabled*.

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
Starting a detached thread is just one option for handling async calls. 
You could also use the new [co_await](/windows/uwp/cpp-and-winrt-apis/concurrency) functionality supported by C++/WinRT.
Here's another example for asking for user permission:
-	EyesPose::IsSupported() allows the application to trigger the permission dialog only if there's an eye tracker.
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

Double-click the appxmanifest file in *Solution Explorer*.  Then navigate to the *Capabilities* section and check the *Gaze Input* capability. 

![Gaze input capability](images/gaze-input-capability.png)

This adds the following lines to the *Package* section in the appxmanifest file:
```xml
  <Capabilities>
    <DeviceCapability Name="gazeInput" />
  </Capabilities>
```

### Getting the eye-gaze ray

Once you have received access to ET, you're free to grab the eye-gaze ray every frame.
As with head-gaze, get the [SpatialPointerPose](/uwp/api/Windows.UI.Input.Spatial.SpatialPointerPose) by calling [SpatialPointerPose::TryGetAtTimestamp](/uwp/api/windows.ui.input.spatial.spatialpointerpose.trygetattimestamp) with a desired timestamp and coordinate system. The SpatialPointerPose contains an [EyesPose](/uwp/api/windows.perception.people.eyespose) object through the [Eyes](/uwp/api/windows.ui.input.spatial.spatialpointerpose.eyes) property. This is non-null only if eye tracking is enabled. From there, you can check if the user in the device has an eye tracking calibration by calling [EyesPose::IsCalibrationValid](/uwp/api/windows.perception.people.eyespose.iscalibrationvalid#Windows_Perception_People_EyesPose_IsCalibrationValid).  Next, use the [Gaze](/uwp/api/windows.perception.people.eyespose.gaze#Windows_Perception_People_EyesPose_Gaze) property to get the [SpatialRay](/uwp/api/windows.perception.spatial.spatialray) containing the eye-gaze position and direction. The Gaze property can sometimes be null, so be sure to check for this. This can happen is if a calibrated user temporarily closes their eyes.

The following code shows how to access the eye-gaze ray.

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
			
			// Do something with the eye-gaze
		}
	}
}

```

## Fallback when eye tracking isn't available

As mentioned in our [eye tracking design docs](../../design/eye-tracking.md#fallback-solutions-when-eye-tracking-isnt-available), both designers and developers should be aware of instances where eye tracking data may not be available.

There are various reasons for data being unavailable:
* A user not being calibrated
* A user has denied the app access to his/her eye tracking data
* Temporary interferences, such as smudges on the HoloLens visor or hair occluding the user's eyes. 

While some of the APIs have already been mentioned in this document, in the following, we provide a summary of how to detect that eye tracking is available as a quick reference: 

* Check that the system supports eye tracking at all. Call the following *method*: [Windows.Perception.People.EyesPose.IsSupported()](/uwp/api/windows.perception.people.eyespose.issupported#Windows_Perception_People_EyesPose_IsSupported)

* Check that the user is calibrated. Call the following *property*: [Windows.Perception.People.EyesPose.IsCalibrationValid](/uwp/api/windows.perception.people.eyespose.iscalibrationvalid#Windows_Perception_People_EyesPose_IsCalibrationValid)	

* Check that the user has given your app permission to use their eye tracking data: Retrieve the current _'GazeInputAccessStatus'_. An example on how to do this is explained at [Requesting access to gaze input](/windows/mixed-reality/gaze-in-directX#requesting-access-to-gaze-input).	

You may also want to check that your eye tracking data isn't stale by adding a timeout between received eye tracking data updates and otherwise fallback to head-gaze as discussed below. 	
Visit our [fallback design considerations](../../design/eye-tracking.md#fallback-solutions-when-eye-tracking-isnt-available) for more information.

<br>

## Correlating gaze with other inputs

Sometimes you may find that you need a [SpatialPointerPose](/uwp/api/windows.ui.input.spatial.spatialpointerpose) that corresponds with an event in the past. 
For example, if the user does an Air Tap, your app might want to know what they were looking at. 
For this purpose, simply using [SpatialPointerPose::TryGetAtTimestamp](/uwp/api/windows.ui.input.spatial.spatialpointerpose.trygetattimestamp) with the predicted frame time would be inaccurate because of the latency between system input processing and display time. 
Also, if using eye-gaze for targeting, our eyes tend to move on even before finishing a commit action. 
This is less of an issue for a simple Air Tap, but becomes more critical when combining long voice commands with fast eye movements. 
One way to handle this scenario is to make an additional call to  [SpatialPointerPose::TryGetAtTimestamp](/uwp/api/windows.ui.input.spatial.spatialpointerpose.trygetattimestamp), using a historical timestamp that corresponds to the input event.  

However, for input that routes through the SpatialInteractionManager, there's an easier method. The [SpatialInteractionSourceState](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate) has its own [TryGetAtTimestamp](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.trygetpointerpose) function. Calling that will provide a perfectly correlated [SpatialPointerPose](/uwp/api/windows.ui.input.spatial.spatialpointerpose) without the guesswork. For more information on working with SpatialInteractionSourceStates, take a look at the [Hands and Motion Controllers in DirectX](hands-and-motion-controllers-in-directx.md) documentation.

<br>

## Calibration

For eye tracking to work accurately, each user is required to go through an [eye tracking user calibration](/hololens/hololens-calibration). 
This allows the device to adjust the system for a more comfortable and higher quality viewing experience for the user and to ensure accurate eye tracking at the same time. 
Developers don’t need to do anything on their end to manage user calibration. 
The system will ensure that the user gets prompted to calibrate the device under the following circumstances:
* The user is using the device for the first time
* The user previously opted out of the calibration process
* The calibration process didn't succeed the last time the user used the device

Developers should make sure to provide adequate support for users where eye tracking data may not be available. 
Learn more about considerations for fallback solutions at [Eye tracking on HoloLens 2](../../design/eye-tracking.md).

<br>

## See also

* [Calibration](/hololens/hololens-calibration)
* [Coordinate systems in DirectX](coordinate-systems-in-directx.md)
* [Eye-gaze on HoloLens 2](../../design/eye-tracking.md)
* [Gaze and commit input model](../../design/gaze-and-commit.md)
* [Hands and motion controllers in DirectX](hands-and-motion-controllers-in-directx.md)
* [Voice Input in DirectX](voice-input-in-directx.md)
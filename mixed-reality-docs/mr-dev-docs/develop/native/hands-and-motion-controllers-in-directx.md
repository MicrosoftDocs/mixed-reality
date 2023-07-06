---
title: Hands and motion controllers in DirectX
description: Get started with the developer guide for using hand tracking and motion controllers in native DirectX apps.
author: caseymeekhof
ms.author: cmeekhof
ms.date: 08/04/2020
ms.topic: article
keywords: hands, motion controllers, directx, input, holograms, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Hands and motion controllers in DirectX

> [!NOTE]
> This article relates to the legacy WinRT native APIs.  For new native app projects, we recommend using the **[OpenXR API](openxr-getting-started.md)**.

In Windows Mixed Reality, both hand and [motion controller](../../design/motion-controllers.md) input is handled through the spatial input APIs, found in the [Windows.UI.Input.Spatial](/uwp/api/windows.ui.input.spatial) namespace. This enables you to easily handle common actions like **Select** presses the same way across both hands and motion controllers.

## Getting started

To access spatial input in Windows Mixed Reality, start with the SpatialInteractionManager interface.  You can access this interface by calling  [SpatialInteractionManager::GetForCurrentView](/uwp/api/windows.ui.input.spatial.spatialinteractionmanager.getforcurrentview), typically sometime during app startup.

```cpp
using namespace winrt::Windows::UI::Input::Spatial;

SpatialInteractionManager interactionManager = SpatialInteractionManager::GetForCurrentView();
```

The SpatialInteractionManager's job is to provide access to [SpatialInteractionSources](/uwp/api/windows.ui.input.spatial.spatialinteractionsource), which represent a source of input.  There are three kinds of SpatialInteractionSources available in the system.
* **Hand** represents a user's detected hand. Hand sources offer different features based on the device, ranging from basic gestures on HoloLens to fully articulated hand tracking on HoloLens 2. 
* **Controller** represents a paired motion controller. Motion controllers can offer different capabilities, for example, Select triggers, Menu buttons, Grasp buttons, touchpads, and thumbsticks.
* **Voice** represents the user's voice speaking system-detected keywords. For example, this source will inject a Select press and release whenever the user says "Select".

Per-frame data for a source is represented by the  [SpatialInteractionSourceState](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate) interface. There are two different ways to access this data, depending on whether you want to use an event-driven or polling-based model in your application.

### Event-driven input
The SpatialInteractionManager provides a number of events that your app can listen for.  A few examples include   [SourcePressed](/uwp/api/windows.ui.input.spatial.spatialinteractionmanager.sourcepressed), [SourceReleased, and [SourceUpdated](/uwp/api/windows.ui.input.spatial.spatialinteractionmanager.sourceupdated).

For example, the following code hooks up an event handler called MyApp::OnSourcePressed to the SourcePressed event.  This allows your app to detect presses on any type of interaction source.

```cpp
using namespace winrt::Windows::UI::Input::Spatial;

auto interactionManager = SpatialInteractionManager::GetForCurrentView();
interactionManager.SourcePressed({ this, &MyApp::OnSourcePressed });

```

This pressed event is sent to your app asynchronously, along with the corresponding SpatialInteractionSourceState at the time the press happened. Your app or game engine may want to start processing right away or queue up the event data in your input processing routine. Here's an event handler function for the SourcePressed event, which checks whether the select button has been pressed.

```cpp
using namespace winrt::Windows::UI::Input::Spatial;

void MyApp::OnSourcePressed(SpatialInteractionManager const& sender, SpatialInteractionSourceEventArgs const& args)
{
	if (args.PressKind() == SpatialInteractionPressKind::Select)
	{
		// Select button was pressed, update app state
	}
}
```

The above code only checks for the 'Select' press, which corresponds to the primary action on the device. Examples include doing an AirTap on HoloLens or pulling the trigger on a motion controller.  'Select' presses represent the user's intention to activate the hologram they're targeting.  The SourcePressed event will fire for a number of different buttons and gestures, and you can inspect other properties on the SpatialInteractionSource to test for those cases.

### Polling-based input
You can also use SpatialInteractionManager to poll for the current state of input every frame.  To do this, call [GetDetectedSourcesAtTimestamp](/uwp/api/windows.ui.input.spatial.spatialinteractionmanager.getdetectedsourcesattimestamp) every frame.  This function returns an array containing one [SpatialInteractionSourceState](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate) for every active [SpatialInteractionSource](/uwp/api/windows.ui.input.spatial.spatialinteractionsource). This means one for each active motion controller, one for each tracked hand, and one for speech if a 'select' command was recently uttered. You can then inspect the properties on each SpatialInteractionSourceState to drive input into your application. 

Here's an example of how to check for the 'select' action using the polling method. The *prediction* variable represents a [HolographicFramePrediction](/uwp/api/Windows.Graphics.Holographic.HolographicFramePrediction) object, which can be obtained from the [HolographicFrame](/uwp/api/windows.graphics.holographic.holographicframe).

```cpp
using namespace winrt::Windows::UI::Input::Spatial;

auto interactionManager = SpatialInteractionManager::GetForCurrentView();
auto sourceStates = m_spatialInteractionManager.GetDetectedSourcesAtTimestamp(prediction.Timestamp());

for (auto& sourceState : sourceStates)
{
	if (sourceState.IsSelectPressed())
	{
		// Select button is down, update app state
	}
}
```

Each SpatialInteractionSource has an ID, which you can use to identify new sources and correlate existing sources from frame to frame.  Hands get a new ID every time they leave and enter the FOV, but controller IDs remain static for the duration of the session.  You can use the events on SpatialInteractionManager such as [SourceDetected](/uwp/api/windows.ui.input.spatial.spatialinteractionmanager.sourcedetected) and [SourceLost](/uwp/api/windows.ui.input.spatial.spatialinteractionmanager.sourcelost), to react when hands enter or leave the device's view, or when motion controllers are turned on/off or are paired/unpaired.

### Predicted vs. historical poses
GetDetectedSourcesAtTimestamp has a timestamp parameter. This enables you to request state and pose data that is either predicted or historical, letting you correlate spatial interactions with other sources of input. For example, when rendering the hand's position in the current frame, you can pass in the predicted timestamp provided by the [HolographicFrame](/uwp/api/windows.graphics.holographic.holographicframe). This enables the system to forward-predict the hand position to closely align with the rendered frame output, minimizing perceived latency.

However, such a predicted pose doesn't produce an ideal pointing ray for targeting with an interaction source. For example, when a motion controller button is pressed, it can take up to 20 ms for that event to bubble up through Bluetooth to the operating system. Similarly, after a user does a hand gesture, some amount of time may pass before the system detects the gesture and your app then polls for it. By the time your app polls for a state change, the head and hand poses used to target that interaction actually happened in the past. If you target by passing your current HolographicFrame's timestamp to GetDetectedSourcesAtTimestamp, the pose will instead be forward predicted to the targeting ray at the time the frame will be displayed, which could be more than 20 ms in the future. This future pose is good for *rendering* the interaction source, but compounds our time problem for *targeting* the interaction, as the user's targeting occurred in the past.

Fortunately, the [SourcePressed](/uwp/api/windows.ui.input.spatial.spatialinteractionmanager.sourcepressed), [SourceReleased, and [SourceUpdated](/uwp/api/windows.ui.input.spatial.spatialinteractionmanager.sourceupdated) events provide the historical [State](/uwp/api/windows.ui.input.spatial.spatialinteractionsourceeventargs.state) associated with each input event.  This directly includes the historical head and hand poses available through [TryGetPointerPose](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.trygetpointerpose), along with a historical [Timestamp](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.timestamp) that you can pass to other APIs to correlate with this event.

That leads to the following best practices when rendering and targeting with hands and controllers each frame:
* For **hand/controller rendering** each frame, your app should **poll** for the **forward-predicted** pose of each interaction source at the current frame’s photon time.  You can poll for all interaction sources by calling [GetDetectedSourcesAtTimestamp](/uwp/api/windows.ui.input.spatial.spatialinteractionmanager.getdetectedsourcesattimestamp) each frame, passing in the predicted timestamp provided by [HolographicFrame::CurrentPrediction](/uwp/api/windows.graphics.holographic.holographicframe.currentprediction).
* For **hand/controller targeting** upon a press or release, your app should handle pressed/released **events**, raycasting based on the **historical** head or hand pose for that event. You get this targeting ray by handling the [SourcePressed](/uwp/api/windows.ui.input.spatial.spatialinteractionmanager.sourcepressed) or [SourceReleased](/uwp/api/windows.ui.input.spatial.spatialinteractionmanager.sourcereleased) event, getting the [State](/uwp/api/windows.ui.input.spatial.spatialinteractionsourceeventargs.state) property from the event arguments, and then calling its [TryGetPointerPose](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.trygetpointerpose) method.

## Cross-device input properties
The SpatialInteractionSource API supports controllers and hand tracking systems with a wide range of capabilities. A number of these capabilities are common between device types. For example, hand tracking and motion controllers both provide a 'select' action and a 3D position. Wherever possible, the API maps these common capabilities to the same properties on the SpatialInteractionSource.  This enables applications to more easily support a wide range of input types. The following table describes the properties that are supported, and how they compare across input types.

| Property | Description | HoloLens(1st gen) Gestures | Motion Controllers | Articulated Hands|
|--- |--- |--- |--- |--- |
| [SpatialInteractionSource::**Handedness**](/uwp/api/windows.ui.input.spatial.spatialinteractionsource.handedness) | Right or left hand / controller. | Not Supported | Supported | Supported |
| [SpatialInteractionSourceState::**IsSelectPressed**](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.isselectpressed) | Current state of the primary button. | Air Tap | Trigger | Relaxed Air Tap (upright pinch) |
| [SpatialInteractionSourceState::**IsGrasped**](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.isgrasped) | Current state of the grab button. | Not Supported | Grab button | Pinch or Closed Hand |
| [SpatialInteractionSourceState::**IsMenuPressed**](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.ismenupressed) | Current state of the menu button.    | Not Supported | Menu Button | Not Supported |
| [SpatialInteractionSourceLocation::**Position**](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcelocation.position) | XYZ location of the hand or grip position on the controller. | Palm location | Grip pose position | Palm location |
| [SpatialInteractionSourceLocation::**Orientation**](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcelocation.orientation) | Quaternion representing the orientation of the hand or grip pose on the controller. | Not Supported | Grip pose orientation | Palm orientation |
| [SpatialPointerInteractionSourcePose::**Position**](/uwp/api/windows.ui.input.spatial.spatialpointerinteractionsourcepose.position#Windows_UI_Input_Spatial_SpatialPointerInteractionSourcePose_Position) | Origin of the pointing ray. | Not Supported | Supported | Supported |
| [SpatialPointerInteractionSourcePose::**ForwardDirection**](/uwp/api/windows.ui.input.spatial.spatialpointerinteractionsourcepose.forwarddirection#Windows_UI_Input_Spatial_SpatialPointerInteractionSourcePose_ForwardDirection) | Direction of the pointing ray. | Not Supported | Supported | Supported |

Some of the above properties aren't available on all devices, and the API provides a means to test for this. For example, you can inspect the [SpatialInteractionSource::IsGraspSupported](/uwp/api/windows.ui.input.spatial.spatialinteractionsource.isgraspsupported) property to determine whether the source provides a grasp action.

### Grip pose vs. pointing pose

Windows Mixed Reality supports motion controllers in different form factors.  It also supports articulated hand tracking systems.  All of these systems have different relationships between the hand position and the natural "forward" direction that apps should use for pointing or rendering objects in the user's hand.  To support all of this, there are two types of 3D poses provided for both hand tracking and motion controllers.  The first is grip pose, which represents the user's hand position.  The second is pointing pose, which represents a pointing ray originating from the user's hand or controller. So, if you want to render **the user's hand** or **an object held in the user's hand**, such as a sword or gun, use the grip pose. If you want to raycast from the controller or hand, for example when the user is **pointing at UI, use the pointing pose.

You can access the **grip pose** through [SpatialInteractionSourceState::Properties::TryGetLocation(...)](/uwp/api/windows.ui.input.spatial.spatialinteractionsourceproperties.trygetlocation#Windows_UI_Input_Spatial_SpatialInteractionSourceProperties_TryGetLocation_Windows_Perception_Spatial_SpatialCoordinateSystem_). It's defined as follows:
* The **grip position**: The palm centroid when holding the controller naturally, adjusted left or right to center the position within the grip.
* The **grip orientation's Right axis**: When you completely open your hand to form a flat 5-finger pose, the ray that is normal to your palm (forward from left palm, backward from right palm)
* The **grip orientation's Forward axis**: When you close your hand partially (as if holding the controller), the ray that points "forward" through the tube formed by your non-thumb fingers.
* The **grip orientation's Up axis**: The Up axis implied by the Right and Forward definitions.

You can access the **pointer pose** through [SpatialInteractionSourceState::Properties::TryGetLocation(...)::SourcePointerPose](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcelocation#Windows_UI_Input_Spatial_SpatialInteractionSourceLocation_SourcePointerPose) or [SpatialInteractionSourceState::TryGetPointerPose(...)::TryGetInteractionSourcePose](/uwp/api/windows.ui.input.spatial.spatialpointerpose#Windows_UI_Input_Spatial_SpatialPointerPose_TryGetInteractionSourcePose_Windows_UI_Input_Spatial_SpatialInteractionSource_).

## Controller-specific input properties
For controllers, the SpatialInteractionSource has a Controller property with additional capabilities.
* **HasThumbstick:** If true, the controller has a thumbstick. Inspect the [ControllerProperties](/uwp/api/windows.ui.input.spatial.spatialinteractioncontrollerproperties) property of the SpatialInteractionSourceState to acquire the thumbstick x and y values (ThumbstickX and ThumbstickY), as well as its pressed state (IsThumbstickPressed).
* **HasTouchpad:** If true, the controller has a touchpad. Inspect the ControllerProperties property of the SpatialInteractionSourceState to acquire the touchpad x and y values (TouchpadX and TouchpadY), and to know if the user is touching the pad (IsTouchpadTouched) and if they're pressing the touchpad down (IsTouchpadPressed).
* **SimpleHapticsController:** The SimpleHapticsController API for the controller allows you to inspect the haptics capabilities of the controller, and it also allows you to control haptic feedback.

The range for touchpad and thumbstick is -1 to 1 for both axes (from bottom to top, and from left to right). The range for the analog trigger, which is accessed using the SpatialInteractionSourceState::SelectPressedValue property, has a range of 0 to 1. A value of 1 correlates with IsSelectPressed being equal to true; any other value correlates with IsSelectPressed being equal to false.

## Articulated hand tracking
The Windows Mixed Reality API provides full support for articulated hand tracking, for example on HoloLens 2. Articulated hand tracking can be used to implement direct manipulation and point-and-commit input models in your applications. It can also be used to author fully custom interactions.

### Hand skeleton
Articulated hand tracking provides a 25 joint skeleton that enables many different types of interactions.  The skeleton provides five joints for the index/middle/ring/little fingers, four joints for the thumb, and one wrist joint.  The wrist joint serves as the base of the hierarchy. The following picture illustrates the layout of the skeleton.

![Hand Skeleton](images/hand-skeleton.png)

In most cases, each joint is named based on the bone that it represents.  Since there are two bones at every joint, we use a convention of naming each joint based on the child bone at that location.  The child bone is defined as the bone further from the wrist.  For example, the "Index Proximal" joint contains the beginning position of the index proximal bone, and the orientation of that bone.  It doesn't contain the ending position of the bone.  If you need that, you'd get it from the next joint in the hierarchy, the "Index Intermediate" joint.

In addition to the 25 hierarchical joints, the system provides a palm joint.  The palm isn't typically considered part of the skeletal structure. It's provided only as a convenient way to get the hand's overall position and orientation.

The following information is provided for each joint:

| Name | Description |
|--- |--- |
|Position | 3D position of the joint, available in any requested coordinate system. |
|Orientation | 3D orientation of the bone, available in any requested coordinate system. |
|Radius | Distance to surface of the skin at the joint position. Useful for tuning direct interactions or visualizations that rely on finger width. |
|Accuracy | Provides a hint on how confident the system feels about this joint's information. |

You can access the hand skeleton data through a function on the [SpatialInteractionSourceState](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate).  The function is called [TryGetHandPose](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate.trygethandpose#Windows_UI_Input_Spatial_SpatialInteractionSourceState_TryGetHandPose), and it returns an object called [HandPose](/uwp/api/windows.perception.people.handpose).  If the source doesn't support articulated hands, then this function will return null.  Once you have a HandPose, you can get current joint data by calling [TryGetJoint](/uwp/api/windows.perception.people.handpose.trygetjoint#Windows_Perception_People_HandPose_TryGetJoint_Windows_Perception_Spatial_SpatialCoordinateSystem_Windows_Perception_People_HandJointKind_Windows_Perception_People_JointPose__), with the name of the joint you're interested in.  The data is returned as a [JointPose](/uwp/api/windows.perception.people.jointpose) structure.  The following code gets the position of the index finger tip. The variable *currentState* represents an instance of [SpatialInteractionSourceState](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate).

```cpp
using namespace winrt::Windows::Perception::People;
using namespace winrt::Windows::Foundation::Numerics;

auto handPose = currentState.TryGetHandPose();
if (handPose)
{
	JointPose joint;
	if (handPose.TryGetJoint(desiredCoordinateSystem, HandJointKind::IndexTip, joint))
	{
		float3 indexTipPosition = joint.Position;

		// Do something with the index tip position
	}
}
```

### Hand mesh

The articulated hand tracking API allows for a fully deformable triangle hand mesh.  This mesh can deform in real time along with the hand skeleton, and is useful for visualization and advanced physics techniques.  To access the hand mesh, you need to first create a [HandMeshObserver](/uwp/api/windows.perception.people.handmeshobserver) object by calling [TryCreateHandMeshObserverAsync](/uwp/api/windows.ui.input.spatial.spatialinteractionsource.trycreatehandmeshobserverasync) on the [SpatialInteractionSource](/uwp/api/windows.ui.input.spatial.spatialinteractionsource).  This only needs to be done once per source, typically the first time you see it.  That means you'll call this function to create a HandMeshObserver object whenever a hand enters the FOV.  This is an async function, so you'll have to deal with a bit of concurrency here.  Once available, you can ask the HandMeshObserver object for the triangle index buffer by calling [GetTriangleIndices](/uwp/api/windows.perception.people.handmeshobserver.gettriangleindices#Windows_Perception_People_HandMeshObserver_GetTriangleIndices_System_UInt16___).  Indices don't change frame over frame, so you can get those once and cache them for the lifetime of the source.  Indices are provided in clockwise winding order.

The following code spins up a detached std::thread to create the mesh observer and extracts the index buffer once the mesh observer is available.  It starts from a variable called *currentState*, which is an instance of [SpatialInteractionSourceState](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate) representing a tracked hand.

```cpp
using namespace Windows::Perception::People;

std::thread createObserverThread([this, currentState]()
{
    HandMeshObserver newHandMeshObserver = currentState.Source().TryCreateHandMeshObserverAsync().get();
    if (newHandMeshObserver)
    {
		unsigned indexCount = newHandMeshObserver.TriangleIndexCount();
		vector<unsigned short> indices(indexCount);
		newHandMeshObserver.GetTriangleIndices(indices);

        // Save the indices and handMeshObserver for later use - and use a mutex to synchronize access if needed!
     }
});
createObserverThread.detach();
```
Starting a detached thread is just one option for handling async calls.  Alternatively, you could use the new [co_await](/windows/uwp/cpp-and-winrt-apis/concurrency) functionality supported by C++/WinRT.

Once you have a HandMeshObserver object, you should hold onto it for the duration that its corresponding SpatialInteractionSource is active.  Then each frame, you can ask it for the latest vertex buffer that represents the hand by calling [GetVertexStateForPose](/uwp/api/windows.perception.people.handmeshobserver.getvertexstateforpose) and passing in a [HandPose](/uwp/api/windows.perception.people.handpose) instance that represents the pose that you want vertices for.  Each vertex in the buffer has a position and a normal.  Here's an example of how to get the current set of vertices for a hand mesh.  As before, the *currentState* variable represents an instance of [SpatialInteractionSourceState](/uwp/api/windows.ui.input.spatial.spatialinteractionsourcestate).

```cpp
using namespace winrt::Windows::Perception::People;

auto handPose = currentState.TryGetHandPose();
if (handPose)
{
    std::vector<HandMeshVertex> vertices(handMeshObserver.VertexCount());
    auto vertexState = handMeshObserver.GetVertexStateForPose(handPose);
    vertexState.GetVertices(vertices);

    auto meshTransform = vertexState.CoordinateSystem().TryGetTransformTo(desiredCoordinateSystem);
    if (meshTransform != nullptr)
    {
    	// Do something with the vertices and mesh transform, along with the indices that you saved earlier
    }
}
```

In contrast to skeleton joints, the hand mesh API doesn't allow you to specify a coordinate system for the vertices.  Instead, the [HandMeshVertexState](/uwp/api/windows.perception.people.handmeshvertexstate) specifies the coordinate system that the vertices are provided in.  You can then get a mesh transform by calling [TryGetTransformTo](/uwp/api/windows.perception.spatial.spatialcoordinatesystem.trygettransformto#Windows_Perception_Spatial_SpatialCoordinateSystem_TryGetTransformTo_Windows_Perception_Spatial_SpatialCoordinateSystem_) and specifying the coordinate system you want.  You'll need to use this mesh transform whenever you work with the vertices.  This approach reduces CPU overhead, especially if you're only using the mesh for rendering purposes.

## Gaze and Commit composite gestures
For applications using the gaze-and-commit input model, particularly on HoloLens (first gen), the Spatial Input API provides an optional 
 [SpatialGestureRecognizer](/uwp/api/Windows.UI.Input.Spatial.SpatialGestureRecognizer) that can be used to enable composite gestures built on top of the 'select' event.  By routing interactions from the SpatialInteractionManager to a hologram's SpatialGestureRecognizer, apps can detect Tap, Hold, Manipulation, and Navigation events uniformly across hands, voice, and spatial input devices, without having to handle presses and releases manually.

SpatialGestureRecognizer does only the minimal disambiguation between the set of gestures that you request. For example, if you request just Tap, the user may hold their finger down as long as they like and a Tap will still occur. If you request both Tap and Hold, after about a second of holding down their finger the gesture will promote to a Hold and a Tap will no longer occur.

To use SpatialGestureRecognizer, handle the SpatialInteractionManager's [InteractionDetected](/uwp/api/Windows.UI.Input.Spatial.SpatialInteractionManager) event and grab the SpatialPointerPose exposed there. Use the user's head gaze ray from this pose to intersect with the holograms and surface meshes in the user's surroundings to determine what the user is intending to interact with. Then, route the SpatialInteraction in the event arguments to the target hologram's SpatialGestureRecognizer, using its [CaptureInteraction](/uwp/api/Windows.UI.Input.Spatial.SpatialGestureRecognizer) method. This starts interpreting that interaction according to the [SpatialGestureSettings](/uwp/api/Windows.UI.Input.Spatial.SpatialGestureSettings) set on that recognizer at creation time - or by [TrySetGestureSettings](/uwp/api/Windows.UI.Input.Spatial.SpatialGestureRecognizer).

On HoloLens (first gen), interactions and gestures should derive their targeting from the user's head gaze, rather than rendering or interacting at the hand's location. Once an interaction has started, relative motions of the hand may be used to control the gesture, as with the Manipulation or Navigation gesture.

## See also
* [Head and eye gaze in DirectX](gaze-in-directx.md)
* [Direct manipulation input model](../../design/direct-manipulation.md)
* [Point-and-commit input model](../../design/point-and-commit.md)
* [Gaze and commit input model](../../design/gaze-and-commit.md)
* [Motion controllers](../../design/motion-controllers.md)
---
title: Hand tracking | MRTK3
description: Hand tracking in MRTK3
author: MaxWang-MS
ms.author: wangmax
ms.date: 6/7/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, data binding, theme, theming, Mixed Reality Toolkit, hand tracking
---

# Hand tracking | MRTK3

## Overview

Articulated hand joint data is one of the only pieces of input data that's not yet handled natively by the Unity Input System--it's handled by our subsystems.

> [!NOTE]
> If you're unfamiliar with MRTK3 subsystems and their differences from MRTK 2.x services, see the [MRTK3 Subsystems architecture](../../../mrtk3-overview/architecture/subsystems.md) documentation for a deep dive into our philosophy and design.

Our subsystems ingest hand joint data from several sources and aggregate them into a central API that works across devices and simulation contexts. The subsystems below are implementations of  `HandsSubsystem`:

- `OpenXRHandsSubsystem` receives hand data directly from the OpenXR plugin.
- `XRSDKHandsSubsystem` receives hand data from Unity's XR SDK abstraction layer (which, in turn, may be sourcing its data from OpenXR, or some other source).
- `SyntheticHandsSubsystem` synthesizes fake hand joints based on the input actions coming from the system (such as `devicePosition`, `deviceRotation`, etc). This subsystem provides the joints you see when using input simulation in-editor.

These subsystems are queried by `HandsAggregatorSubsystem`, which combines all of the sources of hand data into a central API.

> [!IMPORTANT]
> Whenever you query directly for hand joint data, always query from the Aggregator, not from any of the individual hand subsystems. This way, your code will work for any source of hand data, including simulated data.

The aggregator and the hands subsystems lazily evaluate incoming hand data requests. Hand data won't be queried until a "client" script requests it. If the app only requests an individual joint, the hands subsystems will lazily evaluate and only query a single joint from the underlying APIs. In addition, if a "client" requests a full hand's worth of joint data, subsequent calls within the same frame will reuse the same data, reducing the cost of querying many joints within the same frame. On each new frame, the cache will be dirtied and flushed, and subsequent calls will begin refilling the cache.

As a result, when profiling your application, you may see the first joint query in a frame take more time than subsequent queries. This is due to the amortized cost associated with the first query, and the relative performance of subsequent "cache hits".

## Pinch characteristics

The Aggregator computes several measurements regarding the pinching gesture based on the joint data it queries from each specific hands subsystem. These measurements are configured in the Aggregator subsystem configuration.

![Hands Aggregator subsystem configuration](../../../mrtk3-overview/architecture/images/configuration.png)

The <b>Pinch Open Threshold</b> and <b>Pinch Closed Threshold</b> control the absolute world distance between the thumb and forefinger that's used to normalize the pinch progress. When the distance equals the closed threshold, the pinch progress will be 1.0, and when the distance equals the open threshold, it will be 0.0. (These thresholds are currently in world units, but will soon be normalized to the user's hand size.)<br><br>The <b>Hand Raise Camera FOV</b> controls how close to the center of the user's view the hand must be to be considered valid for pinching. <b>Hand Facing Away Tolerance</b> controls the tolerance for measuring the user's hand rotation; it determines when the user's hand is facing away.

## Examples

```C#
// Get a reference to the aggregator.
var aggregator = XRSubsystemHelpers.GetFirstRunningSubsystem<HandsAggregatorSubsystem>();
```

```C#
// Wait until an aggregator is available.
IEnumerator EnableWhenSubsystemAvailable()
{
    yield return new WaitUntil(() => XRSubsystemHelpers.GetFirstRunningSubsystem<HandsAggregatorSubsystem>() != null);
    GoAhead();
}
```

```C#
// Get a single joint (Index tip, on left hand, for example)
bool jointIsValid = aggregator.TryGetJoint(TrackedHandJoint.IndexTip, XRNode.LeftHand, out HandJointPose jointPose);
```

```C#
// Get an entire hand's worth of joints from the left hand.
bool allJointsAreValid = aggregator.TryGetEntireHand(XRNode.LeftHand, out IReadOnlyList<HandJointPose> joints)
```

```C#
// Check whether the user's left hand is facing away (commonly used to check "aim" intent)
// This is adjustable with the HandFacingAwayTolerance option in the Aggregator configuration.
// "handIsValid" represents whether there was valid hand data in the first place!
bool handIsValid = aggregator.TryGetPalmFacingAway(XRNode.LeftHand, out bool isLeftPalmFacingAway)
```

```C#
// Query pinch characteristics from the left hand.
// pinchAmount is [0,1], normalized to the open/closed thresholds specified in the Aggregator configuration.
// "isReadyToPinch" is adjusted with the HandRaiseCameraFOV and HandFacingAwayTolerance settings in the configuration.
bool handIsValid = aggregator.TryGetPinchProgress(XRNode.LeftHand, out bool isReadyToPinch, out bool isPinching, out float pinchAmount)
```

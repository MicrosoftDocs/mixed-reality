---
title: Tracking-Map Management
description: Use 'App-Exclusive' Tracking Mode to mitigate certain tracking issues.
author: gavinlaz
ms.author: gavinlaz
ms.date: 10/1/2023
ms.topic: article
keywords: tracking, tracking map, mixed reality headset, windows mixed reality headset, virtual reality headset, unity, HoloLens, device tracking, app-exclusive
---


# Tracking-Map Management

## Summary

HoloLens constantly builds an internal representation of the physical environment, called "Device Shared" tracking mode, to maintain hologram stability and positions across sessions. However, environmental changes can cause inaccuracies in tracking over time, which is problematic for applications with high accuracy requirements. To address this concern, a new "App-Exclusive" tracking mode has been introduced with a set of management APIs.

The "App-Exclusive" mode allows applications to run in a fresh environment, free from degradation in tracking accuracy. The mode issues an "app-exclusive session token" for resuming the application's specific map in future sessions.

Notes:

* Two limitations of the "App-Exclusive" mode are that only one such mode can exist at a time, erasing previous data, and the disk storage is limited to one-third of "Device Shared" mode. However, the smaller limit is still sufficient for most applications.

* The target scenario for "App-Exclusive" mode is applications with high accuracy requirements and task-oriented workflows. Examples include precise hologram alignment with real-world objects and 3D model editing without persistence needs.


To use the new tracking mode APIs, a Fall 2023 HoloLens OS update is required. Earlier versions don't support the "App-Exclusive" mode.



## Background

As a HoloLens is used, it's constantly building up an internal representation of the physical environment around the device.  This enables it to properly keep holograms stable in their 3D positions and relocate them when the device is used in the same physical location across multiple sessions.  This representation is shared across all applications on a particular HoloLens, and is appropriately called the "Device Shared" tracking mode.

The internal representation of an environment might degrade over time, due to various factors like small changes to the environment (like a chair moving to a new location) or lighting changes.  These changes might introduce inaccuracies to the HoloLens's tracking, which might result in some holograms drifting from their original placement by small amounts.  This movement is often negligible for many applications.  However, for applications that have high accuracy requirements, the degradation over time is problematic.  Previously, the most common workaround was for applications to advise their users to use the "Holograms" tab in the Settings application to "Remove All Holograms", which clears all saved environment data.  This act would reset to a fresh environment, at the cost of erasing all previously created holograms.


## Tracking-Map Management APIs

To alleviate some of the issues that occur as the "Device Shared" tracking map evolves over time, support has been added for an application to manage its environment at a more granular level.  However, this new functionality comes with its own tradeoffs that have to be managed carefully, depending on an application's requirements.



### "App-Exclusive" Tracking Mode

A new set of APIs allows an application to opt into running in an "App-Exclusive" tracking mode (instead of the "Device Shared" default).  This operation creates a brand-new environment for the application to use during the current session, unencumbered by any Device Space tracking inaccuracies as the result of degradation over time.  Switching to this mode is equivalent to using the "Remove All Holograms" command from Settings, but only applicable to the running application.  Holograms for all other applications (including the HoloLens Shell) remain intact and available as before.  Returning to the Shell or activating another application returns the HoloLens to the "Device Shared" tracking mode automatically.

In addition, the "App-Exclusive" tracking mode allows the calling application to request "High Accuracy" tracking fidelity.  This new mode requests that the tracker attempt to track more accurately, at the expense of using more battery power and disk storage.  This new mode is best suited for application scenarios that take place in room-sized areas with high accuracy requirements, like alignment of holograms with real-world objects.

When first entering the "App-Exclusive" tracking mode, the calling application is issued an "app-exclusive session token".  This token can be used to resume tracking the app-specific map in future sessions of the application, like if the user switches away from the application and it's terminated in the background due to system resource constraints.  However, if the device simply goes to sleep or the user briefly interacts with the Shell, the application resumes automatically in the "App-Exclusive" tracking mode once it's reactivated (and all application state remains available).

There are two limitations to be aware of when using the "App-Exclusive" tracking mode:

1.	Only a single "App-Exclusive" tracking map can exist on the HoloLens at one time.  If an application requests a new "App-Exclusive" tracking mode, then any previous "App-Exclusive" tracking data would be erased and all SpatialAnchor objects (and attached holograms) would be lost, even if the data was created by a different application using its own "App-Exclusive" tracking mode.  Therefore, attempting to return to a previous "App-Exclusive" session by specifying an "App-Exclusive Session Token" might result in a return value indicating that the previous session wasn't found.  Applications must be prepared to handle the scenario where a previous "App-Exclusive" tracking map isn't available.

2.	The disk storage available to the App-Exclusive tracking mode is limited to one third of what is available for the "Device Shared" tracking mode, although this limitation is unlikely to be an issue for most users.  When this limit is reached, the HoloLens begins erasing its least valuable tracking data, which eventually results in poorer tracking accuracy.  The smaller limit is still large enough to maintain good accuracy for house-sized environments and is unlikely to be a concern for most application scenarios.

Given these limitations, the target scenario for the "App-Exclusive" tracking mode is for applications with high accuracy requirements that are task oriented, where a task might be interrupted by the user returning the HoloLens Shell or the device going to sleep.  However, once the user's task is complete, nothing about the task (with respect to the 3D environment) needs to be saved and so can be erased.

Examples:
1.	High-accuracy alignment of holograms to a real-world object, using QR codes to bootstrap the scenario.
2.	Editing a 3D model with high-accuracy requirements when no 3D spatial persistence of the model needs to occur after the session ends.
3.	Tracking in places that have a lot of environmental churn (like people moving around), which sometimes results in poorer tracking quality than more static environments.

#### App-Exclusive APIs
Tracking-Map Management APIs are available in [Microsoft.MixedReality.OpenXR.TrackingMapManager](/dotnet/api/microsoft.mixedreality.openxr.trackingmapmanager)

#### App-Exclusive FAQ
* When should an application call EnterNewAppExclusiveTrackingSession()?
    * In order to take effect, an application requesting to enter the "App-Exclusive" tracking mode must be the active, immersive 3D application.  Therefore, these APIs should only be used once the application has started rendering its 3D user interface (and not, for example, when the application first runs).

* Does an application need to call LeaveAppExclusiveTrackingSession()?
    * An application only needs to leave the "App-Exclusive" tracking mode if it would like to perform any actions in the "Device Shared" tracking mode, like persisting a SpatialAnchor for recall in a separate session.  When focus is changed to a different application (like the HoloLens Shell), the HoloLens automatically switches to the appropriate tracking mode.  If the user then returns to the application, the HoloLens automatically transitions back to the "App-Exclusive" tracking mode, as appropriate.  However, if the operating system completely terminated the application's process (due to resource constraints), then the application is relaunched in "Device Shared" tracking mode, and the application would need to detect this (via the CurrentTrackingMapType API) and reenter the desired tracking mode.

* Can an application's environment data created in "App-Exclusive" tracking be accessed by other applications or is it private to the app?
    * In the "Device Shared" tracking mode, all environment data is shared between applications.  However, in the "App-Exclusive" tracking mode, previously-created environment data and holograms are only available to an application that has resumed the "App-Exclusive" tracking mode using an App-Exclusive Session Token (that was previously issued to the application when it originally requested the "App-Exclusive" tracking mode).  This means that unless a different application is given the App-Exclusive Session Token, it would be unable to resume "App-Exclusive" tracking with the same environment data and holograms as the previous application.  Effectively, as long as an application doesn't share its App-Exclusive Session Token, then data would be siloed from all other applications on the device.

* What version of the HoloLens is required to use the new tracking mode APIs?
    * An operating system update is required to use the new tracking map management APIs.  An application should use the "SupportedTrackingMapTypes" flags enumeration to confirm support for the desired tracking mode prior to using those APIs.
    * "App-Exclusive" tracking mode was introduced in the Fall 2023 HoloLens OS update.  On this version and later, the "SupportedTrackingMapTypes" flags enumeration includes the "AppExclusive" value.  Earlier versions don't include this value and calls to any "App-Exclusive" tracking mode APIs throw an exception.
    * On any HoloLens OS version prior to October 2023, "SupportedTrackingMapTypes" only report "DeviceShared" and no other management APIs can be used.

* Are there any special considerations when creating apps using Unity?
    * Applications typically establish some root world coordinate space to connect views, actions, and holograms together.  Applications should use the an unbounded reference space to establish a [world-scale coordinate system](../../design/coordinate-systems.md#building-a-world-scale-experience). This will avoid limited or lost tracking and undesired hologram drift when the user moves far (for example, 5 meters away) from where the app starts or when the app swiches between space maps.

    * To enable unbounded reference space in Unity apps, if not using MRTK3, add the [EyeLevelSceneOrigin](/dotnet/api/microsoft.mixedreality.openxr.eyelevelsceneorigin) component to your scene's XR origin.  By default, MRTK3's default rig already enables unbound reference space on HoloLens 2. If using MRTK3 and not using the default rig, add the [UnboundedTrackingMode](/dotnet/api/mixedreality.toolkit.input.unboundedtrackingmode) component to your scene's XR origin.

## See also

* [Spatial mapping](../../design/spatial-mapping.md)

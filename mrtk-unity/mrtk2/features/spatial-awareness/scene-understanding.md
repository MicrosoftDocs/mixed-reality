---
title: Scene understanding observer
description: describes Scene Understanding in MRTK
author: MaxWang-MS
ms.author: wangmax
ms.date: 05/27/2021
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Scene Understanding
---

# Scene understanding observer &#8212; MRTK2

[Scene Understanding](/windows/mixed-reality/scene-understanding) returns a semantic representation of scene entities as well as their geometric forms on __HoloLens 2__ (HoloLens 1st Gen is not supported).

Some expected use cases of this technology are:
* Place objects on nearest surface of a certain kind (e.g. wall and floor)
* Construct nav-mesh for platform style games
* Provide physics engine friendly geometry as quads
* Accelerate development by avoiding the need to write similar algorithms

Scene Understanding is introduced as an __experimental__ feature in MRTK 2.6. It is integrated into MRTK as a [spatial observer](spatial-awareness-getting-started.md#register-observers) called [`WindowsSceneUnderstandingObserver`](xref:Microsoft.MixedReality.Toolkit.WindowsSceneUnderstanding.Experimental.WindowsSceneUnderstandingObserver?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true). Scene Understanding works both with the Legacy XR pipeline and the XR SDK pipeline (both OpenXR (starting from MRTK 2.7) and Windows XR Plugin). In both cases the `WindowsSceneUnderstandingObserver` is used.

> [!NOTE] 
> Using Scene Understanding in Remoting is only supported in MRTK 2.7.3 and above. Only projects using OpenXR are supported. Projects using the Legacy XR pipeline or Windows XR Plugin are __not__ supported.

## Observer overview

When asked, the [`WindowsSceneUnderstandingObserver`](xref:Microsoft.MixedReality.Toolkit.WindowsSceneUnderstanding.Experimental.WindowsSceneUnderstandingObserver?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) will return [SpatialAwarenessSceneObject](xref:Microsoft.MixedReality.Toolkit.Experimental.SpatialAwareness.SpatialAwarenessSceneObject?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) with attributes useful for the application to understand its surroundings. The observation frequency, returned object type (e.g. wall, floor) and other observer behaviors are dependent on the configuration of the observer via profile. For instance, if the occlusion mask is desired the observer must be configured to generate quads. The observed scene can be saved as serialized file that can be later loaded to recreate the scene in editor play mode.

## Setup

> [!IMPORTANT]
> Scene Understanding is only supported on HoloLens 2 and Unity 2019.4 and higher.

1. Ensure the platform is set to UWP in build settings.
1. Acquire the Scene Understanding package via [Mixed Reality Feature Tool](https://aka.ms/MRFeatureTool).

## Using Scene Understanding

The quickest way to get started with Scene Understanding is to check out the sample scene.

### Scene Understanding sample scene

In Unity, use the Project Explorer to open the scene file in `Examples/Experimental/SceneUnderstanding/Scenes/SceneUnderstandingExample.unity` and press play!

::: moniker range="< mrtkunity-2021-05"
> [!IMPORTANT]
> Only applies to MRTK 2.6.0 - When using the Mixed Reality Feature Tool or otherwise importing via UPM, please import the Demos - SpatialAwareness sample before importing the Experimental - SceneUnderstanding sample due to a dependency issue. Please see [this GitHub issue](https://github.com/microsoft/MixedRealityToolkit-Unity/issues/9431) for more information.

::: moniker-end
The scene demonstrates the following:

* Visualization of observed Scene Objects with in application UI for configuring the observer
* Example `DemoSceneUnderstandingController` script that shows how to change observer settings and listen to relevant events
* Saving scene data to device for offline development
* Loading previously saved scene data (.bytes files) to support in-editor development workflow

> [!IMPORTANT]
> By default the `ShouldLoadFromFile` property of the observer is set to false. In order to see the visualization of a serialized sample room, please refer to the [configuring observer service](#configuring-the-observer-service) section below and set the property to true in the editor.
::: moniker range="< mrtkunity-2021-05"

> [!NOTE] 
> The sample scene is based on the Legacy XR pipeline. If you are using the XR SDK pipeline you should modify the profiles accordingly. The provided Scene Understanding Spatial Awareness System profile (`DemoSceneUnderstandingSystemProfile`) and the Scene Understanding Observer profiles (`DefaultSceneUnderstandingObserverProfile` and `DemoSceneUnderstandingObserverProfile`) works for both pipelines.
::: moniker-end
::: moniker range="= mrtkunity-2021-05"

> [!NOTE] 
> The sample scene logs a `There is no active AsyncCoroutineRunner when an action is posted.` warning under certain circumstance due to the initialization/thread execution order. If you can confirm the `AsyncCoroutineRunner` component is attached to the "Demo Controller" GameObject and the component/GameObject stay enabled/active in the scene (the default case), the warning can be safely ignored. **However, when creating a new scene with Scene Understanding please make sure to create an empty GameObject at root and attach the `AsyncCoroutineRunner` script to it, otherwise Scene Understanding may not function properly.**
::: moniker-end

#### Configuring the observer service

Select the 'MixedRealityToolkit' game object and check the inspector.

![scene understanding location in hierarchy](../images/spatial-awareness/MRTKHierarchy.png)

![MRTK location in inspector](../images/spatial-awareness/MRTKLocation.png)

These options will allow one to configure the `WindowsSceneUnderstandingObserver`.

### Example script

The example script _DemoSceneUnderstandingController.cs_ demonstrates the major concepts in working with the Scene Understanding service.

* Subscribing to Scene Understanding events
* Handling Scene Understanding events
* Configuring the `WindowsSceneUnderstandingObserver` at runtime

The toggles on the panel in the scene change the behavior of scene understanding observer by calling public functions of this sample script.

Turning on *Instantiate Prefabs*, will demonstrate creating objects that size to fit themselves to all [SpatialAwarenessSceneObject](xref:Microsoft.MixedReality.Toolkit.Experimental.SpatialAwareness.SpatialAwarenessSceneObject?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true), gathered neatly under a parent object.

![demo controller options](../images/spatial-awareness/Controller.png)

### Built app notes

Build and deploy to HoloLens in the standard way. Once running, a number of buttons should appear to play with the features.

Note, their are some pit falls in making queries to the observer. Misconfiguration of a fetch request result in your event payload not containing the expected data. For example, if one doesn't request quads, then no occlusion mask textures will be present. Like wise, no world mesh will appear if the observer is not configured to request meshes. The `DemoSceneUnderstandingController` script takes care of some of these dependencies, but not all.

Saved scene files can be accessed through the [device portal](/windows/mixed-reality/using-the-windows-device-portal) at `User Folders/LocalAppData/[APP_NAME]/LocalState/PREFIX_yyyyMMdd_hhmmss.bytes`. These scene files can be used in editor by specifying them in the observer profile found in the inspector.

![Device Portal location of bytes file](../images/spatial-awareness/BytesInDevicePortal.png)

![Serialized scene bytes in observer](../images/spatial-awareness/BytesLocationInObserver.png)

## See Also

* [Scene Understanding Overview](/windows/mixed-reality/scene-understanding)
* [Scene Understanding SDK Overview](/windows/mixed-reality/scene-understanding-sdk)

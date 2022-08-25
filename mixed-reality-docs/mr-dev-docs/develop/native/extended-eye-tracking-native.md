---
title: Extended eye tracking for Native Development
description: Learn about extended eye tracking for native development for HoloLens 2.
author: magdavuko   
ms.author: magdav
ms.date: 08/23/2022
ms.topic: article
keywords: Eye tracking, mixed reality, input, eye-gaze, calibration, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens, MRTK, Mixed Reality Toolkit, intent, actions, API reference
---

# Extended eye tracking for native development

The Extended Eye Tracking SDK, shown as a NuGet package, enables applications to access data and features provided by Eye Trackers that are not necessarily available through the Windows API. This addresses the reality that trackers and drivers can evolve at a faster pace than the Windows API.

All eye-related information provided by a device such as the HoloLens 2 is available through the Extended Eye Tracking SDK, which is meant to be used in conjunction with Windows spatial APIs such as the Windows.Perception.Spatial.SpatialCoordinateSystem class. This allows a smooth update of existing Windows Mixed Reality applications using eye tracking features.

This article covers the ways that you can use the native development path (C# or C++/WinRT) to consume the Extended Eye Tracking SDK and get access to the extended eye tracking data and features. An API reference is also provided.

## Project setup

1. [Create](/windows/mixed-reality/develop/native/creating-a-holographic-directx-project)  a `Holographic DirectX 11 App (Universal Windows)` or `Holographic DirectX 11 App (Universal Windows) (C++/WinRT)` project with Visual Studio 2019 or newer, or open your existing holographic Visual Studio project.
1. Import the [Eye Tracking SDK NuGet package](https://www.nuget.org/packages/Microsoft.MixedReality.EyeTracking) to the project.
    1. In the Visual Studio Solution Explorer, right-click your project -> Manage NuGet Packages...
    1. Make sure the Package source in the top right corner points to nuget.org: https://api.nuget.org/v3/index.json
    1. Click the Browser tab, and then search `Microsoft.MixedReality.EyeTracking`.
    1. Click the Install button to install it.  

        ![Screenshot of the Eye Tracking SDK Nuget package.](images/001-install.png)  

1. Set Gaze Input capability
    1. Double-click the Package.appxmanifest file in Solution Explorer.
    1. Click the **Capabilities** tab, and then check the Gaze Input.
1. Include head file and use namespace.
    * For a C# project:
    ```C#
    using Microsoft.MixedReality.EyeTracking;
    ```
    * For a C++/WinRT project:
    ```C++
    #include <winrt/Microsoft.MixedReality.EyeTracking.h>
    using namespace winrt::Microsoft::MixedReality::EyeTracking;
    ```
1. Implement your logics.
1. Build and deploy:
    1. Change the settings to Release, ARM64 to build your solution.
    2. Deploy to your HoloLens 2 device.

## Steps overview to get the gaze data

Getting the eye gaze data through the Extended Eye Tracking SDK API requires the following steps:
1. Obtain access to the Eye Tracking features from the user.
1. Watch for eye gaze tracker connections and disconnections.
1. Open the eye gaze tracker, and then query its capabilities.
1. Repeatedly read gaze data from the eye gaze tracker.
1. Transfer gaze data to other SpatialCoordinateSystems.

## Get access to the eye tracking features

For either standard or extended eye gaze data through the Extended Eye Tracking SDK, the steps needed are identical to those for gaining access to the eye gaze through the Windows API: the application must request user consent to use the gaze data through the method `EyesPose.RequestAccessAsync()`

```C#
var status = await Windows.Perception.People.EyesPose.RequestAccessAsync();
bool useGaze = (status == Windows.UI.Input.GazeInputAccessStatus.Allowed);
```

```Cpp
auto accessStatus = co_await winrt::Windows::Perception::People::EyesPose::RequestAccessAsync();
bool useGaze = (accessStatus.get() == winrt::Windows::UI::Input::GazeInputAccessStatus::Allowed);
```

## Detect eye gaze tracker

Eye gaze tracker detection is made through the use of the EyeGazeTrackerWatcher class. EyeGazeTrackerAdded and EyeGazeTrackerRemoved events are respectively raised when an eye gaze tracker is detected or disconnected.

The watcher must be explicitly started with the StartAsync() method, which completes asynchronously when trackers that are already connected have been signaled through the EyeGazeTrackerAdded event.

When an eye gaze tracker is detected, an EyeGazeTracker instance is passed to the application in the EyeGazeTrackerAdded event parameters; reciprocally, when a tracker is disconnected, the corresponding EyeGazeTracker instance is passed to the EyeGazeTrackerRemoved event.

```C#
EyeGazeTrackerWatcher watcher = new EyeGazeTrackerWatcher();
watcher.EyeGazeTrackerAdded += _watcher_EyeGazeTrackerAdded;
watcher.EyeGazeTrackerRemoved += _watcher_EyeGazeTrackerRemoved;
await watcher.StartAsync();
...

private async void _watcher_EyeGazeTrackerAdded(object sender, EyeGazeTracker e)
{
    // Implementation is in next section
}

private void _watcher_EyeGazeTrackerRemoved(object sender, EyeGazeTracker e)
{
    ...
}
```

```Cpp
EyeGazeTrackerWatcher watcher;
watcher.EyeGazeTrackerAdded(std::bind(&SampleEyeTrackingNugetClientAppMain::OnEyeGazeTrackerAdded, this, _1, _2));
watcher.EyeGazeTrackerRemoved(std::bind(&SampleEyeTrackingNugetClientAppMain::OnEyeGazeTrackerRemoved, this, _1, _2));
co_await watcher.StartAsync();
...

winrt::Windows::Foundation::IAsyncAction SampleAppMain::OnEyeGazeTrackerAdded(const EyeGazeTrackerWatcher& sender, const EyeGazeTracker& tracker)
{
    // Implementation is in next section
}
void SampleAppMain::OnEyeGazeTrackerRemoved(const EyeGazeTrackerWatcher& sender, const EyeGazeTracker& tracker)
{
    ...
}
```


## Open eye gaze tracker

When receiving an EyeGazeTracker instance, the application must first open it by calling the OpenAsync() method. It can then query for the tracker capabilities if needed. The OpenAsync() method takes a boolean parameter; this indicates if the application needs to access restricted features such as changing the tracker's frame rate or individual gaze vectors. 

Combined gaze is a mandatory feature supported by all eye gaze trackers. Other features, such as access to individual gaze, are optional and might be supported or not depending on the tracker and its driver. For these optional features, the EyeGazeTracker class exposes a property indicating if the feature is supported--for example, AreLeftAndRightGazesSupported for individual gaze information.

All spatial information exposed by a tracker, such as the combined gaze, is published related to a unique point of reference for the tracker, and identified by a **Dynamic Node ID**. This node ID allows the application to obtain a SpatialCoordinateSystem in which the different gazes are expressed. This system can be correlated to the other SpatialCoordinateSystem used by the application using this approach.

```C#
private async void _watcher_EyeGazeTrackerAdded(object sender, EyeGazeTracker e)
{
    try
    {
        // Try to open the tracker with access to restricted features
        await e.OpenAsync(true);

        // If it has succeeded, store it for future use
        _tracker = e;

        // Check support for individual eye gaze
        bool supportsIndividualEyeGaze = _tracker.AreLeftAndRightGazesSupported;

        // Get a spatial locator for the tracker, this will be used to transfer the gaze data to other coordinate systems later
        var trackerNodeId = e.TrackerSpaceLocatorNodeId;
        _trackerLocator = Windows.Perception.Spatial.Preview.SpatialGraphInteropPreview.CreateLocatorForNode(trackerNodeId);
    }
    catch (Exception ex)
    {
        // Unable to open the tracker
    }
}
```

```Cpp
winrt::Windows::Foundation::IAsyncAction SampleEyeTrackingNugetClientAppMain::OnEyeGazeTrackerAdded(const EyeGazeTrackerWatcher&, const EyeGazeTracker& tracker)
{
   auto newTracker = tracker;

   try
   {
        // Try to open the tracker with access to restricted features
        co_await newTracker.OpenAsync(true);

        // If it has succeeded, store it for future use
        m_gazeTracker = newTracker;

        // Check support for individual eye gaze
        const bool supportsIndividualEyeGaze = m_gazeTracker.AreLeftAndRightGazesSupported();

        // Get a spatial locator for the tracker. This will be used to transfer the gaze data to other coordinate systems later
        const auto trackerNodeId = m_gazeTracker.TrackerSpaceLocatorNodeId();
        m_trackerLocator = winrt::Windows::Perception::Spatial::Preview::SpatialGraphInteropPreview::CreateLocatorForNode(trackerNodeId);
   }
   catch (const winrt::hresult_error& e)
   {
       // Unable to open the tracker
   }
}
```

## Set eye gaze tracker frame rate

The EyeGazeTracker.SupportedTargetFrameRates property returns the list of the target frame rate supported by the tracker. In HoloLens 2, we support 30, 60, and 90fps. 

The EyeGazeTracker.SetTargetFrameRate() method sets the target frame rate.

```C#
// This returns a list of supported frame rate: 30, 60, 90 fps in order
var supportedFrameRates = _tracker.SupportedTargetFrameRates;

// Sets the tracker at the highest supported frame rate (90 fps)
var newFrameRate = supportedFrameRates[supportedFrameRates.Count - 1];
_tracker.SetTargetFrameRate(newFrameRate);
uint newFramesPerSecond = newFrameRate.FramesPerSecond;
```

```Cpp
// This returns a list of supported frame rate: 30, 60, 90 fps in order
const auto supportedFrameRates = m_gazeTracker.SupportedTargetFrameRates();

// Sets the tracker at the highest supported frame rate (90 fps)
const auto newFrameRate = supportedFrameRates.GetAt(supportedFrameRates.Size() - 1);
m_gazeTracker.SetTargetFrameRate(newFrameRate);
const uint32_t newFramesPerSecond = newFrameRate.FramesPerSecond();
```


## Read gaze data from the eye gaze tracker

An eye gaze tracker publishes its states periodically in a circular buffer. This enables the application to read the state of the tracker at a time belonging to a small time span. It allows, for example, the retrieval of the most recent state of the tracker, or its state at the time of some event such as a hand gesture from the user.

Methods that retrieve the tracker state as an EyeGazeTrackerReading instance:

* The TryGetReadingAtTimestamp() and TryGetReadingAtSystemRelativeTime() methods return the EyeGazeTrackerReading closest to the time passed by the application. As the tracker controls the publishing schedule, the returned reading might be slightly older or newer than the request time. EyeGazeTrackerReading's Timestamp and SystemRelativeTime properties enable the application to know the exact time of the published state.

* The TryGetReadingAfterTimestamp() and TryGetReadingAfterSystemRelativeTime() methods return the first EyeGazeTrackerReading with a timestamp strictly superior to the time passed as a parameter. This enables an application to sequentially read all the states published by the tracker. Note that all these methods are querying the existing buffer and that they return immediately. If no state is available, they'll  return null (in other words, they won't make the application wait for a state to be published).

In addition to its timestamp, an EyeGazeTrackerReading instance has an IsCalibrationValid property, which indicates if the eye tracker calibration is valid or not.

Finally, gaze data can be retrieved through a set of methods such as TryGetCombinedEyeGazeInTrackerSpace() or TryGetLeftEyeGazeInTrackerSpace(). All these methods return a boolean indicating a success. Failure to get some data might either mean that the data is not supported (EyeGazeTracker has properties to detect this case) or that the tracker could not get the data (invalid calibration, eye hidden, etc.).

If, for example, the application wants to display a cursor corresponding to the combined gaze, it can query the tracker using a timestamp of the prediction of the frame being prepared:

```C#
var holographicFrame = holographicSpace.CreateNextFrame();
var prediction = holographicFrame.CurrentPrediction;
var predictionTimestamp = prediction.Timestamp;
var reading = _tracker.TryGetReadingAtTimestamp(predictionTimestamp.TargetTime.DateTime);
if (reading != null)
{
    // Vector3 needs the System.Numerics namespace
    if (reading.TryGetCombinedEyeGazeInTrackerSpace(out Vector3 gazeOrigin, out Vector3 gazeDirection))
    {
        // Use gazeOrigin and gazeDirection to display the cursor
    }
}
```

```Cpp
auto holographicFrame = m_holographicSpace.CreateNextFrame();
auto prediction = holographicFrame.CurrentPrediction();
auto predictionTimestamp = prediction.Timestamp();
const auto reading = m_gazeTracker.TryGetReadingAtTimestamp(predictionTimestamp.TargetTime());
if (reading)
{
    float3 gazeOrigin;
    float3 gazeDirection;
    if (reading.TryGetCombinedEyeGazeInTrackerSpace(gazeOrigin, gazeDirection))
    {
        // Use gazeOrigin and gazeDirection to display the cursor
    }
}
```


## Transfer gaze data to other SpatialCoordinateSystem

Windows Spatial APIs that return spatial data such as a position always require both a PerceptionTimestamp and a SpatialCoordinateSystem. For example, to retrieve the combined gaze of HoloLens2 Eye tracker using the Windows API, the application first calls SpatialPointerPose.TryGetAtTimestamp() which has two parameters, a SpatialCoordinateSystem and a timestamp. When the combined gaze is then accessed through patialPointerPose.Eyes.Gaze, its origin and direction are expressed in the SpatialCoordinateSystem initially passed to SpatialPointerPose.TryGetAtTimestamp().

Extended Eye Tracking SDK methods don't use any of the Windows spatial API classes; they can be correlated to these classes using Windows.Perception.Spatial.SpatialLocator class:

* As the section above named "Open eye gaze tracker"  mentioned, to get a SpatialLocator for the eye gaze tracker, call Windows.Perception.Spatial.Preview.SpatialGraphInteropPreview.CreateLocatorForNode() with the TrackerSpaceLocatorNodeId property of the Eye Gaze Tracker instance.

* Gaze origins and directions retrieved through the EyeGazeTracker reading are related to this SpatialLocator.

* SpatialLocator.TryLocateAtTimestamp() returns the full 6DoF location of the eye gaze tracker at a given PerceptionTimeStamp and related to a given SpatialCoordinateSystem, which could be used to construct a Matrix4x4 transformation matrix.

* Use the Matrix4x4 transformation matrix constructed to transfer the gaze origins and directions to other SpatialCoordinateSystem.

The following code samples show how to compute the position of a cube located in the direction of the combined gaze, two meters in front of the gaze origin; 

```C#
var predictionTimestamp = prediction.Timestamp;
var stationaryCS = stationaryReferenceFrame.CoordinateSystem;
var trackerLocation = _trackerLocator.TryLocateAtTimestamp(predictionTimestamp, stationaryCS);
if (trackerLocation != null)
{
    var trackerToStationaryMatrix = Matrix4x4.CreateFromQuaternion(trackerLocation.Orientation) * Matrix4x4.CreateTranslation(trackerLocation.Position);
    var reading = _tracker.TryGetReadingAtTimestamp(predictionTimestamp.TargetTime.DateTime);
    if (reading != null)
    {
        if (reading.TryGetCombinedEyeGazeInTrackerSpace(out Vector3 gazeOriginInTrackerSpace, out Vector3 gazeDirectionInTrackerSpace))
        {
            var cubePositionInTrackerSpace = gazeOriginInTrackerSpace + 2.0f * gazeDirectionInTrackerSpace;
            var cubePositionInStationaryCS = Vector3.Transform(cubePositionInTrackerSpace, trackerToStationaryMatrix);
        }
    }
}
```

```Cpp
auto predictionTimestamp = prediction.Timestamp();
auto stationaryCS = m_stationaryReferenceFrame.CoordinateSystem();
auto trackerLocation = m_trackerLocator.TryLocateAtTimestamp(predictionTimestamp, stationaryCS);
if (trackerLocation) 
{
    auto trackerOrientation = trackerLocation.Orientation();
    auto trackerPosition = trackerLocation.Position();
    auto trackerToStationaryMatrix = DirectX::XMMatrixRotationQuaternion(DirectX::XMLoadFloat4(reinterpret_cast<const DirectX::XMFLOAT4*>(&trackerOrientation))) * DirectX::XMMatrixTranslationFromVector(DirectX::XMLoadFloat3(&trackerPosition));

    const auto reading = m_gazeTracker.TryGetReadingAtTimestamp(predictionTimestamp.TargetTime());
    if (reading)
    {
        float3 gazeOriginInTrackerSpace;
        float3 gazeDirectionInTrackerSpace;
        if (reading.TryGetCombinedEyeGazeInTrackerSpace(gazeOriginInTrackerSpace, gazeDirectionInTrackerSpace))
        {
            auto cubePositionInTrackerSpace = gazeOriginInTrackerSpace + 2.0f * gazeDirectionInTrackerSpace;
            float3 cubePositionInStationaryCS;
            DirectX::XMStoreFloat3(&cubePositionInStationaryCS, DirectX::XMVector3TransformCoord(DirectX::XMLoadFloat3(&cubePositionInTrackerSpace), trackerToStationaryMatrix));
        }
    }
}
```

## API Reference of Extended Eye Tracking SDK

Namespace: Microsoft.MixedReality.EyeTracking 

class                   | Description |
------------------------|-------------------------------------------
EyeGazeTracker          | Represents an eye gaze tracker |
EyeGazeTrackerFrameRate | Represents a Frame Rate supported by an Eye Tracker |
EyeGazeTrackerRawValues | Enables access to values provided by a given driver but not yet "promoted" as strongly typed properties and methods of the SDK |
EyeGazeTrackerReading   | Snapshot of Gaze Tracker state |
EyeGazeTrackerWatcher   | Allow discovery of Eye Gaze Trackers connected to the system |

### EyeGazeTracker

Represents an eye gaze tracker

Properties

Name                                                | Description  |
----------------------------------------------------|-------------------------------------------
public bool AreLeftAndRightGazesSupported { get; }	| True if individual gazes are supported |
public bool IsEyeOpennessSupported { get; }	        | True if Eye Openness is supported by the driver |
public bool IsRestrictedModeSupported { get; }	    |  |
public bool IsVergenceDistanceSupported { get; }	| True if Vergence Distance is supported by tracker. |
public IReadOnlyList<EyeGazeTrackerFrameRate> SupportedTargetFrameRates { get; }  |	List of the target frame rates supported by the tracker |
public Guid TrackerSpaceLocatorNodeId { get; }	    | NodeId of the Tracker allowing to retrieve a SpatialLocator using SpatialGraphInteropPreview.CreateLocatorForNode |

Methods
    
Name                                                | Description  |
----------------------------------------------------|-------------------------------------------
public void Close()	                                | Closes the tracker |
public Task OpenAsync(bool restrictedMode)          | Opens the tracker |
public void SetTargetFrameRate(EyeGazeTrackerFrameRate newFrameRate)  |	Changes the target framerate of the tracker |
public EyeGazeTrackerReading TryGetReadingAfterSystemRelativeTime(TimeSpan time)  |	Try to get the first tracker state after a system relative time |
public EyeGazeTrackerReading TryGetReadingAfterTimestamp(DateTime timestamp)  |	Try to get first first tracker state after a given timestamp |
public EyeGazeTrackerReading TryGetReadingAtSystemRelativeTime(TimeSpan time) | Try to get tracker state at a system relative time |
public EyeGazeTrackerReading TryGetReadingAtTimestamp(DateTime timestamp) |	Try to get tracker state at a given timestamp |

### EyeGazeTrackerFrameRate

Represents a Frame Rate supported by an Eye Tracker

Properties
    
Name                                                | Description  |
----------------------------------------------------|-------------------------------------------
public uint FramesPerSecond { get; }	            | Frames per second of the frame rate |

### EyeGazeTrackerRawValues

For each piece of data (Combined gaze, calibration state, individual gazes) incorporated into the tracker's published states, there's an associated GUID and a type. 
The type associated to a GUID never changes, but each eye tracker might support different sets of GUID/type pairs. HoloLens 2 eye tracker supports different sets for its standard mode and its restricted mode.

The EyeGazeTrackerRawValues class enables an application to access new types of data that aren't yet part of the strongly typed part of the SDK, provided that the eye tracker team has provided a GUID, the associated data type, and its meaning.

Methods
    
Name                                                | Description  |
----------------------------------------------------|-------------------------------------------
public static bool IsSupported(EyeGazeTracker tracker, Guid valueKey) |	Return True if a value identified by its guid is supported by a tracker |
public static void SendCommand(EyeGazeTracker tracker, Guid command, byte[] inBuffer, byte[] outBuffer)	| Sends a command to the tracker |
public static bool TryGetBool(EyeGazeTrackerReading reading, Guid valueKey, out bool value) | Try to read a boolean value from a reading |
public static bool TryGetFloat(EyeGazeTrackerReading reading, Guid valueKey, out float value) |	Try to read a float value from a reading |
public static bool TryGetInt(EyeGazeTrackerReading reading, Guid valueKey, out int value) |	Try to read a int value from a reading |
public static bool TryGetVector3(EyeGazeTrackerReading reading,	Guid valueKey, out Vector3 value) |	Try to read a vector3 value from a reading |

### EyeGazeTrackerReading

Snapshot of Eye Gaze Tracker state at a given time

Properties
    
Name                                                | Description  |
----------------------------------------------------|-------------------------------------------
public bool IsCalibrationValid { get; }	            | Indicates if user calibration is valid |
public TimeSpan SystemRelativeTime { get; }	        | Timestamp of state as system relative time |
public DateTime Timestamp { get; }	                | Timestamp of state |

Methods
    
Name                                                | Description  |
----------------------------------------------------|-------------------------------------------
public bool TryGetCombinedEyeGazeInTrackerSpace(out Vector3 origin, out Vector3 direction) | Tries to get a vector representing the combined gaze related to the tracker's node position |
public bool TryGetLeftEyeGazeInTrackerSpace(Vector3 origin, out Vector3 direction) | Tries to get a vector representing the left eye gaze related to the tracker's node position |
public bool TryGetLeftEyeOpenness(out float value)  | Tries to get left Eye openness information |
public bool TryGetRightEyeGazeInTrackerSpace(out Vector3 origin, out Vector3 direction) | Tries to get a vector representing the right eye gaze related to the tracker's node position |
public bool TryGetRightEyeOpenness(out float value) | Tries to get right Eye openness information |
public bool TryGetVergenceDistance(out float value) | Tries to read vergence distance |

### EyeGazeTrackerWatcher

Allow discovery of Eye Gaze Trackers connected to the system.

Note: this is the only class from Extended Eye Tracking SDK that the application will instanciate, other classes' instances will be returned by method calls or properties.

Methods
    
Name                                                | Description  |
----------------------------------------------------|-------------------------------------------
public EyeGazeTrackerWatcher()                      | Constructs an instance of the watcher |
public Task StartAsync()                            | Starts trackers enumeration |
public void Stop()                                  | Stop listening to trackers additions and removal |

Events
    
Name                                                | Description  |
----------------------------------------------------|-------------------------------------------
public event EventHandler<EyeGazeTracker> EyeGazeTrackerAdded   | Raised when an Eye Gaze tracker is connected |
public event EventHandler<EyeGazeTracker> EyeGazeTrackerRemoved | Raised when an Eye Gaze tracker is disconnected |

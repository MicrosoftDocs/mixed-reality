---
title: Extended eye tracking in Unity
description: Learn about extended eye tracking for Unity development for HoloLens 2.
author: magdavuko   
ms.author: magdav
ms.date: 08/23/2022
ms.topic: article
keywords: Eye tracking, mixed reality, input, eye-gaze, calibration, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens, MRTK, Mixed Reality Toolkit, intent, actions, API reference, Unity
---

# Extended eye tracking in Unity

To access the GitHub repo for the extended eye tracking sample:

> [!div class="nextstepaction"]
> [Extended eye tracking Unity sample](https://github.com/microsoft/MixedReality-EyeTracking-Sample)

Extended eye tracking is a new capability in HoloLens 2. It's a superset of the standard eye tracking, which only provides combined eye gaze data. Extended eye tracking also provides individual eye gaze data and allows applications to set different frame rates for the gaze data, such as 30, 60, and 90fps. Other features, such as eye openness and eye vergence, aren't supported by HoloLens 2 at this time.

The [Extended Eye Tracking SDK](https://www.nuget.org/packages/Microsoft.MixedReality.EyeTracking) enables applications to access data and features of extended eye tracking. It could be used together with OpenXR APIs or legacy WinRT APIs.

This article covers the ways to use the extended eye tracking SDK in Unity together with the Mixed Reality OpenXR Plugin.

## Project setup

1. [Set up the Unity project for HoloLens development.](./unity-development-overview.md)
    - Select the Gaze Input capability
2. [Import the Mixed Reality OpenXR Plugin from MRTK feature tool.](./mixed-reality-openxr-plugin.md) 
3. Import the Eye Tracking SDK NuGet package into your Unity project.
    1. Download and install the [NuGetForUnity](https://github.com/GlitchEnzo/NuGetForUnity/releases) package.
    2. In the Unity editor, go to `NuGet`->`Manage NuGet Packages`, and then search for `Microsoft.MixedReality.EyeTracking`
    3. Click the Install button to import the latest version of the NuGet package.  
        ![Screenshot of the Eye Tracking SDK Nuget package.](images/038-install-nuget-package.png)  
4. Add the Unity helper scripts.
    1. Add the `ExtendedEyeGazeDataProvider.cs` script from [here](https://github.com/microsoft/MixedReality-EyeTracking-Sample/blob/main/SampleEyeTracking/Assets/Scripts/ExtendedEyeGazeDataProvider.cs) to your Unity project.
    2. Create a scene, then attach the `ExtendedEyeGazeDataProvider.cs` script to any GameObject.
5. Consume the functions of `ExtendedEyeGazeDataProvider.cs` and implement your logics.
6. [Build and deploy to HoloLens](./build-and-deploy-to-hololens.md).

## Consume functions of ExtendedEyeGazeDataProvider

> [!NOTE]
> The `ExtendedEyeGazeDataProvider` script depends on some APIs from the Mixed Reality OpenXR Plugin to convert the coordinates of the gaze data. It can't work if your Unity project uses the deprecated Windows XR plugin or the legacy Built-in XR in older Unity version. To make the extended eye tracking also work in those scenarios:
> - If you just need to access the frame rate settings, the Mixed Reality OpenXR Plugin isn't necessary, and you could modify the `ExtendedEyeGazeDataProvider` to only keep the frame rate-related logic.
> - If you still need to access individual eye gaze data, you need to [use WinRT APIs in Unity](./using-the-windows-namespace-with-unity-apps-for-hololens.md). To see how to use extended eye tracking SDK with WinRT APIs, refer to the "See Also" section.

The `ExtendedEyeGazeDataProvider` class wraps the extended eye tracking SDK APIs. It provides functions to get gaze reading in either Unity world space or relative to the main camera.

Here are code samples to consume `ExtendedEyeGazeDataProvider` to get the gaze data.

```C#
ExtendedEyeGazeDataProvider extendedEyeGazeDataProvider;
void Update() {
    timestamp = DateTime.Now;

    var leftGazeReadingInWorldSpace = extendedEyeGazeDataProvider.GetWorldSpaceGazeReading(extendedEyeGazeDataProvider.GazeType.Left, timestamp);
    var rightGazeReadingInWorldSpace = extendedEyeGazeDataProvider.GetWorldSpaceGazeReading(extendedEyeGazeDataProvider.GazeType.Right, timestamp);
    var combinedGazeReadingInWorldSpace = extendedEyeGazeDataProvider.GetWorldSpaceGazeReading(extendedEyeGazeDataProvider.GazeType.Combined, timestamp);

    var combinedGazeReadingInCameraSpace = extendedEyeGazeDataProvider.GetCameraSpaceGazeReading(extendedEyeGazeDataProvider.GazeType.Combined, timestamp);
}
```

When the `ExtendedEyeGazeDataProvider` script executes, it sets the gaze data frame rate to the highest option, which is currently 90fps.

## API reference of extended eye tracking SDK

Apart from using the `ExtendedEyeGazeDataProvider` script, you can also create your own script to consume the SDK APIs following directly.

```C#
namespace Microsoft.MixedReality.EyeTracking
{
    /// <summary>
    /// Allow discovery of Eye Gaze Trackers connected to the system
    /// This is the only class from the Extended Eye Tracking SDK that the application will instantiate, 
    /// other classes' instances will be returned by method calls or properties.
    /// </summary>
    public class EyeGazeTrackerWatcher
    {
        /// <summary>
        /// Constructs an instance of the watcher
        /// </summary>
        public EyeGazeTrackerWatcher();

        /// <summary>
        /// Starts trackers enumeration.
        /// </summary>
        /// <returns>Task representing async action; completes when the initial enumeration is completed</returns>
        public System.Threading.Tasks.Task StartAsync();

        /// <summary>
        /// Stop listening to trackers additions and removal
        /// </summary>
        public void Stop();

        /// <summary>
        /// Raised when an Eye Gaze tracker is connected
        /// </summary>
        public event System.EventHandler<EyeGazeTracker> EyeGazeTrackerAdded;

        /// <summary>
        /// Raised when an Eye Gaze tracker is disconnected
        /// </summary>
        public event System.EventHandler<EyeGazeTracker> EyeGazeTrackerRemoved;        
    }

    /// <summary>
    /// Represents an Eye Tracker device
    /// </summary>
    public class EyeGazeTracker
    {
        /// <summary>
        /// True if Restricted mode is supported, which means the driver supports providing individual 
        /// eye gaze vector and frame rate 
        /// </summary>
        public bool IsRestrictedModeSupported;

        /// <summary>
        /// True if Vergence Distance is supported by tracker
        /// </summary>
        public bool IsVergenceDistanceSupported;

        /// <summary>
        /// True if Eye Openness is supported by the driver
        /// </summary>
        public bool IsEyeOpennessSupported;

        /// <summary>
        /// True if individual gazes are supported
        /// </summary>
        public bool AreLeftAndRightGazesSupported;

        /// <summary>
        /// Get the supported target frame rates of the tracker
        /// </summary>
        public System.Collections.Generic.IReadOnlyList<EyeGazeTrackerFrameRate> SupportedTargetFrameRates;

        /// <summary>
        /// NodeId of the tracker, used to retrieve a SpatialLocator or SpatialGraphNode to locate the tracker in the scene
        /// for the Perception API, use SpatialGraphInteropPreview.CreateLocatorForNode
        /// for the Mixed Reality OpenXR API, use SpatialGraphNode.FromDynamicNodeId
        /// </summary>
        public Guid TrackerSpaceLocatorNodeId;

        /// <summary>
        /// Opens the tracker
        /// </summary>
        /// <param name="restrictedMode">True if restricted mode active</param>
        /// <returns>Task representing async action; completes when the initial enumeration is completed</returns>
        public System.Threading.Tasks.Task OpenAsync(bool restrictedMode);

        /// <summary>
        /// Closes the tracker
        /// </summary>
        public void Close();

        /// <summary>
        /// Changes the target frame rate of the tracker
        /// </summary>
        /// <param name="newFrameRate">Target frame rate</param>
        public void SetTargetFrameRate(EyeGazeTrackerFrameRate newFrameRate);

        /// <summary>
        /// Try to get tracker state at a given timestamp
        /// </summary>
        /// <param name="timestamp">timestamp</param>
        /// <returns>State if available, null otherwise</returns>
        public EyeGazeTrackerReading TryGetReadingAtTimestamp(DateTime timestamp);

        /// <summary>
        /// Try to get tracker state at a system relative time
        /// </summary>
        /// <param name="time">time</param>
        /// <returns>State if available, null otherwise</returns>
        public EyeGazeTrackerReading TryGetReadingAtSystemRelativeTime(TimeSpan time);

        /// <summary>
        /// Try to get first first tracker state after a given timestamp
        /// </summary>
        /// <param name="timestamp">timestamp</param>
        /// <returns>State if available, null otherwise</returns>
        public EyeGazeTrackerReading TryGetReadingAfterTimestamp(DateTime timestamp);

        /// <summary>
        /// Try to get the first tracker state after a system relative time
        /// </summary>
        /// <param name="time">time</param>
        /// <returns>State if available, null otherwise</returns>
        public EyeGazeTrackerReading TryGetReadingAfterSystemRelativeTime(TimeSpan time);
    }

    /// <summary>
    /// Represents a frame rate supported by an Eye Tracker
    /// </summary>
    public class EyeGazeTrackerFrameRate
    {
        /// <summary>
        /// Frames per second of the frame rate
        /// </summary>
        public UInt32 FramesPerSecond;
    }

    /// <summary>
    /// Snapshot of Gaze Tracker state
    /// </summary>
    public class EyeGazeTrackerReading
    {
        /// <summary>
        /// Timestamp of state
        /// </summary>
        public DateTime Timestamp;

        /// <summary>
        /// Timestamp of state as system relative time
        /// Its SystemRelativeTime.Ticks could provide the QPC time to locate tracker pose 
        /// </summary>
        public TimeSpan SystemRelativeTime;

        /// <summary>
        /// Indicates of user calibration is valid
        /// </summary>
        public bool IsCalibrationValid;

        /// <summary>
        /// Tries to get a vector representing the combined gaze related to the tracker's node
        /// </summary>
        /// <param name="origin">Origin of the gaze vector</param>
        /// <param name="direction">Direction of the gaze vector</param>
        /// <returns></returns>
        public bool TryGetCombinedEyeGazeInTrackerSpace(out System.Numerics.Vector3 origin, out System.Numerics.Vector3 direction);

        /// <summary>
        /// Tries to get a vector representing the left eye gaze related to the tracker's node
        /// </summary>
        /// <param name="origin">Origin of the gaze vector</param>
        /// <param name="direction">Direction of the gaze vector</param>
        /// <returns></returns>
        public bool TryGetLeftEyeGazeInTrackerSpace(out System.Numerics.Vector3 origin, out System.Numerics.Vector3 direction);

        /// <summary>
        /// Tries to get a vector representing the right eye gaze related to the tracker's node position
        /// </summary>
        /// <param name="origin">Origin of the gaze vector</param>
        /// <param name="direction">Direction of the gaze vector</param>
        /// <returns></returns>
        public bool TryGetRightEyeGazeInTrackerSpace(out System.Numerics.Vector3 origin, out System.Numerics.Vector3 direction);

        /// <summary>
        /// Tries to read vergence distance
        /// </summary>
        /// <param name="value">Vergence distance if available</param>
        /// <returns>bool if value is valid</returns>
        public bool TryGetVergenceDistance(out float value);

        /// <summary>
        /// Tries to get left Eye openness information
        /// </summary>
        /// <param name="value">Eye Openness if valid</param>
        /// <returns>bool if value is valid</returns>
        public bool TryGetLeftEyeOpenness(out float value);

        /// <summary>
        /// Tries to get right Eye openness information
        /// </summary>
        /// <param name="value">Eye openness if valid</param>
        /// <returns>bool if value is valid</returns>
        public bool TryGetRightEyeOpenness(out float value);
    }
}
```

## See also

* [Use extended eye tracking in native engine](../native/extended-eye-tracking-native.md)

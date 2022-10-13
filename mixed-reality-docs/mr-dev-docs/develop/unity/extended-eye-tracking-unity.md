---
title: Extended eye tracking for Unity Development
description: Learn about extended eye tracking for Unity development for HoloLens 2.
author: magdavuko   
ms.author: magdav
ms.date: 08/23/2022
ms.topic: article
keywords: Eye tracking, mixed reality, input, eye-gaze, calibration, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens, MRTK, Mixed Reality Toolkit, intent, actions, API reference, Unity
---
# Extended eye tracking for Unity development

The Extended Eye Tracking SDK, shown as a NuGet package, enables applications to access data and features provided by Eye Trackers that are not necessarily available through the Windows API. This addresses the reality that trackers and drivers can evolve at a faster pace than the Windows API.

All eye-related information provided by a device such as the HoloLens 2 is available through the Extended Eye Tracking SDK, which is meant to be used in conjunction with Windows spatial APIs such as the Windows.Perception.Spatial.SpatialCoordinateSystem class. This allows a smooth update of existing Windows Mixed Reality applications using eye tracking features.

This article covers the ways that you can use the Unity  development path to consume the Extended Eye Tracking SDK and get access to the extended eye tracking data and features. An API reference is also provided.

## Project setup

1. [Set up the Unity project for HoloLens development.](./unity-development-overview.md).
    - Select the Gaze Input capability
2. Import the [Eye Tracking SDK NuGet package](https://www.nuget.org/packages/Microsoft.MixedReality.EyeTracking) into your Unity project.
    1. Download and install the [NuGetForUnity](https://github.com/GlitchEnzo/NuGetForUnity/releases) package.
    2. In the Unity editor, go to `NuGet`->`Manage NuGet Packages`, and then search for `Microsoft.MixedReality.EyeTracking`
    3. Click the Install button to import the NuGet package.  

        ![Screenshot of the Eye Tracking SDK Nuget package.](images/038-install-nuget-package.png)  

3. Add the Unity helper scripts.
    1. Add the `Vector3Extensions.cs` and `ExtendedEyeTrackingDataProvider.cs` scripts below into your Unity project.
    2. Create a scene, then add an empty object, and then attach the `ExtendedEyeTrackingDataProvider.cs` script to it.
4. Implement your logics.
5. Build and deploy.

## Steps to get the gaze data

The ExtendedEyeTrackingDataProvider class wraps the Extended Eye Tracking SDK APIs. It could get gaze reading in either Unity world space or relative to the main camera.

Code samples to get the gaze data

```C#
ExtendedEyeTrackingDataProvider extendedEyeTrackingDataProvider;
timestamp = DateTime.Now;

var leftGazeReadingInWorldSpace = extendedEyeTrackingDataProvider.GetWorldSpaceGazeReading(ExtendedEyeTrackingDataProvider.GazeType.Left, timestamp);
var rightGazeReadingInWorldSpace = extendedEyeTrackingDataProvider.GetWorldSpaceGazeReading(ExtendedEyeTrackingDataProvider.GazeType.Right, timestamp);
var combinedGazeReadingInWorldSpace = extendedEyeTrackingDataProvider.GetWorldSpaceGazeReading(ExtendedEyeTrackingDataProvider.GazeType.Combined, timestamp);

var combinedGazeReadingInCameraSpace = extendedEyeTrackingDataProvider.GetCameraSpaceGazeReading(ExtendedEyeTrackingDataProvider.GazeType.Combined, timestamp);
```

When Unity executes the ExtendedEyeTrackingDataProvider script, it sets the frame rate to the highest option, which is currently 90fps.

## Scripts

### Vector3Extensions.cs

```C#
using System.Text;

public static class Vector3Extensions
{
    private static StringBuilder sb = new StringBuilder();
    public static string ToString2(float x, float y, float z)
    {
        sb.Clear();
        sb.Append("(");
        sb.Append(x.ToString("F3"));
        sb.Append(" ,");
        sb.Append(y.ToString("F3"));
        sb.Append(" ,");
        sb.Append(z.ToString("F3"));
        sb.Append(")");
        return sb.ToString();
    }

    public static string ToString2(this UnityEngine.Vector3 v)
    {
        return ToString2(v.x, v.y, v.z);
    }

    public static string ToString2(this System.Numerics.Vector3 v)
    {
        return ToString2(v.X, v.Y, v.Z);
    }

    public static UnityEngine.Vector3 ToUnity(this System.Numerics.Vector3 v) => new UnityEngine.Vector3(v.X, v.Y, -v.Z);
    public static UnityEngine.Quaternion ToUnity(this System.Numerics.Quaternion q) => new UnityEngine.Quaternion(-q.X, -q.Y, q.Z, q.W);
    public static UnityEngine.Matrix4x4 ToUnity(this System.Numerics.Matrix4x4 m) => new UnityEngine.Matrix4x4(
        new UnityEngine.Vector4(m.M11, m.M12, -m.M13, m.M14),
        new UnityEngine.Vector4(m.M21, m.M22, -m.M23, m.M24),
        new UnityEngine.Vector4(-m.M31, -m.M32, m.M33, -m.M34),
        new UnityEngine.Vector4(m.M41, m.M42, -m.M43, m.M44));

    public static System.Numerics.Vector3 ToSystem(this UnityEngine.Vector3 v) => new System.Numerics.Vector3(v.x, v.y, -v.z);
    public static System.Numerics.Quaternion ToSystem(this UnityEngine.Quaternion q) => new System.Numerics.Quaternion(-q.x, -q.y, q.z, q.w);
    public static System.Numerics.Matrix4x4 ToSystem(this UnityEngine.Matrix4x4 m) => new System.Numerics.Matrix4x4(
        m.m00, m.m10, -m.m20, m.m30,
        m.m01, m.m11, -m.m21, m.m31,
       -m.m02, -m.m12, m.m22, -m.m32,
        m.m03, m.m13, -m.m23, m.m33);
}
```

### ExtendedEyeTrackingDataProvider.cs

```C#
using Microsoft.MixedReality.EyeTracking;
using System;
using UnityEngine;
#if ENABLE_WINMD_SUPPORT
using System.Threading.Tasks;
using Windows.Perception;
using Windows.Perception.Spatial;
#endif

/// <summary>
/// This class provides access to the Extended Eye Gaze Tracking API 
/// Values are given in Unity world space or relative to the main camera
/// </summary>
[DisallowMultipleComponent]
public class ExtendedEyeTrackingDataProvider : MonoBehaviour
{
    public enum GazeType
    {
        Left,
        Right,
        Combined
    }

    public class GazeReading
    {
        public Vector3 EyePosition;
        public Vector3 GazeDirection;
        public GazeReading() { }
        public GazeReading(Vector3 position, Vector3 direction)
        {
            EyePosition = position;
            GazeDirection = direction;
        }
    }

    private Camera _mainCamera;
    private GazeReading _gazeReading = new GazeReading();
    private GazeReading _transformedGazeReading = new GazeReading();
    private EyeGazeTrackerWatcher _watcher;
    private EyeGazeTracker _eyeGazeTracker;
    private EyeGazeTrackerReading _eyeGazeTrackerReading;
    private System.Numerics.Vector3 _trackerPosition;
    private System.Numerics.Quaternion _trackerOrientation;
    private System.Numerics.Matrix4x4 _trackerToUnityWorldSpaceMatrix;
    private System.Numerics.Vector3 _trackerSpaceGazeOrigin;
    private System.Numerics.Vector3 _trackerSpaceGazeDirection;
    private bool _gazePermissionEnabled;
    private bool _readingSucceeded;
#if ENABLE_WINMD_SUPPORT
    private SpatialLocator _trackerLocator;
    private SpatialLocation _trackerLocation;
    private SpatialCoordinateSystem _unityWorldSpaceSpatialCoordinateSystem;
    PerceptionTimestamp _perceptionTimestamp;
#endif


    /// <summary>
    /// Get the current reading for the requested GazeType, relative to the main camera
    /// Will return null if unable to return a valid reading
    /// </summary>
    /// <param name="gazeType"></param>
    /// <returns></returns>
    public GazeReading GetCameraSpaceGazeReading(GazeType gazeType)
    {
        return GetCameraSpaceGazeReading(gazeType, DateTime.Now);
    }

    /// <summary>
    /// Get the reading for the requested GazeType at the given TimeStamp, relative to the main camera
    /// Will return null if unable to return a valid reading
    /// </summary>
    /// <param name="gazeType"></param>
    /// <param name="timeStamp"></param>
    /// <returns></returns>
    public GazeReading GetCameraSpaceGazeReading(GazeType gazeType, DateTime timeStamp)
    {
        _gazeReading = GetWorldSpaceGazeReading(gazeType, timeStamp);
        if (_gazeReading == null)
        {
            return null;
        }

        _transformedGazeReading.EyePosition = _mainCamera.transform.InverseTransformPoint(_gazeReading.EyePosition);
        _transformedGazeReading.GazeDirection = _mainCamera.transform.InverseTransformDirection(_gazeReading.GazeDirection).normalized;

        return _transformedGazeReading;
    }

    /// <summary>
    /// Get the current reading for the requested GazeType
    /// Will return null if unable to return a valid reading
    /// </summary>
    /// <param name="gazeType"></param>
    /// <returns></returns>
    public GazeReading GetWorldSpaceGazeReading(GazeType gazeType)
    {
        return GetWorldSpaceGazeReading(gazeType, DateTime.Now);
    }

    /// <summary>
    /// Get the reading for the requested GazeType at the given TimeStamp
    /// Will return null if unable to return a valid reading
    /// </summary>
    /// <param name="gazeType"></param>
    /// <param name="timestamp"></param>
    /// <returns></returns>
    public GazeReading GetWorldSpaceGazeReading(GazeType gazeType, DateTime timestamp)
    {
        if (!_gazePermissionEnabled || _eyeGazeTracker == null)
        {
            return null;
        }

        _eyeGazeTrackerReading = _eyeGazeTracker.TryGetReadingAtTimestamp(timestamp);
        if (_eyeGazeTrackerReading == null)
        {
            Debug.LogWarning($"Unable to get eyeGazeTrackerReading at: {timestamp.ToLongTimeString()}");
            return null;
        }

        _gazeReading = null;

#if ENABLE_WINMD_SUPPORT
        // compute tracker to stationary coordinate system transform
        _perceptionTimestamp = PerceptionTimestampHelper.FromHistoricalTargetTime(timestamp);
        _trackerLocation = _trackerLocator.TryLocateAtTimestamp(_perceptionTimestamp, _unityWorldSpaceSpatialCoordinateSystem);

        if (_trackerLocation == null)
        {
            return null;
        }

        _trackerOrientation = _trackerLocation.Orientation;
        _trackerPosition = _trackerLocation.Position;
        _trackerToUnityWorldSpaceMatrix = System.Numerics.Matrix4x4.CreateFromQuaternion(_trackerOrientation) * System.Numerics.Matrix4x4.CreateTranslation(_trackerPosition);

        switch (gazeType)
        {
            case GazeType.Left:
            {
                // Get left eye gaze
                _readingSucceeded = _eyeGazeTrackerReading.TryGetLeftEyeGazeInTrackerSpace(out _trackerSpaceGazeOrigin, out _trackerSpaceGazeDirection);
                if (_readingSucceeded)
                {
                    // return the gaze reading in Unity world space
                    return new GazeReading(
                    // the gaze origin in world space
                    System.Numerics.Vector3.Transform(_trackerSpaceGazeOrigin, _trackerToUnityWorldSpaceMatrix).ToUnity(),

                    // the gaze direction in world space
                    System.Numerics.Vector3.TransformNormal(_trackerSpaceGazeDirection, _trackerToUnityWorldSpaceMatrix).ToUnity().normalized
                    );
                }

                // unable to get reading
                return null;
            }
            case GazeType.Right:
            {
                // Get right eye gaze
                _readingSucceeded = _eyeGazeTrackerReading.TryGetRightEyeGazeInTrackerSpace(out _trackerSpaceGazeOrigin, out _trackerSpaceGazeDirection);
                if (_readingSucceeded)
                {
                    // return the gaze reading in Unity world space
                    return new GazeReading(
                    // the gaze origin in world space
                    System.Numerics.Vector3.Transform(_trackerSpaceGazeOrigin, _trackerToUnityWorldSpaceMatrix).ToUnity(),

                    // the gaze direction in world space
                    System.Numerics.Vector3.TransformNormal(_trackerSpaceGazeDirection, _trackerToUnityWorldSpaceMatrix).ToUnity().normalized
                    );
                }

                // unable to get reading
                return null;
            }
            case GazeType.Combined:
            {
                // Get combined eye gaze
                _readingSucceeded = _eyeGazeTrackerReading.TryGetCombinedEyeGazeInTrackerSpace(out _trackerSpaceGazeOrigin, out _trackerSpaceGazeDirection);
                if (_readingSucceeded)
                {
                    // return the gaze reading in Unity world space
                    return new GazeReading(
                    // the gaze origin in world space
                    System.Numerics.Vector3.Transform(_trackerSpaceGazeOrigin, _trackerToUnityWorldSpaceMatrix).ToUnity(),

                    // the gaze direction in world space
                    System.Numerics.Vector3.TransformNormal(_trackerSpaceGazeDirection, _trackerToUnityWorldSpaceMatrix).ToUnity().normalized
                    );
                }

                // unable to get reading
                return null;
            }
        }
#endif

        return _gazeReading;
    }

    private async void Start()
    {
        _mainCamera = Camera.main;

        Debug.Log("Initializing MedicalEyeTracking");
#if ENABLE_WINMD_SUPPORT
#if UNITY_2020_1_OR_NEWER
        if ((bool)IsLoaderActive<UnityEngine.XR.OpenXR.OpenXRLoaderBase>())
        {
            _unityWorldSpaceSpatialCoordinateSystem = Microsoft.MixedReality.OpenXR.PerceptionInterop.GetSceneCoordinateSystem(Pose.identity) as SpatialCoordinateSystem;
        }
        else
        {
            _unityWorldSpaceSpatialCoordinateSystem = (SpatialCoordinateSystem)System.Runtime.InteropServices.Marshal.GetObjectForIUnknown(UnityEngine.XR.WindowsMR.WindowsMREnvironment.OriginSpatialCoordinateSystem);
        }
#else
        _unityWorldSpaceSpatialCoordinateSystem = (SpatialCoordinateSystem)System.Runtime.InteropServices.Marshal.GetObjectForIUnknown(UnityEngine.XR.WSA.WorldManager.GetNativeISpatialCoordinateSystemPtr());
#endif
        Debug.Log("Triggering eye gaze permission request");
        _gazePermissionEnabled = await AskForEyePosePermission();
#endif

        if (!_gazePermissionEnabled)
        {
            Debug.LogError("Gaze is disabled");
            return;
        }

        _watcher = new Microsoft.MixedReality.EyeTracking.EyeGazeTrackerWatcher();
        _watcher.EyeGazeTrackerAdded += _watcher_EyeGazeTrackerAdded;
        _watcher.EyeGazeTrackerRemoved += _watcher_EyeGazeTrackerRemoved;
        await _watcher.StartAsync();
    }

    private void _watcher_EyeGazeTrackerRemoved(object sender, EyeGazeTracker e)
    {
        Debug.Log("EyeGazeTracker removed");
        _eyeGazeTracker = null;
    }

    private async void _watcher_EyeGazeTrackerAdded(object sender, EyeGazeTracker e)
    {
        Debug.Log("EyeGazeTracker added");
        try
        {
            await e.OpenAsync(true);
            _eyeGazeTracker = e;
            var supportedFrameRates = _eyeGazeTracker.SupportedTargetFrameRates;
            foreach (var frameRate in supportedFrameRates)
            {
                Debug.Log($"  supportedFrameRate: {frameRate.FramesPerSecond}");
            }

            _eyeGazeTracker.SetTargetFrameRate(supportedFrameRates[supportedFrameRates.Count - 1]);

#if ENABLE_WINMD_SUPPORT
            // Get a spatial locator for the tracker
            var trackerNodeId = e.TrackerSpaceLocatorNodeId;
            _trackerLocator = Windows.Perception.Spatial.Preview.SpatialGraphInteropPreview.CreateLocatorForNode(trackerNodeId);
#endif

        }
        catch (Exception ex)
        {
            Debug.LogError("Unable to open EyeGazeTracker\r\n" + ex.ToString());
        }
    }

#if ENABLE_WINMD_SUPPORT
    /// <summary>
    /// Triggers a prompt to let the user decide whether to permit using eye tracking 
    /// </summary>
    private async Task<bool> AskForEyePosePermission()
    {
        var accessStatus = await Windows.Perception.People.EyesPose.RequestAccessAsync();
        Debug.Log("Eye gaze access status: " + accessStatus.ToString());
        return accessStatus == Windows.UI.Input.GazeInputAccessStatus.Allowed;
        //return true;
    }

    /// <summary>
    /// Checks if the active loader is of a specific type. Used in cases where the loader class is accessible, like OculusLoader.
    /// </summary>
    /// <typeparam name="T">The loader class type to check against the active loader.</typeparam>
    /// <returns>True if the active loader is of the specified type. Null if there isn't an active loader.</returns>
    public static bool? IsLoaderActive<T>() where T : UnityEngine.XR.Management.XRLoader
    {
        if (UnityEngine.XR.Management.XRGeneralSettings.Instance != null
            && UnityEngine.XR.Management.XRGeneralSettings.Instance.Manager != null
            && UnityEngine.XR.Management.XRGeneralSettings.Instance.Manager.activeLoader != null)
        {
            return UnityEngine.XR.Management.XRGeneralSettings.Instance.Manager.activeLoader is T;
        }

        return null;
    }
#endif // WINDOWS_UWP
```


## API Reference of Extended Eye Tracking SDK

Namespace: Microsoft.MixedReality.EyeTracking 

class                   | Description  |
------------------------|-------------------------------------------  |
EyeGazeTracker          | Represents an eye gaze tracker  |
EyeGazeTrackerFrameRate | Represents a Frame Rate supported by an Eye Tracker  |
EyeGazeTrackerRawValues | Enables access to values provided by a given driver but not yet "promoted" as strongly typed properties and methods of the SDK  |
EyeGazeTrackerReading   | Snapshot of Gaze Tracker state  |
EyeGazeTrackerWatcher   | Allow discovery of Eye Gaze Trackers connected to the system  |

### EyeGazeTracker

Represents an eye gaze tracker

**Properties**

Name                                                | Description   |
----------------------------------------------------|-------------------------------------------
public bool AreLeftAndRightGazesSupported { get; }	| True if individual gazes are supported  |
public bool IsEyeOpennessSupported { get; }	        | True if Eye Openness is supported by the driver  |
public bool IsRestrictedModeSupported { get; }	    |   |
public bool IsVergenceDistanceSupported { get; }	| True if Vergence Distance is supported by tracker.  |
public IReadOnlyList<EyeGazeTrackerFrameRate> SupportedTargetFrameRates { get; }  |	List of the target frame rates supported by the tracker  |
public Guid TrackerSpaceLocatorNodeId { get; }	    | NodeId of the Tracker allowing to retrieve a SpatialLocator using SpatialGraphInteropPreview.CreateLocatorForNode  |

**Methods**
    
Name                                                | Description   |
----------------------------------------------------|-------------------------------------------
public void Close()	                                | Closes the tracker  |
public Task OpenAsync(bool restrictedMode)          | Opens the tracker  |
public void SetTargetFrameRate(EyeGazeTrackerFrameRate newFrameRate)  |	Changes the target frame rate of the tracker  |
public EyeGazeTrackerReading TryGetReadingAfterSystemRelativeTime(TimeSpan time)  |	Try to get the first tracker state after a system relative time  |
public EyeGazeTrackerReading TryGetReadingAfterTimestamp(DateTime timestamp)  |	Try to get first first tracker state after a given timestamp  |
public EyeGazeTrackerReading TryGetReadingAtSystemRelativeTime(TimeSpan time) | Try to get tracker state at a system relative time  |
public EyeGazeTrackerReading TryGetReadingAtTimestamp(DateTime timestamp) |	Try to get tracker state at a given timestamp  |

### EyeGazeTrackerFrameRate

Represents a Frame Rate supported by an Eye Tracker

**Properties**
    
Name                                                | Description   |
----------------------------------------------------|-------------------------------------------
public uint FramesPerSecond { get; }	            | Frames per second of the frame rate  |

### EyeGazeTrackerRawValues

For each piece of data (Combined gaze, calibration state, individual gazes) incorporated into the tracker's published states, there's an associated GUID and a type.
    
The type associated to a GUID never changes, but each eye tracker might support different sets of GUID/type pairs. HoloLens 2 eye tracker supports different sets for its standard mode and its restricted mode.

The EyeGazeTrackerRawValues class enables an application to access new types of data that aren't yet part of the strongly typed part of the SDK, provided that the eye tracker team has provided a GUID, the associated data type, and its meaning.

**Methods**
    
Name                                                | Description   |
----------------------------------------------------|-------------------------------------------
public static bool IsSupported(EyeGazeTracker tracker, Guid valueKey) |	Return True if a value identified by its guid is supported by a tracker  |
public static void SendCommand(EyeGazeTracker tracker, Guid command, byte[] inBuffer, byte[] outBuffer)	| Sends a command to the tracker  |
public static bool TryGetBool(EyeGazeTrackerReading reading, Guid valueKey, out bool value) | Try to read a boolean value from a reading  |
public static bool TryGetFloat(EyeGazeTrackerReading reading, Guid valueKey, out float value) |	Try to read a float value from a reading  |
public static bool TryGetInt(EyeGazeTrackerReading reading, Guid valueKey, out int value) |	Try to read a int value from a reading  |
public static bool TryGetVector3(EyeGazeTrackerReading reading,	Guid valueKey, out Vector3 value) |	Try to read a vector3 value from a reading  |

### EyeGazeTrackerReading

Snapshot of Eye Gaze Tracker state at a given time

**Properties**
    
Name                                                | Description   |
----------------------------------------------------|-------------------------------------------
public bool IsCalibrationValid { get; }	            | Indicates if user calibration is valid  |
public TimeSpan SystemRelativeTime { get; }	        | Timestamp of state as system relative time  |
public DateTime Timestamp { get; }	                | Timestamp of state  |

**Methods**
    
Name                                                | Description 
----------------------------------------------------|-------------------------------------------
public bool TryGetCombinedEyeGazeInTrackerSpace(out Vector3 origin, out Vector3 direction) | Tries to get a vector representing the combined gaze related to the tracker's node position  |
public bool TryGetLeftEyeGazeInTrackerSpace(Vector3 origin, out Vector3 direction) | Tries to get a vector representing the left eye gaze related to the tracker's node position  |
public bool TryGetLeftEyeOpenness(out float value)  | Tries to get left eye openness information  |
public bool TryGetRightEyeGazeInTrackerSpace(out Vector3 origin, out Vector3 direction) | Tries to get a vector representing the right eye gaze related to the tracker's node position  |
public bool TryGetRightEyeOpenness(out float value) | Tries to get right Eye openness information  |
public bool TryGetVergenceDistance(out float value) | Tries to read vergence distance  |

### EyeGazeTrackerWatcher

Allow discovery of Eye Gaze Trackers connected to the system.

**Note**: this is the only class from the Extended Eye Tracking SDK that the application will instantiate. Other classes' instances will be returned by method calls or properties.

**Methods**
    
Name                                                | Description   |
----------------------------------------------------|-------------------------------------------
public EyeGazeTrackerWatcher()                      | Constructs an instance of the watcher  |
public Task StartAsync()                            | Starts tracker's enumeration  |
public void Stop()                                  | Stop listening to tracker's additions and removal  |

**Events**
    
Name                                                | Description   |
----------------------------------------------------|-------------------------------------------
public event EventHandler<EyeGazeTracker> EyeGazeTrackerAdded   | Raised when an Eye Gaze tracker is connected  |
public event EventHandler<EyeGazeTracker> EyeGazeTrackerRemoved | Raised when an Eye Gaze tracker is disconnected  |
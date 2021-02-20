# Extended Eye Tracking SDK

The Extended Eye Tracking SDK, enables applications to access data and features provided by Eye Trackers which are not necessary available through Windows API as trackers and drivers can evolve at a faster pace than Windows API.  All eye-related information provided by a device such as HoloLens 2 is available through the Extended Eye Tracking SDK, which is meant to be used in conjunction with Windows spatial APIs such as Windows.Perception.Spatial.SpatialCoordinateSystem class, allowing a smooth update of existing Windows Mixed Reality applications using eye tracking features.

## Using Extended Eye Tracking SDK

Using Extended Eye Tracking SDK requires a few basic steps:
- Obtain access to the Eye Tracking features,
- Watch for eye tracking device connections and disconnections,
- Open the device, query its capabilities, possibly configuring it,
- Repeatedly read gaze data provided by the device,
- Correlating gaze spatial data to other SpatialCoordinateSystems. 

### Get access to the Eye Tracking features

For standard eye gaze information, the steps needed are identical to those needed to access the eye gaze through Windows API:
- the application must have the [GazeInput capability](https://docs.microsoft.com/en-us/windows/uwp/packaging/app-capability-declarations) enabled,
- and it must request user consent through [EyesPose.RequestAccessAsync](https://docs.microsoft.com/en-us/uwp/api/windows.perception.people.eyespose.requestaccessasync?view=winrt-19041).

Some features provided by the Extended Eye Tracking SDK require an additional capability ([Requesting Access to Extended ET API](../develop/native/gaze-in-directx.md)).


 ```c#
 
var status = await Windows.Perception.People.EyesPose.RequestAccessAsync();
_useGaze = (status == Windows.UI.Input.GazeInputAccessStatus.Allowed);

```

 ```cpp
 
auto accessStatus = co_await winrt::Windows::Perception::People::EyesPose::RequestAccessAsync();
_useGaze = (accessStatus == winrt::Windows::UI::Input::GazeInputAccessStatus::Allowed);

```

## Eye tracking device detection

Device detection is made through the use of EyeGazeTrackerWatcher class. EyeGazeTrackerAdded and EyeGazeTrackerRemoved events are respectively raised when a eye gaze tracker is detected or disconnected.

The watcher must be explicitly started with StartAsync() method, which completes asynchronously when all already connected trackers have been signaled through EyeGazeTrackerAdded event.

When a tracker is detected, a EyeTracker instance is passed to the application in the EyeGazeTrackerAdded event parameters; reciprocally, when a tracker is disconnected, the corresponding EyeTracker instance is passed to the EyeGazeTrackerRemoved event.

 ```c#
 
_watcher = new Microsoft.MixedReality.EyeTracking.EyeGazeTrackerWatcher();
_watcher.EyeGazeTrackerAdded += _watcher_EyeGazeTrackerAdded;
_watcher.EyeGazeTrackerRemoved += _watcher_EyeGazeTrackerRemoved;
await _watcher.StartAsync();
...

private async void _watcher_EyeGazeTrackerAdded(object sender, EyeGazeTracker e)
{
...
}
private void _watcher_EyeGazeTrackerRemoved(object sender, EyeGazeTracker e)
{
...
}

```

 ```cpp
 
m_gazeTrackerAddedToken = m_gazeTrackerWatcher.EyeGazeTrackerAdded(std::bind(&SampleEyeTrackingNugetClientAppMain::OnEyeGazeTrackerAdded, this, _1, _2));
m_gazeTrackerRemovedToken = m_gazeTrackerWatcher.EyeGazeTrackerRemoved(std::bind(&SampleEyeTrackingNugetClientAppMain::OnEyeGazeTrackerRemoved, this, _1, _2));
co_await m_gazeTrackerWatcher.StartAsync();
...

winrt::Windows::Foundation::IAsyncAction SampleAppMain::OnEyeGazeTrackerAdded(const EyeGazeTrackerWatcher& sender, const EyeGazeTracker& tracker)
{
...
}
void SampleAppMain::OnEyeGazeTrackerRemoved(const EyeGazeTrackerWatcher& sender, const EyeGazeTracker& tracker)
{
...
}

```

## Opening Eye Tracking device

When receiving an EyeGazeTracker instance, the application must first open the device by calling OpenAsync() method, and it can then query for the device capabilities if needed.

OpenAsync() method takes a boolean parameter indicating if the application needs to access restricted features such as changing the device's camera frame rate, which require an custom capability. If an application requests access to these features without having this capability, an access denied exception will be raised.

Combined gaze is a mandatory feature supported by all eye gaze trackers. Other features such as access to individual gaze are optional and might be supported on not, depending on the tracker and its driver: for these optional features, the EyeGazeTracker class exposes a property indicating if the feature is or not supported, for example AreLeftAndRightGazesSupported for individual gaze information.

All spatial information exposed by tracker such as the combined gaze is published related to a unique point of reference for the tracker, identified by a **Dynamic Node Id**. This node Id allows the application to obtain a SpatialCoordinateSystem - in which the different gazes are expressed - which can be correlated to the other SpatialCoordinateSystem used by the application using this approach.


[Eye tracking](mixed-reality/mixed-reality-docs/mr-dev-docs/design/eye-tracking.md) details the current features of HoloLens 2 Eye gaze tracker.


```c#
 
private async void _watcher_EyeGazeTrackerAdded(object sender, EyeGazeTracker e)
{
    try
    {
        // Try to open the tracker in privileged mode
        await e.OpenAsync(true);

        // If it has succeeded, store it for future use
         _tracker = e;

        // Check support for individual eye gaze
        bool supportsIndividualEyeGaze = _tracker.AreLeftAndRightGazesSupported;

        // Get a spatial locator for the tracker
        var trackerNodeId = e.TrackerSpaceLocatorNodeId;
        trackerLocator = Windows.Perception.Spatial.Preview.SpatialGraphInteropPreview.CreateLocatorForNode(trackerNodeId);
    }
    catch (Exception ex)
    {
        // Unable to open the tracker, e.g. access denied if the application does
        // not have the privileged capability
    }
}

```

 ```cpp
 
winrt::Windows::Foundation::IAsyncAction SampleEyeTrackingNugetClientAppMain::OnEyeGazeTrackerAdded(const EyeGazeTrackerWatcher&, const EyeGazeTracker& tracker)
{
    auto newTracker = tracker;

    try
    {
        // Try to open the tracker in privileged mode
        co_await newTracker.OpenAsync(true);

        // If it has succeeded, store it for future use
        m_gazeTracker = newTracker;

        // Check support for individual eye gaze
        const bool supportsIndividualEyeGaze = m_gazeTracker.AreLeftAndRightGazesSupported();

        // Get a spatial locator for the tracker
        const auto trackerNodeId = m_gazeTracker.TrackerSpaceLocatorNodeId();
        m_trackerLocator = winrt::Windows::Perception::Spatial::Preview::SpatialGraphInteropPreview::CreateLocatorForNode(trackerNodeId);
    }
    catch (const winrt::hresult_error& e)
    {
        // Unable to open the tracker, e.g. access denied if the application does
        // not have the privileged capability
    }
}

```

If the application requires it and has the associated capability, it might be able to change the tracker's camera framerate: EyeGazeTracker.SupportedTargetFrameRates property returns the list of supported target framerates supported by the tracker, EyeGazeTracker.SetTargetFrameRate() method sets the target frame rate.

```c#

var supportedFrameRates = _tracker.SupportedTargetFrameRates;
if (supportedFrameRates.Count >= 2)
{
    // Sets the tracker at the highest supported framerate
    var newFrameRate = supportedFrameRates[supportedFrameRates.Count - 1];
    _tracker.SetTargetFrameRate(newFrameRate);
    uint newFramesPerSecond = newFrameRate.FramesPerSecond;
}

```

 ```cpp
 
const auto supportedFrameRates = m_gazeTracker.SupportedTargetFrameRates();
if (supportedFrameRates.Size() >= 2)
{
    // Sets the tracker at the highest supported framerate
    const auto newFrameRate = supportedFrameRates.GetAt(supportedFrameRates.Size() - 1);
    m_gazeTracker.SetTargetFrameRate(newFrameRate);
    const uint32_t newFramesPerSecond = newFrameRate.FramesPerSecond();
}

```

## Read gaze data

An Eye Gaze tracker publishes its states periodically in a circular buffer, which enables the application to read the state of the tracker at a time belonging to a small time span, allowing for example to retrieve the most recent state of the tracker, or its state at the time of some event such as a hand gesture from the user.

For methods retrieve the tracker state as a EyeGazeTrackerReading instance:

- TryGetReadingAtTimestamp() and TryGetReadingAtSystemRelativeTime() methods return the EyeGazeTrackerReading closest to the time passed by the application. As the tracker controls the publishing schedule, the returned reading might be slightly older or newer than the request time: EyeGazeTrackerReading's Timestamp and SystemRelativeTime properties enable the application to know the exact time of the published state.
- TryGetReadingAfterTimestamp() and TryGetReadingAfterSystemRelativeTime() methods return the first EyeGazeTrackerReading with a timestamp strictly superior to the time passed as a parameter: this enables an application to read sequentially all the states published by the tracker.
Note that all these methods are querying the existing buffer and return immediately: if no state is available, they will return null (i.e. they won't make the application wait for a state to be published).

In addition to its timestamp, an EyeGazeTrackerReading instance has a IsCalibrationValid property indicating if the eye tracker calibration is valid or not.

Finally, gaze data can be retrieved through a set of methods such as TryGetCombinedEyeGazeInTrackerSpace() or TryGetLeftEyeGazeInTrackerSpace(). All these methods return a boolean indicating a success. Failure to get some data might either mean that the data is not supported (EyeGazeTracker has properties to detect this case) or that the tracker could not get the data (invalid calibration, eye hidden, etc).

If for example, the application wants to display a cursor corresponding to the combined gaze, it can query the tracker using timestamp of the prediction of the frame being prepared:

```c#
 
var holographicFrame = holographicSpace.CreateNextFrame();
var prediction = holographicFrame.CurrentPrediction;
var predictionTimestamp = prediction.Timestamp;
var reading = _tracker.TryGetReadingAtTimestamp(predictionTimestamp.TargetTime.DateTime);
if (reading != null)
{
    if (reading.TryGetCombinedEyeGazeInTrackerSpace(out Vector3 gazeOrigin, out Vector3 gazeDirection))
    {
        // Use gazeOrigin and gazeDirection to display the cursor
    }
}

```

 ```cpp
 
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
## Correlating Spatial gaze data with other SpatialCoordinateSystem from the application

Windows Spatial APIs which return spatial data such as a position always require both a PerceptionTimestamp and a SpatialCoordinateSystem, for example, to retrieve the combined gaze of HoloLens2 Eye tracker using Windows API, the application first calls SpatialPointerPose.TryGetAtTimestamp() which has these two parameters: when the combined gaze is then accessed through SpatialPointerPose.Eyes.Gaze, its origin and direction are expressed in the SpatialCoordinateSystem initially passed to SpatialPointerPose.TryGetAtTimestamp().

Eye Tracking Extended SDK methods do not use any of the Windows spatial API classes; they can be correlated to these classes using Windows.Perception.Spatial.SpatialLocator class:

- call Windows.Perception.Spatial.Preview.SpatialGraphInteropPreview.CreateLocatorForNode() with the TrackerSpaceLocatorNodeId property of the Eye Gaze Tracker instance to get a SpatialLocator for the Eye gaze tracker
- positions and origins retrieved through the EyeGazeTracker reading are related to this SpatialLocator
- SpatialLocator.TryLocateAtTimestamp() returns the full 6DOF location of the tracker at a given PerceptionTimeStamp and related to a given SpatialCoordinateSystem


To illustrate further this, here are two code samples which compute the position of a point located in the direction of the combined gaze, 2 meters in front of the gaze origin; first sample is using Windows APIs, second sample is using Eye Tracking Extended SDK for Eye Gaze, both will return the same position.

### Using Windows API

```c#
var predictionTimestamp = prediction.Timestamp;
var stationaryCS = stationaryReferenceFrame.CoordinateSystem;
var pointerPose = SpatialPointerPose.TryGetAtTimestamp(stationaryCS, predictionTimestamp);
if (pointerPose != null)
{
    var eyes = pointerPose.Eyes;
    if (eyes != null)
    {
        var combinedGaze = eyes.Gaze;
        if (combinedGaze != null)
        {
            var gazeRay = combinedGaze.Value;
            var positionInStationaryCS = gazeRay.Origin + 2.0f * gazeRay.Direction;
        }
    }
}

```

### Using Eye Tracking extended SDK

```c#
var predictionTimestamp = prediction.Timestamp;
var stationaryCS = stationaryReferenceFrame.CoordinateSystem;
var trackerLocation = trackerLocator.TryLocateAtTimestamp(predictionTimestamp, stationaryCS);
var trackerToStationaryMatrix = Matrix4x4.CreateFromQuaternion(trackerLocation.Orientation) * Matrix4x4.CreateTranslation(trackerLocation.Position);
if (trackerLocation != null)
{
    var reading = _tracker.TryGetReadingAtTimestamp(predictionTimestamp.TargetTime.DateTime);
    if (reading != null)
    {
        if (reading.TryGetCombinedEyeGazeInTrackerSpace(out Vector3 gazeOriginInTrackerSpace, out Vector3 gazeDirectionInTrackerSpace))
        {
            var positionInTrackerSpace = gazeOriginInTrackerSpace + 2.0f * gazeDirectionInTrackerSpace;
            var positionInStationaryCS = Vector3.Transform(gazeCubeLocation, trackerToStationaryMatrix);
        }
    }
}

```




## Microsoft.MixedReality.EyeTracking reference



<table >
                                                                        <colgroup>
                                                                                <col />
                                                                                <col />
                                                                        </colgroup>
                                                                        <tbody>
                                                                                <tr>
                                                                                        <th >Class
                                                                                        </th>
                                                                                        <th >
                                                                                                Description</th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td >
                                                                                                <p><span ><a
                                                                                                                        href="#ExtendedEyeTrackingSDK-EyeGazeTracker">EyeGazeTracker</a></span>
                                                                                                </p>
                                                                                        </td>
                                                                                        <td >
                                                                                                Represents an Eye
                                                                                                Tracker device</td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td ><a
                                                                                                        href="#ExtendedEyeTrackingSDK-EyeGazeTrackerFrameRate">EyeGazeTrackerFrameRate</a>
                                                                                        </td>
                                                                                        <td >
                                                                                                Represents a Frame Rate
                                                                                                supported by an Eye
                                                                                                Tracker</td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td ><a
                                                                                                        href="#ExtendedEyeTrackingSDK-EyeGazeTrackerRawValues">EyeGazeTrackerRawValues</a>
                                                                                        </td>
                                                                                        <td >Enables
                                                                                                access to values
                                                                                                provided by a given
                                                                                                driver but not yet
                                                                                                &quot;promoted&quot; as
                                                                                                strongly typed
                                                                                                properties and methods
                                                                                                of the SDK</td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td ><a
                                                                                                        href="#ExtendedEyeTrackingSDK-EyeGazeTrackerReading">EyeGazeTrackerReading</a>
                                                                                        </td>
                                                                                        <td >
                                                                                                Snapshot of Gaze Tracker
                                                                                                state</td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td ><a
                                                                                                        href="#ExtendedEyeTrackingSDK-EyeGazeTrackerWatcher">EyeGazeTrackerWatcher</a>
                                                                                        </td>
                                                                                        <td >Allow
                                                                                                discovery of Eye Gaze
                                                                                                Trackers connected to
                                                                                                the system</td>
                                                                                </tr>
                                                                        </tbody>
                                                                </table>
                                                      



### EyeGazeTracker

Represents an Eye Tracker device

<table >
                                                                        <colgroup>
                                                                                <col />
                                                                                <col />
                                                                        </colgroup>
                                                                        <tbody>
                                                                                <tr>
                                                                                        <th colspan="2"
                                                                                                >
                                                                                                <strong>Properties</strong>
                                                                                        </th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <th >Name
                                                                                        </th>
                                                                                        <th >
                                                                                                Description</th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >bool</span> <span >AreLeftAndRightGazesSupported</span> { <span  style="color: rgb(0,0,255);">get</span>; }</pre>
                                                                                        </td>
                                                                                        <td >True if
                                                                                                individual gazes are
                                                                                                supported</td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >bool</span> <span >IsEyeOpennessSupported</span> { <span  style="color: rgb(0,0,255);">get</span>; }</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                True if Eye Openness is
                                                                                                supported by the driver
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >bool</span> <span >IsRestrictedModeSupported</span> { <span  style="color: rgb(0,0,255);">get</span>; }</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <br /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >bool</span> <span >IsVergenceDistanceSupported</span> { <span  style="color: rgb(0,0,255);">get</span>; }</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                True if Vergence
                                                                                                Distance is supported by
                                                                                                tracker.</td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >IReadOnlyList</span>&lt;<span >EyeGazeTrackerFrameRate</span>&gt; <span >SupportedTargetFrameRates</span> { <span  style="color: rgb(0,0,255);">get</span>; }</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                List of the target
                                                                                                framerates supported by
                                                                                                the tracker</td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >Guid</span> <span >TrackerSpaceLocatorNodeId</span> { <span  style="color: rgb(0,0,255);">get</span>; }</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <span
                                                                                                        style="color: rgb(0,0,0);">NodeId
                                                                                                        of the Tracker
                                                                                                        allowing to
                                                                                                        retrieve a
                                                                                                        SpatialLocator
                                                                                                        using
                                                                                                        SpatialGraphInteropPreview.CreateLocatorForNode</span>
                                                                                        </td>
                                                                                </tr>
                                                                        </tbody>
                                                                </table>
                                                        </div>

 <div >
                                                                <table >
                                                                        <colgroup>
                                                                                <col />
                                                                                <col />
                                                                        </colgroup>
                                                                        <tbody>
                                                                                <tr>
                                                                                        <th colspan="2"
                                                                                                >
                                                                                                <strong>Methods</strong>
                                                                                        </th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <th >Name
                                                                                        </th>
                                                                                        <th >
                                                                                                Description</th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span  style="color: rgb(0,0,255);">void</span> <span >Close</span>()</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <span
                                                                                                        style="color: rgb(0,0,0);">Closes
                                                                                                        the
                                                                                                        tracker</span>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >Task</span> <span >OpenAsync</span>(
	<span >bool</span> <span >restrictedMode</span>
)</pre>
                                                                                        </td>
                                                                                        <td >
                                                                                                <p>Opens the tracker</p>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span  style="color: rgb(0,0,255);">void</span> <span >SetTargetFrameRate</span>(
	<span >EyeGazeTrackerFrameRate</span> <span >newFrameRate</span>
)</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <span
                                                                                                        style="color: rgb(0,0,0);">Changes
                                                                                                        the target
                                                                                                        framerate of the
                                                                                                        tracker</span>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >EyeGazeTrackerReading</span> <span >TryGetReadingAfterSystemRelativeTime</span>(
	<span >TimeSpan</span> <span >time</span>
)</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <span
                                                                                                        style="color: rgb(0,0,0);">Try
                                                                                                        to get the first
                                                                                                        tracker state
                                                                                                        after a system
                                                                                                        relative
                                                                                                        time</span></td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >EyeGazeTrackerReading</span> <span >TryGetReadingAfterTimestamp</span>(
	<span >DateTime</span> <span >timestamp</span>
)</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <span
                                                                                                        style="color: rgb(0,0,0);">Try
                                                                                                        to get first
                                                                                                        first tracker
                                                                                                        state after a
                                                                                                        given
                                                                                                        timestamp</span>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >EyeGazeTrackerReading</span> <span >TryGetReadingAtSystemRelativeTime</span>(
	<span >TimeSpan</span> <span >time</span>
)</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <span
                                                                                                        style="color: rgb(0,0,0);">Try
                                                                                                        to get tracker
                                                                                                        state at a
                                                                                                        system relative
                                                                                                        time</span></td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >EyeGazeTrackerReading</span> <span >TryGetReadingAtTimestamp</span>(
	<span >DateTime</span> <span >timestamp</span>
)</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <span
                                                                                                        style="color: rgb(0,0,0);">Try
                                                                                                        to get tracker
                                                                                                        state at a given
                                                                                                        timestamp</span>
                                                                                        </td>
                                                                                </tr>
                                                                        </tbody>
                                                                </table>
                                                        </div>
                                                        
 
### EyeGazeTrackerFrameRate

Represents a Frame Rate supported by an Eye Tracker

 <div >
                                                                <table >
                                                                        <colgroup>
                                                                                <col />
                                                                                <col />
                                                                        </colgroup>
                                                                        <tbody>
                                                                                <tr>
                                                                                        <th colspan="2"
                                                                                                >
                                                                                                <strong>Properties</strong>
                                                                                        </th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <th >Name
                                                                                        </th>
                                                                                        <th >
                                                                                                Description</th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >uint</span> <span >FramesPerSecond</span> { <span  style="color: rgb(0,0,255);">get</span>; }</pre>
                                                                                        </td>
                                                                                        <td >Frames
                                                                                                per second of the frame
                                                                                                rate</td>
                                                                                </tr>
                                                                        </tbody>
                                                                </table>
                                                        </div>
                                                        
### EyeGazeTrackerRawValues 

To each data (Combined gaze, calibration state, individual gazes) incorporated in the tracker's published states is associated a GUID and a type. The type associated to a GUID never changes, but every eye tracker might support different sets of GUID/type pairs. HoloLens 2 eye tracker support different sets for its standard mode and its restricted mode.

EyeGazeTrackerRawValues class enables an application to access new type of data which is not yet part of the strongly typed part of the SDK, provided that the eye tracker team has provided a GUID, the associated data type and its meaning.

<div >
                                                                <table >
                                                                        <colgroup>
                                                                                <col />
                                                                                <col />
                                                                        </colgroup>
                                                                        <tbody>
                                                                                <tr>
                                                                                        <th colspan="2"
                                                                                                >
                                                                                                <strong>Methods</strong>
                                                                                        </th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <th >Name
                                                                                        </th>
                                                                                        <th >
                                                                                                Description</th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span  style="color: rgb(0,0,255);">static</span> <span >bool</span> <span >IsSupported</span>(
	<span >EyeGazeTracker</span> <span >tracker</span>,
	<span >Guid</span> <span >valueKey</span>
)</pre>
                                                                                        </td>
                                                                                        <td ><span
                                                                                                        style="color: rgb(0,0,0);">Return
                                                                                                        True if a value
                                                                                                        identified by
                                                                                                        its guid is
                                                                                                        supported by a
                                                                                                        tracker</span>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span  style="color: rgb(0,0,255);">static</span> <span  style="color: rgb(0,0,255);">void</span> <span >SendCommand</span>(
	<span >EyeGazeTracker</span> <span >tracker</span>,
	<span >Guid</span> <span >command</span>,
	<span >byte</span>[] <span >inBuffer</span>,
	<span >byte</span>[] <span >outBuffer</span>
)</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <span
                                                                                                        style="color: rgb(0,0,0);">Sends
                                                                                                        a command to the
                                                                                                        tracker</span>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span  style="color: rgb(0,0,255);">static</span> <span >bool</span> <span >TryGetBool</span>(
	<span >EyeGazeTrackerReading</span> <span >reading</span>,
	<span >Guid</span> <span >valueKey</span>,
	<span  style="color: rgb(0,0,255);">out</span> <span >bool</span> <span >value</span>
)</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <span
                                                                                                        style="color: rgb(0,0,0);">Try
                                                                                                        to read a
                                                                                                        boolean value
                                                                                                        from a
                                                                                                        reading</span>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span  style="color: rgb(0,0,255);">static</span> <span >bool</span> <span >TryGetFloat</span>(
	<span >EyeGazeTrackerReading</span> <span >reading</span>,
	<span >Guid</span> <span >valueKey</span>,
	<span  style="color: rgb(0,0,255);">out</span> <span >float</span> <span >value</span>
)</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <p>Try to read a float
                                                                                                        value from a
                                                                                                        reading</p>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span  style="color: rgb(0,0,255);">static</span> <span >bool</span> <span >TryGetInt</span>(
	<span >EyeGazeTrackerReading</span> <span >reading</span>,
	<span >Guid</span> <span >valueKey</span>,
	<span  style="color: rgb(0,0,255);">out</span> <span >int</span> <span >value</span>
)</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <span
                                                                                                        style="color: rgb(0,0,0);">Try
                                                                                                        to read a int
                                                                                                        value from a
                                                                                                        reading</span>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span  style="color: rgb(0,0,255);">static</span> <span >bool</span> <span >TryGetVector3</span>(
	<span >EyeGazeTrackerReading</span> <span >reading</span>,
	<span >Guid</span> <span >valueKey</span>,
	<span  style="color: rgb(0,0,255);">out</span> <span >Vector3</span> <span >value</span>
)</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <span
                                                                                                        style="color: rgb(0,0,0);">Try
                                                                                                        to read a
                                                                                                        vector3 value
                                                                                                        from a
                                                                                                        reading</span>
                                                                                        </td>
                                                                                </tr>
                                                                        </tbody>
                                                                </table>
                                                        </div>
                                                        
### EyeGazeTrackerReading

Snapshot of Eye Gaze Tracker state at a given time

<table >
                                                                        <colgroup>
                                                                                <col />
                                                                                <col />
                                                                        </colgroup>
                                                                        <tbody>
                                                                                <tr>
                                                                                        <th colspan="2"
                                                                                                >
                                                                                                <strong>Properties</strong>
                                                                                        </th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <th >Name
                                                                                        </th>
                                                                                        <th >
                                                                                                Description</th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >bool</span> <span >IsCalibrationValid</span> { <span  style="color: rgb(0,0,255);">get</span>; }</pre>
                                                                                        </td>
                                                                                        <td ><span
                                                                                                        style="color: rgb(0,0,0);">Indicates
                                                                                                        if user
                                                                                                        calibration is
                                                                                                        valid</span>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >TimeSpan</span> <span >SystemRelativeTime</span> { <span  style="color: rgb(0,0,255);">get</span>; }</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <span
                                                                                                        style="color: rgb(0,0,0);">Timestamp
                                                                                                        of state as
                                                                                                        system relative
                                                                                                        time</span></td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >DateTime</span> <span >Timestamp</span> { <span  style="color: rgb(0,0,255);">get</span>; }</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <span
                                                                                                        style="color: rgb(0,0,0);">Timestamp
                                                                                                        of state</span>
                                                                                        </td>
                                                                                </tr>
                                                                        </tbody>
                                                                </table>
                                                        </div>
                                                        
<div >
                                                                <table >
                                                                        <colgroup>
                                                                                <col />
                                                                                <col />
                                                                        </colgroup>
                                                                        <tbody>
                                                                                <tr>
                                                                                        <th colspan="2"
                                                                                                >
                                                                                                <strong>Methods</strong>
                                                                                        </th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <th >Name
                                                                                        </th>
                                                                                        <th >
                                                                                                Description</th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >bool</span> <span >TryGetCombinedEyeGazeInTrackerSpace</span>(
	<span  style="color: rgb(0,0,255);">out</span> <span >Vector3</span> <span >origin</span>,
	<span  style="color: rgb(0,0,255);">out</span> <span >Vector3</span> <span >direction</span>
)</pre>
                                                                                        </td>
                                                                                        <td >
                                                                                                <p>Tries to get a vector
                                                                                                        representing the
                                                                                                        combined gaze
                                                                                                        related to the
                                                                                                        tracker's node
                                                                                                        position</p>
                                                                                                <p><br /></p>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >bool</span> <span >TryGetLeftEyeGazeInTrackerSpace</span>(
	<span  style="color: rgb(0,0,255);">out</span> <span >Vector3</span> <span >origin</span>,
	<span  style="color: rgb(0,0,255);">out</span> <span >Vector3</span> <span >direction</span>
)</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <span
                                                                                                        style="color: rgb(0,0,0);">Tries
                                                                                                        to get a vector
                                                                                                        representing the
                                                                                                        left eye gaze
                                                                                                        related to the
                                                                                                        tracker's node
                                                                                                        position</span>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >bool</span> <span >TryGetLeftEyeOpenness</span>(
	<span  style="color: rgb(0,0,255);">out</span> <span >float</span> <span >value</span>
)</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <span
                                                                                                        style="color: rgb(0,0,0);">Tries
                                                                                                        to get left Eye
                                                                                                        openness
                                                                                                        information</span>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >bool</span> <span >TryGetRightEyeGazeInTrackerSpace</span>(
	<span  style="color: rgb(0,0,255);">out</span> <span >Vector3</span> <span >origin</span>,
	<span  style="color: rgb(0,0,255);">out</span> <span >Vector3</span> <span >direction</span>
)</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <p>Tries to get a vector
                                                                                                        representing the
                                                                                                        right eye gaze
                                                                                                        related to the
                                                                                                        tracker's node
                                                                                                        position</p>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >bool</span> <span >TryGetRightEyeOpenness</span>(
	<span  style="color: rgb(0,0,255);">out</span> <span >float</span> <span >value</span>
)</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <span
                                                                                                        style="color: rgb(0,0,0);">Tries
                                                                                                        to get right Eye
                                                                                                        openness
                                                                                                        information</span>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >bool</span> <span >TryGetVergenceDistance</span>(
	<span  style="color: rgb(0,0,255);">out</span> <span >float</span> <span >value</span>
)</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <p>Tries to read
                                                                                                        vergence
                                                                                                        distance</p>
                                                                                        </td>
                                                                                </tr>
                                                                        </tbody>
                                                                </table>
                                                        </div>
                                                        
 
### EyeGazeTrackerWatcher

Allow discovery of Eye Gaze Trackers connected to the system.

Note: this is the only class from Extended Eye Tracking SDK that the application will instanciate, other classes' instances will be returned by method calls or properties.

<table >
                                                                        <colgroup>
                                                                                <col />
                                                                                <col />
                                                                        </colgroup>
                                                                        <tbody>
                                                                                <tr>
                                                                                        <th colspan="2"
                                                                                                >
                                                                                                <strong>Constructors</strong>
                                                                                        </th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <th >Name
                                                                                        </th>
                                                                                        <th >
                                                                                                Description</th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >EyeGazeTrackerWatcher</span>()</pre>
                                                                                        </td>
                                                                                        <td ><span
                                                                                                        style="color: rgb(0,0,0);">Constructs
                                                                                                        an instance of
                                                                                                        the
                                                                                                        watcher</span>
                                                                                        </td>
                                                                                </tr>
                                                                        </tbody>
                                                                </table>
                                                        </div>
                                                        

<div >
                                                                <table >
                                                                        <colgroup>
                                                                                <col />
                                                                                <col />
                                                                        </colgroup>
                                                                        <tbody>
                                                                                <tr>
                                                                                        <th colspan="2"
                                                                                                >
                                                                                                <strong>Methods</strong>
                                                                                        </th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <th >Name
                                                                                        </th>
                                                                                        <th >
                                                                                                Description</th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span >Task</span> <span >StartAsync</span>()</pre>
                                                                                        </td>
                                                                                        <td >
                                                                                                <p>Starts trackers
                                                                                                        enumeration.</p>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> <span  style="color: rgb(0,0,255);">void</span> <span >Stop</span>()</pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <p>Stop listening to
                                                                                                        trackers
                                                                                                        additions and
                                                                                                        removal</p>
                                                                                        </td>
                                                                                </tr>
                                                                        </tbody>
                                                                </table>
                                                        </div>
                                                        
 
 <div >
                                                                <table >
                                                                        <colgroup>
                                                                                <col />
                                                                                <col />
                                                                        </colgroup>
                                                                        <tbody>
                                                                                <tr>
                                                                                        <th colspan="2"
                                                                                                >
                                                                                                <strong>Events</strong>
                                                                                        </th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <th >Name
                                                                                        </th>
                                                                                        <th >
                                                                                                Description</th>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> event <span >EventHandler</span>&lt;<span >EyeGazeTracker</span>&gt; <span >EyeGazeTrackerAdded</span></pre>
                                                                                        </td>
                                                                                        <td ><span
                                                                                                        style="color: rgb(0,0,0);">Raised
                                                                                                        when an Eye Gaze
                                                                                                        tracker is
                                                                                                        connected</span>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <pre><span  style="color: rgb(0,0,255);">public</span> event <span >EventHandler</span>&lt;<span >EyeGazeTracker</span>&gt; <span >EyeGazeTrackerRemoved</span></pre>
                                                                                        </td>
                                                                                        <td colspan="1"
                                                                                                >
                                                                                                <span
                                                                                                        style="color: rgb(0,0,0);">Raised
                                                                                                        when an Eye Gaze
                                                                                                        tracker is
                                                                                                        disconnected</span>
                                                                                        </td>
                                                                                </tr>
                                                                        </tbody>
                                                                </table>
                                                        </div>
                                                        




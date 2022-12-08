---
title: Locatable camera
description: Code samples that address the HoloLens front-facing camera, how it works, and the profiles and resolutions available to developers.
author: vtieto
ms.author: vinnietieto
ms.date: 11/30/2022
ms.topic: article
keywords: camera, hololens, color camera, front facing, hololens 2, cv, computer vision, fiducial, markers, qr code, qr, photo, video, locatable
---

# Locatable camera

Before getting started here, we recommend that you take a look at our [Locatable camera overview](../advanced-concepts/locatable-camera-overview.md) article which contains overview information and a table with HoloLens 1 and 2 camera details.

### Using MediaFrameReference

These instructions apply if you're using the [MediaFrameReference](/uwp/api/windows.media.capture.frames.mediaframereference) class to read image frames from the camera.

Each image frame (whether photo or video) includes a [SpatialCoordinateSystem](/uwp/api/windows.perception.spatial.spatialcoordinatesystem) rooted at the camera at the time of capture, which can be accessed using the [CoordinateSystem](/uwp/api/windows.media.capture.frames.mediaframereference.coordinatesystem#Windows_Media_Capture_Frames_MediaFrameReference_CoordinateSystem) property of your [MediaFrameReference](/uwp/api/Windows.Media.Capture.Frames.MediaFrameReference). Each frame contains a description of the camera lens model, which can be found in the [CameraIntrinsics](/uwp/api/windows.media.capture.frames.videomediaframe.cameraintrinsics#Windows_Media_Capture_Frames_VideoMediaFrame_CameraIntrinsics) property. Together, these transforms define for each pixel a ray in 3D space representing the path taken by the photons that produced the pixel. These rays can be related to other content in the app by obtaining the transform from the frame's coordinate system to some other coordinate system (e.g. from a [stationary frame of reference](../../design/coordinate-systems.md#stationary-frame-of-reference)). 

Each image frame provides the following:
* Pixel Data (in RGB/NV12/JPEG/etc. format)
* A [SpatialCoordinateSystem](/uwp/api/windows.perception.spatial.spatialcoordinatesystem) from the location of capture
* A [CameraIntrinsics](/uwp/api/windows.media.capture.frames.videomediaframe.cameraintrinsics#Windows_Media_Capture_Frames_VideoMediaFrame_CameraIntrinsics) class containing the lens mode of the camera

The [HolographicFaceTracking sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/HolographicFaceTracking) shows the fairly straightforward way to query for the transform between the camera's coordinate system and your own application coordinate systems.

### Using Media Foundation

If you are using Media Foundation directly to read image frames from the camera, you can use each frame's [MFSampleExtension_CameraExtrinsics attribute](/windows/win32/medfound/mfsampleextension-cameraextrinsics) and [MFSampleExtension_PinholeCameraIntrinsics attribute](/windows/win32/medfound/mfsampleextension-pinholecameraintrinsics) to locate camera frames relative to your application's other coordinate systems, as shown in this sample code:

```cpp
#include <winrt/windows.perception.spatial.preview.h>
#include <mfapi.h>
#include <mfidl.h>
 
using namespace winrt::Windows::Foundation;
using namespace winrt::Windows::Foundation::Numerics;
using namespace winrt::Windows::Perception;
using namespace winrt::Windows::Perception::Spatial;
using namespace winrt::Windows::Perception::Spatial::Preview;
 
class CameraFrameLocator
{
public:
    struct CameraFrameLocation
    {
        SpatialCoordinateSystem CoordinateSystem;
        float4x4 CameraViewToCoordinateSystemTransform;
        MFPinholeCameraIntrinsics Intrinsics;
    };
 
    std::optional<CameraFrameLocation> TryLocateCameraFrame(IMFSample* pSample)
    {
        MFCameraExtrinsics cameraExtrinsics;
        MFPinholeCameraIntrinsics cameraIntrinsics;
        UINT32 sizeCameraExtrinsics = 0;
        UINT32 sizeCameraIntrinsics = 0;
        UINT64 sampleTimeHns = 0;
 
        // query sample for calibration and validate
        if (FAILED(pSample->GetUINT64(MFSampleExtension_DeviceTimestamp, &sampleTimeHns)) ||
            FAILED(pSample->GetBlob(MFSampleExtension_CameraExtrinsics, (UINT8*)& cameraExtrinsics, sizeof(cameraExtrinsics), &sizeCameraExtrinsics)) ||
            FAILED(pSample->GetBlob(MFSampleExtension_PinholeCameraIntrinsics, (UINT8*)& cameraIntrinsics, sizeof(cameraIntrinsics), &sizeCameraIntrinsics)) ||
            (sizeCameraExtrinsics != sizeof(cameraExtrinsics)) ||
            (sizeCameraIntrinsics != sizeof(cameraIntrinsics)) ||
            (cameraExtrinsics.TransformCount == 0))
        {
            return std::nullopt;
        }
 
        // compute extrinsic transform
        const auto& calibratedTransform = cameraExtrinsics.CalibratedTransforms[0];
        const GUID& dynamicNodeId = calibratedTransform.CalibrationId;
        const float4x4 cameraToDynamicNode =
            make_float4x4_from_quaternion(quaternion{ calibratedTransform.Orientation.x, calibratedTransform.Orientation.y, calibratedTransform.Orientation.z, calibratedTransform.Orientation.w }) *
            make_float4x4_translation(calibratedTransform.Position.x, calibratedTransform.Position.y, calibratedTransform.Position.z);
 
        // update locator cache for dynamic node
        if (dynamicNodeId != m_currentDynamicNodeId || !m_locator)
        {
            m_locator = SpatialGraphInteropPreview::CreateLocatorForNode(dynamicNodeId);
            if (!m_locator)
            {
                return std::nullopt;
            }
 
            m_frameOfReference = m_locator.CreateAttachedFrameOfReferenceAtCurrentHeading();
            m_currentDynamicNodeId = dynamicNodeId;
        }
 
        // locate dynamic node
        auto timestamp = PerceptionTimestampHelper::FromSystemRelativeTargetTime(TimeSpan{ sampleTimeHns });
        auto coordinateSystem = m_frameOfReference.GetStationaryCoordinateSystemAtTimestamp(timestamp);
        auto location = m_locator.TryLocateAtTimestamp(timestamp, coordinateSystem);
        if (!location)
        {
            return std::nullopt;
        }
 
        const float4x4 dynamicNodeToCoordinateSystem = make_float4x4_from_quaternion(location.Orientation()) * make_float4x4_translation(location.Position());
 
        return CameraFrameLocation{ coordinateSystem, cameraToDynamicNode * dynamicNodeToCoordinateSystem, cameraIntrinsics };
    }

private:
    GUID m_currentDynamicNodeId{ GUID_NULL };
    SpatialLocator m_locator{ nullptr };
    SpatialLocatorAttachedFrameOfReference m_frameOfReference{ nullptr };
};
```
## Locatable Camera Usage Scenarios

### Show a photo or video in the world where it was captured

The Device Camera frames come with a "Camera To World" transform, that can be used to show exactly where the device was when the image was taken. For example, you could position a small holographic icon at this location (CameraToWorld.MultiplyPoint(Vector3.zero)) and even draw a little arrow in the direction that the camera was facing (CameraToWorld.MultiplyVector(Vector3.forward)).

### Frame Rate

Keeping an interactive application frame-rate is critical, especially when dealing with long-running image recognition algorithms. For this reason, we commonly use the following pattern:
1. Main Thread: manages the camera object
2. Main Thread: requests new frames (async)
3. Main Thread: pass new frames to tracking thread
4. Tracking Thread: processes image to collect key points
5. Main Thread: moves virtual model to match found key points
6. Main Thread: repeat from step 2

Some image marker systems only provide a single pixel location (others provide the full transform in which case this section won't be needed), which equates to a ray of possible locations. To get to a single third location, we can then leverage multiple rays and find the final result by their approximate intersection. To do this, you'll need to:
1. Get a loop going collecting multiple camera images
2. Find the associated feature points, and their world rays
3. When you have a dictionary of features, each with multiple world rays, you can use the following code to solve for the intersection of those rays:

```
public static Vector3 ClosestPointBetweenRays(
   Vector3 point1, Vector3 normalizedDirection1,
   Vector3 point2, Vector3 normalizedDirection2) {
   float directionProjection = Vector3.Dot(normalizedDirection1, normalizedDirection2);
   if (directionProjection == 1) {
     return point1; // parallel lines
   }
   float projection1 = Vector3.Dot(point2 - point1, normalizedDirection1);
   float projection2 = Vector3.Dot(point2 - point1, normalizedDirection2);
   float distanceAlongLine1 = (projection1 - directionProjection * projection2) / (1 - directionProjection * directionProjection);
   float distanceAlongLine2 = (projection2 - directionProjection * projection1) / (directionProjection * directionProjection - 1);
   Vector3 pointOnLine1 = point1 + distanceAlongLine1 * normalizedDirection1;
   Vector3 pointOnLine2 = point2 + distanceAlongLine2 * normalizedDirection2;
   return Vector3.Lerp(pointOnLine2, pointOnLine1, 0.5f);
 }
```
### Positioning a modeled scene

Given two or more tracked tag locations, you can position a modeled scene to fit the user's current scenario. If you can't assume gravity, then you'll need three tag locations. In many cases, we use a color scheme where white spheres represent real-time tracked tag locations, and blue spheres represent modeled tag locations. This allows the user to visually gauge the alignment quality. We assume the following setup in all our applications:
* Two or more modeled tag locations
* One 'calibration space', which in the scene is the parent of the tags
* Camera feature identifier
* Behavior, which moves the calibration space to align the modeled tags with the real-time tags (we're careful to move the parent space, not the modeled markers themselves, because other connect is positions relative to them).

```
// In the two tags case:
 Vector3 idealDelta = (realTags[1].EstimatedWorldPos - realTags[0].EstimatedWorldPos);
 Vector3 curDelta = (modelledTags[1].transform.position - modelledTags[0].transform.position);
 if (IsAssumeGravity) {
   idealDelta.y = 0;
   curDelta.y = 0;
 }
 Quaternion deltaRot = Quaternion.FromToRotation(curDelta, idealDelta);
 trans.rotation = Quaternion.LookRotation(deltaRot * trans.forward, trans.up);
 trans.position += realTags[0].EstimatedWorldPos - modelledTags[0].transform.position;
```

### Track or Identify Tagged Stationary or Moving real-world objects/faces using LEDs or other recognizer libraries

Examples:
* Industrial robots with LEDs (or QR codes for slower moving objects)
* Identify and recognize objects in the room
* Identify and recognize people in the room, for example placing holographic contact cards over faces

## See also
* [Locatable camera sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/HolographicFaceTracking)
* [Locatable camera overview](../advanced-concepts/locatable-camera-overview.md)
* [Locatable camera in Unity](../unity/locatable-camera-in-unity.md)
* [Mixed reality capture](/hololens/holographic-photos-and-videos)
* [Mixed reality capture for developers](../advanced-concepts/mixed-reality-capture-overview.md)
* [Media capture introduction](/windows/uwp/audio-video-camera/)
* [Holographic face tracking sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/HolographicFaceTracking)
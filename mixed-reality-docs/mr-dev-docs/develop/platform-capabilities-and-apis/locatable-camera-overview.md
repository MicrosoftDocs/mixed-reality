---
title: Locatable camera
description: General information about the HoloLens front-facing camera, how it works, and the profiles and resolutions available to developers.
author: cdedmonds
ms.author: wguyman
ms.date: 06/12/2019
ms.topic: article
keywords: camera, hololens, color camera, front facing, hololens 2, cv, computer vision, fiducial, markers, qr code, qr, photo, video
---


# Locatable camera

HoloLens includes a world-facing camera mounted on the front of the device, which enables apps to see what the user sees. Developers have access to and control of the camera, just as they would for color cameras on smartphones, portables, or desktops. The same universal windows [media capture](/uwp/api/Windows.Media.Capture.MediaCapture) and windows media foundation APIs that work on mobile and desktop work on HoloLens. Unity [has wrapped these windows APIs](../unity/locatable-camera-in-unity.md) to abstract camera usage features on HoloLens. Feature tasks include taking regular photos and videos (with or without holograms) and locating the camera's position in and perspective on the scene.

## Device camera information

### HoloLens (first-generation)

* Fixed focus photo/video (PV) camera with auto white balance, auto exposure, and full image-processing pipeline.
* White Privacy LED facing the world will illuminate whenever the camera is active
* The camera supports the following modes (all modes are 16:9 aspect ratio) at 30, 24, 20, 15, and 5 fps:

  |  Video  |  Preview  |  Still  |  Horizontal Field of View (H-FOV) |  Suggested usage | 
  |----------|----------|----------|----------|----------|
  |  1280x720 |  1280x720 |  1280x720 |  45 deg  |  (default mode with video stabilization) | 
  |  N/A |  N/A |  2048x1152 |  67 deg |  Highest resolution still image | 
  |  1408x792 |  1408x792 |  1408x792 |  48 deg |  Overscan (padding) resolution before video stabilization | 
  |  1344x756 |  1344x756 |  1344x756 |  67 deg |  Large FOV video mode with overscan | 
  |  896x504 |  896x504 |  896x504 |  48 deg |  Low power / Low-resolution mode for image-processing tasks | 

### HoloLens 2

* Auto-focus photo/video (PV) camera with auto white balance, auto exposure, and full image-processing pipeline.
* White Privacy LED facing the world will illuminate whenever the camera is active.
* HoloLens 2 supports different camera profiles. Learn how to [discover and select camera capabilities](/windows/uwp/audio-video-camera/camera-profiles).
* The camera supports the following profiles and resolutions (all video modes are 16:9 aspect ratio):
  
  | Profile                                         | Video     | Preview   | Still     | Frame rates | Horizontal Field of View (H-FOV) | Suggested usage                             |
  |-------------------------------------------------|-----------|-----------|-----------|-------------|----------------------------------|---------------------------------------------|
  | Legacy,0  BalancedVideoAndPhoto,100             | 2272x1278 | 2272x1278 |           | 15.30       | 64.69                            | High-quality video recording                |
  | Legacy,0  BalancedVideoAndPhoto,100             | 896x504   | 896x504   |           | 15.30       | 64.69                            | Preview stream for high-quality photo capture |
  | Legacy,0  BalancedVideoAndPhoto,100             |           |           | 3904x2196 |             | 64.69                            | High-quality photo capture                  |
  | BalancedVideoAndPhoto, 120                       | 1952x1100 | 1952x1100 | 1952x1100 | 15.30       | 64.69                            | Long duration scenarios                     |
  | BalancedVideoAndPhoto, 120                       | 1504x846  | 1504x846  |           | 15.30       | 64.69                            | Long duration scenarios                     |
  | VideoConferencing,100                           | 1952x1100 | 1952x1100 | 1952x1100 | 15,30,60    | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing,100                           | 1504x846  | 1504x846  |           | 5,15,30,60  | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing,100 BalancedVideoAndPhoto,120 | 1920x1080 | 1920x1080 | 1920x1080 | 15,30       | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing,100 BalancedVideoAndPhoto,120 | 1280x720  | 1280x720  | 1280x720  | 15,30       | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing,100 BalancedVideoAndPhoto,120 | 1128x636  |           |           | 15,30       | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing,100 BalancedVideoAndPhoto,120 | 960x540   |           |           | 15,30       | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing,100 BalancedVideoAndPhoto,120 | 760x428   |           |           | 15,30       | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing,100 BalancedVideoAndPhoto,120 | 640x360   |           |           | 15,30       | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing,100 BalancedVideoAndPhoto,120 | 500x282   |           |           | 15,30       | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing,100 BalancedVideoAndPhoto,120 | 424x240   |           |           | 15,30       | 64.69                            | Video conferencing, long duration scenarios |

> [!NOTE]
> Customers can leverage [mixed reality capture](/hololens/holographic-photos-and-videos) to take videos or photos of your app, which include holograms and video stabilization.
>
>As a developer, there are considerations you should take into account when creating your app if you want it to look as good as possible when a customer captures content. You can also enable (and customize) mixed reality capture from directly within your app. Learn more at [mixed reality capture for developers](mixed-reality-capture-for-developers.md).

## Locating the Device Camera in the World

When HoloLens takes photos and videos, the captured frames include the location of the camera in the world and the lens model of the camera. This allows applications to reason about the position of the camera in the real world for augmented imaging scenarios. Developers can creatively roll their own scenarios using their favorite image processing or custom computer vision libraries.

"Camera" elsewhere in HoloLens documentation may refer to the "virtual game camera" (the frustum the app renders to). Unless denoted otherwise, "camera" on this page refers to the real-world RGB color camera.

### Using Unity

To go from the 'CameraIntrinsics' and 'CameraCoordinateSystem' to your application/world coordinate system, follow the instructions in the [Locatable camera in Unity](../unity/locatable-camera-in-unity.md) article.  CameraToWorldMatrix is automatically provided by PhotoCaptureFrame class, and so you don't need to worry about the CameraCoordinateSystem transforms discussed below.

### Using MediaFrameReference

These instructions apply if you'r using the [MediaFrameReference](/uwp/api/windows.media.capture.frames.mediaframereference) class to read image frames from the camera.

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
        float4x4 CameraViewToCoordinateSytemTransform;
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

### Distortion Error

On HoloLens, the video and still image streams are undistorted in the system's image-processing pipeline before the frames are made available to the application (the preview stream contains the original distorted frames). Because only the CameraIntrinsics are made available, applications must assume image frames represent a perfect pinhole camera.

On HoloLens (first-generation), the undistortion function in the image processor may still leave an error of up to 10 pixels when using the CameraIntrinsics in the frame metadata. In many use cases, this error won't matter, but if you're aligning holograms to real world posters/markers, for example, and you notice a <10-px offset (roughly 11 mm for holograms positioned 2 meters away), this distortion error could be the cause. 

## Locatable Camera Usage Scenarios

### Show a photo or video in the world where it was captured

The Device Camera frames come with a "Camera To World" transform, that can be used to show exactly where the device was when the image was taken. For example, you could position a small holographic icon at this location (CameraToWorld.MultiplyPoint(Vector3.zero)) and even draw a little arrow in the direction that the camera was facing (CameraToWorld.MultiplyVector(Vector3.forward)).

### Tag / Pattern / Poster / Object Tracking

Many mixed reality applications use a recognizable image or visual pattern to create a trackable point in space. This is then used to render objects relative to that point or create a known location. Some uses for HoloLens include finding a real world object tagged with fiducials (e.g. a TV monitor with a QR code), placing holograms over fiducials, and visually pairing with non-HoloLens devices like tablets that have been set up to communicate with HoloLens via Wi-Fi.

You'll need a few things to recognize a visual pattern and place an object in the applications world space:
1. An image pattern recognition toolkit, such as QR code, AR tags, face finder, circle trackers, OCR etc.
2. Collect image frames at runtime, and pass them to the recognition layer
3. Unproject their image locations back into world positions, or likely world rays. 
4. Position your virtual models over these world locations

Some important image-processing links:
* [OpenCV](https://opencv.org/)
* [QR Tags](https://en.wikipedia.org/wiki/QR_code)
* [FaceSDK](https://research.microsoft.com/projects/facesdk/)
* [Microsoft Translator](https://www.microsoft.com/translator/business)

Keeping an interactive application frame-rate is critical, especially when dealing with long-running image recognition algorithms. For this reason, we commonly use the following pattern:
1. Main Thread: manages the camera object
2. Main Thread: requests new frames (async)
3. Main Thread: pass new frames to tracking thread
4. Tracking Thread: processes image to collect key points
5. Main Thread: moves virtual model to match found key points
6. Main Thread: repeat from step 2

Some image marker systems only provide a single pixel location (others provide the full transform in which case this section won't be needed), which equates to a ray of possible locations. To get to a single 3d location, we can then leverage multiple rays and find the final result by their approximate intersection. To do this, you'll need to:
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
* [Locatable camera in Unity](../unity/locatable-camera-in-unity.md)
* [Mixed reality capture](/hololens/holographic-photos-and-videos)
* [Mixed reality capture for developers](mixed-reality-capture-for-developers.md)
* [Media capture introduction](/windows/uwp/audio-video-camera/)
* [Holographic face tracking sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/HolographicFaceTracking)
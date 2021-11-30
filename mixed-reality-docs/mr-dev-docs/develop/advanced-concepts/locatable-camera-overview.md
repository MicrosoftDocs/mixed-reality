---
title: Locatable camera overview
description: General information about the HoloLens front-facing camera, how it works, and the profiles and resolutions available to developers.
author: qianw211
ms.author: v-vtieto
ms.date: 11/30/2021
ms.topic: article
keywords: camera, hololens, HoloLens, color camera, front facing, hololens 2, HoloLens 2, cv, computer vision, fiducial, markers, qr code, qr, photo, video, locatable
---

# Locatable camera overview

HoloLens includes a world-facing camera mounted on the front of the device that enables apps to see what the user sees. Developers have access to and control of the camera, just as they would for color cameras on smartphones, portables, or desktops. The same universal Windows [media capture](/uwp/api/Windows.Media.Capture.MediaCapture) and Windows Media Foundation APIs that work on mobile and desktop work on HoloLens. Unity [has wrapped these windows APIs](../unity/locatable-camera-in-unity.md) to abstract camera usage features on HoloLens. Feature tasks include taking regular photos and videos (with or without holograms) and locating the camera's position in and perspective on the scene.

## Device camera information

### HoloLens (first-generation)

* Fixed focus photo/video (PV) camera with auto white balance, auto exposure, and full image-processing pipeline.
* White Privacy LED facing the world that illuminates whenever the camera is active.
* The camera supports the following modes (all modes are 16:9 aspect ratio) at 30, 24, 20, 15, and 5 fps:

  |  Video  |  Preview  |  Still  |  Horizontal Field of View (H-FOV) |  Suggested usage | 
  |----------|----------|----------|----------|----------|
  |  1280x720 |  1280x720 |  1280x720 |  45 deg  |  (default mode with video stabilization) | 
  |  N/A |  N/A |  2048x1152 |  67 deg |  Highest resolution still image | 
  |  1408x792 |  1408x792 |  1408x792 |  48 deg |  Overscan (padding) resolution before video stabilization | 
  |  1344x756 |  1344x756 |  1344x756 |  67 deg |  Large FOV video mode with overscan | 
  |  896x504 |  896x504 |  896x504 |  48 deg |  Low power / Low-resolution mode for image-processing tasks | 

### HoloLens 2

* Autofocus photo/video (PV) camera with auto white balance, auto exposure, and full image-processing pipeline. The autofocus system can adjust object distance from 30 cm to infinity. The effective focal length for the HoloLens 2 PV camera lens is 4.87 mm +/- 5%.  In addition to the 5% variation due to manufacturing tolerance, the focal length will change dynamically due to the autofocus system. The AF travel (stroke) is up to 0.2 mm.
* White Privacy LED facing the world that illuminates whenever the camera is active.
* HoloLens 2 supports different camera profiles. Learn how to [discover and select camera capabilities](/windows/uwp/audio-video-camera/camera-profiles).
* The camera supports the following profiles and resolutions (all video modes are 16:9 aspect ratio):
  
  | Profile                                         | Video     | Preview   | Still     | Frame rates | Horizontal Field of View (H-FOV) | Suggested usage                             |
  |-------------------------------------------------|-----------|-----------|-----------|-------------|----------------------------------|---------------------------------------------|
  | Legacy, 0  BalancedVideoAndPhoto,100             | 2272x1278 | 2272x1278 |           | 15.30       | 64.69                            | High-quality video recording                |
  | Legacy,0  BalancedVideoAndPhoto,100             | 896x504   | 896x504   |           | 15.30       | 64.69                            | Preview stream for high-quality photo capture |
  | Legacy, 0  BalancedVideoAndPhoto,100             |           |           | 3904x2196 |             | 64.69                            | High-quality photo capture                  |
  | BalancedVideoAndPhoto, 120                       | 1952x1100 | 1952x1100 | 1952x1100 | 15.30       | 64.69                            | Long duration scenarios                     |
  | BalancedVideoAndPhoto, 120                       | 1504x846  | 1504x846  |           | 15.30       | 64.69                            | Long duration scenarios                     |
  | VideoConferencing, 100                           | 1952x1100 | 1952x1100 | 1952x1100 | 15,30,60    | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing, 100                           | 1504x846  | 1504x846  |           | 5,15,30,60  | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing, 100 BalancedVideoAndPhoto,120 | 1920x1080 | 1920x1080 | 1920x1080 | 15,30       | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing, 100 BalancedVideoAndPhoto,120 | 1280x720  | 1280x720  | 1280x720  | 15,30       | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing, 100 BalancedVideoAndPhoto,120 | 1128x636  |           |           | 15,30       | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing, 100 BalancedVideoAndPhoto,120 | 960x540   |           |           | 15,30       | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing, 100 BalancedVideoAndPhoto,120 | 760x428   |           |           | 15,30       | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing, 100 BalancedVideoAndPhoto,120 | 640x360   |           |           | 15,30       | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing, 100 BalancedVideoAndPhoto,120 | 500x282   |           |           | 15,30       | 64.69                            | Video conferencing, long duration scenarios |
  | Videoconferencing, 100 BalancedVideoAndPhoto,120 | 424x240   |           |           | 15,30       | 64.69                            | Video conferencing, long duration scenarios |

> [!NOTE]
> Customers can leverage [mixed reality capture](/hololens/holographic-photos-and-videos) to take videos or photos of your app that include holograms and employ video stabilization.
>
> If you want the content of your user's capture to look as good as possible, there are some things you should consider. You can also enable (and customize) mixed reality capture from directly within your app. Learn more at [mixed reality capture for developers](mixed-reality-capture-overview.md).

## Locating the Device Camera in the World

When HoloLens takes photos and videos, the captured frames include the location of the camera in the world and the lens model of the camera. This information allows applications to reason about the position of the camera in the real world for augmented imaging scenarios. Developers can creatively roll their own scenarios using their favorite image processing or custom computer vision libraries.

"Camera" elsewhere in HoloLens documentation may refer to the "virtual game camera" (the frustum the app renders to). Unless described otherwise, "camera" on this page refers to the real-world RGB color camera.


### Distortion Error

On HoloLens, the video and still image streams are undistorted in the system's image-processing pipeline before the frames are made available to the application. The preview stream contains the original distorted frames. Because only the CameraIntrinsics are made available, applications must assume that image frames represent a perfect pinhole camera.

On HoloLens (first-generation), the undistortion function in the image processor may still leave an error of up to 10 pixels when using the CameraIntrinsics in the frame metadata. In many use cases, this error won't matter. However, if, for example, you're aligning holograms to real-world posters or markers and you notice a < 10 px offset (roughly 11 mm for holograms positioned 2 meters away), this distortion error could be the cause.

## Locatable Camera Usage Scenarios

### Show a photo or video in the world where it was captured

The Device Camera frames come with a "Camera To World" transform that can be used to show exactly where the device was when it captured the image. For example, you could position a small holographic icon at this location (CameraToWorld.MultiplyPoint(Vector3.zero)) and even draw a little arrow in the direction that the camera was facing (CameraToWorld.MultiplyVector(Vector3.forward)).
<!-- Add some text that explain where these functions come from. -->

### Tag / Pattern / Poster / Object Tracking

Many mixed reality applications use a recognizable image or visual pattern to create a trackable point in space. An application can render objects relative to that point or create a known location. A typical use for HoloLens is finding a real-world object that's tagged with fiducials. This might occur, for example, on tablets that have been set up to communicate with HoloLens via Wi-Fi.

You'll need a few things to recognize a visual pattern and place an object in the application's world space:
1. An image pattern recognition toolkit, such as QR code, AR tags, face finder, circle trackers, OCR, and so on.
2. Collect image frames at runtime and pass them to the recognition layer.
3. Unproject their image locations back into world positions or likely world rays. 
4. Position your virtual models over these world locations.

Some important image-processing links:
* [OpenCV](https://opencv.org/)
* [QR Tags](https://en.wikipedia.org/wiki/QR_code)
* [FaceSDK](https://research.microsoft.com/projects/facesdk/)
* [Microsoft Translator](https://www.microsoft.com/translator/business)

Keeping an interactive application frame-rate is critical, especially when dealing with long-running image recognition algorithms. For this reason, we commonly use the following pattern:
1. Main Thread: manages the camera object.
2. Main Thread: requests new frames (async).
3. Main Thread: pass new frames to tracking thread.
4. Tracking Thread: processes image to collect key points.
5. Main Thread: moves virtual model to match found key points.
6. Main Thread: repeat from step 2.
<!-- Not sure if we should keep this here or move to the c#/c++ doc. -->

Some image marker systems only provide a single-pixel location, which equates to a ray of possible locations. (Others provide the full transform, in which case this section isn't needed.) To get to a single 3D location, we can calculate multiple rays and find the final result by their approximate intersection. To get this result, you'll need to:
1. Create a loop that collects multiple camera images.
2. Find the associated feature points and their world rays.

Given two or more tracked tag locations, you can position a modeled scene to fit the user's current scenario. If you can't assume gravity, then you'll need three tag locations. In many cases, we use a color scheme where white spheres represent real-time tracked tag locations, and blue spheres represent modeled tag locations. This allows the user to visually gauge the alignment quality. We assume the following setup in all our applications:
* Two or more modeled tag locations.
* One 'calibration space', which in the scene is the parent of the tags.
* Camera feature identifier.
* Behavior, which moves the calibration space to align the modeled tags with the real-time tags (we're careful to move the parent space, not the modeled markers themselves, because other connect is positions relative to them).

### Track or identify tagged stationary or moving real-world objects/faces using LEDs or other recognizer libraries

Examples:
* Industrial robots with LEDs (or QR codes for slower moving objects).
* Identify and recognize objects in the room.
* Identify and recognize people in the room--for example, placing holographic contact cards over faces.

## See also
* [Locatable camera sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/HolographicFaceTracking)
* [Locatable camera with C++ samples](../native/locatable-camera-cpp.md)
* [Mixed reality capture](/hololens/holographic-photos-and-videos)
* [Mixed reality capture for developers](mixed-reality-capture-overview.md)
* [Media capture introduction](/windows/uwp/audio-video-camera/)
* [Holographic face tracking sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/HolographicFaceTracking)
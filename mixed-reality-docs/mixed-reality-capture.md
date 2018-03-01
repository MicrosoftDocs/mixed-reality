---
title: Mixed reality capture
description: 
author: 
ms.author: wguyman
ms.date: 2/28/2018
ms.topic: article
keywords: 
---



# Mixed reality capture

HoloLens gives users the experience of mixing the real world with the digital world. Mixed reality capture (MRC) let you save that experience as either a photograph or a video. This lets you share the experience with others by allowing them to see the holograms as you see them. Such videos and photos are from a first-person point of view. For a third-person point of view, use [spectator view](spectator-view.md).

Use cases for mixed reality capture go beyond sharing videos amongst a social circle. Videos can be used to instruct others on how to use an app. Developers can use videos or stills to improve repro steps and debug app experiences.

## Taking mixed reality captures

There are four ways to initiate a mixed reality capture:
1. Cortana can be used at all times regardless of the app currently running. Just say, "Hey Cortana, take a picture" or "Hey Cortana, start recording." To stop a video, say "Hey Cortana, stop recording."
2. On the Start Menu, select either *Photo* or *Video*. Use [air-tap](gestures.md#air-tap) to begin the capture. When finished, bloom to exit the MRC mode.
3. From the [Windows Device Portal](using-the-windows-device-portal.md), a user can initiate a mixed reality capture.
4. Press both the volume up and volume down buttons simultaneously to take a picture, regardless of the app currently running.

![Click the camera icon at the bottom of the start menu](images/cameraiconinpins-300px.png)

The system will throttle the render rate to 30Hz. This creates some headroom for MRC to run so the app doesn’t need to keep a constant budget reserve and also matches the MRC video record framerate of 30fps. Note, videos have a maximum length of five minutes.

The system only supports a single MRC operation at a time (taking a picture is mutually exclusive from recording a video).

## File formats

Mixed reality captures from Cortana voice commands and Start Menu tools create files in the following formats:

|  Type  |  Format  |  Extension  |  Resolution  |  Audio | 
|----------|----------|----------|----------|----------|
|  Photo  |  [JPEG](https://en.wikipedia.org/wiki/JPEG)  |  .jpg  |  1408x792px  |  N/A | 
|  Video  |  [MPEG-4](https://en.wikipedia.org/wiki/MPEG-4)  |  .mp4  |  1408x792px  |  48kHz Stereo | 

## Viewing mixed reality captures

Mixed reality capture photos and videos are saved to the device's Camera Roll folder. These can be accessed via the [Photos app](see-your-photos.md#photos-app) or the [Windows Device Portal](using-the-windows-device-portal.md#mixed-reality-capture). You can use the Photos app to sync your photos and videos to OneDrive.

## See also
* [Spectator view](spectator-view.md)
* [Locatable camera](locatable-camera.md)
* [Mixed reality capture for developers](mixed-reality-capture-for-developers.md)
* [See your photos](see-your-photos.md)
* [Using the Windows Device Portal](using-the-windows-device-portal.md)
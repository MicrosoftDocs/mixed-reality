---
title: Mixed reality capture
description: Information on using mixed reality capture.
author: wguyman
ms.author: wguyman
ms.date: 03/21/2018
ms.topic: article
keywords: mrc, mixed reality capture, photos, video, camera, capture, usage
---



# Mixed reality capture

HoloLens gives users the experience of mixing the real world with the digital world. Mixed reality capture (MRC) let you save that experience as either a photograph or a video. This lets you share the experience with others by allowing them to see the holograms as you see them. Such videos and photos are from a first-person point of view. For a third-person point of view, use [spectator view](spectator-view.md).

Use cases for mixed reality capture go beyond sharing videos amongst a social circle. Videos can be used to instruct others on how to use an app. Developers can use videos or stills to improve repro steps and debug app experiences.

## Live Streaming from HoloLens

The Windows 10 October 2018 Update adds Miracast support to the HoloLens.  Click the *Connect* button on the bottom of the start menu to bring up a picker for Miracast-enabled devices and adapters.  Choose the device you want to begin streaming.  When done, click the *Disconnect* button on the bottom of the start menu.  *Connect* and *Disconnect* are also available on the quick action menu. 

The [Windows Device Portal](using-the-windows-device-portal.md) exposes live streaming options for devices that are in Dev Mode.

## Taking mixed reality captures

There are multiple ways to initiate a mixed reality capture:
1. Cortana can be used at all times regardless of the app currently running. Just say, "Hey Cortana, take a picture" or "Hey Cortana, start recording." To stop a video, say "Hey Cortana, stop recording."
2. On the Start Menu, select either *Camera* or *Video*. Use [air-tap](gestures.md#air-tap) to open the built-in MRC camera UI.
3. On HoloLens: [Windows Device Portal](using-the-windows-device-portal.md) has a mixed reality capture page that can be used to take photos, videos, live stream, and view captures.
4. On HoloLens: Press both the volume up and volume down buttons simultaneously to take a picture, regardless of the app currently running.
5. On HoloLens: The Windows 10 April 2018 Update adds a video shortcut. If you hold the volume up and volume down buttons for three seconds, it will start recording a video.  To stop a video, tap both volume up and volume down buttons simultaneously.
6. On immersive headsets: The Windows 10 April 2018 Update adds motion controller shortcuts. On the motion controller you can hold the Windows button and then tap the trigger to take a picture or stop a video.  You can hold the Windows button and then tap the menu button to start recording a video.
7. The Windows 10 October 2018 Update adds the quick action menu. On the quick action menu, select either *Camera* or *Video* to open the built-in MRC camera UI.
8. Apps are able to expose their own UI for mixed reality capture using custom or, with the Windows 10 October 2018 Update, built-in MRC camera UI.

**Click the camera icon at the bottom of the start menu**

![Click the camera icon at the bottom of the start menu](images/cameraiconinpins-300px.png)

### Built-in MRC Camera UI

This is launched from both the start menu and, with the Windows 10 October 2018 Update, the quick action menu.

When in photo mode, select to take a photo. Bloom or press the Windows key to cancel.

When in video mode, select to start the video countdown. Bloom or press the Windows key to cancel.  While the video is recording, you can interact with the system as normal.

### To stop recording a video

There are multiple ways to stop recording a video:
1. Ask Cortana to stop with "Hey Cortana, stop recording."
2. On HoloLens: The Windows 10 April 2018 adds a hardware shortcut: tap both volume up and volume down buttons simultaneously.
3. On immersive headsets: The Windows 10 April 2018 Update adds a motion controller shortcut: on the motion controller hold the Windows button and then tap the trigger.
4. The Windows 10 October 2018 Update changes how bloom and Windows button behave: Before, bloom or the Windows button would stop recording. With the update, bloom or the Windows button open the start menu (or the quick action menu if you are in an app).  Press the *Stop video* button to stop recording.

### Limitations of mixed reality capture

On HoloLens the system will throttle the render rate to 30Hz. This creates some headroom for MRC to run so the app doesn’t need to keep a constant budget reserve and also matches the MRC video record framerate of 30fps.

Videos have a maximum length of five minutes.

The built-in MRC camera UI only supports a single MRC operation at a time (taking a picture is mutually exclusive from recording a video).

### File formats

Mixed reality captures from Cortana voice commands and Start Menu tools create files in the following formats:

|  Type  |  Format  |  Extension  |  Resolution  |  Audio | 
|----------|----------|----------|----------|----------|
|  Photo  |  [JPEG](https://en.wikipedia.org/wiki/JPEG)  |  .jpg  |  1408x792px (HoloLens) 1920x1080px (Immersive headsets) |  N/A | 
|  Video  |  [MPEG-4](https://en.wikipedia.org/wiki/MPEG-4)  |  .mp4  |  1408x792px (HoloLens) 1632x918px (Immersive headsets) |  48kHz Stereo | 

## Viewing mixed reality captures

Mixed reality capture photos and videos are saved to the device's Camera Roll folder. These can be accessed via the [Photos app](see-your-photos.md#photos-app), the File Explorer app, or the [Windows Device Portal](using-the-windows-device-portal.md#mixed-reality-capture).

On HoloLens, as of the Windows 10 April 2018 Update, you can also connect your HoloLens to your PC and view files via File Explorer on your PC.

### OneDrive upload on HoloLens

If you install the [OneDrive app](https://www.microsoft.com/en-us/p/onedrive/9wzdncrfj1p3) it will sync your photos and videos to OneDrive.

As of the Windows 10 April 2018 Update the Photos app will no longer upload your photos and videos to OneDrive.

## See also
* [Spectator view](spectator-view.md)
* [Locatable camera](locatable-camera.md)
* [Mixed reality capture for developers](mixed-reality-capture-for-developers.md)
* [See your photos](see-your-photos.md)
* [Using the Windows Device Portal](using-the-windows-device-portal.md)

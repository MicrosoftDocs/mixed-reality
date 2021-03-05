---
title: Locatable camera in Unity
description: Learn how to capture a photo to a file or to a Texture2D, how to capture a photo and interact with the raw bytes, and how to capture a video.
author: wguyman
ms.author: wguyman
ms.date: 03/21/2018
ms.topic: article
keywords: photo, video, hololens, camera, unity, locatable, PVC, photo video camera, mixed reality headset, windows mixed reality headset, virtual reality headset, webcam, photo capture, video capture
---


# Locatable camera in Unity

## Enabling the capability for Photo Video Camera

The "WebCam" capability must be declared for an app to use the [camera](../platform-capabilities-and-apis/locatable-camera.md).
1. In the Unity Editor, go to the player settings by navigating to the "Edit > Project Settings > Player" page
2. Select the "Windows Store" tab
3. In the "Publishing Settings > Capabilities" section, check the **WebCam** and **Microphone** capabilities

Only a single operation can occur with the camera at a time. You can check with mode the camera is currently in with UnityEngine.XR.WSA.WebCam.Mode. Available modes are photo, video, or none.

## Photo Capture

**Namespace:**  
*UnityEngine.XR.WSA.WebCam(Unity \~2018)  
UnityEngine.Windows.WebCam(Unity 2019\~)*<br>
**Type:** *PhotoCapture*

The *PhotoCapture* type allows you to take still photographs with the Photo Video Camera. The general pattern for using *PhotoCapture* to take a photo is as follows:
1. Create a *PhotoCapture* object
2. Create a *CameraParameters* object with the settings you want
3. Start Photo Mode via *StartPhotoModeAsync*
4. Take the photo you want
    * (optional) Interact with that picture
5. Stop Photo Mode and clean up resources

### Common Set Up for PhotoCapture

For all three uses, start with the same first three steps above

Start by creating a *PhotoCapture* object

```cs
PhotoCapture photoCaptureObject = null;
   void Start()
   {
       PhotoCapture.CreateAsync(false, OnPhotoCaptureCreated);
   }
```

Next, store your object, set your parameters, and start Photo Mode

```cs
void OnPhotoCaptureCreated(PhotoCapture captureObject)
   {
       photoCaptureObject = captureObject;

       Resolution cameraResolution = PhotoCapture.SupportedResolutions.OrderByDescending((res) => res.width * res.height).First();

       CameraParameters c = new CameraParameters();
       c.hologramOpacity = 0.0f;
       c.cameraResolutionWidth = cameraResolution.width;
       c.cameraResolutionHeight = cameraResolution.height;
       c.pixelFormat = CapturePixelFormat.BGRA32;

       captureObject.StartPhotoModeAsync(c, false, OnPhotoModeStarted);
   }
```

In the end, you'll also use the same clean-up code presented here

```cs
void OnStoppedPhotoMode(PhotoCapture.PhotoCaptureResult result)
   {
       photoCaptureObject.Dispose();
       photoCaptureObject = null;
   }
```

After these steps, you can choose which type of photo to capture.

### Capture a Photo to a File

The simplest operation is to capture a photo directly to a file. The photo can be saved as a JPG or a PNG.

If you successfully started photo mode, take a photo and store it on disk

```cs
private void OnPhotoModeStarted(PhotoCapture.PhotoCaptureResult result)
   {
       if (result.success)
       {
           string filename = string.Format(@"CapturedImage{0}_n.jpg", Time.time);
           string filePath = System.IO.Path.Combine(Application.persistentDataPath, filename);

           photoCaptureObject.TakePhotoAsync(filePath, PhotoCaptureFileOutputFormat.JPG, OnCapturedPhotoToDisk);
       }
       else
       {
           Debug.LogError("Unable to start photo mode!");
       }
   }
```

After capturing the photo to disk, exit photo mode and then clean up your objects

```cs
void OnCapturedPhotoToDisk(PhotoCapture.PhotoCaptureResult result)
   {
       if (result.success)
       {
           Debug.Log("Saved Photo to disk!");
           photoCaptureObject.StopPhotoModeAsync(OnStoppedPhotoMode);
       }
       else
       {
           Debug.Log("Failed to save Photo to disk");
       }
   }
```

### Capture a Photo to a Texture2D

When capturing data to a Texture2D, the process is similar to capturing to disk.

Follow the setup process above.

In *OnPhotoModeStarted*, capture a frame to memory.

```cs
private void OnPhotoModeStarted(PhotoCapture.PhotoCaptureResult result)
   {
       if (result.success)
       {
           photoCaptureObject.TakePhotoAsync(OnCapturedPhotoToMemory);
       }
       else
       {
           Debug.LogError("Unable to start photo mode!");
       }
   }
```

You'll then apply your result to a texture and use the common clean-up code above.

```cs
void OnCapturedPhotoToMemory(PhotoCapture.PhotoCaptureResult result, PhotoCaptureFrame photoCaptureFrame)
   {
       if (result.success)
       {
           // Create our Texture2D for use and set the correct resolution
           Resolution cameraResolution = PhotoCapture.SupportedResolutions.OrderByDescending((res) => res.width * res.height).First();
           Texture2D targetTexture = new Texture2D(cameraResolution.width, cameraResolution.height);
           // Copy the raw image data into our target texture
           photoCaptureFrame.UploadImageDataToTexture(targetTexture);
           // Do as we wish with the texture such as apply it to a material, etc.
       }
       // Clean up
       photoCaptureObject.StopPhotoModeAsync(OnStoppedPhotoMode);
   }
```

### Capture a Photo and Interact with the Raw bytes

To interact with the raw bytes of an in memory frame, follow the same setup steps as above and *OnPhotoModeStarted* as in capturing a photo to a Texture2D. The difference is in *OnCapturedPhotoToMemory* where you can get the raw bytes and interact with them.

In this example, you'll create a *List<Color>* to be further processed or applied to a texture via *SetPixels()*

```cs
void OnCapturedPhotoToMemory(PhotoCapture.PhotoCaptureResult result, PhotoCaptureFrame photoCaptureFrame)
   {
       if (result.success)
       {
           List<byte> imageBufferList = new List<byte>();
           // Copy the raw IMFMediaBuffer data into our empty byte list.
           photoCaptureFrame.CopyRawImageDataIntoBuffer(imageBufferList);

           // In this example, we captured the image using the BGRA32 format.
           // So our stride will be 4 since we have a byte for each rgba channel.
           // The raw image data will also be flipped so we access our pixel data
           // in the reverse order.
           int stride = 4;
           float denominator = 1.0f / 255.0f;
           List<Color> colorArray = new List<Color>();
           for (int i = imageBufferList.Count - 1; i >= 0; i -= stride)
           {
               float a = (int)(imageBufferList[i - 0]) * denominator;
               float r = (int)(imageBufferList[i - 1]) * denominator;
               float g = (int)(imageBufferList[i - 2]) * denominator;
               float b = (int)(imageBufferList[i - 3]) * denominator;

               colorArray.Add(new Color(r, g, b, a));
           }
           // Now we could do something with the array such as texture.SetPixels() or run image processing on the list
       }
       photoCaptureObject.StopPhotoModeAsync(OnStoppedPhotoMode);
   }
```

## Video Capture

**Namespace:** *UnityEngine.XR.WSA.WebCam*<br>
**Type:** *VideoCapture*

*VideoCapture* functions similarly to *PhotoCapture*. The only two differences are that you must specify a Frames Per Second (FPS) value and you can only save directly to disk as a .mp4 file. The steps to use *VideoCapture* are as follows:
1. Create a *VideoCapture* object
2. Create a *CameraParameters* object with the settings you want
3. Start Video Mode via *StartVideoModeAsync*
4. Start recording video
5. Stop recording video
6. Stop Video Mode and clean up resources

Start by creating our *VideoCapture* object *VideoCapture m_VideoCapture = null;*

```cs
void Start ()
   {
       VideoCapture.CreateAsync(false, OnVideoCaptureCreated);
   }
```

Next, set up the parameters you'll want for the recording and start.

```cs
void OnVideoCaptureCreated (VideoCapture videoCapture)
   {
       if (videoCapture != null)
       {
           m_VideoCapture = videoCapture;

           Resolution cameraResolution = VideoCapture.SupportedResolutions.OrderByDescending((res) => res.width * res.height).First();
           float cameraFramerate = VideoCapture.GetSupportedFrameRatesForResolution(cameraResolution).OrderByDescending((fps) => fps).First();

           CameraParameters cameraParameters = new CameraParameters();
           cameraParameters.hologramOpacity = 0.0f;
           cameraParameters.frameRate = cameraFramerate;
           cameraParameters.cameraResolutionWidth = cameraResolution.width;
           cameraParameters.cameraResolutionHeight = cameraResolution.height;
           cameraParameters.pixelFormat = CapturePixelFormat.BGRA32;

           m_VideoCapture.StartVideoModeAsync(cameraParameters,
                                               VideoCapture.AudioState.None,
                                               OnStartedVideoCaptureMode);
       }
       else
       {
           Debug.LogError("Failed to create VideoCapture Instance!");
       }
   }
```

Once started, begin the recording

```cs
void OnStartedVideoCaptureMode(VideoCapture.VideoCaptureResult result)
   {
       if (result.success)
       {
           string filename = string.Format("MyVideo_{0}.mp4", Time.time);
           string filepath = System.IO.Path.Combine(Application.persistentDataPath, filename);

           m_VideoCapture.StartRecordingAsync(filepath, OnStartedRecordingVideo);
       }
   }
```

After recording has started, you could update your UI or behaviors to enable stopping. Here you just log.

```cs
void OnStartedRecordingVideo(VideoCapture.VideoCaptureResult result)
   {
       Debug.Log("Started Recording Video!");
       // We will stop the video from recording via other input such as a timer or a tap, etc.
   }
```

At a later point, you'll want to stop the recording using a timer or user input, for instance.

```cs
// The user has indicated to stop recording
   void StopRecordingVideo()
   {
       m_VideoCapture.StopRecordingAsync(OnStoppedRecordingVideo);
   }
```

Once the recording has stopped, stop video mode and clean up your resources.

```cs
void OnStoppedRecordingVideo(VideoCapture.VideoCaptureResult result)
   {
       Debug.Log("Stopped Recording Video!");
       m_VideoCapture.StopVideoModeAsync(OnStoppedVideoCaptureMode);
   }

   void OnStoppedVideoCaptureMode(VideoCapture.VideoCaptureResult result)
   {
       m_VideoCapture.Dispose();
       m_VideoCapture = null;
   }
```

## Troubleshooting
* No resolutions are available
    * Ensure the **WebCam** capability is specified in your project.

## Next Development Checkpoint

If you're following the Unity development checkpoint journey we've laid out, you're in the midst of exploring the Mixed Reality platform capabilities and APIs. From here, you can continue to the next topic:

> [!div class="nextstepaction"]
> [Focus point](focus-point-in-unity.md)

Or jump directly to deploying your app on a device or emulator:

> [!div class="nextstepaction"]
> [Deploy to HoloLens or Windows Mixed Reality immersive headsets](../platform-capabilities-and-apis/using-visual-studio.md)

You can always go back to the [Unity development checkpoints](unity-development-overview.md#3-advanced-features) at any time.

## See Also
* [Locatable camera](../platform-capab ilities-and-apis/locatable-camera.md)

---
title: Mixed reality capture for developers
description: Learn about the best practices for enabling, using, and rendering mixed reality capture for developers.
author: mattzmsft
ms.author: mazeller
ms.date: 02/24/2019
ms.topic: article
keywords: mrc, photo, video, capture, camera
---

# Mixed reality capture for developers

> [!NOTE]
> See [Render from the PV camera](#render-from-the-pv-camera-opt-in) below for guidance on a new MRC capability for HoloLens 2.

You can take a [mixed reality capture](/hololens/holographic-photos-and-videos) (MRC) photo or video at any time, but there are few things to keep in mind when developing your application. This includes best practices for MRC visual quality and being responsive to system changes while MRCs are being captured.

Developers can also seamlessly integrate mixed reality capture and insertion into their apps.

MRC on HoloLens (first-generation) supports videos and photos up to 720p, while MRC on HoloLens 2 supports videos up to 1080p and photos up to 4K resolution.

## The importance of quality MRC

Whether it's mixed reality screenshots on your Microsoft Store page or other users sharing capture content on social networks, Mixed Reality Capture media is often a users first exposure to your app. You can use MRC to demo your app, educate users, encourage users to share their mixed world interactions, and for user research and problem solving.

## How MRC impacts your app

### Enabling MRC in your app

By default, an app doesn't have to do anything to enable users to take mixed reality captures.

### Enabling improved alignment for MRC in your app

By default, mixed reality capture combines the right eye's holographic output with the photo/video (PV) camera. These two sources are combined using the focus point set by the currently running immersive app.

This means that holograms outside the focus plane won't align because of the physical distance between the PV camera and the right display.

#### Set the focus point

Immersive apps (on HoloLens) should set the [focus point](../unity/focus-point-in-unity.md) of where they want their stabilization plane to be. This ensures the best alignment in both the headset and in mixed reality capture.

If a focus point isn't set, the stabilization plane will default to 2 meters.

#### Render from the PV camera (opt-in)

HoloLens 2 adds the ability for an immersive app to **render from the PV camera** while mixed reality capture is running. To ensure the app supports the additional render correctly, the app has to opt in to this functionality.

Render from the PV camera offers the following improvements over the default MRC experience:
* Hologram alignment to your physical environment and hands for near interactions should be accurate at all distances. Avoid having an offset at distances other than the focus point as you might see in the default MRC.
* The right eye in the headset won't be compromised, as it won't be used to render the holograms for the MRC output.

There are three steps to enable rendering from the PV camera:
1. Enable the PhotoVideoCamera HolographicViewConfiguration
2. Handle the additional HolographicCamera render
3. Verify your shaders and code render correctly from this additional HolographicCamera

##### Enable the PhotoVideoCamera HolographicViewConfiguration in DirectX

To opt in to rendering from the PV Camera, an app simply enables the PhotoVideoCamera's [HolographicViewConfiguration](/uwp/api/Windows.Graphics.Holographic.HolographicViewConfiguration):
```csharp
var display = Windows.Graphics.Holographic.HolographicDisplay.GetDefault();
var view = display.TryGetViewConfiguration(Windows.Graphics.Holographic.HolographicViewConfigurationKind.PhotoVideoCamera);
if (view != null)
{
    view.IsEnabled = true;
}
```

##### Handle the additional HolographicCamera render in DirectX

When the app has opt-in to render from the PV camera and mixed reality capture starts:
1. HolographicSpace's CameraAdded event will fire. This event can be deferred if the app can't handle the camera at this time.
2. Once the event has completed with no outstanding deferrals, the HolographicCamera will appear in the next HolographicFrame's AddedCameras list.

When mixed reality capture stops (or if the app disables the view configuration while mixed reality capture is running): the HolographicCamera will appear in the next HolographicFrame's RemovedCameras list and the HolographicSpace's CameraRemoved event will fire.

A [ViewConfiguration](/uwp/api/windows.graphics.holographic.holographiccamera.viewconfiguration) property has been added to HolographicCamera to help identify the configuration a camera belongs to.

##### Enable the PhotoVideoCamera HolographicViewConfiguration in Unity

> [!NOTE]
> If you're using Unity 2018, this requires **Unity 2018.4.13f1** or newer. If you're using Unity 2019, this requires **Unity 2019.4**, or newer.

To opt in to rendering from the PV Camera when using the [Mixed Reality Toolkit](https://microsoft.github.io/MixedRealityToolkit-Unity/README.html), enable the [Windows Mixed Reality Camera Settings](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/CameraSystem/WindowsMixedRealityCameraSettings.html) provider and check **Render from PV Camera**.

If you're not using the Mixed Reality Toolkit, you can use a component to [manually opt-in](#enable-the-photovideocamera-holographicviewconfiguration-in-directx) as described above for DirectX.

##### Handle the additional HolographicCamera render in Unity

This is done for you automatically by Unity.

##### Enable the PhotoVideoCamera HolographicViewConfiguration in Unreal

> [!NOTE]
> This requires **Unreal Engine 4.25** or newer.

To opt in to rendering from the PV Camera:

1. Call **SetEnabledMixedRealityCamera** and **ResizeMixedRealityCamera**
    * Use the **Size X** and **Size Y** values to set the video dimensions.

![Camera 3rd](images/unreal-camera-3rd.PNG)

##### Handle the additional HolographicCamera render in Unreal

This is done for you automatically by Unreal.

##### Verify shaders and code support additional cameras

Run a mixed reality capture and check for unusual alignment, missing content, or performance issues. Update shaders and code as appropriate.

If there are certain scenes that can't support rendering to an additional camera, you can disable the PhotoVideoCamera's HolographicViewConfiguration.

### Disabling MRC in your app

#### 2D app

2D apps can choose to have their visual content obscured when mixed reality capture is running by:
* Present with the [DXGI_PRESENT_RESTRICT_TO_OUTPUT](/windows/desktop/direct3ddxgi/dxgi-present) flag
* Create the app's swap chain with the [DXGI_SWAP_CHAIN_FLAG_HW_PROTECTED](/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_chain_flag) flag
* With the Windows 10 May 2019 Update, setting ApplicationView's [IsScreenCaptureEnabled](/uwp/api/windows.ui.viewmanagement.applicationview.isscreencaptureenabled)

#### Immersive app

Immersive apps can choose to have their visual content excluded from mixed reality capture by:
* Setting HolographicCameraRenderingParameter's [IsContentProtectionEnabled](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.iscontentprotectionenabled) to disable mixed reality capture for its associated frame
* Setting HolographicCamera's [IsHardwareContentProtectionEnabled](/uwp/api/windows.graphics.holographic.holographiccamera.ishardwarecontentprotectionenabled) to disable mixed reality capture for its associated holographic camera

#### Password Keyboard

With the Windows 10 May 2019 Update, visual content is automatically excluded from mixed reality capture when a password or pin keyboard is visible.

### Knowing when MRC is active

The [AppCapture](/uwp/api/Windows.Media.Capture.AppCapture) class can be used by an app to know when system mixed reality capture is running (for either audio or video).

>[!NOTE]
>AppCapture's [GetForCurrentView](/uwp/api/windows.media.capture.appcapture.getforcurrentview) API can return null if mixed reality capture isn't available on the device. It's also important to de-register the CapturingChanged event when your app is suspended, otherwise MRC can get into a blocked state.

### Best practices (HoloLens-specific)

MRC is expected to work without additional development effort, but there are a few things to be aware of when providing the best mixed reality capture experience.

**MRC uses the hologram’s alpha channel to blend with the [camera](locatable-camera.md) imagery**

The most important step is to make sure your app is clearing to transparent black instead of clearing to opaque black. In Unity, this is done by default with the MixedRealityToolkit. If you're developing in non-Unity, you may need to make a one line change.

Here are some of the artifacts you might see in MRC if your app isn't clearing to transparent black:

**Example Failures**: Black edges around the content (failing to clear to transparent black)

<table>
<tr>
<td>
<img src="images/chessboardblackedges-300px.jpg" alt="Failure to clear to transparent black: black edge artifacts around holograms"/>
</td>
<td>
<img src="images/fieldblackedges-300px.jpg" alt="Failing to clear to transparent black: black edge artifacts around holograms"/>
</td>
</tr>
</table>

**Example Failures**: The entire background scene of the hologram appears black. Setting a background alpha value of one results in a black background

![Setting a background alpha value of 1 results in a black background](images/clearopaqueblack-300px.png)

**Expected Result**: Holograms appear properly blended with the real-world (expected result if clearing to transparent black)

![Expected result if clearing to transparent black](images/cleartransparentblack-300px.png)

**Solution**:
* Change any content that is showing up as opaque black to have an alpha value of 0.
* Ensure that the app is clearing to transparent black.
* Unity defaults to clear automatically with the MixedRealityToolkit, but if it’s a non-Unity app you should modify the color used with ID3D11DeiceContext::ClearRenderTargetView(). You want to ensure you clear to transparent black (0,0,0,0) instead of opaque black (0,0,0,1).

You can now tune the alpha values of your assets if you’d like, but typically don’t need to. Most of the time, MRCs will look good out of the box. MRC assumes pre-multiplied alpha. The alpha values will only affect the MRC capture.

### What to expect when MRC is enabled on HoloLens

The following apply to both HoloLens (first-generation) and HoloLens 2, unless otherwise noted:

* The system will throttle the application to 30-Hz rendering. This creates some headroom for MRC to run so the app doesn’t need to keep a constant budget reserve and also matches the MRC video record framerate of 30 fps
* Hologram content in the right eye of the device may appear to “sparkle” when recording/streaming MRC: text may become more difficult to read and hologram edges may appear more jaggy (opting in to third camera render on **HoloLens 2** avoids this compromise)
* MRC photos and videos will respect the application’s [focus point](../unity/focus-point-in-unity.md) if the application has enabled it, which will help ensure holograms are accurately positioned. For videos, the Focus Point is smoothed so holograms may appear to slowly drift into place if the Focus Point depth changes significantly. Holograms that are at different depths from the focus point may appear offset from the real world (see example below where Focus Point is set at 2 meters but hologram is positioned at 1 meter).

![Holograms at 2 meters will appear perfectly registered to the world. Holograms at close or far distances may be slightly offset.](images/hologramaccuracydistancemrc-1000px.png)

## Integrating MRC functionality from within your app

Your mixed reality app can start MRC photo or video capture from within the app, and the content captured is made available to your app without being stored to the device's "Camera roll." You can create a custom MRC recorder or take advantage of built-in camera capture UI. 

### MRC with built-in camera UI

Developers can use the *[Camera Capture UI API](/windows/uwp/audio-video-camera/capture-photos-and-video-with-cameracaptureui)* to get a user-captured mixed reality photo or video with just a few lines of code.

This API launches the built-in MRC camera UI where users can take a photo or video and returns the resulting capture to your app. You can create a custom Mixed Reality Capture recorder if you need to add your own camera UI or lower-level access to capture streams.

### Creating a custom MRC recorder

While the user can always trigger a photo or video using the system MRC capture service, an application may want to build a custom camera app that include holograms in the camera stream just like MRC. This allows the application to kick off captures from user input, build custom recording UI, or customize MRC settings to name a few examples.

**HoloStudio adds a custom MRC camera using MRC effects**

![HoloStudio adds a custom MRC camera using MRC effects](images/cameraiconholostudio-300px.jpg)

Unity Applications should see [Locatable_camera_in_Unity](../unity/locatable-camera-in-unity.md) for the property to enable holograms.

Other applications can do this by using the [Windows Media Capture APIs](/uwp/api/Windows.Media.Capture.MediaCapture) to control the Camera and add an MRC Video and Audio effect to include virtual holograms and application audio in stills and videos.

Applications have two options to add the effect:
* The older API: [Windows.Media.Capture.MediaCapture.AddEffectAsync()](/uwp/api/windows.media.capture.mediacapture.addeffectasync)
* The new Microsoft recommended API (returns an object, making it possible to manipulate dynamic properties): [Windows.Media.Capture.MediaCapture.AddVideoEffectAsync()](/uwp/api/windows.media.capture.mediacapture.addvideoeffectasync) / [Windows.Media.Capture.MediaCapture.AddAudioEffectAsync()](/uwp/api/windows.media.capture.mediacapture.addaudioeffectasync) which require the app create its own implementation of [IVideoEffectDefinition](/uwp/api/Windows.Media.Effects.IVideoEffectDefinition) and [IAudioEffectDefinition](/uwp/api/windows.media.effects.iaudioeffectdefinition). See the [MRC sample app](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/HolographicMixedRealityCapture) for examples.

>[!NOTE]
> The Windows.Media.MixedRealityCapture namespace will not be recognized by Visual Studio, but the strings are still valid.

MRC Video Effect (**Windows.Media.MixedRealityCapture.MixedRealityCaptureVideoEffect**)

|  Property Name  |  Type  |  Default Value  |  Description |
|----------|----------|----------|----------|
|  StreamType  |  UINT32 ([MediaStreamType](/uwp/api/Windows.Media.Capture.MediaStreamType))  |  1 (VideoRecord)  |  Describe which capture stream this effect is used for. Audio isn't available. |
|  HologramCompositionEnabled  |  boolean  |  TRUE  |  Flag to enable or disable holograms in video capture. |
|  RecordingIndicatorEnabled  |  boolean  |  TRUE  |  Flag to enable or disable recording indicator on screen during hologram capturing. |
|  VideoStabilizationEnabled  |  boolean  |  FALSE  |  Flag to enable or disable video stabilization powered by the HoloLens tracker. |
|  VideoStabilizationBufferLength  |  UINT32  |  0  |  Set how many historical frames are used for video stabilization. 0 is 0-latency and nearly "free" from a power and performance perspective. 15 is recommended for highest quality (at the cost of 15 frames of latency and memory). |
|  GlobalOpacityCoefficient  |  float  |  0.9 (HoloLens) 1.0 (Immersive headset)  |  Set global opacity coefficient of hologram in range from 0.0 (fully transparent) to 1.0 (fully opaque). |
|  BlankOnProtectedContent  |  boolean  |  FALSE  |  Flag to enable or disable returning an empty frame if there's a 2d UWP app showing protected content. If this flag is false and a 2d UWP app is showing protected content, the 2d UWP app will be replaced by a protected content texture in both the headset and in the mixed reality capture. |
|  ShowHiddenMesh  |  boolean  |  FALSE  |  Flag to enable or disable showing the holographic camera's hidden area mesh and neighboring content. |
| OutputSize | Size | 0, 0 | Set the desired output size after cropping for video stabilization. A default crop size is chosen if 0 or an invalid output size is specified. |
| PreferredHologramPerspective | UINT32 | **Render from Camera** setting in the Windows Device Portal | Enum used to indicate which holographic camera view configuration should be captured: 0 (Display) means that the app won't be asked to render from the photo/video camera, 1 (PhotoVideoCamera) will ask the app to render from the photo/video camera (if the app supports it). Only supported on HoloLens 2 |

>[!NOTE]
> You can change the default value of **PreferredHologramPerspective** in the Windows Device Portal by going to the [Mixed Reality Capture page](using-the-windows-device-portal.md#mixed-reality-capture) and unchecking **Render from Camera**. The setting defaults to **1 (PhotoVideoCamera)**, but can be unchecked to set it to **0 (Display)**.
>
> The default value of **PreferredHologramPerspective** was **0 (Display)** prior to the June 2020 update (Windows Holographic, version 2004 build 19041.1106 and Windows Holographic, version 1903 build 18362.1064).

MRC Audio Effect (**Windows.Media.MixedRealityCapture.MixedRealityCaptureAudioEffect**)

| Property Name | Type | Default Value | Description |
|----------|----------|----------|----------|
| MixerMode | UINT32 | 2 (Mic and System audio) | Enum used to indicate which audio sources should be used: 0 (Mic audio only), 1 (System audio only), 2 (Mic and System audio) |
| LoopbackGain | float | **App Audio Gain** setting in the Windows Device Portal | Gain to apply to system audio volume. Ranges from 0.0 to 5.0. Only supported on HoloLens 2 |
| MicrophoneGain | float | **Mic Audio Gain** setting in the Windows Device Portal | Gain to apply to mic volume. Ranges from 0.0 to 5.0. Only supported on HoloLens 2 |

>[!NOTE]
> You can change the default value of **LoopbackGain** or **MicrophoneGain** in the Windows Device Portal by going to the [Mixed Reality Capture page](using-the-windows-device-portal.md#mixed-reality-capture) and adjusting the slider next to their respective settings. Both settings default to **1.0**, but can be set to any value between **0.0** and **5.0**.
>
> Using Windows Device Portal to configure the default gain values was added with the June 2020 update (Windows Holographic, version 2004 build 19041.1106 and Windows Holographic, version 1903 build 18362.1064).

### Simultaneous MRC limitations

You need to be aware of certain limitations when multiple apps are accessing MRC at the same time.

#### Photo/video camera access

On HoloLens 1, MRC will fail to capture a photo or capture video while a process is recording video or taking a photo. The reverse is also true: if MRC is running, the application will fail to get access to the camera. 

With HoloLens 2, it's possible for you to share access to the camera. If you don't need direct control of the resolution or frame-rate, you can initialize MediaCapture using the [SharedMode property](/uwp/api/windows.media.capture.mediacaptureinitializationsettings.sharingmode?view=winrt-19041) with SharedReadOnly.  

##### Built-in MRC photo/video camera access

MRC functionality built into Windows 10 (via Cortana, Start Menu, hardware shortcuts, Miracast, Windows Device Portal):

* Will run with ExclusiveControl by default

However, support has been added to MRC subsystem to operate in a shared mode: 

* If an app requests ExclusiveControl access to the photo/video camera, built-in MRC will automatically stop using the photo/video camera so the app's request will succeed 
* If built in MRC is started while an app has ExclusiveControl, built-in MRC will run in SharedReadOnly mode 

This shared mode functionality has certain restrictions:

* Photo via Cortana, hardware shortcuts, or Start Menu: Requires the Windows 10 April 2018 Update (or later)
* Video via Cortana, hardware shortcuts, or Start Menu: Requires the Windows 10 April 2018 Update (or later)
* Streaming MRC over Miracast: Requires the Windows 10 October 2018 Update (or later)
* Streaming MRC over Windows Device Portal or via the HoloLens companion app: Requires HoloLens 2

>[!NOTE]
> The resolution and frame-rate of the built-in MRC camera UI might be reduced from its normal values when another app is using the photo/video camera.

#### MRC access for developers

We recommend you always request Exclusive control for the camera when using MRC. This will ensure your application has full control of the settings for the camera as long as you're aware of the limitations listed above. 

* Create a media capture object using the [initialization settings](/uwp/api/windows.media.capture.mediacaptureinitializationsettings?view=winrt-19041)
* Set the [SharingMode](/uwp/api/windows.media.capture.mediacaptureinitializationsettings.sharingmode?view=winrt-19041#Windows_Media_Capture_MediaCaptureInitializationSettings_SharingMode) property to **exclusive**

> [!CAUTION]
> Be sure to carefully read the [SharingMode remarks](/uwp/api/windows.media.capture.mediacaptureinitializationsettings.sharingmode?view=winrt-19041#remarks) before continuing.

* Set up your camera the way you want it
* Start the app, capture video frames with the start API, then enable MRC

> [!CAUTION]
> If you start MRC before you start your app, we can't guarantee the feature will work as expected.

You can find a full sample of the above process in the [holographic face tracking sample](/samples/microsoft/windows-universal-samples/holographicfacetracking).

> [!NOTE]
> Before the Windows 10 April 2018 Update, an app's custom MRC recorder was mutually exclusive with system MRC (capturing photos, capturing videos, or streaming from the Windows Device Portal).

## See also

* [Mixed reality capture](/hololens/holographic-photos-and-videos)
* [Spectator view](spectator-view.md)
* [Unity Development Overview](../unity/unity-development-overview.md)
* [Unreal development overview](../unreal/unreal-development-overview.md)

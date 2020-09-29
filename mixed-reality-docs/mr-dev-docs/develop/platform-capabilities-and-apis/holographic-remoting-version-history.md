---
title: Holographic Remoting Version History
description: Version History for Holographic Remoting on HoloLens 2.
author: florianbagarmicrosoft
ms.author: flbagar
ms.date: 03/11/2020
ms.topic: article
keywords: HoloLens, Remoting, Holographic Remoting
---

# Holographic Remoting Version History

> [!IMPORTANT]
> This guidance is specific to Holographic Remoting on HoloLens 2.

## Version 2.2.3 (August 28, 2020) <a name="v2.2.3"></a>
* Bug fixes and stability improvements.

## Version 2.2.2 (July 10, 2020) <a name="v2.2.2"></a>
* Fixed issue with [HolographicCamera.LeftViewportParameters](https://docs.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.leftviewportparameters?view=winrt-19041#Windows_Graphics_Holographic_HolographicCamera_LeftViewportParameters) and [HolographicCamera.RightViewportParameters](https://docs.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera.rightviewportparameters?view=winrt-19041#Windows_Graphics_Holographic_HolographicCamera_RightViewportParameters) not returning any hidden area mesh vertices when streaming from a Windows Mixed Reality headset.
* Fixed crash which can happen with poor network connection.

## Version 2.2.1 (July 6, 2020) <a name="v2.2.1"></a>
> [!IMPORTANT]
> [Windows App Certification Kit](https://developer.microsoft.com/windows/downloads/app-certification-kit/) validation with version [2.2.0](holographic-remoting-version-history.md#v2.2.0) will fail. In case you're on version [2.2.0](holographic-remoting-version-history.md#v2.2.0) and want to submit your application to the Microsoft store please updated to at least version 2.2.1.
* Fixed [Windows App Certification Kit](https://developer.microsoft.com/windows/downloads/app-certification-kit/) compliance issues.

## Version 2.2.0 (July 1, 2020) <a name="v2.2.0"></a>
* The Holographic Remoting player can now be installed on PCs running [Windows Mixed Reality](../../discover/navigating-the-windows-mixed-reality-home.md), making it possible to stream to immersive headsets.
* [Motion controllers](../../design/motion-controllers.md) are now supported by Holographic Remoting and controller specific data can be retrieved via [SpatialInteractionSource.Controller](https://docs.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsource.controller#Windows_UI_Input_Spatial_SpatialInteractionSource_Controller).
* [SpatialStageFrameOfReference](https://docs.microsoft.com/uwp/api/windows.perception.spatial.spatialstageframeofreference) is now supported and the current stage can be retrieved via [SpatialStageFrameOfReference.Current](https://docs.microsoft.com/uwp/api/windows.perception.spatial.spatialstageframeofreference.current). Also, a new stage can be requested via [SpatialStageFrameOfReference.RequestNewStageAsync](https://docs.microsoft.com/uwp/api/windows.perception.spatial.spatialstageframeofreference.requestnewstageasync).
* In previous versions, pose prediction was completely handled on the player side by the Holographic Remoting player. Starting with version 2.2.0, Holographic Remoting has time synchronization, and prediction is fully done by the remote application. Users should also expect improved hologram stability under difficult network situations.

## Version 2.1.3 (May 25, 2020) <a name="v2.1.3"></a>
* Changed behavior of [HolographicSpace.CameraAdded](https://docs.microsoft.com/uwp/api/windows.graphics.holographic.holographicspace.cameraadded?view=winrt-18362) event. In previous versions it was **not** guaranteed that an added [HolographicCamera](https://docs.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamera?view=winrt-18362) also has a valid [HolographicCameraPose](https://docs.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerapose?view=winrt-18362) when creating the next frame via [HolographicSpace.CreateNextFrame](https://docs.microsoft.com/uwp/api/windows.graphics.holographic.holographicspace.createnextframe?view=winrt-18362#Windows_Graphics_Holographic_HolographicSpace_CreateNextFrame). Starting with version 2.1.3 [HolographicSpace.CameraAdded](https://docs.microsoft.com/uwp/api/windows.graphics.holographic.holographicspace.cameraadded?view=winrt-18362) is synchronized with pose data coming from the Holographic Remoting Player and users can expect that when a camera is added there is also a valid [HolographicCameraPose](https://docs.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerapose?view=winrt-18362) available for that camera on the the next frame.
* Added **Disabled** to DepthBufferStreamResolution which can be used to disable depth buffer streaming via RemoteContext.ConfigureDepthVideoStream. Note, if used [HolographicCameraRenderingParameters.CommitDirect3D11DepthBuffer](https://docs.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.commitdirect3d11depthbuffer?view=winrt-18362#Windows_Graphics_Holographic_HolographicCameraRenderingParameters_CommitDirect3D11DepthBuffer_Windows_Graphics_DirectX_Direct3D11_IDirect3DSurface_) will fail with *E_ILLEGAL_METHOD_CALL*.
* The Holographic Remoting Player's startup screen has been re-designed and now does not block the users view.
* Stability improvements and bug fixes.

## Version 2.1.2 (April 5, 2020) <a name="v2.1.2"></a>
* Fixed audio backwards compatibility issue between latest Holographic Remoting player and remote apps using version smaller than 2.1.0.
* Fixed spatial anchor issue which unexpectedly closed the Holographic Remoting player. This issue also affects custom players.

## Version 2.1.1 (March 20, 2020) <a name="v2.1.1"></a>
* Fixed video encoding issue with remote apps when using AMD GPUs.
* Holographic Remoting Player performance improvements.

## Version 2.1.0 (March 11, 2020) <a name="v2.1.0"></a>
* Switched network transport to use [RTP](https://en.wikipedia.org/wiki/Real-time_Transport_Protocol) via UDP. Secure connections use [SRTP](https://en.wikipedia.org/wiki/Secure_Real-time_Transport_Protocol) now. Note, the [Holographic Remoting Player](holographic-remoting-player.md) is still compatible with all previously release Holographic Remoting versions. To benefit from the new network transport both, the Holographic Remoting Player and the remote app in question, have to use version 2.1.0.
* Added support for [HolographicCameraRenderingParameters.CommitDirect3D11DepthBuffer](https://docs.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.commitdirect3d11depthbuffer#Windows_Graphics_Holographic_HolographicCameraRenderingParameters_CommitDirect3D11DepthBuffer_Windows_Graphics_DirectX_Direct3D11_IDirect3DSurface_). 

## Version 2.0.20 (February 2, 2020) <a name="v2.0.20"></a>
* Fixed various bugs that lead to crashes.

## Version 2.0.18 (December 17, 2019) <a name="v2.0.18"></a>
* Added support for [HolographicViewConfiguration](https://docs.microsoft.com/uwp/api/windows.graphics.holographic.holographicviewconfiguration)
* Fixed various bugs that lead to crashes.
* Fixed bug where a HolographicSpace.CameraAdded callback was required for a HolographicCamera to get accepted and show up as added camera in the HolographicFrame.

## Version 2.0.16 (November 11, 2019) <a name="2.0.16"></a>
* Fixed deadlock in QR code tracking.
* Fixed unhandeled exception due to blocking wait in main thread.

## Version 2.0.14 (October 26, 2019) <a name="v2.0.14"></a>
* Support for new PerceptionDevice APIs (Windows 10 November 2019 Update).
* Fixed issue which prevent hold gesture events being triggered by SpatialGestureRecognizer.
* Fixed threading issue when using SpatialSurfaceObserver.SetBoundingVolume.

## Version 2.0.12 (October 18, 2019) <a name="v2.0.12"></a>
* Fixed crash in SpatialGestureRecognizer when using NavigationRail(X/Y/Z).

## Version 2.0.10 (October 10, 2019) <a name="v2.0.10"></a>
* Fixed crash when using trigger button of VR controllers. Holographic Remoting does not fully support controllers, only the trigger button and the Windows button are working if paired with HoloLens 2.

## Version 2.0.9 (September 19, 2019) <a name="v2.0.9"></a>
* Added support for [SpatialAnchorExporter](https://docs.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorexporter)
* Added new interface ```IPlayerContext2``` (implemented by ```PlayerContext```) providing the following members:
  - [BlitRemoteFrameTimeout](holographic-remoting-create-player.md#BlitRemoteFrameTimeout)  property.
* Added ```Failed_RemoteFrameTooOld``` value to ```BlitResult```
* Stability and reliability improvements

## Version 2.0.8 (August 20, 2019) <a name="v2.0.8"></a>

* Fixed crash when calling [HolographicCameraRenderingParameters.CommitDirect3D11DepthBuffer](https://docs.microsoft.com/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.commitdirect3d11depthbuffer) with a [IDXGISurface2](https://docs.microsoft.com/windows/win32/api/dxgi1_2/nn-dxgi1_2-idxgisurface2) as parameter.
* Stability and reliability improvements

## Version 2.0.7 (July 26, 2019) <a name="v2.0.7"></a>

* First public release of Holographic Remoting for HoloLens 2.

## See Also
* [Writing a custom Holographic Remoting player app](holographic-remoting-create-player.md)
* [Writing a Holographic Remoting host app](holographic-remoting-create-host.md)
* [Holographic Remoting troubleshooting and limitations](holographic-remoting-troubleshooting.md)
* [Holographic Remoting software license terms](https://docs.microsoft.com/legal/mixed-reality/microsoft-holographic-remoting-software-license-terms)
* [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?LinkId=521839)

---
title: Holographic Remoting Version History
description: Stay up to date on the version history of the Holographic Remoting feature for HoloLens 2.
author: florianbagarmicrosoft
ms.author: flbagar
ms.date: 09/29/2021
ms.topic: article
keywords: HoloLens, Remoting, Holographic Remoting, version history, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Holographic Remoting Version History

> [!NOTE]
> This guidance is specific to Holographic Remoting on HoloLens 2 and Windows PCs running [Windows Mixed Reality](../../discover/navigating-the-windows-mixed-reality-home.md).

## Version 2.7.1 (October 26, 2021) <a name="v2.7.1"></a>
* Various bug fixes and stability improvements.

## Version 2.7.0 (September 29, 2021) <a name="v2.7.0"></a>
* Added support for the OpenXR extension XR_MSFT_spatial_anchor_persistence, which allows persistence and retrieval of spatial anchors across application sessions on a device.
* Added a new user coordinate system type that can be used to synchronize spatial locations between custom players and remote applications.
* Fixed an issue where connected and disconnected events from PlayerContext and RemoteContext could be broadcast concurrently or even in the wrong order. The broadcast now always happens in order, but prohibits blocking in an event handler to wait for the broadcast of a subsequent event.
* Various bug fixes and stability improvements.

## Version 2.6.2 (August 20, 2021) <a name="v2.6.2"></a>
* Fixed an OpenXR quad layer composition issue that can negatively affect hologram stability.

## Version 2.6.1 (July 20, 2021) <a name="v2.6.1"></a>
* The XR_MSFT_holographic_remoting_speech extension now allows reinitialization of the speech recognizer with new parameters during a running session.
* Fixed an issue where speech recognition reliability decreased over multiple connections.
* Various bug fixes and stability improvements.

## Version 2.6.0 (June 10, 2021) <a name="v2.6.0"></a>
* Holographic Remoting using the OpenXR API now supports:
  * The new XR_MSFT_holographic_remoting_speech extension, which allows applications to listen to custom speech commands in various languages.
  * The XR_MSFT_scene_understanding extension, which provides applications with a structured, high-level representation of the planes, meshes, and objects in the user's environment. This enables the development of spatially aware applications; however, you should keep in mind that XR_SCENE_COMPUTE_CONSISTENCY_OCCLUSION_OPTIMIZED_MSFT is the only consistency supported by xrComputeNewSceneMSFT.
  * The XR_MSFT_spatial_graph_bridge extension, which allows applications to create XrSpace handles to track the Spatial Graph Nodes of other Windows Mixed Reality device platform libraries or APIs. However, you should keep in mind that XR_SPATIAL_GRAPH_NODE_TYPE_STATIC_MSFT is the only node type supported by xrCreateSpatialGraphNodeSpaceMSFT. 
* Holographic Remoting using the Mixed Reality API now supports:
  * The SpatialGraphInteropPreview.CreateCoordinateSystemForNode overloads, which allow applications to track static Spatial Graph Nodes so that users can reason about places and things in their environment.
* Holographic Remoting using both the OpenXR and Mixed Reality APIs now supports:
  * The Microsoft.MixedReality.SceneUnderstanding SDK, which allows applications to compute a description of the scene surrounding the user (such as walls, floors, and surfaces) providing quads, meshes, and content placement cues.
  * The Microsoft.MixedReality.QR SDK, which allows applications to track the location, size, and content of detected QR codes.
  * Over-Rendering, which reduces black regions at the sides on the HMD.
* The OpenXR remote sample has been updated to include:	
  * An example of using the XR_MSFT_holographic_remoting_speech extension.
* The Mixed Reality remote sample has been updated to include:	
  * An example of using the Microsoft.MixedReality.SceneUnderstanding SDK.
  * An example of using the Microsoft.MixedReality.QR SDK (which replaces the previous QR code detection mechanism).
* The Holographic Remoting player now shows a loading animation while the connection is being established.
* Fixed issues with RenderDoc compatibility in both the OpenXR API runtime and the Mixed Reality API sample.
* Various bug fixes and stability improvements.

## Version 2.5.0 (February 12, 2021) <a name="v2.5.0"></a>
* Holographic Remoting using the [OpenXR API](../native/openxr.md) now supports:
  * XR_MSFT_spatial_anchor extension. This extension allows an application to create spatial anchors, which are arbitrary freespace points in the user’s physical environment that will be tracked by the runtime.
  * XR_MSFT_controller_model extension. This extension provides a mechanism to load GLTF models for controllers.
  * Custom data channels as part of the XR_MSFT_holographic_remoting extension. An example for that is shown in the [OpenXR remote sample](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples).
* Improved synchronization between player and remote side. This allows dynamically changing pose and frame buffering, which ensures that remote-rendered content smoothly reaches the displays at the expected target frame rate.
* Improved performance of the Holographic Remoting player available via the Microsoft Store. On HoloLens 2, the player now consistently runs at 60 frames per second.
* Optimized transmission of spatial surface meshes which can be queried via [SpatialSurfaceObserver](/uwp/api/windows.perception.spatial.surfaces.spatialsurfaceobserver) by a remote app.
* Fixed an issue in which calling SpatialAnchorManager methods or releasing anchors caused exceptions on disconnect.
* Fixed threading issue leading to crashes when closing PlayerContext or RemoteContext instances.
* Holographic Remoting Player on Desktop: Display an error message when Windows Mixed Reality is not installed instead of closing silently.
* Lots of other bug fixes and stability improvements.

## Version 2.4.1 (January 22, 2021) <a name="v2.4.1"></a>

* Fixed issue with SpatialAnchorManager::RequestStoreAsync not working reliably when called while connecting.
* Fixed issue with SpatialAnchorManager::TrySave not correctly saving an anchor if anchor in question is not locatable.

## Version 2.4.0 (December 1, 2020) <a name="v2.4.0"></a>

* Holographic Remoting now support writing remote apps using the [OpenXR API](../native/openxr.md). Check out [Writing a Holographic Remoting remote app using OpenXR APIs](holographic-remoting-create-remote-openxr.md) to get started.
* Bug fixes and stability improvements.

## Version 2.3.1 (October 10, 2020) <a name="v2.3.1"></a>

* Fixed regression with remote pose prediction, which caused visual jitter.
* Implemented PerceptionDeviceSetCreateFactoryOverride, which ensures that PerceptionDevice.dll shipped with Holographic Remoting doesn't interfere with the version shipped with Windows 10.

## Version 2.3.0 (October 2, 2020) <a name="v2.3.0"></a>

* Fixed crashes, which can happen when Holographic Remoting Player is suspended.
* Stability improvements.

## Version 2.2.3 (August 28, 2020) <a name="v2.2.3"></a>

* Bug fixes and stability improvements.

## Version 2.2.2 (July 10, 2020) <a name="v2.2.2"></a>

* Fixed issue with [HolographicCamera.LeftViewportParameters](/uwp/api/windows.graphics.holographic.holographiccamera.leftviewportparameters) and [HolographicCamera.RightViewportParameters](/uwp/api/windows.graphics.holographic.holographiccamera.rightviewportparameters) not returning any hidden area mesh vertices when streaming from a Windows Mixed Reality headset.
* Fixed crash, which can happen with poor network connection.

## Version 2.2.1 (July 6, 2020) <a name="v2.2.1"></a>

> [!IMPORTANT]
> [Windows App Certification Kit](https://developer.microsoft.com/windows/downloads/app-certification-kit/) validation with version [2.2.0](holographic-remoting-version-history.md#v2.2.0) will fail. In case you're on version [2.2.0](holographic-remoting-version-history.md#v2.2.0) and want to submit your application to the Microsoft store p
lease updated to at least version 2.2.1.
* Fixed [Windows App Certification Kit](https://developer.microsoft.com/windows/downloads/app-certification-kit/) compliance issues.

## Version 2.2.0 (July 1, 2020) <a name="v2.2.0"></a>

* The Holographic Remoting player can now be installed on PCs running [Windows Mixed Reality](../../discover/navigating-the-windows-mixed-reality-home.md), making it possible to stream to immersive headsets.
* [Motion controllers](../../design/motion-controllers.md) are now supported by Holographic Remoting and controller-specific data can be retrieved via [SpatialInteractionSource.Controller](/uwp/api/windows.ui.input.spatial.spatialinteractionsource.controller#Windows_UI_Input_Spatial_SpatialInteractionSource_Controller).
* [SpatialStageFrameOfReference](/uwp/api/windows.perception.spatial.spatialstageframeofreference) is now supported and the current stage can be retrieved via [SpatialStageFrameOfReference.Current](/uwp/api/windows.perception.spatial.spatialstageframeofreference.current). Also, a new stage can be requested via [SpatialStageFrameOfReference.RequestNewStageAsync](/uwp/api/windows.perception.spatial.spatialstageframeofreference.requestnewstageasync).
* In previous versions, pose prediction was handled on the player side by the Holographic Remoting player. Starting with version 2.2.0, Holographic Remoting has time synchronization, and prediction is fully done by the remote application. Users should also expect improved hologram stability under difficult network situations.

## Version 2.1.3 (May 25, 2020) <a name="v2.1.3"></a>

* Changed behavior of [HolographicSpace.CameraAdded](/uwp/api/windows.graphics.holographic.holographicspace.cameraadded) event. In previous versions, it was **not** guaranteed that an added [HolographicCamera](/uwp/api/windows.graphics.holographic.holographiccamera) also has a valid [HolographicCameraPose](/uwp/api/windows.graphics.holographic.holographiccamerapose) when creating the next frame via [HolographicSpace.CreateNextFrame](/uwp/api/windows.graphics.holographic.holographicspace.createnextframe). Starting with version 2.1.3, [HolographicSpace.CameraAdded](/uwp/api/windows.graphics.holographic.holographicspace.cameraadded) is synchronized with pose data coming from the Holographic Remoting Player. Users can expect that when a camera is added there is also a valid [HolographicCameraPose](/uwp/api/windows.graphics.holographic.holographiccamerapose) available for that camera on the next frame.
* Added **Disabled** to DepthBufferStreamResolution, which can be used to disable depth buffer streaming via RemoteContext.ConfigureDepthVideoStream. Note, if used [HolographicCameraRenderingParameters.CommitDirect3D11DepthBuffer](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.commitdirect3d11depthbuffer) will fail with *E_ILLEGAL_METHOD_CALL*.
* The Holographic Remoting Player's startup screen has been redesigned and now doesn't block the users view.
* Stability improvements and bug fixes.

## Version 2.1.2 (April 5, 2020) <a name="v2.1.2"></a>

* Fixed audio backwards compatibility issue between latest Holographic Remoting player and remote apps using version smaller than 2.1.0.
* Fixed spatial anchor issue, which unexpectedly closed the Holographic Remoting player. This issue also affects custom players.

## Version 2.1.1 (March 20, 2020) <a name="v2.1.1"></a>

* Fixed video encoding issue with remote apps when using AMD GPUs.
* Holographic Remoting Player performance improvements.

## Version 2.1.0 (March 11, 2020) <a name="v2.1.0"></a>

* Switched network transport to use [RTP](https://en.wikipedia.org/wiki/Real-time_Transport_Protocol) via UDP. Secure connections use [SRTP](https://en.wikipedia.org/wiki/Secure_Real-time_Transport_Protocol) now. Note, the [Holographic Remoting Player](holographic-remoting-player.md) is still compatible with all previously release Holographic Remoting versions. To benefit from the new network transport both, the Holographic Remoting Player and the remote app in question, have to use version 2.1.0.
* Added support for [HolographicCameraRenderingParameters.CommitDirect3D11DepthBuffer](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.commitdirect3d11depthbuffer#Windows_Graphics_Holographic_HolographicCameraRenderingParameters_CommitDirect3D11DepthBuffer_Windows_Graphics_DirectX_Direct3D11_IDirect3DSurface_). 

## Version 2.0.20 (February 2, 2020) <a name="v2.0.20"></a>

* Fixed various bugs that lead to crashes.

## Version 2.0.18 (December 17, 2019) <a name="v2.0.18"></a>

* Added support for [HolographicViewConfiguration](/uwp/api/windows.graphics.holographic.holographicviewconfiguration)
* Fixed various bugs that lead to crashes.
* Fixed bug where a HolographicSpace.CameraAdded callback was required for a HolographicCamera to get accepted and show up as added camera in the HolographicFrame.

## Version 2.0.16 (November 11, 2019) <a name="2.0.16"></a>

* Fixed deadlock in QR code tracking.
* Fixed unhandeled exception because of a blocking wait in main thread.

## Version 2.0.14 (October 26, 2019) <a name="v2.0.14"></a>

* Support for new PerceptionDevice APIs (Windows 10 November 2019 Update).
* Fixed issue, which prevent hold gesture events being triggered by SpatialGestureRecognizer.
* Fixed threading issue when using SpatialSurfaceObserver.SetBoundingVolume.

## Version 2.0.12 (October 18, 2019) <a name="v2.0.12"></a>

* Fixed crash in SpatialGestureRecognizer when using NavigationRail(X/Y/Z).

## Version 2.0.10 (October 10, 2019) <a name="v2.0.10"></a>

* Fixed crash when using trigger button of VR controllers. Holographic Remoting doesn't fully support controllers, only the trigger button and the Windows button are working if paired with HoloLens 2.

## Version 2.0.9 (September 19, 2019) <a name="v2.0.9"></a>

* Added support for [SpatialAnchorExporter](/uwp/api/windows.perception.spatial.spatialanchorexporter)
* Added new interface ```IPlayerContext2``` (implemented by ```PlayerContext```) providing the following members:
  - [BlitRemoteFrameTimeout](holographic-remoting-create-player.md#BlitRemoteFrameTimeout)  property.
* Added ```Failed_RemoteFrameTooOld``` value to ```BlitResult```
* Stability and reliability improvements

## Version 2.0.8 (August 20, 2019) <a name="v2.0.8"></a>

* Fixed crash when calling [HolographicCameraRenderingParameters.CommitDirect3D11DepthBuffer](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.commitdirect3d11depthbuffer) with a [IDXGISurface2](/windows/win32/api/dxgi1_2/nn-dxgi1_2-idxgisurface2) as parameter.
* Stability and reliability improvements

## Version 2.0.7 (July 26, 2019) <a name="v2.0.7"></a>

* First public release of Holographic Remoting for HoloLens 2.

## See Also

* [Holographic Remoting Overview](holographic-remoting-overview.md)
* [Writing a Holographic Remoting remote app using Windows Mixed Reality APIs](holographic-remoting-create-remote-wmr.md)
* [Writing a Holographic Remoting remote app using OpenXR APIs](holographic-remoting-create-remote-openxr.md)
* [Writing a custom Holographic Remoting player app](holographic-remoting-create-player.md)
* [Holographic Remoting troubleshooting and limitations](holographic-remoting-troubleshooting.md)
* [Holographic Remoting software license terms](/legal/mixed-reality/microsoft-holographic-remoting-software-license-terms)
* [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?LinkId=521839)
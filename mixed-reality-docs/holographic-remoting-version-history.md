---
title: Holographic Remoting Version History
description: Version History for Holographic Remoting on HoloLens 2.
author: NPohl-MSFT
ms.author: nopohl
ms.date: 10/21/2019
ms.topic: article
keywords: HoloLens, Remoting, Holographic Remoting
---

# Holographic Remoting Version History

> [!IMPORTANT]
> This guidance is specific to Holographic Remoting on HoloLens 2.

## Version 2.0.14 (October 26, 2019) <a name="v2.0.14"></a>
* Support for new PerceptionDevice APIs (Windows 10 November 2019 Update).
* Fixed issue which prevent hold gesture events being triggered by SpatialGestureRecognizer.
* Fixed theading issue when using SpatialSurfaceObserver.SetBoundingVolume.

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

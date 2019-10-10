---
title: Holographic Remoting Version History
description: Version History for Holographic Remoting on HoloLens 2.
author: NPohl-MSFT
ms.author: nopohl
ms.date: 09/27/2019
ms.topic: article
keywords: HoloLens, Remoting, Holographic Remoting
---

# Holographic Remoting Version History

> [!IMPORTANT]
> This guidance is specific to Holographic Remoting on HoloLens 2.

## Version 2.0.9 (September 19, 2019) <a name="v2.0.9"></a>
* Added support for [SpatialAnchorExporter](https://docs.microsoft.com/en-us/uwp/api/windows.perception.spatial.spatialanchorexporter)
* Added new interface ```IPlayerContext2``` (implemented by ```PlayerContext```) providing the following members:
  - [BlitRemoteFrameTimeout](holographic-remoting-create-player.md#BlitRemoteFrameTimeout)  property.
* Added ```Failed_RemoteFrameTooOld``` value to ```BlitResult```
* Stability and reliability improvements

## Version 2.0.8 (August 20, 2019) <a name="v2.0.8"></a>

* Fixed crash when calling [HolographicCameraRenderingParameters.CommitDirect3D11DepthBuffer](https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.commitdirect3d11depthbuffer) with a [IDXGISurface2](https://docs.microsoft.com/en-us/windows/win32/api/dxgi1_2/nn-dxgi1_2-idxgisurface2) as parameter.
* Stability and reliability improvements

## Version 2.0.7 (July 26, 2019) <a name="v2.0.7"></a>

* First public release of Holographic Remoting for HoloLens 2.

## See Also
* [Writing a custom Holographic Remoting player app](holographic-remoting-create-player.md)
* [Writing a Holographic Remoting host app](holographic-remoting-create-host.md)
* [Holographic Remoting troubleshooting and limitations](holographic-remoting-troubleshooting.md)
* [Holographic Remoting software license terms](https://docs.microsoft.com/en-us/legal/mixed-reality/microsoft-holographic-remoting-software-license-terms)
* [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?LinkId=521839)
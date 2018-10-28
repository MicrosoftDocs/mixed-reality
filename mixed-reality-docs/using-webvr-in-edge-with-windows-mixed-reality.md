---
title: Using WebVR in Microsoft Edge with Windows Mixed Reality
description: Overview of using and developing for WebVR in Windows Mixed Reality
author: YashMaster
ms.author: yabahman
ms.date: 03/21/2018
ms.topic: article
keywords: WebVR, WebXR, WinMR, WebAR, web vr, web xr, web mr, web ar, 360, 360 video, 360 videos, 360 photo, 360 photos, 360 content, immersive web, immersiveweb, IW
---



# Using WebVR in Microsoft Edge with Windows Mixed Reality

## Creating WebVR content for Windows Mixed reality immersive headsets

WebVR 1.1 is available in Microsoft Edge beginning with the Windows 10 Fall Creators Update. Developers can now use this API to create immersive VR experiences on the web.

The WebVR API provides HMD pose data to the page which can be used to render a stereo WebGL scene back to the HMD. Details on API support is available on the [Microsoft Edge Platform Status page](https://developer.microsoft.com/en-us/microsoft-edge/platform/status/webvr/). The WebVR API surface area is present at all times within Microsoft Edge. However, a call to getVRDisplays() will only return a headset if either a headset is plugged in or the simulator has been turned on.

## Viewing WebVR content in Windows Mixed Reality immersive headsets

Instructions for accessing WebVR content in your immersive headset can be found in the [Enthusiast's Guide](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/webvr).

## See Also
* [WebVR information](http://webvr.info)
* [WebVR specification](https://w3c.github.io/webvr/)
* [WebVR API](https://msdn.microsoft.com/library/mt806281(v=vs.85).aspx)
* [WebGL API](https://msdn.microsoft.com/library/bg182648(v=vs.85).aspx)
* [Gamepad API](https://msdn.microsoft.com/library/dn743630(v=vs.85).aspx) and [Gamepad Extensions](https://w3c.github.io/gamepad/extensions.html)
* [Handling Lost Context in WebGL](https://www.khronos.org/webgl/wiki/HandlingContextLost)
* [Pointerlock](http://www.w3.org/TR/pointerlock/)
* [glTF](https://www.khronos.org/gltf)
* [Using Babylon.js to enable WebVR](https://docs.microsoft.com/windows/uwp/get-started/adding-webvr-to-a-babylonjs-game)


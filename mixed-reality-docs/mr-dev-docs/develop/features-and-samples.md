---
title: Samples and feature apps
description: Stay up to date with all the available Microsoft samples and mixed reality features apps for HoloLens.
author: qianw211
ms.author: jemccull
ms.date: 7/29/2021
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens, learn, samples, MRTK, research mode, HoloLens 2, qr codes, WebRTC, mixed reality capture, holographic remoting, UX Tools
ms.localizationpriority: high
---

# Samples and feature apps

![Picture of a user wearing a HoloLens and manipulating a hologram with hand movement](unreal/images/unreal-developer.jpg)

Every development journey starts with a look back at what other developers have successfully built - mixed reality is no different. Currently, all of our tutorials and sample apps are built in Unity or Unreal. As we develop content for other engines and platforms, you'll find them under the relevant heading in the Table of Contents.

| Scenario | Feature sample | Engine | Description |
| --- | --- | ---- | --- |
| Getting started | [OpenXR with Unity samples](#getting-started-with-cross-platform-developer-tools) | Native (OpenXR) | Getting started with cross-platform developer tools. |
| Camera capture | [Mixed reality capture sample](#holographic-mixed-reality-capture) | Windows 10 C++ | Capture the first-person experience of mixing real and digital worlds as a photo or video. |
|  | [Scene understanding sample](#scene-understanding) | Unity C# | Help design environmentally aware mixed reality applications. |
| | [Spectator view sample](#spectator-view) | Unity C# | Capture and render holograms at the correct size and orientation. |
| | [Research Mode samples](#research-mode) | Windows 10 C++ | Access to key censors on a HoloLens device for research applications. |
| [Contextual data overlays](#contextual-data-overlays) | [QR Codes](#qr-codes) | Unity C# | Detect QR Codes in the environment. |
| | [Poster tracker sample](#poster-tracker-sample)  | Unity C# | Align a hologram with a real world object. |
| [Collaboration in mixed reality](#collaboration-in-mixed-reality) | [User identity](#user-identity) | Unity C#, AAD | Set up your HoloLens 2 device using Azure Active Directory (AAD) credentials. |
| | [WebRTC sample](#webrtc) | Unity C#, NuGet | Integrate peer-to-peer audio, video, and data real-time communication into a mixed reality application. |
| Spatial interaction | [Basic hologram sample](#spatial-interaction---basic-hologram-sample) | Windows 10 C++ |Windows mixed reality sample that renders a spinning cube. |
| Holographic Remoting | [Holographic Remoting player](#holographic-remoting) |  Windows 10 C++ | Holographic Remoting streams holographic content from a PC to your Microsoft HoloLens in real time, by using a Wi-Fi connection. |

## Sample apps

[!INCLUDE[](includes/tabs-samples.md)]

## Other feature samples

For each of the developer scenarios listed below, there are feature samples that correspond to specific implementations that are covered in our documentation and covers a range of development platforms and hardware devices.

### Getting started with cross-platform developer tools

If you're new to mixed reality cross-platform development, these samples will help you to getting started.

For developers targeting Unity 2020 to build HoloLens 2 or Mixed Reality applications, OpenXR plugin can be used instead of WindowsXR plugin for better cross platform compatibilities. The Mixed Reality OpenXR Plugin also works well with latest Mixed Reality Toolkit 2.7.

<br>

| Reference article | Sample |
| --- | --- |
| [Using the OpenXR plugin](./unity/xr-project-setup.md) | [Mixed Reality OpenXR with Unity samples](https://github.com/microsoft/OpenXR-Unity-MixedReality-Samples) |
| N/A | [OpenXR MRTK Base Unity project](https://github.com/microsoft/UnityOpenXRMRTKBase) |

### Holographic Mixed Reality Capture

Mixed reality capture (MRC) captures the first-person experience of mixing real and digital worlds as a photo or video, sharing what you see with others in real time.

<br>

| Reference article | Sample |
| --- | --- |
| [Mixed Reality Capture](platform-capabilities-and-apis/mixed-reality-capture-for-developers.md) | [Mixed Reality Capture samples](/samples/microsoft/windows-universal-samples/holographicmixedrealitycapture/) |

#### Research Mode

Research Mode was introduced in the first-generation HoloLens to give access to key sensors on the device, specifically for research applications that are not intended for deployment. The sample applications below are examples for accessing and recording Research Mode streams and using the [intrinsic and extrinsic](/windows/mixed-reality/locatable-camera#locating-the-device-camera-in-the-world).

<br>

| Reference article | Sample application |
| --- | --- |
| [Research Mode](platform-capabilities-and-apis/research-mode.md) | [HoloLens (first gen)](https://github.com/microsoft/HoloLensForCV/tree/master/Samples) |
| [Research Mode](platform-capabilities-and-apis/research-mode.md) | [HoloLens 2](https://github.com/microsoft/HoloLens2ForCV/tree/main/Samples) |

### Spatial interaction - basic hologram sample

This sample runs on Windows Mixed Reality and renders a spinning cube. You can interact with the cube by placing it in a new position, and various input methods are allowed. This sample works on PCs with headset devices attached, and also on Microsoft HoloLens.

<br>

| Reference article | Sample |
| --- | --- |
| N/A | [Windows Universal samples - basic hologram](https://github.com/microsoft/Windows-universal-samples/tree/main/Samples/BasicHologram) |

### Holographic Remoting

The Holographic Remoting Player is a companion app that connects to PC apps and games that support Holographic Remoting. Holographic Remoting streams holographic content from a PC to your Microsoft HoloLens in real time, using a Wi-Fi connection, and is supported on HoloLens (first gen) and HoloLens 2.

<br>

| Reference article | Sample |
| --- | --- |
| [Holographic Remoting](platform-capabilities-and-apis/holographic-remoting-player.md) | [Holographic Remoting samples](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples) |
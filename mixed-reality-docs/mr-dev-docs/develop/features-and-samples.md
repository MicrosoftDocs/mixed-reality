---
title: Samples
description: Stay up to date with all the available Microsoft sample apps and mixed reality features samples for HoloLens.
author: qianw211
ms.author: jemccull
ms.date: 8/6/2021
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens, learn, samples, MRTK, research mode, HoloLens 2, qr codes, WebRTC, mixed reality capture, holographic remoting, UX Tools
ms.localizationpriority: high
---

# Samples

![Picture of a user wearing a HoloLens and manipulating a hologram with hand movement](unreal/images/unreal-developer.jpg)

Every development journey starts with a look back at what other developers have successfully built - mixed reality is no different. Currently, all of our tutorials and sample apps are built in Unity or Unreal. As we develop content for other engines and platforms, you'll find them under the relevant heading in the Table of Contents.

* [Sample apps case studies](#sample-apps-case-studies)
* [Feature samples](#list-of-feature-samples)

## Sample apps case studies

[!INCLUDE[](includes/tabs-samples.md)]

## Feature samples

For each of the developer scenarios listed below, there are feature samples that correspond to specific implementations that are covered in our documentation and covers a range of development platforms and hardware devices.

| Scenario | Feature sample | Engine | Description |
| --- | --- | ---- | --- |
| [Getting started](#getting-started-with-cross-platform-developer-tools) | [OpenXR with Unity samples](#getting-started-with-cross-platform-developer-tools) | Unity C# | Getting started with cross-platform developer tools. |
| [Camera capture](#camera-captures) | [Mixed reality capture sample](#holographic-mixed-reality-capture) | Windows 10 C++ | Capture the first-person experience of mixing real and digital worlds as a photo or video. |
|  | [Scene understanding sample](#scene-understanding) | Unity C# | Help design environmentally aware mixed reality applications. |
| | [Spectator view sample](#spectator-view) | Unity C# | Capture and render holograms at the correct size and orientation. |
| | [Research Mode samples](#research-mode) | Windows 10 C++ | Access to key censors on a HoloLens device for research applications. |
| [Contextual data overlays](#contextual-data-overlays) | [QR Codes](#qr-codes) | Unity C# | Detect QR Codes in the environment. |
| | [Poster tracker sample](#poster-tracker-sample)  | Unity C# | Align a hologram with a real world object. |
| [Collaboration in mixed reality](#collaboration-in-mixed-reality) | [User identity](#user-identity) | Unity C#, AAD | Set up your HoloLens 2 device using Azure Active Directory (AAD) credentials. |
| | [WebRTC sample](#webrtc) | Unity C#, NuGet | Integrate peer-to-peer audio, video, and data real-time communication into a mixed reality application. |
| [Spatial interaction](#spatial-interaction---basic-hologram-sample) | [Basic hologram sample](#spatial-interaction---basic-hologram-sample) | Windows 10 C++ |Windows mixed reality sample that renders a spinning cube. |
| Task management | [Dynamics 365 Remote Assist](dynamics365/mixed-reality/remote-assist/ra-overview) | | Technicians can collaborate more efficiently by working together from different locations with Dynamics 365 Remote Assist on HoloLens, HoloLens 2, Android, or iOS devices. |
| Spatial cloud services | [Azure Remote Rendering samples](azure/remote-rendering/samples/sample-model) | | Some resources for sample data that can be used for testing the Azure Remote Rendering service. |
|    | [Azure Object Anchors samples](https://github.com/Azure/azure-object-anchors) | | [Azure Object Anchors](azure/object-anchors/overview) enables an application to detect an object in the physical world using a 3D model and estimate its 6DoF pose. |
|    | [Azure Spatial Anchors samples](https://github.com/Azure/azure-spatial-anchors-samples) |  | [Azure Spatial Anchors](azure/spatial-anchors/overview) empowers developers with essential capabilities to build spatially aware mixed reality applications. |
| Anchoring Strategies | Local anchor |  | See the [Spatial anchors](windows/mixed-reality/design/spatial-anchors) article. |
|    | [Azure Spatial Anchors samples](https://github.com/Azure/azure-spatial-anchors-samples) |  | [Azure Spatial Anchors](azure/spatial-anchors/overview) empowers developers with essential capabilities to build spatially aware mixed reality applications. |
| | [QR Codes](#qr-codes) | Unity C# | Detect QR Codes in the environment. |
| [Holographic Remoting](#holographic-remoting) | [Holographic Remoting player](#holographic-remoting) |  Windows 10 C++ | Holographic Remoting streams holographic content from a PC to your Microsoft HoloLens in real time, by using a Wi-Fi connection. |

### Getting started with cross-platform developer tools

If you're new to mixed reality cross-platform development, these samples will help you to getting started.

For developers targeting Unity 2020 to build HoloLens 2 or Mixed Reality applications, OpenXR plugin can be used instead of WindowsXR plugin for better cross platform compatibilities. The Mixed Reality OpenXR Plugin also works well with latest Mixed Reality Toolkit 2.7.

<br>

| Reference article | Sample |
| --- | --- |
| [Using the OpenXR plugin](./unity/xr-project-setup.md) | [Mixed Reality OpenXR with Unity samples](https://github.com/microsoft/OpenXR-Unity-MixedReality-Samples) |
| N/A | [OpenXR MRTK Base Unity project](https://github.com/microsoft/UnityOpenXRMRTKBase) |

### Camera captures

Unstructured environment sensor data that your Mixed Reality device captures are converted into powerful abstract or holographic representations of the physical world around us. 

#### Holographic Mixed Reality Capture

Mixed reality capture (MRC) captures the first-person experience of mixing real and digital worlds as a photo or video, sharing what you see with others in real time.

<br>

| Reference article | Sample |
| --- | --- |
| [Mixed Reality Capture](platform-capabilities-and-apis/mixed-reality-capture-for-developers.md) | [Mixed Reality Capture samples](/samples/microsoft/windows-universal-samples/holographicmixedrealitycapture/) |

#### Scene understanding

Scene understanding provides Mixed Reality developers with a structured, high-level environment representation.  Scene understanding is designed for developing intuitive and environmentally aware applications, by combining the power of existing mixed reality runtimes. These runtimes are the highly accurate but less structured spatial mapping and new AI driven runtimes.

<br>

| Reference article | Sample |
| --- | --- |
| [Scene understanding](../design/scene-understanding.md) | [Mixed Reality Scene Understanding samples](https://github.com/microsoft/MixedReality-SceneUnderstanding-Samples) |

#### Spectator view

Spectator view renders holograms from Unity over a color frame from a capture card. This sample uses the calibration data from the calibration app to render the holograms at the correct size and orientation.  

<br>

| Reference article | Sample application |
| --- | --- |
| N/A | [Spectator view mobile setup](https://github.com/microsoft/MixedReality-SpectatorView/blob/master/doc/SpectatorView.Setup.md#spectator-view-mobile-setup) |

#### Research Mode

Research Mode was introduced in the first-generation HoloLens to give access to key sensors on the device, specifically for research applications that are not intended for deployment. The sample applications below are examples for accessing and recording Research Mode streams and using the [intrinsic and extrinsic](/windows/mixed-reality/locatable-camera#locating-the-device-camera-in-the-world).

<br>

| Reference article | Sample application |
| --- | --- |
| [Research Mode](platform-capabilities-and-apis/research-mode.md) | [HoloLens (first gen)](https://github.com/microsoft/HoloLensForCV/tree/master/Samples) |
| [Research Mode](platform-capabilities-and-apis/research-mode.md) | [HoloLens 2](https://github.com/microsoft/HoloLens2ForCV/tree/main/Samples) |


### Contextual data overlays

Contextual data is the background information that provides a broader understanding of an event, person, or item.  With Augmented Reality (AR), this information can be displayed and precisely aligned with physical objects to provide insights, instructions, service records, and other important data.

#### QR codes

HoloLens 2 can detect QR codes in the environment around the headset, establishing a coordinate system at each code's real-world location.

<br>

| Reference article | Sample |
| --- | --- |
| [QR codes](platform-capabilities-and-apis/qr-code-tracking.md) | [QR code tracking in Unity](https://github.com/microsoft/MixedReality-QRCode-Sample) |

#### Poster tracker sample

It is often helpful to be able to align a hologram to a real world object, or align multiple HoloLens devices to a common set of world coordinates, so everyone sees the same holograms in the same location. For instance, in your Unity scene, you can add a "poster" where you want to anchor your scene (perhaps a game board), and then add holograms on or around it. Then you can print the poster, lay it on a table and run the calibration/alignment tool, which will move the holographic version of the poster to align with the physical version of the poster. Thus moving all of the linked holograms to the correct alignment.

<br>

| Reference article | Sample |
| --- | --- |
| N/A | [Poster calibration sample](https://github.com/microsoft/MixedRealityCompanionKit/tree/master/PosterCalibrationSample) |

### Collaboration in mixed reality

In mixed reality, people come together virtually to share experiences and collaborate.  Samples listed here demonstrate some features that make such collaboration possible.

#### User identity 

This sample sets up your HoloLens 2 device using Azure Active Directory (AAD) credentials, and then configures the device to use iris login.

<br>

| Reference article | Sample |
| --- | --- |
| [Overview of Microsoft identity platform](/azure/active-directory/develop/v2-overview) | [AAD Login on HoloLens 2](https://github.com/peted70/aad-hololens) |

#### WebRTC

The MixedReality-WebRTC project is a collection of components to help mixed reality app developers to integrate peer-to-peer audio, video, and data real-time communication into their applications. WebRTC components are based on the WebRTC protocol for Real-Time Communication (RTC), which is supported by most modern web browsers.

<br>

| Reference article | Sample |
| --- | --- |
| [WebRTC](https://microsoft.github.io/MixedReality-WebRTC) | [WebRTC sample apps](https://github.com/microsoft/MixedReality-WebRTC/tree/master/examples) |

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
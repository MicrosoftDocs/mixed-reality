# [Unity](#tab/unity)

![Unity](../images/unity_logo_banner.png)<br>

Build a cross-platform, full-featured mixed reality app with Unity. See the [Unity development overview](../unity/unity-development-overview.md) to get started with Unity development for HoloLens or Windows Mixed Reality immersive headsets.

## What does Unity offer?

Unity is one of the leading real-time development platforms on the market, boasting an ecosystem with a dedicated [learning platform](https://unity.com/products/learn-premium), [asset store](https://assetstore.unity.com/), [full documentation](https://docs.unity3d.com/Manual/index.html), and a thriving community. Unity's underlying runtime code is written in C++, but all development scripting is done in C#. Whether you're looking to build games, movies and animation cinematics, or even render architectural or engineering concepts in a virtual world, Unity has the infrastructure to support you.

## Available hardware platforms

You have several hardware and emulator options when building Mixed Reality apps with Unity. While our developer documentation focuses on HoloLens devices, you'll find device support sections with details on immersive headset deployment when applicable.

**Augmented reality devices**
* [HoloLens (1st Gen)](https://docs.microsoft.com/hololens/hololens1-hardware)
* [HoloLens 2](https://docs.microsoft.com/hololens/hololens2-hardware)

**Immersive VR headsets**
* HP Reverb and Reverb G2
* Samsung Odyssey and Odyssey+
* HP Windows Mixed Reality headset
* Lenovo Explorer
* Acer AH101
* Dell Visor
* Asus HC102
* Acer OJO 500

## Available tools and SDKs

|  Tool/SDK  |  Description  |
| --- | --- |
| [Mixed Reality Toolkit for Unity](../unity/mrtk-getting-started.md) | The Mixed Reality Toolkit for Unity is an open source cross-platform development kit built to accelerate development of applications targeting Microsoft HoloLens, Windows Mixed Reality immersive (VR) headsets and OpenVR platform. |

## Examples

We have several open source [sample apps](../unity/samples.md) for you to download and play around with to get a feel for a Mixed Reality end product in Unity. There are also MRTK example scenes available for you to test out specific features:
* [Hand interaction examples scene (MRTK) for Unity](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/GettingStartedWithTheMRTK.html#open-and-run-the-handinteractionexamples-scene-in-editor) -
The HandInteractionExamples.unity example scene contains various types of interactions and UI controls that highlight articulated hand input.

* [Eye tracking examples (MRTK) for Unity](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_ExamplesOverview.html) - 
This page covers how to get quickly started with using eye tracking in MRTK by building on our provided MRTK eye tracking examples.

>[!NOTE]
>Both of the MRTK example scenes require MRTK Foundation and Example Unity packages to be installed.

# [Unreal](#tab/unreal)

![Unreal](../images/unreal_logo_banner.png)

Build a cross-platform, full-featured mixed reality app with Unreal. See the [Unreal development overview](../unreal/unreal-development-overview.md) to get started with Unreal development for HoloLens.

## What does Unreal offer?

Unreal Engine 4 is a powerful, open source creation engine with full support for mixed reality in both C++ and Blueprints. As of Unreal Engine 4.25, HoloLens support is full-featured and production-ready.

## Available hardware platforms

You have several hardware, emulator, and streaming options when building Mixed Reality apps with Unreal Engine. While our developer documentation focuses on HoloLens devices, you can package your Unreal projects as x64 desktop apps and run them on immersive headsets just fine.

**Augmented reality devices**
* [HoloLens (1st Gen)](https://docs.microsoft.com/hololens/hololens1-hardware)
* [HoloLens 2](https://docs.microsoft.com/hololens/hololens2-hardware)

**Immersive VR headsets**
* HP Reverb and Reverb G2
* Samsung Odyssey and Odyssey+
* HP Windows Mixed Reality headset
* Lenovo Explorer
* Acer AH101
* Dell Visor
* Asus HC102
* Acer OJO 500

## Available tools and SDKs

|  Tool/SDK  |  Description  |
| --- | --- |
| [Mixed Reality Toolkit for Unreal](https://github.com/microsoft/MixedRealityToolkit-Unreal) | The Mixed Reality Toolkit for Unreal (MRTK-Unreal) is a set of components, in the form of plugins, samples and documentation, designed to accelerate development of mixed reality applications using the Unreal Engine. |

## Examples

* [Kippy's Escape](../unreal-kippys-escape.md) - Kippy’s Escape is an open-source HoloLens 2 sample app built with Unreal Engine 4 and Mixed Reality UX Tools for Unreal. The game showcases the unique features of the HoloLens 2 hardware and the development power of the Mixed Reality UX Tools.


# [Web](#tab/web)

![Web](../images/javascript_logo_banner.png)

The WebXR Device API is an open specification that allows you to experience Mixed Reality apps in your browser on any platform. See the [Javascript development overview](../web/javascript-development-overview.md) to get started building Mixed Reality apps for any platform.


# [Native (OpenXR)](#tab/native)

 ![Native](../images/native_logo_banner.png)

Create mixed reality apps with a direct line to the Windows Mixed Reality APIs. See the [Native development overview](../native/directx-development-overview.md) to get started with native app development using OpenXR or legacy WinRT for HoloLens 2 or Windows Mixed Reality immersive headsets. The Windows Mixed Reality API supports applications written in C++ and C#, allowing you to build your own framework or middleware in either language.

## What does OpenXR offer?

OpenXR is an open royalty-free API standard from Khronos that provides engines native access to a wide range of devices from vendors across the mixed reality spectrum. You can develop using OpenXR on a HoloLens 2 or Windows Mixed Reality immersive headset on the desktop. If you don't have access to a headset, emulators for HoloLens 2 and Windows Mixed Reality headsets are available.

## Available hardware platforms

You have several hardware, emulator, and streaming options when building Mixed Reality apps with OpenXR development. 

**Augmented reality devices**
* [HoloLens 2](https://docs.microsoft.com/hololens/hololens2-hardware)

**Immersive VR headsets**
* HP Reverb and Reverb G2
* Samsung Odyssey and Odyssey+
* HP Windows Mixed Reality headset
* Lenovo Explorer
* Acer AH101
* Dell Visor
* Asus HC102
* Acer OJO 500

## Available tools and SDKs

|  Tool/SDK  |  Description  |
| --- | --- |
| [OpenXR Developer Tools](../native/openxr-getting-started.md#getting-the-windows-mixed-reality-openxr-developer-tools) | Provides a demo scene that exercises various features of OpenXR, along with a System Status page that provides key information about the active runtime and the current headset. |
| [OpenXR Spec](https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html) |  Describes what OpenXR is, what capabilities and features it offers, and how to implement it into your own projects. |
| [OpenXR Loader](../native/openxr-getting-started.md#integrate-the-openxr-loader-into-a-project) | Discovers the active OpenXR runtime on the device and provides access to the core functions and extension functions that it implements. |

## Examples

Feel free to play around with the sample app to get a feel for what's possible with Native development and Mixed Reality.

<!-- Go to actual GH link for more samples -->
* [BasicXrApp](https://github.com/microsoft/OpenXR-MixedReality/tree/master/samples/BasicXrApp) - Demonstrates a simple OpenXR sample with two Visual Studio project files, one for both a Win32 desktop app and one for a UWP HoloLens 2 app.
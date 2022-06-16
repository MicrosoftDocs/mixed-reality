---
title: Iteration and debugging
description: Iteration and debugging
author: MaxWang-MS
ms.author: wangmax
ms.date: 6/3/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, debugging
---

# Iteration and debugging

Compiling and deploying your app can take a significant amount of time, so we recommend a variety of instant iteration/preview solutions while developing your application.

- [In-editor input simulation](../mrtk3-input/packages/input/input-simulation.md)
    - Easily preview your app without any XR device attached. Control the user's head, hands, and hand gestures with traditional WASD controls.
- **Recommended:** [Holographic remoting (on HoloLens 2)](/windows/mixed-reality/develop/unity/preview-and-debug-your-app)
    - For development on Hololens 2 and related platforms (including other OpenXR targets that include hand tracking), we strongly recommend the use of holographic remoting to accelerate your iteration time. Advanced features like hand tracking, eye tracking, and scene reconstruction are available through remoting, and behave the same as if the app were deployed to a device.
- Play-mode testing with the desktop's active OpenXR runtime
  - Many popular PC VR platforms now support OpenXR, including [Windows Mixed Reality](https://www.microsoft.com/p/openxr-tools-for-windows-mixed-reality/), [SteamVR](https://www.steamvr.com/), and [Oculus Rift on PC](https://developer.oculus.com/documentation/native/pc/dg-openxr/).
- **Experimental**: [Oculus Link for Quest](https://support.oculus.com/airlink)
    - Some aspects of hand interactions are still being developed for Quest, and your results may vary.
    - Controller interactions should be full parity over Link.

If you've deployed a build to your target device of choice, you can debug the build as it runs on device with [Managed debugging](https://docs.microsoft.com/windows/mixed-reality/develop/unity/managed-debugging-with-unity-il2cpp).

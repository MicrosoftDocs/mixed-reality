---
title: OpenXR troubleshooting
description: Troubleshoot issues in your OpenXR applications.
author: thetuvix
ms.author: alexturn
ms.date: 2/28/2020
ms.topic: article
keywords: OpenXR, Khronos, BasicXRApp, DirectX, native, native app, custom engine, middleware, troubleshooting
---



# OpenXR troubleshooting

Here are some troubleshooting tips when developing an OpenXR app using the Windows Mixed Reality OpenXR Runtime.  If you have any other questions about the <a href="https://www.khronos.org/registry/OpenXR/specs/1.0/html/xrspec.html" target="_blank">OpenXR 1.0 specification</a>, please visit the <a href="https://community.khronos.org/c/openxr" target="_blank">Khronos OpenXR Forums</a> or <a href="https://khr.io/slack" target="_blank">Slack #openxr channel</a>.

### OpenXR app not starting Windows Mixed Reality

If your OpenXR app is not starting Windows Mixed Reality when you run it, the Windows Mixed Reality OpenXR Runtime may not be set as the active runtime.  Be sure to follow the instructions above for [getting started with OpenXR for Windows Mixed Reality headsets](openxr-getting-started.md#getting-started-with-openxr-for-windows-mixed-reality-headsets) to make the runtime active.

You can also run the [Windows Mixed Reality OpenXR Developer Portal](openxr-getting-started.md#getting-the-windows-mixed-reality-openxr-developer-portal) for additional troubleshooting help around the state of the Windows Mixed Reality OpenXR Runtime on your system.

### Mixed Reality Portal not showing "Set up OpenXR" menu item

Be sure you are running at least the Windows 10 October 2018 Update (1809).  If you're on an earlier version of Windows 10, you can upgrade to the May 2019 Update (1903) using the [Windows 10 Update Assistant](https://www.microsoft.com//software-download/windows10).

The "Set up OpenXR" menu item may not be available if you have an older version of the Mixed Reality Portal app.  Check for a [Mixed Reality Portal app update](https://www.microsoft.com/p/mixed-reality-portal/9ng1h8b3zc7m) to ensure you have the latest version.

Note that the "Set up OpenXR" menu item will not show up if the Windows Mixed Reality OpenXR Runtime is already installed and active.  You can install the [Mixed Reality OpenXR Developer Portal](openxr-getting-started.md#getting-the-windows-mixed-reality-openxr-developer-portal) to determine the current status of the OpenXR runtime on your system.
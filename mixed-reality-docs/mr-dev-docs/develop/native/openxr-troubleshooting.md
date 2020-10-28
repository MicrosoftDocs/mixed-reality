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

>[!NOTE]
>There are known issues in the current Windows Mixed Reality OpenXR runtime with x86 apps.  You should build desktop OpenXR apps for x64 at the moment.

### OpenXR app not starting Windows Mixed Reality

If your OpenXR app is not starting Windows Mixed Reality when you run it, the Windows Mixed Reality OpenXR Runtime may not be set as the active runtime.  Be sure to follow the instructions for [getting started with OpenXR for Windows Mixed Reality headsets](openxr-getting-started.md#getting-started-with-openxr-for-windows-mixed-reality-headsets) to make the runtime active.

You can also run the [OpenXR Developer Tools for Windows Mixed Reality](openxr-getting-started.md#getting-the-windows-mixed-reality-openxr-developer-tools) for additional troubleshooting help around the state of the Windows Mixed Reality OpenXR Runtime on your system.
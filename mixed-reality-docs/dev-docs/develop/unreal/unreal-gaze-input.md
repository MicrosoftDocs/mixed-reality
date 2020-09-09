---
title: Gaze Input in Unreal
description: Tutorial on setting up gaze input for HoloLens and Unreal Engine
author: hferrone
ms.author: v-haferr
ms.date: 06/10/2020
ms.topic: article
keywords: Windows Mixed Reality, holograms, HoloLens 2, eye tracking, gaze input, head mounted display, Unreal engine 
---


# Gaze Input

## Overview

The [Windows Mixed Reality plugin](https://docs.unrealengine.com/Platforms/VR/WMR/index.html) doesn’t provide any built-in functions for gaze input, but HoloLens 2 does support eye tracking. The actual tracking features are provided by Unreal's **Head Mounted Display** and **Eye Tracking** APIs and include:

- Device information
- Tracking sensors
- Orientation and position
- Clipping panes
- Gaze data and tracking information

You can find the full list of features in Unreal's [Head Mounted Display](https://docs.unrealengine.com/BlueprintAPI/Input/HeadMountedDisplay/index.html) and [Eye Tracking](https://docs.unrealengine.com/BlueprintAPI/EyeTracking/index.html) documentation.

In addition to the Unreal APIs, check out the documentation on [eye-gaze-based interaction](../../design/eye-gaze-interaction.md) for HoloLens 2 and read up on how [eye tracking on HoloLens 2](https://docs.microsoft.com/windows/mixed-reality/eye-tracking) works.

> [!IMPORTANT]
> Eye tracking is only supported on HoloLens 2.

## Enabling eye tracking
Gaze input needs to be enabled in the HoloLens project settings before you can use any of Unreal's APIs. When the application starts you'll see a consent prompt shown in the screenshot below.

- Select **Yes** to set the permission and get access to gaze input. If you need to change this setting at any time, it can be found in the **Settings** app.

![Eye Input Permissions](images/unreal/eye-input-permissions.png)

> [!NOTE] 
> HoloLens eye tracking in Unreal only has a single gaze ray for both eyes instead of the two rays needed for stereoscopic tracking, which is not supported.

That's all the setup you'll need to start adding gaze input to your HoloLens 2 apps in Unreal. More information on gaze input and how it affects users in mixed reality can be found at the links below. Be sure to think about these when building your interactive experiences.

## See also
* [Calibration](../../calibration.md)
* [Comfort](../../design/comfort.md)
* [Gaze and commit](../../design/gaze-and-commit.md)
* [Voice input](../../out-of-scope/voice-design.md)

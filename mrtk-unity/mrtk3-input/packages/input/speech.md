---
title: Speech input
description: Speech input in MRTK3
author: MaxWang-MS
ms.author: wangmax
ms.date: 6/7/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, speech, Mixed Reality Toolkit
---

# Speech input &#8212; MRTK3

## Overview

Speech input in MRTK is achieved by an implementation of  `KeywordRecognitionSubsystem`. By default, MRTK ships `WindowsKeywordRecognitionSubsystem`, which utilizes Unity's `KeywordRecognizer`. As in MRTK v2, this default implementation is only supported on Windows Editor, Standalone Windows, and UWP.

> [!NOTE]
> This guide provides steps to enable the speech subsystem in a new MRTK project, assuming basic non-speech-related setup is already in place. If you're using our sample project, you may notice that some steps have been performed for you.

## Setup

### Enable the speech subsystem

1. Go to **Project Settings -> Mixed Reality Toolkit -> Available MRTK Subsystems**.
2. Enable the speech subsystem you would like to use.

### Configure the profile correctly

For certain subsystems, a profile is required in order for it to perform normally. The currently shipped `WindowsKeywordRecognitionSubsystem` doesn't require a profile, so you can skip this setup. Keep in mind that profiles may be needed by other future implementations of the `KeywordRecognitionSubsystem`.

### Ensure that the MRTK Speech GameObject is active

Ensure the relevant script(s) is active by confirming that **MRTK XR Rig -> MRTK Speech** is active.

### Ensure that the proper capability is set in Player Settings

Using UWP Platform as an example: Go to **Project Settings -> Player -> Publishing Settings -> Capabilities** and ensure that  **Microphone Capabilities** is set.

### Running the scene on device/in editor

The project should be ready to run on a device or in the editor.

> **Note** >`StatefulInteractable` (or its subclass such as `PressableButton`) needs to be set up to accept voice commands in order for the speech subsystem to work with it. Please see its inspector (under Advanced StatefulInteractable Settings) as well as the SpeechInteractor (**MRTK XR Rig -> MRTK Speech**) for more adjustable settings.

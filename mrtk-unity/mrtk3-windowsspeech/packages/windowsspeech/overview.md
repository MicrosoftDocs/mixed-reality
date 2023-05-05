---
title: Windows Speech Package
description: Overview of MRTK3 Windows speech package
author: marlenaklein-msft
ms.author: marlenaklein
ms.date: 5/5/2023
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, windows speech, speech, keyword, keyword recognition, speech recognition, Mixed Reality Toolkit
---

# Windows speech package &#8212; MRTK3


## Keyword Recognition

The Windows Speech package adds `WindowsKeywordRecognitionSubsystem` to your project, which offers keyword recognition capabilities on Windows and UWP platforms. As a [MRTK `KeywordRecognitionSubsystem`](../../../mrtk3-core/packages/core/subsystems/keywordrecognitionsubsystem.md), the subsystem can work with `SpeechInteractor` to trigger select events on `StatefulInteractable`s based on the settings of the interactables. You can also register arbitrary `UnityAction`s to a keyword of your choice so that the action will be invoked when such word is said.

For general information on `KeywordRecognitionSubsystem` in MRTK, [refer to the documentation](../../../mrtk3-core/packages/core/subsystems/keywordrecognitionsubsystem.md).

> [!NOTE]
> As the name suggests, `WindowsKeywordRecognitionSubsystem` only works on the Windows standalone and UWP platforms.

### Setup and Usage

Please refer to the [Setup](../../../mrtk3-core/packages/core/subsystems/keywordrecognitionsubsystem.md#setup) and [Using KeywordRecognitionSubsystem](../../../mrtk3-core/packages/core/subsystems/keywordrecognitionsubsystem.md#using-keywordrecognitionsubsystem-manually) sections of the `KeywordRecognitionSubsystem` article. Note that for `WindowsKeywordRecognitionSubsystem`, a configuration asset is not needed; the only capability needed in player settings is "microphone".

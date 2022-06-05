---
title: Windows Speech Package Overview
description: Overview of MRTK3 Windows speech package
author: MaxWang-MS
ms.author: wangmax
ms.date: 6/5/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, windows speech, speech, phrase, phrase recognition, speech recognition, Mixed Reality Toolkit
---

# Overview of MRTK3 Windows speech package

The Windows Speech package adds `WindowsPhraseRecognitionSubsystem` to your project, which offers phrase recognition capabilities on Windows and UWP platforms. As a [MRTK `PhraseRecognitionSubsystem`](../../../mrtk3-core/packages/core/subsystems/phraserecognitionsubsystem), the subsystem can work with `SpeechInteractor`to trigger select events on `StatefulInteractable`s based on the settings of the interactables. You can also register arbitrary `UnityAction`s to a keyword of your choice so that the action will be invoked when such word is said.

For general information on `PhraseRecognitionSubsystem` in MRTK, please refer to the documentation [here](../../../mrtk3-core/packages/core/subsystems/phraserecognitionsubsystem).

> [!NOTE] 
> As the name suggests, `WindowsPhraseRecognitionSubsystem` only works on the Windows standalone and UWP platforms.

## Setup and Usage

Please refer to the [Setup](../../../mrtk3-core/packages/core/subsystems/phraserecognitionsubsystem#setup) and [Using PhraseRecognitionSubsystem](../../../mrtk3-core/packages/core/subsystems/phraserecognitionsubsystem#using-phraserecognitionsubsystem) sections of the [`PhraseRecognitionSubsystem` doc](../../../mrtk3-core/packages/core/subsystems/phraserecognitionsubsystem). Note for `WindowsPhraseRecognitionSubsystem`, configuration asset is not needed and the only capability needed in play settings in microphone.
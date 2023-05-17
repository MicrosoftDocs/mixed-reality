---
title: Windows Speech Package
description: Overview of MRTK3 Windows speech package
author: marlenaklein-msft
ms.author: marlenaklein
ms.date: 5/17/2023
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, windows speech, speech, keyword, keyword recognition, speech recognition, Mixed Reality Toolkit
---

# Windows speech package &#8212; MRTK3

## Keyword Recognition

The Windows Speech package adds `WindowsKeywordRecognitionSubsystem` to your project, which offers keyword recognition capabilities on Windows and UWP platforms. As a [MRTK KeywordRecognitionSubsystem](../../../mrtk3-core/packages/core/subsystems/keywordrecognitionsubsystem.md), the subsystem can work with `SpeechInteractor` to trigger select events on `StatefulInteractable's` based on the settings of the interactables. You can also register arbitrary `UnityAction's` to a keyword of your choice so that the action will be invoked when such word is said.

For general information on `KeywordRecognitionSubsystem` in MRTK, [refer to the documentation](../../../mrtk3-core/packages/core/subsystems/keywordrecognitionsubsystem.md).

### Setup and Usage

Please refer to the [Setup](../../../mrtk3-core/packages/core/subsystems/keywordrecognitionsubsystem.md#setup) and [Using KeywordRecognitionSubsystem](../../../mrtk3-core/packages/core/subsystems/keywordrecognitionsubsystem.md#using-keywordrecognitionsubsystem-manually) sections of the `KeywordRecognitionSubsystem` article. Note that for `WindowsKeywordRecognitionSubsystem`, a configuration asset is not needed; the only capability needed in player settings is "microphone".

## Dictation

The Windows Speech package also adds `WindowsDictationSubsystem` to your project, which offers dictation capabilities on Windows and UWP platforms. As a [MRTK DictationSubsystem](../../../mrtk3-core/packages/core/subsystems/dictationsubsystem.md), the subsystem allows you to start and stop a dictation session, and provides the following events:

* `Recognizing` is triggered when the recognizer is processing the input and returns a tentative result.
* `Recognized` is triggered when the recognizer recognized the input and returns a final result.
* `RecognitionFinished` is triggered when the recognition session is finished and returns a reason.
* `RecognitionFaulted` is triggered when the recognition is faulted (i.e. error occurred) and returns a reason.

For general information on `DictationSubsystem` in MRTK, [refer to the documentation](../../../mrtk3-core/packages/core/subsystems/dictationsubsystem.md).

### Setup and Usage

Please refer to the [Setup](../../../mrtk3-core/packages/core/subsystems/dictationsubsystem.md#setup) and [Using DictationSubsystem](../../../mrtk3-core/packages/core/subsystems/dictationsubsystem.md#using-dictationsubsystem) sections of the `DictationSubsystem` article. Note that for `WindowsDictationSubsystem`, a configuration asset is not needed; the only capability needed in player settings is "microphone".

## Text To Speech

Lastly, the Windows Speech package adds `WindowsTextToSpeechSubsystem` to your project, which offers the capability to synthesize and speak a text phrase on Windows and UWP platforms. For general information on `TextToSpeechSubsystem` in MRTK, [refer to the documentation](../../../mrtk3-core/packages/core/subsystems/texttospeechsubsystem.md).

### Setup and Usage

Please refer to the [Setup](../../../mrtk3-core/packages/core/subsystems/texttospeechsubsystem.md#setup) and [Using TextToSpeechSubsystem](../../../mrtk3-core/packages/core/subsystems/texttospeechsubsystem.md#using-texttospeechsubsystem) sections of the `TextToSpeechSubsystem` article. Note that for `WindowsTextToSpeechSubsystem`, a configuration asset is not needed; however it can be useful to set custom voices.

> [!NOTE]
> As the names suggest, `WindowsKeywordRecognitionSubsystem`, `WindowsDictationSubsystem`, and `WindowsTextToSpeechSubsystem` only work on the Windows standalone and UWP platforms.
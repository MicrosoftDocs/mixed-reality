---
title: PhraseRecognitionSubsystem Overview
description: Info on the MRTK3 subsystem responsible for phrase recognition
author: MaxWang-MS
ms.author: wangmax
ms.date: 6/5/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, phrase, speech, phrase recognition, speech recognition, Mixed Reality Toolkit
---

# Overview of PhraseRecognitionSubsystem

> [!NOTE] 
> For general information on subsystems in MRTK3, please see [here](../../../../mrtk3-overview/architecture/subsystems.md).

The Core Definitions package ships `PhraseRecognitionSubsystem`, a base implementation of `MRTKSubsystem` and `IPhraseRecognitionSubsystem` that severs as the base of subsystems responsible for keyword/phrase recognition in MRTK3. Concrete implementation shipped as part of MRTK such as `WindowsPhraseRecognitionSubsystem`, as well as other potential phrase recognition subsystem you might build, should all be based on this class. Subsystem inheriting from `PhraseRecognitionSubsystem` can work with `SpeechInteractor` to trigger select events on `StatefulInteractable`s based on the settings of the interactables. The inherited subclasses will also allow the registration of arbitrary `UnityAction`s to a keyword of your choice so that the action will be invoked when such word is said.

Please refer to the documentation of the concrete `PhraseRecognitionSubsystem` implementation you want to use for more specific information.

## Setup

> [!NOTE] 
> This guide provides steps to enable speech subsystem in a new MRTK project (with other basic non-speech related setup in place). If you are using our sample project you may notice some steps have been performed for you.

### 1. Enable the speech subsystem

Go to Project Settings -> MRTK3 -> Available MRTK Subsystems and enable the speech subsystem you would like to use.

### 2. Assign a configuration asset (for certain subsystems)

For certain subsystems, a [configuration asset](../../../../mrtk3-overview/architecture/subsystems.md#configuration) is required in order for it to perform normally. First click on the subsystem you enabled in Setup 1 and check if an empty `Configuration Asset` slot shows up under Subsystem Details on the right. If so create a new config by Assets -> Create -> MRTK -> Subsystems -> [name of your subsystem] Config and then drag the created config onto the slot. After making sure the config slot is populated, change the settings in the newly created config for your specific project. Remember to save the project when you are finished.

### 3. Ensure the MRTK Speech GameObject is active (required for `StatefulInteractable`s (e.g. buttons) to respond to phrases)

Ensure MRTK XR Rig -> MRTK Speech is active and the attached script(s) is enabled.

### 4. Ensure the proper capabilities are set in Player Settings

Different implementations of `PhraseRecognitionSubsystem` have different required capabilities. Please refer to the documentation of the subsystem you want to use for more information.

As an example, to use `WindowsPhraseRecognitionSubsystem` on UWP Platform, go to Project Settings -> Player -> Publishing Settings -> Capabilities and ensure the Microphone capability is set.

### 5. Running the scene on device/in editor

The project should now be ready to run on device or in editor.

## Using PhraseRecognitionSubsystem

### Using PhraseRecognitionSubsystem with `StatefulInteractable`s (e.g. buttons)

The easiest way to use `PhraseRecognitionSubsystem` is to use it with `StatefulInteractable`s. If Step 3 under the setup section is performed, the `SpeechInteractor` will trigger select events on `StatefulInteractable`s when the conditions specified on such interactables are met (e.g. a specified phrase is heard and the interactable is being gaze-hovered). Please see the inspector of `StatefulInteractable` and `SpeechInteractor` (MRTK XR Rig -> MRTK Speech) for configurable settings.

### Using PhraseRecognitionSubsystem manually

An alternative way to use `PhraseRecognitionSubsystem` is to manually register phrase and the `UnityAction` you want to see invoked when the phrase is heard with the subsystem.

```c#
// Get the first running phrase recognition subsystem.
var phraseRecognitionSubsystem = XRSubsystemHelpers.GetFirstRunningSubsystem<PhraseRecognitionSubsystem>();

// If we found one...
if (phraseRecognitionSubsystem != null)
{
    // Register a phrase and its associated action with the subsystem
    phraseRecognitionSubsystem.CreateOrGetEventForPhrase("your phrase").AddListener(() => Debug.Log("Phrase recognized"));
}
```
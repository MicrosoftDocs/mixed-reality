---
title: Core Subsystem KeywordRecognitionSubsystem
description: Info on the MRTK3 subsystem responsible for keyword recognition
author: marlenaklein-msft
ms.author: marlenaklein
ms.date: 5/5/2023
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, keyword, speech, keyword recognition, speech recognition, Mixed Reality Toolkit
---

# Core Subsystem: KeywordRecognitionSubsystem &#8212; MRTK3

> [!NOTE]
> For general information on subsystems in MRTK3, see [here](../../../../mrtk3-overview/architecture/subsystems.md).

The Core Definitions package ships `KeywordRecognitionSubsystem`, a base implementation of `MRTKSubsystem` and `IKeywordRecognitionSubsystem` that serves  as the base of subsystems responsible for keyword/phrase recognition in MRTK3. Concrete implementation shipped as part of MRTK such as `WindowsKeywordRecognitionSubsystem` and other potential phrase recognition subsystems you might build should all be based on this class. Subsystems inheriting from `KeywordRecognitionSubsystem` can work with `SpeechInteractor` to trigger select events on `StatefulInteractable's` based on the settings of the interactables. The inherited subclasses will also allow the registration of arbitrary `UnityAction's` to a keyword of your choice so that the action will be invoked when such word is said.

For more specific information, refer to the documentation of the concrete `KeywordRecognitionSubsystem` implementation you want to use.

## Setup

> [!NOTE]
> This guide provides steps to enable a speech subsystem in a new MRTK project (with other basic non-speech related setup in place). If you're using our sample project you might notice that some steps have been performed for you.

### 1. Enable the speech subsystem

Go to **Project Settings** > **MRTK3** **Available MRTK Subsystems** and then enable the speech subsystem you'd like to use.

### 2. Assign a configuration asset (for certain subsystems)

For certain subsystems, a [configuration asset](../../../../mrtk3-overview/architecture/subsystems.md#configuration) is required in order for it to perform normally. 

1. Click the subsystem you enabled in Setup 1.
1. Check to see if an empty `Configuration Asset` slot shows up under Subsystem Details on the right. If so, create a new config by selecting **Assets** -> **Create** **MRTK** > **Subsystems** > **[name of your subsystem] Config** and then dragging the created config onto the slot. 
1. After making sure the config slot is populated, change the settings in the newly created config for your specific project. Remember to save the project when you're finished.

### 3. Ensure the MRTK Speech GameObject is active (required in order for `StatefulInteractable`s (for example, buttons) to respond to phrases)

Ensure MRTK XR Rig -> MRTK Speech is active and the attached script(s) is enabled.

### 4. Ensure the proper capabilities are set in Player Settings

Different implementations of `KeywordRecognitionSubsystem` have different required capabilities. For more information, refer to the documentation of the subsystem you want to use.

As an example, to use `WindowsKeywordRecognitionSubsystem` on UWP Platform, go to **Project Settings** > **Player** > **Publishing Settings** > **Capabilities** and ensure the Microphone capability is set.

### 5. Running the scene on device/in editor

The project should now be ready to run on device or in editor.

## Using KeywordRecognitionSubsystem

### Using KeywordRecognitionSubsystem with `StatefulInteractable`s (for example, buttons)

The easiest way to use `KeywordRecognitionSubsystem` is to use it with `StatefulInteractable`s. If Step 3 under the setup section is performed, the `SpeechInteractor` will trigger select events on `StatefulInteractable`s when the conditions specified on such interactables are met (for example, a specified phrase is heard and the interactable is being gaze-hovered). See the inspector of `StatefulInteractable` and `SpeechInteractor` (MRTK XR Rig -> MRTK Speech) for configurable settings.

### Using KeywordRecognitionSubsystem manually

An alternative way to use `KeywordRecognitionSubsystem` is to manually register keyword and the `UnityAction` you want to see invoked when the keyword is heard with the subsystem.

```c#
// Get the first running phrase recognition subsystem.
var keywordRecognitionSubsystem = XRSubsystemHelpers.GetFirstRunningSubsystem<KeywordRecognitionSubsystem>();

// If we found one...
if (keywordRecognitionSubsystem != null)
{
    // Register a keyword and its associated action with the subsystem
    keywordRecognitionSubsystem.CreateOrGetEventForKeyword("your keyword").AddListener(() => Debug.Log("Keyword recognized"));
}
```

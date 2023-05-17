---
title: Core Subsystem DictationSubsystem
description: Info on the MRTK3 subsystem responsible for dictation
author: marlenaklein-msft
ms.author: marlenaklein
ms.date: 5/17/2023
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, keyword, speech, dictation, Mixed Reality Toolkit
---

# Core Subsystem: DictationSubsystem &#8212; MRTK3

> [!NOTE]
> For general information on subsystems in MRTK3, see [here](../../../../mrtk3-overview/architecture/subsystems.md).

The Core Definitions package ships `DictationSubsystem`, a base implementation of `MRTKSubsystem` and `IDictationsystem` that serves as the base of subsystems responsible for dictation in MRTK3. Concrete implementation shipped as part of MRTK such as `WindowsDictationSubsystem` and other potential dictation subsystems you might build should all be based on this class. Subsystems inheriting from `DictationSubsystem` will allow you to start and stop a dictation session, and will provide events that are triggered when speech input is being processed, when a final result is recognized, and when a dictation session is finished or faulted. Event handlers can be added to these events to handle dictation functionality.

For more specific information, refer to the documentation of the concrete `DictationSubsystem` implementation you want to use.

## Setup

> [!NOTE]
> This guide provides steps to enable a speech subsystem in a new MRTK project (with other basic non-speech related setup in place). If you're using our sample project you might notice that some steps have been performed for you.

### 1. Enable the speech subsystem

Go to **Project Settings** > **MRTK3** **Available MRTK Subsystems** and then enable the dictation subsystem you'd like to use.

### 2. Assign a configuration asset

For certain subsystems, a [configuration asset](../../../../mrtk3-overview/architecture/subsystems.md#configuration) is required in order for it to perform normally. 

1. Click the subsystem you enabled in Setup 1.
1. Check to see if an empty `Configuration Asset` slot shows up under Subsystem Details on the right. If so, create a new config by selecting **Assets** -> **Create** **MRTK** > **Subsystems** > **[name of your subsystem] Config** and then dragging the created config onto the slot. 
1. After making sure the config slot is populated, change the settings in the newly created config for your specific project. Remember to save the project when you're finished.

### 3. Ensure the proper capabilities are set in Player Settings

Different implementations of `DictationSubsystem` have different required capabilities. For more information, refer to the documentation of the subsystem you want to use.

As an example, to use `WindowsDictationSubsystem` on UWP Platform, go to **Project Settings** > **Player** > **Publishing Settings** > **Capabilities** and ensure the Microphone capability is set.

### 4. Running the scene on device/in editor

The project should now be ready to run on device or in editor. Note that you may need to configure your speech privacy settings for dictation to work in editor. 

## Using DictationSubsystem

To use `DictationSubsystem` in script, add event handlers to the dictation events you want to respond to, and then call `StartDictation`.

```c#
// Get the first running dictation subsystem.
DictationSubsystem dictationSubsystem = XRSubsystemHelpers.GetFirstRunningSubsystem<DictationSubsystem>();

// If we found one...
if (dictationSubsystem != null)
{
    // Add event handlers to all dictation subsystem events. 
    dictationSubsystem.Recognizing += DictationSubsystem_Recognizing;
    dictationSubsystem.Recognized += DictationSubsystem_Recognized;
    dictationSubsystem.RecognitionFinished += DictationSubsystem_RecognitionFinished;
    dictationSubsystem.RecognitionFaulted += DictationSubsystem_RecognitionFaulted;

    // And start dictation
    dictationSubsystem.StartDictation();
}
```

You would implement these event handlers with whatever you want to happen when the event is triggered.

* `Recognizing` is triggered when the recognizer is processing the input and returns a tentative result.
* `Recognized` is triggered when the recognizer recognized the input and returns a final result.
* `RecognitionFinished` is triggered when the recognition session is finished and returns a reason.
* `RecognitionFaulted` is triggered when the recognition is faulted (i.e. error occurred) and returns a reason.

When finished, remove these event handlers. 

```c#
if (dictationSubsystem != null)
{
    dictationSubsystem.StopDictation();
    dictationSubsystem.Recognizing -= DictationSubsystem_Recognizing;
    dictationSubsystem.Recognized -= DictationSubsystem_Recognized;
    dictationSubsystem.RecognitionFinished -= DictationSubsystem_RecognitionFinished;
    dictationSubsystem.RecognitionFaulted -= DictationSubsystem_RecognitionFaulted;
}
```

A full example of using `DictationSubsystem` can be found in the `DictationHandler` sample script in the `DictationExample` sample scene.
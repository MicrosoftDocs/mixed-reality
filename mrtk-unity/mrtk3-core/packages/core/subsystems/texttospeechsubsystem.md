---
title: Core Subsystem TextToSpeechSubsystem
description: Info on the MRTK3 subsystem responsible for text to speech
author: marlenaklein-msft
ms.author: marlenaklein
ms.date: 5/17/2023
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, keyword, speech, text to speech, Mixed Reality Toolkit
---

# Core Subsystem: TextToSpeechSubsystem &#8212; MRTK3

> [!NOTE]
> For general information on subsystems in MRTK3, see [here](../../../../mrtk3-overview/architecture/subsystems.md).

The Core Definitions package ships `TextToSpeechSubsystem`, a base implementation of `MRTKSubsystem` and `ITextToSpeechSubsystem` that serves as the base of subsystems responsible for text to speech in MRTK3. Concrete implementation shipped as part of MRTK such as `WindowsTextToSpeechSubsystem` and other potential text to speech subsystems you might build should all be based on this class. Subsystems inheriting from `TextToSpeechSubsystem` have the capability to synthesize and speak a text phrase.

For more specific information, refer to the documentation of the concrete `TextToSpeechSubsystem` implementation you want to use.

## Setup

> [!NOTE]
> This guide provides steps to enable a speech subsystem in a new MRTK project (with other basic non-speech related setup in place). If you're using our sample project you might notice that some steps have been performed for you.

### 1. Enable the speech subsystem

Go to **Project Settings** > **MRTK3** **Available MRTK Subsystems** and then enable the text to speech subsystem you'd like to use.

### 2. Assign a configuration asset (for certain subsystems)

For certain subsystems, a [configuration asset](../../../../mrtk3-overview/architecture/subsystems.md#configuration) is required in order for it to perform normally. 

1. Click the subsystem you enabled in Setup 1.
1. Check to see if an empty `Configuration Asset` slot shows up under Subsystem Details on the right. If so, create a new config by selecting **Assets** -> **Create** **MRTK** > **Subsystems** > **[name of your subsystem] Config** and then dragging the created config onto the slot. 
1. After making sure the config slot is populated, change the settings in the newly created config for your specific project. Remember to save the project when you're finished.

### 3. Ensure the proper capabilities are set in Player Settings

Different implementations of `TextToSpeechSubsystem` have different required capabilities. For more information, refer to the documentation of the subsystem you want to use.

### 4. Running the scene on device/in editor

The project should now be ready to run on device or in editor.

## Using TextToSpeechSubsystem

To use `TextToSpeechSubsystem` in script, call `TrySpeak`. Note that you need to pass in an `AudioSource`. 

```c#
// Get the first running text to speech subsystem.
TextToSpeechSubsystem textToSpeechSubsystem = XRSubsystemHelpers.GetFirstRunningSubsystem<TextToSpeechSubsystem>();

// If we found one...
if (textToSpeechSubsystem != null)
{
     // Speak message
     textToSpeechSubsystem.TrySpeak("This is a test!", myAudioSource);
}
```

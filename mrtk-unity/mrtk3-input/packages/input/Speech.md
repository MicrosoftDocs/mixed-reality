
# Speech input | MRTK3

## Overview
Speech input in MRTK is achieved by the an implementation of the `PhraseRecognitionSubsystem`. By default, MRTK ships `WindowsPhraseRecognitionSubsystem`, which utilizes Unity's `KeywordRecognizer`. As in MRTK v2, this default implementation is only supported on Windows Editor, Standalone Windows, and UWP. 

>**Note**
>This guide provides steps to enable the speech subsystem in a new MRTK project, assuming basic non-speech-related setup are already in place. If you are using our sample project, you may notice some steps have been performed for you.

>**Important**
>There is an external bug causing the "select" keyword to fail to be recognized when `WindowsPhraseRecognitionSubsystem` runs on HoloLens 2. We are working with relevant parties to address the issue. To mitigate, please change the speech recognition keyword under `StatefulInteractable` (or its subclass such as `PressableButton`) **-> Advanced StatefulInteractable Settings -> Allow Select By Voice -> Speech Recognition Keyword**.

## Setup

### Enable the speech subsystem

1. Go to **Project Settings -> Mixed Reality Toolkit -> Available MRTK Subsystems**.
2. Enable the speech subsystem you would like to use. At this time, MRTK only ships the **WindowsPhraseRecognitionSubsystem**.

### Configure the profile correctly 

For certain subsystems, a profile is required for it to perform normally. The currently shipped `WindowsPhraseRecognitionSubsystem` doesn't require a profile, so you may skip this setup. Keep in mind profiles may be needed by other future implementations of the `PhraseRecognitionSubsystem`.

### Ensure the MRTK Speech GameObject is active

Ensure the relevant script(s) is active by confirming **MRTK XR Rig -> MRTK Speech** is active.

### Ensure the proper capability is set in Player Settings

Using UWP Platform as an example: Go to **Project Settings -> Player -> Publishing Settings -> Capabilities** and ensure the **Microphone Capabilities** is set.

### Running the scene on device/in editor

The project should be ready to run on a device or in the editor. 

>**Note**
>`StatefulInteractable` (or its subclass such as `PressableButton`) needs to be set up to accept voice commands for the speech subsystem to work with them. Please see its inspector (under Advanced StatefulInteractable Settings) as well as the SpeechInteractor (**MRTK XR Rig -> MRTK Speech**) for more adjustable settings.


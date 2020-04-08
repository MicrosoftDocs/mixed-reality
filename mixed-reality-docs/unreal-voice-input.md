---
title: Voice Input
description: Explains how to use voice input
author: AndreyChistyakov
ms.author: anchisty
ms.date: 04/08/2020
ms.topic: article
keywords: Windows Mixed Reality, HoloLens
---

# Voice Input

To enable speech recognition on HoloLens, the developer needs to enable “Microphone” in the Unreal editor under Project Settings > Platform > HoloLens > Capabilities. The device must also have Speech recognition enabled in Settings > Privacy > Speech and use the English language.

!(images/unreal/speech-recognition-settings.png)

It’s recommended to enable Online speech recognition too for the best possible quality of the service. Technical details for speech recognition on HoloLens can be found (here)[https://docs.microsoft.com/en-us/windows/mixed-reality/voice-input]

Then user will see a dialog about enabling the microphone when the application first starts. If a user selects Yes, the application will begin getting voice input.

Speech input doesn’t require a special Windows Mixed Reality API and is instead built upon the existing Unreal Engine 4 Input mapping API. Details on how to use the Input API are (here)[https://docs.unrealengine.com/en-US/Gameplay/Input/index.html]

Speech Mappings have been added to the Bindings section of Engine – Input below Action and Axis Mappings. 

!(images/unreal/engine-input.png)
 
Here is an example of added monitoring for the world “jump”. Any English word(s) or short sentences can be used. 

After a Speech Mapping is added via Project Settings, a developer can then use standard Unreal logic to handle the input, as in the following example: 
 
!(images/unreal/input-action-bp.png)

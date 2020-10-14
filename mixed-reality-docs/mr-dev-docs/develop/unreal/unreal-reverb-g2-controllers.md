---
title: HP Reverb G2 Controllers in Unreal 
description: Instructions on using the HP Reverb G2 Controllers in OpenXR and SteamVR
author: fieldsJacksonG
ms.author: jacksonf
ms.date: 10/9/2020
ms.topic: article
keywords: Unreal, Unreal Engine 4, UE4, Reverb, Reverb G2, HP Reverb G2, mixed reality, development, motion controllers, user input, features, new project, emulator, documentation, guides, features, holograms, game development
---

# HP Reverb G2 Controllers in Unreal 

Need introduction...

## Getting started

[!INCLUDE[](includes/tabs-g2-controllers-in-unreal.md)]

## Adding Input Action Mappings 

Define a new action and map to one of the key presses in the HP Mixed Reality Controller section.

![Defining new actions and mappings](images/reverb-g2-img-02.png)

The HP Reverb G2 controller also has an analog grip, which can be used in the axis mappings with the “Squeeze Axis” binding.  There is a separate Squeeze binding, which should be used for action mappings when the grip button is fully pressed. 

![Using the Squeeze axis bindings](images/reverb-g2-img-03.png)

## Adding Input Events to Game

Right click on a Blueprint and search for the new action names from the input system to add events for these actions.  Here the Blueprint is responding to the events with a print string outputting the current button and axis state.

![Blueprint responding to events and outputting current button and axis state](images/reverb-g2-img-06.png)

## Using controller input

[!INCLUDE[](includes/tabs-g2-controller-mappings-in-unreal.md)]

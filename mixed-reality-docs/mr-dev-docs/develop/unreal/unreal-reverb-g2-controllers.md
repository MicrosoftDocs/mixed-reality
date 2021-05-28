---
title: HP Reverb G2 Controllers in Unreal 
description: Learn how to use the new HP Reverb G2 Controllers in OpenXR and SteamVR for Unreal mixed reality applications.
author: hferrone
ms.author: jacksonf
ms.date: 10/9/2020
ms.topic: article
keywords: Unreal, Unreal Engine 4, UE4, Reverb, Reverb G2, HP Reverb G2, mixed reality, development, motion controllers, user input, features, new project, emulator, documentation, guides, features, holograms, game development, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# HP Reverb G2 Controllers in Unreal 

## Getting started

> [!IMPORTANT]
> Unreal Engine 4.26 and either OpenXR or SteamVR is required to access the HP Motion Controller plugin you'll need to work with the HP Reverb G2 controllers.

[!INCLUDE[](includes/tabs-g2-controllers-in-unreal.md)]

## Porting an existing OpenXR app 

If no controller bindings exist in the game for the HP Mixed Reality Controller, the OpenXR runtime will try to remap existing bindings to the active controller.  In this case, the game has Oculus Touch bindings and no HP Mixed Reality Controller bindings.

![Remapping existing bindings when no controller bindings exist](images/reverb-g2-img-04.png)

The events will still fire, but if the game needs to make use of controller-specific bindings, like the right menu button, the HP Mixed Reality interaction profile must be used.  Multiple controller bindings can be specified per action to better support different devices.
   
![Using multiple controller bindings](images/reverb-g2-img-05.png)

## Adding input action mappings 

Define a new action and map to one of the key presses in the HP Mixed Reality Controller section.

![Defining new actions and mappings](images/reverb-g2-img-02.png)

The HP Reverb G2 controller also has an analog grip, which can be used in the axis mappings with the “Squeeze Axis” binding.  There's a separate Squeeze binding, which should be used for action mappings when the grip button is fully pressed. 

![Using the Squeeze axis bindings](images/reverb-g2-img-03.png)

## Adding input events

Right-click on a Blueprint and search for the new action names from the input system to add events for these actions.  Here the Blueprint is responding to the events with a print string outputting the current button and axis state.

![Blueprint responding to events and outputting current button and axis state](images/reverb-g2-img-06.png)

### Using input 

[!INCLUDE[](includes/tabs-g2-controller-mapping-in-unreal.md)]

## See also
* [SteamVR Input](https://docs.unrealengine.com/Platforms/VR/SteamVR/HowTo/SteamVRInput/index.html)
* [Using SteamVR with Windows Mixed Reality](/windows/mixed-reality/enthusiast-guide/using-steamvr-with-windows-mixed-reality)
* [Unreal Player Camera](https://docs.unrealengine.com/Programming/Tutorials/PlayerCamera/3/index.html)
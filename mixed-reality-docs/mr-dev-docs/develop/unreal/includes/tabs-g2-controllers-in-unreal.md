# [OpenXR](#tab/openxr)

## Enabling OpenXRHPController Plugin 

The interaction profile and controller mappings are in the OpenXRHPController plugin, which must be enabled to expose the controller mappings to Unreal’s input system. 

![Enabling the OpenXRHPController plugin](../images/reverb-g2-img-01.png)

## Adding Input Action Mappings 

Define a new action and map to one of the key presses in the HP Mixed Reality Controller section.

![Defining new actions and mappings](../images/reverb-g2-img-02.png)

The HP Reverb G2 controller also has an analog grip, which can be used in the axis mappings with the “Squeeze Axis” binding.  There is a separate Squeeze binding, which should be used for action mappings when the grip button is fully pressed. 

![Using the Squeeze axis bindings](../images/reverb-g2-img-03.png)


## Porting From Existing OpenXR Game 

If no controller bindings exist in the game for the HP Mixed Reality Controller, the OpenXR runtime will attempt to remap the existing bindings to the active controller.  In this case, the game has Oculus Touch bindings and no HP Mixed Reality Controller bindings.

![Remapping existing bindings when no controller bindings exist](../images/reverb-g2-img-04.png)

The events will still fire, but if the game needs to make use of controller specific bindings, like the right menu button, the HP Mixed Reality interaction profile must be used.  Multiple controller bindings can be specified per action to better support different devices.
   
![Using multiple controller bindings](../images/reverb-g2-img-05.png)

## Adding Input Events to Game

Right click on a Blueprint and search for the new action names from the input system to add events for these actions.  Here the Blueprint is responding to the events with a print string outputting the current button and axis state.

![Blueprint responding to events and outputting current button and axis state](../images/reverb-g2-img-06.png)

## See also


# [SteamVR](#tab/steamvr)



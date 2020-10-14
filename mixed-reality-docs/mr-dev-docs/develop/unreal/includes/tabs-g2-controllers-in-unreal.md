# [OpenXR](#tab/openxr)

## Enabling OpenXRHPController Plugin 

The interaction profile and controller mappings are in the OpenXRHPController plugin, which must be enabled to expose the controller mappings to Unreal’s input system. 

![Enabling the OpenXRHPController plugin](../images/reverb-g2-img-01.png)

## Porting From Existing OpenXR Game 

If no controller bindings exist in the game for the HP Mixed Reality Controller, the OpenXR runtime will attempt to remap the existing bindings to the active controller.  In this case, the game has Oculus Touch bindings and no HP Mixed Reality Controller bindings.

![Remapping existing bindings when no controller bindings exist](../images/reverb-g2-img-04.png)

The events will still fire, but if the game needs to make use of controller specific bindings, like the right menu button, the HP Mixed Reality interaction profile must be used.  Multiple controller bindings can be specified per action to better support different devices.
   
![Using multiple controller bindings](../images/reverb-g2-img-05.png)


# [SteamVR](#tab/steamvr)

## Enabling PHP Controller



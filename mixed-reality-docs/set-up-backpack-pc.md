---
title: Set up backpack PC
description: Matt will write description.
author: yoyozilla
ms.author: yoyoz
ms.date: 10/02/2018
ms.topic: article
keywords: matt will fill these in
---

# Windows Mixed Reality with Backpack PC

Windows Mixed Reality Headset can be used with Backpack PCs to create an untethered experience for end users. 
Previously, a display emulator is required to use WMR with backpack PC. With the Fall update, we have removed this requirement and added functionalities to enable more scenarios with Backpack PC. 

## Running Windows Mixed Reality on Backpack PC 
You must have Mixed Reality Portal application running in order to use Windows Mixed Reality Headset.
You can manually start Mixed Reality Portal from the Desktop with the Backpack PC docked (connected to an external display with input device). Alternatively, you can configure your PC to auto start Windows Mixed Reality on boot, see next section for requirements and instructions. 


## Auto Start Windows Mixed Reality on PC Boot 
If you can configure your PC to auto start WMR when the PC boots, by using the two supported windows features: Automatic Logon, and designate Startup App.
Start with the Backpack PC connected to an external monitor, keyboard, and mouse for PC configuration.
Enable Automatic Logon following instructions here: https://support.microsoft.com/en-us/help/324737/how-to-turn-on-automatic-logon-in-windows
Set Mixed Reality Portal to launch on start, by create a shortcut for Mixed Reality Portal, start file explorer, go to “shell:startup” and drag the shortcut there.

You can also set add a Steam or Windows MR application to startup on PC boot by following the last step with a shortcut of the application. 

We recommend that you test the startup flow once with the external monitor connected to take care of all the Admin prompt. 

## Known issues
If you have configured the PC to start MR on boot, and you see nothing in the HMD after 1 min, please connect the backpack PC to an external monitor, you may have messages on the desktop that needs to be taken care off.
UAC Prompt (Like Admin dialog) will cause the HMD display to black out for security purposes, you will need to connect the backpack PC to an external monitor to take care of the dilaog on desktop. 
Device setup and boundary setup requires an external monitor to be connected and desktop interaction. Please setup the HMD and complete OOBE experience with an external monitor attached. 

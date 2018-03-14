---
title: Environment considerations for HoloLens
description: Get the best possible experience using HoloLens when you optimize the device for your eyes and environment.
author: mattzmsft
ms.author: mazeller
ms.date: 2/28/2018
ms.topic: article
keywords: holographic frame, field of view, fov, calibration, spaces, environment, how-to
---



# Environment considerations for HoloLens

HoloLens blends the holographic with the "real" world, placing holograms in your surroundings. A holographic app window "hangs" on the wall, a holographic ballerina spins on the tabletop, bunny ears sit on top of your unwitting friend’s head. When you’re using an immersive game or app, the holographic world will spread to fill your surroundings—but you’ll still be able to see and move around the space.

The holograms you place will stay where you’ve put them, even if you turn off your device. 

Here are some things to keep in mind for the best experience with the holographic world. Note, HoloLens is designed to be used indoors in a safe space with no tripping hazards. Don’t use it while driving or performing other activities that require your full attention.

## Spaces

HoloLens learns about your space so it can remember where you’ve placed holograms. HoloLens can remember multiple spaces, and is designed to load the correct space when you turn it on.

### Setting up

HoloLens can map and remember your spaces best if you choose the right environment.
* Use a room with adequate light and plenty of space. Avoid dark spaces and rooms with a lot of dark, shiny, or translucent surfaces (such as mirrors or thin curtains).
* If you want HoloLens to learn a space, face it directly, from about one meter away.
* Avoid spaces with a lot of moving objects. If an item has moved and you want HoloLens to learn its new position (for example, you moved your coffee table to a new spot), gaze and move around it.

### Spatial mapping

When you enter a new space (or load an existing one), you’ll see a mesh graphic spreading over the space. This means your device is [mapping your surroundings](spatial-mapping-design.md). If you’re having trouble placing holograms, try walking around the space so HoloLens can map it more fully. If your HoloLens can’t map your space or is out of calibration, you may enter Limited mode. In Limited mode, you won’t be able to place holograms in your surroundings.

### Managing your spaces

HoloLens remembers the spaces you’ve used it in by associating them with what Wi-Fi networks are available in that location. A space will get its name from the Wi-Fi network that HoloLens is connected to in that location, but being connected to a Wi-Fi network or not, does not affect they way HoloLens remembers the space you are in.

When you are in a new location and HoloLens does not recognize the Wi-Fi networks around you, it will create a new space, which will have a default name since you are not connected yet, so once you connect to the Wi-Fi network, the space name will change to be the same as the Wi-Fi network. Note that this is not the case where you first set up your HoloLens and connect to Wi-Fi, by the time you are done with the initial set up, a space will already be created with the name of the Wi-Fi network you connected to.

When you go to a location that HoloLens recognizes, the space for that location will be automatically loaded and any holograms that were already placed in that space will appear as well.

You can see and manage your spaces by going to Settings > System > Spaces. There, you can remove a space you no longer need or load the space you want. There are important points to have in mind when using HoloLens and managing spaces:
* HoloLens assigns a numerical value to each space that represents how confident it is that the space corresponds to a given physical location based on the Wi-Fi networks that are available and their signal strengths, this process is called Wi-Fi fingerprinting, and is constantly running as the user walks around the space, so the more the user covers, the higher the confidence value will be, and the higher the chances are that the correct space will be loaded the next time the HoloLens is turned on.
* When HoloLens is turned on in a location where there are no Wi-Fi networks available, their signal strength are just too low, or Wi-Fi is disabled in Settings > Network & Internet, HoloLens will be in Limited Mode and will remain there, a new space will not be created, but you can load an existing space from Settings > System > Spaces. The user can get out of this state by turning Wi-Fi on if it was disabled or moving to an area where there are Wi-Fi networks with good signal, and then restart.
* When HoloLens can't tell which space you are in because there are two or more spaces that have similar Wi-Fi fingerprinting (the confidence value for those spaces is similar), it will show a dialog so you can select which space you want to load (top 2 choices, ranked by confidence in decreasing order) and an option to go to Settings to select another space.

## Hologram quality

Holograms can be placed throughout your environment—high, low, and all around you—but you’ll see them through a [holographic frame](holographic-frame.md) that sits in front of your eyes. To get the best view, make sure to adjust your device so you can see the entire frame. And don’t hesitate to walk around your environment and explore!

For your [holograms](hologram.md) to look crisp, clear, and stable, your HoloLens needs to be calibrated just for you. When you first set up your HoloLens, you’ll be guided through this process. Later on, if holograms don’t look right or you’re seeing a lot of errors, you can make adjustments.

### Calibration

If your holograms look jittery or shaky, or if you’re having trouble placing holograms, the first thing to try is the [Calibration app](calibration.md). This app can also help if you’re experiencing any discomfort while using your HoloLens.

To get to the Calibration app, go to Settings > System > Utilities. Select Open Calibration and follow the instructions.

If you run the Calibration app and are still having problems with hologram quality, or you’re seeing a frequent “tracking lost” message, try the Sensor Tuning app. Go to Settings > System > Utilities, select Open Sensor Tuning, and follow the instructions.

If someone else is going to be using your HoloLens, they should run the Calibration app first so the device is set up properly for them.

## See also
* [Spatial mapping design](spatial-mapping-design.md)
* [Holograms](hologram.md)
* [Calibration](calibration.md)

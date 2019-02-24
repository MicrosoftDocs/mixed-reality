---
title: Environment considerations for HoloLens
description: Get the best possible experience using HoloLens when you optimize the device for your eyes and environment.
author: thetuvix
ms.author: msamples
ms.date: 02/24/2019
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

The map sections and different spaces have been collapsed into a single database, stored locally on the HoloLens device.  The map database is stored securely, with access only available to the internal system, and never to a user of the device, even when plugged into a PC and/or using the file explorer app.  When bitlocker is enabled, the stored map data is also encrypted.
Multiple map components exist when holograms are placed in different locations without a connective path between the locations/holograms.  Holograms anchored within the same map section are considered to be “nearby” in the current space
There is a developer API to export a small subset of the “current space” (a portion the map component that is currently recognized) to enable shared hologram scenarios.  There is currently no mechanism to download the entire database of all spaces that have been mapped.

#### WiFi
Connected vs. Not – As long as WiFi is enabled, map data will be correlated with a WiFi fingerprint, even when not connected to an actual WiFi network/router.  This is because the MAC address and signal strength (i.e. WiFi fingerprint) of a router is available without connecting to it.  Network identification (i.e. SSID, MAC address) is not sent to Microsoft, and all WiFi references are kept local on the HoloLens.

Enabled vs. Disabled – HoloLens will sense and remember spaces even when WiFi is disabled, by securely storing the sensor data when holograms are placed.  Without the WiFi info, the space and holograms may be slightly slower to recognize at a later time, as the HoloLens needs to compare active scans to ALL hologram anchors and map sections stored on the device in order to “relocalize” to the right portion of the map.

#### Environment Management
There are 2 settings which enable users to “clean up” holograms and cause HoloLens to “forget a space”.  They exist in “Holograms and environments” in the settings app, with the second setting also appearing under “Privacy” in the settings app.
1.	Delete nearby holograms – By selecting this setting, HoloLens will erase all anchored holograms and all stored map data for the “current space” where the device is located.  A new map section would be created and stored in the database for that location once Holograms are again placed in that same space.
2.	Delete all holograms – By selecting this setting, HoloLens will erase ALL map data and anchored holograms in the entire databases of spaces.  No holograms will be rediscovered and any holograms need to be newly placed to again store map sections in the database.


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

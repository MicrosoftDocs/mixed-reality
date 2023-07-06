---
title: How inside-out tracking works
description: Information about the camera-based, inside-out tracking system used in Windows Mixed Reality headsets.
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, inside-out, inside out, tracking, camera
---

# Inside-out tracking

## How does inside-out tracking work?

**Quick answer:** the tracking system uses two visible-light low-resolution cameras to observe features in your environment. The cameras then fuse the information with IMU data to determine a precise position of the device in your environment.

**More details:** The tracking system uses two low-resolutions black and white cameras to identify features in your environment in visible light. The system will triangulate its position based on the observed features, which then supplements the information by fusing high rate IMU data to produce a continuous pose estimation for the HMD in your environment. The pose information is used by both applications to render a scene and by the system to correct this rendering for any mis-prediction in time and position. Your PC stores environment information so the tracking system can recall environment-specific data like the room boundaries physical location. If you use your device in multiple rooms, you can set up different boundaries in each room and the tracking system can recall the specific boundary for the specific room.

Because tracking on Windows Mixed Reality immersive headsets works like tracking on [Microsoft HoloLens](https://www.microsoft.com/en-us/hololens), you may find this video useful:

>[!VIDEO https://www.youtube.com/embed/TneGSeqVAXQ]

## What do I need to make tracking work well?

There are two concerns to address to ensure tracking will work well for you:
1. Ensure your PC meets the requirements to run Windows Mixed Reality. If your PC meets the minimum requirements for Windows Mixed Reality, tracking will have enough resources to run well on your PC.
2. Ensure your environment is suitable for the type of visual tracking the device employs. You should use the device in an environment with enough light. Because the device works by observing your environment in visible light, there must be enough light so that the environment can be observed. There must also be enough distinguishing visual features (in other words, decorations, points of contrast, and so on) for the tracking system to work.

## How much light is enough light?

If you can comfortably move around in the environment without feeling it's too dark, and if you can observe the features on another persons face from across the room, then the tracking system probably has enough light. Bear in mind that there's such thing as too much light - if you're looking right at the sun, the cameras can get saturated and won't track reliably. 

## What is the recommended number of environmental features?

The product has been designed to work in normal environments. Consider the following thought experiment - if you were in a blank room with white walls, a white ceiling, and a white floor, the tracking system would find no features to track and would fail. If you were in a room that was covered in art work and decoration, then the tracking system would find many features to track and would work well. Usually, typically decorated homes and offices have been demonstrated to have sufficient feature detail to track well.

## How fast can I move with the device?

The device is designed to support motion in excess of what is normally experienced by human head motion. Feel free to move at will. Keep in mind, you have reduced awareness of your physical surroundings while in an immersive headset, so ensure you're moving safely in your environment.

## Where will tracking not work?

Tracking won't work in a dark room where the cameras can't see enough features because of low light. Tracking won't do well (or sometimes work at all) in moving vehicles such as airplanes, buses, trains, cars, or elevators. Tracking can also fail in situations where there's too much light or a strong light difference. For example, if there's a direct stream of sunlight into a room, the cameras may lower exposure to reduce saturation and won't see regular natural features. It's recommended that you stick to relatively even lighting, and if you have to squint or find things uncomfortably bright, then the tracking system may not do well. 

## What is the difference between 3DOF and 6DOF?

First, DOF is short-hand for "degrees of freedom." When discussing tracking systems, this means the degrees or types of movement that can be detected. These movements are broken down into two major categories: 'rotation' and 'rotation with translation'. 3DOF refers to 3 degrees of freedom and represents rotations about each axis. Put simply, 3DOF tracking allows you to look left/right, up/down, and tilt your head (roll) side to side. You can't translate or walk forwards/backwards in 3DOF. 6DOF is short for 6 degrees of freedom. It builds on the rotations of 3DOF and adds to it translations. This means you can walk forwards/backwards, strafe down left/right and crouch and stand up. Three DOF tracking is the type of tracking you would typically find on a phone or mobile based VR product, while 6DOF will be found on more powerful VR platforms. Some experiences are tailored to 3DOF and will only allow 3DOF motion (rotations), even if the device supports 6DOF tracking. An example of this would be watching a 360 video in Windows Mixed Reality. The video will allow you to look around but won't allow you to walk in your environment.

## Things are jittering or stuttering in my headset. Is my tracking not working?

There are a couple sources of this kind of error. It's important to attribute what you're observing to the right cause so that it may be addressed. See the [troubleshooting](tracking.md) section to help understand why this may be happening.

## Can I bring my own tracking technology to Windows Mixed Reality?

This functionality isn't currently supported.

## Why do I see UI that says "Can't find your boundary?"

Since the safety boundary is specific to a physical location, if you're using the device in a different location then the system can't find the bounds. Additionally, once you have set up your boundary, the system will always look for it, even if you use the device in a different physical location. You'll see this UI anytime you use the device in a different location and have not set up a boundary in that location yet. You can set up boundaries in each location you use the device, and the device will recall your location-specific bounds.

If you're using the device in a location you have previously set up a boundary, and the device still can't find it, you may set up a new bounds, or clear all environment data to remove all bounds from the device. See the [troubleshooting](tracking.md) section to understand why the system can't find your bounds and steps to correct it.

## How do I set up tracking?

Tracking in Windows Mixed Reality is simple to use, there's no infrastructure or setup required. If you chose to, you may set up a virtual boundary for use. See the section on [setting up your boundary](set-up-windows-mixed-reality.md#set-up-your-room-boundary) for more information.

## How do I clear tracking and environment data?

The tracking system stores some environment data so that it can recall the real-world physical location of things like your safety bounds. This information, including your safety bounds, can be removed at any time. If this information is removed, the system will no longer recognize your space or recall your safety bounds. If you wish to use safety bounds after clearing the environment data, you'll have to set it up again. See the section on [setting up your boundary](set-up-windows-mixed-reality.md#set-up-your-room-boundary) to set up a new boundary. To remove all of this data, open Settings, navigate to "Mixed Reality", and select the Environment section of the left-hand side menu. Select the button labeled "Clear Environment Data" to remove all environment and tracking data.

## See also
* [Troubleshooting the tracking system](tracking.md)
* [Motion controllers](controllers-in-wmr.md)
* [Your Windows Mixed Reality home](your-mixed-reality-home.md)
* [Using games and apps in Windows Mixed Reality](using-games-and-apps-in-windows-mixed-reality.md)

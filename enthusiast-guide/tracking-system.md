---
title: How inside-out tracking works
description: Information about the camera-based, inside-out tracking system used in Windows Mixed Reality headsets.
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, inside-out, inside out, tracking, camera
---

# Inside-out tracking

## How does inside-out tracking work?

**Quick answer:** the tracking system uses two visible-light low-resolution cameras to observe features in your environment, and fuses this information with IMU data to determine a precise position of the device in your environment.

**More details:** The tracking system uses two low-resolution black and white cameras to identify features in your environment in visible light. The system will triangulate its position based on the observed features, and supplement this information by fusing high rate IMU data to produce a continuous pose estimation for the HMD in your environment. The pose information is used by both applications to render a scene and by the system to correct this rendering for any mis-prediction in time and position. Information on your environment is stored on your PC so that the tracking system can recall environment specific data such as the physical location of the boundary in your room. If you use your device in multiple rooms, you can set up different boundaries in each room and the tracking system will be able to recall the specific boundary for the specific room.

Because tracking on Windows Mixed Reality immersive headsets works like tracking on [Microsoft HoloLens](https://www.microsoft.com/en-us/hololens), you may find this video useful:

>[!VIDEO https://www.youtube.com/embed/TneGSeqVAXQ]

## What do I need to make tracking work well?

There are two concerns to address to ensure tracking will work well for you:
1. Ensure your PC meets the requirements to run Windows Mixed Reality. If your PC meets the minimum requirements for Windows Mixed Reality, tracking will have enough resources to run well on your PC.
2. Ensure your environment is suitable for the type of visual tracking the device employs. You should use the device in an environment with enough light. Because the device works by observing your environment in visible light, there must be enough light so that the environment can be observed. There must also be enough distinguishing visual features (in other words, decorations, points of contrast, etc.) for the tracking system to work.

## How much light is enough light?

A good rule of thumb is if you can comfortably move around in the environment without feeling it is too dark and if you can observe the features on another persons face from across the room, then the tracking system probably has enough light.

## What is the recommended amount of environmental features?

The product has been designed to work in normal environments. Consider the following thought experiment - if you were in a completely blank room (white walls, white ceiling, white floor) then the tracking system would find no features to track and would fail. If you were in a room that was covered in art work and decoration, then the tracking system would find many features to track and would work well. For the most part, typically decorated homes and offices have been demonstrated to have sufficient feature detail to track well.

## How fast can I move with the device?

The device is designed to support motion in excess of what is normally experienced by human head motion. Feel free to move at will. Keep in mind, you have reduced awareness of your physical surroundings while in an immersive headset, so ensure you are moving safely in your environment.

## Where will tracking not work?

Tracking will not work in a dark room where the cameras will not be able to see enough features due to low light. Tracking will generally not perform well (or sometimes work at all) in moving vehicles such as airplanes, buses, trains, cars or elevators.

## What is the difference between 3DOF and 6DOF?

First, DOF is short-hand for "degrees of freedom." When discussing tracking systems, this means the degrees or types of movement that can be detected. These movements are broken down into two major categories: 'rotation' and 'rotation with translation'. 3DOF refers to 3 degrees of freedom and represents rotations about each axis. Put simply, 3DOF tracking allows you to look left/right, up/down and tilt your head (roll) side to side. You cannot translate or walk forwards/backwards in 3DOF. 6DOF is short for 6 degrees of freedom. It builds on the rotations of 3DOF and adds to it translations. This means you can walk forwards/backwards, strafe left/right and crouch down and stand up. 3 DOF tracking is the type of tracking you would typically find on a phone or mobile based VR product, while 6DOF will be found on more powerful VR platforms. Some experiences are tailored to 3DOF and will only allow 3DOF motion (rotations), even if the device supports 6DOF tracking. An example of this would be watching a 360 video in Windows Mixed Reality. The video will allow you to look around but will not allow you to walk in your environment.

## Things are jittering or stuttering in my headset. Is my tracking not working?

There are a couple sources of this kind of error. It is important to be able to attribute what you are observing to the right cause so that it may be addressed. See the [troubleshooting](tracking.md) section to help understand why this may be happening.

## Can I bring my own tracking technology to Windows Mixed Reality?

This is not currently supported.

## Why do I see UI that says "Can't find your boundary?"

Since the safety boundary is specific to a physical location, if you are using the device in a different location then the system will not be able to find the bounds. Additionally, once you have set up your boundary, the system will always look for it, even if you use the device in a different physical location. You will see this UI anytime you use the device in a different location and have not set up a boundary in that location yet. You can set up boundaries in each location you use the device, and the device will recall your location specific bounds.

If you are using the device in a location you have previously set up a boundary, and the device still cannot find it, you may set up a new bounds, or clear all environment data to remove all bounds from the device. See the [troubleshooting](tracking.md) section to understand why the system cannot find your bounds and steps to correct it.

## How do I set up tracking?

Tracking in Windows Mixed Reality is simple to use. There is no infrastructure or setup required and the device will work out of the box. If you chose to, you may set up a virtual boundary for use. See the section on [setting up your boundary](set-up-windows-mixed-reality.md#set-up-your-room-boundary) for more information.

## How do I clear tracking and environment data?

The tracking system stores some environment data so that it can recall the real-world physical location of things like your safety bounds. This information, including your safety bounds, can be removed at any time. If this information is removed, the system will no longer recognize your space or be able to recall your safety bounds. If you wish to use safety bounds after clearing the environment data, you will have to set it up again. See the section on [setting up your boundary](set-up-windows-mixed-reality.md#set-up-your-room-boundary) to set up a new boundary. To remove all of this data, open Settings, navigate to "Mixed Reality", and select the Environment section of the left hand side menu. Click the button labelled "Clear Environment Data" to remove all environment and tracking data.

## See also
* [Troubleshooting the tracking system](tracking.md)
* [How motion controllers work](motion-controllers.md)
* [Your Windows Mixed Reality home](your-mixed-reality-home.md)
* [Using games and apps in Windows Mixed Reality](using-games-and-apps-in-windows-mixed-reality.md)

---
title: Vehicle Example
description: A sample using a camera, which is attached to moving subspace.
author: fast-slow-still
ms.author: mafinc
ms.date: 10/06/2021
ms.prod: mixed-reality
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Augmented Reality, Mixed Reality, ARCore, ARKit, development, MRTK
---

# Vehicle Example

The Vehicle sample scene is a stripped-down version of attaching a camera to a vehicle or platform that's moving in virtual space.

## Terminology

This sample, and the feature it demonstrates, are NOT related to using an augmented reality (AR) device in a moving vehicle, such as a car or train. That scenario is covered by the [Moving Platform Mode feature of HoloLens](/hololens/hololens2-moving-platform).

This sample demonstrates a camera attached to a moving frame of reference. The physical camera itself isn't moving, except to track the user's device. But the camera's pose in virtual space changes as the camera is dragged through the virtual world.

## Illustration by example

Let's say you have a physical mock-up of a vehicle. For example, it might be a city bus. This mock-up is simple: it has rough partitions for the walls, possibly the driver's seat, and maybe even props for control panels. In general, it's the barest scaffolding for an actual city bus. It's like a movie set. It isn't going to move anywhere.

Next, you want to use augmented reality to superimpose finer detail onto your basic bus scaffolding. You might project display readouts onto virtual display panels. You might project pipes, rails, and other obstacles. You want to project whatever details are important to your application. You have a virtual bus interior overlaid onto your physical mock-up.

Obviously, it's important that your virtual bus details are properly aligned to your physical mock-up. Fortunately, World Locking Tools (WLT) will do exactly that for you through the `SpacePin` feature. Basic use of `SpacePins` is described in more detail in the [Concepts section](~/Documentation/Concepts/Advanced/SpacePins.md) of this documentation, along with [several simpler examples](~/Documentation/HowTos/SampleApplications.md).

With the virtual details of the interior locked to your physical mock-up, you're ready to take your virtual bus for a tour through a virtual city.

Some might say that the correct approach would be to move your virtual city around the bus, giving the appearance of the bus moving through the city. After all, the physical camera isn't moving, so why should its coordinates change?

There are arguments against that approach in [this related article](~/Documentation/Concepts/Advanced/SessionOrigin.md). For now we'll accept that the coordinates of the virtual bus will move through the virtual city, and the virtual city itself won't be moving through virtual space.

The longstanding technique is to attach the camera to the moving frame of reference of the vehicle. As the camera tracks the user's device movement, it moves relative to the vehicle's frame of reference, rather than relative to world space.

## Sample contents explained

The root of the camera tree represents the vehicle the camera is in. As this root moves through Unity's global coordinate space, the global coordinates of the camera are constantly changing. Naturally, changing the camera's coordinates doesn't move the camera through physical space. The camera is moving through virtual space, but not through physical space.

Other things attached to the vehicle also move along with the camera. From the camera's perspective, these other things  are stationary and the stationary things in global space appear to be moving. The things attached to the vehicle can be thought of as parts of the vehicle in which the camera is riding. The things stationary in global space that are moving through the view are analogous to the scenery passing by the window of the vehicle.

This sample demonstrates two uses of `SpacePins` in such a context. `SpacePins` that are also part of this moving vehicle (the moving root) operate as usual in the moving frame of the vehicle. They allow you to pin parts of the virtual vehicle space to the physical space. Although their coordinates are constantly changing as the vehicle moves, they're fixed in the frame of the vehicle which contains the camera. In the sample scene, the vehicle parts are represented by the spheres and their associated `SpacePins`.

The second usage is to attach a coordinate frame outside the vehicle's frame to the physical world. Once it's pinned to the physical world, its coordinates will be constantly updated. This keeps it stationary relative to the physical world, which keeps everything attached to it stationary relative to the physical environment. In the scene, the independent subspace is represented by the capsules and their associated `SpacePins`.

The cubes in the sample are stationary in global space and represent the environment the vehicle is moving through.

In the sample, the camera is flying in a circular path around the origin, always looking inward at the origin. When first running the sample, it will appear that the cubes are spinning as a unit around a point a few meters away. It's more accurate to say that it's the camera orbiting the cubes.

A [short companion video](https://youtu.be/-jos5tk9V5U) shows the sample on a HoloLens 2, with explanatory commentary on what's seen and what's expected. To keep it short, it lacks context. Reading this article first will help make sense of what you see in the video.

## See also

* [SpacePins](~/Documentation/Concepts/Advanced/SpacePins.md)
* [Session Origin](~/Documentation/Concepts/Advanced/SessionOrigin.md)
* [Coordinate spaces](~/Documentation/Concepts/Advanced/CoordinateSpaces.md)
* [SpacePin sample](~/Documentation/HowTos/Samples/SpacePin.md)
* [Advanced SpacePin sample](https://microsoft.github.io/MixedReality-WorldLockingTools-Samples/Advanced/AlignSubScene/AlignSubScene.html)

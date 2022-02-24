---
title: Vehicle Example
description: A sample using a camera which is attached to moving subspace.
author: fast-slow-still
ms.author: mafinc
ms.date: 10/06/2021
ms.prod: mixed-reality
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Augmented Reality, Mixed Reality, ARCore, ARKit, development, MRTK
---

# Vehicle Example

The Vehicle sample scene is a stripped down version of attaching a camera to a vehicle or platform moving in virtual space.

## Terminology

Clearing up terminology might be helpful now. This sample, and the feature it demonstrates, are NOT related to using an AR device in a moving vehicle, such as a car or train. Then what is it showing?

We're interested in a camera attached to a moving frame of reference. The physical camera itself isn't moving, except to track the user's device. But the camera's pose in virtual space is changing, as the camera is dragged through the virtual world.

## Illustration by example

Let's say you have a physical mockup of a vehicle, for example a city bus. This mockup is just rough partitions for the walls, possibly the driver's seat, and maybe even props for control panels. In general, it is the barest scaffolding for an actual city bus. It's like a movie set. It isn't going to move anywhere.

Next, you want to use AR to superimpose finer detail onto your basic set. You might project display readouts onto virtual display panels. You might project pipes, rails, and other obstacles. You want to project whatever details are important to your application. You have a virtual bus interior overlaid onto your physical mockup.

Obviously, it is important that your virtual bus details are properly aligned to your physical mockup. Fortunately, World Locking Tools (WLT) will do exactly that for you, through the `SpacePin` feature. Basic use of `SpacePins` is described in more detail in the [Concepts section](~/Documentation/Concepts/Advanced/SpacePins.md) of this documentation, along with [several simpler examples](~/Documentation/HowTos/SampleApplications.md).

With the virtual details of the interior locked to your physical mockup, you are ready to take your virtual bus for a tour through a virtual city.

Some might say that the correct approach would be to move your virtual city around the bus, giving the appearance of the bus moving through the city. After all, the physical camera is not moving, so why should its coordinates change?

There are arguments against that approach in [this related article](~/Documentation/Concepts/Advanced/SessionOrigin.md), but for now we'll take it as read that instead, the coordinates of the virtual bus will move through the city, and the virtual city itself won't be moving through virtual space.

The longstanding technique for this is to attach the camera to a moving frame of reference, the frame of reference of the vehicle. As the camera tracks the user's device movement, it moves relative to the vehicle's frame of reference, rather than relative to world space.

## Sample contents explained

As the root of the camera tree, representing the vehicle the camera is in, is moved through Unity's global coordinate space, the global coordinates of the camera are constantly changing. Naturally, this doesn't move the camera through physical space. The camera is moving through virtual space, but not through physical space.

Other things attached to the vehicle also moving along with the camera. From the camera's perspective, the other things moving with it (also attached to the vehicle) are stationary, and the stationary things in global space appear to be moving. The things also attached to the vehicle can be thought of as parts of the vehicle in which the camera is riding. The things stationary in global space that are moving by are analogous to the scenery passing by the window of the vehicle.

This sample demonstrates two uses of `SpacePins` in such a context. `SpacePins` that are also part of this moving vehicle (also attached to the moving root) operate as usual in the moving frame of the vehicle. They allow you to pin parts of the virtual vehicle space to the physical space. Although their coordinates are constantly changing (as the vehicle moves), they are fixed in the frame of the vehicle which contains the camera. In the sample scene, these are the spheres and their associated `SpacePins`.

The second usage is to attach a coordinate frame outside the vehicle's frame to the physical world. Once it is pinned to the physical world, its coordinates will be constantly updated to keep it stationary relative to the physical world, which keeps everything attached to it stationary relative to the physical environment. In the scene, these are the capsules and their associated `SpacePins`.

The cubes in the sample are stationary in global space, and represent the environment the vehicle is moving through.

In the sample, the camera is flying in a circular path around the origin, always looking inward at the origin. When first running the sample, it will appear that the cubes are spinning as a unit around a point a few meters away. It is more accurate to say that it is the camera orbiting the cubes.

A [short companion video](https://youtu.be/-jos5tk9V5U) shows the sample running on a HoloLens 2, with explanatory commentary on what is seen and what is expected. To keep it short, it lacks a lot of context. It's recommended that you read this article first, to help make sense of what's seen in the video.

## See also

* [SpacePins](~/Documentation/Concepts/Advanced/SpacePins.md)
* [Session Origin](~/Documentation/Concepts/Advanced/SessionOrigin.md)
* [Coordinate spaces](~/Documentation/Concepts/Advanced/CoordinateSpaces.md)
* [SpacePin sample](~/Documentation/HowTos/Samples/SpacePin.md)
* [Advanced SpacePin sample](https://microsoft.github.io/MixedReality-WorldLockingTools-Samples/Advanced/AlignSubScene/AlignSubScene.html)

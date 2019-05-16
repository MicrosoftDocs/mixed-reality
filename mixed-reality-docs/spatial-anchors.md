---
title: Spatial anchors
description: Best practices for using spatial anchors to render stable holograms.
author: thetuvix
ms.author: alexturn
ms.date: 02/24/2019
ms.topic: article
ms.localizationpriority: high
keywords: coordinate system, spatial coordinate system, world-scale, world, scale, position, orientation, anchor, spatial anchor, world-locked, world-locking, persistence, sharing
---



# Spatial anchors

A spatial anchor represents an important point in the world that the system should keep track of over time. Each anchor has a [coordinate system](coordinate-systems.md) that adjusts as needed, relative to other anchors or frames of reference, in order to ensure that anchored holograms stay precisely in place.  Rendering a hologram in an anchor's coordinate system gives you the most accurate positioning for that hologram at any given time. This comes at the cost of small adjustments over time to the hologram's position, as the system continually moves it back into place relative to the real world.

You can also persist and share spatial anchors across app sessions and across devices:
* By saving local spatial anchors to disk and loading them back later, your app can reason about the same location in the real world across multiple app sessions on a single HoloLens device.
* By using <a href="https://docs.microsoft.com/azure/spatial-anchors/overview" target="_blank">Azure Spatial Anchors</a> to create a cloud anchor, your app can share a spatial anchor across multiple HoloLens, iOS and Android devices. By having each device render a hologram using the same spatial anchor, all users will see the hologram appear at the same place in the real world.  This allows for real-time shared experiences.
* You can also use <a href="https://docs.microsoft.com/azure/spatial-anchors/overview" target="_blank">Azure Spatial Anchors</a> for asynchronous hologram persistence across HoloLens, iOS and Android devices.  By sharing a durable cloud spatial anchor, multiple devices can observe the same persisted hologram over time, even if those devices are not present together at the same time.

For standing-scale or room-scale experiences for tethered desktop headsets that will stay within a 5-meter diameter, you can usually just use the [stage frame of reference](coordinate-systems.md#stage-frame-of-reference) instead of spatial anchors, providing you a single coordinate system in which to render all content. However, if your app intends to let users wander beyond 5 meters on HoloLens, perhaps operating throughout an entire floor of a building, you'll need spatial anchors to keep content stable.

While spatial anchors are great for holograms that should remain fixed in the world, once an anchor is placed, it can't be moved. There are alternatives to anchors that are more appropriate for dynamic holograms that should tag along with the user. It is best to position dynamic holograms using a stationary frame of reference (the foundation for Unity's world coordinates) or an attached frame of reference.

## Best practices

These spatial anchor guidelines will help you render stable holograms that accurately track the real world.

### Create spatial anchors where users place them

Most of the time, users should be the ones explicitly placing spatial anchors.

For example, on HoloLens, an app can intersect the user's [gaze](gaze.md) ray with the [spatial mapping](spatial-mapping.md) mesh to let the user decide where to place a hologram. When the user taps to place that hologram, create a spatial anchor at the intersection point and then place the hologram at the origin of that anchor's coordinate system.

Local spatial anchors are easy and performant to create, and the system will consolidate their internal data if multiple anchors can share their underlying sensor data. You should typically create a new local spatial anchor for each hologram that a user explicitly places, except in cases outlined below such as rigid groups of holograms.

### Always render anchored holograms within 3 meters of their anchor

Spatial anchors stabilize their coordinate system near the anchor's origin. If you render holograms more than about 3 meters from that origin, those holograms may experience noticeable positional errors in proportion to their distance from that origin, due to lever-arm effects. That works if the user stands near the anchor, since the hologram is far away from the user too, meaning the angular error of the distant hologram will be small. However, if the user walks up to that distant hologram, it will then be large in their view, making the lever-arm effects from the faraway anchor origin quite obvious.

### Group holograms that should form a rigid cluster

Multiple holograms can share the same spatial anchor if the app expects those holograms to maintain fixed relationships to one another.

For example, if you are animating a holographic solar system in a room, it's better to tie all of the solar system objects to a single anchor in the center, so that they move smoothly relative to each other. In this case, it is the solar system as a whole that is anchored, even though its component parts are moving dynamically around the anchor.

The key caveat here to maintain hologram stability is to follow the 3-meter rule above.

### Render highly dynamic holograms using the stationary frame of reference instead of a local spatial anchor

If you have a highly dynamic hologram, such as a character walking around the room, or a floating UI that follows along the wall near the user, it is best to skip local spatial anchors and render those holograms directly in the coordinate system provided by the [stationary frame of reference](coordinate-systems.md#stationary-frame-of-reference) (i.e. in Unity, you achieve this by placing holograms directly in world coordinates without a WorldAnchor). Holograms in a stationary frame of reference may experience drift when the user is far from the hologram, but this is less likely to be noticeable for dynamic holograms: either the hologram is constantly moving anyway, or its motion constantly keeps it close to the user, where drift will be minimized.

One interesting case of dynamic holograms is an object that is animating from one anchored coordinate system to another. For example, you might have two castles 10 meters apart, each on their own spatial anchor, with one castle firing a cannonball at the other castle. At the moment the cannonball is fired, you can render it at the appropriate location in the stationary frame of reference, so as to coincide with the cannon in the first castle's anchored coordinate system. It can then follow its trajectory in the stationary frame of reference as it flies 10 meters through the air. As the cannonball reaches the other castle, you may choose to move it into the second castle's anchored coordinate system to allow for physics calculations with that castle's rigid bodies.

If you are sharing a highly dynamic hologram across devices, you will need to pick some cloud spatial anchor to act as their parent, as stationary frames of reference cannot be shared across devices.  However, in this case, you should ensure that either either the dynamic hologram or the devices viewing it remain within the anchor's 3 meter radius, to ensure the hologram appears stable on all devices.

### Avoid creating a grid of spatial anchors

You may be tempted to have your app drop a regular grid of spatial anchors as the user walks around, transitioning dynamic objects from anchor to anchor as they move around. However, this involves a lot of management for your app, without the benefit of the deep sensor data that the system itself maintains internally. For these cases, you will usually achieve better results with less effort by placing your holograms in the stationary frame of reference, as described in the section above.

When pre-positioning a set of cloud spatial anchors around a static space, consider placing the spatial anchors at the locations of the key holograms the user will encounter per the principle above, rather than creating an arbitrary grid of anchors.  This ensures that you'll get maximum stability for those key holograms.

### Release local spatial anchors you no longer need

While a local spatial anchor is active, the system will prioritize keeping around the sensor data that is near that anchor. If you are no longer using a spatial anchor, stop accessing its coordinate system. This will allow its underlying sensor data to be removed as necessary.

This is especially important for local anchors you have persisted to the spatial anchor store. The sensor data behind these anchors will be kept around permanently to allow your app to find that anchor in future app sessions, which will reduce the space available to track other anchors. Persist only those local anchors that you need to find again in future sessions and remove them from the store when they are no longer meaningful to the user.

For cloud spatial anchors, your storage can scale as your scenario requires.  You may store as many cloud anchors as needed, releasing them only when you know that your users will not need to locate holograms at that anchor again.

## See also
* [Coordinate systems](coordinate-systems.md)
* [Shared experiences in mixed reality](shared-experiences-in-mixed-reality.md)
* <a href="https://docs.microsoft.com/azure/spatial-anchors" target="_blank">Azure Spatial Anchors</a>
* [Persistence in Unity](persistence-in-unity.md)
* [Spatial anchors in DirectX](coordinate-systems-in-directx.md#place-holograms-in-the-world-using-spatial-anchors)
* [Case study - Looking through holes in your reality](case-study-looking-through-holes-in-your-reality.md)

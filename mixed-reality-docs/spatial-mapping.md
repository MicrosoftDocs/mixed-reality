---
title: Spatial mapping
description: Spatial mapping provides a detailed representation of real-world surfaces in the environment around the HoloLens.
author: mattzmsft
ms.author: mazeller
ms.date: 03/21/2018
ms.topic: article
keywords: spatial mapping, HoloLens, mixed reality, surface reconstruction, mesh, sr
---



# Spatial mapping

Spatial mapping provides a detailed representation of real-world surfaces in the environment around the HoloLens, allowing developers to create a convincing mixed reality experience. By merging the real world with the virtual world, an application can make holograms seem real. Applications can also more naturally align with user expectations by providing familiar real-world behaviors and interactions.

<br>

>[!VIDEO https://www.youtube.com/embed/zff2aQ1RaVo]

## Device support

<table>
<tr>
<th>Feature</th><th style="width:150px"> <a href="hololens-hardware-details.md">HoloLens</a></th><th style="width:150px"> <a href="immersive-headset-hardware-details.md">Immersive headsets</a></th>
</tr><tr>
<td> Spatial mapping</td><td style="text-align: center;"> ✔️</td><td style="text-align: center;"></td>
</tr>
</table>



## Conceptual overview

![Mesh surfaces covering a room](images/SurfaceReconstruction.jpg)<br>
*An example of a spatial mapping mesh covering a room*

The two primary object types used for spatial mapping are the 'Spatial Surface Observer' and the 'Spatial Surface'.

The application provides the Spatial Surface Observer with one or more bounding volumes, to define the regions of space in which the application wishes to receive spatial mapping data. For each of these volumes, spatial mapping will provide the application with a set of Spatial Surfaces.

These volumes may be stationary (in a fixed location with respect to the real world) or they may be attached to the HoloLens (they move, but do not rotate, with the HoloLens as it moves through the environment). Each spatial surface describes real-world surfaces in a small volume of space, represented as a triangle mesh attached to a world-locked [spatial coordinate system](coordinate-systems.md).

As the HoloLens gathers new data about the environment, and as changes to the environment occur, spatial surfaces will appear, disappear and change.

## Common usage scenarios

![Illustrations of common Spatial Mapping usage scenarios: Placement, Occlusion, Physics and Navigation](images/sm-concepts-1000px.png)

### Placement

Spatial mapping provides applications with the opportunity to present natural and familiar forms of interaction to the user; what could be more natural than placing your phone down on the desk?

Constraining the placement of holograms (or more generally, any selection of spatial locations) to lie on surfaces provides a natural mapping from 3D (point in space) to 2D (point on surface). This reduces the amount of information the user needs to provide to the application and thus makes the user's interactions faster, easier and more precise. This is particularly true because 'distance away' is not something that we are used to physically communicating to other people or to computers. When we point with our finger, we are specifying a direction but not a distance.

An important caveat here is that when an application infers distance from direction (for example by performing a raycast along the user's gaze direction to find the nearest spatial surface), this must yield results that the user is able to reliably predict. Otherwise, the user will lose their sense of control and this can quickly become frustrating. One method that helps with this is to perform multiple raycasts instead of just one. The aggregate results should be smoother and more predictable, less susceptible to influence from transient 'outlier' results (as can be caused by rays passing through tiny holes or hitting small bits of geometry that the user is not aware of). Aggregation or smoothing can also be performed over time; for example you can limit the maximum speed at which a hologram can vary in distance from the user. Simply limiting the minimum and maximum distance value can also help, so the hologram being moved does not suddenly fly away into the distance or come crashing back into the user's face.

Applications can also use the shape and direction of surfaces to guide hologram placement. A holographic chair should not penetrate through walls and should sit flush with the floor even if it is slightly uneven. This kind of functionality would likely rely upon the use of physics collisions rather than just raycasts, however similar concerns will apply. If the hologram being placed has many small polygons that stick out, like the legs on a chair, it may make sense to expand the physics representation of those polygons to something wider and smoother so that they are more able to slide over spatial surfaces without snagging.

At its extreme, user input can be simplified away entirely and spatial surfaces can be used to perform entirely automatic hologram placement. For example, the application could place a holographic light-switch somewhere on the wall for the user to press. The same caveat about predictability applies doubly here; if the user expects control over hologram placement, but the application does not always place holograms where they expect (if the light-switch appears somewhere that the user cannot reach), then this will be a frustrating experience. It can actually be worse to perform automatic placement that requires user correction some of the time, than to just require the user to always perform placement themselves; because successful automatic placement is *expected*, manual correction feels like a burden!

Note also that the ability of an application to use spatial surfaces for placement depends heavily on the application's [scanning experience](spatial-mapping-design.md#the-environment-scanning-experience). If a surface has not been scanned, then it cannot be used for placement. It is up to the application to make this clear to the user, so that they can either help scan new surfaces or select a new location.

Visual feedback to the user is of paramount importance during placement. The user needs to know where the hologram is in relation to the nearest surface with [grounding effects](spatial-mapping.md#visualization). They should understand why the movement of their hologram is being constrained (for example, due to collision with another nearby surface). If they cannot place a hologram in the current location, then visual feedback should make it clear why not. For example, if the user is trying to place a holographic couch stuck half-way into the wall, then the portions of the couch that are behind the wall should pulsate in an angry color. Or conversely, if the application cannot find a spatial surface in a location where the user can see a real-world surface, then the application should make this clear. The obvious absence of a grounding effect in this area may achieve this purpose.

### Occlusion

One of the primary uses of spatial mapping surfaces is simply to occlude holograms. This simple behavior has a huge impact on the perceived realism of holograms, helping to create a visceral sense that really inhabit the same physical space as the user.

Occlusion also provides information to the user; when a hologram appears to be occluded by a real-world surface, this provides additional visual feedback as to the spatial location of that hologram in the world. Conversely, occlusion can also usefully *hide* information from the user; occluding holograms behind walls can reduce visual clutter in an intuitive way. To hide or reveal a hologram, the user merely has to move their head.

Occlusion can also be used to prime expectations for a natural user interface based upon familiar physical interactions; if a hologram is occluded by a surface it is because that surface is solid, so the user should expect that the hologram will *collide* with that surface and not simply pass through it.

Sometimes, occlusion of holograms is undesirable. If a user needs to be able to interact with a hologram, then they need to be able to see it - even if it is behind a real-world surface. In such cases, it usually makes sense to render such a hologram differently when it is occluded (for example, by reducing its brightness). This way, the user will be able to visually locate the hologram, but they will still be aware that it is behind something.

### Physics

The use of physics simulation is another way in which spatial mapping can be used to reinforce the *presence* of holograms in the user's physical space. When my holographic rubber ball rolls realistically off my desk, bounces across the floor and disappears under the couch, it might be hard for me to believe that it's not really there.

Physics simulation also provides the opportunity for an application to use natural and familiar physics-based interactions. Moving a piece of holographic furniture around on the floor will likely be easier for the user if the furniture responds as if it were sliding across the floor with the appropriate inertia and friction.

In order to generate realistic physical behaviors, you will likely need to perform some [mesh processing](spatial-mapping.md#mesh-processing) such as filling holes, removing floating hallucinations and smoothing rough surfaces.

You will also need to consider how your application's [scanning experience](spatial-mapping-design.md#the-environment-scanning-experience) influences its physics simulation. Firstly, missing surfaces won't collide with anything; what happens when the rubber ball rolls off down the corridor and off the end of the known world? Secondly, you need to decide whether you will continue to respond to changes in the environment over time. In some cases, you will want to respond as quickly as possible; say if the user is using doors and furniture as movable barricades in defense against a tempest of incoming Roman arrows. In other cases though, you may want to ignore new updates; driving your holographic sports car around the racetrack on your floor may suddenly not be so fun if your dog decides to sit in the middle of the track.

### Navigation

Applications can use spatial mapping data to grant holographic characters (or agents) the ability to navigate the real world in the same way a real person would. This can help reinforce the presence of holographic characters by restricting them to the same set of natural, familiar behaviors as those of the user and their friends.

Navigation capabilities could be useful to users as well. Once a navigation map has been built in a given area, it could be shared to provide holographic directions for new users unfamiliar with that location. This map could be designed to help keep pedestrian 'traffic' flowing smoothly, or to avoid accidents in dangerous locations like construction sites.

The key technical challenges involved in implementing navigation functionality will be reliable detection of walkable surfaces (humans don't walk on tables!) and graceful adaptation to changes in the environment (humans don't walk through closed doors!). The mesh may require some [processing](spatial-mapping.md#mesh-processing) before it is usable for path-planning and navigation by a virtual character. Smoothing the mesh and removing hallucinations may help avoid characters becoming stuck. You may also wish to drastically simplify the mesh in order to speed up your character's path-planning and navigation calculations. These challenges have received a great deal of attention in the development of videogame technology, and there is a wealth of available research literature on these topics.

Note that the built-in NavMesh functionality in Unity cannot be used with spatial mapping surfaces. This is because spatial mapping surfaces are not known until the application starts, whereas NavMesh data files need to be generated from source assets ahead of time. Also note that, the spatial mapping system will not provide [information about surfaces very far away](spatial-mapping-design.md#the-environment-scanning-experience) from the user's current location. So the application must 'remember' surfaces itself if it is to build a map of a very large area.

### Visualization

Most of the time it is appropriate for spatial surfaces to be invisible; to minimize visual clutter and let the real world speak for itself. However, sometimes it is useful to visualize spatial mapping surfaces directly, despite the fact that their real-world counterparts are already visible.

For example, when the user is trying to place a hologram onto a surface (placing a holographic cabinet on the wall, say) it can be useful to 'ground' the hologram by casting a shadow onto the surface. This gives the user a much clearer sense of the exact physical proximity between the hologram and the surface. This is also an example of the more general practice of visually 'previewing' a change before the user commits to it.

By visualizing surfaces, the application can share with the user its understanding of the environment. For example, a holographic board game could visualize the horizontal surfaces that it has identified as 'tables', so the user knows where they should go to interact.

Visualizing surfaces can be a useful way to show the user nearby spaces that are hidden from view. This could provide a simple way to give the user access to their kitchen (and all of its contained holograms) from their living room.

The surface meshes provided by spatial mapping may not be particularly 'clean'. Thus it is important to visualize them appropriately. Traditional lighting calculations may highlight errors in surface normals in a visually distracting manner, whilst 'clean' textures projected onto the surface may help to give it a tidier appearance. It is also possible to perform [mesh processing](spatial-mapping.md#mesh-processing) to improve mesh properties, before the surfaces are rendered.

## Using The Surface Observer

The starting point for spatial mapping is the surface observer. Program flow is as follows:
* Create a surface observer object
   * Provide one or more spatial volumes, to define the regions of interest in which the application wishes to receive spatial mapping data. A spatial volume is simply a shape defining a region of space, such as a sphere or a box.
   * Use a spatial volume with a world-locked spatial coordinate system to identify a fixed region of the physical world.
   * Use a spatial volume, updated each frame with a body-locked spatial coordinate system, to identify a region of space that moves (but does not rotate) with the user.
   * These spatial volumes may be changed later at any time, as the status of the application or the user changes.
* Use polling or notification to retrieve information about spatial surfaces
   * You may 'poll' the surface observer for spatial surface status at any time. Alternatively, you may register for the surface observer's 'surfaces changed' event, which will notify the application when spatial surfaces have changed.
   * For a dynamic spatial volume, such as the view frustum, or a body-locked volume, applications will need to poll for changes each frame by setting the region of interest and then obtaining the current set of spatial surfaces.
   * For a static volume, such as a world-locked cube covering a single room, applications may register for the 'surfaces changed' event to be notified when spatial surfaces inside that volume may have changed.
* Process surfaces changes
   * Iterate the provided set of spatial surfaces.
   * Classify spatial surfaces as added, changed or removed.
   * For each added or changed spatial surface, if appropriate submit an asynchronous request to receive updated mesh representing the surface's current state at the desired level of detail.
* Process the asynchronous mesh request (more details in following sections).

## Mesh Caching

Spatial surfaces are represented by dense triangle meshes. Storing, rendering and processing these meshes can consume significant computational and storage resources. As such, each application should adopt a mesh caching scheme appropriate to its needs, in order to minimize the resources used for mesh processing and storage. This scheme should determine which meshes to retain and which to discard, as well as when to update the mesh for each spatial surface.

Many of the considerations discussed there will directly inform how your application should approach mesh caching. You should consider how the user moves through the environment, which surfaces are needed, when different surfaces will be observed and when changes in the environment should be captured.

When interpreting the 'surfaces changed' event provided by the surface observer, the basic mesh caching logic is as follows:
* If the application sees a spatial surface ID that it has not seen before, it should treat this as a new spatial surface.
* If the application sees a spatial surface with a known ID but with a new update time, it should treat this as an updated spatial surface.
* If the application no longer sees a spatial surface with a known ID, it should treat this as a removed spatial surface.

It is up to each application to then make the following choices:
* For new spatial surfaces, should mesh be requested?
   * Generally mesh should be requested immediately for new spatial surfaces, which may provide useful new information to the user.
   * However, new spatial surfaces near and in front of the user should be given priority and their mesh should be requested first.
   * If the new mesh is not needed, if for example the application has permanently or temporarily 'frozen' its model of the environment, then it should not be requested.
* For updated spatial surfaces, should mesh be requested?
   * Updated spatial surfaces near and in front of the user should be given priority and their mesh should be requested first.
   * It may also be appropriate to give higher priority to new surfaces than to updated surfaces, especially during the scanning experience.
   * To limit processing costs, applications may wish to throttle the rate at which they process updates to spatial surfaces.
   * It may be possible to infer that changes to a spatial surface are minor, for example if the bounds of the surface are small, in which case the update may not be important enough to process.
   * Updates to spatial surfaces outside the current region of interest of the user may be ignored entirely, though in this case it may be more efficient to modify the spatial bounding volumes in use by the surface observer.
* For removed spatial surfaces, should mesh be discarded?
   * Generally mesh should be discarded immediately for removed spatial surfaces, so that hologram occlusion remains correct.
   * However, if the application has reason to believe that a spatial surface will reappear shortly (perhaps based upon the design of the user experience), then it may be more efficient to retain it than to discard its mesh and recreate it again later.
   * If the application is building a large-scale model of the user's environment then it may not wish to discard any meshes at all. It will still need to limit resource usage though, possibly by spooling meshes to disk as spatial surfaces disappear.
   * Note that some relatively rare events during spatial surface generation can cause spatial surfaces to be replaced by new spatial surfaces in a similar location but with different IDs. Consequently, applications that choose not to discard a removed surface should take care not to end up with multiple highly-overlapped spatial surface meshes covering the same location.
* Should mesh be discarded for any other spatial surfaces?
   * Even while a spatial surface exists, if it is no longer useful to the user's experience then it should be discarded. For example, if the application 'replaces' the room on the other side of a doorway with an alternate virtual space then the spatial surfaces in that room no longer matter.

Here is an example mesh caching strategy, using spatial and temporal hysteresis:
* Consider an application that wishes to use a frustum-shaped spatial volume of interest that follows the user's gaze as they look around and walk around.
* A spatial surface may disappear temporarily from this volume simply because the user looks away from the surface or steps further away from it... only to look back or moves closer again a moment later. In this case, discarding and re-creating the mesh for this surface represents a lot of redundant processing.
* To reduce the number of changes processed, the application uses two spatial surface observers, one contained within the other. The larger volume is spherical and follows the user 'lazily'; it only moves when necessary to ensure that its centre is within 2.0 metres of the user.
* New and updated spatial surface meshes are always processed from the smaller inner surface observer, but meshes are cached until they disappear from the larger outer surface observer. This allows the application to avoid processing many redundant changes due to local user movement.
* Since a spatial surface may also disappear temporarily due to tracking loss, the application also defers discarding removed spatial surfaces during tracking loss.
* In general, an application should evaluate the tradeoff between reduced update processing and increased memory usage to determine its ideal caching strategy.

## Rendering

There are three primary ways in which spatial mapping meshes tend to be used for rendering:
* For surface visualization
   * It is often useful to visualize spatial surfaces directly. For example, casting 'shadows' from objects onto spatial surfaces can provide helpful visual feedback to the user while they are placing holograms on surfaces.
   * One thing to bear in mind is that spatial meshes are different to the kind of meshes that a 3D artist might create. The triangle topology will not be as 'clean' as human-created topology, and the mesh will suffer from [various errors](spatial-mapping-design.md#what-influences-spatial-mapping-quality).
   * In order to create a pleasing visual aesthetic, you may thus want to perform some [mesh processing](spatial-mapping.md#mesh-processing), for example to fill holes or smooth surface normals. You may also wish to use a shader to project artist-designed textures onto your mesh instead of directly visualizing mesh topology and normals.
* For occluding holograms behind real-world surfaces
   * Spatial surfaces can be rendered in a depth-only pass which only affects the [depth buffer](https://msdn.microsoft.com/library/windows/desktop/bb219616(v=vs.85).aspx) and does not affect color render targets.
   * This primes the depth buffer to occlude subsequently-rendered holograms behind spatial surfaces. Accurate occlusion of holograms enhances the sense that holograms really exist within the user's physical space.
   * To enable depth-only rendering, update your blend state to set the [RenderTargetWriteMask](https://msdn.microsoft.com/library/windows/desktop/hh404492(v=vs.85).aspx) to zero for all color render targets.
* For modifying the appearance of holograms occluded by real-world surfaces
   * Normally rendered geometry is hidden when it is occluded. This is achieved by setting the depth function in your [depth-stencil state](https://msdn.microsoft.com/library/windows/desktop/ff476110(v=vs.85).aspx) to "less than or equal", which causes geometry to be visible only where it is **closer** to the camera than all previously rendered geometry.
   * However, it may be useful to keep certain geometry visible even when it is occluded, and to modify its appearance when occluded as a way of providing visual feedback to the user. For example, this allows the application to show the user the location of an object whilst making it clear that is behind a real-world surface.
   * To achieve this, render the geometry a second time with a different shader that creates the desired 'occluded' appearance. Before rendering the geometry for the second time, make two changes to your [depth-stencil state](https://msdn.microsoft.com/library/windows/desktop/ff476110(v=vs.85).aspx). First, set the depth function to "greater than or equal" so that the geometry will be visible only where it is **further** from the camera than all previously rendered geometry. Second, set the DepthWriteMask to zero, so that the depth buffer will not be modified (the depth buffer should continue to represent the depth of the geometry **closest** to the camera).

[Performance](performance-recommendations-for-hololens-apps.md) is an important concern when rendering spatial mapping meshes. Here are some rendering performance techniques specific to rendering spatial mapping meshes:
* Adjust triangle density
   * When requesting spatial surface meshes from your surface observer, request the lowest density of triangle meshes that will suffice for your needs.
   * It may make sense to vary triangle density on a surface by surface basis, depending on the surface's distance from the user, and its relevance to the user experience.
   * Reducing triangle counts will reduce memory usage and vertex processing costs on the GPU, though it will not affect pixel processing costs.
* Perform frustum culling
   * Frustum culling skips drawing objects that cannot be seen because they are outside the current display frustum. This reduces both CPU and GPU processing costs.
   * Since culling is performed on a per-mesh basis and spatial surfaces can be large, breaking each spatial surface mesh into smaller chunks may result in more efficient culling (in that fewer offscreen triangles are rendered). There is a tradeoff, however; the more meshes you have, the more draw calls you must make, which can increase CPU costs. In an extreme case, the frustum culling calculations themselves could even have a measurable CPU cost.
* Adjust rendering order
   * Spatial surfaces tend to be large, because they represent the user's entire environment surrounding them. Pixel processing costs on the GPU can thus be high, especially in cases where there is more than one layer of visible geometry (including both spatial surfaces and other holograms). In this case, the layer nearest to the user will be occluding any layers further away, so any GPU time spent rendering those more distant layers is wasted.
   * To reduce this redundant work on the GPU, it helps to render opaque surfaces in front-to-back order (closer ones first, more distant ones last). By 'opaque' we mean surfaces for which the DepthWriteMask is set to one in your [depth-stencil state](https://msdn.microsoft.com/library/windows/desktop/ff476110(v=vs.85).aspx). When the nearest surfaces are rendered, they will prime the depth buffer so that more distant surfaces are efficiently skipped by the pixel processor on the GPU.

## Mesh Processing

An application may want to perform [various operations](spatial-mapping.md#mesh-processing) on spatial surface meshes to suit its needs. The index and vertex data provided with each spatial surface mesh uses the same familiar layout as the [vertex and index buffers](https://msdn.microsoft.com/library/windows/desktop/bb147325%28v=vs.85%29.aspx) that are used for rendering triangle meshes in all modern rendering APIs. However, one key fact to be aware of is that spatial mapping triangles have a **front-clockwise winding order**. Each triangle is represented by three vertex indices in the mesh's index buffer and these indices will identify the triangle's vertices in a **clockwise** order, when the triangle is viewed from the **front** side. The front side (or outside) of spatial surface meshes corresponds as you would expect to the front (visible) side of real world surfaces.

Applications should only perform mesh simplification if the coarsest triangle density provided by the surface observer is still insufficiently coarse - this work is computationally expensive and already being performed by the runtime to generate the various provided levels of detail.

Because each surface observer can provide multiple unconnected spatial surfaces, some applications may wish to clip these spatial surface meshes against each other, then zipper them together. In general, the clipping step is required, as nearby spatial surface meshes often overlap slightly.

## Raycasting and Collision

In order for a physics API (such as [Havok](http://www.havok.com/)) to provide an application with raycasting and collision functionality for spatial surfaces, the application must provide spatial surface meshes to the physics API. Meshes used for physics often have the following properties:
* They contain only small numbers of triangles. Physics operations are more computationally intensive than rendering operations.
* They are 'water-tight'. Surfaces intended to be solid should not have small holes in them; even holes too small to be visible can cause problems.
* They are converted into convex hulls. Convex hulls have few polygons and are free of holes, and they are much more computationally efficient to process than raw triangle meshes.

When performing raycasts against spatial surfaces, bear in mind that these surfaces are often complex, cluttered shapes full of messy little details - just like your desk! This means that a single raycast is often insufficient to give you enough information about the shape of the surface and the shape of the empty space near it. It is thus usually a good idea to perform many raycasts within a small area and to use the aggregate results to derive a more reliable understanding of the surface. For example, using the average of 10 raycasts to guide hologram placement on a surface will yield a far smoother and less 'jittery' result that using just a single raycast.

However, bear in mind that each raycast can have a high computational cost. Thus depending on your usage scenario you should trade off the computational cost of additional raycasts (performed every frame) against the computational cost of [mesh processing](spatial-mapping.md#mesh-processing) to smooth and remove holes in spatial surfaces (performed when spatial meshes are updated).

## Troubleshooting
* In order for the surface meshes to be orientated correctly, each GameObject needs to be active before it is sent to the SurfaceObeserver to have its mesh constructed. Otherwise, the meshes will show up in your space but rotated at weird angles.
* The GameObject that runs the script that communicates with the SurfaceObserver needs to be set to the origin. Otherwise, all of GameObjects that you create and send to the SurfaceObserver to have their meshes constructed will have an offset equal to the offset of the Parent Game Object. This can make your meshes show up several meters away which makes it very hard to debug what is going on.

## See also
* [Coordinate systems](coordinate-systems.md)
* [Spatial mapping in DirectX](spatial-mapping-in-directx.md)
* [Spatial mapping in Unity](spatial-mapping-in-unity.md)
* [Spatial mapping design](spatial-mapping-design.md)
* [Case study - Looking through holes in your reality](case-study-looking-through-holes-in-your-reality.md)

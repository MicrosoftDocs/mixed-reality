---
title: Spatial mapping
description: Spatial mapping provides a detailed representation of real-world surfaces in the environment around the HoloLens.
author: mattzmsft
ms.author: mazeller
ms.date: 03/21/2018
ms.topic: article
keywords: spatial mapping, HoloLens, mixed reality, surface reconstruction, mesh, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens, MRTK, Mixed Reality Toolkit, scene understanding, world mesh, occlusion, physics, navigation, surface observer, rendering, mesh processing
---

# Spatial mapping

Spatial mapping provides a detailed representation of real-world surfaces in the environment around the HoloLens, allowing developers to create a convincing mixed reality experience. By merging the real world with the virtual world, an application can make holograms seem real. Applications can also more naturally align with user expectations by providing familiar real-world behaviors and interactions.

<br>

>[!VIDEO https://www.youtube.com/embed/zff2aQ1RaVo]

## Device supports

<table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <tr>
        <td><strong>Feature</strong></td>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens (1st gen)</strong></a></td>
        <td><a href="/hololens/hololens2-hardware"><strong>HoloLens 2</strong></td>
        <td><a href="/windows/mixed-reality/enthusiast-guide/immersive-headset-hardware-details"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Spatial mapping</td>
        <td>✔️</td>
        <td>✔️</td>
        <td>❌</td>
    </tr>
</table>


## Why is spatial mapping important?

Spatial mapping makes it possible to place objects on real surfaces. This helps anchor objects in the user's world and takes advantage of real world depth cues. Occluding your holograms based on other holograms and real world objects helps convince the user that these holograms are actually in their space. Holograms floating in space or moving with the user won't feel as real. When possible, place items for comfort.

Visualize surfaces when placing or moving holograms (use a projected grid). This helps users know where they can best place their holograms, and shows if the spot they're trying to place the hologram isn't mapped. You can "billboard items" toward the user if they end up at too much of an angle.

## Conceptual overview

![Mesh surfaces covering a room](images/SurfaceReconstruction.jpg)<br>
*An example of a spatial mapping mesh covering a room*

The two primary object types used for spatial mapping are the 'Spatial Surface Observer' and the 'Spatial Surface'.

The application provides the Spatial Surface Observer with one or more bounding volumes, to define the regions of space in which the application wishes to receive spatial mapping data. For each of these volumes, spatial mapping will provide the application with a set of Spatial Surfaces.

These volumes may be stationary (in a fixed location based on the real world) or they may be attached to the HoloLens (they move, but don't rotate, with the HoloLens as it moves through the environment). Each spatial surface describes real-world surfaces in a small volume of space, represented as a triangle mesh attached to a world-locked [spatial coordinate system](coordinate-systems.md).

As the HoloLens gathers new data about the environment, and as changes to the environment occur, spatial surfaces will appear, disappear, and change.

## Spatial Awareness design concepts demo

If you'd like to see Spatial Awareness design concepts in action, check out our **Designing Holograms - Spatial Awareness** video demo below. When you've finished, continue on for a more detailed dive into specific topics.

> [!VIDEO https://learn.microsoft.com/shows/Docs-Mixed-Reality/Microsofts-Designing-Holograms-Spatial-Awareness-Chapter/player]

*This video was taken from the "Designing Holograms" HoloLens 2 app. Download and enjoy the full experience [here](https://aka.ms/dhapp).*

## Spatial Mapping vs. Scene Understanding WorldMesh

For HoloLens 2, it's possible to query a static version of the spatial mapping data using [Scene understanding SDK](../develop/unity/scene-understanding-SDK.md) (EnableWorldMesh setting). Here are the differences between two ways of accessing the spatial mapping data:
* Spatial Mapping API:
   * Limited range: the spatial mapping data available to applications in a limited size cached 'bubble' around the user.
   * Provides low latency updates of changed mesh regions through SurfacesChanged events.
   * Variable level of details controlled by Triangles Per Cubic Meter parameter.
* Scene understanding SDK:
   * Unlimited range - provides all the scanned spatial mapping data within the query radius.
   * Provides a static snapshot of the spatial mapping data. Getting the updated spatial mapping data requires running a new query for the whole mesh.
   * Consistent level of details controlled by RequestedMeshLevelOfDetail setting.

## What influences spatial mapping quality?

Several factors, detailed [here](/hololens/hololens-environment-considerations), can affect the frequency and severity of these errors.  However, you should design your application so that the user can achieve their goals even in the presence of errors in the spatial mapping data.

## Common usage scenarios

![Illustrations of common Spatial Mapping usage scenarios: Placement, Occlusion, Physics and Navigation](images/sm-concepts-1000px.png)

### Placement

Spatial mapping provides applications with the opportunity to present natural and familiar forms of interaction to the user; what could be more natural than placing down your phone on the desk?

Constraining the placement of holograms (or more generally, any selection of spatial locations) to lie on surfaces provides a natural mapping from 3D (point in space) to 2D (point on surface). This reduces the amount of information the user needs to provide to the application and makes the user's interactions faster, easier, and more precise. This is true because 'distance away' isn't something that we're used to physically communicating to other people or to computers. When we point with our finger, we're specifying a direction but not a distance.

An important caveat here's that when an application infers distance from direction (for example by doing a raycast along the user's gaze direction to find the nearest spatial surface), this must yield results that the user can reliably predict. Otherwise, the user will lose their sense of control and this can quickly become frustrating. One method that helps with this is to do multiple raycasts instead of just one. The aggregate results should be smoother and more predictable, less susceptible to influence from transient 'outlier' results (as can be caused by rays passing through tiny holes or hitting small bits of geometry that the user isn't aware of). Aggregation or smoothing can also be performed over time; for example, you can limit the maximum speed at which a hologram can vary in distance from the user. Simply limiting the minimum and maximum distance value can also help, so the hologram being moved doesn't suddenly fly away into the distance or come crashing back into the user's face.

Applications can also use the shape and direction of surfaces to guide hologram placement. A holographic chair shouldn't penetrate through walls and should sit flush with the floor even if it's slightly uneven. This kind of functionality would likely rely upon the use of physics collisions rather than raycasts, however similar concerns will apply. If the hologram being placed has many small polygons that stick out, like the legs on a chair, it may make sense to expand the physics representation of those polygons to something wider and smoother so that they're more able to slide over spatial surfaces without snagging.

At its extreme, user input can be simplified away entirely and spatial surfaces can be used to do entirely automatic hologram placement. For example, the application could place a holographic light-switch somewhere on the wall for the user to press. The same caveat about predictability applies doubly here; if the user expects control over hologram placement, but the application doesn't always place holograms where they expect (if the light-switch appears somewhere that the user can't reach), then this will be a frustrating experience. It can actually be worse to do automatic placement that requires user correction some of the time, than to just require the user to always do placement themselves; because successful automatic placement is *expected*, manual correction feels like a burden!

Note also that the ability of an application to use spatial surfaces for placement depends heavily on the application's [scanning experience](spatial-mapping.md#the-environment-scanning-experience). If a surface hasn't been scanned, then it cannot be used for placement. It's up to the application to make this clear to the user, so that they can either help scan new surfaces or select a new location.

Visual feedback to the user is of paramount importance during placement. The user needs to know where the hologram is based on the nearest surface with [grounding effects](spatial-mapping.md#visualization). They should understand why the movement of their hologram is being constrained (for example, because of collisions with another nearby surface). If they can't place a hologram in the current location, then visual feedback should make it clear why not. For example, if the user is trying to place a holographic couch stuck half-way into the wall, then the portions of the couch that are behind the wall should pulsate in an angry color. Or conversely, if the application can't find a spatial surface in a location where the user can see a real-world surface, then the application should make this clear. The obvious absence of a grounding effect in this area may achieve this purpose.

### Occlusion

One of the primary uses of spatial mapping surfaces is simply to occlude holograms. This simple behavior has a huge impact on the perceived realism of holograms, helping to create a visceral sense that really inhabits the same physical space as the user.

Occlusion also provides information to the user; when a hologram appears to be occluded by a real-world surface, this provides extra visual feedback as to the spatial location of that hologram in the world. Conversely, occlusion can also usefully *hide* information from the user; occluding holograms behind walls can reduce visual clutter in an intuitive way. To hide or reveal a hologram, the user merely has to move their head.

Occlusion can also be used to prime expectations for a natural user interface based upon familiar physical interactions; if a hologram is occluded by a surface it is because that surface is solid, so the user should expect that the hologram will *collide* with that surface and not pass through it.

Sometimes, occlusion of holograms is undesirable. If a user needs to interact with a hologram, then they need to see it - even if it is behind a real-world surface. In such cases, it usually makes sense to render such a hologram differently when it's occluded (for example, by reducing its brightness). This way, the user can visually locate the hologram, but they'll still know it's behind something.

### Physics

The use of physics simulation is another way in which spatial mapping can be used to reinforce the *presence* of holograms in the user's physical space. When my holographic rubber ball rolls realistically off my desk, bounces across the floor and disappears under the couch, it might be hard for me to believe that it's not there.

Physics simulation also provides the opportunity for an application to use natural and familiar physics-based interactions. Moving a piece of holographic furniture around on the floor will likely be easier for the user if the furniture responds as if it were sliding across the floor with the appropriate inertia and friction.

To generate realistic physical behaviors, you'll likely need to do some [mesh processing](spatial-mapping.md#mesh-processing) such as filling holes, removing floating hallucinations and smoothing rough surfaces.

You'll also need to consider how your application's [scanning experience](spatial-mapping.md#the-environment-scanning-experience) influences its physics simulation. Firstly, missing surfaces won't collide with anything; what happens when the rubber ball rolls off down the corridor and off the end of the known world? Secondly, you need to decide whether you'll continue to respond to changes in the environment over time. In some cases, you'll want to respond as quickly as possible; say if the user is using doors and furniture as movable barricades in defense against a tempest of incoming Roman arrows. In other cases though, you may want to ignore new updates; driving your holographic sports car around the racetrack on your floor may suddenly not be so fun if your dog decides to sit in the middle of the track.

### Navigation

Applications can use spatial mapping data to grant holographic characters (or agents) the ability to navigate the real world in the same way a real person would. This can help reinforce the presence of holographic characters by restricting them to the same set of natural, familiar behaviors as those of the user and their friends.

Navigation capabilities could be useful to users as well. Once a navigation map has been built in a given area, it could be shared to provide holographic directions for new users unfamiliar with that location. This map could be designed to help keep pedestrian 'traffic' flowing smoothly, or to avoid accidents in dangerous locations like construction sites.

The key technical challenges involved in implementing navigation functionality will be reliable detection of walkable surfaces (humans don't walk on tables!) and graceful adaptation to changes in the environment (humans don't walk through closed doors!). The mesh may require some [processing](spatial-mapping.md#mesh-processing) before it's usable for path-planning and navigation by a virtual character. Smoothing the mesh and removing hallucinations may help avoid characters becoming stuck. You may also wish to drastically simplify the mesh to speed up your character's path-planning and navigation calculations. These challenges have received a great deal of attention in the development of video game technology, and there's a wealth of available research literature on these topics.

The built-in NavMesh functionality in Unity can't be used with spatial mapping surfaces because, by default, the surfaces aren't known until the application starts. However, you *can* build a NavMesh during runtime by installing [NavMeshComponents](https://github.com/Unity-Technologies/NavMeshComponents). Note that the spatial mapping system won't provide [information about surfaces far away](spatial-mapping.md#the-environment-scanning-experience) from the user's current location; to build a map of a large area, the application must "remember" surfaces. You can also increase the *observation extents* setting in the spatial awareness profile, which increases the area on which you can build your NavMesh.

### Visualization

Most of the time it's appropriate for spatial surfaces to be invisible; to minimize visual clutter and let the real world speak for itself. However, sometimes it's useful to visualize spatial mapping surfaces directly, despite their real-world counterparts being visible.

For example, when the user is trying to place a hologram onto a surface (placing a holographic cabinet on the wall, say) it can be useful to 'ground' the hologram by casting a shadow onto the surface. This gives the user a much clearer sense of the exact physical proximity between the hologram and the surface. This is also an example of the more general practice of visually 'previewing' a change before the user commits to it.

By visualizing surfaces, the application can share with the user its understanding of the environment. For example, a holographic board game could visualize the horizontal surfaces that it has identified as 'tables', so the user knows where they should go to interact.

Visualizing surfaces can be a useful way to show the user nearby spaces that are hidden from view. This could provide a way to give the user access to their kitchen (and all of its contained holograms) from their living room.

The surface meshes provided by spatial mapping may not be particularly 'clean'. It's important to visualize them appropriately. Traditional lighting calculations may highlight errors in surface normals in a visually distracting manner, while 'clean' textures projected onto the surface may help to give it a tidier appearance. It's also possible to do [mesh processing](spatial-mapping.md#mesh-processing) to improve mesh properties, before the surfaces are rendered.

> [!NOTE]
> HoloLens 2 implements a new [Scene Understanding Runtime](scene-understanding.md), that provides Mixed Reality developers with a structured, high-level environment representation designed to simplify the implementation of placement, occlusion, physics and navigation.

## Using The Surface Observer

The starting point for spatial mapping is the surface observer. Program flow is as follows:
* Create a surface observer object
   * Provide one or more spatial volumes, to define the regions of interest in which the application wishes to receive spatial mapping data. A spatial volume is simply a shape defining a region of space, such as a sphere or a box.
   * Use a spatial volume with a world-locked spatial coordinate system to identify a fixed region of the physical world.
   * Use a spatial volume, updated each frame with a body-locked spatial coordinate system, to identify a region of space that moves (but doesn't rotate) with the user.
   * These spatial volumes may be changed later at any time, as the status of the application or the user changes.
* Use polling or notification to retrieve information about spatial surfaces
   * You may 'poll' the surface observer for spatial surface status at any time. Instead, you may register for the surface observer's 'surfaces changed' event, which will notify the application when spatial surfaces have changed.
   * For a dynamic spatial volume, such as the view frustum, or a body-locked volume, applications will need to poll for changes each frame by setting the region of interest and then obtaining the current set of spatial surfaces.
   * For a static volume, such as a world-locked cube covering a single room, applications may register for the 'surfaces changed' event to be notified when spatial surfaces inside that volume may have changed.
* Process surfaces changes
   * Iterate the provided set of spatial surfaces.
   * Classify spatial surfaces as added, changed, or removed.
   * For each added or changed spatial surface, if appropriate submit an asynchronous request to receive updated mesh representing the surface's current state at the desired level of detail.
* Process the asynchronous mesh request (more details in following sections).

## Mesh Caching

Spatial surfaces are represented by dense triangle meshes. Storing, rendering, and processing these meshes can consume significant computational and storage resources. As such, each application should adopt a mesh caching scheme appropriate to its needs, to minimize the resources used for mesh processing and storage. This scheme should determine which meshes to keep and which to discard, and when to update the mesh for each spatial surface.

Many of the considerations discussed there will directly inform how your application should approach mesh caching. You should consider how the user moves through the environment, which surfaces are needed, when different surfaces will be observed and when changes in the environment should be captured.

When interpreting the 'surfaces changed' event provided by the surface observer, the basic mesh caching logic is as follows:
* If the application sees a spatial surface ID that it hasn't seen before, it should treat this as a new spatial surface.
* If the application sees a spatial surface with a known ID but with a new update time, it should treat this as an updated spatial surface.
* If the application no longer sees a spatial surface with a known ID, it should treat this as a removed spatial surface.

It's up to each application to then make the following choices:
* For new spatial surfaces, should mesh be requested?
   * Generally mesh should be requested immediately for new spatial surfaces, which may provide useful new information to the user.
   * However, new spatial surfaces near and in front of the user should be given priority and their mesh should be requested first.
   * If the new mesh isn't needed, if for example the application has permanently or temporarily 'frozen' its model of the environment, then it shouldn't be requested.
* For updated spatial surfaces, should mesh be requested?
   * Updated spatial surfaces near and in front of the user should be given priority and their mesh should be requested first.
   * It may also be appropriate to give higher priority to new surfaces than to updated surfaces, especially during the scanning experience.
   * To limit processing costs, applications may wish to throttle the rate at which they process updates to spatial surfaces.
   * It may be possible to infer that changes to a spatial surface are minor, for example if the bounds of the surface are small, in which case the update may not be important enough to process.
   * Updates to spatial surfaces outside the current region of interest of the user may be ignored entirely, though in this case it may be more efficient to modify the spatial bounding volumes in use by the surface observer.
* For removed spatial surfaces, should mesh be discarded?
   * Generally mesh should be discarded immediately for removed spatial surfaces, so that hologram occlusion remains correct.
   * However, if the application has reason to believe that a spatial surface will reappear shortly (based upon the design of the user experience), then it may be more efficient to keep it than to discard its mesh and recreate it again later.
   * If the application is building a large-scale model of the user's environment, then it may not wish to discard any meshes at all. It will still need to limit resource usage though, possibly by spooling meshes to disk as spatial surfaces disappear.
   * Some relatively rare events during spatial surface generation can cause spatial surfaces to be replaced by new spatial surfaces in a similar location but with different IDs. So, applications that choose not to discard a removed surface should take care not to end up with multiple highly overlapped spatial surfaces meshes covering the same location.
* Should mesh be discarded for any other spatial surfaces?
   * Even while a spatial surface exists, if it's no longer useful to the user's experience then it should be discarded. For example, if the application 'replaces' the room on the other side of a doorway with an alternate virtual space then the spatial surfaces in that room no longer matter.

Here's an example mesh caching strategy, using spatial and temporal hysteresis:
* Consider an application that wishes to use a frustum-shaped spatial volume of interest that follows the user's gaze as they look around and walk around.
* A spatial surface may disappear temporarily from this volume simply because the user looks away from the surface or steps further away from it... only to look back or moves closer again a moment later. In this case, discarding and re-creating the mesh for this surface represents many redundant processings.
* To reduce the number of changes processed, the application uses two spatial surface observers, one contained within the other. The larger volume is spherical and follows the user 'lazily'; it only moves when necessary to ensure that its center is within 2.0 meters of the user.
* New and updated spatial surface meshes are always processed from the smaller inner surface observer, but meshes are cached until they disappear from the larger outer surface observer. This allows the application to avoid processing many redundant changes because of local user movement.
* Since a spatial surface may also disappear temporarily because of tracking loss, the application also defers discarding removed spatial surfaces during tracking loss.
* In general, an application should evaluate the tradeoff between reduced update processing and increased memory usage to determine its ideal caching strategy.

## Rendering

There are three primary ways in which spatial mapping meshes tend to be used for rendering:
* For surface visualization
   * It's often useful to visualize spatial surfaces directly. For example, casting 'shadows' from objects onto spatial surfaces can provide helpful visual feedback to the user while they're placing holograms on surfaces.
   * One thing to bear in mind is that spatial meshes are different to the kind of meshes that a 3D artist might create. The triangle topology won't be as 'clean' as human-created topology, and the mesh will suffer from [various errors](spatial-mapping.md#what-influences-spatial-mapping-quality).
   * To create a pleasing visual aesthetic, you may want to do some [mesh processing](spatial-mapping.md#mesh-processing), for example to fill holes or smooth surface normals. You may also wish to use a shader to project artist-designed textures onto your mesh instead of directly visualizing mesh topology and normals.
* For occluding holograms behind real-world surfaces
   * Spatial surfaces can be rendered in a depth-only pass, which only affects the [depth buffer](/windows/win32/direct3d9/depth-buffers) and doesn't affect color render targets.
   * This primes the depth buffer to occlude subsequently rendered holograms behind spatial surfaces. Accurate occlusion of holograms enhances the sense that holograms really exist within the user's physical space.
   * To enable depth-only rendering, update your blend state to set the [RenderTargetWriteMask](/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_render_target_blend_desc1) to zero for all color render targets.
* For modifying the appearance of holograms occluded by real-world surfaces
   * Normally rendered geometry is hidden when it's occluded. This is achieved by setting the depth function in your [depth-stencil state](/windows/win32/api/d3d11/ns-d3d11-d3d11_depth_stencil_desc) to "less than or equal", which causes geometry to be visible only where it's **closer** to the camera than all previously rendered geometry.
   * However, it may be useful to keep certain geometry visible even when it's occluded, and to modify its appearance when occluded as a way of providing visual feedback to the user. For example, this allows the application to show the user the location of an object while making it clear that is behind a real-world surface.
   * To achieve this, render the geometry a second time with a different shader that creates the desired 'occluded' appearance. Before rendering the geometry for the second time, make two changes to your [depth-stencil state](/windows/win32/api/d3d11/ns-d3d11-d3d11_depth_stencil_desc). First, set the depth function to "greater than or equal" so that the geometry will be visible only where it's **further** from the camera than all previously rendered geometry. Second, set the DepthWriteMask to zero, so that the depth buffer won't be modified (the depth buffer should continue to represent the depth of the geometry **closest** to the camera).

[Performance](../develop/advanced-concepts/understanding-performance-for-mixed-reality.md) is an important concern when rendering spatial mapping meshes. Here are some rendering performance techniques specific to rendering spatial mapping meshes:
* Adjust triangle density
   * When requesting spatial surface meshes from your surface observer, request the lowest density of triangle meshes that will suffice for your needs.
   * It may make sense to vary triangle density on a surface by surface basis, depending on the surface's distance from the user, and its relevance to the user experience.
   * Reducing triangle counts will reduce memory usage and vertex processing costs on the GPU, though it won't affect pixel processing costs.
* Use frustum culling
   * Frustum culling skips drawing objects that cannot be seen because they are outside the current display frustum. This reduces both CPU and GPU processing costs.
   * Since culling is performed on a per-mesh basis and spatial surfaces can be large, breaking each spatial surface mesh into smaller chunks may result in more efficient culling (in that fewer offscreen triangles are rendered). There's a tradeoff, however; the more meshes you have, the more draw calls you must make, which can increase CPU costs. In an extreme case, the frustum culling calculations themselves could even have a measurable CPU cost.
* Adjust rendering order
   * Spatial surfaces tend to be large, because they represent the user's entire environment surrounding them. Pixel processing costs on the GPU can be high, especially in cases where there's more than one layer of visible geometry (including both spatial surfaces and other holograms). In this case, the layer nearest to the user will be occluding any layers further away, so any GPU time spent rendering those more distant layers is wasted.
   * To reduce this redundant work on the GPU, it helps to render opaque surfaces in front-to-back order (closer ones first, more distant ones last). By 'opaque' we mean surfaces for which the DepthWriteMask is set to one in your [depth-stencil state](/windows/win32/api/d3d11/ns-d3d11-d3d11_depth_stencil_desc). When the nearest surfaces are rendered, they'll prime the depth buffer so that more distant surfaces are efficiently skipped by the pixel processor on the GPU.

## Mesh Processing

An application may want to do [various operations](spatial-mapping.md#mesh-processing) on spatial surface meshes to suit its needs. The index and vertex data provided with each spatial surface mesh uses the same familiar layout as the [vertex and index buffers](/windows/win32/direct3d9/rendering-from-vertex-and-index-buffers) that are used for rendering triangle meshes in all modern rendering APIs. However, one key fact to be aware of is that spatial mapping triangles have a **front-clockwise winding order**. Each triangle is represented by three vertex indices in the mesh's index buffer and these indices will identify the triangle's vertices in a **clockwise** order, when the triangle is viewed from the **front** side. The front side (or outside) of spatial surface meshes corresponds as you would expect to the front (visible) side of real world surfaces.

Applications should only do mesh simplification if the coarsest triangle density provided by the surface observer is still insufficiently coarse - this work is computationally expensive and already being performed by the runtime to generate the various provided levels of detail.

Because each surface observer can provide multiple unconnected spatial surfaces, some applications may wish to clip these spatial surface meshes against each other, then zipper them together. In general, the clipping step is required, as nearby spatial surface meshes often overlap slightly.

## Raycasting and Collision

In order for a physics API (such as [Havok](https://www.havok.com/)) to provide an application with raycasting and collision functionality for spatial surfaces, the application must provide spatial surface meshes to the physics API. Meshes used for physics often have the following properties:
* They contain only small numbers of triangles. Physics operations are more computationally intensive than rendering operations.
* They're 'water-tight'. Surfaces intended to be solid shouldn't have small holes in them; even holes too small to be visible can cause problems.
* They're converted into convex hulls. Convex hulls have few polygons and are free of holes, and they're much more computationally efficient to process than raw triangle meshes.

When doing raycasts against spatial surfaces, bear in mind that these surfaces are often complex, cluttered shapes full of messy little details - just like your desk! This means that a single raycast is often insufficient to give you enough information about the shape of the surface and the shape of the empty space near it. It's usually a good idea to do many raycasts within a small area and to use the aggregate results to derive a more reliable understanding of the surface. For example, using the average of 10 raycasts to guide hologram placement on a surface will yield a far smoother and less 'jittery' result that using just a single raycast.

However, bear in mind that each raycast can have a high computational cost. Depending on your usage scenario, you should trade off the computational cost of extra raycasts (done every frame) against the computational cost of [mesh processing](spatial-mapping.md#mesh-processing) to smooth and remove holes in spatial surfaces (done when spatial meshes are updated).

## The environment scanning experience

Each application that uses spatial mapping should consider providing a 'scanning experience'; the process through which the application guides the user to scan surfaces that are necessary for the application to function correctly.

![Example of scanning](images/sr-mixedworld-140429-8pm-00068-1000px.png)<br>
*Example of scanning*

The nature of this scanning experience can vary greatly depending upon each application's needs, but two main principles should guide its design.

Firstly, **clear communication with the user is the primary concern**. The user should always be aware of whether the application's requirements are being met. When they aren't being met, it should be immediately clear to the user why this is so and they should be quickly led to take the appropriate action.

Secondly, **applications should attempt to strike a balance between efficiency and reliability**. When it's possible to do so **reliably**, applications should automatically analyze spatial mapping data to save the user time. When it isn't possible to do so reliably, applications should instead enable the user to quickly provide the application with the additional information it requires.

To help design the right scanning experience, consider which of the following possibilities are applicable to your application:

* **No scanning experience**
   * An application may function perfectly without any guided scanning experience; it will learn about surfaces that are observed in the course of natural user movement.
   * For example, an application that lets the user draw on surfaces with holographic spray paint requires knowledge only of the surfaces currently visible to the user.
   * The environment may be scanned already if it's one in which the user has already spent lots of time using the HoloLens.
   * Bear in mind however that the camera used by spatial mapping can only see 3.1 m in front of the user, so spatial mapping won't know about any more distant surfaces unless the user has observed them from a closer distance in the past.
   * So the user understands which surfaces have been scanned, the application should provide visual feedback to this effect, for example casting virtual shadows onto scanned surfaces may help the user place holograms on those surfaces.
   * For this case, the spatial surface observer's bounding volumes should be updated each frame to a body-locked [spatial coordinate system](coordinate-systems.md), so that they follow the user.

* **Find a suitable location**
   * An application may be designed for use in a location with specific requirements.
   * For example, the application may require an empty area around the user so they can safely practice holographic kung-fu.
   * Applications should communicate any specific requirements to the user up-front, and reinforce them with clear visual feedback.
   * In this example, the application should visualize the extent of the required empty area and visually highlight the presence of any undesired objects within this zone.
   * For this case, the spatial surface observer's bounding volumes should use a world-locked [spatial coordinate system](coordinate-systems.md) in the chosen location.

* **Find a suitable configuration of surfaces**
   * An application may require a specific configuration of surfaces, for example two large, flat, opposing walls to create a holographic hall of mirrors.
   * In such cases, the application will need to analyze the surfaces provided by spatial mapping to detect suitable surfaces, and direct the user toward them.
   * The user should have a fallback option if the application's surface analysis isn't reliable. For example, if the application incorrectly identifies a doorway as a flat wall, the user needs a simple way to correct this error.

* **Scan part of the environment**
   * An application may wish to only capture part of the environment, as directed by the user.
   * For example, the application scans part of a room so the user may post a holographic classified ad for furniture they wish to sell.
   * In this case, the application should capture spatial mapping data within the regions observed by the user during their scan.

* **Scan the whole room**
   * An application may require a scan of all of the surfaces in the current room, including those behind the user.
   * For example, a game may put the user in the role of Gulliver, under siege from hundreds of tiny Lilliputians approaching from all directions.
   * In such cases, the application will need to determine how many of the surfaces in the current room have already been scanned, and direct the user's gaze to fill in significant gaps.
   * The key to this process is providing visual feedback that makes it clear to the user which surfaces haven't yet been scanned. The application could, for example,  use [distance-based fog](/windows/win32/direct3d9/fog-formulas) to visually highlight regions that aren't covered by spatial mapping surfaces.

* **Take an initial snapshot of the environment**
   * An application may wish to ignore all changes in the environment after taking an initial 'snapshot'.
   * This may be appropriate to avoid disruption of user-created data that is tightly coupled to the initial state of the environment.
   * In this case, the application should make a copy of the spatial mapping data in its initial state once the scan is complete.
   * Applications should continue receiving updates to spatial mapping data if holograms are still to be correctly occluded by the environment.
   * Continued updates to spatial mapping data also allow visualizing any changes that have occurred, clarifying to the user the differences between prior and present states of the environment.

* **Take user-initiated snapshots of the environment**
   * An application may only wish to respond to environmental changes when instructed by the user.
   * For example, the user could create multiple 3D 'statues' of a friend by capturing their poses at different moments.

* **Allow the user to change the environment**
   * An application may be designed to respond in real time to any changes made in the user's environment.
   * For example, the user drawing a curtain could trigger 'scene change' for a holographic play taking place on the other side.

* **Guide the user to avoid errors in the spatial mapping data**
   * An application may wish to provide guidance to the user while they're scanning their environment.
   * This can help the user to avoid certain kinds of [errors in the spatial mapping data](spatial-mapping.md#what-influences-spatial-mapping-quality), for example by staying away from sunlit windows or mirrors.

One extra detail to be aware of is that the 'range' of spatial mapping data isn't unlimited. While spatial mapping does build a permanent database of large spaces, it only makes that data available to applications in a 'bubble' of limited size around the user. If you start at the beginning of a long corridor and walk far enough away from the start, then eventually the spatial surfaces back at the beginning will disappear. You can mitigate this by caching those surfaces in your application after they've disappeared from the available spatial mapping data.

## Mesh processing

It may help to detect common types of errors in surfaces and to filter, remove or modify the spatial mapping data as appropriate.

Bear in mind that spatial mapping data is intended to be as faithful as possible to real-world surfaces, so any processing you apply risks shifting your surfaces further from the 'truth'.

Here are some examples of different types of mesh processing that you may find useful:

* **Hole filling**
   * If a small object made of a dark material fails to scan, it will leave a hole in the surrounding surface.
   * Holes affect occlusion: holograms can be seen 'through' a hole in a supposedly opaque real-world surface.
   * Holes affect raycasts: if you're using raycasts to help users interact with surfaces, it may be undesirable for these rays to pass through holes. One mitigation is to use a bundle of multiple raycasts covering an appropriately sized region. This will allow you to filter 'outlier' results, so that even if one raycast passes through a small hole, the aggregate result will still be valid. However, this approach comes at a computational cost.
   * Holes affect physics collisions: an object controlled by physics simulation may drop through a hole in the floor and become lost.
   * It's possible to algorithmically fill such holes in the surface mesh. However, you'll need to tune your algorithm so that 'real holes' such as windows and doorways don't get filled in. It can be difficult to reliably differentiate 'real holes' from 'imaginary holes', so you'll need to experiment with different heuristics such as 'size' and 'boundary shape'.

* **Hallucination removal**
   * Reflections, bright lights, and moving objects can leave small lingering 'hallucinations' floating in mid-air.
   * Hallucinations affect occlusion: hallucinations may become visible as dark shapes moving in front of and occluding other holograms.
   * Hallucinations affect raycasts: if you're using raycasts to help users interact with surfaces, these rays could hit a hallucination instead of the surface behind it. As with holes, one mitigation is to use many raycasts instead of a single raycast, but again this will come at a computational cost.
   * Hallucinations affect physics collisions: an object controlled by physics simulation may become stuck against a hallucination and be unable to move through a seemingly clear area of space.
   * It's possible to filter such hallucinations from the surface mesh. However, as with holes, you'll need to tune your algorithm so that real small objects such as lamp-stands and door handles don't get removed.

* **Smoothing**
   * Spatial mapping may return surfaces that appear to be rough or 'noisy' in comparison to their real-world counterparts.
   * Smoothness affects physics collisions: if the floor is rough, a physically simulated golf ball may not roll smoothly across it in a straight line.
   * Smoothness affects rendering: if a surface is visualized directly, rough surface normals can affect its appearance and disrupt a 'clean' look. It's possible to mitigate this by using appropriate lighting and textures in the shader that is used to render the surface.
   * It's possible to smooth out roughness in a surface mesh. However, this may push the surface further away from the corresponding real-world surface. Maintaining a close correspondence is important to produce accurate hologram occlusion, and to enable users to achieve precise and predictable interactions with holographic surfaces.
   * If only a cosmetic change is required, it may be sufficient to smooth vertex normals without changing vertex positions.

* **Plane finding**
   * There are many forms of analysis that an application may wish to perform on the surfaces provided by spatial mapping.
   * One simple example is 'plane finding'; identifying bounded, mostly planar regions of surfaces.
   * Planar regions can be used as holographic work-surfaces, regions where holographic content can be automatically placed by the application.
   * Planar regions can constrain the user interface, to guide users to interact with the surfaces that best suit their needs.
   * Planar regions can be used as in the real world, for holographic counterparts to functional objects such as LCD screens, tables or whiteboards.
   * Planar regions can define play areas, forming the basis of video game levels.
   * Planar regions can aid virtual agents to navigate the real world, by identifying the areas of floor that real people are likely to walk on.

## Prototyping and debugging

### Useful tools

* The [HoloLens emulator](../develop/advanced-concepts/using-the-hololens-emulator.md) can be used to develop applications using spatial mapping without access to a physical HoloLens. It allows you to simulate a live session on a HoloLens in a realistic environment, with all of the data your application would normally consume, including HoloLens motion, spatial coordinate systems, and spatial mapping meshes. This can be used to provide reliable, repeatable input, which can be useful for debugging problems and evaluating changes to your code.
* To reproduce a scenario, capture spatial mapping data over the network from a live HoloLens, then save it to disk and reuse it in later debugging sessions.
* The [Windows device portal 3D view](../develop/advanced-concepts/using-the-windows-device-portal.md#3d-view) provides a way to see all of the spatial surfaces currently available via the spatial mapping system. This provides a basis of comparison for the spatial surfaces inside your application; for example, you can easily tell if any spatial surfaces are missing or are being displayed in the wrong place.

### General prototyping guidance

* Because [errors](spatial-mapping.md#what-influences-spatial-mapping-quality) in the spatial mapping data may strongly affect your user's experience, we recommend that you test your application in a wide variety of environments.
* Don't get trapped in the habit of always testing in the same location, for example at your desk. Make sure to test on various surfaces of different positions, shapes, sizes, and materials.
* Similarly, while synthetic or recorded data can be useful for debugging, don't become too reliant upon the same few test cases. This may delay finding important issues that more varied testing would have caught earlier.
* It's a good idea to perform testing with real (and ideally uncoached) users, because they may not use the HoloLens or your application in exactly the same way that you do. In fact, it may surprise you how divergent people's behavior, knowledge, and assumptions can be!

## Troubleshooting

* In order for the surface meshes to be orientated correctly, each GameObject needs to be active before it's sent to the SurfaceObserver to have its mesh constructed. Otherwise, the meshes will show up in your space but rotated at weird angles.
* The GameObject that runs the script that communicates with the SurfaceObserver needs to be set to the origin. Otherwise, all of GameObjects that you create and send to the SurfaceObserver to have their meshes constructed will have an offset equal to the offset of the Parent Game Object. This can make your meshes show up several meters away, which makes it hard to debug what is going on.

## See also

* [Coordinate systems](coordinate-systems.md)
* [Spatial mapping in DirectX](../develop/native/spatial-mapping-in-directx.md)
* [Spatial mapping in Unity](../develop/unity/spatial-mapping-in-unity.md)
* [Scene Understanding](scene-understanding.md)
* [Room scan visualization](room-scan-visualization.md)
* [Spatial sound design](spatial-sound-design.md)
* [Case study - Looking through holes in your reality](../out-of-scope/case-study-looking-through-holes-in-your-reality.md)

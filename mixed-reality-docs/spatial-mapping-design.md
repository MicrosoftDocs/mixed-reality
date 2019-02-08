---
title: Spatial mapping design
description: Effective use of spatial mapping within HoloLens requires careful consideration of many factors.
author: cre8ivepark
ms.author: dongpark
ms.date: 03/21/2018
ms.topic: article
keywords: Windows Mixed Reality, design, spatial mapping, HoloLens, surface reconstruction, mesh
---



# Spatial mapping design

Effective use of spatial mapping within HoloLens requires careful consideration of many factors.

## Device support

<table>
<tr>
<th>Feature</th><th style="width:150px"> <a href="hololens-hardware-details.md">HoloLens</a></th><th style="width:150px"> <a href="immersive-headset-hardware-details.md">Immersive headsets</a></th>
</tr><tr>
<td> Spatial mapping</td><td style="text-align: center;"> ✔️</td><td style="text-align: center;"></td>
</tr>
</table>

## Why is spatial mapping important?

Spatial mapping makes it possible to place objects on real surfaces. This helps anchor objects in the user's world and takes advantage of real world depth cues. Occluding your holograms based on other holograms and real world objects helps convince the user that these holograms are actually in their space. Holograms floating in space or moving with the user will not feel as real. When possible, place items for comfort.

Visualize surfaces when placing or moving holograms (use a simple projected grid). This will help the user know where they can best place their holograms, and shows the user if the spot they are trying to place the hologram hasn't been mapped yet. You can "billboard items" toward the user if they end up at too much of an angle.

## What influences spatial mapping quality?

In order to provide the best user experience, it is important to understand the factors that affect the quality of spatial mapping data gathered by HoloLens.

Errors in spatial mapping data fall into one of three categories:
* **Holes**: Real-world surfaces are missing from the spatial mapping data.
* **Hallucinations**: Surfaces exist in the spatial mapping data that do not exist in the real world.
* **Bias**: Surfaces in the spatial mapping data are imperfectly aligned with real-world surfaces, either pushed in or pulled out.

Several factors can affect the frequency and severity of these errors:

* **User motion**
   * How the user moves through their environment determines how well the environment will be scanned, so the user may require guidance in order to achieve a good scan.
   * The camera used for scanning provides data within a 70-degree cone, from a minimum of 0.8 meters to a maximum of 3.1 meters distance from the camera. Real-world surfaces will only be scanned within this field of view. Note that these values are subject to change in future versions.
   * If the user never gets within 3.1 meters of an object then it will not be scanned.
   * If the user only views an object from a distance of less than 0.8 meters then it will not be scanned (this avoids scanning the user's hands).
   * If the user never looks upward (which is fairly normal) then the ceiling will likely not be scanned.
   * If a user never looks behind furniture or a wall then the objects occluded by them will not be scanned.
   * Surfaces tend to be scanned at a higher quality when they are viewed head-on rather than at a shallow angle.
   * If the head-tracking system of the HoloLens fails momentarily (which may happen due to rapid user motion, poor lighting, featureless walls or the cameras becoming covered), this can introduce errors in the spatial mapping data. Any such errors will be corrected over time as the user continues to move around and scan their environment.

* **Surface materials**
   * The materials found on real-world surfaces vary greatly. These impact the quality of spatial mapping data because they affect how infrared light is reflected.
   * Dark surfaces may not scan until they come closer to the camera, because they reflect less light.
   * Some surfaces may be so dark that they reflect too little light to be scanned from any distance, so they will introduce hole errors at the location of the surface and sometimes also behind the surface.
   * Particularly shiny surfaces may only scan when viewed head-on, and not when viewed from a shallow angle.
   * Mirrors, because they create illusory reflections of real spaces and surfaces, can cause both hole errors and hallucination errors.

* **Scene motion**
   * Spatial mapping adapts rapidly to changes in the environment, such as moving people or opening and closing doors.
   * However, spatial mapping can only adapt to changes in an area when that area is clearly visible to the camera that is used for scanning.
   * Because of this, it is possible for this adaptation to lag behind reality, which can cause hole or hallucination errors.
   * As an example, a user scans a friend and then turns around while the friend leaves the room. A 'ghost' representation of the friend (a hallucination error) will persist in the spatial mapping data, until the user turns back around and re-scans the space where the friend was standing.

* **Lighting interference**
   * Ambient infrared light in the scene may interfere with scanning, for example strong sunlight coming through a window.
   * Particularly shiny surfaces may interfere with the scanning of nearby surfaces, the light bouncing off them causing bias errors.
   * Shiny surfaces reflecting light directly back into the camera may interfere with nearby space, either by causing floating mid-air hallucinations or by delaying adaptation to scene motion.
   * Two HoloLens devices in the same room should not interfere with one another, but the presence of more than five HoloLens devices may cause interference.

It may be possible to avoid or correct for some of these errors. However, you should design your application so that the user is able to achieve their goals even in the presence of errors in the spatial mapping data.

## The environment scanning experience

HoloLens learns about the surfaces in its environment as the user looks at them. Over time, the HoloLens builds up a scan of all parts of the environment that have been observed. It also updates the scan as changes in the environment are observed. This scan will automatically persist between app launches.

Each application that uses spatial mapping should consider providing a 'scanning experience'; the process through which the application guides the user to scan surfaces that are necessary for the application to function correctly.

![Example of scanning](images/sr-mixedworld-140429-8pm-00068-1000px.png)<br>
*Example of scanning*

The nature of this scanning experience can vary greatly depending upon each application's needs, but two main principles should guide its design.

Firstly, **clear communication with the user is the primary concern**. The user should always be aware of whether the application's requirements are being met. When they are not being met, it should be immediately clear to the user why this is so and they should be quickly led to take the appropriate action.

Secondly, **applications should attempt to strike a balance between efficiency and reliability**. When it is possible to do so **reliably**, applications should automatically analyze spatial mapping data to save the user time. When it is not possible to do so reliably, applications should instead enable the user to quickly provide the application with the additional information it requires.

To help design the right scanning experience, consider which of the following possibilities are applicable to your application:

* **No scanning experience**
   * An application may function perfectly without any guided scanning experience; it will learn about surfaces that are observed in the course of natural user movement.
   * For example an application that lets the user draw on surfaces with holographic spraypaint requires knowledge only of the surfaces currently visible to the user.
   * The environment may be completely scanned already if it is one in which the user has already spent a lot of time using the HoloLens.
   * Bear in mind however that the camera used by spatial mapping can only see 3.1m in front of the user, so spatial mapping will not know about any more distant surfaces unless the user has observed them from a closer distance in the past.
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
   * In such cases the application will need to analyze the surfaces provided by spatial mapping to detect suitable surfaces, and direct the user toward them.
   * The user should have a fallback option if the application's surface analysis is not completely reliable. For example, if the application incorrectly identifies a doorway as a flat wall, the user needs a simple way to correct this error.

* **Scan part of the environment**
   * An application may wish to only capture part of the environment, as directed by the user.
   * For example, the application scans part of a room so the user may post a holographic classified ad for furniture they wish to sell.
   * In this case, the application should capture spatial mapping data within the regions observed by the user during their scan.

* **Scan the whole room**
   * An application may require a scan of all of the surfaces in the current room, including those behind the user.
   * For example, a game may put the user in the role of Gulliver, under siege from hundreds of tiny Lilliputians approaching from all directions.
   * In such cases, the application will need to determine how many of the surfaces in the current room have already been scanned, and direct the user's gaze to fill in significant gaps.
   * The key to this process is providing visual feedback that makes it clear to the user which surfaces have not yet been scanned. The application could for example use [distance-based fog](https://msdn.microsoft.com/library/windows/desktop/bb173401%28v=vs.85%29.aspx) to visually highlight regions that are not covered by spatial mapping surfaces.

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
   * An application may be designed to respond in real-time to any changes made in the user's environment.
   * For example, the user drawing a curtain could trigger 'scene change' for a holographic play taking place on the other side.

* **Guide the user to avoid errors in the spatial mapping data**
   * An application may wish to provide guidance to the user while they are scanning their environment.
   * This can help the user to avoid certain kinds of [errors in the spatial mapping data](spatial-mapping-design.md#what-influences-spatial-mapping-quality), for example by staying away from sunlit windows or mirrors.

One additional detail to be aware of is that the 'range' of spatial mapping data is not unlimited. Whilst spatial mapping does build a permanent database of large spaces, it only makes that data available to applications in a 'bubble' of limited size around the user. Thus if you start at the beginning of a long corridor and walk far enough away from the start, then eventually the spatial surfaces back at the beginning will disappear. You can of course mitigate this by caching those surfaces in your application after they have disappeared from the available spatial mapping data.

## Mesh processing

It may help to detect common types of errors in surfaces and to filter, remove or modify the spatial mapping data as appropriate.

Bear in mind that spatial mapping data is intended to be as faithful as possible to real-world surfaces, so any processing you apply risks shifting your surfaces further from the 'truth'.

Here are some examples of different types of mesh processing that you may find useful:

* **Hole filling**
   * If a small object made of a dark material fails to scan, it will leave a hole in the surrounding surface.
   * Holes affect occlusion: holograms can be seen 'through' a hole in a supposedly opaque real-world surface.
   * Holes affect raycasts: if you are using raycasts to help users interact with surfaces, it may be undesirable for these rays to pass through holes. One mitigation is to use a bundle of multiple raycasts covering an appropriately sized region. This will allow you to filter 'outlier' results, so that even if one raycast passes through a small hole, the aggregate result will still be valid. However, be aware that this approach comes at a computational cost.
   * Holes affect physics collisions: an object controlled by physics simulation may drop through a hole in the floor and become lost.
   * It is possible to algorithmically fill such holes in the surface mesh. However, you will need to tune your algorithm so that 'real holes' such as windows and doorways do not get filled in. It can be difficult to reliably differentiate 'real holes' from 'imaginary holes', so you will need to experiment with different heuristics such as 'size' and 'boundary shape'.

* **Hallucination removal**
   * Reflections, bright lights and moving objects can leave small lingering 'hallucinations' floating in mid-air.
   * Hallucinations affect occlusion: hallucinations may become visible as dark shapes moving in front of and occluding other holograms.
   * Hallucinations affect raycasts: if you are using raycasts to help users interact with surfaces, these rays could hit a hallucination instead of the surface behind it. As with holes, one mitigation is to use many raycasts instead of a single raycast, but again this will come at a computational cost.
   * Hallucinations affect physics collisions: an object controlled by physics simulation may become stuck against a hallucination and be unable to move through a seemingly clear area of space.
   * It is possible to filter such hallucinations from the surface mesh. However, as with holes, you will need to tune your algorithm so that real small objects such as lamp-stands and door handles do not get removed.

* **Smoothing**
   * Spatial mapping may return surfaces that appear to be rough or 'noisy' in comparison to their real-world counterparts.
   * Smoothness affects physics collisions: if the floor is rough, a physically simulated golf ball may not roll smoothly across it in a straight line.
   * Smoothness affects rendering: if a surface is visualized directly, rough surface normals can affect its appearance and disrupt a 'clean' look. It is possible to mitigate this by using appropriate lighting and textures in the shader that is used to render the surface.
   * It is possible to smooth out roughness in a surface mesh. However, this may push the surface further away from the corresponding real-world surface. Maintaining a close correspondence is important to produce accurate hologram occlusion, and to enable users to achieve precise and predictable interactions with holographic surfaces.
   * If only a cosmetic change is required, it may be sufficient to smooth vertex normals without changing vertex positions.

* **Plane finding**
   * There are many forms of analysis that an application may wish to perform on the surfaces provided by spatial mapping.
   * One simple example is 'plane finding'; identifying bounded, mostly-planar regions of surfaces.
   * Planar regions can be used as holographic work-surfaces, regions where holographic content can be automatically placed by the application.
   * Planar regions can constrain the user interface, to guide users to interact with the surfaces that best suit their needs.
   * Planar regions can be used as in the real world, for holographic counterparts to functional objects such as LCD screens, tables or whiteboards.
   * Planar regions can define play areas, forming the basis of videogame levels.
   * Planar regions can aid virtual agents to navigate the real world, by identifying the areas of floor that real people are likely to walk on.

## Prototyping and debugging

### Useful tools
* The [HoloLens emulator](using-the-hololens-emulator.md) can be used to develop applications using spatial mapping without access to a physical HoloLens. It allows you to simulate a live session on a HoloLens in a realistic environment, with all of the data your application would normally consume, including HoloLens motion, spatial coordinate systems and spatial mapping meshes. This can be used to provide reliable, repeatable input, which can be useful for debugging problems and evaluating changes to your code.
* To reproduce a scenarios, capture spatial mapping data over the network from a live HoloLens, then save it to disk and reuse it in subsequent debugging sessions.
* The [Windows device portal 3D view](using-the-windows-device-portal.md#3d-view) provides a way to see all of the spatial surfaces currently available via the spatial mapping system. This provides a basis of comparison for the spatial surfaces inside your application; for example you can easily tell if any spatial surfaces are missing or are being displayed in the wrong place.

### General prototyping guidance
* Because [errors](spatial-mapping-design.md#what-influences-spatial-mapping-quality) in the spatial mapping data may strongly affect your user's experience, we recommend that you test your application in a wide variety of environments.
* Don't get trapped in the habit of always testing in the same location, for example at your desk. Make sure to test on various surfaces of different positions, shapes, sizes and materials.
* Similarly, while synthetic or recorded data can be useful for debugging, don't become too reliant upon the same few test cases. This may delay finding important issues that more varied testing would have caught earlier.
* It is a good idea to perform testing with real (and ideally un-coached) users, because they may not use the HoloLens or your application in exactly the same way that you do. In fact, it may surprise you how divergent people's behavior, knowledge and assumptions can be!

## See also
* [Room scan visualization](room-scan-visualization.md)
* [Spatial sound design](spatial-sound-design.md)
* [Persistence in Unity](persistence-in-unity.md)

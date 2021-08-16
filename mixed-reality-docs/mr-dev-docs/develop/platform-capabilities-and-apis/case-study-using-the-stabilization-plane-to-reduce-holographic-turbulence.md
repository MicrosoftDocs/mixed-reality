---
title: Using the stabilization plane to reduce holographic turbulence
description: Explore how our development team used the stabilization plane to reduce holographic turbulence in a mixed reality application.
author: bstrukus
ms.author: v-vtieto
ms.date: 08/16/21
ms.topic: article
keywords: Windows Mixed Reality, holograms, stabilization, case study, mixed reality headset, windows mixed reality headset, virtual reality headset, stability, stabilization plane
---

# Using the stabilization plane to reduce holographic turbulence

Working with holograms is often tricky. Moving around a space and looking at holograms from all different angles provides a level of immersion that isn't available on a normal computer screen. Keeping these holograms in place and looking realistic is a technical feat accomplished by both the Microsoft HoloLens hardware and the intelligent design of holographic apps.

## The tech

To make holograms appear as though they're actually sharing the space with you, they should render properly without color separation. This is achieved, in part, by technology built-in to the HoloLens hardware, which keeps holograms anchored on what we call a [stabilization plane](hologram-stability.md#reprojection).

A plane is defined by a point and a normal. Since we always want the plane to face the camera, we're concerned with setting the plane's point. We can tell HoloLens what point to focus its processing on to keep everything anchored and stable. However, setting this focus point is app-specific and can make or break your app depending on the content.

Holograms work best when the stabilization plane is properly applied, but what that actually means depends on the type of application you’re creating. Let’s take a look at how some of the apps currently available for HoloLens tackle this problem.

## Behind the scenes

While developing the following apps, we noticed that when we didn't use the plane, objects would sway when our head moved. We'd also see color separation with quick head or hologram movements. We ended up learning through trial and error how to best use the stabilization plane and design our apps around the problems that it can't fix.

### Galaxy Explorer: Stationary content, 3D interactivity

[Galaxy Explorer](../unity/galaxy-explorer.md) has two major elements in the scene: The main view of the celestial content and the small UI toolbar that follows your gaze. For the stabilization logic, we look at what your current gaze vector intersects with in each frame to determine if it hits anything on a specified collision layer. In this case, the layers we’re interested in are the planets, so if your gaze falls on a planet, the stabilization plane is placed there. If none of the objects in the target collision layer are hit, the app uses a secondary “plan B” layer. If nothing is being gazed at, the stabilization plane is kept at the same distance as it was when gazing at the content. The UI tools are left out as a plane target as we found the jump between near and far reduced the stability of the overall scene.

The design of Galaxy Explorer lends itself well to keeping things stable and reducing the effect of color separation. The user is encouraged to walk around and orbit the content rather than move along it from side to side, and the planets are orbiting slowly enough that the color separation isn’t noticeable. Additionally, a constant 60 FPS is maintained, which goes a long way in preventing color separation from happening.

To check this out yourself, look for a file called LSRPlaneModifier.cs in the [Galaxy Explorer code on GitHub](https://github.com/Microsoft/GalaxyExplorer/tree/master/Assets/Scripts/Utilities).

### HoloStudio: Stationary content with a UI focus

In HoloStudio, you spend most of your time looking at the same model you’re working on. Your gaze doesn’t move a significant amount, except for when you select a new tool or want to navigate the UI, so we can keep the plane setting logic simple. When looking at the UI, the plane is set to whatever UI element your gaze snaps to. When looking at the model, the plane is a set distance away, corresponding with the default distance between you and the model.

![The stabilization plane visualized in HoloStudio as the user gazes on the Home button](images/holostudio-stabilization-plane-500px.png)

### HoloTour and 3D Viewer: Stationary content with animation and movies

In HoloTour and 3D Viewer, you’re looking at a solitary animated object or movie with 3D effects added on top of it. The stabilization in these apps is set to whatever you’re currently viewing.

HoloTour also prevents you from straying too far from your virtual world by having it move with you instead of staying in a fixed location. This ensures that you won’t get far enough away from other holograms for stability issues to creep in.

![In this example from HoloTour, the stabilization plane would be set to this movie of Hadrian’s Pantheon.](images/holotour-stabilization-plane-500px.jpg)

### RoboRaid: Dynamic content and environmental interactions

Setting the stabilization plane in RoboRaid is surprisingly simple, despite being the app that requires the most sudden movement. The plane is geared towards sticking to the walls or the surrounding objects and will float at a fixed distance in front of you when you’re far enough away.

RoboRaid was designed with the stabilization plane in mind. The reticle, which moves the most since it’s head-locked, circumvents this by using only red and blue, which minimizes any color bleeding. It also contains a small bit of depth between the pieces, minimizing any color bleed that would occur by masking it with an already expected parallax effect. The robots don’t move quickly and only travel short distances in regular intervals. They tend to stay around 2 meters in front of you, where the stabilization is set by default.

### Fragments and Young Conker: Dynamic content with environmental interaction

Written by Asobo Studio in C++, Fragments and Young Conker take a different approach to setting the stabilization plane. Points of interest (POI) are defined in code and ordered by priority. POIs are in-game content, such as the Conker model in Young Conker, menus, the aiming reticle, and logos. The POIs are intersected by the user’s gaze and the plane is set to the center of the object with the highest priority. If no intersection occurs, the plane is set to the default distance.

Fragments and Young Conker also design around you straying too far from the holograms by pausing the app if you move outside of what’s been previously scanned as your play space. As such, they keep you within the boundaries that are found to provide the most stable experience.

[Test the stabilization plane in Unity](../unity/test-the-stabilization-plane.md)

## About the author

<table style="border-collapse:collapse">
<tr>
<td style="border-style: none" width="60px"><img alt="Picture of Ben Strukus" width="60" height="60" src="images/genericusertile.jpg"></td>
<td style="border-style: none"><b>Ben Strukus</b><br>Software Engineer @Microsoft</td>
</tr>
</table>

## See also
* [MR Basics 100: Getting started with Unity](../unity/tutorials/holograms-100.md)
* [Focus point in Unity](../unity/focus-point-in-unity.md)
* [Hologram stability](hologram-stability.md)

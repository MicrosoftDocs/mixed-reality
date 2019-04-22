---
title: Environment setup guidelines
description: HoloLens devices know how to place stable and accurate holograms by *tracking* users in a space. Many different environmental factors are fused together to enable tracking, but as a Mixed Reality developer, there are several factors you can keep in mind to tune a space for better tracking.
author:  dorreneb
ms.author: dobrown
ms.date: 04/22/2019
ms.topic: article
keywords: tracking, holograms, visuals, quality, ipd
---

# Guidelines for HoloLens scenario environments

HoloLens devices know how to place stable and accurate holograms by *tracking* users in a space. Without proper tracking, the device does not understand the environment or the user within it - so holograms can appear in the wrong places, not appear in the same spot every time, or not appear at all.

Tracking performance is heavily influenced by the environment the user is in, and tuning an environment to induce stable and consistent tracking is an art rather than a science. Many different environmental factors are fused together to enable tracking, but as a Mixed Reality developer, there are several factors you can keep in mind to tune a space for better tracking.
 
## Lighting
Windows Mixed Reality uses visual light to track the user's location. When an environment is too bright, the cameras can get saturated, and nothing is seen. If the environment is too dark, the cameras cannot pick up enough information, and nothing is seen. Lighting should be even and sufficiently bright that a human can see without effort, but not so bright that the light is painful to look at.

Areas where there are points of bright light in an overall dim area are also problematic, as the camera has to adjust when moving in and out of bright spaces. This can cause the device to "get lost" and think that the change in light equates to a change in location. Stable light levels in an area will lead to better tracking.

Any outdoor lighting can also cause instability in the tracker, as the sun may vary considerably over time. For example, tracking in the same space in the summer vs. winter can produce drastically different results, as the secondhand light outside may be higher at different times of year.

If you have a luxmeter, a steady 500-1000 lux is a good place to start. 

### Types of lighting
Different types of light in a space can also influence tracking. Lightbulbs pulse with the AC electricity running through it - if the AC frequency is 50Hz, then the light pulses at 50Hz. For a human, this pulsing is not noticed. However, HoloLens' 30fps camera sees these changes - some frames will be well-lit, some will be poorly lit, and some will be over-exposed as the camera tries to compensate for light pulses.

In the USA, electricity frequency standard is 60Hz, so lightbulb pulses are harmonized with HoloLens' framerate - 60Hz pulses align with Hololens' 30 FPS framerate. However, many countries have an AC frequency standard of 50Hz, which means some Hololens frames will be taken during pulses, and others will not. In particular, fluorescent lighting in Europe has been known to cause issues. 

There are a few things you can try to resolve flickering issues. Temperature, bulb age, and warm-up cycles are common causes of fluorescent flickering and replacing bulbs may help. Tightening bulbs and making sure current draws are constant can also help. 

## Items in a space
HoloLens uses unique environmental landmarks, also known as *features*, to locate itself in a space. 

A device can almost never track in a feature-poor area, as the device has no way of knowing where in space it is. Adding features to the walls of a space is usually a good way to improve tracking. Posters, symbols taped to a wall, plants, unique objects, or other similar items all help. A messy desk is a good example of an environment that leads to good tracking - there are a lot of different features in a single area. 

Additionally, use unique features in the same space. The same poster repeated multiple times over a wall, for example, will cause device confusion as the HoloLens won't know which of the repetitive posters it is looking at. One common way of adding unique features is to use lines of masking tape to create unique, nonrepetitve patterns along the walls and floor of a space. 

A good question to ask yourself is - if you saw just a small amount of the scene, could you uniquely locate yourself in the space? If not, it's likely the device will have problems tracking as well.

### Wormholes
If you have two areas or regions that look the same, the tracker may think they are the same. This results in the device tricking itself into thinking it is somewhere else. We call these types of repetitive areas *wormholes*. 

To prevent wormholes, try to prevent identical areas in the same space. Identical areas can sometimes include factory stations, windows on a building, server racks, or work stations. Labelling areas or adding unique features to each similar-looking areas can help mitigate wormholes.
 
## Temporal stability of a space
If your environment is constantly shifting and changing, the device has no stable features to locate against. 

The more moving objects that are in a space, including people, the easier it is to lose tracking. Moving conveyor belts, items in different states of construction, and lots of people in a space have all been known to cause tracking issues.
 
## Proximity of the user to items in the space
Similarly to how humans cannot focus well on objects close to the eyes, HoloLens struggles when objects are close to it's cameras. If an object is too close to be seen with both cameras, or if an object is blocking one camera, the device will have far more issues with tracking against the object. 

The cameras can see no closer than 15cm from an object.
 
## Surfaces in a space
Strongly reflective surfaces will likely look different depending on the angle, which affects tracking. Think of a brand new car - when you move around it, light reflects and you see different objects in the surface as you move. To the tracker, the different objects reflected in the surface represent a changing environment, and the device loses tracking.

Less shiny objects are easier to track against.

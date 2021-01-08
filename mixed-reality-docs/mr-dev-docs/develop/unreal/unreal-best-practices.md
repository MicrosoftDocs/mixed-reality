---
title: General best practices
description: 
author: hferrone
ms.author: 
ms.date: 01/08/2021
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, editor extensions, Unreal editor, UE4, HoloLens, HoloLens 2, mixed reality, development, documentation, guides, features, mixed reality headset, windows mixed reality headset, virtual reality headset, porting, upgrading
---

# General best practices

The following are some general best practices that you should follow when creating an Unreal Engine project for Mixed Reality.

## Constructors

Do you need the equivalent of a "constructor" in blueprints? Use a [construction script](https://docs.unrealengine.com/ProgrammingAndScripting/Blueprints/UserGuide/UserConstructionScript/index.html). The primary advantage this has over using "BeginPlay" event is that it is run in the "editor" as well, and hence, most of the time the values can be cached right at the start, or even at compile time.

> [!NOTE]
> You can find more supporting information for Construction scripts in our [editor extensions overview](unreal-editor-extensions.md#constructor-scripts).

## 3D buttons and textures

Do you need to create "3D buttons" but are worried about performance? Not everything has to be made from meshes to be perceived as 3D. Use Paper2D with carefully crafted textures for a 3D look. This works really well for buttons that "seem" 3D, but are just photoshopped images on a quad. Generally, a fancy version of these is called a [sprite](https://docs.unrealengine.com/AnimatingObjects/Paper2D/Sprites/index.html).

## Variants

Are you creating a scene that contains multiple "variations" or "configurations" of objects, such as changing materials, or meshes at runtime? Avoid coding blueprints from scratch to do this. Unreal has a [standard approach based on variants](https://docs.unrealengine.com/Basics/Levels/Variants/index.html).
## Animation

Do you need to create "interactable animations" a lot? E.g: On tap, an item swings away, or animates in? The [Spline Component](https://docs.unrealengine.com/API/Runtime/Engine/Components/USplineComponent/index.html) (not the Spline "Mesh" Component) and [Timeline node](https://docs.unrealengine.com/ProgrammingAndScripting/Blueprints/UserGuide/Timelines/index.html) are probably what you are looking for. You can find a comprehensive [video tutorial here](https://www.youtube.com/watch?v=bWXI91FdMtk&ab_channel=DoubleCrossGames).

## Communications

Do you find yourself finding it difficult to dynamically "find" other objects? Too much communication required between multiple actors or blueprints? You are probably overlooking the [Level Blueprint](https://docs.unrealengine.com/ProgrammingAndScripting/Blueprints/UserGuide/Types/LevelBlueprint/index.html). Remember, UE4 isnt like Unity. Not everything has to be inside a component. Level Blueprints are a perfectly valid, in fact often recommended, way of simplifying the communication between multiple actors. Another tip: Object references can be "cached" at startup in the Level Blueprint's OnBeginPlay

## Global state

Often, you need to store level-specific state, such as score, level data, player-specific information, or anything else that doesn't quite belong to a particular object. Don't overlook the [GameMode](https://docs.unrealengine.com/en-US/InteractiveExperiences/Framework/GameMode/index.html). Most people forget that it exists, but the GameMode can be created per level, and contain data specific to each level.

## Optimizing Blueprints

If you are finding your blueprints to be too slow, before resorting to rewriting the code in c++, did you know that Unreal can "nativize" your blueprints to c++ for you? Try using the automatic [nativizationbefore](https://docs.unrealengine.com/ProgrammingAndScripting/Blueprints/TechnicalGuide/NativizingBlueprints/index.html) going for your own.

![Blueprints setting with blueprint nativization method with inclusive highlighted](images/unreal-general-practices-img-01.jpg)

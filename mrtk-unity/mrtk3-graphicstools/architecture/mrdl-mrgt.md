---
title: Connection between the Mixed Reality Design Language to Graphics Tools
description: How MRDL and MRTK integrate. 
author: Cameron-Micka
ms.author: thmicka
ms.date: 05/31/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Graphics Tools, MRGT, MR Graphics Tools
---

# Connection between the Mixed Reality Design Language (MRDL) to Graphics Tools

The MRDL is a design language similar to [Fluent](https://www.microsoft.com/design/fluent/#/), but has considerations made for Mixed Reality. Over the years MRDL has evolved with each incarnation of HoloLens and within products such as the [Mesh app](https://techcommunity.microsoft.com/t5/mixed-reality-blog/mixed-reality-design-language-and-microsoft-mesh-app/ba-p/2746980).

Graphics Tools is built to better share the tools and processes used to build MRDL user interface components. The Graphics Tools package is designed to bubble up MRDL concepts to all Mixed Reality apps via shaders, textures, materials, models, scripts, and tooling.

## Where can MRDL components be found?

If you are looking for complete MRDL designed components it is best to look at higher level UX packages within the MRTK. But, if you are interested in the shaders or assets that power the MRDL you can look in the following locations.

### Shaders

The first option of every material inspector contains a shader dropdown. All Graphics Tools shaders are within the `Graphics Tools` namespace. The majority of bespoke MRDL shaders are in the `Graphics Tools/Canvas` and  `Graphics Tools/Non-Canvas` directories. As the name suggests shaders in the `Canvas` directory should be used with UnityUI canvases and shaders in the `Non-Canvas` directory should be used within normal Unity contexts.

> [!TIP]
> If you peer into the source code of these shaders you might notice they are more difficult to read than even a traditional shader. This is because they are generated from a tool.

### Materials

Within the `Runtime/Materials` folder you will find a material that represents each shader above. These materials are used for common user interface components. Some materials references textures that are required for certain effects, like iridescence.

### Models

A handful of models live in the `Runtime/Models` folder. These models are used for non-canvas materials.

> [!TIP]
> Most canvas models are generated programmatically in code.

## When should I use one MRDL component versus another?

This question is common because Graphics Tools supports two user interface creation methods, UnityUI and traditional game objects. It is recomended to look at the sample assets first, but the below list can be used as backup reference.

### Back plate

Provides an opaque backing for user interface elements to be placed on.

|                    | Canvas                          | Non-Canvas                          |
|--------------------|---------------------------------|-------------------------------------|
| Shader             | Graphics Tools/Canvas/Backplate | Graphics Tools/Non-Canvas/Backplate |
| Material           | CanvasBackplate                 | Non-CanvasBackplate                 |
| Script(s)/Model(s) | CanvasElementRoundedRect.cs     | Backplate8                          |

### Front plate

Displays a translucent surface above the back plate to show volume and proximity lighting.

|                    | Canvas                           | Non-Canvas                           |
|--------------------|----------------------------------|--------------------------------------|
| Shader             | Graphics Tools/Canvas/Frontplate | Graphics Tools/Non-Canvas/Frontplate |
| Material           | CanvasFrontplate                 | Non-CanvasFrontplate                 |
| Script(s)/Model(s) | RawImage.cs/ScaleMeshEffect.cs   | Frontplate8                          |

### Glow

A small highlight when a affordance is interacted with.

|                    | Canvas                         | Non-Canvas                     |
|--------------------|--------------------------------|--------------------------------|
| Shader             | Graphics Tools/Canvas/Glow     | Graphics Tools/Non-Canvas/Glow |
| Material           | CanvasFrontplate               | Non-CanvasFrontplate           |
| Script(s)/Model(s) | RawImage.cs/ScaleMeshEffect.cs | Quad (Unity Default)           |

### Quad glow

A larger glow when an affordance is indirectly interacted with.

|                    | Canvas                          | Non-Canvas                          |
|--------------------|---------------------------------|-------------------------------------|
| Shader             | Graphics Tools/Canvas/Quad Glow | Graphics Tools/Non-Canvas/Quad Glow |
| Material           | CanvasQuadGlow                  | Non-CanvasQuadGlow                  |
| Script(s)/Model(s) | RawImage.cs/ScaleMeshEffect.cs  | Quad (Unity Default)                |

### Beveled rect

Similar to the back plate, but provides a rect with beveled edges.

|                    | Canvas                        | Non-Canvas                                     |
|--------------------|-------------------------------|------------------------------------------------|
| Shader             | Graphics Tools/Canvas/Beveled | Graphics Tools/Non-Canvas/Beveled              |
| Material           | BevCanvasBeveled              | Non-CanvasBeveled                              |
| Script(s)/Model(s) | CanvasElementBeveledRect.cs   | Beveled4x4, Beveled6x6, Beveled8x4, Beveled8x8 |

## See also

* [Architecture overview](overview.md)

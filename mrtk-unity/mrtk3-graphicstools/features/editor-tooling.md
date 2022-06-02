---
title: Editor Tooling
description: Learn about the tools availbe to developers in the Unity editor.
author: Cameron-Micka
ms.author: thmicka
ms.date: 06/01/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Graphics Tools, MRGT, MR Graphics Tools, Standard Shader, Mesh Outlines
---

# Editor tooling

TODO

## Menu items

TODO

## Mip map debug

The mip map debug feature included with the built-in renderer pipeline's scene view debug draw modes [does not exist](https://github.com/Unity-Technologies/Graphics/pull/4089) in the Universal Render Pipeline (URP). This is a useful feature to have when trying to reduce texture sizes.

In Graphics Tools a similar tool was reintroduced for the URP. The tool can be toggled on via the `Window > Graphics Tools > Draw Modes > Mipmaps - Enable` and off via the `Window > Graphics Tools > Draw Modes > Mipmaps - Disable` menu items. When enabled the scene view will be tinted based on texel to pixel ratio.

| Color          | Meaning                                                                                   |
|----------------|-------------------------------------------------------------------------------------------|
| Original Color | It’s a perfect match (1:1 texels to pixels ratio at the current distance and resolution). |
| Red            | Indicates that the texture is larger than necessary.                                      |
| Blue           | Indicates that the texture could be larger.                                               |

> [!NOTE]
> The ideal texture sizes depend on the resolution at which your application will run and how close the camera can get to a surface.

For example, texel density is too high on the left cube and a bit too low on the right cube at this viewing distance:

![MipMapDebug](images/EditorTooling/MipMapDebug.jpg)

## See also

* [Measure Tool](measure-tooling.md)
* [UnityUI Support](measure-tooling.md)
* [Accessibility Utilities](accesibility-utilities.md)

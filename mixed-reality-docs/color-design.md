---
title: Color design
description: 
author: 
ms.author: randyw
ms.date: 2/28/2018
ms.topic: article
keywords: 
---



# Color design

HoloLens provides a new medium for rendering 3D content, where color's functional and aesthetic roles must be reconsidered--especially in relation to the user's real surroundings.

The HoloLens device uses a color-sequential, see-through RGB display to render holograms that look stable and grounded in the real world. In order to take full advantage of this novel technology, one should be aware of the available gamut, the additive nature of the display, and the possibility of color separation for moving holograms.

## Basics of color theory for holograms
* Because holograms are created by adding light to the light from the real world, dark colors appear transparent, and black will appear as no different from the real world.
* On the other hand, white appears very bright, and should be used sparingly. In general, many designers have found that a white value around R 235 G 235 B 235 is enough, with any large areas of white brighter than that much less user-friendly.
* The basics of standard color theory apply even more so in HoloLens than in traditional media. Cool colors feel like they recede and warm colors jump to the foreground.
* Because targeting in HoloLens is done by the gaze vector, many designers desire to focus the user's attention on the center of the field of view. A great technique for this is to incorporate a "vignette" effect, which darkens the hologram's material at some radius from the user's gaze vector. Even if the gaze vector is at an oblique angle to the hologram (for example, when a user views world-locked content from a glancing angle), vignetting can help focus the user's attention and mitigate awareness of the display

## Additive display

The HoloLens uses a see-through display to superimpose holograms over the real world. In doing so, the light used to render the holograms is overlaid on the light from the real world. Hence the term, "additive display." As a result, the apparent color of a hologram can be affected by the real-world surface on which it is rendered. Typically holograms are rendered brightly enough so that they maintain color uniformity, regardless of the background. However, designers should test their textures and palette choices against real-world examples to ensure that their users will perceive what was intended.

It should also be noted that true blacks do not exist in additive-light displays. Areas that would be black on a traditional display are instead rendered as transparent. Depending on the neighboring colors and textures and the real-world background, these "black" regions can still give the impression of a dark region, but strictly speaking the HoloLens display cannot remove light from a scene.

## Gamut considerations

Color gamut refers to the range of colors that can be represented by any device or system. While this is not a new consideration for digital media it is something content creators have to be aware of when constructing media for HoloLens. Typically CG content has to be aware of one of the three main gamuts; sRGB, HDTV Rec 709 and Adobe RGB. Each is slightly differ in the breadth of possible colors based on their shared white point and different primaries for R, G and B. HoloLens benefits from a "wide gamut," conceptually very similar to that of Adobe RGB, where the possible colors have been increased from traditional gamuts like sRGB. As a result "memory colors" can exhibit different qualities and representation in the device so content creators should maintain a higher level of awareness when generating content.

## Color separation

[Color separation](hologram-stability.md#color-separation) (or "color breakup" or "color fringing") can occur with moving holograms, including cursors, if the user is tracking the object with their eyes.

## Color uniformity

Light is additive in the HoloLens displays. As such it is best to avoid large regions of bright, solid color.

## Aliasing

Be considerate of aliasing the edges where holograms meet the real world. Using textures with high detail can aggravate this transition. Consider fading the very edge of your hologram.

## Alpha channel

You must clear your alpha channel to fully transparent for any parts where you are not rendering a hologram. Leaving the alpha undefined leads to visual artifacts when taking images/videos or streaming your holograms to another device.

## See also
* [Color separation](hologram-stability.md#color-separation)
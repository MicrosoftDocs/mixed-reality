---
title: Text in Unity
description: To display text in Unity, there are two types of text components you can use—UI Text and 3D Text Mesh.
author: cre8ivepark
ms.author: dongpark
ms.date: 06/03/2019
ms.topic: article
keywords: Windows Mixed Reality, design, Controls, font, typography, ui, ux, mixed reality headset, windows mixed reality headset, virtual reality headset, MRTK, Mixed Reality Toolkit
---


# Text in Unity

Text is one of the most important components in holographic apps. To display text in Unity, there are three types of text components you can use—UI Text, 3D Text Mesh, and Text Mesh Pro. By default, UI Text and 3D Text Mesh appear blurry and are too large. Changing a few variables results in sharper, higher-quality text with a manageable size in HoloLens. You can achieve better rendering quality by applying a scaling factor to get proper dimensions when using the UI Text and 3D Text Mesh components.

![How to get sharp and beautiful text](images/hug-text-02-640px.png)<br>
*Blurry default text in Unity*

## Working with Unity's 3D Text (Text Mesh) and UI Text

Unity assumes all new elements added to a scene are one Unity Unit in size, or 100% transform scale. One Unity unit translates to about 1 meter on HoloLens. For fonts, the bounding box for a 3D TextMesh comes in by default at about 1 meter in height.

![Working with Fonts in Unity](images/640px-hug-text-03.png)<br>
*Default Unity 3D Text (Text Mesh) occupies one Unity Unit, which is 1 meter*

<br>

Most visual designers use points to define font sizes in the real world. There are about 2835 (2,834.645666399962) points in 1 meter. Based on the point system conversion to 1 meter and Unity's default Text Mesh font size of 13, the simple math of 13 divided by 2835 equals 0.0046 (0.004586111116 to be exact) which provides a good standard scale to start with (some may wish to round to 0.005). Scaling the text object or container to these values will not only allow for the 1:1 conversion of font sizes in a design program, but also provides a standard so you can maintain consistency throughout your experience.

![Scaling values for the Unity 3D Text and UI Text](images/Text_In_Unity_Measurements1.png)<br>
*Scaling values for the Unity 3D Text and UI Text*

<br>

![Unity 3D Text Mesh with optimized values](images/hug-text-05-1000px.png)<br>
*Unity 3D Text Mesh with optimized values*

<br>

When adding a UI or canvas-based text element to a scene, the size disparity is greater still. The differences in the two sizes are about 1000%, which would bring the scale factor for UI-based text components to 0.00046 (0.0004586111116 to be exact) or 0.0005 for the rounded value.

![Unity UI Text with optimized values](images/hug-text-04-1000px.png)<br>
*Unity UI Text with optimized values*

<br>

>[!NOTE]
>The default value of any font may be affected by the texture size of that font or how the font was imported into Unity. These tests were performed based on the default Arial font in Unity, as well as one other imported font.

## Working with Text Mesh Pro

With Unity's Text Mesh Pro, you can secure the text rendering quality. It supports crisp text outlines regardless of the distance using the [Signed Distance Field (SDF)](https://steamcdn-a.akamaihd.net/apps/valve/2007/SIGGRAPH2007_AlphaTestedMagnification.pdf) technique. Using the same calculation method that we used above for the 3D Text Mesh and UI Text, we can find the proper scaling values to use with conventional typographic points. Since the default 3D Text Mesh Pro font with the size of 36 has a bounding size of 2.5 Unity units (2.5 m), we can use a scaling value of 0.005 to get the point size. The Text Mesh Pro under the UI menu has a default bounding size of 25 Unity units (25 m). This gives us 0.0005 for the scaling value.

![Scaling values for the Unity 3D Text and UI](images/Text_In_Unity_Measurements2.png)<br>
*Scaling values for the Unity 3D Text and UI*

## Recommended text size

As you can expect, type sizes that we use on a PC or a tablet device (typically between 12–32pt) look small at a distance of 2 meters. It depends on the characteristics of each font, but in general the recommended minimum viewing angle and the font height for legibility are around 0.35°-0.4°/12.21-13.97 mm based on our user research studies. It's about 35-40 pt with the scaling factor introduced above.

For the near interaction at 0.45 m (45 cm), the minimum legible font's viewing angle and the height are 0.4°-0.5° / 3.14–3.9mm. It's about 9-12 pt with the scaling factor introduced above.

![Near and far interaction range](images/typography-distance-1000px.jpg)
*Content at near and far interaction range*

### The minimum legible font size

| Distance | Viewing angle | Text height | Font size |
|---------|---------|---------|---------|
| 45 cm (direct manipulation distance) | 0.4°-0.5° | 3.14–3.9mm | 8.9–11.13pt |
| 2 m | 0.35°-0.4° | 12.21–13.97mm | 34.63-39.58 pt |


### The comfortably legible font size

| Distance | Viewing angle | Text height | Font size |
|---------|---------|---------|---------|
| 45 cm (direct manipulation distance) | 0.65°-0.8° | 5.1-6.3 mm | 14.47-17.8 pt |
| 2 m | 0.6°-0.75° | 20.9-26.2 mm | 59.4-74.2 pt |

Segoe UI (the default font for Windows) works well in most cases. However, avoid using light or semi light font families in small size since thin vertical strokes will vibrate and it will degrade the legibility. Modern fonts with enough stroke thickness work well. For example, Helvetica and Arial look gorgeous and are legible in HoloLens with regular or bold weights.

![Viewing Angle](images/Text_In_Unity_ViewingAngle.jpg)
*Viewing distance, angle, and text height*

## Text with Mixed Reality Toolkit v2

### Sharp text rendering quality with proper dimension

Based on these scaling factors, we have created [text prefabs with UI Text and 3D Text Mesh](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/main/Assets/MRTK/SDK/StandardAssets/Prefabs/Text). Developers can use these prefabs to get sharp text and consistent font size.

![Sharp text rendering quality with proper dimension](images/hug-text-06-1000px.png)<br>
*Sharp text rendering quality with proper dimension*

### Shader with occlusion support

Unity's default font material doesn't support occlusion. Because of this, you'll see the text behind the objects by default. We've included a simple [shader that supports the occlusion](https://github.com/microsoft/MixedRealityToolkit-Unity/blob/main/Assets/MRTK/StandardAssets/Shaders/Text3DShader.shader). The image below shows the text with default font material (left) and the text with proper occlusion (right).

![Shader with occlusion support](images/hug-text-07-1000px.png)<br>
*Shader with occlusion support*

## Next Development Checkpoint

If you're following the Unity development journey we've laid out, you're in the midst of exploring the MRTK core building blocks. From here, you can continue to the next building block:

> [!div class="nextstepaction"]
> [Voice input](voice-input-in-unity.md)

Or jump to Mixed Reality platform capabilities and APIs:

> [!div class="nextstepaction"]
> [Shared experiences](shared-experiences-in-unity.md)

You can always go back to the [Unity development checkpoints](unity-development-overview.md#2-core-building-blocks) at any time.

## See also

* [Text Prefab in the MRTK](https://github.com/microsoft/MixedRealityToolkit-Unity/tree/main/Assets/MRTK/SDK/StandardAssets/Prefabs/Text)
* [Typography](../../design/typography.md)

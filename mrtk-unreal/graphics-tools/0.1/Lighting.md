---
title: Lighting
description: Guide to graphic resources and techniques in Graphics Tools.
author: Cameron-Micka
ms.author: thmicka
ms.date: 12/12/2020
ms.localizationpriority: high
keywords: Unreal, Unreal Engine, UE4, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, GT, Graphics Tools, graphics, rendering, materials
---

# Lighting

By default Unreal uses the [mobile lighting](https://docs.unrealengine.com/en-US/SharingAndReleasing/Mobile/Lighting/index.html) rendering path for Mixed Reality (specifically HoloLens 2). This lighting path is well suited for mobile phones, handhelds, etc. but may be too costly for devices like HoloLens 2, which need to render to a stereo display at [60 frames per second](https://docs.microsoft.com/en-us/windows/mixed-reality/develop/platform-capabilities-and-apis/understanding-performance-for-mixed-reality). To ensure developers have access to a lighting path that is performant on HoloLens 2, Graphics Tools incudes a simplified physically based lighting system accessible via the the `MF_GTDefaultLit` [material function](https://docs.unrealengine.com/en-US/RenderingAndGraphics/Materials/Functions/index.html). 

![Lighting](Images/FeatureCards/Lighting.png)

> [!NOTE] 
> To improve fill rate performance on HoloLens 2 it is recommended to use the simplest materials possible (such as an unlit material). If lighting is required for your material then the `MF_GTDefaultLit` material function is preferred over Unreal's default mobile lighting. Using the `MF_GTDefaultLit` material function can remove roughly 35 pixel shader instructions from a similar default lit mobile material. To quickly create lit materials you may also make [material instances](https://docs.unrealengine.com/en-US/RenderingAndGraphics/Materials/MaterialInstances/index.html) that utilize the `M_GTDefaultLit` material as a parent material.

## Example levels

There are demonstrations of the GT lighting model throughout the example levels. For examples of creating metals such as gold, copper, and aluminum check out the `\GraphicsToolsProject\Plugins\GraphicsToolsExamples\Content\MaterialGallery\MaterialGallery.umap` level.

To compare on contrast the differences between the GT lighting model and Unreal's default mobile lighting model open the `\GraphicsToolsProject\Plugins\GraphicsToolsExamples\Content\MaterialMatrix\MaterialMatrix.umap` level.

![Material Matrix](Images/Lighting/LightingMaterialMatrix.png)

## Implementation details and restrictions

The `MF_GTDefaultLit` material function uses a [physically based lighting](https://en.wikipedia.org/wiki/Physically_based_rendering) system which approximates how diffuse and specular light emits from a surface using microfacet bidirectional reflectance distribution functions ([BRDFs](https://en.wikipedia.org/wiki/Bidirectional_reflectance_distribution_function)). These functions can be found in `\GraphicsToolsProject\Plugins\GraphicsTools\Shaders\Common\GTLighting.ush`. For additional resources into physically based lighting please see Brian Karis' [Physically Based Shading on Mobile](https://www.unrealengine.com/en-US/blog/physically-based-shading-on-mobile) blog post. 

The lighting model accepts a single direct light (directional light) and indirect light (image based light in the form of a [cube map](https://docs.unrealengine.com/en-US/RenderingAndGraphics/Textures/Cubemaps/index.html)).

> [!NOTE] 
> To index on performance, the `MF_GTDefaultLit` material function only considers a single directional light and does not accept any other direct light types (such as a point light or spot light).

To specify the directional light add a `GTDirectionalLight` actor (or component) to the level. The `GTDirectionalLight` will automatically feed the light's direction, color, and intensity to the `MPC_GTSettings` [material parameter collection](https://docs.unrealengine.com/en-US/RenderingAndGraphics/Materials/ParameterCollections/index.html) which is then read by the `MF_GTDefaultLit` material function.

> [!NOTE] 
> If any materials within your level use Unreal's built in lighting model a Unreal [directional light](https://docs.unrealengine.com/en-US/BuildingWorlds/LightingAndShadows/LightTypes/Directional/index.html) will still need to be present. It's recommended to child the Unreal directional light to the `GTDirectionalLight` actor (or component) with a zero relative rotation so that light directions are the same. A [sky light](https://docs.unrealengine.com/en-US/BuildingWorlds/LightingAndShadows/LightTypes/SkyLight/index.html) with a cube map specified should also be added to the level if indirect lighting conditions want to be mimicked between GT and Unreal.

By default all material's using the `MF_GTDefaultLit` material function use a generic "sunny day" [cube map](https://docs.unrealengine.com/en-US/RenderingAndGraphics/Textures/Cubemaps/index.html) to specify the indirect lighting and reflections. This cube map can be overridden by connecting a different reflection cube texture into the `ReflectionCube` input of the `MF_GTDefaultLit` material function.

## Example usage

To aid in understanding some of the inputs to the `MF_GTDefaultLit` material function, let's create a new material and adjust some of the input values.

1. First create a material.
    * Right click within the "Content Browser" and select "Material" under the "Create Basic Asset" menu listings. 
    * Name the material `M_GTLit`. 
    * Double click on `M_GTLit` to open the material editor.

2. Lighting will be handled by the `MF_GTDefaultLit` material function. 
    * To ensure our material isn't lit "twice" mark `M_GTLit` as "Unlit" (1) in the material's "Shading Model" property. 
    * Right click on the material graph and add the `MF_GTDefaultLit` material function. 
    * Connect the result of `MF_GTDefaultLit` to the material's "Emissive Color." (2)

    ![Material Setup](Images/Lighting/LightingMaterialSetup.png)

3. Next let's give our material a base color. The base color represents the color of the material before lighting is applied. 
    * Right click on the material graph and add the `ConstantVector3` node. 
    * Set the node's RGB channels to (1, 0.2, 0) respectively, an orange color. 
    * Connect this node to the `BaseColor` input of the `MF_GTDefaultLit` material function. (1) Alternately, if we had an albedo texture for our material this would be the best place to specify it.

    ![Material Base Color](Images/Lighting/LightingMaterialBaseColor.png)

4. It's time to preview our material in a level. 
    * First create a new level (File > New Level) and select a "Empty Level." 
    * From the "Place Actors" panel drop a `Sphere` actor into the level. 
    * With the `Sphere` actor selected change the material to our newly created material, `M_GTLit`.

    ![Actor Setup](Images/Lighting/LightingActorSetup.png)

5. You may notice now that our `Sphere` actor is completely black and can't be differentiated from the background. To fix this let's add a directional light to our scene. Because we are using the `MF_GTDefaultLit` material function we must use a `GTDirectionalLight` actor (or component). 
    * From the "Place Actors" panel drop a `GTDirectionalLight` actor into the level. 
    * Set the `GTDirectionalLight`'s "Intensity" to 2. The default value represents a "sunny day" and may wash out our material.
    * With the `GTDirectionalLight` in the level the `Sphere` should look like below with diffuse lighting (1) and specular lighting (2) clearly visible.

    ![Actor Default](Images/Lighting/LightingActorDefault.png)

6. Let's skip past a few `MF_GTDefaultLit` input properties (we will look at the ones we skip later) and look at `Roughness`. This property controls the perceived roughness (1.0) or smoothness (0.0) of a surface. Smooth surfaces exhibit sharp reflections.
    * Double click on `M_GTLit` to open the material editor again.
    * Right click on the material graph and add a `ScalarParameter` node. Name this node "Roughness." (1) We are adding a parameter node so that we can adjust the value and real time without having to recompile the shader. In practice if the value was constant it should be a `Constant` node.
    * Set the "Roughness" node's default value to 0.5, slider min to 0.0, and slider max to 1.0.
    * With the material editor and level viewport side by side try adjusting the "Roughness" node's default value between 0 and 1. Note roughness values near 0 have small specular highlights and reflect the environment, while values near 1 have large (or nearly invisible) specular highlights and reflect very little of the environment.

    ![Material Base Roughness](Images/Lighting/LightingMaterialRoughness.png)

7. Now we will look at the `Metallic` property. The `Metallic` property controls whether a surface appears to be dielectric (0.0) or conductor (1.0). Very few materials exist somewhere between a dielectric or conductor and are often "either or" (0.0 or 1.0).
    *  Right click on the material graph and add a `ScalarParameter` node named "Metallic" and configure it like we did above for roughness.
    *  With the material editor and level viewport side by side try adjusting the "Metallic" node's default value between 0 and 1. Note how conductors (metallic of 1.0) appear a bit darker in this setup because they only reflect the environment (like a mirror).

8. Let's jump to the `ReflectionCube` input property of `MF_GTDefaultLit`. By default all material's using the `MF_GTDefaultLit` material function use a generic "sunny day" [cube map](https://docs.unrealengine.com/en-US/RenderingAndGraphics/Textures/Cubemaps/index.html) to specify indirect lighting and reflections. This cube map can be overridden by connecting a different reflection cube texture into the `ReflectionCube` input of the `MF_GTDefaultLit` material function.
    * To specify a different cube texture right click on the material graph and add a `TextureObject` node. (1)
    * Graphics Tools doesn't include any example cube maps, so let's select one from the engine content. With the `TextureObject` node selected click on the "DefaultTexture" drop down in the details panel. Click the "View Options" button from the pop up and check "Show Engine Content." Now search "EpicQuad" and select: "EpicQuadPanorama_CC+EV1"
    * Connect the output of the `TextureObject` node to the `ReflectionCube` input.
    * The material will now reflect a handful of "office buildings" if the `Roughness` value is near zero (less than 0.5>). Reflections help give the illusion of smooth surface.
    * Lastly, try adjusting the "Roughness" node's default value between 0 and 1 again. Note, how the `ReflectionCube`'s output becomes "blurry" as surfaces get rougher.

    ![Material Reflection Cube](Images/Lighting/LightingMaterialReflectionCube.png)

9. The `FullyRough` input property of `MF_GTDefaultLit` is important for performance critical situations. A "fully rough" material is very cheap to render, but lacks specular highlights, reflections, or indirect lighting. The only feature fully rough materials exhibit is diffuse light.
    * To mark a material as "fully rough", right click on the material graph and add a `StaticBool` node.
    * Connect the output of the `StaticBool` node to the `FullyRough` input.
    * Try toggling the value of the `StaticBool` node on and off. (1) Note, when "on" the material only exhibits diffuse lighting, but doesn't contain many shader instructions.

    ![Material Fully Rough](Images/Lighting/LightingMaterialFullyRough.png)

10. We glanced over a few input properties of `MF_GTDefaultLit` which are less commonly used. We will detail these properties below.
    * `Specular` scales the specular highlights on a material (only if the material contains specular lighting based on previous properties).
    * `NormalWS` accepts a normal in world space. By default `MF_GTDefaultLit` uses the geometric normal. This input is often used in conjunction with [normal maps](https://docs.unrealengine.com/en-US/RenderingAndGraphics/Textures/NormalMaps/Creation/index.html). Be sure to transform the output of a normal map from tangent space to world space using the `TransformVector` node before assigning to the `NormalWS` input. An example of this can be found in the `GraphicsToolsProject\Plugins\GraphicsToolsExamples\Content\MaterialGallery\Materials\M_ShaderBallNormalMap.umap` material.
    * `AmbientOclusion` determines how exposed each pixel in a material is to ambient lighting. Normally this value is driven by a grey-scale texture (AO Map).
    * `DirectLightIntensity` allows a material to scale the amount of light being received from direct lights (the directional light). This value doesn't have a physical counterpart in reality, but is useful for artists to control lighting on a material without having to adjust the entire level's lighting.

## See also

- [Proximity Lights](ProximityLights.md)
- [Effects](Effects.md)

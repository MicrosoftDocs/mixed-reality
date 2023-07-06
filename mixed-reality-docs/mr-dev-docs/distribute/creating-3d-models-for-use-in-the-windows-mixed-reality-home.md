---
title: Create 3D models for use in the home
description: Asset requirements and authoring guidance for 3D models to be used in the Windows Mixed Reality home on both HoloLens and immersive (VR) headsets.
author: vtieto
ms.author: vinnietieto
ms.date: 11/02/2021
ms.topic: article
keywords: 3D, modeling, modeling guidance, asset requirements, authoring guidelines, launcher, 3D launcher, texture, materials, complexity, triangles, mesh, polygons, polycount, limits, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Create 3D models for use in the home

The [Windows Mixed Reality home](../discover/navigating-the-windows-mixed-reality-home.md) is the starting point where users land before launching applications. When designing your application for Windows Mixed Reality headsets, use a [3D model as an app launcher](implementing-3d-app-launchers.md) and place [3D deep links into the Windows Mixed Reality home](implementing-3d-app-launchers.md#3d-deep-links-secondarytiles). This article outlines the guidelines for creating 3D models compatible with the Windows Mixed Reality home.

## Asset requirements overview

When creating 3D models for Windows Mixed Reality, there are some requirements that all assets must meet: 
1. [Exporting](#exporting-models) - Assets must be delivered in the .glb (binary glTF), .obj, or .fbx file format
2. [Modeling](#modeling-guidelines) - Assets must be less than 10k triangles, have no more than 64 nodes and 32 submeshes per LOD
3. [Materials](#material-guidelines) - Textures can't be larger than 4096 x 4096 and the smallest mip map should be no larger than 4 on either dimension
4. [Animation](#animation-guidelines) - Animations can't be longer than 20 minutes at 30 FPS (36,000 keyframes) and must contain <= 8192 morph target vertices
5. [Optimizing](#optimizations) - Assets should be optimized using the [WindowsMRAssetConverter](https://github.com/Microsoft/glTF-Toolkit/releases). *Required on Windows OS Versions <= 1709** and recommended on Windows OS versions >= 1803

> [!NOTE]
> The 3D Viewer app supports different formats and resolutions, but ultimately converts models to .glb/glTF before displaying them in the Mixed Reality home.

The rest of this article includes a detailed overview of these requirements and extra guidelines to ensure your models work well with the Windows Mixed Reality home. 

## Detailed guidance

### Exporting models

The Windows Mixed Reality home expects 3D assets to be delivered using the .glb file format with embedded images and binary data. Glb is the binary version of the glTF format, which is a royalty free open standard for 3D asset delivery maintained by the Khronos group. As glTF evolves as an industry standard for interoperable 3D content, so will Microsoft’s support for the format across Windows apps and experiences. If you haven't created a glTF asset before you can find a [list of supported exporters and converters](https://github.com/KhronosGroup/glTF/blob/master/README.md#converters-and-exporters) on the glTF working group github page.  

### Modeling guidelines

Windows expects assets to be generated using the following modeling guidelines to ensure compatibility with the Mixed Reality home experience. When modeling in your program of your choice, keep in mind the following recommendations and limitations:
1. The Up axis should be set to “Y”.
2. The asset should face “forward” towards the positive Z axis.
3. All assets should be built on the ground plane at the scene origin (0,0,0)
4. Working Units should be set to meters and assets so that assets can be authored at world scale
5. All meshes don't need to be combined, but it's recommended if you're targeting resource constrained devices
6. All meshes should share one material, with only one texture set being used for the whole asset
7. UVs must be laid out in a square arrangement in the 0-1 space. Avoid tiling textures although they're permitted.
8. Multi-UVs aren't supported
9. Double-sided materials aren't supported

### Triangle counts and levels of detail (LODs)

The Windows Mixed Reality home doesn't support models with more than 10,000 triangles. It’s recommended you triangulate your meshes before exporting to ensure they don't exceed this count. Windows MR also supports optional geometry levels of detail (LODs) to ensure a performant and high-quality experience. [The WindowsMRAssetConverter](https://github.com/Microsoft/glTF-Toolkit/releases) will help you combine 3 versions of your model into a single .glb model. Windows determines which LOD to display based on the amount of screen real estate the model is taking up. Only 3 LOD levels are supported with the following recommended triangle counts:
<br>

|  LOD Level  |  Recommended Triangle Count  |  Max Triangle Count | 
|------|------|------|
|  LOD 0 |  10,000 |  10,000 | 
|  LOD 1 |  5,000  |  10,000 | 
|  LOD 2 |  2,500  |  10,000 | 

### Node counts and submesh limits

The Windows Mixed Reality home doesn't support models with more than 64 nodes or 32 submeshes per LOD. Nodes are a concept in the [glTF specification](https://github.com/KhronosGroup/glTF/tree/master/specification/2.0#nodes-and-hierarchy) that define the objects in the scene. Submeshes are defined in the array of [primitives](https://github.com/KhronosGroup/glTF/tree/master/specification/2.0#meshes) on the mesh in the object. 

|  Feature |  Description  |  Max Supported | Documentation |
|------|------|------|------|
|  Nodes |  Objects in the glTF Scene |  64 per LOD | [Here](https://github.com/KhronosGroup/glTF/tree/master/specification/2.0#nodes-and-hierarchy)|
|  Submeshes |  Sum of primitives on all meshes |  32 per LOD | [Here](https://github.com/KhronosGroup/glTF/tree/master/specification/2.0#meshes)|

## Material guidelines

Textures should be prepared using a PBR metal roughness workflow. Begin by creating a full set of textures including Albedo, Normal, Occlusion, Metallic, and Roughness. Windows Mixed Reality supports textures with resolutions up to 4096x4096 but it's recommended that you author at 512x512. Textures should be authored at resolutions in multiples of 4. This is a requirement for the compression format applied to textures in the exporting steps outlined below. When generating mip maps or a texture, the lowest mip must be a maximum of 4x4.
<br>

|  Recommended Texture Size  |  Max Texture Size | Lowest Mip
|----|----|----|
|  512x512  |  4096x4096 | max 4x4|

### Albedo (base color) map

Raw color with no lighting information. This map also contains the reflectance and diffuse information for metal (white in the metallic map) and insulator (black in the metallic map) surfaces respectively.

### Normal

Tangent Space Normal map

### Roughness map

Describes the microsurface of the object. White 1.0 is rough Black 0.0 is smooth. This map gives the asset the most character, as it truly describes the surface. For example, scratches, fingerprints, smudges, grime, and so on.

### Ambient occlusion map

Value scale map showing areas of occluded light, which blocks reflections

### Metallic map

Tells the shader if something is metal or not. Raw Metal = 1.0 white Non-metal = 0.0 black. There can be transitional gray values that indicate something covering the raw metal such as dirt, but in general this map should be black and white only.

## Optimizations
Windows Mixed Reality home offers a series of optimizations on top of the core glTF spec defined using custom extensions. These optimizations are required on Windows versions <= 1709 and recommended on newer versions of Windows. You can easily optimize any glTF 2.0 model using the [Windows Mixed Reality Asset Converter available on GitHub](https://github.com/Microsoft/glTF-Toolkit/releases). This tool will perform the correct texture packing and optimizations as specified below. For general usage, we recommend using the WindowsMRAssetConverter, but if you need more control over the experience and would like to build your own optimization pipeline then you can refer to the detailed specification below.  

> [!NOTE]
> For a definitive list of what the possibilities are for exact model limits, refer to the [3D model optimization](/dynamics365/mixed-reality/guides/3d-content-guidelines/optimize-models) article for use in Dynamics 365 applications.

### Materials

To improve asset loading time in Mixed Reality environments Windows MR supports rendering compressed DDS textures packed according to the texture packing scheme defined in this section. DDS textures are referenced using the [MSFT_texture_dds extension](https://github.com/sbtron/glTF/tree/MSFT_lod/extensions/Vendor/MSFT_texture_dds). Compressing textures is highly recommended. 

#### HoloLens

HoloLens-based mixed reality experiences expect textures to be packed using a 2-texture setup using the following packing specification:
<br>

|  glTF Property  |  Texture  |  Packing Scheme | 
|----------|----------|----------|
|  pbrMetallicRoughness  |  baseColorTexture  |  Red (R), Green (G), Blue (B) | 
|  [MSFT_packing_normalRoughnessMetallic](https://github.com/KhronosGroup/glTF/blob/master/extensions/2.0/Vendor/MSFT_packing_normalRoughnessMetallic/README.md)  |  normalRoughnessMetallicTexture  |  Normal (RG), Roughness (B), Metallic (A) | 


When compressing the DDS textures the following compression is expected on each map:
<br>

|  Texture  |  Expected Compression | 
|------|------|
|  baseColorTexture, normalRoughnessMetallicTexture |  BC7 | 

#### Immersive (VR) headsets

PC-based Windows Mixed Reality experiences for immersive (VR) headsets expect textures to be packed using a 3-texture setup using the following packing specification:

##### Windows OS >= 1803

<br>

|  glTF Property  |  Texture  |  Packing Scheme | 
|----------|----------|----------|
|  pbrMetallicRoughness  |  baseColorTexture  |  Red (R), Green (G), Blue (B) | 
|  [MSFT_packing_occlusionRoughnessMetallic](https://github.com/KhronosGroup/glTF/blob/master/extensions/2.0/Vendor/MSFT_packing_occlusionRoughnessMetallic/README.md)  |  occlusionRoughnessMetallicTexture  |  Occlusion (R), Roughness (G), Metallic (B) | 
|  [MSFT_packing_occlusionRoughnessMetallic](https://github.com/KhronosGroup/glTF/blob/master/extensions/2.0/Vendor/MSFT_packing_occlusionRoughnessMetallic/README.md)  |  normalTexture  |  Normal (RG) | 

When compressing the DDS textures the following compression is expected on each map:
<br>

|  Texture  |  Expected Compression | 
|------|------|
|  normalTexture  |  BC5 | 
|  baseColorTexture, occlusionRoughnessMetallicTexture  |  BC7 | 

##### Windows OS <= 1709
<br>

|  glTF Property  |  Texture  |  Packing Scheme | 
|----------|----------|----------|
|  pbrMetallicRoughness  |  baseColorTexture  |  Red (R), Green (G), Blue (B) | 
|  [MSFT_packing_occlusionRoughnessMetallic](https://github.com/KhronosGroup/glTF/blob/master/extensions/2.0/Vendor/MSFT_packing_occlusionRoughnessMetallic/README.md)  |  roughnessMetallicOcclusionTexture  |  Roughness (R), Metallic (G), Occlusion (B) | 
|  [MSFT_packing_occlusionRoughnessMetallic](https://github.com/KhronosGroup/glTF/blob/master/extensions/2.0/Vendor/MSFT_packing_occlusionRoughnessMetallic/README.md)  |  normalTexture  |  Normal (RG) | 

When compressing the DDS textures the following compression is expected on each map:
<br>

|  Texture  |  Expected Compression | 
|------|------|
|  normalTexture  |  BC5 | 
|  baseColorTexture, roughnessMetallicOcclusionTexture | BC7 |

### Adding mesh LODs

Windows MR uses geometry node LODs to render 3D models in different levels of detail depending on on-screen coverage. While this feature is technically not required, it's recommended for all assets. Currently Windows supports 3 levels of detail. The default LOD is 0, which represents the highest quality. Other LODs are numbered sequentially, for example, 1, 2 and get progressively lower in quality. The [Windows Mixed Reality Asset Converter](https://github.com/Microsoft/glTF-Toolkit/releases) supports generating assets that meet this LOD specification by accepting multiple glTF models and merging them into a single asset with valid LOD levels. The following table outlines the expected LOD ordering and triangle targets:
<br>

|  LOD Level  |  Recommended Triangle Count  |  Max Triangle Count | 
|-------|-------|-------|
|  LOD 0 |  10,000 |  10,000 | 
|  LOD 1 |  5,000  |  10,000 | 
|  LOD 2 |  2,500  |  10,000 | 

When using LODs always specify 3 LOD levels. Missing LODs will cause the model to not render unexpectedly as the LOD system switches to the missing LOD level. glTF 2.0 doesn't currently support LODs as part of the core spec. LODs should be defined using the [MSFT_LOD extension](https://github.com/sbtron/glTF/tree/MSFT_lod/extensions/Vendor/MSFT_lod).

### Screen coverage

LODs are displayed in Windows Mixed Reality based on a system driven by the screen coverage value set on each LOD. Objects that are currently consuming a larger portion of the screen space are displayed at a higher LOD level. Screen coverage isn't a part of the core glTF 2.0 spec and must be specified using MSFT_ScreenCoverage in the “extras” section of the [MSFT_lod extension](https://github.com/sbtron/glTF/tree/MSFT_lod/extensions/Vendor/MSFT_lod).
<br>

|  LOD Level  |  Recommended Range  |  Default Range | 
|-------|-------|-------|
|  LOD 0  |  100% - 50% |  0.5 | 
|  LOD 1 |  Under 50% - 20%  |  0.2 | 
|  LOD 2 |  Under 20% - 1%  |  0.01 | 
|  LOD 4  |  Under 1%  |  - | 

## Animation guidelines

> [!NOTE]
> This feature was added as part of [Windows 10 April 2018 Update](/windows/mixed-reality/enthusiast-guide/release-notes-april-2018). On older versions of Windows these animations won't play back, however, they will still load if authored according to the guidance in this article.  

The mixed reality home supports animated glTF objects on HoloLens and immersive (VR) headsets. If you wish to trigger animations on your model, you'll need to use the Animation Map extension on the glTF format. This extension lets you trigger animations in the glTF model based on the user's presence in the world, for example trigger an animation when the user is close to the object or while they're looking at it. If you glTF object has animations, but doesn't define triggers the animations won't be played back. The section below describes one workflow for adding these triggers to any animated glTF object.

### Tools

First, download the following tools if you don't have them already. These tools will make it easy to open any glTF model, preview it, make changes and save back out as glTF or .glb:
1. [Visual Studio Code](https://code.visualstudio.com/)
2. [glTF Tools for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=cesium.gltf-vscode)


### Opening and previewing the model

Start by opening up the glTF model in VSCode by dragging the .glTF file into the editor window. If you've a .glb instead of a .glTF file you can import it into VSCode using the glTF Tools addon that you downloaded. Go to "View -> Command Palette" and then begin typing "glTF" in the command palette and select "glTF: Import from glb", which will pop up a file picker for you to import a .glb with. 

Once you've opened your glTF model, you should see the JSON in the editor window. You can also preview the model in a live 3D viewer using the by right-clicking the file name and selecting the "glTF: Preview 3D Model" command shortcut from the right click menu. 

### Adding the triggers

Animation triggers are added to glTF model JSON using the Animation Map extension. The animation map extension is publicly documented [here on GitHub](https://github.com/msfeldstein/glTF/blob/04f7005206257cf97b215df5e3f469d7838c1fee/extensions/Vendor/FB_animation_map/README.md) (NOTE: THIS IS A DRAFT EXTENSION). To add the extension to your model just scroll to the end of the glTF file in the editor and add the "extensionsUsed" and "extensions" block to your file if they don't already exist. In the "extensionsUsed" section, you'll add a reference to the "EXT_animation_map" extension and in the "extensions" block you'll add your mappings to the animations in the model.

As noted [in the spec](https://github.com/msfeldstein/glTF/blob/04f7005206257cf97b215df5e3f469d7838c1fee/extensions/Vendor/FB_animation_map/README.md) you define what triggers the animation using the "semantic" string on a list of "animations", which is an array of animation indices. In the example below we've specified the animation to play while the user is gazing at the object:

```json
  "extensionsUsed": [
    "EXT_animation_map"
  ],
  "extensions" : {
      "EXT_animation_map" : {
            "bindings": [
                {
                    "semantic": "GAZE",
                    "animations": [0]
                }
            ]
      }
  }
```
The following animation triggers semantics are supported by the Windows Mixed Reality home.  
* "ALWAYS": Constantly loop an animation
* "HELD": Looped during the entire duration an object is grabbed.
* "GAZE": Looped  while an object is being looked at
* "PROXIMITY": Looped while a viewer is near to an object
* "POINTING": Looped while a user is pointing at an object

### Saving and exporting

Once you've made the changes to your glTF model, you can save it directly as glTF. You can also right-click the name of the file in the editor and select "glTF: Export to GLB (binary file)" to export a .glb. 

### Restrictions

Animations can't be longer than 20 minutes and can't contain more than 36,000 keyframes (20 mins at 30 FPS). Additionally when using morph target-based animations don't exceed 8192 morph target vertices or less. Exceeding these counts will cause the animated asset to be unsupported in the Windows Mixed Reality home. 

|Feature|Maximum|
|-----|-----|
|Duration|20 minutes|
|Keyframes|36,000| 
|Morph Target Vertices|8192|

## glTF Implementation notes

Windows MR doesn't support flipping geometry using negative scales. Geometry with negative scales will likely result in visual artifacts.

The glTF asset MUST point to the default scene using the scene attribute to be rendered by Windows MR. Additionally the Windows MR glTF loader before the [Windows 10 April 2018 update](/windows/mixed-reality/enthusiast-guide/release-notes-april-2018) **requires** accessors:
* Must have min and max values.
* Type SCALAR must be componentType UNSIGNED_SHORT (5123) or UNSIGNED_INT (5125).
* Type VEC2 and VEC3 must be componentType FLOAT (5126).

The following material properties are used from core glTF 2.0 spec but not required:
* baseColorFactor, metallicFactor, roughnessFactor
* baseColorTexture: Must point to a texture stored in dds.
* emissiveTexture: Must point to a texture stored in dds.
* emissiveFactor
* alphaMode

The following material properties are ignored from core spec:
* All Multi-UVs
* metalRoughnessTexture: Must instead use Microsoft optimized texture packing defined below
* normalTexture: Must instead use Microsoft optimized texture packing defined below
* normalScale
* occlusionTexture: Must instead use Microsoft optimized texture packing defined below
* occlusionStrength

Windows MR doesn't support primitive mode lines and points. 

Only a single UV vertex attribute is supported.

## More resources

* [glTF Exporters and Converters](https://github.com/KhronosGroup/glTF#converters-and-exporters)
* [glTF Toolkit](https://github.com/Microsoft/glTF-Toolkit)
* [glTF 2.0 Specification](https://github.com/KhronosGroup/glTF/blob/master/README.md)
* [Microsoft glTF LOD Extension Specification](https://github.com/KhronosGroup/glTF/blob/master/extensions/2.0/Vendor/MSFT_lod/README.md)
* [PC Mixed Reality Texture Packing Extensions Specification](https://github.com/KhronosGroup/glTF/blob/master/extensions/2.0/Vendor/MSFT_packing_occlusionRoughnessMetallic/README.md)
* [HoloLens Mixed Reality Texture Packing Extensions Specification](https://github.com/KhronosGroup/glTF/blob/master/extensions/2.0/Vendor/MSFT_packing_normalRoughnessMetallic/README.md)
* [Microsoft DDS Textures glTF extensions specification](https://github.com/KhronosGroup/glTF/tree/master/extensions/2.0/Vendor/MSFT_texture_dds)

## See also

* [Implement 3D app launchers (UWP apps)](implementing-3d-app-launchers.md)
* [Implement 3D app launchers (Win32 apps)](implementing-3d-app-launchers-win32.md)
* [Navigating the Windows Mixed Reality home](../discover/navigating-the-windows-mixed-reality-home.md)
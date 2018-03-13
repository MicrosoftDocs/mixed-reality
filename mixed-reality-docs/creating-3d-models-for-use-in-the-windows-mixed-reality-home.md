---
title: Creating 3D models for use in the Windows Mixed Reality home
description: Asset requirements and authoring guidance for 3D models to be used in the Windows Mixed Reality home.
author: thmignon
ms.author: thmignon
ms.date: 2/28/2018
ms.topic: article
keywords: 3D, modeling, modeling guidance, asset requirements, authoring guidelines, launcher, 3D launcher, texture, materials, complexity, triangles, mesh, polygons, polycount, limits
---



# Creating 3D models for use in the Windows Mixed Reality home

The [Windows Mixed Reality home](navigating-the-windows-mixed-reality-home.md) is the starting point where users land before launching applications. You can design your application for Windows Mixed Reality **immersive headsets** to leverage a [3D model as an app launcher](implementing-3d-app-launchers.md) and to allow [3D deep links to be placed into the Windows Mixed Reality home from within your app](implementing-3d-deep-links-for-your-app-in-the-windows-mixed-reality-home.md). This article outlines the guidelines for creating 3D models compatible with the Windows Mixed Reality home.

**Note:** 3D models in the Windows Mixed Reality home are not currently available for use on HoloLens.

## Modeling guidelines

Windows expects assets to be generated using the following modeling guidelines to ensure compatibility with the Mixed Reality home experience. When modeling in your program of your choice keep in mind the following recommendations and limitations:
1. The Up axis should be set to “Y”.
2. The asset should face “forward” towards the positive Z axis.
3. All assets should be built on the ground plane at the scene origin (0,0,0)
4. Working Units should be set to meters and assets so that assets can be authored at world scale
5. All meshes do not need to be combined but it is recommended if you are targeting resource constrained devices
6. All meshes should share 1 material, with only 1 texture sheet being used for the whole asset
7. UVs must be laid out in a square arrangement in the 0-1 space. Avoid tiling textures although they are permitted.
8. Multi-UVs are not supported
9. Double sided materials are not supported

## Triangle counts and levels of detail (LODs)

The Windows Mixed Reality Home does not support models that with more than 10,000 triangles. It’s recommended that you triangulate your meshes before exporting to ensure that they do not exceed this count. Windows MR also supports geometry levels of detail (LODs) to ensure a performant and high-quality experience. Windows determines which LOD to display based on the amount of screen real estate the model is taking up. Only 3 LOD levels are supported with the following recommended triangle counts:

|  LOD Level  |  Recommended Triangle Count  |  Max Triangle Count | 
|----------|----------|----------|
|  LOD 0 |  10,000 |  10,000 | 
|  LOD 1 |  5,000  |  10,000 | 
|  LOD 2 |  2,500  |  10,000 | 

## Texture resolutions and workflow

Textures should be prepared using a PBR metal roughness workflow. Begin by creating a full set of textures including Albedo, Normal, Occlusion, Metallic, and Roughness. Windows Mixed Reality supports textures with resolutions up to 4096x4096 but its recommended that you author at 512x512. Additionally textures should be authored at resolutions in multiples of 4 as this is a requirement for the compression format applied to textures in the exporting steps outlined below.

|  Recommended Texture Size  |  Max Texture Size | 
|----------|----------|
|  512x512  |  4096x4096 | 

### Albedo (base color) map

Raw color with no lighting information. This map also contains the reflectance and diffuse information for metal (white in the metallic map) and insulator (black in the metallic map) surfaces respectively.

### Normal

Tangent Space Normal map

### Roughness map

Describes the microsurface of the object. White 1.0 is rough Black 0.0 is smooth. This map gives the asset the most character as it truly describes the surface e.g. scratches, fingerprints, smudges, grime etc.

### Ambient occlusion map

Value scale map depicting areas of occluded light which blocks reflections

### Metallic map

Tells the shader if something is metal or not. Raw Metal = 1.0 white Non metal = 0.0 black. There can be transitional gray values that indicate something covering the raw metal such as dirt, but in general this map should be black and white only.

## Exporting assets

Windows Mixed Reality relies on glTF (.glb) as the asset delivery format for 3D launchers and content. glTF is a royalty free open standard for 3D asset delivery maintained by the Khronos group. As glTF evolves as an industry standard for interoperable 3D content so will Microsoft’s support for the format across Windows apps and experiences.

### Creating glTF models

The first step in exporting assets for Windows Mixed Reality endpoints is generating a glTF 2.0 model. The glTF working group maintains a [list of supported exporters and converters](https://github.com/KhronosGroup/glTF/blob/master/README.md#converters-and-exporters) to create a glTF 2.0 model. To get started use one of the programs listed on this page to create and export a glTF 2.0 model, or convert an existing model using one of the supported converters.

### Converting glTF Models for the Mixed Reality Home

The Windows Mixed Reality home requires a number of optimizations to be performed on the glTF before adding it to your project (see required] and optional optimizations below). To make this process easier we have created the Windows Mixed Reality Asset Converter which is [available on Github](https://github.com/Microsoft/glTF-Toolkit/releases). This tool uses a set of utilities available in the Microsoft glTF toolkit to convert any standard 2.0 glTF or .glb into a Windows Mixed Reality compatible .glb. This is currently a required step for all assets used in Windows Mixed Reality, and we highly recommend using the converter to make generating your mixed reality home assets easy. For more information about using the tool please refer to the documentation also [available on GitHub](https://github.com/Microsoft/glTF-Toolkit/blob/master/WindowsMRAssetConverter/README.md).

### Binary glTF format

The [binary glTF format](https://github.com/KhronosGroup/glTF/blob/master/specification/2.0/README.md#glb-file-format-specification) packages the glTF file into a single binary package. Windows Mixed Reality Home expects assets to be delivered using the binary glTF format with embedded images and binary data. Assets packed using the binary glTF format use the .glb file extension. Standard glTF models are not supported.

### glTF Implementation notes

The glTF asset MUST point to the default scene using the scene attribute to be rendered by Windows MR. Additionally the Windows MR glTF loader **requires** accessors:
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

## Required Optimizations

Windows Mixed Reality home **requires** a series of optimizations on top of the core glTF spec. These are defined using custom extensions. The following packing formats and extensions are required otherwise the model won’t render successfully. You can easily convert any 2.0 glTF model to meet these required specifications using the [Windows Mixed Reality Asset Converter available on GitHub](https://github.com/Microsoft/glTF-Toolkit/releases). This tool will perform the correct texture packing and optimizations outlined below.

### Materials

Windows MR only supports rendering DDS textures packed according to the texture packing scheme defined in this section. DDS textures are referenced using the [MSFT_texture_dds extension](https://github.com/sbtron/glTF/tree/MSFT_lod/extensions/Vendor/MSFT_texture_dds). Compressing textures is highly recommended. PC based Mixed Reality experiences expect textures to be packed using a 3-texture setup using the following packing specification:

|  glTF Property  |  Texture  |  Packing Scheme | 
|----------|----------|----------|
|  pbrMetallicRoughness  |  baseColorTexture  |  Red (R), Green (G), Blue (B) | 
|  [MSFT_packing_occlusionRoughnessMetallic](https://github.com/sbtron/glTF/tree/MSFT_lod/extensions/Vendor/MSFT_packing_occlusionRoughnessMetallic)  |  roughnessMetallicOcclusionTexture  |  Roughness (R), Metallic (G), Occlusion (B) | 
|  [MSFT_packing_occlusionRoughnessMetallic](https://github.com/sbtron/glTF/tree/MSFT_lod/extensions/Vendor/MSFT_packing_occlusionRoughnessMetallic)  |  normalTexture  |  Normal (RG) | 

When compressing the DDS textures the following compression is expected on each map:

|  Map  |  Expected Compression | 
|----------|----------|
|  Normal  |  BC5 | 
|  Base Color, Occlusion, MetallicRoughness, Emissive  |  BC7 | 

## Optional Optimizations

### Adding mesh LODs

Windows MR uses geometry node LODs to render 3D models in different levels of detail depending on screen coverage. While this feature is technically not required, it's strongly recommended for all assets. Currently Windows supports 3 levels of detail. The default LOD is 0, which represents the highest quality. Other LODs are numbered sequentially, e.g. 1, 2 and get progressively lower in quality. The [Windows Mixed Reality Asset Converter](https://github.com/Microsoft/glTF-Toolkit/releases) supports generating assets that meet this LOD specification by accepting multiple glTF models and merging them into a single asset with valid LOD levels. The following table outlines the expected LOD ordering and triangle targets:

|  LOD Level  |  Recommended Triangle Count  |  Max Triangle Count | 
|----------|----------|----------|
|  LOD 0 |  10,000 |  10,000 | 
|  LOD 1 |  5,000  |  10,000 | 
|  LOD 2 |  2,500  |  10,000 | 

When using LODs always specify 3 LOD levels. Missing LODs will cause the model to not render unexpectedly as the LOD system switches to the missing LOD level. glTF 2.0 does not currently support LODs as part of the core spec. LODs should therefore be defined using the [MSFT_LOD extension](https://github.com/sbtron/glTF/tree/MSFT_lod/extensions/Vendor/MSFT_lod).

### Screen coverage

LODs are displayed in Windows Mixed Reality based on a system driven by the screen coverage value set on each LOD. Objects that are currently consuming a larger portion of the screen space are displayed at a higher LOD level. Screen coverage is not a part of the core glTF 2.0 spec and must be specified using MSFT_ScreenCoverage in the “extras” section of the [MSFT_lod extension](https://github.com/sbtron/glTF/tree/MSFT_lod/extensions/Vendor/MSFT_lod).

|  LOD Level  |  Recommended Range  |  Default Range | 
|----------|----------|----------|
|  LOD 0  |  100% - 50% |  .5 | 
|  LOD 1 |  Under 50% - 20%  |  .2 | 
|  LOD 2 |  Under 20% - 1%  |  .01 | 
|  LOD 4  |  Under 1%  |  - | 

## Additional resources
* [glTF Toolkit](https://github.com/Microsoft/glTF-Toolkit)
* [glTF 2.0 Specification](https://github.com/KhronosGroup/glTF/blob/master/README.md)
* [Microsoft glTF LOD Extension Specification](https://github.com/sbtron/glTF/tree/MSFT_lod/extensions/Vendor/MSFT_lod)
* [PC Mixed Reality Texture Packing Extensions Specification](https://github.com/sbtron/glTF/tree/MSFT_lod/extensions/Vendor/MSFT_packing_occlusionRoughnessMetallic)
* [Microsoft DDS Textures glTF extensions specification](https://github.com/sbtron/glTF/tree/MSFT_lod/extensions/Vendor/MSFT_texture_dds)
* [Blender glTF 2.0 exporter](https://github.com/KhronosGroup/glTF-Blender-Exporter)

## See also
* [Implementing 3D app launchers](implementing-3d-app-launchers.md)
* [Implementing 3D deep links for your app in the Windows Mixed Reality home](implementing-3d-deep-links-for-your-app-in-the-windows-mixed-reality-home.md)
* [Navigating the Windows Mixed Reality home](navigating-the-windows-mixed-reality-home.md)

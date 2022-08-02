---
title: Proximity light
description: Documentation on Proximity Light with Examples in MRTK
author: keveleigh
ms.author: kurtie
ms.date: 01/12/2021
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK,
---

# Proximity light &#8212; MRTK2

A [`ProximityLight`](xref:Microsoft.MixedReality.Toolkit.Utilities.ProximityLight?view=mixed-reality-toolkit-unity-2019-dotnet-2.8.0&preserve-view=true) is a [Fluent Design System](https://www.microsoft.com/design/fluent/) paradigm that mimics a "gradient inverse point light" hovering near the surface of an object. Often used for near interactions, the application can control the properties of a Proximity Light via the [`ProximityLight`](xref:Microsoft.MixedReality.Toolkit.Utilities.ProximityLight?view=mixed-reality-toolkit-unity-2019-dotnet-2.8.0&preserve-view=true) component.

For a material to be influenced by a [`ProximityLight`](xref:Microsoft.MixedReality.Toolkit.Utilities.ProximityLight?view=mixed-reality-toolkit-unity-2019-dotnet-2.8.0&preserve-view=true) the *Mixed Reality Toolkit/Standard* shader must be used and the *Proximity Light* property must be enabled.

> [!NOTE]
> Up to two [`ProximityLights`](xref:Microsoft.MixedReality.Toolkit.Utilities.ProximityLight?view=mixed-reality-toolkit-unity-2019-dotnet-2.8.0&preserve-view=true) are supported by default.

## Examples

Most scenes within MRTK utilize a [`ProximityLight`](xref:Microsoft.MixedReality.Toolkit.Utilities.ProximityLight?view=mixed-reality-toolkit-unity-2019-dotnet-2.8.0&preserve-view=true). The most common use case can be found on the MRTK/SDK/Features/UX/Prefabs/Cursors/FingerCursor.prefab

## Advanced Usage

By default only two [`ProximityLights`](xref:Microsoft.MixedReality.Toolkit.Utilities.ProximityLight?view=mixed-reality-toolkit-unity-2019-dotnet-2.8.0&preserve-view=true) can illuminate a [material](https://docs.unity3d.com/ScriptReference/Material.html) at a time. If your project requires more than two [`ProximityLights`](xref:Microsoft.MixedReality.Toolkit.Utilities.ProximityLight?view=mixed-reality-toolkit-unity-2019-dotnet-2.8.0&preserve-view=true) to influence a [material](https://docs.unity3d.com/ScriptReference/Material.html) the sample code below demonstrates how to achieve this.

> [!NOTE]
> Having many [`ProximityLights`](xref:Microsoft.MixedReality.Toolkit.Utilities.ProximityLight?view=mixed-reality-toolkit-unity-2019-dotnet-2.8.0&preserve-view=true) illuminate a [material](https://docs.unity3d.com/ScriptReference/Material.html) will increase pixel shader instructions and will impact performance. Please profile these changes within your project.

*How to increase the number of available [`ProximityLights`](xref:Microsoft.MixedReality.Toolkit.Utilities.ProximityLight?view=mixed-reality-toolkit-unity-2019-dotnet-2.8.0&preserve-view=true)
 from two to four.*

```C#
// 1) Within MRTK/Core/StandardAssets/Shaders/MixedRealityStandard.shader change:

#define PROXIMITY_LIGHT_COUNT 2

// to:

#define PROXIMITY_LIGHT_COUNT 4

// 2) Within MRTK/Core/Utilities/StandardShader/ProximityLight.cs change:

private const int proximityLightCount = 2;

// to:

private const int proximityLightCount = 4;
```

> [!NOTE]
> If Unity logs a warning similar to below then you must restart Unity before your changes will take effect.
>
>`Property (_ProximityLightData) exceeds previous array size (24 vs 12). Cap to previous size.`

## See also

* [MRTK Standard Shader](mrtk-standard-shader.md)

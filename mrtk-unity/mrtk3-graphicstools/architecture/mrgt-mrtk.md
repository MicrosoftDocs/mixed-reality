---
title: Connection between Mixed Reality Toolkit to Graphics Tools
description: How MRGT and MRTK integrate. 
author: Cameron-Micka
ms.author: thmicka
ms.date: 05/31/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Graphics Tools, MRGT, MR Graphics Tools
---

# Connection between Mixed Reality Toolkit (MRTK) to Graphics Tools

The MRTK is authored as a collection of [Unity packages](https://docs.unity3d.com/Manual/PackagesList.html) that can be chosen as needed. Some developers may chose to use all of MRTK's packages, while others may need only a subset. When choosing a subset, Unity's package manager will automatically pull in dependencies outlined by a package. Graphics Tools sits as substrate to many MRTK packages, especially if the package contains any visuals displayed to the user (materials, shaders, etc.).

Due to the dependency described above, many MRTK packages depend on Graphics Tools and Graphics Tools doesn't depend on any other MRTK packages.

## Dependencies

Graphics Tools only depends on Unity packages (and no other third party packages). The list of Unity dependencies can be found on the editor and runtime assembly definitions.

Most features within Graphics Tools work with Unity's built-in render pipeline or [Universal Render Pipeline](https://docs.unity3d.com/Packages/com.unity.render-pipelines.universal@11.0/manual/)(URP). If a script requires the URP be installed within the project, it's wrapped in the `GT_USE_URP` preprocessor. Similarly, all shader code that requires the URP is conditionally compiled with the following syntax:

```HLSL
PackageRequirements
{
    "com.unity.render-pipelines.universal": "x.y.z"
}  
```

## See also

* [Graphics Tools overview](overview.md)

---
title: Contributing to MR Graphics Tools -- MRTK3
description: How to contribute to the Mixed Reality Graphics Tools
author: tayomadein
ms.author: omadein
ms.date: 05/05/2022
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Graphics Tools, MRGT, MR Graphics Tools, Bug report,
---

# Contributing to Graphics Tools -- MRTK3

## Updating the package

1. Fork the [repository](https://github.com/microsoft/MixedReality-GraphicsTools-Unity) and make a branch. Recommended branch naming is `user/username/feature`.
2. Clone and open the `GraphicsToolsUnityProject` example project in Unity.
3. Make any desired changes. By default all edits within the `MRTK Graphics Tools` package will be published to the Graphics Tools package. (If you would like to update the samples, see the below section.)
4. Push your branch up to your fork and create a pull request. Add a description of changes to the pull request. Images and gifs are always appreciated.

## Updating the package samples

Samples exist under the *Samples~* subfolder as outlined by Unity's [sample recommendations](https://docs.unity3d.com/Manual/cus-samples.html). The '~' character prevents the *Samples~* folder for being imported by Unity. This is ideal when including the package via the package manager. But, not when you want to update the samples *within* the package.

If you wish to contribute changes to the samples, you must make a temporary local change to the Unity project's directory structure.

1. Open the *GraphicsToolsUnityProject* in Unity. The *Samples* folder won't be visible in the `MRTK Graphics Tools` package by default. To show the samples select **Window > Graphics Tools > Show Samples** from the file menu bar.
2. Make any desired changes to the samples.
3. Important: When finished and before committing your changes, remember to hide the samples. Select **Window > Graphics Tools > Hide Samples** from the file menu bar.

>[!TIP]
> Failing to invoke the **Window > Graphics Tools > Hide Samples** menu item after editing samples will result in git thinking all sample files have changed. Once samples are hidden the actual files changed should be apparent in git.

---
title: Contributing to MR Graphics Tools
description: How to contribute to the Mixed Reality Graphics Tools
author: tayo-madein
ms.author: omadein
ms.date: 05/05/2022
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, Graphics Tools, MRGT, MR Graphics Tools, Bug report,
---

# Contributing to MR Graphics Tools

## Updating the package

1. Clone the repository and make a branch. Recommended branch naming is `user/username/feature`.
2. Open the `MRGTUnityProject` in Unity.
3. Make any desired changes. By default all edits within the `MRTK Graphics Tools` package will be published to the Graphics Tools package. (If you would like to update the samples please see the below section.)
4. **Important:** Bump the package.json file's `version` field. The package.json file is found in the `MRGT` folder at the root of this repository.
5. Push your branch up to the repository and create a pull request.

## Updating the package samples

Samples exist under the `Samples~` subfolder as outlined by Unity's [sample recommendations](https://docs.unity3d.com/Manual/cus-samples.html). The '~' character prevents the `Samples~` folder for being imported by Unity. This is ideal when including the package via the package manager. But, not when you want to update the samples *within* the package.

If you wish to contribute changes to the samples you must make a temporary local change to the Unity project's directory structure.

1. Open the `MRGTUnityProject` in Unity. The `Samples` folder will not be visible in the `MRTK Graphics Tools` package by default. To show the samples select `Window > Graphics Tools > Show Samples` from the file menu bar.
2. Make any desired changes to the samples.
3. **Important:** When finished and before committing your changes, remember to hide the samples. Select `Window > Graphics Tools > Hide Samples` from the file menu bar.

## License agreement

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit [contributor license agreement](https://cla.opensource.microsoft.com).

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

---
title: Known issues in Unity versions and packages
description: Stay up to date on the known issues in Unity versions and packages.
author: vtieto
ms.author: vinnietieto
ms.date: 03/30/2022
ms.topic: article

keywords: mixed reality, unity, versions, issues, bugs, packages
ms.localizationpriority: high
---

# Known issues in Unity versions and packages

Some versions of Unity or Unity plugins have known incompatibilities blocking apps from working as expected on HoloLens 2 or Windows Mixed Reality devices.  While we generally support all LTS versions of Unity and their verified plugins, we recommend avoiding those specific builds of Unity and Unity plugins to ensure your apps work as expected.

[!INCLUDE[](includes/xr/recommended-version.md)]

## Active blocking issues

<!-- When updating this table, BE SURE TO ALSO UPDATE /develop/unity/includes/xr/recommended-version.md! -->

| Blocking&nbsp;issues | Status&nbsp;&&nbsp;Last&nbsp;Update | &nbsp;&nbsp;Versions&nbsp;with&nbsp;issue&nbsp;&nbsp; | &nbsp;&nbsp;Mitigation&nbsp;&nbsp; |
| :----------- | :----- | :--------------: | :--------------: |
| HL2 app using Unity's Burst package (e.g. commonly used when using URP) will [hit ILCPP compile error in VisualStudio](https://issuetracker.unity3d.com/issues/build-fails-with-error-mono-dot-cecil-dot-assemblyresolutionexception-failed-to-resolve-assembly-when-unity-iap-is-in-the-project). | **Investigating:**<br />2022/05/20 | Unity Burst package 1.6.5 <br/>1.7.* or 1.8.* | Use Burst package 1.6.4 instead. |
| HL2 app using URP, WindowsXR plugin and Gamma color space rendering has worse render performance in Unity 2020 or later. | **Investigating:**<br />2022/05/06 | Unity 2020.\*.\* <br/> with URP 10.\*.\* <br/> and&nbsp;Windows&nbsp;XR&nbsp;Plugin&nbsp;4.\*.\*| Upgrade to OpenXR Plugin instead of WindowsXR plugin |
| HL2 app using URP has worse render performance in Unity 2021 compared to Unity 2020. | **Investigating:**<br />2022/05/06 | Unity 2021.\*.\* <br/> with URP 12.\*.\* | Either avoid URP in Unity&nbsp;2021 or use URP in Unity&nbsp;2020.LTS |

## Resolved blocking issues

| Blocking&nbsp;issues | Status&nbsp;&&nbsp;Last&nbsp;Update | &nbsp;&nbsp;Versions&nbsp;with&nbsp;issue&nbsp;&nbsp; | &nbsp;&nbsp;Versions&nbsp;with&nbsp;fixes&nbsp;&nbsp; |
| :----------- | :----- | :--------------: | :--------------: |
| Application with default splash screen will show four spinning dots when launching on HL2, or after suspend and resume the application. | **Fixed:**<br />2022/05/20 | Unity&nbsp;2020.3.32-34f1&nbsp;</br>and Unity&nbsp;2021.2.17~19f1 and Unity&nbsp;2021.3.0~3f1| Use Unity&nbsp;2020.3.35f1 or Unity&nbsp;2021.3.4f1 or later |
| HL2 application shows severely jittery image. | **Fixed:**<br />2021/12/02 | Unity 2020.3.21f1 to <br />Unity 2020.3.23f1 | Use Unity 2020.3.24f1<br /> and later |
| OpenXR backend with URP can deadlock on HL2. | **Fixed:**<br />2021/05/13 | Unity 2020.3.0f1 to <br />Unity 2020.3.7f1 | Use Unity 2020.3.8f1<br /> and later |


---
title: Known issues in Unity versions and packages
description: Stay up to date on the known issues in Unity versions and packages.
author: vtieto
ms.author: vinnietieto
ms.date: 01/13/2023
ms.topic: article

keywords: mixed reality, unity, versions, issues, bugs, packages
ms.localizationpriority: high
---

# Known issues in Unity versions and packages

Some versions of Unity or Unity plugins have known incompatibilities blocking apps from working as expected on HoloLens 2 or Windows Mixed Reality devices. While we generally support all LTS versions of Unity and their verified plugins, we recommend avoiding those specific builds of Unity and Unity plugins to ensure your apps work as expected.

[!INCLUDE[](includes/xr/recommended-version.md)]

## Active blocking issues

<!-- When updating this table, BE SURE TO ALSO UPDATE /develop/unity/includes/xr/recommended-version.md! -->

| Blocking&nbsp;issues | Status&nbsp;&&nbsp;Last&nbsp;Update | &nbsp;&nbsp;Versions&nbsp;with&nbsp;issue&nbsp;&nbsp; | &nbsp;&nbsp;Mitigation&nbsp;&nbsp; |
| :----------- | :----- | :--------------: | :--------------: |
| HL2 app using URP has worse render performance in Unity 2022 compared to Unity 2021 when using the default URP Lit material. | **Investigating:**<br />2023/01/04 | Unity 2022.\*.\* <br/> with URP 13.\*.\* | Either avoid URP in Unity 2022, avoid using the default URP materials or use URP in Unity 2021.3.14+ |

## Resolved blocking issues

| Blocking&nbsp;issues | Status&nbsp;&&nbsp;Last&nbsp;Update | &nbsp;&nbsp;Versions&nbsp;with&nbsp;issue&nbsp;&nbsp; | &nbsp;&nbsp;Versions&nbsp;with&nbsp;fixes&nbsp;&nbsp; |
| :----------- | :----- | :--------------: | :--------------: |
| HL2 app using URP has worse render performance in Unity 2021 compared to Unity 2020. | **Fixed:**<br />2023/01/13 | Unity 2021.\*.\* <br/> with URP 12.\*.\* | Use Unity 2021.3.14f1 and later |
| Building application via IL2CPP in Unity fails due to [compilation errors](https://issuetracker.unity3d.com/issues/il2cpp-windows-builds-fails-when-using-vs-2022-17-dot-4-0-preview). For more information on the root cause, refer to the discussion [here](https://developercommunity.visualstudio.com/t/stdext::hash_compare-has-been-removed-in/10182319). | **Fixed:**<br />2022/11/10 | Visual Studio&nbsp;2022<br />version 17.4+ with<br />Unity versions <<br />2020.3.42f1, 2021.3.14f1, 2022.1.23f1, 2022.2.0b16 and 2023.1.0a19 | Use Visual Studio&nbsp;2019 or Unity version >= 2020.3.42f1, 2021.3.14f1, 2022.1.23f1, 2022.2.0b16 or 2023.1.0a19 |
| Holographic App Remoting remoting app using Unity's OpenXR plugin 1.5.1 fails to connect to remoting player if the hosting PC doesn't have other VR headsets attached. | **Fixed:**<br />2022/10/04 | Unity 2020 or Unity 2021 <br/> with Unity&nbsp;OpenXR&nbsp;plugin&nbsp;=<br/>1.5.0, 1.5.1 and 1.5.2 | If using Holographic App Remoting, use Unity&nbsp;OpenXR&nbsp;plugin&nbsp;<= 1.4.3&nbsp;or&nbsp;>=&nbsp;1.5.3|
| ARM32 UWP Unity apps built in release mode using Visual Studio&nbsp;2022 will [hit an internal compiler error in Visual Studio](https://developercommunity.visualstudio.com/t/uwp-arm-32-build-fails-with-fatal-error-c1001-inte/1697106#T-N10059007). | **Fixed:**<br />2022/08/09 | Visual Studio&nbsp;2022<br />version 17.1.1+ | Use Visual Studio&nbsp;2019 or Visual&nbsp;Studio&nbsp;2022&nbsp;version >= 17.3.* |
| HL2 app using URP, WindowsXR plugin and Gamma color space rendering has worse render performance in Unity 2020 or later. | **Fixed:**<br />2022/06/15 | Unity 2020.\*.\* <br/> with URP 10.\*.\* <br/> and&nbsp;Windows&nbsp;XR&nbsp;Plugin&nbsp;<=4.6.3| Use Windows&nbsp;XR&nbsp;Plugin&nbsp;version&nbsp;>=&nbsp;4.6.4 |
| HL2 app using Unity's Burst package (e.g. commonly used when using URP) will [hit ILCPP compile error in VisualStudio](https://issuetracker.unity3d.com/issues/build-fails-with-error-mono-dot-cecil-dot-assemblyresolutionexception-failed-to-resolve-assembly-when-unity-iap-is-in-the-project). | **Fixed:**<br />2022/06/06 | Unity Burst package <br/> 1.6.5, 1.7.0 or 1.7.1 | Use Unity Burst package 1.6.6 or 1.7.2 or later versions. |
| Application with default splash screen will show four spinning dots when launching on HL2, or after the application is suspended and resumed. | **Fixed:**<br />2022/05/20 | Unity&nbsp;2020.3.32-34f1&nbsp;</br>and Unity&nbsp;2021.2.17~19f1 and Unity&nbsp;2021.3.0~3f1| Use Unity&nbsp;2020.3.35f1 or Unity&nbsp;2021.3.4f1 or later |
| HL2 application shows severely jittery image. | **Fixed:**<br />2021/12/02 | Unity 2020.3.21f1 to <br />Unity 2020.3.23f1 | Use Unity 2020.3.24f1<br /> and later |
| OpenXR backend with URP can deadlock on HL2. | **Fixed:**<br />2021/05/13 | Unity 2020.3.0f1 to <br />Unity 2020.3.7f1 | Use Unity 2020.3.8f1<br /> and later |


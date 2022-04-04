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

Some versions of Unity or Unity plugins have known incompatibilities blocking apps from working as expected on HoloLens 2 or Windows Mixed Reality devices.  While we generally support all LTS versions of Unity 2020 and their verified plugins, we recommend avoiding those specific builds of Unity and Unity plugins to ensure your apps work as expected.

[!INCLUDE[](includes/xr/recommended-version.md)]

## Blocking issues table

| Blocking issues | Status | &nbsp;&nbsp;Versions&nbsp;with&nbsp;issue&nbsp;&nbsp; | &nbsp;&nbsp;Version&nbsp;with&nbsp;fix&nbsp;&nbsp; |
| :----------- | :----- | :--------------: | :--------------: |
| Application with default splash screen will show four spinning dots when launching on HL2. | **Investigating:**<br />2022/03/25 | <p><span style="color:darkred">Unity 2020.3.32f1</span></p><span style="color:darkred">Unity 2021.2.17f1</span> | TBD |
| HL2 application shows severely jittery image. | **Fixed:**<br />2021/12/02 | <span style="color:darkred">Unity 2020.3.21f1-<br />Unity 2020.3.23f1</span> | Unity 2020.3.24f1<br /> and later |
| OpenXR application has severe performance issues | **Fixed:**<br />2021/05/13 | <span style="color:darkred">Unity 2020.3.0f1-<br />Unity 2020.3.7f1</span> | Unity 2020.3.8f1<br /> and later |
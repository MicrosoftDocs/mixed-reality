---
title: Mixed Reality Toolkit 3 Developer Documentation
description: Learn about the Mixed Reality Toolkit 3 for developers.
author: MaxWang-MS
ms.author: wangmax
ms.date: 6/3/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3
---

# Mixed Reality Toolkit 3

![MRTK_UX_v3_Cover.png](images/MRTK_UX_v3_Cover.png)

MRTK3 is the third generation of the Microsoft Mixed Reality Toolkit for Unity. It is a Microsoft driven open source project to accelerate cross-platform mixed reality development in Unity. This new version is built on top of Unity's XR Management system and XR Interaction Toolkit. Here are some of its functions:

* Provides the **cross-platform input system and building blocks for spatial interactions and UI**.
* Enables **rapid prototyping** via in-editor simulation that allows you to see changes immediately.
* Operates as an **extensible framework** that allows developers the ability to swap out core components.
* **Supports a wide range of platforms:**

| Platform | Supported Devices |
|---|---|
| OpenXR (Unity 2020.3.30+) | Microsoft HoloLens 2 <br> Meta Quest (experimental) <br> Windows Mixed Reality (experimental) <br> SteamVR (experimental) <br> Oculus Rift on OpenXR (experimental) |
| Windows | Traditional flat-screen desktop (experimental)
| And more coming soon! |

## Welcome to the MRTK3 Public Preview!

We hear your excitement, and we want to give you early access to our newest features and invite you to take part in shaping our future iterations through your feedback. MRTK3 is now in public preview, which represents our current snapshot in development. Some features are still missing, broken, or otherwise not at parity with MRTK 2.x. We appreciate your patience while we shape the future of MRTK and look forward to your feedback and suggestions. We’re excited to give you a glimpse of what is to come!

### Key improvements

**Architecture**

* Built on Unity XR Interaction Toolkit and the Unity Input System
* OpenXR focused
* Open-ended and flexible interaction paradigms

**Performance**

* Rewrote and redesigned most features and systems, from UX to input, to subsystems
* Zero per-frame memory allocation
* Tuned for maximum performance on HL2 and other resource-constrained mobile platforms

**User Interface**

* New interaction models (gaze-pinch indirect manipulation)
* Updated Mixed Reality Design Language
* Unity Canvas + 3D UX: production-grade dynamic auto-layout
* Unified 2D & 3D input for gamepad, mouse, and accessibility support
* Data binding for branding, theming, dynamic data, and complex lists

**Accessibility**

* Low vision aids
* Input assistance

**Long Term Support**

* OpenXR, Unity 2020.3 LTS, Unity’s XR Interaction Toolkit as minimum requirements

### What should this public preview be used for?

* Try out our newest features and build prototypes
* Familiarize yourself with XRI and the Unity infrastructure on top of which MRTK3 is built
* Evaluate the new packaging strategy and the a la carte dependency model
* Explore OpenXR compatibility and features
* Learn about our new UX systems and visual design language

### What should this public preview _not_ be used for?

* Migrating any existing projects from 2.x to MRTK3. The current API instability may make a migration effort frustrating.
* Writing production-ready code that expects a stable API
* Evaluate performance for your applications (Full release may have significant performance differences compared to the codebase today)

## Software Requirements

To acquire and use MRTK3, the following software tools are required.

| Software | Version | Notes
| --- | --- | --- |
| [Microsoft Visual Studio](https://visualstudio.microsoft.com/) | 2019 Community edition or greater | Recommend Visual Studio 2022 |
| Unity | 2020.3, 2021.3 or newer | Recommend using an LTS release |
| [Mixed Reality Feature Tool for Unity](https://aka.ms/mrfeaturetool) | | Used to acquire MRTK3 packages |
| Mixed Reality OpenXR Plugin | | Install via Mixed Reality Feature Tool |

## Versioning

In previous versions of MRTK (HoloToolkit and MRTK v2), all packages were released as a complete set, marked with the same version number (ex: 2.8.0). Starting with MRTK3, each package will be individually versioned, following the [Semantic Versioning 2.0.0 specification](https://semver.org/spec/v2.0.0.html). 

>[!NOTE]
>The '3' in MRTK3 is not a version number. It is an indicator of the generation of the underlying architecture, with HoloToolkit being generation one and MRTK v2.x being generation two.

Individual versioning will enable faster servicing while providing improved developer understanding of the magnitude of changes and reducing the number of packages needing to be updated to acquire the desired fix(es).

For example, if a non-breaking new feature is added to the UX core package, which contains the logic for user interface behavior the minor version number will increase (from 3.0.x to 3.1.0). Since the change is non-breaking, the UX components package, which depends upon UX core, is not required to be updated. 

As a result of this change, there is not a unified MRTK3 product version.

To help identify specific packages and their versions, MRTK3 provides an about dialog that lists the relevant packages included in the project. To access this dialog, select `Mixed Reality` > `MRTK3` > `About MRTK` from the Unity Editor menu.

## Branch Status

MRTK3 is currently in public preview and it is not recommended for use in production projects. We appreciate your testing, issues and feedback while the team works towards general availability (GA).

### Early preview packages

Some parts of MRTK3 are at earlier stages of the development process than others. Early preview packages can be identified in the Mixed Reality Feature Tool and Unity Package Manager by the `Early Preview` designation in their names.

As of June 2022, the following components are considered to be in early preview.

| Name | Package Name |
| --- | --- |
| Accessibility | com.microsoft.mrtk.accessibility |
| Data Binding and Theming | com.microsoft.mrtk.data |
| Environment | com.microsoft.mrtk.environment |
 
The MRTK team is fully committed to releasing this functionality. It is important to note that the packages may not contain the complete feature set that is planned to be released or they may undergo major, breaking architectural changes before release.

We very much encourage you to provide any and all feedback to help shape the final form of these early preview features.

## UX building blocks

:::row:::
    :::column:::
       [![MRTK_UX_v3_Button.png](images/UXBuildingBlocks/MRTK_UX_v3_Button.png)](../mrtk3-uxcomponents/packages/uxcomponents/button.md)
        **[Button](../mrtk3-uxcomponents/packages/uxcomponents/button.md)**<br>
        A volumetric button optimized for a wide range of input modalities, including poking, gaze-pinch, ray interactions, mouse click, and gamepad.
    :::column-end:::
    :::column:::
        [![MRTK_UX_v3_BoundsControl.png](images/UXBuildingBlocks/MRTK_UX_v3_BoundsControl.png)](../mrtk3-spatialmanipulation/packages/spatialmanipulation/bounds-control.md)
        **[Bounds Control](../mrtk3-spatialmanipulation/packages/spatialmanipulation/bounds-control.md)**<br>
        Intent feedback and precision manipulation affordances.
    :::column-end:::
    :::column:::
        [![MRTK_UX_v3_ObjectManipulator.png](images/UXBuildingBlocks/MRTK_UX_v3_ObjectManipulator.png)](../mrtk3-spatialmanipulation/packages/spatialmanipulation/object-manipulator.md)
        **[Object Manipulator](../mrtk3-spatialmanipulation/packages/spatialmanipulation/object-manipulator.md)**<br>
        Move and manipulate objects with one or two hands with a wide variety of input modalities.
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
       [![MRTK_UX_v3_HandMenu.png](images/UXBuildingBlocks/MRTK_UX_v3_HandMenu.png)](../mrtk3-uxcomponents/packages/uxcomponents/hand-menu.md)
        **[Hand Menu](../mrtk3-uxcomponents/packages/uxcomponents/hand-menu.md)**<br>
        A hand-anchored collection of UX controls for easy access to quick actions.
    :::column-end:::
    :::column:::
        [![MRTK_UX_v3_NearMenu.png](images/UXBuildingBlocks/MRTK_UX_v3_NearMenu.png)](../mrtk3-uxcomponents/packages/uxcomponents/near-menu.md)
        **[Near Menu](../mrtk3-uxcomponents/packages/uxcomponents/near-menu.md)**<br>
        Collection of UX controls can be manipulated, pinned, and set to follow the user.
    :::column-end:::
    :::column:::
        [![MRTK_UX_v3_Slider.png](images/UXBuildingBlocks/MRTK_UX_v3_Slider.png)](../mrtk3-uxcomponents/packages/uxcomponents/slider.md)
        **[Slider](../mrtk3-uxcomponents/packages/uxcomponents/slider.md)**<br>
        Adjust a value along a one-dimensional axis.
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
       [![MRTK_Solver_Main.png](images/UXBuildingBlocks/MRTK_Solver_Main.png)](../mrtk3-spatialmanipulation/packages/spatialmanipulation/solver.md)
        **[Solver](../mrtk3-spatialmanipulation/packages/spatialmanipulation/solver.md)**<br>
        Various object positioning behaviors such as tag-along, body-lock, constant view size and surface magnetism
    :::column-end:::
    :::column:::
        [![MRTK_UX_v3_Dialog.png](images/UXBuildingBlocks/MRTK_UX_v3_Dialog.png)](../mrtk3-uxcomponents/packages/uxcomponents/dialog.md)
        **[Dialog](../mrtk3-uxcomponents/packages/uxcomponents/dialog.md)**<br>
        Prompt for user action.
    :::column-end:::
    :::column:::
        [![MRTK_UX_v3_Slate.png](images/UXBuildingBlocks/MRTK_UX_v3_Slate.png)](../mrtk3-uxcomponents/packages/uxcomponents/slate.md)
        **[Slate](../mrtk3-uxcomponents/packages/uxcomponents/slate.md)**<br>
        A flat panel for displaying large-format interfaces and content.
    :::column-end:::
:::row-end:::

## Roadmap

The roadmap from public preview to GA is detailed in the following table.

| Release | Timeline |
| --- | --- |
| Public Preview | June 8, 2022 |
| Preview updates | Approximately every 2-4 weeks until GA |
| General Availability | Fall / Winter 2022 |

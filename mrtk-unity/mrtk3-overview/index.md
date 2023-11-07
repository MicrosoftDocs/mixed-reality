---
title: Mixed Reality Toolkit 3 Developer Documentation
description: Learn about Mixed Reality Toolkit 3 for developers.
author: marlenaklein-msft
ms.author: marlenaklein
ms.date: 8/30/2023
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3
---

# Mixed Reality Toolkit 3

![MRTK3 banner](images/MRTK_UX_v3_Cover.png)

MRTK3 is the third generation of Microsoft Mixed Reality Toolkit for Unity. It's a Microsoft-driven open-source project to accelerate cross-platform mixed reality development in Unity. This new version is built on top of Unity's XR Management system and XR Interaction Toolkit. Here are some of its functions:

* Provides the **cross-platform input system and building blocks for spatial interactions and UI**.
* Enables **rapid prototyping** via in-editor simulation that allows you to see changes immediately.
* Operates as an **extensible framework** that allows developers the ability to swap out core components.
* **Supports a wide range of platforms:**

| Platform | Supported Devices |
|---|---|
| OpenXR XR devices | Microsoft HoloLens 2 <br> Meta Quest (experimental) <br> Windows Mixed Reality (experimental) <br> SteamVR (experimental) <br> Oculus Rift on OpenXR (experimental) <br> Lenovo ThinkReality A3 (with [Qualcomm Snapdragon Spaces](https://docs.spaces.qualcomm.com/unity/samples/preview/MRTK3SampleWinOnly.html) - experimental) |
| Windows | Traditional flat-screen desktop (experimental)
| And more coming soon! |

## Welcome to the MRTK3

[Mixed Reality Toolkit Organization](https://github.com/MixedRealityToolkit) currently maintains MRTK3, and released MRTK3 for general availability (GA). We encourage all new HoloLens applications to be built with MRTK3.

### Key improvements

**Architecture**

* Built on Unity XR Interaction Toolkit and the Unity Input System.
* OpenXR focused.
* Open-ended and flexible interaction paradigms.

**Performance**

* Rewrote and redesigned most features and systems, from UX to input to subsystems.
* Zero per-frame memory allocation.
* Tuned for maximum performance on HoloLens 2 and other resource-constrained mobile platforms.

**User Interface**

* New interaction models (gaze-pinch indirect manipulation).
* Updated Mixed Reality Design Language.
* Unity Canvas + 3D UX: production-grade dynamic auto-layout.
* Unified 2D & 3D input for gamepad, mouse, and accessibility support.
* Data binding for branding, theming, dynamic data, and complex lists.

**Accessibility (Early Preview)**

* Low vision aids.
* Input assistance.

**Long Term Support**

* Minimum requirements: OpenXR, Unity 2021.3 LTS and Unity 2022.3 LTS, Unity’s XR Interaction Toolkit.

## Versioning

In previous versions of MRTK (HoloToolkit and MRTK v2), all packages were released as a complete set, marked with the same version number (ex: 2.8.0). Starting with MRTK3, each package is individually versioned, following the [Semantic Versioning 2.0.0 specification](https://semver.org/spec/v2.0.0.html).

>[!NOTE]
>The '3' in MRTK3 is not a version number. It's an indicator of the generation of the underlying architecture, with HoloToolkit being generation one and MRTK v2.x being generation two.

Individual versioning will enable faster servicing while providing improved developer understanding of the magnitude of changes and reducing the number of packages needing to be updated to acquire the desired fix(es).

For example, if a non-breaking new feature is added to the UX core package that contains the logic for user interface behavior, the minor version number will increase (from 3.0.x to 3.1.0). Since the change is non-breaking, the UX components package, which depends upon UX core, is not required to be updated.

As a result of this change, there isn't a unified MRTK3 product version.

To help identify specific packages and their versions, MRTK3 provides an "about" dialog that lists the relevant packages included in the project. To access this dialog, in Unity on the menu bar, select `Mixed Reality` > `MRTK3` > `About MRTK`.

## Branch Status

[Mixed Reality Toolkit Organization](https://github.com/MixedRealityToolkit) currently maintains and updates MRTK3. We appreciate your feedback, and you can open bugs and feature request at the [Mixed Reality Toolkit for Unity](https://github.com/MixedRealityToolkit/MixedRealityToolkit-Unity) GitHub project.

### Early preview packages

Some parts of MRTK3 are at earlier stages of the development process than others. Early preview packages can be identified in the Mixed Reality Feature Tool and Unity Package Manager by the `Early Preview` designation in their names.

As of September 2023, the following components are considered to be in early preview.

| Name | Package Name |
| --- | --- |
| Accessibility | org.mixedrealitytoolkit.accessibility |
| Data Binding and Theming | org.mixedrealitytoolkit.data |

The MRTK team is fully committed to releasing this functionality. It's important to note that the packages may not contain the complete feature we're planning to release; they may undergo major, breaking architectural changes before release.

We very much encourage you to provide any and all feedback to help shape the final form of these early preview features.

## UX building blocks

:::row:::
    :::column:::
       [![Button](images/UXBuildingBlocks/MRTK_UX_v3_Button.png)](../mrtk3-uxcomponents/packages/uxcomponents/button.md)
        **[Button](../mrtk3-uxcomponents/packages/uxcomponents/button.md)**<br>
        A volumetric button optimized for a wide range of input modalities, including poking, gaze-pinch, ray interactions, mouse click, and gamepad.
    :::column-end:::
    :::column:::
        [![Bounds Control](images/UXBuildingBlocks/MRTK_UX_v3_BoundsControl.png)](../mrtk3-spatialmanipulation/packages/spatialmanipulation/bounds-control.md)
        **[Bounds Control](../mrtk3-spatialmanipulation/packages/spatialmanipulation/bounds-control.md)**<br>
        Intent feedback and precision manipulation affordances.
    :::column-end:::
    :::column:::
        [![Object Manipulator](images/UXBuildingBlocks/MRTK_UX_v3_ObjectManipulator.png)](../mrtk3-spatialmanipulation/packages/spatialmanipulation/object-manipulator.md)
        **[Object Manipulator](../mrtk3-spatialmanipulation/packages/spatialmanipulation/object-manipulator.md)**<br>
        Move and manipulate objects with one or two hands with a wide variety of input modalities.
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
       [![Hand Menu](images/UXBuildingBlocks/MRTK_UX_v3_HandMenu.png)](../mrtk3-uxcomponents/packages/uxcomponents/hand-menu.md)
        **[Hand Menu](../mrtk3-uxcomponents/packages/uxcomponents/hand-menu.md)**<br>
        A hand-anchored collection of UX controls for easy access to quick actions.
    :::column-end:::
    :::column:::
        [![Near Menu](images/UXBuildingBlocks/MRTK_UX_v3_NearMenu.png)](../mrtk3-uxcomponents/packages/uxcomponents/near-menu.md)
        **[Near Menu](../mrtk3-uxcomponents/packages/uxcomponents/near-menu.md)**<br>
        Collection of UX controls that can be manipulated, pinned, and set to follow the user.
    :::column-end:::
    :::column:::
        [![Slider](images/UXBuildingBlocks/MRTK_UX_v3_Slider.png)](../mrtk3-uxcomponents/packages/uxcomponents/slider.md)
        **[Slider](../mrtk3-uxcomponents/packages/uxcomponents/slider.md)**<br>
        Adjust a value along a one-dimensional axis.
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
       [![Solver](images/UXBuildingBlocks/MRTK_Solver_Main.png)](../mrtk3-spatialmanipulation/packages/spatialmanipulation/solvers/solver.md)
        **[Solver](../mrtk3-spatialmanipulation/packages/spatialmanipulation/solvers/solver.md)**<br>
        Various object positioning behaviors such as tag-along, body-lock, constant view size and surface magnetism
    :::column-end:::
    :::column:::
        [![Dialog](images/UXBuildingBlocks/MRTK_UX_v3_Dialog.png)](../mrtk3-uxcomponents/packages/uxcomponents/dialog.md)
        **[Dialog](../mrtk3-uxcomponents/packages/uxcomponents/dialog.md)**<br>
        Prompt for user action.
    :::column-end:::
    :::column:::
        [![Slate](images/UXBuildingBlocks/MRTK_UX_v3_Slate.png)](../mrtk3-uxcomponents-noncanvas/packages/uxcomponents-noncanvas/slate.md)
        **[Slate](../mrtk3-uxcomponents-noncanvas/packages/uxcomponents-noncanvas/slate.md)**<br>
        A flat panel for displaying large-format interfaces and content.
    :::column-end:::
:::row-end:::

### Figma Toolkit for MRTK3 Preview

The [prerelease of Figma Toolkit for MRTK3](https://www.figma.com/community/file/1145959192595816999) includes UI components based on Microsoft's new Mixed Reality Design Language introduced in MRTK3. You can use the 2D representations of the components in the design process for creating UI layouts and storyboards.

## Session videos from Microsoft Mixed Reality Dev Days 2022

:::row:::
    :::column:::
       [![Introducing MRTK3](images/MRDevDays/MRDD-June8-04-IntroducingMRTK3-1920x1080_w800.png)](/events/mixed-reality-dev-days/introducing-mrtk3-shaping-the-future-of-the-mr-developer-experience)
        **[Introducing MRTK3 – Shaping the future of the MR Developer Experience](/events/mixed-reality-dev-days/introducing-mrtk3-shaping-the-future-of-the-mr-developer-experience)**<br>
    :::column-end:::
    :::column:::
        [![Getting started with your first MRTK3 project](images/MRDevDays/MRDD-04-Getting%20StartedMRTK3-1920x1080_w800.png)](/events/mixed-reality-dev-days/getting-started-with-your-first-mrtk3-project/)
        **[Getting started with your first MRTK3 project](/events/mixed-reality-dev-days/getting-started-with-your-first-mrtk3-project/)**<br>
    :::column-end:::
    :::column:::
        [![MRTK3 Interaction building blocks](images/MRDevDays/MRDD-07-MRTK3BuildingBlocks-1920x1080_w800.png)](/events/mixed-reality-dev-days/mrtk3-interaction-building-blocks/)
        **[MRTK3 Interaction building blocks](/events/mixed-reality-dev-days/mrtk3-interaction-building-blocks/)**<br>
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
       [![Building Rich UI for MR in MRTK3](images/MRDevDays/MRDD-10-BuildingRichUI-1920x1080_w800.png)](/events/mixed-reality-dev-days/building-rich-ui-for-mr-in-mrtk3/)
        **[Building Rich UI for MR in MRTK3](/events/mixed-reality-dev-days/building-rich-ui-for-mr-in-mrtk3/)**<br>
    :::column-end:::
    :::column:::
        [![Working with Dynamic Data and Theming in MRTK3](images/MRDevDays/MRDD-12-WorkingWithDynamicData-1920x1080_w800.png)](/events/mixed-reality-dev-days/working-with-dynamic-data-and-theming-in-mrtk3)
        **[Working with Dynamic Data and Theming in MRTK3](/events/mixed-reality-dev-days/working-with-dynamic-data-and-theming-in-mrtk3)**<br>
    :::column-end:::
    :::column:::
        [![#Open - Deploy Everywhere with OpenXR and MRTK3](images/MRDevDays/MRDD-15-HashOpenDeploy-1920x1080_w800.png)](/events/mixed-reality-dev-days/open-deploy-everywhere-with-openxr-and-mrtk3)
        **[#Open - Deploy Everywhere with OpenXR and MRTK3](/events/mixed-reality-dev-days/open-deploy-everywhere-with-openxr-and-mrtk3)**<br>
    :::column-end:::
:::row-end:::

## Roadmap

The roadmap from public preview to general availability is detailed in the following table.  [Mixed Reality Toolkit Organization](https://github.com/MixedRealityToolkit) will announce future releases.

| Release | Timeline |
| --- | --- |
| Public Preview | June 8, 2022 |
| Preview updates | Approximately every 2-4 weeks until GA |
| General Availability | September 6, 2023 ([blog post](https://techcommunity.microsoft.com/t5/mixed-reality-blog/announcing-the-upcoming-general-availability-of-microsoft-mixed/ba-p/3833710)) |

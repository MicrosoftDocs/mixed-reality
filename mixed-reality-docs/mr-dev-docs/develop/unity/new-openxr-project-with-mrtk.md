---
title: Set up a new OpenXR project with MRTK
description: How to set up a new OpenXR project with MRTK.
author: sean-kerawala
ms.author: vinnietieto
ms.date: 6/7/2022
ms.topic: article
keywords: mixedrealitytoolkit, mixedrealitytoolkit-unity, mixed reality headset, windows mixed reality headset, virtual reality headset, unity, MRTK, unity
---

# Set up a new OpenXR project with MRTK

The easiest way to get your Unity project set up for mixed reality is with the [Mixed Reality Toolkit (MRTK)](/windows/mixed-reality/mrtk-unity). MRTK for Unity is an open-source, cross-platform development kit designed to make it easy to build amazing mixed reality applications.

   :::image type="content" source="images/MRTK_UX_Hero.png" alt-text="Infographic showing some of the features of the Mixed Reality Toolkit.":::

MRTK provides a cross-platform input system, foundational components, and common building blocks for spatial interactions. It can help you speed up your application development for Microsoft HoloLens, Windows Mixed Reality immersive (VR) headsets, and many other VR/AR devices. The project is aimed at reducing barriers to entry, enabling everyone to build mixed reality applications and contribute back to the community as we all grow.

MRTK supports a wide range of platforms, including:

- Microsoft HoloLens

- Microsoft HoloLens 2

- Windows Mixed Reality headsets

- OpenVR headsets (HTC Vive / Oculus Rift)

- Ultraleap Hand Tracking

- Android and iOS devices

>[!Note]
>We recently introduced MRTK3, the third generation of Microsoft Mixed Reality Toolkit for Unity built on top of Unity's XR Management system and XR Interaction Toolkit, with better support for a variety of OpenXR-compliant devices and a new design language. For more information, see the [MRTK3 documentation](/windows/mixed-reality/mrtk-unity/mrtk3-overview).

> [!NOTE]
> You can also [set up a new OpenXR project without MRTK](new-openxr-project-without-mrtk.md).

[!INCLUDE[](includes/xr/openxr-alternative-and-create-new-project.md)]

[!INCLUDE[](includes/xr/download-mrft.md)]

## Import the Mixed Reality Toolkit and OpenXR packages

1. In the Mixed Reality Feature Tool, select **Start**.

    :::image type="content" source="images/mixed-reality-feature-tool.png" alt-text="Screenshot of the Mixed Reality Feature Tool opening screen.":::

1. Select the Browse button (it's the "three-dot" button in the image below), then navigate to your project, and then open it.

    :::image type="content" source="images/002-open-your-project.png" alt-text="Open your project":::
     
    > [!NOTE]
    > The **Project Path** box in the Tool must contain a value, so it inserts a backslash ("\_") by default.

    After you select a folder, the Tool checks to ensure that it's a valid Unity project folder.

    :::image type="content" source="images/007-project-path.png" alt-text="Screenshot of the Mixed Reality feature Tool Project Path screen.":::
  
1. Select **Discover Features**.

    **Note**: You may need to wait a few seconds while the Tool refreshes the packages from the feeds.

1. On the **Discover Features** page, note that there is a list of six package groups.

    :::image type="content" source="images/003-mrft-groups.png" alt-text="The main groups of packages in the Mixed Reality Feature Tool":::

1. Click the "+" button to the left of **Mixed Reality Toolkit (0 of 10)** and then select the latest version of **Mixed Reality Toolkit Foundation**.

    > [!NOTE]
    > The Mixed Reality Toolkit Foundation package is the only package that must be imported and configured in order to use MRTK with your project. This package includes the core components required to create a mixed reality application.

1. Click the "+" button to the left of **Platform Support (0 of 5)** and then select the latest version of **Mixed Reality OpenXR Plugin**.
 
     :::image type="content" source="images/008-package-selections.png" alt-text="Screenshot of package selections in the Mixed Reality Feature Tool.":::

1. After you've made your selection(s), click **Get Features**.
1. Select **Validate** to validate the packages you selected. You should see a dialog that says **No validation issues were detected**. When you do, click **OK**.
1. On the **Import Features** page, the left-side column, **Features**, displays the packages you just selected. The right-side column, **Required dependencies**, displays any dependencies. You can click the **Details** link for any of these items to learn more about them.
1. When you're ready to move on, select **Import.** On the **Review and Approve** page, you can review information about the packages.
1. Select **Approve.**
1. Return to the Unity Editor and click a blank area in the UI. You'll see a progress bar showing you that your packages are being imported.

[!INCLUDE[](includes/xr/config-openxr-settings.md)]

You're now ready to begin developing with OpenXR in Unity!

### Unity sample projects

Check out the [OpenXR Mixed Reality samples repo](https://github.com/microsoft/OpenXR-Unity-MixedReality-Samples) for sample unity projects showcasing how to build Unity applications for HoloLens 2 or Mixed Reality headsets using the Mixed Reality OpenXR plugin.

## See also

- [Set up a new OpenXR project without MRTK](new-openxr-project-without-mrtk.md)
- [Add the Mixed Reality OpenXR Plugin to your existing Unity project](mixed-reality-openxr-plugin.md)

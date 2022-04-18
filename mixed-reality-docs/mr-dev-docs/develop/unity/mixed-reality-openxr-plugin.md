---
title: Add the Mixed Reality OpenXR Plugin to your Unity project
description: Learn how to add the Mixed Reality OpenXR Plugin to your Unity project.
author: satyapoojasama
ms.author: vinnietieto
ms.date: 03/24/2022
ms.topic: article
keywords: Unity, mixed reality, development, getting started, new project, Windows Mixed Reality, XR, Unity 2020, Unity 2019, OpenXR
---

# Add the Mixed Reality OpenXR Plugin to your Unity project

If you have a project that's already set up for OpenXR (you have the Unity OpenXR plugin installed) and you want to add the capability to target your app for the HoloLens 2, follow the instructions below.

**To determine if your project has the Mixed Reality OpenXR plugin installed**:

1. In Unity, select **Edit** > **Project Settings**.
1. Ensure that you're on the **XR Plug-in Management** page with the Universal Windows Platform settings (Windows logo tab) displayed.
1. If **Microsoft Hololens feature group"** is grayed out, the Mixed Reality OpenXR plugin isn't installed.

    :::image type="content" source="images/028-ms-hololens-feature-group.png" alt-text="Screenshot of XR Plug-in Management window.":::

## Download and install the Mixed Reality Feature Tool

The Mixed Reality OpenXR Plugin comes in the form of a package for Unity. The best way to discover, update, and import feature packages is with the Mixed Reality Feature Tool. You can search packages by name or category, see their dependencies, and view proposed changes to your project's manifest file before importing.

1. Download the latest version of the Mixed Reality Feature Tool from the [Microsoft Download Center](https://aka.ms/MRFeatureTool).
1. After the download finishes, unzip the file and save it to your desktop.

    > [!NOTE]
    > Before you can run the Mixed Reality Feature Tool, you must install the [.NET 5.0 runtime](https://dotnet.microsoft.com/download/dotnet/5.0)

1. In the unzipped folder, navigate to the executable file **MixedRealityFeatureTool.exe** and then use it to launch the Mixed Reality Feature Tool.

    :::image type="content" source="images/open-mixed-reality-feature-tool.png" alt-text="Screenshot of Opening MixedRealityFeatureTool.":::

## Import the Mixed Reality OpenXR Plugin

1. In the Mixed Reality Feature Tool, select **Start**.

    :::image type="content" source="images/mixed-reality-feature-tool.png" alt-text="Screenshot of the Mixed Reality Feature Tool opening screen.":::

1. Select the Browse button (it's the "three-dot" button in the image below), then navigate to your project, and then open it.

    :::image type="content" source="images/002-open-your-project.png" alt-text="Open your project":::
     
    > [!NOTE]
    > The **Project Path** box in the Tool must contain some value, so it inserts a backslash ("\_") by default.

    After you select a folder, the Tool checks to ensure that it's a valid Unity project folder.

    :::image type="content" source="images/007-project-path.png" alt-text="Screenshot of the Mixed Reality feature Tool Project Path screen.":::
  
1. Select **Discover Features**.

    **Note**: You may need to wait a few seconds while the Tool refreshes the packages from the feeds.

1. On the **Discover Features** page, note that there is a list of six package groups.

    :::image type="content" source="images/003-mrft-groups.png" alt-text="The main groups of packages in the Mixed Reality Feature Tool":::

1. Click the "+" button to the left of **Platform Support (0 of 5)** and then select the latest version of **Mixed Reality OpenXR Plugin**.
 
     :::image type="content" source="images/027-select-mr-openxr-plugin.png" alt-text="Screenshot of package selections in the Mixed Reality Feature Tool.":::

1. After you've made your selection(s), click **Get Features**.
1. Select **Validate** to validate the packages you selected. You should see a dialog that says **No validation issues were detected**. When you do, click **OK**.
1. On the **Import Features** page, the left-side column, **Features**, displays the packages you just selected. The right-side column, **Required dependencies**, displays any dependencies. You can click the **Details** link for any of these items to learn more about them.
1. When you're ready to move on, select **Import.** On the **Review and Approve** page, you can review information about the packages.
1. Select **Approve.**
1. Return to the Unity Editor and click a blank area in the UI. You'll see a progress bar showing you that your packages are being imported.

## Configure the project for the HoloLens 2

1. In Unity, ensure that you're in the **Project Settings** window, on the **XR Plug-in Management** page, and in the **Universal Windows Platform** tab.

1. There are now two feature groups underneath **OpenXR**. Select the first one, **Microsoft HoloLens feature group**.

1. Note that there's a yellow warning triangle next to **OpenXR**.  This indicates that you have incompatible settings that need to be resolved.

## Resolving incompatible settings

Hover your cursor over the triangle, then read the message in the popup, and then select the triangle.

    :::image type="content" source="images/014-yellow-triangle-warning.png" alt-text="Screenshot of warning about incompatible settings.":::

1. In the **OpenXR Project Validation** window, there are several issues listed. Select the **Fix All** button.

    :::image type="content" source="images/015-fix-all-button.png" alt-text="Screenshot of the Fix All button in the OpenXR Project Validation window.":::

1. One issue remains and tells you that you must add at least one interaction profile. To do so, click **Edit**. This takes you to the settings for the **OpenXR** plugin in the **Project Settings** window.

    :::image type="content" source="images/016-openxr-screen.png" alt-text="Screenshot of the Project Settings window with the OpenXR settings displayed.":::

1. Underneath **Interaction Profiles**, note the plus sign (+) button.

    :::image type="content" source="images/017-add-profile-button.png" alt-text="Screenshot of the Add Interaction Profile button.":::

1. Click the button three times, each time choosing a different profile:

    **Eye Gaze Interaction Profile**

    **Microsoft Hand Interaction Profile**

    **Microsoft Motion Controller Profile**

    :::image type="content" source="images/018-interaction-profiles.png" alt-text="Screenshot of interaction profiles that should be added.":::

    If the **Eye Gaze Interaction Profile**, or any other profile, appears with a yellow triangle next to it, select the triangle, and then in the **OpenXR Project Validation** window, click the **Fix** button. When you're finished, close the **OpenXR Project Validation** window.

    :::image type="content" source="images/019-fix-eye-gaze.png" alt-text="Screenshot of the Fix button for the Eye Gaze interaction profile.":::

1. In the **Project Settings** window under **OpenXR Feature Groups**, ensure that the following are selected:
   
   **Microsoft HoloLens**

   **Hand Tracking**

   **Motion Controller Model**

    :::image type="content" source="images/020-selected-features.png" alt-text="Screenshot of selected features for OpenXR.":::

1. Click the **Depth Submission Mode** drop down and then select **Depth 16 Bit**.

    :::image type="content" source="images/021-depth-submission-mode.png" alt-text="Screenshot of Depth 16 Bit selected for Depth Submission Mode.":::

    > [!TIP]
    > Reducing the Depth Format to 16-bit is optional, but it may improve graphics performance in your project. To learn more, see [Depth buffer sharing (HoloLens)](/windows/mixed-reality/mrtk-unity/performance/perf-getting-started#single-pass-instanced-rendering).

    > [!NOTE]
    > The **Render Mode** setting, located just above **Depth Submission Mode**, is set by default to **Single Pass Instanced**. In mixed reality apps, the scene is rendered twice: once for each eye. The result is "stereoscopic vision." This doubles the amount of necessary computing, so it's important to select the most efficient rendering path in Unity to save on both CPU and GPU time. Single pass instanced rendering is the best choice here--we recommend that you enable it by default for every project. To learn more about this, [see the Unity documentation](https://docs.unity3d.com/Manual/SinglePassInstancing.html).

1.  Close the **Project Settings** window.

## See also

- [Set up a new OpenXR project with MRTK](new-openxr-project-with-mrtk.md)
- [Set up a new OpenXR project without MRTK](new-openxr-project-without-mrtk.md)

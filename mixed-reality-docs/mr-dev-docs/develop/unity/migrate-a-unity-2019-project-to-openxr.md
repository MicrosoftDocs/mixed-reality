---
title: Migrate a Unity 2019 project to Unity 2020 + OpenXR
description: Learn how to setup your Unity projects with and without MRTK using Legacy built-in XR support.
author: vtieto
ms.author: v-vtieto
ms.date: 10/27/2021
ms.topic: article
keywords: Unity, mixed reality, development, getting started, new project, Windows Mixed Reality, XR, mrtk, Unity 2020, Unity 2019, OpenXR, migrate
---

# Migrate a Unity 2019 project to Unity 2020 + OpenXR

## Update MRTK to the latest stable version

If you’re already using MRTK, we suggest that the first step in your migration should be to run the Mixed Reality Feature Tool and update to the latest stable version of MRTK. If you're not already familiar with the Tool, [our instructions will guide you](mrft-basics-short-version.md). Those instructions are general; you'll need to know which package to select for importing in the Tool's UI. For our purposes here, once you're in the Tool, open the **Mixed Reality Toolkit** drop-down and select the latest version of **Mixed Reality Toolkit Foundation**.

By doing this upgrade while still using Unity 2019, you can view the MRTK Project Configurator and see any "deprecated API" warnings about how to get current. The warnings will tell you what to change. If you don't do this MRTK upgrade first, the old API might be gone and you won’t have those warnings.

## Move your project to Unity 2019 XR Plug-in Management

After you've updated MRTK, you can instruct Unity 2019 to use XR Plug-in Management.

1. In the Unity editor on the menu bar, select **Edit** > **Project Settings**.
1. In the left side column of the **Project Settings** window, select **XR Plugin Management**.

As this point, you might see a button labeled **Install XR Plugin Management** button. If so, continue on with the steps below. If you already have the XR management system installed, you can skip the rest of the steps in this section and continue on to the next section, "Choose 'Windows Mixed Reality'."

1. Click the **Install XR Plugin Management** button.
1. A dialog named **Built in VR Detected** appears and asks if you want to remove the built-in VR package.

002-built-in-vr

Click **Ok**.
1. The **Built in VR Enabled** dialog box appears. Click **Ok**. This disables built-in VR.
1. The **MRTK Project Configurator** window appears and requests that you enable an XR pipeline. Select the second option, **XR SDK/SR Management**.
1. On the next page in the Configurator, click **Show Settings**.

## Choose "Windows Mixed Reality"

We're not quite ready to install OpenXR yet, but this next set of steps helps you to get clean on any APIs that were only available and supported on the “Built-in XR” path. (If you’re using MRTK, most of this is abstracted for you.)

1. In the Unity Editor **Project Settings** window, ensure that you're on the **XR Plug-in Management** page.
1. Do one of the following:
- **If you're targeting the HoloLens 2:**  
Ensure that you're in the Universal Windows Platform tab (it's the second tab and displays the Windows logo) and then, under **Plug-in-Providers**, select **Windows Mixed Reality.**
- **If you're targeting Desktop VR:**  
Ensure that you're in the Desktop tab (it's the first tab and displays an image of a monitor), and then, under **Plug-in-Providers**, select **Windows Mixed Reality.**

<!-- You'll see an **Importing** dialog, and then, in the left-side column, **Windows Mixed Reality** is displayed under **XR Plug-in Management.** NOTE: I don't see "windows mixed reality" in the left-side column. -->

1. The **MRTK Project Configurator** window appears again. Click the **Next** button, and then click **Next** again. (You may want to take a moment to read the explanations on these pages before moving on.) <!-- Is this the right thing to do? Find out.>
1. Select **Import TMP Essentials**.
1. Select **Done**. This closes the Configurator.
1. Close the **Project Settings** window, save your project, and then exit Unity.

<!-- pic of dialog is at 31:37 -->

> [!NOTE]
> When you use XR Plug-in Management in Unity 2019, Azure Spatial Anchors (ASA) isn't supported. If your project has ASA code, you won’t be able to test it until after you've installed Unity 2020. Otherwise, you should be able to validate your app at this stage.

## Upgrade to Unity 2020.3 LTS

1. Install the [latest LTS patch release](choosing-unity-version.md) of Unity 2020.3.
1. Open your Unity 2019 project in Unity 2020.3.

You’ll see a dialog asking if you want to upgrade your project to a newer version of Unity. Click **CONFIRM**.

If you were previously using AR Foundation 2.0, the project will move you forward automatically to AR Foundation 4.0.

## Use the Mixed Reality Feature Tool to install more packages

As mentioned earlier, our [Mixed Reality Feature Tool instructions page](mrft-basics-short-version.md) gives you general information on how to use the Tool to import packages. You need to know which specific packages to select for importing. Once you're in the Tool, select the packages below.

1. If you’re using ASA, open the **Azure Mixed Reality Services** drop-down and select the latest version of **Azure Spatial Anchors SDK Core** and **Azure Spatial Anchors SDK for Windows**.
1. Open the **Platform Support** drop-down and select the latest version of **Mixed Reality OpenXR Plugin.**
1. After the packages load, a **Warning** dialog appears asking if you want to restart the Unity editor in order to enable backends. Select **Yes.**
1. When Unity reopens, the **MRTK Project Configurator** appears. Take a moment to read the explanations in the window, and then select **Apply**.
1. A dialog appears stating that Unity must be restarted for the input system to take effect. Select **Apply**.

## Configuring XR Plugin Management for OpenXR

After Unity reopens again, you can set OpenXR as the runtime:

1. On the menu bar, select **Edit** > **Project Settings**.

Look in the left-side column and ensure that you're on the **XR Plug-in Management** page and in the Universal Windows Platform tab (there's an image of the Windows logo on the tab).

1. In the **Plug-in Providers** list, select **OpenXR**.

    :::image type="content" source="images/010-plug-in-management.png" alt-text="Plug-in management":::

1. In the same section, select **Microsoft HoloLens feature group.**
1. Note that there's now a yellow warning triangle next to **OpenXR**. Hover your cursor over the triangle, then read the message in the popup, and then select the triangle.

    :::image type="content" source="images/011-warning-msg.png" alt-text="OpenXR warning message":::

1. In the **OpenXR Project Validation** window, there are several  issues listed. Select the **Fix All** button.

    :::image type="content" source="images/012-lock-input-fix.png" alt-text="Project Validation window":::

1. One issue remains and tells you that you must add at least one interaction profile. To do so, click **Edit.** This takes you to the settings for the **OpenXR** plugin in the **Project Settings** window.

    :::image type="content" source="images/013-openxr-features.png" alt-text="OpenXR Plugin settings":::

1. Select the plus sign (+) button three times, each time choosing a different profile:

    :::image type="content" source="images/022-add-profile-button.png" alt-text="Add Profiles plus-sign button":::

    **Eye Gaze Interaction Profile**

    **Microsoft Hand Interaction Profile**

    **Microsoft Motion Controller Profile**

    :::image type="content" source="images/014-profiles.png" alt-text="Interaction profiles":::

    If the **Eye Gaze Interaction Profile**, or any other profile, appears with a yellow triangle next to it, select the triangle, and then in the **OpenXR Project Validation** window, click the **Fix** button.

    :::image type="content" source="images/014B-fix-eye-gaze-profile.png" alt-text="Eye gaze interaction profiles":::

1. In the **OpenXR Feature Groups** section, select **Microsoft HoloLens**, and then select **Hand Tracking** and **Motion Controller Model** if they're not already selected.

    :::image type="content" source="images/015-features-selected.png" alt-text="OpenXR feature groups":::

1. Click the **Depth Submission Mode** drop down and then select **Depth 16 Bit**.

    :::image type="content" source="images/017-depth-sixteen-bit.png" alt-text="Debpth submission mode":::

1. Close the **Project Settings** window and any other windows that are still open.

Your project is now fully migrated.

## Configure Input Backend settings

1. After Unity has imported the package, a warning appears asking if you want to enable the backends by restarting the editor. Select **Yes**.

    :::image type="content" source="../../images/unity-restart-option.png" alt-text="Screenshot of Unity Restart Option.":::

## Configure the project for the HoloLens 2 via Project Validation (MR OpenXR 1.6+)

If you're developing for desktop VR, skip this section and go to [Configure the project for desktop VR](#configure-the-project-for-desktop-vr-via-project-validation-mr-openxr-19).

1. On the menu bar, click on **Mixed Reality > Project Validation Settings > HoloLens 2 Application (UWP)** to enable the validation rules for HoloLens 2.
   For MR OpenXR plugins before version 1.9, the menu item available is **Mixed Reality > Project > Apply recommended project settings for HoloLens 2**.
1. In the project validation window that pops up, make sure you're on the UWP platform tab (indicated by the Windows logo), and click **Fix all** to resolve the validation issues. Note that there may be issues that remain after clicking on **Fix all**. In that case, try clicking on **Fix all** again, ignore any issues that are marked "scene specific" (if any), and go through the rest of the issues (if any) to see if there are any suggested changes that you want to make.
1. The project is almost ready for HoloLens 2 deployment at this point. Proceed to [Configure Player settings](#configure-player-settings) for the next step.

## Configure the project for the HoloLens 2 manually

If you're developing for desktop VR, skip this section and go to [Configure the project for desktop VR](#configure-the-project-for-desktop-vr-via-project-validation-mr-openxr-19).

1. Make sure the **Project Settings** window is open. If not, on the menu bar, select **Edit** > **Project Settings**.
1. In the **Project Settings** window, ensure that you're on the **XR Plug-in Management** page and in the **Universal Windows Platform** tab.

    :::image type="content" source="../../images/012-xr-plugin-mgmt-page.png" alt-text="Screenshot of the Project Settings Window open to the XR Plugin Management Page and Universal Windows Platform tab.":::

 1. Ensure that **Initialize XR on Startup** is selected, and then, under **Plugin Providers**, click **OpenXR**.

    :::image type="content" source="../../images/013-init-xr-on-startup.png" alt-text="Screenshot of Project Settings Window, inside the Universal Windows Platform, with Initialize XR on Startup selected and the OpenXR Plugin highlighted.":::

1. The OpenXR Plugin loads, and then multiple items appear underneath **OpenXR**. Select **Microsoft HoloLens feature group**.

    :::image type="content" source="../../images/033-ms-hololens-feature-group.png" alt-text="Screenshot of Project Settings Window with with the OpenXR plugin and the Microsoft HoloLens Feature Group highlighted.":::

Note that there's a yellow warning triangle next to **OpenXR**. This indicates that you have incompatible settings that need to be resolved. To find out how to address this, skip the next section about configuring for VR and continue on with the following section, [Resolving incompatible settings](#resolving-incompatible-settings).

## Configure the project for desktop VR via Project Validation (MR OpenXR 1.9+)

1. On the menu bar, click on **Mixed Reality > Project Validation Settings > Win32 Application (Standalone)** to enable the validation rules for a desktop XR app.
1. In the project validation window that pops up, make sure you're on the Standalone platform tab, and click **Fix all** to resolve the validation issues. Note that there may be issues that remain after clicking on **Fix all**. In that case, try clicking on **Fix all** again, ignore any issues that are marked "scene specific" (if any), and go through the rest of the issues (if any) to see if there are any suggested changes that you want to make.

## Configure the project for desktop VR manually

1. Make sure the **Project Settings** window is open. If not, go to the menu bar, select **Edit** > **Project Settings**.
1. In the **Project Settings** window, ensure that you're on the **XR Plug-in Management** page and in the **PC, Mac & Linux Standalone** tab.

    :::image type="content" source="../../images/028-xr-plugin-mgmt-only.png" alt-text="Screenshot of the Project Settings Window open to the XR Plugin Management Page and PC, Mac & Linux Standalone tab.":::

 1. Ensure that **Initialize XR on Startup** is selected, and then, under **Plugin Providers**, click **OpenXR**.

    :::image type="content" source="../../images/031-init-xr-on-startup.png" alt-text="Screenshot of the Project Settings Window, inside the PC, Mac & Linux Standalone tab, with Initialize XR on Startup selected and the OpenXR Plugin highlighted.":::

1. The OpenXR Plugin loads, and then two items appear underneath **OpenXR**. Select the first one, **Windows Mixed Reality feature group**.

    :::image type="content" source="../../images/032-wmr-feature-group.png" alt-text="Screenshot of Project Settings Window the OpenXR Plugin and Windows Mixed Reality feature group highlighted.":::

Note that there's now a yellow warning triangle next to **OpenXR**. This indicates that you have incompatible settings that need to be resolved. To find out how to address this, continue to the next section, [Resolving incompatible settings](#resolving-incompatible-settings).

## Resolving incompatible settings

>[!IMPORTANT]
>The images in this section show the options in the Universal Windows Platform tab. However, the instructions are the same for the Desktop VR tab, except where noted.

1. Hover your cursor over the yellow warning triangle next to **OpenXR**, then read the message in the popup, and then select the triangle.

    :::image type="content" source="../../images/014-yellow-triangle-warning.png" alt-text="Screenshot of warning about incompatible settings.":::

1. In the **OpenXR Project Validation** window, there are several issues listed. Select the **Fix All** button. **NOTE**: This list may look different depending on which tab you're in.

    :::image type="content" source="../../images/015-fix-all-button.png" alt-text="Screenshot of the Fix All button in the OpenXR Project Validation window.":::

1. One issue remains and tells you that you must add at least one interaction profile. To do so, click **Edit**. This takes you to the settings for the **OpenXR** plugin in the **Project Settings** window.

    :::image type="content" source="../../images/016-openxr-screen.png" alt-text="Screenshot of the Project Settings window with the OpenXR settings displayed.":::

1. Underneath **Interaction Profiles**, note the plus sign (+) button.

    :::image type="content" source="../../images/017-add-profile-button.png" alt-text="Screenshot of the Add Interaction Profile button.":::

 1. Click the button three times, each time choosing a different profile:

    **Eye Gaze Interaction Profile**

    **Microsoft Hand Interaction Profile**

    **Microsoft Motion Controller Profile**

    :::image type="content" source="../../images/018-interaction-profiles.png" alt-text="Screenshot of interaction profiles that should be added.":::

    If the **Eye Gaze Interaction Profile**, or any other profile, appears with a yellow triangle next to it, select the triangle, and then in the **OpenXR Project Validation** window, click the **Fix** button. When you're finished, close the **OpenXR Project Validation** window.

    :::image type="content" source="../../images/019-fix-eye-gaze.png" alt-text="Screenshot of the Fix button for the Eye Gaze interaction profile.":::

1. In the **Project Settings** window under **OpenXR Feature Groups**, ensure that the following are selected:
   
    If you're in the Desktop VR tab:

    **Windows Mixed Reality**

    **Hand Tracking**

    **Motion Controller Model**

    :::image type="content" source="../../images/034-selected-features-standalone.png" alt-text="Screenshot of the OpenXR Feature Groups for the Desktop VR tab.":::

    If you're in the Universal Windows Platform tab:

   **Microsoft HoloLens**

   **Hand Tracking**

   **Motion Controller Model**

    :::image type="content" source="../../images/020-selected-features.png" alt-text="Screenshot of selected features for OpenXR.":::

1. Click the **Depth Submission Mode** drop down and then select **Depth 16 Bit**.

    :::image type="content" source="../../images/021-depth-submission-mode.png" alt-text="Screenshot of Depth 16 Bit selected for Depth Submission Mode.":::

    > [!TIP]
    > Reducing the Depth Format to 16-bit is optional, but it may improve graphics performance in your project. To learn more, see [Depth buffer sharing (HoloLens)](/windows/mixed-reality/mrtk-unity/performance/perf-getting-started#single-pass-instanced-rendering).

    > [!NOTE]
    > The **Render Mode** setting, located just above **Depth Submission Mode**, is set by default to **Single Pass Instanced**. In mixed reality apps, the scene is rendered twice: once for each eye. The result is "stereoscopic vision." This doubles the amount of necessary computing, so it's important to select the most efficient rendering path in Unity to save on both CPU and GPU time. Single pass instanced rendering is the best choice here--we recommend that you enable it by default for every project. To learn more about this, [see the Unity documentation](https://docs.unity3d.com/Manual/SinglePassInstancing.html).

## Configure Player settings

1. In the **Project Settings** window's left-side column, select **Player**.
1. Note that in the **Player** window, the **Product Name** box is already filled. This is taken from your project name and will be the name displayed in the HoloLens Start menu.

    :::image type="content" source="../../images/025-product-name.png" alt-text="Screenshot of Unity Publishing Settings with the Project Name box filled in.":::

    > [!TIP]
    > To make the app easier to locate during development, add an underscore in front of the name to sort it to the top of any list.

1. Click the **Publishing Settings** drop down, and then in the **Package name** field, enter a suitable name.

    :::image type="content" source="../../images/026-package-name.png" alt-text="Screenshot of Unity Publishing Settings with the package name box filled in.":::

    > [!NOTE]
    > The package name is the unique identifier for the app. If you want to avoid overwriting previously installed versions of the app with the same name, you should change this identifier before deploying the app.

1. Close the **Project Settings** window.

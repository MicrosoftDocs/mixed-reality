[!INCLUDE[](./download-mrft.md)]

## Import the Mixed Reality OpenXR Plugin

1. In the Mixed Reality Feature Tool, select **Start**.

    :::image type="content" source="../../images/mixed-reality-feature-tool.png" alt-text="Screenshot of the Mixed Reality Feature Tool opening screen.":::

1. Select the Browse button (it's the "three-dot" button in the image below), then navigate to the folder containing your Unity project, and then open it.

    :::image type="content" source="../../images/002-open-your-project.png" alt-text="Open your project":::
     
    > [!NOTE]
    > The **Project Path** box in the Tool must contain some value, so it inserts a backslash ("\_") by default.

    After you select a folder, the Tool checks to ensure that it's a valid Unity project folder.

    :::image type="content" source="../../images/007-project-path.png" alt-text="Screenshot of the Mixed Reality feature Tool Project Path screen.":::
  
1. Select **Discover Features**.

    **Note**: You may need to wait a few seconds while the Tool refreshes the packages from the feeds.

1. On the **Discover Features** page, note that there is a list of six package groups.

    :::image type="content" source="../../images/003-mrft-groups.png" alt-text="The main groups of packages in the Mixed Reality Feature Tool":::

1. Click the "+" button to the left of **Platform Support (0 of 5)** and then select the latest version of **Mixed Reality OpenXR Plugin**.
 
     :::image type="content" source="../../images/027-select-mr-openxr-plugin.png" alt-text="Screenshot of package selections in the Mixed Reality Feature Tool.":::

1. After you've made your selection(s), click **Get Features**.
1. Select **Validate** to validate the packages you selected. You should see a dialog that says **No validation issues were detected**. When you do, click **OK**.
1. On the **Import Features** page, the left-side column, **Features**, displays the packages you just selected. The right-side column, **Required dependencies**, displays any dependencies. You can click the **Details** link for any of these items to learn more about them.
1. When you're ready to move on, select **Import.** On the **Review and Approve** page, you can review information about the packages.
1. Select **Approve.**
1. Return to the Unity Editor and click a blank area in the UI. You'll see a progress bar showing you that the package is being imported.
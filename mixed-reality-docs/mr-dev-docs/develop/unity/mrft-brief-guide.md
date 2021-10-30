---
title: Use the Mixed Reality Feature Tool to import packages
description: Offers a brief guide on how to use the Mixed Reality Feature Tool to import packages into your Unity project.
ms.prod: mixed-reality
author: vtieto  
ms.author: v-vtieto
ms.date: 10/28/2021
ms.topic: article
keywords: mixed reality, development, Mixed Reality Feature tool, import, importing, packages, Unity
---

## Use the Mixed Reality Feature Tool to import packages into your Unity project

If you're already familiar with the Mixed Reality Feature Tool (MRFT) and just want a streamlined flow of steps to help you upload the packages you need, this article is for you. If you're new to the Tool, we recommend that you review our more detailed articles starting with [Welcome to the MR Feature Tool](link). The Tool is a very useful way to import packages and it's worth taking some time to fully understand its capabilities.

> [!NOTE]
> The descriptions and images in this article are based on the most recent version of the Tool. If the instructions don't match what you're seeing, check to ensure that you're not using an older version of the Tool.

1. Open the Microsoft Mixed Reality Feature Tool and then click the **Start** button.

    :::image type="content" source="media/001-mr-feature-tool.png" alt-text="Mixed Reality Feature Tool":::

1. Select the Browse button (it's the "three-dot" button in the image below), then navigate to your project, and then open it.

    :::image type="content" source="media/002-open-your-project.png" alt-text="Open your project":::

1. Select **Discover Features.**

**Note**: You may need to wait a few seconds while the Tool refreshes the packages from the feeds.

1. On the **Discover Features** page, note that there is a list of six package groups.

    :::image type="content" source="media/002-mrft-groups.png" alt-text="The main groups of packages in the Mixed Reality Feature Tool":::

<!-- end of part 1 -->

1. Click the "+" button to the left of a group that contains package(s) you want. This displays the packages in the group. For example, if you wanted to import the Mixed Reality OpenXR Plugin package, you would open the **Platform Support** group.

    :::image type="content" source="media/004-openxr-plugin.png" alt-text="Select Mixed Reality OpenXR Plugin":::

1. Select any packages in the group that you want to import. 
1. Follow these steps to open other groups and select any other packages that you want to import.
1. After you've made all your selections, click **Get Features**. 
1. On the **Import Features** page, the left-side column, **Features**, displays the packages you just selected. The right-side column, **Required dependencies**, displays any dependencies. You can click the **Details** link for any of these items to learn more about them.

    :::image type="content" source="media/005-import-features.png" alt-text="Import Features page":::

1. When you're ready to move on, select **Import.** On the **Review and Approve** page, you can review information about the packages.

    :::image type="content" source="media/006-review-and-approve.png" alt-text="Review and Approve your selections":::

1. Select **Approve.** The Feature Tool displays a message that says your project has been updated.
1. Return to the Unity Editor and click a blank in the UI. You'll see a message telling you that your packages are being imported.


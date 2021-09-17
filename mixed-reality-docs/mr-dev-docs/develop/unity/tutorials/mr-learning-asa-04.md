---
title: Displaying Azure Spatial Anchors feedback
description: Complete this course to learn how to display feedback from Azure Spatial Anchors in a mixed reality application.
author: vtieto
ms.author: jemccull
ms.date: 02/05/2021
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens, MRTK, mixed reality toolkit, UWP, Azure spatial anchors, sessions, feedback elements
ms.localizationpriority: high
ROBOTS: NOINDEX
---

# 4. Displaying feedback from Azure Spatial Anchors

In this tutorial, you will learn how to provide users with feedback about anchor discovery, events, and status using Azure Spatial Anchors (ASA).

## Objectives

* Learn how to set up a UI panel that displays essential information about the current ASA session
* learn about and explore feedback elements that the ASA SDK makes available to users

## Setting up ASA feedback panel

In the Hierarchy window, right-click on the **Instructions** > **TextContent** object. Select **3D Object** > **Text - TextMeshPro** to create a TextMeshPro text object as a child of the Instructions > TextContent object:

![Unity with newly created TextMeshPro object selected](images/mr-learning-asa/asa-04-section1-step1-1.png)

> [!TIP]
> To make it easier to work with your scene, set the  <a href="https://docs.unity3d.com/Manual/SceneVisibility.html" target="_blank">Scene Visibility</a> for the ParentAnchor object to off by clicking the eye icon to the left of the object. This hides the object in the Scene window without changing their in-game visibility.

Rename the newly created Text (TMP) object **Feedback**, then, in the Inspector window, change its position and size, so it is placed neatly underneath the instruction text, for example:

* Change the Rect Transform component's **Pos Y** to -0.24.
* Change the Rect Transform component's **Width** to 0.555.
* Change the Rect Transform component's **Height** to 0.1.

Then choose font properties, so the text fits nicely within the text area, for example:

* Change the TextMeshPro - Text component's **Font Style** to Bold.
* Change the TextMeshPro - Text component's **Font Size** to 0.17.
* Change the TextMeshPro - Text component's **Alignment** to Center and Middle.

![Unity with Feedback object configured](images/mr-learning-asa/asa-04-section1-step1-2.png)

In the Hierarchy window, select the **Feedback** object still, then in the Inspector window, use the **Add Component** button to add the **Anchor Feedback Script (Script)** component and configure it as follows:

* Assign the **Feedback** object itself to the **Anchor Feedback Script (Script)** component's **Feedback Text** field.

![Unity with Anchor Feedback Script component configured](images/mr-learning-asa/asa-04-section1-step1-3.png)

## Congratulations

In this tutorial, you learned how to create a UI panel. It displays the current status of the Azure Spatial Anchors experience for providing users with real-time feedback.

> [!div class="nextstepaction"]
> [Next Tutorial: 5. Azure Spatial Anchors for Android and iOS](mr-learning-asa-05.md)

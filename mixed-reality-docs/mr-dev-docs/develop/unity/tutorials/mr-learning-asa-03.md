---
title: Saving, retrieving, and sharing Azure Spatial Anchors
description: Complete this course to learn how to save, retrieve, and share Azure Spatial Anchors in a mixed reality application.
author: vtieto
ms.author: jemccull
ms.date: 02/05/2021
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens, MRTK, mixed reality toolkit, UWP, Azure spatial anchors, app sessions
ms.localizationpriority: high
ROBOTS: NOINDEX
---

# 3. Saving, retrieving, and sharing Azure Spatial Anchors

In this tutorial, you will learn how to save Azure Spatial Anchors across multiple app sessions by saving the anchor ID to the HoloLens 2's storage. You will also learn how to share this anchor ID to other devices for a multi-device anchor alignment.

## Objectives

* Learn how to achieve spatial alignment across multiple app sessions.
* Learn how to achieve spatial alignment between multiple devices.

## Preparing the scene

In the Hierarchy window, expand the **ButtonParent** object. Select the **last four child button** objects. In the Inspector window, **check** the checkbox next to the name field to make all the objects active.

![Unity with previously inactive button objects selected and active](images/mr-learning-asa/asa-03-section1-step1-1.png)

In the Hierarchy window, select the **ButtonParent** objects. Then in the Inspector window, locate the **GridObjectCollection** component and click the **Update Collection** button to update the position of all the **ButtonParent** object's child objects.

![Unity with GridObjectCollection component updated](images/mr-learning-asa/asa-03-section1-step1-2.png)

## Persisting Azure Spatial Anchors between app sessions

In this section, you will learn how to save and retrieve the Azure Anchor ID to and from the HoloLens' local disk. This will allow you to query Azure for the same anchor ID between different app sessions. It will enable the anchored holograms to be positioned at the same location as in the previous app session.

In the Hierarchy window, expand the **ButtonParent** object and locate the two buttons named **SaveAzureAnchorIdToDisk** and **GetAzureAnchorIdFromDisk**:

![Unity with SaveAzureAnchorIdToDisk and GetAzureAnchorIdFromDisk button objects selected](images/mr-learning-asa/asa-03-section2-step1-1.png)

Follow the same steps as in the [configuring the buttons to operate the scene](mr-learning-asa-02.md#configuring-the-buttons-to-operate-the-scene) instructions from the previous tutorial to configure the **Interactable (Script)** component on each of the two buttons:

* For the **SaveAzureAnchorIdToDisk** button object, assign the AnchorModuleScript > **SaveAzureAnchorIdToDisk ()** function.
* For the **GetAzureAnchorIdFromDisk** button object, assign the AnchorModuleScript > **GetAzureAnchorIdFromDisk ()** function.

If you build the updated app to your HoloLens, you can now persist Azure Spatial Anchors between app sessions by saving the Azure Anchor ID. To test it out, you can follow these steps:

1. Move the Rover Explorer to the desired location
2. Start Azure Session
3. Create Azure Anchor (creates anchors at the location of the Rover Explorer)
4. Save Azure Anchor ID to Disk
5. Restart the app
6. Get Azure Anchor from Disk (loads the anchor ID you just saved)
7. Start Azure Session
8. Find Azure Anchor (positions the Rover Explorer at the location from step 3)

> [!NOTE]
> To fully restart the app, after exiting the immersive app view, the app window in the mixed reality home needs to be closed before relaunching it from the Start menu. For additional details, you can refer to the [Using apps on HoloLens](/hololens/holographic-home#using-apps-on-hololens) documentation.

## Sharing Azure Spatial Anchors between devices

In this section, you will learn how to share the Azure Anchor ID between multiple devices. This will allow multiple devices to query Azure for the same anchor ID, allowing the anchored holograms to be spatially aligned. Spatial alignment, i.e., seeing the same holograms in the same physical location between multiple devices, is key to local shared experiences in the HoloLens 2.

There are many ways to transfer Azure Anchor IDs between devices, including methods outlined in the [Multi-user capabilities tutorials](mr-learning-sharing-02.md) series. In this example, you will use a simple web service to upload and download anchor IDs between devices.

In the Hierarchy window, expand the **ButtonParent** object.   Locate the two buttons named **ShareAzureAnchorIdToNetwork** and **GetAzureAnchorIdFromNetwork**:

![Unity with ShareAzureAnchorIdToNetwork and GetAzureAnchorIdFromNetwork button objects selected](images/mr-learning-asa/asa-03-section3-step1-1.png)

Follow the same steps as in the [configuring the buttons to operate the scene](mr-learning-asa-02.md#configuring-the-buttons-to-operate-the-scene) instructions from the previous tutorial to configure the **Interactable (Script)** component on each of the two buttons:

* For the **ShareAzureAnchorIdToNetwork** object, assign the AnchorModuleScript > **ShareAzureAnchorIdToNetwork ()** function.
* For the **GetAzureAnchorIdFromNetwork** object, assign the AnchorModuleScript > **GetAzureAnchorIdFromNetwork ()** function.

If you build the updated app to two HoloLens devices, you can now achieve spatial alignment by sharing the Azure Anchor ID. To test it out, you can follow these steps:

1. On HoloLens device 1: Move the Rover Explorer to the desired location.
2. On HoloLens device 1: Start Azure Session.
3. On HoloLens device 1: Create Azure Anchor (creates anchors at the location of the Rover Explorer).
4. On HoloLens device 1: Share Azure Anchor ID to Network.
5. On HoloLens device 2: Start the app.
6. On HoloLens device 2: Get Shared Anchor ID from Network (fetches the anchor ID just shared from HoloLens device 1).
7. On HoloLens device 2: Start Azure Session.
8. On HoloLens device 2: Find Azure Anchor (positions the Rover Explorer at the location from step 3).

> [!TIP]
> If you only have one HoloLens, you can still test the functionality by restarting the app instead of using a second HoloLens device.

## Congratulations

In this tutorial, you learned how to persist Azure Spatial Anchors between app sessions and app restarts by saving the Azure Spatial Anchor ID to the local disk on HoloLens. You also learned how to share Azure Spatial Anchors between multiple devices for a basic multi-user, static hologram shared experience.

In the next tutorial, you will learn how to provide users with real-time feedback. This feedback will include information about Anchor creation, the quality of environment understanding, and the Azure session's state. Without feedback, users may not know whether an anchor has successfully been uploaded to Azure, whether the quality of the environment is sufficient for anchor creation, or the current state.

> [!div class="nextstepaction"]
> [Next Tutorial: 4. Displaying Azure Spatial Anchor feedback](mr-learning-asa-04.md)

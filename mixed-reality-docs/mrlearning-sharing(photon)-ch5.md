---
title: Multi-user capabilities tutorials - 5. Integrating Azure Spatial Anchors into a shared experience
description: Complete this course to learn how to implement multi-user shared experiences within a HoloLens 2 application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# 5. Integrating Azure Spatial Anchors into a shared experience

In this lesson, you'll learn how to integrate Azure Spatial Anchors (ASA) into our shared experience. ASA allows multiple co-located devices to have a common reference if their physical environment is to anchor virtual experiences such that all participants see objects in the same physical place.

## Objectives

* Integrate ASA into a shared experience for multi-device alignment.
* Learn the fundamentals of how ASA works in the context of a local shared experience.

## Instructions

1. Select the TableAnchor prefab underneath the MixedRealityPlayspace parent object, and delete it.

    ![Module3Chapter5tep2im](images/module3chapter5step2im.PNG)

2. In the Project view, go to Assets->Resources->Prefabs, and drag the TableAnchor prefab on top of the SharedPlayground object to make it a child.

3. Expand the MixedRealityPlayspace parent object, TableAnchor object, and expand the Buttons object as well.

    ![Module3hapter5step5im](images/module3chapter5step5im.PNG)

4. Now in the hierarchy, select ShareAzureAnchorButton and move your attention to the Inspector panel. Scroll down to the drop-down menu shown in the image below, select AnchorModuleScript and click ShareAnchorNetwork().

    ![Module3hapter5step6im](images/module3chapter5step6im.PNG)

5. Select GetAzureAnchorButton (see Step 4) and move your attention back to the Inspector panel. Scroll down to the drop-down menu displayed in the image below, select AnchorModuleScript, click GetSharedAnchorNetwork(), and save.

    ![Module3hapter5step7im](images/module3chapter5step7im.PNG)

6. Repeat step 4 to hook up the StartAzureSession () function to the StartAzureSessionButton.

7. Repeat step 4 to hook up the CreateAzureAnchor () function to the CreateAzureAnchorButton and verify that the TableAnchor object is assigned to the function's parameter 'Game Object' field.

8. Follow the [Connect the scene to the Azure resource](mrlearning-asa-ch1.md#4-connect-the-scene-to-the-azure-resource) instructions to add your Azure Spatial Anchors service credentials.

9. To test the sharing module, click the "Start Azure ASA Session" button which will start the azure spatial anchors session and then create the azure anchor by clicking the "Create Azure Anchor" button. Wait for the azure anchor to get created. Once the azure anchor is created, click the "Share Azure Anchor" button to share the created azure anchor from the HoloLens.

10. To receive the shared azure anchor in another HoloLens, click the "Start Azure ASA Session" to start and get in to the current ASA session

11. Click the "Get Azure Anchor" button to get the shared azure anchor from the other HoloLens.

## Congratulations

In this lesson, you learned how to integrate Azure's powerful new Spatial Anchors to align co-located devices in a shared experience! This also concludes the Sharing Module. We learned how to set up a new Photon account, integrate Photon and PUN into a new Unity application, configure avatars and shared objects, and finally align multiple participants using ASA.

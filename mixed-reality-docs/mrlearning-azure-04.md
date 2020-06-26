---
title: Azure Cloud Tutorials - 4. Integrating Azure Spatial Anchors
description: Complete this course to learn how to implement Azure Spatial Anchors within a HoloLens 2 application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens, hololens 2, Azure spatial anchors
ms.localizationpriority: high
---

# 4. Integrating Azure Spatial Anchors

In this tutorial, you will learn how to use **Azure Spatial Anchors**. We will store the location of a **Tracked Object** as an Azure Spatial Anchor. Then we will query and present the user with a guiding arrow pointing to the location.

## Objectives

* Learn the basics of Azure Spatial Anchors.
* Learn how to set up the scene to use Azure Spatial Anchors in this project.
* Learn how to integrate storing and querying locations.

## Understanding Azure Spatial Anchors

 **Azure Spatial Anchors** is part of the Azure Cloud Services family and is used to save anchor locations. The saved anchor locations can be retrieved based on the *anchor ID* from the cloud. This anchor location can be shared and accessed by multi-platform devices like HoloLens, iOS, and Android devices.

Learn more about [Azure Spatial Anchors](https://docs.microsoft.com/azure/spatial-anchors/overview).

## Preparing Azure Spatial Anchors

Before we can start, you have to create a spatial anchor resource in your Azure portal.
Learn how to make a [spatial anchor resource](https://docs.microsoft.com/azure/spatial-anchors/quickstarts/get-started-hololens#create-a-spatial-anchors-resource).

## Preparing the scene

In this section, you will learn how to configure the scene and make the necessary changes.

In the Project window, navigate to the **Assets > MRTK.Tutorials.AzureCloudServices > Prefabs > Manager**

![mrlearning-azure](images/mrlearning-azure/tutorial4-section1-step1-1.png)

From the **Manager** folder, move the prefab **Anchor Manager** into the scene hierarchy.

Select **Anchor Manager** GameObject in the hierarchy, and in the inspector section, you will find **Spatial Anchor Manager** (Script). Find account ID and key field and add the credentials which you had created in the prerequisite in the earlier stage.

![mrlearning-azure](images/mrlearning-azure/tutorial4-section1-step2-1.png)

Now find the **Scene Controller** object in your scene hierarchy and select it. You will see the **Scene Controller** inspector.

![mrlearning-azure](images/mrlearning-azure/tutorial4-section1-step3-1.png)

You will observe that the **Anchor Manager** field in the **Scene Controller** component is empty, drag and drop the **Anchor Manager** from the hierarchy in the scene into that field and save the scene.

## Create a simulated anchor to store a location in-editor simulation

In this section, you will learn how to save the object location.

After configuring the scene and making necessary changes to the **Anchor Manager**, Run the application and click on **Set Object** in the main menu of the experience.

Give the **name** of the object you want to save and click on **Set Object** to continue. To add more information about the object, select the **image**, and describe the object.

To save the location, click on **Save Location**

You will see an **anchor pointer** that you can move and place on the location you want to save. After that, you will get a confirmation popup. If you want to confirm and save the location, click on **Yes**; otherwise, you can change the location by clicking on **No** and selecting the location again.

Once you confirm the location by clicking on **Yes**, the location and the Anchor ID will be saved in the Azure cloud storage. Once it is saved, you will see the **Object tag**  in the anchor with the object's name.

Now the object location is saved successfully.

## The query for a simulated anchor to find a location in-editor simulation

Once after you successfully saved the anchor location, now you can find the anchor location by selecting **Search Object** in the main menu.

After clicking on **Search Object**, a new window will pop up in which you should give the name of the object you want to search.

Enter the name of the object and click on **Search Object**. If the object is saved previously and is found in the database, you will get the object card with all the details of the object you would have saved earlier.

Now you can click on **Show Location** to find the object. Once you click on **Show Location**, the system will query the object address from the cloud storage.

After successfully retrieving the location, an **arrow** will direct you towards the location of the object. Follow the arrow mark until you find the location of the object.

Once you find the object, the object name will appear at the top, and the arrow mark will disappear, and now you can click on the **object tag** to see the details of the object.

## Congratulations

In this tutorial, you learned how Azure Spatial Anchors could save and retrieve the object location on Hololense 2.

In the final tutorial, you will learn how to use the **Azure Bot Service** to add natural language as a new interaction method for our application.

[Next Lesson: 5. Integrating Azure Bot Service with LUIS](mrlearning-azure-05.md)

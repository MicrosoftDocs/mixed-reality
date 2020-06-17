---
title: Azure Cloud Tutorials - 2. Integrating Azure Storage
description: Complete this course to learn how to implement Azure Table Storage and Azure Blob Storage within a HoloLens 2 application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens, hololens 2, azure storage
ms.localizationpriority: high
---

# 2. Integrating Azure Storage

In this tutorial, you will learn how to save entity data to Azure Table Storage and thumbnail images to Azure Blob Storage. This feature will allow us to store *Tracked Objects* with data like ID, Name, Thumbnail Image, etc. across sessions and devices to the cloud.

## Objectives

* Learn the basics about Azure Storage
* Learn how to store, modify and retrieve data from Table Storage
* Learn how to store and delete images from Blob Storage

## Understanding Azure Storage

**Azure Storage** is a Microsoft storage solution on the cloud that can cover many scenarios and requirements. It can scale massively and but is easily approachable by any developer. Under its umbrella all services can be consumed with an **Azure Storage Account**. For our use case we will use Table Storage and Blob Storage.

Learn more about [Azure Storage services](https://docs.microsoft.com/en-us/azure/storage/common/storage-introduction?toc=%2fazure%2fstorage%2fblobs%2ftoc.json)

### Azure Table storage

This services allows us to store data in a NoSQL fashion, in this project we will use it to store information about the *Tracked Object* such as: name, description, spatial anchor id, and more.

In context of our application we need two Tables, one to store information about the project with information about the state of trained models ([more about that in the next tutorial](mrlearning-azure-03.md)) and a second table to store information about *Tracked Objects*.

Learn more about [Azure Table storage](https://docs.microsoft.com/en-us/azure/storage/tables/table-storage-overview).

### Azure Blob storage

In this application we will add the ability to take a photo of the *Tracked Object* to use as a thumbnail. For this we use Blob storage which is Microsoft's storage solution for large binary files.

For of our application we need one Blob Container to store our images.

Learn more about [Azure Blob storage](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blobs-introduction).

## Preparing Azure Storage

To consume the Azure Storage services we will need an Azure Storage account. To create a storage account, see [Create a storage account](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-create?tabs=azure-portal). To learn more about storage accounts, see Azure storage account overview.

Once you have a storage account, you can retrieve the connection string from the **Azure Portal** which will be needed in the next section of this lesson.

### Optional Azure Storage Explorer

While you can see and verify all data changes from the UI inside the application, we recommend to install [Azure Storage Explorer](https://azure.microsoft.com/en-us/features/storage-explorer/). This tool allows you to visually see the data in the Azure Storage and is of great help when debugging and learning.

> [!TIP]
> For testing from inside the Unity editor you can use a local emulator:
> * on Windows 10 you can use [Azure Storage Emulator](https://docs.microsoft.com/de-de/azure/storage/common/storage-use-emulator)
> * on MacOS/Linux you can use [Azurite Docker Image](https://hub.docker.com/_/microsoft-azure-storage-azurite) for Docker

## Preparing the scene

In the hierarchy window locate the **DataManager** object and select it.

![mrlearning-asa](images/mrlearning-azure/tutorial2-section4-step1-1.png)

From the inspector window you will see that in the **DataManager (script)** component is where all **Azure storage** related settings are kept. All relevant settings are already set, you just need to replace the *Connection String* field with the one you can retrieve from the Azure Portal. If you are using a local Azure storage emulator solution, then you can keep the already provided *Connection String*.

The **DataManager (script)** is responsible for talking to the **Table storage** and **Blob storage** which is consumed by other controller scripts on the UI components.

## Writing and reading data from Azure Table storage

With everything prepared it's time to create a *Tracked Object*.

Run the application and click on **Set Object**, you will see how the *EnterObjectName* object will become active in the hierarchy. In this menu click on the *search bar* and type in the name you want to give the *Tracked Object*. After providing a name click on the **Set object** button. This will create the *Tracked Object* on the Azure Table storage and you will see now the **Object Card**.

This **Object Card** is a UI representation of the *Tracked Object* and will take an important role several times in this tutorial series.

Now click on the description *text box* and type in something, after that click on the **Save** button to save the changes. Stop the application and rerun it.

Now this time click on **Search Object** and type in the *search bar* the name you have used before when creating the *Tracked Object*. You will see that the **Object Card** with all the data is restored from the **Azure Table Storage**.

Feel free to close the **Object Card** and create new *Tracked Objects* and edit their data.

> [!TIP]
> If you have installed the [Azure Storage Explorer](https://azure.microsoft.com/en-us/features/storage-explorer/) then look into the *objects* table and you will see there the created *Tracked Object*.

## Uploading and Download image from Azure Blob storage

In this section we will use the Azure Blob storage to upload and download images that will be used as thumbnails for *Tracked Objects*.

> [!NOTE]
> In this tutorial the application will take photos to upload images to the Blob storage. If you running this locally from the Unity editor, then make sure that you have a webcam connected to your computer.

Run the application, click on **Set Object** and type in the *search bar* the name of the *Tracked Object* you have created before. Now you should see the **Object Card**, click on the **Camera** button and you will be instructed to do an AirTap to take a photo. After taking a photo you will see a message that informs you about the active upload and after a while the image should appear where the placeholder was before.

Now rerun the application and search for the *Tracked Object* and the previously uploaded image should appear as thumbnail.

## Congratulations

In this tutorial you learned how Azure Storage services can be used to persist unstructured data and binaries for our **HoloLens 2** application on the cloud.

In the next tutorial you will learn how to use Azure Custom Vision to detect images associated with a *Tracked Object.*

[Next Lesson: 3. Integrating Azure Custom Vision](mrlearning-azure-03.md)

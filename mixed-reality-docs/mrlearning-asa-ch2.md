---
title: MR Learning ASA Module Azure Spatial Anchor on HoloLens 2
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# Persistence and Sharing of Azure Spatial Anchors

In this lesson, we will learn how to persist our Azure Spatial Anchors across multiple app sessions by saving our anchor information to the HoloLens 2's disk. We will also learn how to share this anchor information to other devices for a multi-device anchor alignment.

## Objectives

* 

* 

  

## Instructions

### Persist Azure Anchors Between App Sessions - Save Anchor ID to Disk

1. Search for and add the "SaveAnchorToDisk" prefab to your scene. These include two buttons, one button for saving any available Azure Anchor IDs to the HoloLens 2 disk, and another for retrieving any IDs from the disk.
2. Follow the instructions from Lesson 1 to build the updated application to your device. After pressing the "Create Azure Anchor" button, as you did in the previous lesson, you may now save the Azure Anchor ID to disk by pressing the save to disk button.
3. Restart the application, start the Azure Session, Press the "Load Anchor ID" button, and then press the "Locate Azure Anchor" button to locate the anchor associated with the ID we saved to the disk. The entire scene should now snap into position, at the location you saved the anchor previously!

### Share Azure Anchors between multiple devices

In this section, we'll learn how to share the Azure Anchor ID between multiple devices. This will allow multiple devices to query Azure for the same anchor ID, allowing our anchored holograms and scenes to be spatially aligned. Spatial alignment (seeing the same holograms in the same physical location between multiple devices) is key to local shared experiences in the HoloLens 2. There are many ways to transfer information regarding azure IDs between devices, including methods outlined in the Azure Spatial Anchors shared experiences tutorials (TODO: add link.) This example uses a simple web service to upload and download Anchor IDs between devices.

1. Add the "ShareAnchorID" prefab into your hierarchy. This prefab adds two new buttons to your scene; one for uploading anchor ID information and another for downloading anchor ID information. 
2. Follow the instructions from Lesson 1 to build the updated application to your device. After pressing the "Create Azure Anchor" button, as you did in the previous lesson, you may now share the Azure Anchor ID to other devices by pressing the Share To Other Device button.
3. If you have another HoloLens 2 device, start the application and then start the Azure Session. Press the "Get Shared Anchor ID" button, and then press the "Locate Azure Anchor" button to locate the anchor associated with the ID we saved to the disk. The entire scene should now snap into position, at the where it was placed on the other HoloLens 2 device! If you only have one HoloLens 2, you may still test functionality by restarting the application, starting the Azure Session, and then Press the "Get Shared Anchor ID" button button, and then press the "Locate Azure Anchor" button to locate the anchor associated with the ID we saved to the disk. The entire scene should now snap into position, at the location you saved the anchor previously!

## Congratulations
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

[Next Lesson: ASA Lesson 2](mrlearning-base-ch3.md)


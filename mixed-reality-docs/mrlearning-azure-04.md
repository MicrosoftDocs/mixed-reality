---
title: Azure Cloud Tutorials - 4. Integrating Azure Spatial Anchors
description: Complete this course to learn how to implement Azure Spatial Anchors within a HoloLens 2 application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens, hololens 2, azure spatial anchors
ms.localizationpriority: high
---

# 4. Integrating Azure Spatial Anchors

In this tutorial, you will learn how to use **Azure Spatial Anchors** for storing a location to a **Tracked Object** and query for the location and present the user with a guiding arrow.

## Objectives

* Learn the basics about Azure Spatial Anchors
* Learn how to setup the scene to use Azure Spatial Anchors in this project
* Learn how to integrate storing and querying locations

## Understanding Azure Spatial Anchors

**Azure Spatial Anchors** is part of the **Cognitive Services** family and is used to train image classifiers. The image classifier is a AI service that uses the trained model to apply matching tags. This classification feature will be used by our application to detect *Tracked Objects*.

Learn more about [Azure Spatial Anchors](https://docs.microsoft.com/en-us/azure/spatial-anchors/overview).

## Preparing Azure Custom Vision

Before we can start, you have to create a spatial anchor resource in your azure portal.
Learn how to make a [spatial anchor resource](https://docs.microsoft.com/en-us/azure/spatial-anchors/quickstarts/get-started-hololens#create-a-spatial-anchors-resource).

> [!HINT]
> When deploying the application to HoloLens 2 make sure you have Spatial Perception capability enabled.

## Preparing the scene

...

## Create an Anchor to store a location

...

## Query for an Anchor to find a location

...

## Congratulations

...

In the final tutorial you will learn how to use the Azure Bot Service to add natural language as a new interaction method for our application.

[Next Lesson: 5. Integrating Azure Bot Service with LUIS](mrlearning-azure-05.md)

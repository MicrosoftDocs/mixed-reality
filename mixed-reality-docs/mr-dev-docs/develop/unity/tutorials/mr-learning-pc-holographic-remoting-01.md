---
title: Getting started with PC Holographic Remoting
description: Complete this course to learn how to remotely stream mixed reality applications from your PC to HoloLens 2.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/05/2021
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens, PC holographic remoting, tooltips, eye-tracking
ms.localizationpriority: high
---

# 1. Getting started with PC Holographic Remoting

Welcome to the HoloLens 2 tutorials. In this two-part tutorial series, you will learn how to create a mixed reality experience demonstration and how to create a PC app for Holographic Remoting.

In this tutorial, you'll learn how to create a mixed reality experience. It will demonstrate UI elements, 3D model manipulation, model clipping, and eye-tracking features.

In the second tutorial, [Create a Holographic Remoting application](mr-learning-pc-holographic-remoting-02.md), you will learn how to create a PC app for Holographic Remoting. And connect to HoloLens 2 at any point, providing a way to visualize 3D content in mixed reality.

## Objectives

* Import assets and set up the scene
* Interact with holograms using UI elements and buttons
* Configure 3D objects for the clipping feature
* Learn about activating tooltips with eye-tracking

## Prerequisites

* A Windows 10 PC configured with the correct [tools installed](../../install-the-tools.md)
* Basic c# programming knowledge
* A HoloLens 2 device [configured for development](../../platform-capabilities-and-apis/using-visual-studio.md#enabling-developer-mode)
* <a href="https://docs.unity3d.com/Manual/GettingStartedInstallingHub.html" target="_blank">Unity Hub</a> with Unity 2019/2020 LTS mounted, and the Universal Windows Platform Build Support module added

We **strongly recommend** completing the [Getting started](mr-learning-base-01.md) tutorials series or some basic prior experience with Unity and MRTK before continuing.

> [!IMPORTANT]
> * This tutorial series supports Unity 2020 LTS(currently 2020.3.x) if you are using Open XR and Unity 2019 LTS (currently 2019.4.x) if you are using Legacy WSA This supersedes any Unity version requirements stated in the prerequisites linked above.

## Creating and preparing the Unity project

In this section, you will create a new Unity project and get it ready for MRTK development.

For this, first follow the [Initializing your project and first application](mr-learning-base-02.md), excluding the [Build your application to your device](mr-learning-base-02.md#building-your-application-to-your-hololens-2) instructions, which includes the following steps:

1. [Creating the Unity project](mr-learning-base-02.md#creating-the-unity-project) and give it a suitable name, for example, *MRTK Tutorials*

2. [Switching the build platform](mr-learning-base-02.md#switching-the-build-platform)

3. [Importing the TextMeshPro Essential Resources](mr-learning-base-02.md#importing-the-textmeshpro-essential-resources)

4. [Importing the Mixed Reality Toolkit and Configuring the Unity project](mr-learning-base-02.md#importing-the-mixed-reality-toolkit-and-configuring-the-unity-project)

6. [Creating and setting the scene](mr-learning-base-02.md#creating-and-configuring-the-scene) and give the scene a suitable name, for example, **PC Holographic Remoting**

Then follow the [Changing the Spatial Awareness Display Option](mr-learning-base-03.md#changing-the-spatial-awareness-display-option) instructions to change the MRTK configuration profile for your scene to the **DefaultHoloLens2ConfigurationProfile**. Change the display options for the spatial awareness mesh to **Occlusion**.

## Importing the tutorial assets

[!INCLUDE[](includes/importing-tutorial-assets-pc-holographic-remoting.md)]

## Configuring and preparing the scene

In this section, you will prepare the scene by adding some of the tutorial prefabs.

In the Project window, navigate to **Assets** > **MRTK.Tutorials.PCHolograhicRemoting** > **Prefabs** folder. While holding down the CTRL button, click on the below six prefabs.

* ButtonParent
* ClippingObjects
* HandSpatialMapButton
* Instructions
* ModelParent
* Platform

![Unity with prefabs to be added to scene selected](images/mrlearning-pc-holographic-remoting/Tutorial1-Section3-Step1-1.png)

Drag-and-drop these models from the prefabs folder into the **Hierarchy window**.

![Unity with newly added prefabs still selected](images/mrlearning-pc-holographic-remoting/Tutorial1-Section3-Step1-2.png)

To focus in on the objects in the scene, you can double-click on the **ModelParent** object, and then zoom slightly in again:

![Unity with ModelParent object in focus](images/mrlearning-pc-holographic-remoting/Tutorial1-Section3-Step1-3.png)

> [!TIP]
> If you find the large icons in your scene, such as, the large framed 'T' icons distracting, you can hide these by <a href="https://docs.unity3d.com/2019.1/Documentation/Manual/GizmosMenu.html" target="_blank">toggling the Gizmos</a> to the off position.

## Configuring the buttons to operate the scene

In this section, you will add scripts into the scene to create button events demonstrating the fundamentals of model switching and clipping functionality.

### 1. Configuring the Interactable (Script) component

In the Hierarchy window, expand the **ButtonParent** object and select the **NextButton**. In the Inspector window, locate the **Interactable (Script)** component and click on **+** icon under **OnClick ()** event.

![Unity with NextButton OnClick event added](images/mrlearning-pc-holographic-remoting/Tutorial1-Section4-Step1-1.png)

With the **NextButton** object still selected in the Hierarchy window, click-and-drag the **ButtonParent** object from the Hierarchy window into the empty **None (Object)** field of the event you just added to make the ButtonParent object listen for button click event from this button:

![Unity with NextButton OnClick event listener configured](images/mrlearning-pc-holographic-remoting/Tutorial1-Section4-Step1-2.png)

Click the **No Function** dropdown of the same event. Then select **ViewButtonControl** > **NextModel ()** to set the **NextModel ()** function as the action that is triggered when the button pressed events is fired from this button:

![Unity with NextButton OnClick event action selection path](images/mrlearning-pc-holographic-remoting/Tutorial1-Section4-Step1-3.png)

### 2. Configuring the remaining buttons

For each of the remaining buttons, complete the process outlined above to assign functions to the **OnClick ()** events:

* For PreviousButton object, assign the **ViewButtonContro**l > **PreviousModel ()** function.

* For ClippingButton select **ToggleButton** > **ToggleClipping ()** function.

### 3. Configuring the View Button Control (Script)  and Toggle Button (Script) components

Now your buttons are configured to demonstrate the model switching and clipping functionality. It is time to add 3D models and the clipping objects to the script.

We have provided six different 3D models for demonstration, expand the ***ModelParentobject*** to expose these 3D models.

With the ButtonParent object still selected in the Hierarchy window, in the Inspector window, locate the **View Button Control (Script)** component and expand the **Models** variable.

In the **Size** field, enter the number of 3D models you would like to have in your scene. In this case, it would be six. It will create fields for adding new 3D models.

![Unity with ViewButtonControl script component fields](images/mrlearning-pc-holographic-remoting/Tutorial1-Section4-Step3-1.png)

Drag and drop each child object of ModelParent Object into these fields.

![Unity with ViewButtonControl script component fields configured](images/mrlearning-pc-holographic-remoting/Tutorial1-Section4-Step3-2.png)

Drag and drop the  **ClippingObjects** object from the Hierarchy window to the  **Toggle Button (Script)** component **Clipping Object** field.
>[!NOTE]
>Stay in button parent object only.

![Unity with ToggleButton script component field configured](images/mrlearning-pc-holographic-remoting/Tutorial1-Section4-Step3-3.png)

In the Hierarchy window, select the **ClippingObjects** prefab and enable it in the Inspector window to turn on the Clipping objects.

## Configuring the clipping objects to enable clipping feature

In this section, you will add MarsCuriosityRover object's child objects renderer into an individual clipping object to demonstrate the clipping of the MarsCuriosityRover model.

In the Hierarchy window, expand the **ClippingObjects** object to expose the three different clipping objects that you will be using in this project.

To configure the **ClippingSphere** object, click on it, and in the Inspector window, locate the **Clipping Sphere (Script)** component. Enter the number of renderers in the size field that you need to add for your 3D model. In this case, add 10 for MarsCuriosityRover child objects. It will create fields for adding renderers, drag and drop MarsCuriosityRover Object's child model objects into these fields.

![Unity with ClippingSphere script component fields configured](images/mrlearning-pc-holographic-remoting/Tutorial1-Section5-Step1-1.png)

Follow the same process and add MarsCuriosityRover's child objects renderers to the **ClippingBox** and **ClippingPlane** objects.

In this tutorial, only the MarsCuriosityRover model will be used for demonstrating the clipping feature. They were adding clipping features to more models, increasing the size of the renderer, and adding their individual mesh renderers.

## Configuring eye-tracking to highlight tooltips

In this section, you will explore how to enable eye tracking in your project. For example, you will implement the functionality to highlight tooltips attached to MarsCuriosityRover's parts while looking at them and hiding them, while you are looking away from them.

### 1. Identify target objects and associated tooltips

In the Hierarchy window, select the ModelParent object. Expand the ***MarsCuriosity -> Rover*** to find five main parts of the MarsCuriosityRover: **POI-Camera**, **POI-Wheels**, **POI-Antena**, **POI-Spectrometer**, **POI-RUHF Antenna**.

* Observe five corresponding tooltip objects associated with MarsCuriosityRover parts in the Hierarchy window.
* You will be configuring these objects to highlight the experience when you look at the MarsCuriosityRover parts.

![Unity with Rover object selected and expanded](images/mrlearning-pc-holographic-remoting/Tutorial1-Section6-Step1-1.png)

### 2. Implement While Looking At Target ()  &  On Look Away () events

In the Hierarchy window, select the ***POI-Camera*** object. In the Inspector window, locate the **Eye Tracking Target (Script)** component and configure the **While Looking At Target ()** & **On Look Away ()** events as follows:

* To **None (Object)** field, assign the **POI-Camera ToolTip** object
* From **No Function** dropdown of **While Looking At Target ()** event, select **GameObject** > **SetActive (bool).** Select the **Checkbox** under it to highlight the tooltip as the action that is triggered when you look at the target object.

![Unity with EyeTrackingTarget WhileLookingAtTarget event configuration in progress](images/mrlearning-pc-holographic-remoting/Tutorial1-Section6-Step2-1.png)

* Follow the same process and click on the **No Function** dropdown of the **On Look Away ()** event listener. Then select **GameObject** > **SetActive (bool**) and leave the **Checkbox** empty to hide the tooltip as the action that is triggered when you look away from the target object.

![Unity with EyeTrackingTarget OnLookAway event configured](images/mrlearning-pc-holographic-remoting/Tutorial1-Section6-Step2-2.png)

Follow the same process and assign respective tooltip objects to their same **MarsCuriosityRover** parts
**While Looking At Target ()** & **On Look Away ()** events.

To enable eye tracking, please follow these [guidelines](/windows/mixed-reality/mrlearning-base-ch5#5-enable-simulated-eye-tracking-for-in-editor-simulations).

## Congratulations

In this tutorial, you learned to build a mixed reality experience demonstrating UI elements, 3D model manipulation, model clipping, and eye-tracking features. The tutorial provided you with NextButton and PreviousButton that let you explore the 3D model viewer experience. The ClippingObjectButton made you turn on clipping objects and experience clipping feature. The tutorial also provided you with an eye-tracking element to enable highlighting the tooltips in the experience.

In the next lesson, you will learn how to create a Holographic Remoting application for PC to connect HoloLens 2 at any point, providing a way to Visualize 3D content in mixed reality.

> [!div class="nextstepaction"]
> [Next Lesson: 2. Create Holographic Remoting application](mr-learning-pc-holographic-remoting-02.md)
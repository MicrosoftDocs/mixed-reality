---
title: Azure Spatial Anchors tutorials - 1. Getting started with Azure Spatial Anchors
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
ms.localizationpriority: high
---

# 1. Getting started with AppxHoloLens Remoting.

## Overview

Welcome to the second series of the HoloLens 2 tutorials. In this Two-part tutorial series, you will learn how to create simple Mixed reality experience demonstration and how to create Standalone UWP HoloLens remoting App.

In the first tutorial “create simple Mixed reality experience” you will learn how to create a simple Mixed reality experience demonstrating UI Elements, 3D model manipulation Model clipping features and Eye Tracking Tool tip Highlight, .

In the second tutorial “create Standalone UWP HoloLens remoting” you will learn how to create a Standalone UWP PC Holographic emulation app and connect to HoloLens 2 at any point providing a way to Visualize 3D content in in Mixed reality.

## Objectives

* Learn To Create a Simple Mixed reality experience.
* Create Standalone UWP HoloLens remoting Application to Connect to HoloLens.

## Prerequisites

>[!TIP]
>If you have not completed the [Getting started tutorials](mrlearning-base.md) series yet, it's recommended that you complete those tutorials first.

* A Windows 10 PC configured with the correct [tools installed](install-the-tools.md)
* Windows 10 SDK 10.0.18362.0 or later
* Some basic C# programming ability
* A HoloLens 2 device [configured for development](using-visual-studio.md#enabling-developer-mode)
* <a href="https://docs.unity3d.com/Manual/GettingStartedInstallingHub.html" target="_blank">Unity Hub</a> with Unity 2019.3.X installed and the Universal Windows Platform Build Support module added

> [!IMPORTANT]
> The recommended Unity version for this tutorial series is Unity 2019.3.X. This supersedes any Unity version requirements or recommendations stated in the prerequisites linked above.

## Creating the Unity project
In this section, you will create a new Unity project and get it ready for MRTK development.

For this, first follow the [Initializing your project and first application](mrlearning-base-ch1.md), excluding the [Build your application to your device](mrlearning-base-ch1.md#build-your-application-to-your-device) instructions, which includes the following steps:

1. [Create new Unity project](mrlearning-base-ch1.md#create-new-unity-project) and give it a suitable name, for example, *MRTK Tutorials*

2. [Configure the Unity project for Windows Mixed Reality](mrlearning-base-ch1.md#configure-the-unity-project-for-windows-mixed-reality)

3. [Import TextMesh Pro Essential Resources](mrlearning-base-ch1.md#import-textmesh-pro-essential-resources)

4. [Import the Mixed Reality Toolkit](mrlearning-base-ch1.md#import-the-mixed-reality-toolkit)

5. [Configure the Unity project for the Mixed Reality Toolkit](mrlearning-base-ch1.md#configure-the-unity-project-for-the-mixed-reality-toolkit)

6. [Add the Mixed Reality Toolkit to the Unity scene](mrlearning-base-ch1.md#configure-the-mixed-reality-toolkit) and give the scene a suitable name, for example, AppxHololensRemoting

   

## Importing the tutorial assets

Download and **import** the following Unity custom packages **in the order they are listed**:

<!-- TODO: provide correct tutorial Pakage and include if any other pakages -->

* ·    MRTK.Tutorials.[AppxHoloLensRemoting.unitypackage](https://github.com/Azure/azure-spatial-anchors-samples/releases/download/v2.1.1/AzureSpatialAnchors.unitypackage) 

  

> [!TIP]
> For a reminder on how to import a Unity custom package, you can refer to the [Import the Mixed Reality Toolkit](mrlearning-base-ch1.md#import-the-mixed-reality-toolkit) instructions.

After you have imported the tutorial assets your Project window should look similar to this:

<!-- TODO: add Screenshot -->

## Creating and preparing the scene
<!-- TODO: Consider renaming to 'Preparing the scene' -->

In this section, you will prepare the scene by adding some of the tutorial prefabs.

In the Project window, navigate to **Assets** > **MRTK.Tutorials.AppxHoloLenseRemoting**> **Prefabs** folder. While holding down the CTRL button, click on **ButtonParent**, **Clipping Objects**, **ModelsParant**, **Instructions**, and **Platform** to select the five prefabs:

<!-- TODO: add Screenshot -->

With the five prefabs still selected, drag them into the Hierarchy window to add them to the scene:

<!-- TODO: add Screenshot -->

To focus in on the objects in the scene, you can double-click on the **ModelsParant** object, and then zoom slightly in again:

<!-- TODO: add Screenshot -->

> [!TIP]
> If you find the large icons in your scene, for example, the large framed 'T' icons distracting, you can hide these by <a href="https://docs.unity3d.com/2019.1/Documentation/Manual/GizmosMenu.html" target="_blank">toggling the Gizmos</a> to the off position.

## Configuring the buttons, Clipping Objects and Eye Tracking Tool Tip to operate the scene

In this section, you will add scripts into the scene to create a series of button events that demonstrate the fundamentals of how both local anchors and Azure Spatial Anchors behave in an application.

### 1.Configuring the ButtonsParant component:

in the Hierarchy window, Expand the **ButtonsParant** Object which consists of three Buttons. **NextButton** and **Previous Button** are Used to Change the 3D Objects in the Scene and **ClippingPlaneButton** is used to toggle the **Clipping Object** ON and OFF.

<!-- TODO: add Screenshot -->

Now Lets Configure the **ButtonsParan**t Object to Operate the **Next Button Previous Button** and **Clipping Plane Button.**

 

To the **ButtonsParant** object you will notice two Scrips are attached to it one **ViewButtonControl (Script)** to change the 3D model in the Scene and another **ToogleButton(Script)** to turn on and off the Clipping Objects.

<!-- TODO: add Screenshot -->

In the Hierarchy window, expand the **ButtonsParent** object and select the **NextButton**. In the Inspector window, locate the **Interactable (Script)** component and add a new event listener to the **Events onclick()** event by clicking the **+** icon:

<!-- TODO: add Screenshot -->

click-and-drag the **ButtonsParant** object from the Hierarchy window into the empty **None (Object)** field of the Onclick() you just added to make the object listen for button pressed events from this button:

<!-- TODO: add Screenshot -->



Click the **No Function** dropdown of the same event listener, then select **ViewButtonControl** > **NextModel()** to set the Next Model function as the action that is triggered when the button pressed events is fired from this button:

<!-- TODO: add Screenshot -->

Similarly by following the above Steps also Configure the **PreviousButton,** and **ClippingPlaneButton** the only Change would be to select the function when the button pressed event is fired.



For **PreviousButton** select **ViewButtonControl** >**PreviousModel()** to set the previous Model function. 

<!-- TODO: add Screenshot -->



For **ClippingPlaneButton** select **ToggleButton**> **ToggleClipping()** to set the Toggle function for Clipping Object.

<!-- TODO: add Screenshot -->



### 2. Adding Models and Clipping Objects to the Scene:

Now that the Buttons are Configured let us add some Models and the Clipping Objects to the Scene.

in the Hierarchy Click on **ButtonsParant** object and on the Inspector widow Expand the ViewControlScript now you could find the **Modles[]** Game object which indicates the No of 3D models in the Scene.

<!-- TODO: add Screenshot -->

For demonstration we have provided with 5 different 3D models for this tutorial, which are present as the child Objects of the **ModelsParant** in the Hierarchy. 

<!-- TODO: add Screenshot -->



Now in the Inspector window expand the **Models** object in the **ViewButtonScript** attached to the **ButtonsParant** object. Enter the No of 3D model you would like to have on the Scene, hear in our case it would be 5.

<!-- TODO: add Screenshot -->



Now Drag and Drop the 3D Models one by one From the **ModelsParant** Object in the hierarchy. 



<!-- TODO: add Screenshot -->

To add the **Clipping object** to the Scene in the Hierarchy  Click on **ButtonsParant** object and on the Inspector widow Expand the **ToggleButtonScript** hear you will find a field "ClippingObject" to add the **Clipping object** Component.

<!-- TODO: add Screenshot -->

To this ClippingObject Field add the **Clippingobjects** component present in the hierarchy,

<!-- TODO: add Screenshot -->

### 3. Configure the Clipping Objects to Work:

Now Lets Configure the Clipping Object Component to work for Model clipping in the scene.

Expand the **Clipping object** Component in the hierarchy you will find three child objects that specifies the Clipping Shape.**ClippingSphere** for Sphere shape, **ClippingBox** for Box shape and **clippingPlane** for plane. 

<!-- TODO: add Screenshot -->

To configure the **ClippingSphere** Object click on it and in the inspector you will notice **ClippingSphere Script** attached to it, expand the **ClippingSphere Script**  in this we need to Specify the Renderers(Materials) of the all the 3D model which we are using.

<!-- TODO: add Screenshot -->

To add the Renderers to the Clipping Object Expand the **ModelsParant>MarsCuriosityRover>nodeid51** Child objects of the **nodeid51** are the renderers of this model.

<!-- TODO: add Screenshot -->

Count the no of renderers, in this case it is 10, enter the renderer size as 10 in the **ClippingSphereScript**.

<!-- TODO: add Screenshot -->

Drag and drop the each components(nodeid31 to nodeid49) to the Renderers field in **ClippingSphereScript**

<!-- TODO: add Screenshot -->

Similarly add the renderers of all 5 3D models in the scene to the **ClippingSphereScript.**



By following the above procedure configure also for the **ClippingBox** and **ClippingPlane** objects

<!-- TODO: add Screenshot for clipping Box -->

<!-- TODO: add Screenshot for clipping Plane -->



### 4.Adding Eye Tracking Tool Tip Highlight Features to the Model:

In order to add this Eye Tracking features to the Models first we need to Configure the Eye Tracking to the Scene.

##### Setting up the MRTK profiles required for eye tracking

In the Hierarchy select **MixedRealityToolkit** and in the Inspector,  you will be asked to choose a profile for MRTK. You can simply select **DefaultMixedRealityToolkitConfigurationProfile** and then select the 'Copy & Customize' option. 

<!-- TODO: add Screenshot -->

A new “**clone profile**” window appears click on clone.

<!-- TODO: add Screenshot -->

##### **Creating an "eye gaze data provider"**

Click on the **'Input'** tab in your MRTK profile.

<!-- TODO: add Screenshot -->

To edit the default one ( '**DefaultMixedRealityInputSystemProfile**' ), click the 'Clone' button next to it. A '**Clone Profile**' menu appears. Simply click on 'Clone' at the bottom of that menu.

<!-- TODO: add Screenshot -->

Double click on your new input profile, expand '**Input Data Providers**', and select '**+ Add Data Provider**'.

<!-- TODO: add Screenshot -->

A New Data provider is added to the Input data provider expand it under type select **Microsoft.MixedReality.Toolkit.WindowsMixedReality.Input** > **WindowsMixedRealityEyeGazeDataProvider** For Platform(s) select '**Windows Universa**l'.

<!-- TODO: add Screenshot -->

##### Simulating eye tracking in the Unity Editor.

Now that the Setup for Eye Tracking is done You can simulate eye tracking input in the Unity Editor to ensure that events are correctly triggered before deploying the app to your HoloLens 2, in order to do this follow below two steps

1. ###### **Enable simulated eye tracking**:

   Click on the '**Input**' tab on the inspector of **MixedRealityToolKit** From there, navigate to 'I**nput Data Providers**' -> '**Input Simulation Service**'.

   Now Clone the '**DefaultMixedRealityInputSimpulationProfile**' to make changes to it.

   <!-- TODO: add Screenshot -->

   Check the 'Simulate Eye Position' checkbox.

   <!-- TODO: add Screenshot -->

   

2. ###### **Disable default head gaze cursor**: 

   In general, it is recommended to avoid showing an eye gaze cursor or if absolutely required to make it very subtle. We do recommend to hide the default head gaze cursor that is attached to the MRTK gaze pointer profile by default.

   Navigate to your MRTK configuration profile -> *'**Input**'* -> *'**Pointers'*Clone** the *'**DefaultMixedRealityInputPointerProfile**'* to make changes to it.

   <!-- TODO: add Screenshot -->

   

   At the top of the *'**Pointer Settings**'*, you should assign an invisible cursor prefab to the *'**GazeCursor**'*. You can do this by selecting the *'**EyeGazeCursor**'* prefab from the MRTK Foundation.

   <!-- TODO: add Screenshot -->

   In order to use eye tracking option in our current Appx HoloLens remoting application switch from **DefaultMixedRealityToolkitConfigurationProfile** to **DefaultHoloLens2ConfigurationProfile**

   <!-- TODO: add Screenshot -->



##### **Adding Tool Tip Highlight to the 3D models**

Now let us add the Eye Tracking feature to our 3D models in the Scene,

What we are doing hear is when you look at the particular area in the 3D model we need a Tool tip Highlight to show the details of this area, 

Expand the **MarsCuriosityRover Model** in the **ButtonsParant** Object, there you will find the 5 different parts of the Model ie “CAMARA”, “WHEELS”, “SPECTROMETER” “ANTENNA” and “RUHF Antena”,

For each of these models there is a tool tip present(SimpleLineToolTip(0 to 5))

<!-- TODO: add Screenshot -->

Now let us attach the tool tip to the each parts of the Model.

Select the the POI-CAMARA in the **MarsCuriosityRover** Model by expanding it, In the inspector window observe that **EyeTrackingTarget** Script is attached to it.

<!-- TODO: add Screenshot -->

Expand the **EyeTrackingScript** in the inspector window and add a new event listener to the **Events While Looking at target() and on look away()** by clicking the **+** icon:

<!-- TODO: add Screenshot -->

Expand the **MarsCuriocityRover** model and add **Simplelinetooltip** object which represent the “CAMARA” to the none object for both the events.

<!-- TODO: add Screenshot -->



To the Event **while looking at target ()** add the function by click on **Nofunction>GameObject>SetActive**. and select the Check box, this enables the tooltip when you look at the gameobject

 

Similarly to the event **on** **look away()** add the function **Nofunction>GameObject>SetActive**. Hear don’t select the check box, this disables the tooltip when you look away from the gameobject.

<!-- TODO: add Screenshot -->



By Following the above procedure attach the Tool tip Highlight  to the remaining 4 parts of the Model, and to the all 5 of the 3D models which are Used in the Scene..



### 5. Testing your Scene in the Unity Editor:

<!-- TODO: change clipping plane name -->

with the above Procedures you have Successfully configured the Scene to operate, now before Building the scene to the HoloLens test the Scene in the Editor to Ensure everything works perfectly.

Click On Play in the Editor, test the **NextButton** and **PreviousButton** by clicking it the 3D model in the Scene should change. when Clicked on ClippingObject the Clipping Objects should appear and disappear.

<!-- TODO: add Vidio or Screenshot -->

when the Clipping plane appears Grab one of the Clipping Object and run over the 3D model. this should clip the 3D model.

<!-- TODO: add Vidio or Screenshot -->

to test the Eye Tracking tooltip locate the small white dot in the window move this dot using keys A,W,S,D when this dot points at the part of the 3D model, a tool tip with the name should apper.

<!-- TODO: add Vidio or Screenshot -->

This Completes your tutorial for Building a Simple Mixed reality Experience consisting of UI Elements, Eye Tracking Tool tip Highlight, 3D model manipulation and Model clipping features.

## Congratulations

In this tutorial, you learned to build a simple Mixed reality Experience consisting of UI Elements, Eye Tracking Tool tip Highlight, 3D model manipulation and Model clipping features.. 

In the next lesson, you will learn how to create a Standalone UWP PC Holographic emulation app and connect to HoloLens 2 at any point providing a way to Visualize 3D content in in Mixed reality.



<!-- TODO: change this -->

[Next Lesson: 2. Saving, retrieving and sharing Azure Spatial Anchors](mrlearning-asa-ch2.md)
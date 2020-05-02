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

# 1. Getting started with AppX Holographic Remoting

## Overview

Welcome to the second series of the HoloLens 2 tutorials. In this two-part tutorial series, you will learn, how to create Mixed Reality experience demonstration and how to create Holographic Remoting remote app.

In the first tutorial, [Create Mixed Reality experience](mrlearning-appx-ch1.md), you will learn how to create a Mixed Reality experience demonstrating UI elements, 3D model manipulation, model clipping and eye tracking features.

<!-- TODO:add link to second tutorial -->

In the second tutorial, [Create Holographic Remoting remote app](mrlearning-appx-ch2.md), you will learn how to create Holographic Remoting remote app and connect to HoloLens 2 at any point providing a way to visualize 3D content in Mixed Reality.

## Objectives

* Import assets and set up the scene
* Interact with holograms using UI elements and buttons
* Configure 3D objects for clipping feature.
* Learn about eye tracking select target and highlight tooltips.

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

6. [Add the Mixed Reality Toolkit to the Unity scene](mrlearning-base-ch1.md#configure-the-mixed-reality-toolkit) and give the scene a suitable name, for example,  *AppXHolographicRemoting*

Then follow the [How to configure the Mixed Reality Toolkit Profiles (Change Spatial Awareness Display Option)](mrlearning-base-ch2.md#how-to-configure-the-mixed-reality-toolkit-profiles-change-spatial-awareness-display-option) instructions to change the MRTK configuration profile for your scene to the **DefaultHoloLens2ConfigurationProfile** and change the display options for the spatial awareness mesh to **Occlusion**.

## Importing the tutorial assets

Download and **import** the following Unity custom packages **in the order they are listed**:

<!-- TODO: provide correct tutorial Pakage URL and include if any other pakages -->

* [MRTK.Tutorials.AppxHoloLensRemoting.unitypackage](https://github.com/Azure/azure-spatial-anchors-samples/releases/download/v2.1.1/AzureSpatialAnchors.unitypackage) 

  [!TIP]
  For a reminder on how to import a Unity custom package, you can refer to the [Import the Mixed Reality Toolkit](mrlearning-base-ch1.md#import-the-mixed-reality-toolkit) instructions.

After you have imported the tutorial assets your Project window should look similar to this:

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section2-Step1-1.png)



## Creating and preparing the scene
In this section, you will prepare the scene by adding some of the tutorial prefabs.

In the Project window, navigate to **Assets** > **MRTK.Tutorials.AppXHolograhicRemoting**> **Prefabs** folder. While holding down the CTRL button, click on **ButtonParent**, **ClippingObjects**, **ModelParent**, **Instructions**, and **Platform** to select the five prefabs:

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section3-Step1-1.png)

With the five prefabs still selected, drag them into the Hierarchy window to add them to the scene:

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section3-Step1-2.png)

To focus in on the objects in the scene, you can double-click on the **ModelParent** object, and then zoom slightly in again:

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section3-Step1-3.png)

> [!TIP]
> If you find the large icons in your scene, for example, the large framed 'T' icons distracting, you can hide these by <a href="https://docs.unity3d.com/2019.1/Documentation/Manual/GizmosMenu.html" target="_blank">toggling the Gizmos</a> to the off position.

## Configuring the buttons to operate the scene

In this section, you will add scripts into the scene to make buttons to switch models and enable clipping objects that demonstrate the models switching between next and previous models, enable or disable the clipping objects. 

### 1. Configure the Interactable (Script) component

In the Hierarchy window, select the **ButtonParent** object and in the Inspector window, notice two scripts are attached to it, one **ViewButtonControl (Script)** to change the 3D model in the Scene and another **ToogleButton(Script)** to turn on and off the clipping objects.

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step1-1.png)

Now that the scripts are attached to the **ButtonParent** object, it is time to configure **NextButton, PreviousButton** and **ClippingButton.**

In the Hierarchy window, expand the **ButtonParent** object and select the **NextButton**. In the Inspector window, locate the **Interactable (Script)** component and add a new event listener to the **OnClick()** event by clicking the **+** icon:

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step1-2.png)

click-and-drag the **ButtonParent** object from the Hierarchy window into the empty **None (Object)** field of the **Onclick()** you just added to make the object listen for button pressed events from this button.

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step1-3.png)



Click the **No Function** dropdown of the same event listener, then select **ViewButtonControl** > **NextModel()** to set the Next Model function as the action that is triggered when the button pressed events is fired from this button:

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step1-4.png)

Similarly by following the above Steps also Configure the **PreviousButton,** and **ClippingButton** the only Change would be to select the function when the button pressed event is fired.



For **PreviousButton** select **ViewButtonControl** >**PreviousModel()** to set the previous Model function. 

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step1-5.png)



For **ClippingButton** select **ToggleButton**> **ToggleClipping()** to set the Toggle function for Clipping Object.

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step1-6.png)

------ > Clipping Objects and Eye Tracking Tool Tip to operate the scene <----------

### 2. Adding Models and Clipping Objects to the Script:

Now that the Buttons are Configured let us add some Models and the Clipping Objects to the Scene.

For demonstration we have provided with 5 different 3D models for this tutorial, which are present as the child Objects of the **ModelParent** in the Hierarchy. 

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step2-1.png)



In the Hierarchy Click on **ButtonParent** object and on the Inspector widow Expand the **ViewControlScript** now you could find the **Modles[]** Field which indicates the No of 3D models in the Scene.

<!-- TODO: change this Screenshot with model size 0 -->



![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step2-2.png)



Now in the Inspector window expand the **Models[]** field. Enter the No of 3D model you would like to have on the Scene, hear in our case it would be 5.

Now Drag and Drop the 3D Models one by one From the **ModelParent** Object in the hierarchy. 

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step2-3.png)



Now we will add the **Clipping object** to the Scene,

In the Hierarchy  Click on **ButtonParent** object and on the Inspector widow Expand the **ToggleButtonScript** hear you will find a field "**ClippingObject**" to add the **Clipping object** Component.

To this ClippingObject Field add the **Clippingobjects** component present in the hierarchy,

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step2-4.png)



### 3. Configure the Clipping Objects to Work:

Now Lets Configure the Clipping Object Component to work for Model clipping in the scene.

Expand the **Clipping object** Component in the hierarchy you will find three child objects that specifies the Clipping Shape. **ClippingSphere** for Sphere shape, **ClippingBox** for Box shape and **clippingPlane** for plane. 

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step3-1.png)

To configure the **ClippingSphere** Object click on it and in the inspector you will notice **ClippingSphere Script** attached to it, expand the **ClippingSphere Script**  in this we need to Specify the Renderers(Materials) of the all the 3D model which we are using.

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step3-2.png)

To add the Renderers to the Clipping Object Expand the **ModelParent>MarsCuriosityRover>nodeid51** Child objects of the **nodeid51** are the renderers of this model.

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step3-3.png)

Count the no of renderers, in this case it is 10, enter the renderer size as 10 in the **ClippingSphereScript**.

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step3-4.png)

Drag and drop the each components(nodeid31 to nodeid49) to the Renderers field in **ClippingSphereScript**

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step3-5.png)

Similarly add the renderers of all 5 3D models in the scene to the **ClippingSphereScript.**

By following the above procedure configure also for the **ClippingBox** and **ClippingPlane** objects



### 4.Adding Eye Tracking Tool Tip Highlight Features to the Model:

In order to add this Eye Tracking features to the Models first we need to Configure the Eye Tracking to the Scene.

##### Setting up the MRTK profiles required for eye tracking

In the Hierarchy select **MixedRealityToolkit** and in the Inspector,  you will be asked to choose a profile for MRTK. You can simply select **DefaultMixedRealityToolkitConfigurationProfile** .

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step4-1-1.png)

select the '**Copy & Customize**' option, A new “**clone profile**” window appears click on clone.

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step4-1-2.png)

##### **Creating an "eye gaze data provider"**

Click on the **'Input'** tab in your MRTK profile.

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step4-2-1.png)

To edit the default one ( '**DefaultMixedRealityInputSystemProfile**' ), click the 'Clone' button next to it. A '**Clone Profile**' menu appears. Simply click on 'Clone' at the bottom of that menu.

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step4-2-2.png)

Double click on your new input profile, expand '**Input Data Providers**', and select '**+ Add Data Provider**'.

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step4-2-3.png)

A New Data provider is added to the Input data provider expand it under type select **Microsoft.MixedReality.Toolkit.WindowsMixedReality.Input** > **WindowsMixedRealityEyeGazeDataProvider** For Platform(s) select '**Windows Universa**l'. then Simply click on 'Clone'.

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step4-2-4.png)

##### Simulating eye tracking in the Unity Editor.

Now that the Setup for Eye Tracking is done You can simulate eye tracking input in the Unity Editor to ensure that events are correctly triggered before deploying the app to your HoloLens 2, in order to do this follow below two steps

1. ###### **Enable simulated eye tracking**:

   Click on the '**Input**' tab on the inspector of **MixedRealityToolKit** From there, navigate to '**Input Data Providers**' -> '**Input Simulation Service**'.

   Now Clone the '**DefaultMixedRealityInputSimpulationProfile**' to make changes to it.

   ![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step4-3-1-1.png)

   Check the 'Simulate Eye Position' checkbox.

   ![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step4-3-1-2.png)

   

2. ###### **Disable default head gaze cursor**: 

   In general, it is recommended to avoid showing an eye gaze cursor or if absolutely required to make it very subtle. We do recommend to hide the default head gaze cursor that is attached to the MRTK gaze pointer profile by default.

   Navigate to your MRTK configuration profile -> *'**Input**'* -> PointersClone the *'**DefaultMixedRealityInputPointerProfile**'* to make changes to it.

   ![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step4-3-2-1.png)

   

   At the top of the *'**Pointer Settings**'*, you should assign an invisible cursor prefab to the *'**GazeCursor**'*. You can do this by selecting the *'**EyeGazeCursor**'* prefab from the MRTK Foundation.

   ![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step4-3-2-2.png)

   In order to use eye tracking option in our current Appx HoloLens remoting application switch from **DefaultMixedRealityToolkitConfigurationProfile** to **DefaultHoloLens2ConfigurationProfile**

   ![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step4-3-2-3.png)



##### **Adding Tool Tip Highlight to the 3D models**

Now let us add the Eye Tracking feature to our 3D models in the Scene,

What we are doing hear is when you look at the particular area in the 3D model we need a Tool tip Highlight to show the details of this area, 

Expand the **MarsCuriosityRover Model** in the **ButtonParent** Object, there you will find the 5 different parts of the Model ie “CAMARA”, “WHEELS”, “SPECTROMETER” “ANTENNA” and “RUHF Antena”,

For each of these models there is a tool tip present(**SimpleLineToolTip(0 to 5)**)

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step4-4-1.png)

Now let us attach the tool tip to the each parts of the Model.

Select the the POI-CAMARA in the **MarsCuriosityRover** Model by expanding it, In the inspector window observe that **EyeTrackingTarget** Script is attached to it.

Expand the **EyeTrackingScript** in the inspector window and add a new event listener to the **Events While Looking at target() and on look away()** by clicking the **+** icon:

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step4-4-2.png)

Expand the **MarsCuriocityRover** model and add **Simplelinetooltip** object which represent the “CAMARA” to the none object for both the events.

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step4-4-3.png)



To the Event **while looking at target ()** add the function by click on **Nofunction>GameObject>SetActive**. and select the Check box, this enables the tooltip when you look at the gameobject

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step4-4-4.png)

Similarly to the event **on** **look away()** add the function **Nofunction>GameObject>SetActive**. Hear don’t select the check box, this disables the tooltip when you look away from the gameobject.

![mrlearning-appx](images\mrlearning-appx\Tutorial1-Section4-Step4-4-5.png)



By Following the above procedure attach the Tool tip Highlight  to the remaining 4 parts of the Model, and to the all 5 of the 3D models which are Used in the Scene..



## Congratulations

In this tutorial, you learned to build a Mixed Reality experience demonstrating UI elements, 3D model manipulation, model clipping and eye tracking features. you can test this in your editor in Unity,Click On Play in the Editor, test the **NextButton** and **PreviousButton** by clicking it the 3D model in the Scene should change. when Clicked on **ClippingObject** the Clipping Objects should appear and disappear. when the Clipping plane appears Grab one of the Clipping Object and run over the 3D model. this should clip the 3D model.to test the Eye Tracking tooltip locate the small white dot in the window move this dot using keys A,W,S,D when this dot points at the part of the 3D model, a tool tip with the name should appear.

In the next lesson, you will learn how to create a Standalone UWP PC Holographic emulation app and connect to HoloLens 2 at any point providing a way to Visualize 3D content in in Mixed reality.



<!-- TODO: change this -->

[Next Lesson: 2. Saving, retrieving and sharing Azure Spatial Anchors](mrlearning-asa-ch2.md)
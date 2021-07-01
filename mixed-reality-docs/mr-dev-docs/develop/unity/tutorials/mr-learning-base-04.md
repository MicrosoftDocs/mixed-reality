---
title: MRTK tutorials - 4. Positioning objects in the scene
description: This course shows you how to position objects in the scene and how to use the Mixed Reality Toolkit (MRTK) to organize objects in a grid.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/05/2021
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens, MRTK, mixed reality toolkit, UWP, solvers, grid object collection
ms.localizationpriority: high
---

# 4. Positioning objects in the scene

## Overview

In this tutorial, you will position the provided objects from the tutorial assets in the scene.

## Objectives

* Learn how to position objects in the scene
* Learn how to use MRTK's Grid Object Collection feature

## Importing the TextMeshPro Essential Resources
The TextMeshPro Essential Resources are required by MRTK's UI elements. In the Unity menu, select **Window** > **TextMeshPro** > **Import TMP Essential Resources** to open the Import Unity Package window:

![Unity Import TMP Essential Resources menu path](images/mr-learning-base/base-02-section3-step1-1.png)

In the Import Unity Package window, click the **All** button to ensure all the assets are selected, then click the **Import** button to import the assets:

![Unity TMP Essential Resources import window](images/mr-learning-base/base-02-section3-step1-2.png)

## Importing the tutorial assets

Download the following Unity custom package. This package includes 3D assets such as Mars Rover that we are going to use in this tutorial.

* [MRTK.HoloLens2.Unity.Tutorials.Assets.GettingStarted.2.5.0.1.unitypackage](https://github.com/microsoft/MixedRealityLearning/releases/download/getting-started-v2.5.0/MRTK.HoloLens2.Unity.Tutorials.Assets.GettingStarted.2.5.0.1.unitypackage)

To Import a Unity custom package, In the Unity menu, select **Assets** > **Import Package** > **Custom Package...** to open the Import package... window:

![Importing a custom package](images/mr-learning-base/base-02-section7-step1-1.png)

In the Import package... window, select the **MRTK.HoloLens2.Unity.Tutorials.Assets.GettingStarted.2.5.0.1.unitypackage** you downloaded and click the Open button:

![Selecting an asset package](images/mr-learning-base/base-02-section7-step1-2.png)

In the Import Unity Package window, click the All button to ensure all the assets are selected, then click the Import button to import the assets:

![Selecting all the assets to import](images/mr-learning-base/base-02-section7-step1-3.png)

After you have imported the tutorial assets your Project window should look similar to this:

![Unity project window after importing assets](images/mr-learning-base/base-02-section7-step1-4.png)

## Creating the parent object

In the Hierarchy window, right-click on an empty spot, and select **Create Empty** to add an empty object to your scene:

![Unity Create Empty contextual popup menu](images/mr-learning-base/base-04-section1-step1-1.png)

> [!TIP]
> To display your Scene and Game window side by side as shown in the image above, drag the Game window to the right side of the Scene window. To learn more about customizing your workspace, you can refer to Unity's <a href="https://docs.unity3d.com/Manual/CustomizingYourWorkspace.html" target="_blank">Customizing Your Workspace</a> documentation.

Right-click on the newly created object, select **Rename**, and change the name to **RoverExplorer**:

![Unity Rename contextual popup menu](images/mr-learning-base/base-04-section1-step1-2.png)

With the RoverExplorer object still selected, in the Inspector window, configure the **Transform** component as follows:

* **Position**: X = 0, Y = -0.6, Z = 2
* **Rotation**: X = 0, Y = 0, Z = 0
* **Scale**: X = 1, Y = 1, Z = 1

![Unity with RoverExplorer object selected and positioned](images/mr-learning-base/base-04-section1-step1-3.png)

> [!NOTE]
> The camera represents the users head and is positioned at origin, X = 0, Y = 0, Z = 0. In general, 1 unit in Unity is roughly 1 meter in the physical world. However, there are exceptions to this, for example, when objects are children of scaled objects. In the scenario above, the RoverExplorer is positioned 2 meters in front of and 0.6 meters below the user's head.

## Adding the tutorial prefabs

In the Project window, navigate to the **Assets** > **MRTK.Tutorials.GettingStarted** > **Prefabs** folder:

![Unity Project window with Prefabs folder selected](images/mr-learning-base/base-04-section2-step1-1.png)

> [!TIP]
> A <a href="https://docs.unity3d.com/Manual/Prefabs.html" target="_blank">prefab</a> is a pre-configured GameObject stored as a Unity Asset and can be reused throughout your project.

From the Project window, click-and-drag the **Table** prefab on to the **RoverExplorer** object to make it a child of the RoverExplorer object, then in the Inspector window, configure the **Transform** component as follows:

* **Position**: X = 0, Y = -0.005, Z = 0
* **Rotation**: X = 0, Y = 0, Z = 0
* **Scale**: X = 1.2, Y = 0.01, Z = 1.2

![Unity with newly added Table prefab selected and positioned](images/mr-learning-base/base-04-section2-step1-2.png)

> [!TIP]
> To display your scene as shown in the image above, use the <a href="https://docs.unity3d.com/Manual/SceneViewNavigation.html" target="_blank">Scene Gizmo</a>, located in the top right corner of the Scene window, to adjust the viewing angle to be along the forward Z axis, double-click the MixedRealityPlayspace object to focus on the camera, and zoom in as needed.

From the Project window, click-and-drag the **RoverAssembly** prefab on to the **RoverExplorer** object to make it a child of the RoverExplorer object, then in the Inspector window, configure the **Transform** component as follows:

* **Position**: X = -0.1, Y = 0, Z = 0
* **Rotation**: X = 0, Y = -135, Z = 0
* **Scale**: X = 1, Y = 1, Z = 1

![Unity with newly added RoverAssembly prefab selected and positioned](images/mr-learning-base/base-04-section2-step1-3.png)

## Organizing objects in a collection

In the Hierarchy window, right-click on the **RoverExplorer** object and select **Create Empty** to add an empty object as a child of the RoverExplorer, name the object **RoverParts**, and configure the **Transform** component as follows:

* **Position**: X = 0, Y = 0.06, Z = 0
* **Rotation**: X = 0, Y = 90, Z = 0
* **Scale**: X = 1, Y = 1, Z = 1

![Unity with newly created RoverParts object selected and positioned](images/mr-learning-base/base-04-section3-step1-1.png)

In the Hierarchy window, select all the RoverExplorer > RoverAssembly > RoverModel > **Parts** child objects, right-click on them and select **Duplicate** to create a copy of each of the parts:

![Unity with all Parts selected and Duplicate contextual popup menu](images/mr-learning-base/base-04-section3-step1-2.png)

> [!TIP]
> To select multiple adjacent objects, press-and-hold the SHIFT key while using the mouse to select the first and last object.

With the newly duplicated Parts child objects still selected, click-and-drag them on to the **RoverParts** object to make them child objects of the RoverParts object:

![Unity with newly duplicated parts as children of RoverParts object](images/mr-learning-base/base-04-section3-step1-3.png)

To make it easier to work with your scene, in the Hierarchy window, click the **eye** icon to the left of the object to toggle the **scene visibility** for the **RoverAssembly** object off. This hides the object in the Scene window without changing its in-game visibility:

![Unity with RoverAssembly scene visibility off](images/mr-learning-base/base-04-section3-step1-4.png)

> [!TIP]
> To learn more about the Scene Visibility controls and how you can use them to optimize your scene view and workflow, you can refer to Unity's <a href="https://docs.unity3d.com/Manual/SceneVisibility.html" target="_blank">Scene Visibility</a> documentation.

In the Hierarchy window, clean up the RoverParts child objects' names by replacing the appended **(1)** with **_Part**:

![Unity with duplicated parts name cleaned up](images/mr-learning-base/base-04-section3-step1-5.png)

In the Hierarchy window, select the **RoverParts** object, then in the Inspector window, click the **Add Component** button, and search for and select **GridObjectCollection** to add the GridObjectCollection component to the RoverParts object:

![Unity RoverParts object with Add Component Grid Object Collection in progress](images/mr-learning-base/base-04-section3-step1-6.png)

Configure the **GridObjectCollection** component values as follows:

* **Sort Type**: Alphabetic
* **Layout**: Horizontal
* **Cell Width**: 0.25
* **Distance from parent**: 0.38

![Unity with GridObjectCollection component configured](images/mr-learning-base/base-04-section3-step1-7.png)

Then click the **Update Collection** button to update the position of the RoverParts child objects:

![Unity with GridObjectCollection component applied](images/mr-learning-base/base-04-section3-step1-8.png)

## Congratulations

In this tutorial, you learned how to position objects in the scene relative to the user and use MRTK's Grid Object Collection feature to organize objects in a collection.

> [!div class="nextstepaction"]
>[Next Tutorial: 5. Creating dynamic content using Solvers](mr-learning-base-05.md)

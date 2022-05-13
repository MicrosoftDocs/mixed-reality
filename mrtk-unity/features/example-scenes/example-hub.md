---
title: MRTK Examples Hub
description: Overview on Example Scenes in MRTK
author: polar-kev
ms.author: roliu
ms.date: 01/12/2021
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK,
---

# MRTK Examples Hub

![MRTK Examples Hub](../images/examples-hub/MRTK_ExamplesHub.png)

MRTK Examples Hub is a Unity scene that makes it easy to experience multiple scenes. It uses MRTK's Scene System to load & unload the scenes.

**MRTKExamplesHub.unity** is the container scene that has shared components including ``MixedRealityToolkit`` and ``MixedRealityPlayspace``. **MRTKExamplesHubMainMenu.unity** scene has the cube buttons.

## Download app from Microsoft Store in HoloLens 2
If you have HoloLens 2 device, you can directly download and install the app in your device.

<a href='//www.microsoft.com/store/apps/9mv8c39l2sj4?cid=storebadge&ocid=badge'><img src='https://developer.microsoft.com/store/badges/images/English_get-it-from-MS.png' alt='English badge' width="284px" height="104px"/></a>

## Prerequisite

MRTK Examples Hub uses [Scene Transition Service](../extensions/scene-transition-service.md) and related scripts. If you are using MRTK through Unity packages, please import **Microsoft.MixedReality.Toolkit.Unity.Extensions.x.x.x.unitypackage** which is part of the [release packages](https://github.com/microsoft/MixedRealityToolkit-Unity/releases). If you are using MRTK through the repository clone, you should already have the **MRTK/Extensions** folder in your project.

## MRTKExamplesHub scene and the scene system

Open **MRTKExamplesHub.unity** which is located at `MRTK/Examples/Experimental/Demos/ExamplesHub/Scenes/` It is an empty scene with MixedRealityToolkit, MixedRealityPlayspace and LoadHubOnStartup. This scene is configured to use MRTK's Scene System. Click `MixedRealitySceneSystem` under MixedRealityToolkit. It will display the Scene System's information in the Inspector panel.

<br/><br/><img src="../images/examples-hub/MRTK_ExamplesHub_Hierarchy.png" width="300" alt="Example Hub Hierarchy">
<br/><br/><img src="../images/examples-hub/MRTK_ExamplesHub_Inspector1.png" width="450" alt="Inspector 1">

On the bottom of the Inspector, it displays the list of the scenes defined in the Scene System Profile. You can click the scene names to load/unload them.

<br/><br/><img src="../images/examples-hub/MRTK_ExamplesHub_Inspector2.png" width="550" alt="Inspector 2">
<br/><br/><img src="../images/examples-hub/MRTK_ExamplesHub_SceneSystem3.png" alt="Scene system 3">Example of loading _MRTKExamplesHub_ scene by clicking the scene name in the list.
<br/><br/><img src="../images/examples-hub/MRTK_ExamplesHub_SceneSystem4.png" alt="Scene system 4">Example of loading _HandInteractionExamples_ scene.
<br/><br/><img src="../images/examples-hub/MRTK_ExamplesHub_SceneSystem5.png" alt="Scene system 5">
Example of loading multiple scenes.

## Running the scene

The scene works in both Unity's game mode and on device. Run the **MRTKExamplesHub** scene in the Unity editor and use MRTK's input simulation to interact with the scene contents. To build and deploy, simply build **MRTKExamplesHub** scene with other scenes that are included in the Scene System's list. The inspector also makes it easy to add scenes to the Build Settings. In the Building Settings, make sure **MRTKExamplesHub** scene is on the top of the list at index 0.

<img src="../images/examples-hub/MRTK_ExamplesHub_BuildSettings.png" width="450" alt="Build settings">

## How MRTKExamplesHub loads a scene

In the **MRTKExamplesHub** scene, you can find the ``ExamplesHubButton`` prefab.
There is a **FrontPlate** object in the prefab which contains ``Interactable``.
Using the Interactable's ``OnClick()`` and ``OnTouch()`` event, it triggers the **LoadContentScene** script's **LoadContent()** function.
In the **LoadContentScene** script's Inspector, you can define the scene name to load.

<br/><br/><img src="../images/examples-hub/MRTK_ExamplesHub_SceneSystem6.png" alt="Scene system 6">
<br/><br/><img src="../images/examples-hub/MRTK_ExamplesHub_SceneSystem8.png" width="450" alt="Scene System 8">
<br/><br/><img src="../images/examples-hub/MRTK_ExamplesHub_SceneSystem7.png" width="450" alt="Scene System 7">

The script uses the Scene System's LoadContent() function to load the scene.
Please refer to the [Scene System](../scene-system/scene-system-getting-started.md) page for more details.

```c#
MixedRealityToolkit.SceneSystem.LoadContent(contentName, loadSceneMode);
```

## Returning to the main menu scene

To return to the main menu scene (MRTKExamplesHubMainMenu scene), you can use the same Scene System `LoadContent()` method. The **ToggleFeaturesPanelExamplesHub.prefab** provides the 'Home' button which contains the **LoadContentScene** script. Use this prefab or provide a custom home button in each scene to allow the user to return to the main scene. One can put the **ToggleFeaturesPanelExamplesHub.prefab** in the **MRTKExamplesHub** scene to make it always visible since **MRTKExamplesHub** is a shared container scene. Make sure to hide/deactivate **ToggleFeaturesPanel.prefab** in each example scene.

<img src="../images/examples-hub/MRTK_ExamplesHubToggleFeaturesPanel.png" alt="Toggle feature Panel">

<img src="../images/examples-hub/MRTK_ExamplesHubHomeButton.png" width="450" alt="Example Hub home button">

## Adding additional buttons

In the **CubeCollection** object, duplicate (or add) _ExampleHubButton_ prefabs and click **Update Collection** in the `GridObjectCollection`.
This will update the cylinder layout based on the new total number of buttons.
Please refer to the [Object Collection](../ux-building-blocks/object-collection.md) page for more details.

<br/><br/><img src="../images/examples-hub/MRTK_ExamplesHub_SceneSystem9.png" alt="Scene System 9">
<br/><br/><img src="../images/examples-hub/MRTK_ExamplesHub_SceneSystem10.png" alt="Scene System 10">

After adding the buttons, update the scene name in the **LoadContentScene** script(explained above).
Add additional scenes to the Scene System's profile.

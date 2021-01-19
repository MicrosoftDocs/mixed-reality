---
title: Setting up a Mixed Reality scene in Unreal
description: Learn how to set up and configure an Unreal project scene with motion controllers, game mode, and hand joint access for mixed reality and HoloLens 2 devices.
author: hferrone
ms.author: v-hferrone
ms.date: 01/11/2021
ms.topic: how-to
keywords: Windows Mixed Reality, Unreal, Unreal Engine 4, UE4, HoloLens 2, mixed reality, development, how-to, documentation, guides, holograms, game development, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Setting up a Mixed Reality scene in Unreal

## Setting up AR Config

Your first step is to make sure the correct plugins are enabled. 

1. Under **Edit > Plugins**, enable the **HoloLens** and **Windows Mixed Reality** plugins:

![HoloLens plugin in the Unreal editor](images/unreal-scene-setup-img-01.png)

![Microsoft Windows Mixed Reality plugin in the Unreal editor](images/unreal-scene-setup-img-02.png)

2. Next, under **Edit > Project Settings**, click on **Description** in the left menu window and check the **Start in VR** box:

![Project settings in the Unreal editor with Start in VR highlighted](images/unreal-scene-setup-img-03.png)

> [!IMPORTANT]
> Skipping this step will result in a blank app slate.

## Creating the main level

1. In the **Content Browser**, right-click and create a **Level**. This will be the default level for the project:

![Content browser open in the Unreal editor with Level highlighted](images/unreal-scene-setup-img-04.png)

2. Double-click on the newly created level in the Content Browser to load it.

3. In the Content Browser, right-click to create a Data Asset and name it **ARSessionConfig**:

![Content browser open in the Unreal editor with the miscellaneous and data asset options highlighted](images/unreal-scene-setup-img-05.png)

![Data asset select with ARSessionConfig highlighted](images/unreal-scene-setup-img-06.png)

4. Double-Click to edit, and check the **Generate Mesh Data** and **Generate Collision for Mesh Data** boxes. This generates collision for the SR mesh.

![AR settings opened in the Unreal editor with generate mesh data from tracked geometry and generate colllision for mesh data highlighted](images/unreal-scene-setup-img-07.png)

5. Next, open the Level Blueprint from the Blueprints dropdown above the scene view: 

![Blueprint dropdown open with the open level blueprint highlighted](images/unreal-scene-setup-img-08.png)

6. Right-click in the graph to create an **Start AR Session** node.

* Click on the the text window under **Session Config** and search for the ARSessionConfig data node created in the previous step:

![Event graph in Unreal editor with begin play and start ar session nodes highlighted](images/unreal-scene-setup-img-09.png)

## Setting up motion controllers

1. In the Content Browser, right-click to create a Blueprint Class type **Actor** and name it **BP_MotionController**: 

![Content browser open in Unreal editor with blueprint class highlighted](images/unreal-scene-setup-img-10.png)

![Pick parent class window open in Unreal editor with actor highlighted](images/unreal-scene-setup-img-11.png)

2. Double-click to edit and create a new variable of type **EController Hand** (follow green arrows below):

![Event graph for blueprint open in Unreal editor with EController hand highlighted](images/unreal-scene-setup-img-12.png)

3. Add a **MotionController** component from the **+ Add Component** dropdown and construction setup:

![Components window in Unreal editor with an added motion controller highlighted](images/unreal-scene-setup-img-13.png)

4. Right-lick in the grid to bring up the **Actions** menu and searching for **Motion Source**, which might require the **Context Sensitive** box to be un-checked:

![Event graph in Unreal editor with actions menu open and highlighted](images/unreal-scene-setup-img-14.png)

> [!NOTE]
> Construction Scripts come with Blueprints by default. They differ from the Event Graph in that they only run 'On Begin Play', which is for asset setup, not for running during the game.

5. The blue **Motion Controller** and green **Hand** nodes are created by drag & dropping them from their respective columns. The **Hand** enum will give an option to 'Get' or 'Set' - choose 'Get'.

## Adding a player pawn

1. Open the Content Browser and create **Blueprint Class** type **Pawn**:

![Content browser with blueprints and blueprint class highlighted](images/unreal-scene-setup-img-15.png)

![Pick parent class window open with pawn highlighted](images/unreal-scene-setup-img-16.png)

2. Double-click to edit and add a **Scene Component**, rename it **Origin**, and a **Camera Component** parented to it:

![Component window open in Unreal editor with default scene root, origin, and camera component in highlighted hierarchy](images/unreal-scene-setup-img-17.png)

3. Open the Event Graph, set up to the SpawnActor **BP_MotionController** nodes and **AttachtoComponent** to the **Origin** node.

* Start by creating a **Spawn Actor from Class** node. 
* In its **Class** param, search and select the **MotionController** Blueprint created in the previous steps. 
* Pull from the **Return Value** pin and search or create an **Attach to Component** node, which should be the first in the list. 
* Duplicate those nodes and set up as shown in the screenshot below:

![Event graph for a pawn blueprint in Unreal editor](images/unreal-scene-setup-img-18.png)

> [!NOTE]
> * The "Self" node can be created by right-clicking, holding and dragging from the "Owner" parameter and searching for "Self" in the menu pop-up. There will be an option to choose the "Self" variable.
>
> * The "Owner" input of the SpawnActor node is available when the drop-down arrow on the bottom of the node is clicked.
> 
> * The "Origin" getter can be created by click/dragging the Origin scene component into the graph from the component list.

4. Set one to Left and one to Right:

![Spawn Actor blueprint motion controller nodes highlighted with left and right hand properties set](images/unreal-scene-setup-img-19.png)

## Using Game Mode

1. Create another **Blueprint Class**, this time of type **Game Mode Base**:

![Pick parent class window open with game mode base highlighted](images/unreal-scene-setup-img-20.png)

2. Double-click and point the **Default Pawn Class** parameter to the player pawn created above:

![Class defaults window open with default pawn class highlighted](images/unreal-scene-setup-img-22.png)

3. Open **Edit > Project Settings** and point the **Default GameMode** to the one you just created.
* Set the **StartUp** and **Default Maps** to the main level created earlier:

![Project settings window open with maps and modes selected and default maps highlighted](images/unreal-scene-setup-img-22.png)

> [!IMPORTANT]
> This is important when building the app, but also sets the level to startup when the project is opened as opposed to the default UE4 temp level.

## Accessing hand joints

1. Create a **Blueprint Class** type **Actor** to get set up with hand positions and drop two **Hand Joint Transform** nodes in:

![Event graph for blueprint actor with get hand joint transform node highlighted](images/unreal-scene-setup-img-23.png)

> [!NOTE]
> This is where the hand data can drive whatever the prototype or game needs. In this case, it is being used to have two spheres (named LeftIndex and RightIndex and added as components in the Blueprint) follow their respective index tips.


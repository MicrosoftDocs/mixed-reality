---
title: MR Learning ASA Module Azure Spatial Anchor on HoloLens 2
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# Azure Spatial Anchor on HoloLens 2

Welcome to the second module of the HoloLens 2 Tutorial! Before getting started, be sure that all of the [prerequisites](https://docs.microsoft.com/en-us/azure/spatial-anchors/quickstarts/get-started-unity-hololens) are completed. If you have not completed the first, [base module](link) yet, we highly recommend that you complete that first. If you are starting from a new unity project, follow the new project creation steps in the [base module](link). 

## Objectives

* Download and import 3 different asset packets ([mixed reality toolkit](link to base module chater 1), [MR Base Module Asset Pack](https://github.com/microsoft/mixedrealitylearning/releases/tag/v1.1), and [Azure Spatial Anchors](https://github.com/azure/azure-spatial-anchors-samples/releases)) 

* 

  

## Instructions

### Downloading and Importing Assets
Before beginning, you must download and import the following assets:

[Azure Spatial Anchors](https://github.com/azure/azure-spatial-anchors-samples/releases)

[MR Base Module Asset Pack](https://github.com/microsoft/mixedrealitylearning/releases/tag/v1.1)

[mixed reality toolkit](link to base module chater 1)

> Note: see step 5 for specific instructions on how to import the Azure Spatial Anchors, step 6 for specific instructions on the MR Base Module Asset Pack, and steps 3-4 for specific instructions on the mixed reality toolkit.

1. create a new scene in your project. Right click your scene folder, click "create," then scene. Name the new scene "ASALearningModule."

![Module2Chapter1step1im](images/Module2chapter1step1im.PNG)

2. Double click "ASALearningModule" to see some pre-defined items appear along with the new scene. 
3. Configure the scene for mixed reality development. 

![Module2chapter1step3im](images/Module2chapter1step3im.PNG)

> Note: You will see a pop-up that says, "you must choose a file for the Mixed Reality Toolkit." Clicking "ok" will bring you to step 4.

4. When choosing a file for the Mixed Reality Toolkit, select, "DefaultMixedRealityToolkitConfigurationProfile."

   > Note: If you have your own configuration profile feel free to use that instead.

![module2chapter1step4im](images/module2chapter1step4im.PNG)

Now the scene is configured for mixed reality. Make sure you save your scene (do this with either control/command+S, or click on file, then click on save). 

5. Import the [Azure Spatial Anchors](https://github.com/azure/azure-spatial-anchors-samples/releases). In order to use spatial anchors, you must import this asset. So, click on the link above and right click on "AzureSpatialAnchors.unitypackage." Click on "save target as" and save it to your computer. 

   ![module2chapter1step5aim](images/module2chapter1step5aim.PNG)

   Then, after it's saved, go back into unity, click "assets," go down to "import package," then click "custom package..." Your computer files will open up. Once they do, find where you saved the Azure Spatial Anchors package and select it. Then click "open."

   ![module2chapter1step5bim](images/module2chapter1step5bim.PNG)

   Now there will be a popup giving a list of tools and settings, asking you what to import. Select ***all*** of the options available, then click "import."

   ![module2chapter1step5cim](images/module2chapter1step5cim.PNG)

   > note: it will take a few minutes to import, so please be patient. 

   6. Import [MR Base Module Asset Pack](https://github.com/microsoft/mixedrealitylearning/releases/tag/v1.1) next. Much like step 5, click the link above, then right click "BaseModuleAssetsV1 1.unitypackage" and click "save target as" and save it to your computer. 

   ![module2chapter1step6aim](images/module2chapter1step6aim.PNG)

   > Tip: Save all these assets in the same folder so that they are easier to find and have access to. It will keep everything nice and organized!

   Just like step 5, go back in to unity, click "assets," hover over "import package" then click "custom package..." Your computer files should appear again, so go to where you stored the Base Module Asset Pack and select it. Then click "open."

   ![module2chapter1step5bim](images/module2chapter1step5bim.PNG)

   > Note: there may be more assets needed later in this module. Follow these steps to import any assets mentioned from this point on. 

   7. In the "project" tab, underneath the "assets" folder, click on "ASAModuleAssets." Once selected you will see 2 prefabs, "ButtonParent" and "ParentAnchor."

      ![module2chapter1step5bim](images/module2chapter1step7im.PNG)

      8. Drag both of the prefabs into the scene. 

         ![module2chapter1step8im](images/module2chapter1step8im.PNG)

         Double click on the parent anchor to select it. You may need to adjust your view to see the entire scene, so adjust your scene as needed.

### Hand Tracking Gestures and Intractable buttons

In this section, we will learn how to use hand tracking to press an interactable button.

1. Select “Assets” from the projects folder.

2. Type in the search bar, “pressablebutton.”

![MR213_BuildSettings](images/mrlearning-base-ch2-2step1im.PNG)

3. Drag the prefab (represented by a blue box) named "PressableButton" into your hierarchy. 

   > Note: If you get a message about “importing TMP Essentials” please import it at this time. If TMP Essentials was not already part of your project, you may need to repeat this step after importing TMP Essentials, otherwise button text may not appear.

![MR213_BuildSettings](images/mrlearning-base-ch2-2step3im.PNG)

4. Double click the “PressableButton” game object (which should now be in your BaseScene hierarchy) to view it in your scene, as shown in the image below (your button graphics may appear different than the image below). 

![MR213_BuildSettings](images/mrlearning-base-ch2-2step4im.PNG)

5. In the inspector panel, click “Add Event” to give the button an event to respond to when pushed. In the option that appears, select the drop-down menu. Select “InteractableOnPressReciever.” This allows the button to respond to a pressed event when a tracked hand presses the button.

![MR213_BuildSettings](images/mrlearning-base-ch2-2step5im.PNG)

6. Add a cube to the scene. Right click on the hierarchy area, select 3D object, then click on “cube.” Now, a cube should be in your display. It will appear very large, so adjust the coordinates (while “cube” is still selected in the hierarchy area) to decrease the size. In this case, we are using the scale x = 0.1, y = 0.1 and z = 0.1. Be sure to position the cube in your scene to place it near the pressable button, but not overlapping with the button. In the image below, the cube’s position is x = 0, y = 0.2, and z = 1. 

   > Note: In general, 1 unit in Unity is roughly equivalent to 1 meter in the physical world. There are exceptions to this, for example when objects are children of scaled objects.
   
   ![MR213_BuildSettings](images/mrlearning-base-ch2-1step6ima.PNG)

![MR213_BuildSettings](images/mrlearning-base-ch2-2step6imb.PNG)

7. In this step we will set up the cube to change color when our button is pressed. Select the holographic button in the “BaseScene” menu. In the inspector panel, under the “Select Event Type” box, click the “+” button. Drag the “cube” from the “BaseScene” menu into the “Runtime Only” box, as shown in the image below

![MR213_BuildSettings](images/mrlearning-base-ch2-2step7ima.PNG)

Click the dropdown list that says “No Function.” Select “MeshRenderer” then select “Material material.” This will allow us to change the material when the button is pressed. 

![MR213_BuildSettings](images/mrlearning-base-ch2-2step7imb.PNG)

Go to the project panel and search for the material you wish to change it to. We are going to use the material “MRTK_Standard_Cyan” for this example, found by typing in “cyan” in the project tab’s search bar (The MRTK includes many materials and colors to choose from.) Drag the material to the box underneath “MeshRenderer.material.” The MRTK materials can be found in Assets>MixedRealityToolkit.SDK>StandardAssets>Materials.

![MR213_BuildSettings](images/mrlearning-base-ch2-2step7imbb.PNG)

![MR213_BuildSettings](images/mrlearning-base-ch2-1step7imc.PNG)

The event is now set so that when the button is pressed, the cube will change color based on the material you specified. For our example, the cube will change to the cyan color.

8. Next we’re going to set up the release action so that upon release, the button will go back to its default color. Repeat Step 7 (the previous step) but this time with the “OnRelease” event instead of the “OnPress” event, as shown in the image below.

9.  In the project panel, search for a material for the cube to default to upon button release (in our case, we chose MRTK_Standard_LightGray.) Drag the material into the box below the “MeshRenderer.material” field.

![MR213_BuildSettings](images/mrlearning-base-ch2-2step8im.PNG)

Now when the button is pressed, it should change to a new color (e.g., cyan) and when the button is released it should change back to the default color you specified (e.g., light gray.) Press the “play” button on the top of the screen to try it out in the editor or deploy to your HoloLens 2 to test! To learn more about in-editor simulation, including hand simulation read the [MRTK's simulation documentation page](<https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/InputSimulation/InputSimulationService.html>). 

### Creating a panel of buttons using MRTK’s Grid Object Collection

In this section, we’ll learn how to automatically align multiple buttons into a neat user interface using the MRTK’s GridObjectCollection tool.

1. Duplicate the button from the previous section until you have 5 buttons. There are several ways to do this:
- Right click on the button and click “copy,” then go down to below the button and right click again and click “paste.” 
- Right click on the button and click “duplicate.” 
- Use the keyboard command by clicking on the cube and pressing “ctrl D” on your keyboard.

Repeat this until you have 5 total buttons (see 5 red arrows in image below).

![Mrlearning Base Ch2 3Step1im](images/mrlearning-base-ch2-3step1im.PNG)

2. Group the buttons under an empty parent game object. In order to have the buttons in grid collection, we need to group our buttons under a common parent object. Right click in the hiearachy and click “create empty.” This creates a new empty game object for you to put all the buttons in. It will show up as “gameObject.” Right click and rename it to “ButtonColletion.”

![Mrlearning Base Ch2 3Step2im](images/mrlearning-base-ch2-3step2im.PNG)

3. Move all the buttons into the new collection. Do this by selecting all five of the button objects in your heirarch and drag them all under “ButtonCollection” game object, as shown in the image below. Tip: select multiple items by holding the ctrl key while selecting items.

![Mrlearning Base Ch2 3Step3imb](images/mrlearning-base-ch2-3step3imb.PNG)

4. Add MRTK’s “Grid Object Collection” component to the button collection.	To do this, select the “ButtonCollection” parent object and in the inspector panel, click the “Add Component” button. Then search for “Grid Object Collection” in the search bar and select it when it appears in the list.

![Mrlearning Base Ch2 3Step4im](images/mrlearning-base-ch2-3step4im.PNG)

The Grid Object Collection component allows us to organize buttons or any set of objects in a neat row, column, or grid. This is one of the building blocks provided by the MRTK that provides you with a quick and simple way to create beautiful user interfaces.

5. Configure the grid object collection. To ensure all the buttons face the user, select “orient type” and then select “face parent forward” (as shown in the image.) Next, change the cell size to set the space between your buttons. Start with 0.12 units by 0.12 units for the Cell Width and Cell Height, as shown in the image below. You may need to adjust these values, depending on object/button assets chosen. Make sure "Rows" is set to 1. Then click “Update Collection” and the scene should look like the picture below. 


![Mrlearning Base Ch2 3Step5im](images/mrlearning-base-ch2-3step5im.PNG)

>Note: Depending on the orientation of the child objects or parent object, you will likely need to adjust the orientation setting differently in future projects. The Cell Width and the Cell Height fields may also need to be defined differently, depending on the size of the objects in your collection.

### Adding Text into Your Scene

In this section, we’ll cover how to add and edit text to your mixed reality experiences. If you haven’t already, please ensure you have TextMeshPro enabled in Unity by following the instructions [here](https://docs.unity3d.com/Packages/com.unity.textmeshpro@2.0/manual/index.html#installation).

1. Select the “ButtonCollection” parent object and right click the collection. Expand "3D object" in the dropdown menu, then select "TextMeshPro - Text". You should see a TextMeshPro object under the button collection, as shown in the image below.

![Lesson2 Chapter4 Step1a](images/Lesson2_Chapter4_Step1a.JPG)
![Lesson2 Chapter4 Step1b](images/Lesson2_Chapter4_Step1b.JPG)

2. In the TextMeshPro component’s Text field (located in the inspector panel, as shown below), type in “Button Collection Text.” The text will appear in the scene, but it will be hidden behind the buttons and/or the wrong size.

![Lesson2 Chapter4 Step2](images/Lesson2_Chapter4_Step2.JPG)

3. To improve the text size and placement for readability, adjust the “font size” field in the TextMeshPro component to change the size of the font. You will also need to adjust the “Rect Transform” position and scale as shown in the image below. See the images below for values used for our text configuration, and feel free to use these values as a starting point from which to further improve the size and placement of your text field.

![Lesson2 Chapter4 Step3](images/Lesson2_Chapter4_Step3.JPG)
![Lesson2 Chapter4 Step4](images/Lesson2_Chapter4_Step4.JPG)

5. To modify the text values on the button objects, click the arrow next to any button to expand it and navigate to the “SeeItSayItLabel” object, then navigate to “TextMeshPro,” where you can edit the text to your buttons as described in the steps above.

![Lesson2 Chapter4 Step5](images/Lesson2_Chapter4_Step5.JPG)

### Congratulations
In this lesson, you learned how to copy, customize, and configure an MRTK profile setting (i.e., spatial awareness mesh visibility.) You also learned how to interact with a button to trigger events using tracked hands on the HoloLens 2. Finally, you learned how to create a simple UI interface using Unity's Text Mesh Pro the MRTK's Grid Object Collection component.

[Next Lesson: Dynamic Content Placement and Solvers](mrlearning-base-ch3.md)


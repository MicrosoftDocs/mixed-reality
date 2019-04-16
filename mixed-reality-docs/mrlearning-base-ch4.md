---
title: MR Learning Base Module 3D Object Interaction
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# MR Learning Base Module 3D Object Interaction

For this lesson, we will go through basic 3D content and user experience. We will learn how to organize 3D objects as part of a collection and enable the bounding box on each 3D objects for basic manipulation.











### Chapter 1 – Adding 3D Objects

Step 1: Add an empty parent object. Right click on your hierarchy and select, “create empty.” This creates an empty game object. Rename it to “3DObjectCollection.” This is where we will put all of our 3d Objects.
Note: Make sure the collection’s positioning is set at x = , y = 0, and z = 0. 

Step 2: Import the MRTK examples. If you’re not sure how to do this, refer back to lesson 1 to see how to do this. Click on the link below to go there:
[link here]

Step 3: Add the first 3D object. For this example, we are adding the coffee cup. To find the coffee cup, in the search bar in your projects tab, type in “coffee.” Look for the coffee cup prefab.
Note: The coffee cup prefab can be recognized by a blue cube next to it. Do not select the coffee cup with the blue cube and white paper, because that is the original model. This goes for all 3D objects. You will also see several coffee cup prefabs. If you click on them, you can see a preview of them in the preview window under the inspection panel. Choose whichever you like best.







Step 4: drag the coffee cup prefab of your choice into the 3DObjectCollection from step 1. Now you see that the coffee cup is now a child of the collection.
 
Step 5: Add other 3D objects into your scene. 
In this step we will add several more 3D objects. Below is a list of objects we are going to add in this example. As you add the objects you might notice that they appear in your scene in various sizes. To fix this, adjust the sizes under the transform setting in the inspector panel. The proper adjustments for this example are listed with the objects below. 
Search these words in the search box in your project panel and drag the 3D object prefab into the 3DObjectCollection just like the previous step, but with these objects:
•	Search for “module.” Add TheModule. Set the scale to x= = 0.03, y = 0.03, z = 0.03. 
•	Search for “Octa.” Add Octa. Set the scale to x = 0.13. y = 0.13, z =0.13.
•	Search for “earth.” Add EarthCore. Set the scale to x = 50.0 y = 50.0, z = 50.0.
•	Search for “Cheese.” Add Cheese. Set the scale to x = 0.05, y = 0.05, z = 0.05.
•	Search for “platonic.” Add Model_Platonic. Set the scale to x = 0.13, y = 0.13, z = 0.13.
Here is an example to help.










Note: Make sure the positioning for all objects is x = 0, y = 0, and z = 0.
Step 6: Add 3 cubes into your scene. Right click the 3DObjectCollection, select 3D object, then click cube. Set the scale to x = 0.14, y = 0.14, and z = 0.15. Repeat this step 2 times. Or, you can select the cube and press “control/command D” 2 times to copy the cube. 
Step 7: Organize your collection of objects to form a grid. Forming a grid was what we discussed in lesson 2, so if you are unsure on how to do this, see lesson 2 and click the link below.
[link here]





For this example, we are going to organize the objects to have 3 rows, have them face parent forward, make the layout horizontal, and change the surface type to sphere. Feel free to adjust your grid in a way that looks good to you. Click “update collection” when finished.
 
Note: You may notice that some of the objects are off-center. This is because of the way some of the prefabs are put in to your parent object (in this case, 3DObjectCollection). Make sure you adjust the prefabs as needed (either by clicking on the object in your scene and dragging it in to place or by changing the positioning in the inspector panel).


### Chapter 2 – Manipulating 3D Objects
Step 1: Add the ability to manipulate to a cube. To add the ability to manipulate 3D objects you must do the following:
1.	Select the 3D object you want to manipulate in your hierarchy (in this example, one of your cubes).
2.	Click “add component.” 
3.	Search for “manipulation.”
4.	Select “manipulation handler.”
 
The manipulation handler is a component that will allow you to customize manipulation on your object. With this you have a wide variety of manipulation settings that allow you to change the features of your object. This includes rotation, scaling, moving, and constraining movement on certain axes. 
Tip: instead of adding the manipulation handler to each object individually, you can select all the objects in your 3DObjectCollection by holding control/command and select add component and then add the manipulation handler (just like step 1). Now all of your objects have the manipulation handler.
Note: By default, the manipulation handler is set up to be able to move the object with one or two hands from far away and your able to move it rotate it and scale it. 
Step 2: Restrict the cube so that it can only be scaled. To do this next to “two handed manipulation type,” click the menu to the right and select “scale.” This makes it so that the user can only change the cube’s size.
 
Step 3 change the color of each cube so that we can differentiate from them. 
•	Go to the project panel and scroll down until you see “MixedRealityToolkit.SDK” then select it.
•	Select the “Standard Assets” folder.
•	Click on the “materials” folder.
•	Select 3 materials for each of your cubes. 
	Note: You can choose any color you want for these cubes. For our example, we are going to use “glowingcyan,” “glowingorange”, and green. Feel free to experiment with different colors. To add the color to the cube, click the cube you want to change the color of, then drag the material to the inspector panel. 
   


Step 4: Select the third cube and make it so that its movement is constrained to the fix distance from the head. To do this, on the right of “constraint on movement,” click on the dropdown menu and select “fix distance from the head.” This makes it so that the user can only move the cube within their field of vision. 
 
Goal of the next few steps: Make it so that the user can grab and interact with an object.
We are going to do this with the cheese object.
Step 5: Select the cheese object and in the inspector panel, click “add component.” 
Step 6: Search in the search box “near interaction grabbable” and select the script.
 This allows users to reach out and actually grab the objects. 
Step 7: Add this script to the Octa object and the Platonic object as well (repeat step 5 and 6 but with these two objects).
This will allow the user to interact with those objects up close and far away. 
Step 8: Remove far manipulation from the Octa object. To do this, select the Octa in the hierarchy, and uncheck the “allow far manipulation” checkbox (marked by a green circle). This makes it so that users can only interact with the octa using the gaze-ray (HoloLens) or the tracked hands (HoloLens2).

Note: For the full documentation of the manipulation handler component and each of the setting please refer to the link below:
[link here]






Step 9: Add the near interaction grabbable component to the earth core, the lunar module and the coffee cup.
Step 10: For the lunar module, in this example, change the behavior so that it rotates about the object center for both near and far interaction.
 
Step 11: For the earth core, in this example, change the release behavior to “nothing.” This makes it so that once the earth core is released from the users’ grasp, it doesn’t move. 

Note: This setting is extremely useful when wanting to create a ball that you can throw. Keeping the velocity and the angular velocity makes it so that once the ball is released it will continue to move at the velocity it was released at.





### Chapter 3 – Adding Bounding Boxes
Bounding boxes make it easier to manipulate objects from one had from afar and up close. It makes it easier to scale the boxes and visualize which objects are being handled. 
Note: Before you can add a bounding box to an object you need to have a collider on the object (i.e. a box collider, wheel collider, etc.). So instead of adding a bounding box first, we must add a collider to the object.






Step 1: Add a box collider to the earth core object. To do this, select the earth core object from the 3DObjectCollection. In the inspector tab, click “add component” and search for “box collider.” However, in the case of the earth core, we will need to add the box collider to the node_id30 object underneath the earth core. So instead of selecting the earth core, select node_id30 and follow the rest of this step.

Note: Make sure that you visualize the box collider so that it’s not too big or too small. It should be roughly the same size as the object it’s surrounding (in this example, the earth core). Adjust the box collider as needed by selecting the edit collider option in the box collider. You can either changing the x, y, and z values or drag the bounding box handlers in the editor scene window. 
 

Step 2: Add a bounding box to the earth core object. To do this, select the earth core object from the 3DObjectCollection. In the inspector tab, click “add component” and search for “bounding box.” 
Step 3: Under behavior you’ll see the activation setting. In this example we want to activate it from the beginning so select “activate on start.” There are other activation settings. To review what these settings do and how they work, please click the link below.
[link here]
We can also change how the bounding box looks by adjusting the box material, the material of it while it’s being grabbed, as well as any handles (corner or side handles). The MRTK contains some default materials that we can use for bounding boxes.
Step 4: In the project panel, search for “boundingbox” and you’ll see a list of materials denoted by a blue sphere in the search results. 
Step 5: Drag the “boundingbox” material into the box material slot on the bounding box component. Also grab the “boundingboxgrabbed” material and put that in the box grabbed material slot on the bounding box component.
Step 6: Drag the “MRTK_BoundingBox_ScaleWidget” material into the scale handle prefab slot on the bounding box component. 
Step 7: Drag the “MRTK_BoundingBox_RotateWidget” material into the rotation handle slot on the bonding box component.
 
Step 8: Make sure the bounding box is targeting the right object. In the bounding box component, there is the “target object” and “bounds override” scripts. Make sure to drag the object that has the bounding box around it to both of these slots. So, in this example, drag the node_id30 object to both these slots.
 
Now with these settings what you should see when you start the application is that your object is surrounded by a blue frame. You’re welcome to drag the corners of that frame to resize the object. If we want the scaling objects and the rotation objects to be more visible the default bounding box makes those pieces stand out. 
Step 9: Return to the default bounding box. To do this, in the inspector panel, go to the rotation handle prefab, click it and press the delete key. With these changes, you should see circles around the edges and cubes around the corners. This permits it so that the cubes resize the object, and the circles rotate the object.
 
Chapter 4 – Adding Touch Effects
In this example, we are going to make it so that a music clip plays when you touch the octa with your hand.
Step 1: Add the audio source. Select the octa object in your base scene hierarchy. Now in the inspector panel, click the add component button, select audio source. We’ll specify the audio clip in step ___. 
Note: We have already added a box collider which is needed for the ability to touch objects. Ensure that the box collider is still there.
Step 2: Add in the “near interaction touchable” component. Click Add Component in the inspector panel and search for “near interaction touchable.” Select it. 
Note: Previously we added the “near interaction grabbable.” The difference between this and “near interaction touchable” is that the grabbable interaction makes it so that an object can be grabbed and interacted with. The touchable only makes it so that you can reach out and touch the object.


Step 3: Add in the “hand interaction touch” script. Note that this script is included with the unity scene you imported as part of this demo package and it is not included in the original MRTK. Just like the previous step, click “add component” and search for “hand interaction touch” to add it. 
Notice that you have 3 options with the script. One, the on touch completed. This will program the event to trigger when you touch and release the object. Two, the on touch started. This will program the event to trigger only when the object is touched. Third, the on touch updated, which will program the event to trigger when your hand comes close to the object. For this example, we will be working with the “on touch started” setting.
 
Step 4: Click the “+” button on the “on touch started” option to add the script to the object. Drag the octa object into the slot as shown above. 
Step 5: Add the audio clip. 

Note: The MRTK does provide a small list of audio clips. Feel free to explore these in your project panel. You will find them under the “MixedRealityToolkit.SDK” folder and then the “standard assets” folder. There you will see an “audio” folder where all the audio clips are. 
For this example, we are going to use the MRTK_Gem audio. To add an audio clip, simply drag the clip you want from the project panel into the AudioSource.PlayOneSlot (marked by green box in the example above) in the inspector panel.
Now when the user reaches out and touches the octa object, the audio track “MRTK_Gem” will play. The script will also adjust the color of the object when touched. 

Congratulations! You just learned how to organize 3D objects in a grid collection and how to manipulate 3D objects using a variety of different settings (from scaling, rotating, and moving both from a distance and from touch). You also learned how to put bounding boxes around 3D objects along with how to use the gizmos on the bounding boxes and how to trigger them. Finally, you just learned how to directly touch an object and how to trigger events from the touch.

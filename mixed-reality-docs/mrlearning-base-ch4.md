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

In this lesson, we will go through basic 3D content and user experience. We will learn how to organize 3D objects as part of a collection, learn about bounding boxes for basic manipulation, learn about near and far interaction, and learn about touch and grab gestures with hand tracking. 

## Objectives

* Learn how to organize 3D content using MRTK's Grid Object Collection
* Implement bounding boxes and basic manipulation
* Explore near and far interaction
* Learn about additional hand tracking gestures such as grab and touch

## Instructions

### Organizing 3D Objects in a Collection

1. Right click on your hierarchy and select, “create empty.” This creates an empty game object. Rename it to “3DObjectCollection.” This is where we will put all of our 3D Objects. Make sure the collection’s positioning is set at x = 0, y = 0, and z = 0.

![Lesson4 Chapter1 Step1im](images/Lesson4_Chapter1_step1im.PNG)

2. Import BaseModule Assets Using the same instructions to import custom packages outlined in [Lesson1](mrlearning-base-ch1.md). The BaseModule assets include 3D modules and other useful scripts that will be used throughout this tutorial. The BaseModule unity package can be found here: 

3. The coffee cup prefab can be recognized by a blue cube next to it. Do not select the coffee cup with the blue cube and small white paper (that denotes the original 3D model and not the prefab.) 

![Lesson4 Chapter1 Noteaim](images/Lesson4_chapter1_noteaim.PNG)

>Note: The coffee cup prefab can be recognized by an icon of a blue cube next to it. Do not select the coffee cup with the icon of a blue cube and small white paper (that denotes the original 3D model and not the prefab.) 

4. Drag the coffee cup prefab of your choice into the "3DObjectCollection" game object from step 1. The coffee cup is now a child of the collection.

![Lesson4 Chapter1 Step4ima](images/Lesson4_chapter1_step4ima.PNG)

5. Next, we'll add more 3D objects into our scene. Below is a list of objects we are going to add in this example. As you add the objects you may find that they appear in your scene in various sizes. Adjust the scale of each 3D model under the transform setting in the inspector panel. Recommended adjustments for this example are listed with the objects below. 
Search these words in the search box in your project panel and drag the 3D object prefab into the "3DObjectCollection" object similar to the previous step:
- Search for “module.” Add TheModule. Set the scale to x= = 0.03, y = 0.03, z = 0.03. 
- Search for “Octa.” Add Octa. Set the scale to x = 0.13. y = 0.13, z =0.13.
- Search for “earth.” Add EarthCore. Set the scale to x = 50.0 y = 50.0, z = 50.0.
- Search for “Cheese.” Add Cheese. Set the scale to x = 0.05, y = 0.05, z = 0.05.
- Search for “platonic.” Add Model_Platonic. Set the scale to x = 0.13, y = 0.13, z = 0.13.

![Lesson4 Chapter1 Step5im](images/Lesson4_Chapter1_step5im.PNG)

6. Add 3 cubes into your scene. Right click the “3DObjectCollection” object, select “3D Object”, then select “Cube.” Set the scale to x = 0.14, y = 0.14, and z = 0.14. Repeat this step 2 additional times to create a total of 3 cubes. Alternatively, you may duplicate the cube twice for a total of 3 cubes. 

![Lesson4 Chapter1 Step6im](images/Lesson4_Chapter1_step6im.PNG)

7. Organize your collection of objects to form a grid using the procedure described in [Lesson 2](mrlearning-base-ch2.md) using the MRTK’s Grid Object Collection. Refer to the image below to see an example of configuring the objects in a 3x3 grid.

![Lesson4 Chapter1 Notebim](images/Lesson4_chapter1_notebim.PNG)

>Note: You may notice that some of the objects are off-center, such as the objects in the image above. This is because prefabs or objects may have child objects that are not aligned. Feel free to make any necessary adjustments to object positions or child object positions to achieve a well-aligned grid.


### Manipulating 3D Objects
1. Add the ability to manipulate to a cube. To add the ability to manipulate 3D objects you must do the following:
-	Select the 3D object you want to manipulate in your hierarchy (in this example, one of your cubes).
-	Click “add component.” 
-	Search for “manipulation.”
-	Select “manipulation handler.”
-   Repeat for all 3D objects under the “3DObjectCollection” object but not the “3DObjectCollection” itself.

![Lesson4 Chapter2 Step1im](images/Lesson4_chapter2_step1im.PNG)
 
>The manipulation handler is a component that will allow you to adjust settings for how objects behave when being manipulated. This includes rotation, scaling, moving, and constraining movement on certain axes. 



2. Restrict one cube so that it can only be scaled. Select one cube in the “3DObjectCollection” object. In the inspector panel, next to “two handed manipulation type,” click the drop-down menu and select “scale.” This makes it so that the user can only change the cube’s size.

![Lesson4 Chapter2 Step2im](images/Lesson4_Chapter2_step2im.PNG)
 
3. Change the color of each cube so that we can differentiate between them. 
-	Go to the project panel and scroll down until you see “MixedRealityToolkit.SDK” then select it.
-	Select the “Standard Assets” folder.
-	Click on the “materials” folder.
-	Drag a different material onto each of your cubes. 

>Note: You can choose any color for your cubes. For our example, we are going to use “glowingcyan,” “glowingorange”, and "green." Feel free to experiment with different colors. To add the color to the cube, click the cube you want to change the color of, then drag the material to the inspector panel. 
   
![Lesson4 Chapter2 Step3im](images/Lesson4_Chapter2_step3im.PNG)

4. Select another cube in the “3DObjectCollection” object and make it so that its movement is constrained to the fix distance from the head. To do this, on the right of “constraint on movement,” click on the dropdown menu and select “fix distance from the head.” This makes it so that the user can only move the cube within their field of vision. 
 
![Lesson4 Chapter2 Step4im](images/Lesson4_chapter2_step4im.PNG)

Goal of the next few steps: We will enable grab and interaction with our 3D objects. We will apply different manipulation settings 

5. Select the cheese object and in the inspector panel, click “add component.” 

6. Search in the search box for “Near Interaction Grabbable” and select the script. This component allows users to reach out and grab the objects with tracked hands. Objects will also be allowed to be manipulated from a distance, unless the "Allow Far Manipulation" checkbox is unchecked (denoted by green circle in image below.)
 
![Lesson4 Chapter2 Step6im](images/Lesson4_Chapter2_step6im.PNG)

7. Add “Near Interaction Grabbable” to the Octa object and the Platonic object  by repeating step 5 and 6 on those objects.

8. Remove the ability of far manipulation from the Octa object. To do this, select the Octa in the hierarchy, and uncheck the “allow far manipulation” checkbox (marked by a green circle). This makes it so that users can only interact with the octa directly using tracked hands.

>Note: For the full documentation of the manipulation handler component and it's associated settings, please refer to the [MRTK Documentation](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_ManipulationHandler.html).

9. Add the near interaction grabbable component to the earth core, the lunar module and the coffee cup.

10. For the lunar module, in this example, change the behavior so that it rotates about the object center for both near and far interaction.
 


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

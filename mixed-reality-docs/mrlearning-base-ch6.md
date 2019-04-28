---
title: Lunar Module Assembly Sample Experience
description: In this lesson, we will combine multiple concepts learned from previous lessons to create a unique sample experience.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# Lunar Module Assembly Sample Experience

In this lesson, we will combine multiple concepts learned from previous lessons to create a unique sample experience. We will create a lunar module assembly application whereby a user will need to use tracked hands to pick up lunar module parts and attempt to assemble a lunar module. We will use pressable buttons to toggle placement hints, to reset our experience, and to launch our lunar module into space! In future tutorials, we will continue to build upon this experience, including powerful multi-user use-cases that leverages Azure Spatial Anchors for spatial alignment.

## Objectives

- Combine multiple concepts from previous lessons to create a unique experience
- Learn how to toggle objects
- Trigger complex events using pressable buttons
- Use rigidbody physics and forces
- Explore the use of tool tips

## Instructions

### Configuring the Lunar Module

In this chapter, we will be introduced to the various components needed to create our sample experience.

1. Add the Lunar Module to your Base Scene. To do this, in your project tab, search for “rocket launcher tutorial.” You will see 2 rocket launcher prefabs; one with the name "tutorial" and another with the name "complete." Drag the “RocketLauncher_Tutorial” to your Base Scene. Feel free to change the positioning.
   Note: The RocketLauncher_Complete is the completed launcher, so if you would like to see the completed version for reference or just to use, feel free to use it. For this example, we must use the RocketLauncher_Tutorial.  

Now, if you expand the RocketLauncher_Tutorial you will notice a bunch of other objects connected to it. Go down to Lunar Module and expand that as well. You will see that the Lunar Module’s in game child objects all have a shader called “x-ray.” What this does is make the Lunar Module slightly translucent to make it easier for the user to place the objects properly in the module. 

![Lesson6 Chapter1 Step1im](images/Lesson6_Chapter1_step1im.PNG)



![Lesson6 Chapter1 Noteaim](images/Lesson6_Chapter1_noteaim.PNG)
There are five parts to the lunar module that the user is going to interact with:
1.	The Rover Enclosure
2.	The Fuel Tank
3.	The Energy Cell
4.	The Docking Portal 
5.	The External sensor

![Lesson6 Chapter1 Notebim](images/Lesson6_Chapter1_notebim.PNG)

Note: The titles that you see in your base scene hierarchy do not correspond to the names of the objects in the scene.
The first thing we want to do is configure the lunar module by adding some functionality to it. By default, you should see a transform, a rigid body and a box collider in the inspector panel with the lunar module selected.
A rigid body gives the object some physics to make it interactable. This will allow us to add a force to it so that it can move on its own. In our case, so that it can be launched in to space.




Step 2: Add an audio source to the lunar module. Make sure the lunar module is selected in your base scene hierarchy and click “add component.” Search for “audio source” and add it to the object. Leave it blank for now. We will use this to play the launching sound.
 ![Lesson6 Chapter1 Step2im](images/Lesson6_Chapter1_step2im.PNG)
Step 3: Add the script “toggle placement hints.” Just like before, click add component and search for the script. This is a custom script that we’ve developed that allows you to turn on and off the translucent hints mentioned earlier. 
![Lesson6 Chapter1 Step3im](images/Lesson6_Chapter1_step3im.PNG)
Step 4: Since we have 5 objects, type in “5” for the game object array. Then you should see 5 new elements appear. Now what you want to do is drag each of the translucent objects into the boxes that say “None (Game Object).” 
Drag the following objects from the lunar module in your base scene: 

•	Backpack

•	GasTank

•	Topleftbody

•	Nose

•	LeftTwirler

 ![Lesson6 Chapter1 Step4aim](images/Lesson6_Chapter1_step4aim.PNG)

![Lesson6 Chapter1 Step4bim](images/Lesson6_Chapter1_step4bim.PNG)

Now the” toggle placement hints” is configured. This will allow us to turn the hints on and off.

Step 5: Add the launch lunar module script. Click the add component button, search for launch lunar module and select it. This script will be responsible for launching the lunar module. When we press a button, it will add a force to the lunar module and will cause the module to launch upwards. 

Note: if you are indoors, the lunar module will crash against your ceiling. But if you are outdoors, it will fly in to space indefinitely. 

![Lesson6 Chapter1 Step5im](images/Lesson6_Chapter1_step5im.PNG)

Step 6: Adjust the thrust so that the lunar module will fly up gracefully. The number we discovered that was best for this was 0.01. Leave the Rb blank. Rb stands for rigid body, so since the ridged body already has a script of its own, leaving this section blank will allow the script to pull the information from the main ridged body script. 

![Lesson6 Chapter1 Step6im](images/Lesson6_Chapter1_step6im.PNG)

### Chapter 2 – Lunar Module Parts Overview
The Lunar Module parts parent object is the collection of the objects that the user will interact with. This includes Backpack, GasTank, TopLeftBody, Nose, and LeftTwirler, or the fuel tank, the energy cell, the rover enclosure, the external center and the docking portal as labeled in the scene. 
Notice that each of these objects has the manipulation handler, as discussed in lesson 4. With the manipulation handler, users are able to grab and manipulate the object. Also note that the setting “two handed manipulation type” is set to “move and rotate.” This only permits the user to move the object around and not change its size. Since these objects are going to be added to the lunar module, we don’t want to allow the user the ability to change their sizes. 
In addition, far manipulation is unchecked. The goal is to make this application as realistic as possible, so in order to do that, the objects can only be grabbed from up close. 

![Lesson6 Chapter2im](images/Lesson6_Chapter2im.PNG)

Now the part assembly demo script is the scrip that allows the objects to be placed on to the lunar module by the user. The Object To Place is the object that is selected (in this case, the backpack/fuel tank) with the object that it can connect to (in this case, the transform.” The Near and Far distance settings are what set the requirements for the object’s positioning in order to attach to the lunar module. In other words, the Near Distance sets the location where the object needs to be to attach to the lunar module. In this case, the backpack/fuel tank would need to be 0.1 units away from the lunar module to snap into place. The Far Distance sets the location where the object needs to be to detach from the lunar module. In this case, the user’s hand must grab the backpack/fuel tank and pull it 0.2 units away from the lunar module to remove it and hold it in their hand.
The ToolTips are the labels in the scene. When the objects are snapped in place, the label will be disabled. The Audio Source will be automatically grabbed. 
Note: ToolTips are included in the MRTK, unlike some of the other objects discussed in earlier lessons. 
These scripts are all identical for each object allowing the user for a more consistent experience. 

### Chapter 3 – Placement Hints Buttons
In Lesson 2, you learned how to place and configure buttons to do things like change the color of an item or make it play a sound when it is pushed. Lesson 2 will be referred a few times throughout this chapter, as placement hints buttons use the same functionality. 
The goal is to make it so that every time the user presses the placement hint button, it will toggle translucent placement hints, permitting them to turn either on or off. Remember from chapter 1 that we put the toggle placement hints script in the Lunar Module.

Step 1: Move the Lunar Module to the empty “runtime only” slot in the inspector panel while the Placement Hints object is selected in your base scene hierarchy. 
 ![Lesson6 Chapter3 Step1im](images/Lesson6_Chapter3_step1im.PNG)
Step 2: Now click the dropdown list where it says, “no function.” Go down to “TogglePlacementHints,” and under that menu select “ToggleGameObjects ().” That will toggle the placement hints on and off so that they are visible or invisible every time the button is pressed.
 ![Lesson6 Chapter3 Step2im](images/Lesson6_Chapter3_step2im.PNG)

### Chapter 4 – Configuring the Reset Button

There will be situations where the user makes a mistake, or accidently throws the object away, or just wants to do the project all over again. The reset button will add the ability to, as you might’ve guessed, restart the experience. 
Step 1: Select the reset button. In the base scene, it’s named “ResetRoundButton.” 

Step 2: Just like before, drag the lunar module from the base scene hierarchy into the empty slot under “button pressed” the inspector panel.
 ![Lesson6 Chapter4 Step2im](images/Lesson6_Chapter4_step2im.PNG)
That will reset the Lunar Module’s location and will also turn off the thrusters. It would be like nothing happened!

Step 3: Just like Chapter 3, select the dropdown menu that says, “no function” and hover over “LaunchLunarModule.” Now select “resetModule ().”
Note: Fortunately, the rocket launcher is already configured. You will notice that by default the “GameObject.BroadcastMessage” is configured to “ResetPlacement.” What this does is it will, starting with the RocketLauncher_Tutorial, broadcast a message called “ResetPlacement” for everything underneath the RocketLauncher_Tutorial. Any script that has a method for reset placement will respond to that message by returning back to their original place. Every object that the user can interact with has this method, so all of them will respond to the message. 
![Lesson6 Chapter4 Step3im](images/Lesson6_Chapter4_step3im.PNG)
### Chapter 5 – Launching the Lunar Module
This chapter, similar to the previous chapters, we will be configuring the launch button! This will permit the user to press the button and launch the Lunar Module into space!

Step 1: Select the launch button (in the base scene it’s named “LaunchRoundButton”). Drag the Lunar Module to the empty slot under “Touch End” in the inspector panel.
 ![Lesson6 Chapter5 Step1im](images/Lesson6_Chapter5_step1im.PNG)
Step 2: Just like the previous 2 chapters, select the dropdown menu that says, “no function.” Hover over “LaunchLunarModule” and select “StopThruster ().” This will control how much thrust the user wants to give to the Lunar Module. 
 ![Lesson6 Chapter5 Step2im](images/Lesson6_Chapter5_step2im.PNG)
Step 3: Under Button Pressed, add the Lunar Module like step 1 (click, hold, and drag) to the empty slot. 

Step 4: Like step 2, click the dropdown menu that says, “no function” and hover over “LaunchLunarModule” and select “StartThruster ().” 
 ![Lesson6 Chapter5 Step4im](images/Lesson6_Chapter5_step4im.PNG)
Step 5: Add music to the Lunar Module so that when the rocket takes off, the music will play. To do this, drag the Lunar Module to the next empty slot under Button Pressed like steps 1 and 3.
Note: To add redundancy, and to ensure that the program will undoubtedly stop the thrusters, do the same thing steps 1 - 5 did but for “Button Pressed” and “Button Released." Make sure that when the button is pressed, the thrust will start, and when the button is released, the thrust will stop.

Step 6: This time, select the dropdown menu that says, “no function” and hover over “AudioSource” (instead of LaunchLunarModule) and select “PlayOneShot (AudioClip).”
 ![Lesson6 Chapter5 Step6im](images/Lesson6_Chapter5_step6im.PNG)
Note: The sound you want it to play is strictly up to you. Feel free to explore the variety of sounds that you can use, as there are several unique options. For this example, we are going to stick with “MRTK_Gem.” It should be there by default. To find these sounds, return to Lesson 5, Chapter 1, steps 15 and 16. It’s the same structure for this model as well.


### Congratulations 
You have fully configured this application! Now when you press play, you can fully assemble the Lunar Module, toggle hints, launch the Lunar Module, and reset it to do it all over again.

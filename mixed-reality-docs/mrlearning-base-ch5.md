---
title: MR Learning Base Module Advanced Input
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# MR Learning Base Module Advanced Input

In this lesson, we will be going over a few advanced inputs such as voice commands, eye tracking and panning. 

### Chapter 1 – Enabling Voice Commands

We will be adding 2 voice commands in this chapter. First, the ability to toggle the diagnostics. Second, the ability to play a sound with voice command. Before we get started it’s important to know where voice commands are stored. In the MRTK game object, look at the input system settings. Just as we learned in Lessons 1 and 2, we need to make copies of the MRTK profiles in order to edit them. We will need to make copies as needed.
Step 1: In the Base Scene hierarchy select MixedRealityToolkit. In the inspector panel, scroll down to the input system settings. Double click to open up the input system profile.
 
In the input system profile, you will see a variety of settings. For voice commands, go down to where it says, “Speech Command Settings.” 
Step 2: Double click on the speech command profile. From there, you’ll notice a lot of settings you can adjust. For a full description on all the settings refer the MRTK documentation in the link below.
[link here]
Note: By default, the general behavior is auto-start. That can be changed to manual-start if desired, but for this example we are going to keep it on auto-start. Also, you can set the recognition confidence level from low, to medium or high. For this example, we are leaving it at the default level of medium. In addition, the MRTK comes with several voice commands (such as menu, toggle diagnostics, and toggle profiler). We will be using the keyword “toggle diagnostics” in order to turn on and off the diagnostics framerate counter. We will also add a new voice command.
 
Step 3: Add a new voice command. To add a new voice command, click on the “+ add a new speech command” button and you will see a new line that appears down below the already existing voice commands. Type in the voice command you want to use. In this example we are going to use the command “play music.”
Tip: You can also set a keycode for speech commands. For example, if you wanted to test your program through the application on the computer you can assign a key to the speech command to test if it works. You can also assign the voice command to trigger when pressing a button. 


In your scene you need to add in the ability to respond to voice commands. It can be assigned to any existing object or a new empty object. In this example, we are going to assign it to the very last button from the button collection in lesson 2. In order to respond to a voice command, you need to add in the speech handler component.
Step 4: Add the ability to respond to voice commands. Select the last button in the button collection in the base scene hierarchy. In the inspector panel, go down and click “add component.” Type in “speech input handler.” Select it.
 
By default, you will see 2 checkboxes, one is the “is focus required” checkbox. What this means is as long as you are pointing to it with a gaze ray, (eye-gaze, head-gaze, controller-gaze, or hand-gaze) the voice command will work. Uncheck this checkbox to make it so that the user does not have to look at the object to use the voice command.
 
Step 5: Add the ability to respond to a voice command. To do this, click the “+” button that’s in the speech input handler and select the keyword you would like to respond to.
Note: These keywords are populated based on the profile you edited in the previous step.
Step 6: Next to “Keyword” you will see a dropdown menu. In this case we are going to select “Toggle Diagnostics.” This will make it so that whenever the user says the phrase, “toggle diagnostics” it will perform an action.
 
Step 7: Add the “diagnostics demo control script” to toggle the framerate counter diagnostic on and off. To do this, press the “add component” button and search for “diagnostics demo control script” then add it from the menu. 
Note: this script is only included with these modules and is not included with the original MRTK.
 
Step 8: Add a new response in the Speech Input Handler. To do this click the “+” button underneath where it says “response ()” (marked by green arrow in the picture above).
Step 9: Since we are programming the last button in the button collection, drag the last button from the base scene hierarchy to the new response you just created in step 8.
 
Step 10: Now select the “no function” dropdown list, select diagnostic demo controls, then “on toggle diagnostics ().”
This function toggles your diagnostics on and off.
 
Now your diagnostics profile should respond to your voice command. Note that before building to your device you need to enable mic settings. To do that click on file, go to build settings, from there, player settings, and ensure the microphone capability is set.
 
Next, we are adding the ability to play an audio file from voice command. To do this, select the octa object. Now if you recall from lesson 4, we added the ability to play an audio clip from touching the octa. Now we will add the voice command ability to the octa as well.
Step 11: Select the octa object in the base scene hierarchy.
Step 12: Repeat steps 4 and 5 but with the octa object instead. 
Step 13: Instead of adding the “Toggle Diagnostics” voice command from step 6, add the “play music” voice command.
 
Step 14: Just like before with steps 8 and 9, add a new response, and drag the octa to the empty slot on response.
Step 15: Again, just like before, select the dropdown menu that says “no function” but instead of going for the diagnostics, select “Audio Source,” then from there click on “PlayOneShot (AudioClip).”
 
Step 16: For the audio clip, for this example we are going to use the same audio clip from lesson 4. Go into your project panel, search for “MRTK_Gem” audio clip and drag it into the audio source slot.
 
Now your application should be able to respond to the voice commands “toggle diagnostics” and “play music” no problem!









### Chapter 2 – The Pan Gesture 

In this chapter, we will learn how to use the pan gesture. It’s useful for scrolling (using your finger or hand to scroll through content) and is another form of input, so you can use it to adjust or modify content as you desire. For example, you can use the pan gesture to rotate objects, to cycle through a collection of 3D objects, or even 2D unity-based UI.
We will be learning how to use the pan gesture to modify and scroll through texture. We will also go over how to move a collection of 3D objects.
Step 1: Create a quad. In your base scene hierarchy, right click, select “3D area,” then select “quad.”

Step 2: Place the quad in your scene that makes the most sense. For our example, we set the x = 0, the y = 0 and the z = 1.5 away from the camera. 
Note: If the quad blocks anything from the previous lessons be sure to move it in a way that doesn’t block any of the other objects.
Step 3: Apply a material to the quad. This material will be the material we will be scrolling through with the pan gesture. 







Step 4: In your projects panel, type in the search box “pan content.” Drag that material on to the quad in your scene. 
 
Note: Pan content is not included in the MRTK, but it is an asset in this module. If you imported this module it should be included. Also, when you add the pan content, it may look stretched. You can fix this by adjusting the values x, y and z values of the size of the quad until you are satisfied with the way it looks.
To use the pan gesture, you will need a collider on your object. You may see the quad already has a mesh collider. However, the mesh collider is not ideal, because it is extremely thin, and you need to be very exact with your touch when you go to touch it. To make it more forgiving, we suggest replacing the mesh collider with a box collider, which is much thicker and easier to touch.
Step 5: Right click the mesh collider that’s on the quad (in the inspector panel) then remove it by clicking “remove component.” 

 
Step 6: Now add the box collider by clicking “add component” and searching “box collider.” The default added box collider is still a little thin, so click the “edit collider” button to edit it. When it’s pressed in, you can adjust the size using the x, y and z values or the elements in the scene editor. For our example, we want to extend the box collider a little behind the quad. In the scene editor, drag the box collider from the back, outwards (see the image below). What this will do is allow the user to not only use their finger, but their entire hand to scroll. 
 
Step 7: Add in the interactivity. Since we want to interact with the quad directly, we want to use the “near interaction touchable” component (we also used this in Lesson 4 for playing music from the octa). So click “add component” and search for “near interaction touchable” and select it. 
 

Step 8: Add the ability to recognize the pan gesture. Click “add component” and type “hand interaction pan.” It has a setting that asks which type of touch you want for it to use. You have a choice between hand ray (allowing you to pan from a distance) and index finger. For this example, leave it at index finger. Remember that we extended the box collider so that the index finger can be more accurate. This is why!
 
Step 9: In the hand interaction pan you’ll see some settings you can mess with. The “lock horizontal” and “lock vertical” checkboxes will lock the movements to which they correspond. The wrap texture settings will make it so that when you’re moving the picture around the text will follow. For this example, we are going to check that box. There is also “velocity active” which, if unchecked, the pan gesture will not work. Check this box as well. Now you should have a pan-enabled quad.
Panning textures is useful, but we also want to ad the panning gesture to 3D objects as well. To do this, we are going to create several child objects under the quad we created. 
Step 10: Right click the quad object, select 3D object then click “cube.” Scale the cube so that it’s roughly x = 0.1, y = 0.1 and z = 0.1. Copy that cube 3 times (by right clicking the cube and pressing duplicate, or by pressing control/command D). Space them out evenly. Your scene should look similar to the picture below.









Step 11: Select the quad again, and under the hand interaction pan script, we want to set the pan actions to each of the cubes. Under “pan event receivers” we want to specify the number of objects that are receiving the event. Since there are 4 cubes, type “4” and press enter. 4 different elements should appear.
 








Step 12: Drag each of the cubes in to each of the empty element slots.
 
Now whenever we pan those cubes those events will be sent to the cubes. However, there is no event set for the cubes to receive. 

Step 13: Add an the “move with pan” script to all of the cubes. To do this, press and hold control/command and select each object. Then, in the inspector panel, click “add component” and search for “move with pan.” Click the script and it will be added to each cube. 
Now the 3D objects will move with your pan! If you remove the mesh render on your quad, you should now have an invisible quad where you can pan through a list of 3D objects.


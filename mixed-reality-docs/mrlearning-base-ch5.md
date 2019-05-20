---
title: MR Learning Base Module - Advanced Input
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
ms.localizationpriority: high
keywords: mixed reality, unity, tutorial, hololens
---

# MR Learning Base Module - Advanced Input

In this lesson, we will explore several advanced input options for the HoloLens 2, including the use of voice commands, the panning gesture, and eye tracking. 

## Objectives

- Learn how to trigger events using voice commands and keywords
- Use tracked hands to pan textures and 3D objects
- Leverage the HoloLens 2's eye tracking capabilities to select objects

## Instructions

### Enabling Voice Commands

In this section, we will be implementing two voice commands. First, the ability to toggle the frame rate diagnostics panel by saying "toggle diagnostics." Second, the ability to play a sound with a voice command. We will first explore the MRTK profiles and settings responsible for configuring voice commands. 

1. In the Base Scene hierarchy select "MixedRealityToolkit." In the inspector panel, scroll down to the input system settings. Double click to open up the input system profile. Clone the input system profile to make it editable, as we learned in [Lesson 1](mrlearning-base-ch1.md) 

In the input system profile, you will see a variety of settings. For voice commands, go down to where it says, “Speech Command Settings.” 

![Lesson5 Chapter1 Step2im](images/Lesson5_Chapter1_step2im.PNG)

2. Clone the speech commands profile to make it editable, as we learned in [Lesson 1](mrlearning-base-ch1.md). Double click on the speech command profile, where you’ll notice a range of settings. For a full description on these settings, refer the [MRTK speech documentation](<https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/Input/Speech.html>). 

>Note: By default, the general behavior is auto-start. That can be changed to manual-start if desired, but for this example we are going to keep it on auto-start. The MRTK comes with several default voice commands (such as menu, toggle diagnostics, and toggle profiler). We will be using the keyword “toggle diagnostics” in order to turn on and off the diagnostics framerate counter. We will also add a new voice command in the steps below.
>
> ![Lesson5 Chapter1 Noteim](images/Lesson5_chapter1_noteim.PNG)

3. Add a new voice command. To add a new voice command, click on the “+ add a new speech command” button and you will see a new line that appears down below the list of existing voice commands. Type in the voice command you want to use. In this ex musicample we are going to use the command “play music.”

>Tip: You can also set a keycode for speech commands. This allows for voice commands to trigger upon press of a keyboard key. 	

4. Add the ability to respond to voice commands. Select any object in the base scene hierarchy that does not have any other input scripts attached to it (e.g., no manipulation handler.) In the inspector panel, click “add component.” Type in “speech input handler.” Select it.
   ![Lesson5 Chapter1 Step4im](images/Lesson5_chapter1_step4im.PNG)

   

By default, you will see 2 checkboxes, one is the “is focus required” checkbox. What this means is as long as you are pointing to the object with a gaze ray, (eye-gaze, head-gaze, controller-gaze, or hand-gaze) the voice command will be triggered. Uncheck this checkbox to make it so that the user does not have to look at the object to use the voice command.

5. Add the ability to respond to a voice command. To do this, click the “+” button that’s in the speech input handler and select the keyword you would like to respond to.

   > Note: These keywords are populated based on the profile you edited in the previous step.

![Lesson5 Chapter1 Step5im](images/Lesson5_chapter1_step5im.PNG)

6. Next to “Keyword” you will see a dropdown menu. Select “Toggle Diagnostics.” This will make it so that whenever the user says the phrase, “toggle diagnostics” it will trigger an action. Note that you may need to expand "element 0" by pressing the arrow next to it.

![Lesson5 Chapter1 Step6im](images/Lesson5_chapter1_step6im.PNG)

7. Add the “diagnostics demo control script” to toggle the framerate counter diagnostic on and off. To do this, press the “add component” button and search for “diagnostics demo control script” then add it from the menu. This script can be added to any object, but for simplicity, we will add it to the same object as the speech input handler. 

   > Note: this script is only included with these modules and is not included with the original MRTK.

![Lesson5 Chapter1 Step7im](images/Lesson5_chapter1_step7im.PNG)

8. Add a new response in the Speech Input Handler. To do this click the “+” button underneath where it says “response ()” (marked by green arrow in the picture above).

![Lesson5 Chapter1 Step7im](images/Lesson5_chapter1_step8.PNG)

9. Drag the object that has the Diagnostics Demo Controls script to the new response you just created in step 8.
    ![Lesson5 Chapter1 Step9im](images/Lesson5_chapter1_step9im.PNG)

10. Now select the “no function” dropdown list, select diagnostic demo controls, then “on toggle diagnostics ().” This function toggles your diagnostics on and off.  ![Lesson5 Chapter1 Step10im](images/Lesson5_chapter1_step10im.PNG)
    
> Note that before building to your device you need to enable mic settings. To do that click on file, go to build settings, from there, player settings, and ensure the microphone capability is set.

Next, we are adding the ability to play an audio file from voice command using the "octa" object. Recall from [lesson 4](mrlearning-base-ch4.md), we added the ability to play an audio clip from touching the octa object. We will leverage this same audio source for our music voice command.

11. Select the octa object in the base scene hierarchy.

12. Add another speech input handler (repeat steps 4 and 5), but with the octa object. 

13. Instead of adding the “Toggle Diagnostics” voice command from step 6, add the “play music” voice command, as shown in the image below.
    
     ![Lesson5 Chapter1 Step13im](images/Lesson5_chapter1_step13im.PNG)
    
    
    
14. As with steps 8 and 9, add a new response, and drag the octa to the empty slot on response.

15. Select the dropdown menu that says “no function," select “Audio Source,” then select “PlayOneShot (AudioClip).”

![Lesson5 Chapter1 Step15im](images/Lesson5_chapter1_step15im.PNG)

16. For the audio clip, for this example we are going to use the same audio clip from [Lesson 4](mrlearning-base-ch4.md). Go into your project panel, search for “MRTK_Gem” audio clip and drag it into the audio source slot, as shown in the image below. Now your application should be able to respond to the voice commands “toggle diagnostics” to toggle the frame rate counter panel and “play music” to play the MRTK_Gem song.
     ![Lesson5 Chapter1 Step16im](images/Lesson5_chapter1_step16im.PNG)


### The Pan Gesture 

In this chapter, we will learn how to use the pan gesture. It’s useful for scrolling (using your finger or hand to scroll through content.) You can also use the pan gesture to rotate objects, to cycle through a collection of 3D objects, or even scroll a 2D UI. We will be learning how to use the pan gesture to warp a texture. We will also explore how to move a collection of 3D objects.

1. Create a quad. In your base scene hierarchy, right click, select “3D Object,” then select “Quad.”

![Lesson5 Chapter2 Step2im](images/Lesson5_chapter2_step2im.PNG)

2. Reposition the quad as appropriate. For our example, we set the x = 0, the y = 0 and the z = 1.5 away from the camera for a comfortable position from the HoloLens 2.

   > Note: If the quad blocks (is infront of) any content from the previous lessons, be sure to move it such that it doesn’t block any of the other objects.

3. Apply a material to the quad. This material will be the material we will be scrolling through with the pan gesture. 

![Lesson5 Chapter2 Step3im](images/Lesson5_chapter2_step3im.PNG)

4. In your projects panel, type in the search box “pan content.” Drag that material on to the quad in your scene. 

> Note: The "Pan content" material is not included in the MRTK, but it is an asset in this module's asset package, as imported in previous lessons. 

> Note: When you add the pan content, it may look stretched. You can fix this by adjusting the values x, y and z values of the size of the quad until you are satisfied with the way it looks.

To use the pan gesture, you will need a collider on your object. You may see the quad already has a mesh collider. However, the mesh collider is not ideal, because it is extremely thin and difficult to select. We suggest replacing the mesh collider with a box collider.

5. Right click the mesh collider that’s on the quad (in the inspector panel) then remove it by clicking “remove component.” 
   ![Lesson5 Chapter2 Step5im](images/Lesson5_chapter2_step5im.PNG)

6. Now add the box collider by clicking “add component” and searching “box collider.” The default added box collider is still too thin, so click the “edit collider” button to edit it. When it’s pressed in, you can adjust the size using the x, y and z values or the elements in the scene editor. For our example, we want to extend the box collider a little behind the quad. In the scene editor, drag the box collider from the back, outwards (see the image below). What this will do is allow the user to not only use their finger, but their entire hand to scroll. 
    ![Lesson5 Chapter2 Step6im](images/Lesson5_chapter2_step6im.PNG)
7. Make it interactive. Since we want to interact with the quad directly, we want to use the “near interaction touchable” component (we also used this in Lesson 4 for playing music from the octa). Click “add component” and search for “near interaction touchable” and select it, as shown in the images below. 

8. Add the ability to recognize the pan gesture. Click “add component” and type “hand interaction pan.” You will have a choice between hand ray (allowing you to pan from a distance) and index finger. For this example, leave it at index finger. 
    ![Lesson5 Chapter2 Step7 8Im](images/Lesson5_chapter2_step7-8im.PNG)

![Lesson5 Chapter2 Step8im](images/Lesson5_chapter2_step8im.PNG)

9. In the hand interaction pan script, the “lock horizontal” and “lock vertical” checkboxes will lock the movements, respectively. The wrap texture settings will make the texture (texture mapping) follow the user's pan movements. For this example, we are going to check that box. There is also “velocity active” which, if unchecked, the pan gesture will not work. Check this box as well. Now you should have a pan-enabled quad.

   

   Next, we will learn how to pan 3D objects. 

10. Right click the quad object, select 3D object then click “cube.” Scale the cube so that it’s roughly x = 0.1, y = 0.1 and z = 0.1. Copy that cube 3 times (by right clicking the cube and pressing duplicate, or by pressing control/command D). Space them out evenly. Your scene should look similar to the picture below.

![Lesson5 Chapter2 Step10im](images/Lesson5_chapter2_step10im.PNG)







11. Select the quad again, and under the hand interaction pan script, we want to set the pan actions to each of the cubes. Under “pan event receivers” we want to specify the number of objects that are receiving the event. Since there are 4 cubes, type “4” and press enter. 4 empty fields should appear.


![Lesson5 Chapter2 Step11im](images/Lesson5_chapter2_step11im.PNG)



12. Drag each of the cubes in to each of the empty element slots.
     ![Lesson5 Chapter2 Step12im](images/Lesson5_chapter2_step12im.PNG)
    
13. Add the “move with pan” script to all of the cubes. To do this, press and hold control/command and select each object. Then, in the inspector panel, click “add component” and search for “move with pan.” Click the script and it will be added to each cube. Now the 3D objects will move with your pan gesture! If you remove the mesh render on your quad, you should now have an invisible quad where you can pan through a list of 3D objects.

### Eye Tracking

In this chapter, we will explore how to enable eye tracking in our demo. We will slowly spin our 3D menu items when they are being gazed upon with eye gaze. We will also trigger a fun effect when the gazed-upon item is selected.

1. Ensure the Mixed Reality Toolkit profiles are properly configured. As of this writing, the mixed reality toolkit profile configuration does not include eye tracking capabilities by default. To add eye tracking capabilities, follow the instructions in the “Setting up the MRTK profiles required for Eye Tracking” section as outlined in the [Mixed Reality Toolkit Documentation](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_BasicSetup.html#setting-up-the-mrtk-profiles-required-for-eye-tracking  ). Ensure that eye tracking is properly configured by following any remaining steps in the documentation link above, including enabling eye tracking in GazeProvider (component attached to camera) and enabling simulation of eye tracking in the Unity editor. Note that future version of the MRTK may include eye tracking by default.

    The link above provides brief instructions for:

    - Creating the Eye Gaze Data Provider for use in the MRTK Profile
    - Enabling eye tracking in the Gaze Provider
    - Set up for simulating eye tracking in the editor
    - Editing the Visual Studio solution's capabilities to allow eye tracking in the built application

2. Add the Eye Tracking Target component to target objects. To allow an object to respond to eye gaze events, we will need to add the EyeTrackingTarget component on each object that we wish to interact with using eye gaze. Add this component to each of the nine 3D objects that are part of the grid collection. Tip: select multiple items in the hierarchy to bulk-add the EyeTrackingTarget component.
    ![Lesson5 Chapter3 Step2](images/Lesson5Chapter3Step2.JPG)

3. Next we will add the EyeTrackingTutorialDemo script for some exciting interactions. The EyeTrackingTutorialDemo script is included as part of this tutorial series’ repository and is not included by default with the Mixed Reality Toolkit. For each 3D object in the grid collection, add the EyeTrackingTutorialDemo script by searching for the component in the “Add Component” menu.
   ![Lesson5 Chapter3 Step3](images/Lesson5Chapter3Step3.JPG)

   4. Spin the object while looking at the target. We would like to configure our 3D object to spin while we are looking at it. To do this, insert a new field in the “While Looking At Target” section of the EyeTrackingTarget component, as shown in the image below. 

![Lesson5 Chapter3 Step4a](images/Lesson5Chapter3Step4a.JPG)
![Lesson5 Chapter3 Step4b](images/Lesson5Chapter3Step4b.JPG)



In newly created field, add the current Game Object to the empty field, and select EyeTrackingTutorialDemo > RotateTarget() as shown in the image below. Now the 3D object is configured to spin when it is being gazed upon with eye tracking. 

5. Add in ability to “blip target” that is being gazed at upon select (air-tap, or saying “select”). Similar to Step 4, we want to trigger EyeTrackingTutorialDemo > BlipTarget() by assigning it to the Game Object’s “Select()” field of the EyeTrackingTarget component, as shown in the figure below. With this now configured, you will notice a slight blip in the game object whenever you trigger a select action, such as air-tap or the voice command “select.” 
    ![Lesson5 Chapter3 Step5](images/Lesson5Chapter3Step5.JPG)
6. Ensure eye tracking capabilities are properly configured before building to HoloLens 2. As of this writing, Unity does not yet have the ability to set the gaze input (for eye tracking) capability. Setting this capability is required for eye tracking to work on the HoloLens 2. Follow these instructions on the mixed reality toolkit documentation to enable the gaze input capability: https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/EyeTracking/EyeTracking_BasicSetup.html#testing-your-unity-app-on-a-hololens-2 


### Congratulations! 
You’ve successfully added basic eye tracking capabilities to the application. These actions are only the beginning of a world of possibilities with eye tracking. This chapter also concludes lesson 5, where we learned about advanced input functionality such as voice commands, panning gestures, and eye tracking. 

[Next Lesson: Lunar Module Assembly Sample Experience](mrlearning-base-ch6.md)


---
title: MR Learning Base Module User Interface, Hand Tracking, and Mixed Reality Toolkit Configuration
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# MR Learning Base Module User Interface, Hand Tracking, and Mixed Reality Toolkit Configuration

In the previous lesson, we learned some of the capabilities the MRTK had to offer, with starting your first application for the HoloLens 2. In this next lesson we’ll learn how to create and organize buttons along with UI text panels and use default interaction (touch) to interact with each button. We will also include some minor code that will allow you to customize your buttons, (like change the size, sound and color). To give more customizability, we will show how to modify these profiles by turning off the visualization of the spatial mesh. 

## Objectives

* O
* I
* V

## Instructions

### How to Configure the Mixed-Reality Toolkit Profiles

1. Select Mixed-Reality Toolkit (MRTK) from the “BaseScene” hierarchy. From there, you should see the “Mixed Reality Toolkit Script.” It should also say “active profile” underneath. Double click on it to open it.

![MR213_BuildSettings](images/mrlearning-base-ch2-1step1im.png)

>[!Note]
>By default, all of the profiles are not editable. These are default profiles that you can copy and customize. There are several layers of customization and profiles, so in order to change a profile you’ll need to copy and customize several profiles. Before any of this, however, we need to disable the visibility of the spatial mapping mesh.

2. Copy the profile to enable yourself the ability to customize a version of the profile. In order to do that, you must click on the “Copy & Customize” button (as seen above). This creates a copy of the main MRTK profile. Nothing should be disabled anymore, allowing you to customize several things.

![MR213_BuildSettings](images/mrlearning-base-ch2-1step2im.png)

3. Disable the visibility of the spatial awareness mesh. To do this, you’ll want to look down to “Additional Service Providers.” When you open the “default mixed reality registered serviced providers profile” (marked by red arrow) it will appear uneditable, much like the other profile. So in order to fix that, click the button to the right of the profile (marked by green arrow) to replace the default profile with a copy.

![MR213_BuildSettings](images/mrlearning-base-ch2-1step2im.png)

4. Create a custom copy of the Default Mixed Reality Spatial Mesh Observer. 
Click the down arrow next to “Windows Mixed Reality Spatial Mesh Observer” to see a list of options. In there, you will see the “Default Mixed Reality Spatial Mesh Observer” which, the same as before, is uneditable. So, just like the previous step, we must replace the default with a  copy of it so we can edit it. Click the button to the right (marked by green arrow) to create a copy.

![MR213_BuildSettings](images/mrlearning-base-ch2-1step2im.png)

5. Now, we just adjust the settings for the display option to say “occlusion.” What this does is make the spatial mesh invisible, but it will still make it so that you can’t see anything behind the spatial mesh either.

![MR213_BuildSettings](images/mrlearning-base-ch2-1step2im.png)

>[!Note]
>Note: the spatial mapping mesh is still there, and you can still interact with it, but you won’t be able to see it directly. Also, any holograms behind the spatial mapping mesh (i.e. a hologram behind your visible wall) will not be visible because of the occlusion setting.

Congratulations! You just learned how to modify a setting in the MRTK profile. As you can see, in order to modify settings you need to create copies of the default profiles so that you can edit them. You will always have the default profiles (which are uneditable) to go back to if you wanted to create a profile with new settings, or refer back to the default profiles. There are numerous settings that you can mess with, and details of those settings will be found in the documentation of the MRTK.

### Adding an Interactable Button

1. Select “Assets” from the projects folder.

2. Type in the search bar, “holographicbutton.”

![MR213_BuildSettings](images/mrlearning-base-ch2-2step1im.png)

3. Drag the prefab (represented by a blue box) that the mouse is highlighting in the picture below, into your hierarchy.

![MR213_BuildSettings](images/mrlearning-base-ch2-2step3im.png)

>[!Note]
>If you get a message about “importing TMP Essentials” you can import it, or ignore it for now.

4. Double click the button (which should be in your BaseScene folder) to open it in your scene. What’s circled below is what you should see in your screen. 

![MR213_BuildSettings](images/mrlearning-base-ch2-2step4im.png)

>[!Note]
>By default, this button has no interactions. You cannot do anything with it. That’s something we are going to add in the next few steps.

5. Click “Add Event” to give the button a property when pushed. Once in the new screen, click the drop down menu. Select “InteractableOnPressReciever.” This will make it possible to add properties when the button is pushed/released.

![MR213_BuildSettings](images/mrlearning-base-ch2-2step5im.png)

6. Add a cube to the scene. Right click on the hierarchy area, select 3D object, then click on “cube.”
Now, a cube should be in your display. It will appear very large, so adjust the coordinates (while “cube” is still selected in the hierarchy area) to make the size more reasonable. In this case, we are using the dimensions x = 0.1, y = 0.1 and z = 0.1.

Also to make the cube be aligned with the button, we will move the cube’s location. You can do this by either clicking and dragging the cube in the display to the location you want, or you can type coordinates in. In this case, the x = 0, y = 0.2, and z = 0.

7. 

Congratulations! You just learned how to modify a setting in the MRTK profile. As you can see, in order to modify settings you need to create copies of the default profiles so that you can edit them. You will always have the default profiles (which are uneditable) to go back to if you wanted to create a profile with new settings, or refer back to the default profiles. There are numerous settings that you can mess with, and details of those settings will be found in the documentation of the MRTK.
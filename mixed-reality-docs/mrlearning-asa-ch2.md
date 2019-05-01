---
title: MR Learning ASA Module Azure Spatial Anchor on HoloLens 2
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# Azure Spatial Anchors on HoloLens 2

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

### Configuring your scene

In this section, we will be adding prefabs and scripts into the scene to create a series of buttons that demonstrate the fundamentals of how both local anchors and Azure Spatial Anchors behave in an application.

   7. In the "project" tab, underneath the "assets" folder, click on "ASAModuleAssets." Once selected you will see 2 prefabs, "ButtonParent" and "ParentAnchor."

![module2chapter1step5bim](images/module2chapter1step7im.PNG)

   8. Drag both of the prefabs into the scene. 
   
         ![module2chapter1step8im](images/module2chapter1step8im.PNG)
   
         Double click on the parent anchor to select it. You may need to adjust your view to see the entire scene, so adjust your scene as needed.
         
         3. Configure ParentAnchor. Currently, the game object named "ParentAnchor" is just a colored cube, for demonstration purposes. Eventually, we will hide the cube and place our content as a child of the ParentAnchor. Add the AzureDemo.cs script and the ASAModuleScript.cs script to the ParentAnchor object. TODO: elaborate on instructions.
         
         4. Configure Buttons. Under the ParentAnchor prefab, you will notice several labeled buttons. These buttons are created from the MRTK's PressableButton prefabs. Learn more about how to create Pressable Buttons from the Base Module here (TODO: we need to find and insert link to appropriate section). For each button, add an event that will be triggered when the user presses or selects the button according to the list below: TODO: Show detailed steps once, and then ask to repeat for other buttons.
         
            - For the Button named "Start Azure Session" Assign the StartAzureSession() method.
         
            - For the Button named...
         
            - For the Button named...
         
            - For the Button named...
         
### Build and Demonstrate Base Application

Now that your scene is configured to demonstrate the basics of Azure Spatial Anchors, we will build and demonstrate the basic behavior of Azure Spatial Anchors. 

1. If you closed the Build Settings window from the previous sections, open the build settings window again by going to File>Build Settings.
    ![Lesson1 Chapter5 Step1](images/Lesson1Chapter5Step1.JPG)

2. Ensure the scene you want to try is in the “Scenes in Build” list by clicking on the “Add Open Scenes” button.

3. Press the Build button to begin the build process.
    ![Lesson1 Chapter5 Step3](images/Lesson1Chapter5Step3.JPG)

4. Create and name a new folder for your application. In the image below, a folder with the name “App” was created to contain the application. Click “Select Folder” to begin building to the newly created folder. After the build has completed, you may close the "Build Settings" window in Unity. 
    ![Lesson1 Chapter5 Step4](images/Lesson1Chapter5Step4.JPG)

  > NOTE: If the build fails, try building again or restarting Unity and building again. If you see an error such as "Error: CS0246 = The tyoe or namespace name “XX” could not be found (are you missing a using directive or an assembly reference?)", then you may need to install [Windows 10 SDK (10.0.18362.0)](<https://developer.microsoft.com/en-us/windows/downloads/windows-10-sdk>) 
  >

5. After the build is completed, open the newly created folder containing your newly built application files. Double click on the “MixedRealityBase.sln” solution (or the corresponding name, if you used an alternative name for your project) to open the solution file in Visual Studio.

  > Note: Be sure to open the newly created folder (i.e., the "App" folder, if following the naming conventions from the previous steps), as there will be a similarly named .sln file outside of that folder that is not to be confused with the .sln file inside the build folder. 

![Lesson1 Chapter5 Step5](images/Lesson1Chapter5Step5.JPG)

  > Note: If visual studio asks to install new components, please take a moment to ensure that all prerequisite components are installed as specific in [the "Install the Tools" page](install-the-tools.md) 

6. Plug your HoloLens 2 into your PC with the USB cable. While these lesson instructions assume you will be deploying a testing with a HoloLens 2 device, you may also choose to deploy to the [HoloLens 2 emulator](using-the-hololens-emulator.md) or choose to create an [app package for sideloading](<https://docs.microsoft.com/en-us/windows/uwp/packaging/packaging-uwp-apps>)
7. Before building to your device, ensure that the device is in Developer Mode. If this is your first time deploying to the HoloLens 2, Visual Studio may ask you to pair your HoloLens 2 with a pin. Please follow [these instructions](https://docs.microsoft.com/en-us/windows/mixed-reality/using-visual-studio) if you need to enable developer mode or pair with Visual Studio.
8. Configure Visual Studio for building to your HoloLens 2 by selecting the “Release” configuration and the “ARM” architecture.
    ![Lesson1 Chapter5 Step8](images/Lesson1Chapter5Step8.JPG)
9. The final step is to build to your device by selecting Debug>Start without Debugging. Selecting “Start without Debugging” will cause the application to immediately start on your device upon a successful build, but without Debugging information appearing in Visual Studio. This also means that you can disconnect your USB cable while your application is running on your HoloLens 2 without stopping the application. You may also select Build>Deploy Solution to deploy to your device without having the application automatically start.
    ![Lesson1 Chapter5 Step9](images/Lesson1Chapter5Step9.JPG)
10. When the application is running on your device, please follow the on-screen instructions. Below you will find an explanation for each of the ten steps specified
    - Start Azure Session. Think of this step as logging into your Azure Session. TODO: provide additional information.
    - Step 2 explanation
    - Step 3 explanation
    - etc..

## Congratulations
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

[Next Lesson: ASA Lesson 2](mrlearning-base-ch3.md)


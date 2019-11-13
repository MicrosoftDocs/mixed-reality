---
title: Multi-user capabilities tutorials - 2. Getting Unity ready for development 
description: Complete this course to learn how to implement multi-user shared experiences within a HoloLens 2 application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# 2. Getting Unity ready for development 


In this tutorial, you will learn how to prepare and configure Unity for application development, including importing the Mixed Reality Toolkit, configuring build settings, and preparing your scene.

## Objectives

- Configure Unity for application development

- Import the Mixed Reality Toolkit

- Prepare your project scene

## Instructions

1. Download and save the Mixed Reality Toolkit Foundation unity package by clicking [here.](https://github.com/microsoft/MixedRealityToolkit-Unity/releases/download/v2.1.0/Microsoft.MixedReality.Toolkit.Unity.Foundation.2.1.0.unitypackage)

2. In Unity, click the Assets menu and select Import Package, then click on Custom Package.

![Module3Chapter2step2im](images/module3chapter2step2im.PNG)

3. Select the Unity package you just downloaded from the link provided in step 1. Once the import pop-up window appears in Unity, click the Import button to begin importing the MRTK. This may take several minutes.

![Module3Chapter2step3im](images/module3chapter2step3im.PNG)

> Note: The downloaded package is in your local folder, where you have saved the file. The image above does not portray where you will find the package.

4. Create a new scene. This can be done by clicking File and selecting New Scene". Save it as HLSharedProjectMain.

> Note: you may receive a pop-up that looks similar to the image below. For now, click No.
>
> ![Module3Chapter2note1im](images/module3chapter2note1im.PNG)

5. Under Mixed Reality Toolkit, click on Add to Scene and Configure.

![Module3Chapter2step5im](images/module3chapter2step5im.PNG)

6. Once that is complete, a new configuration file appears, giving you the choice to customize the profile. 

![Module2Chapter1step4im](images/Module2Chapter1step4im.PNG)

7. Select Mixed-Reality Toolkit (MRTK) from the  hierarchy. In the inspector panel, look for the Mixed Reality Toolkit Script and press the "Copy & Customize" button  as shown in the figure below.  A pop will appear after this and select clone option in the pop up menu.

![Module3Chapter2step6imc](images/module3chapter2step6imc.PNG)

![Module3Chapter2step6imd](images/module3chapter2step6imd.PNG)

7. Scroll down and uncheck Enable Diagnostics system if you want to hide the diagnostics window. We recommend keeping the diagnostics window enabled during application development to monitor performance, and then disabling it during production or application demonstrations. 

![Module3Chapter2step7ima](images/module3chapter2step7ima.PNG)

8. Open the build settings by pressing control+shift+B or going to File->Build Settings. Notice that the program is currently set under the PC, Mac and Linux standalone platform. For HoloLens 2 development, set the platform to be Universal Windows Platform. Select it and click Switch Platform.

![Module3Chapter2step8im](images/module3chapter2step8im.PNG)

9. Once complete, click the box called Add Open Scenes. Now go to the Inspector panel and ensure that the check box to the right of Virtual Reality Supported (as shown in the image below) is checked. Also ensure that the check box next to scenes/HLSharedProjectMain is also checked, as shown in the image below.

![Module3Chapter2step9im](images/module3chapter2step9im.PNG)

10. Under the Publishing Settings section in the Inspector panel, scroll down to Capabilities and ensure the following check boxes are marked:

![Module3Chapter2step9imb](images/module3chapter2step9imb.PNG)

11. Import the custom package called SharingAssetCollection, which can be downloaded [here.](https://github.com/microsoft/MixedRealityLearning/releases/tag/development)

![Module3Chapter2step12im](images/module3chapter2step11im.PNG)

12. In the Project panel, go to the Prefabs folder. In the following steps, you will implement a few prefabs into the scene. In the Prefabs folder, click and drag the prefab, Debug Window into the hierarchy. Once finished, save the project by clicking File, then Save or press Control+S.

![Module3Chapter2step12im](images/module3chapter2step12im.PNG)

   > Note: You may notice a pop-up appear as you click on the prefab, asking you about TMP Essentials. Click Import TMP Essentials as they are needed. If this pop-up appears, you might need to delete the prefab from your hierarchy and re-drag it into your hierarchy to avoid potential text-related errors.
   >
>![Module3Chapter2note2im](images/module3chapter2note2im.PNG)


## Congratulations

Your Unity Project is now ready for Photon. In the coming tutorials, we'll build upon this scene and our Unity project towards a full shared experience.

[Next tutorial: 3. Connecting multiple users](mrlearning-sharing(photon)-ch3.md)


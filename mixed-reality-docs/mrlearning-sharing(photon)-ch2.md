---
title: MR Learning ASA Module Azure Spatial Anchor on HoloLens 2
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# **Setting Up the Unity Project** 

1. download a new asset needed to set up Photon in Unity by clicking [here.](https://github.com/microsoft/MixedRealityToolkit-Unity/releases/download/v2.0.0-RC1-Refresh/Microsoft.MixedReality.Toolkit.Unity.Examples-v2.0.0-RC1-Refresh.unitypackage)
2. In Unity, click on the assets menu and select "import assets," then click on "custom assets."

![Module3Chapter2step2im](images/module3chapter2step2im.PNG)

3. Select the Unity package you just downloaded from the link provided in step 1. Once the import button appears in Unity, click it.

![Module3Chapter2step3im](images/module3chapter2step3im.PNG)

> note: wherever you downloaded the package to will be where you find it. The image above does not portray where you will find the package.

4. Create a new scene (this can be done using control/command+N or by clicking "file" and selecting "new scene."). Save the scene as "HLSharedProjectMain."

> note: you may receive a pop-up that looks similar to the image below. For now, just click "no."
>
> ![Module3Chapter2note1im](images/module3chapter2note1im.PNG)

5. Under "Mixed Reality Toolkit" click on "add to scene and configure."

![Module3Chapter2step5im](images/module3chapter2step5im.PNG)

6. Once that is complete, a new configuration file will appear, giving you the choice to customize the profile. Click "copy and customize."

![Module3Chapter2step6im](images/module3chapter2step6im.PNG)

7. Scroll down and uncheck "enable diagnostics system." This will make it easier to set up this project.

![Module3Chapter2step7im](images/module3chapter2step7im.PNG)

8. Open the build settings (control+shift+B). Notice that the program is currently set under the "PC, Mac and Linux standalone" platform. For this project, set the platform to be "universal windows platform." Select it and click "switch platform."

   ![Module3Chapter2step8im](images/module3chapter2step8im.PNG)

   9. Once complete, click the box that says "add open scenes." Now go to the inspector panel and ensure that the check box to the right of "virtual reality supported" (as shown in the image below) is checked. 

   ![Module3Chapter2step9im](images/module3chapter2step9im.PNG)

   > note: Also ensure that the check box next to "scenes/HLSharedProjectMain" is also checked.

   10. Under the "publishing settings" in the inspector panel scroll down to "capabilities" and ensure only the following check boxes are marked:
       - internet client
       - internet client server
       - private network client server
       - camera/webcam
       - microphone

   11. Just like step 2, the next step would be to import another custom package called "Lesson2" which can be downloaded [here.] (no link for this download yet) Import that package.

   ![Module3Chapter2step12im](images/module3chapter2step11im.PNG)

   12. Now, in the project panel, go to the "prefabs" folder, since in next few steps you will be implementing a few prefabs into the scene. In the "prefabs" folder, click and drag the prefab, "DebugWindow" into the hierarchy. Once finished, save the project (click file, then save, or control+S)

       ![Module3Chapter2step12im](images/module3chapter2step12im.PNG)

   > note: You may notice a pop-up appear as you click on the prefab, asking you about TMP Essentials. Click "Import TMP Essentials" as they will be needed.
   >
   > ![Module3Chapter2note2im](images/module3chapter2note2im.PNG)


## Congratulations

Your Unity Project should be set up completely for Photon! Soon you will be able to share your work with other users.

[Next Lesson: Sharing(Photon) Lesson 3](placeholderlink)


**Getting Unity Ready for Development** 

In this lesson, we will learn how to prepare and configure Unity for app development, including importing the Mixed Reality Toolkit, configuring build settings, and preparing our scene.

Objectives:

- Configure Unity for app development

- Import the Mixed Reality Toolkit

- Prepare your project scene

### Instructions

1. Download and save the Mixed Reality Toolkit unity package by clicking [here.](https://github.com/microsoft/MixedRealityToolkit-Unity/releases/download/v2.0.0-RC2.1/Microsoft.MixedReality.Toolkit.Unity.Foundation-v2.0.0-RC2.1.unitypackage)
2. In Unity, click on the assets menu and select "Import Package," then click on "Custom Package."

![Module3Chapter2step2im](images/module3chapter2step2im.PNG)

3. Select the Unity package you just downloaded from the link provided in step 1. Once the import pop-up window appears in Unity, click the import button to begin importing. Importing the MRTK may take several minutes.

![Module3Chapter2step3im](images/module3chapter2step3im.PNG)

> Note: The downloaded package will be in your local folder where you have saved the file. The image above does not portray where you will find the package.

4. Create a new scene (this can be done by clicking "file" and selecting "new scene"). Save the scene as "HLSharedProjectMain."

> Note: you may receive a pop-up that looks similar to the image below. For now, just click "No."
>
> ![Module3Chapter2note1im](images/module3chapter2note1im.PNG)

5. Under "Mixed Reality Toolkit" click on "add to scene and configure."

![Module3Chapter2step5im](images/module3chapter2step5im.PNG)

6. Once that is complete, a new configuration file will appear, giving you the choice to customize the profile. Click "copy and customize."

   ![Module3Chapter2step6ima](images/module3chapter2step6ima.PNG)

   ![Module3Chapter2step6imb](images/module3chapter2step6imb.PNG)

   ![Module3Chapter2step6imc](images/module3chapter2step6imc.PNG)

7. Scroll down and uncheck "enable diagnostics system" if you would like to hide the diagnostics window. We recommend keeping the diagnostics window enabled during app development to monitor performance, and disabling it during production or application demonstrations. 

   ![Module3Chapter2step7ima](images/module3chapter2step7ima.PNG)

8. Open the build settings by pressing control+shift+B or going to File>Build Settings. Notice that the program is currently set under the "PC, Mac and Linux standalone" platform. For HoloLens 2 development, set the platform to be "Universal Windows Platform." Select it and click "switch platform."![Module3Chapter2step8im](images/module3chapter2step8im.PNG)

9. Once complete, click the box that says "add open scenes." Now go to the inspector panel and ensure that the check box to the right of "virtual reality supported" (as shown in the image below) is checked. Also ensure that the check box next to "scenes/HLSharedProjectMain" is also checked, as shown in the image below.![Module3Chapter2step9im](images/module3chapter2step9im.PNG)

10. Under the "Publishing Settings" section in the inspector panel scroll down to "Capabilities" and ensure the following check boxes are marked:![Module3Chapter2step9imb](images/module3chapter2step9imb.PNG)

11. Import the custom package called "SharingAssetCollection" which can be downloaded [here.](https://github.com/microsoft/MixedRealityLearning/releases/download/Sharing_2/SharingAssetCollection.unitypackage)![Module3Chapter2step12im](images/module3chapter2step11im.PNG)

12. Now, in the project panel, go to the "prefabs" folder, since in next few steps you will be implementing a few prefabs into the scene. In the "prefabs" folder, click and drag the prefab, "DebugWindow" into the hierarchy. Once finished, save the project (click file, then save, or press control+S)

    ![Module3Chapter2step12im](images/module3chapter2step12im.PNG)

   > Note: You may notice a pop-up appear as you click on the prefab, asking you about TMP Essentials. Click "Import TMP Essentials" as they will be needed. If this pop-up appears, you may need to delete the prefab from your hierarchy and re-drag it into your hierarchy to avoid potential text-related errors.
   >
   > ![Module3Chapter2note2im](images/module3chapter2note2im.PNG)


## Congratulations

Your Unity Project is now ready for Photon! In the coming lessons, we'll build upon this scene and our Unity project towards a full shared experience.

[Next Lesson: Sharing(Photon) Lesson 3](mrlearning-sharing(photon)-ch3.md)


---
title: MR Learning ASA Module Azure Spatial Anchor on HoloLens 2
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# Photon (correct me if I'm wrong)

In this lesson, 

Objectives:

* Learn how to _____________________________________________

* Learn how to _________________________________________________

  

## Instructions

### Setting Up Photon

1. Set up a [Photon](https://dashboard.photonengine.com/en-US/Account/SignUp) account. Doing this will consist of imputing your email and going through some verification steps.
   

![Module2Chapter4step1im](images/Module2chapter4step1im.png)

2. Once you are signed up, click on SDKs. Once you are on that page, click on "server," and make ensure it says, "self hosted." Then scroll down and click on "server" as seen in the second image below.

   

   ![Module2Chapter2step2aim](images/Module2chapter4step2aim.png)

   ![Module2Chapter2step2bim](images/Module2chapter4step2bim.png)
   
   3. That will cause a text box to appear labeled, "read me." Go ahead and read it. Once finished, click on the link next to "downloadSDK" to download it.


![Module2Chapter4step3im](images/Module2chapter4step3im.png)

4. Double click the folder once it finishes downloading.  Once your file explorer opens revealing the SDK folder, copy the SDK folder.
   
   - Your next step would be to go into the windows C: drive and create a new folder called 'server.'
   
   ![Module2Chapter4step4im](images/Module2chapter4step4aim.png)
   
   - Now open up the folder, and paste the SDK folder you copied earlier.
   
   ![Module2Chapter4step4im](images/Module2chapter4step4bim.png)
   
5. Once that is completed, open the SDK folder and go to "deploy," then "bin_Win64," then double click on "photon control."


![Module2Chapter4step4im](images/Module2chapter4step5im.png)

> Note: If you have any questions about IP address, or any other similar questions, you can find most of your information in the toolbar (as shown in the image below).
>
> ![Module2Chapter4step4im](images/Module2chapter4noteim.png)

6. Now that the server is set up and initiated, go back to the Photon website and click on the profile icon (boxed in the image below) and select "your applications."
   

![Module2Chapter3step5im](images/Module2chapter4step6im.png)

7. Create an application ID by clicking the "create a new app" button.

   ![Module2Chapter3step8im](images/Module2chapter4step7aim.png)

   - Select "Photon RUN" from the dropdown menu under "photon type." Then give it a name, (something you would remember). In this example, we named it "HoloLensPhotonProject." Once finished, click "create."

   ![Module2Chapter3step8im](images/Module2chapter4step7bim.png)

8. Once that is done, return to your applications page and you should see something similar to the picture below. Click on the app ID and copy it. Paste is somewhere you can easily access.  
   

![Module2Chapter4step9im](images/Module2chapter4step8im.png)

9. Create a new unity project. Open Unity Hub and click on "new." Name it "HLSharingProject." Then click create. 

   > note: This can take up to 2 minutes to load, based on your computer's speed.

![Module2Chapter4step9im](images/Module2chapter4step9im.png)

> note: pick a place to save your project in your computer by changing the "location" option. Save it to a place you will remember and have easy access to.

10. Once the project loads, click on the "assets store." Then, in the search box shown in the image below, type in "PUN" and select the "Photon PUN-2 FREE" asset. 

    ![Module2Chapter4step10im](images/Module2chapter4step10im.PNG)
    
    11. Download and import!
    
    ![Module2Chapter4step11im](images/Module2chapter4step11im.png)

### **Setting Up the Unity Project** 

11. download a new asset needed to set up Photon in Unity by clicking [here.](https://github.com/microsoft/MixedRealityToolkit-Unity/releases/download/v2.0.0-RC1-Refresh/Microsoft.MixedReality.Toolkit.Unity.Examples-v2.0.0-RC1-Refresh.unitypackage)

12. In Unity, click on the assets menu and select "import assets," then click on "custom assets."

![Module2Chapter4step12im](images/Module2chapter4step12im.PNG)

13. Select the Unity package you just downloaded from the link provided in step 1. Once the import button appears in Unity, click it.

![Module2Chapter4step13im](images/Module2chapter4step13im.png)

> note: wherever you downloaded the package to will be where you find it. The image above does not portray where you will find the package.

14. Create a new scene (this can be done using control/command+N or by clicking "file" and selecting "new scene."). Save the scene as "HLSharedProjectMain."

> note: you may receive a pop-up that looks similar to the image below. For now, just click "no."
>
> ![Module2Chapter4note2im](images/Module2chapter4note2im.png)

15. Under "Mixed Reality Toolkit" click on "add to scene and configure."

![Module2Chapter4step15im](images/Module2chapter4step15im.png)

16. Once that is complete, a new configuration file will appear, giving you the choice to customize the profile. Click "copy and customize."

![Module2Chapter4step16im](images/Module2chapter4step16im.png)

17. Scroll down and uncheck "enable diagnostics system." This will make it easier to set up this project.

![Module2Chapter4step17im](images/Module2chapter4step17im.png)

18. Open the build settings (control+shift+B). Notice that the program is currently set under the "PC, Mac and Linux standalone" platform. For this project, set the platform to be "universal windows platform." Select it and click "switch platform."

![Module2Chapter4step18im](images/Module2chapter4step18im.png)

19. Once complete, click the box that says "add open scenes." Now go to the inspector panel and ensure that the check box to the right of "virtual reality supported" (as shown in the image below) is checked. 

![Module2Chapter4step19im](images/Module2chapter4step19im.png)

> note: Also ensure that the check box next to "scenes/HLSharedProjectMain" is also checked.

20. Under the "publishing settings" in the inspector panel scroll down to "capabilities" and ensure only the following check boxes are marked:

- internet client
- internet client server
- private network client server
- camera/webcam
- microphone

21. Just like step 12, the next step would be to import another custom package called "Lesson2" which can be downloaded [here.][lesson2.unitypackage link goes here] Import that package.

![Module2Chapter4step21im](images/Module2chapter4step20im.png)

22. Now, in the project panel, go to the "prefabs" folder, since in next few steps you will be implementing a few prefabs into the scene. In the "prefabs" folder, click and drag the prefab, "DebugWindow" into the hierarchy. Once finished, save the project (click file, then save, or control+S)

![Module2Chapter4step22im](images/Module2chapter4step21im.PNG)

> note: You may notice a pop-up appear as you click on the prefab, asking you about TMP Essentials. Click "Import TMP Essentials" as they will be needed.
>
> ![Module2Chapter4note3im](images/Module2chapter4note3im.PNG)

### **Connecting Multiple Users**

23. Like step 22, in the "prefabs" folder in the project panel, the next step is to drag and drop the "NetworkLobby" prefab in to the hierarchy. 

![Module2Chapter4step22im](images/Module2chapter4step22im.png)

24. When you open up the parent prefab, "NetworkLobby," you should see a child prefab, "NetworkRoom." With it selected, go into the inspector panel and click "Add Component." Search for "PhotonView" and add the component.

![Module2Chapter4step23im](images/Module2chapter4step23im.png)

25. Create a new empty game object in the hierarchy (right click in the hierarchy and select "empty"). Ensure the positioning is set to x =0, y=0, z=0 and name the object, "PhotonUser."

![Module2Chapter4step24im](images/Module2chapter4step24im.png)

## Congratulations




---
title: MR Learning ASA Module Azure Spatial Anchor on HoloLens 2
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# (Title)

In this lesson, 

Objectives:

* Learn how to _____________________________________________

* Learn how to _________________________________________________

  

## Instructions

### (title)

1. In this lesson, we are not using the "SaveAnchorToDisk" and "ShareAnchor" buttons so select both buttons and uncheck the checkbox in the inspector panel (as shown below) to hide these buttons for the time being.
   

![Module2Chapter3step1im](images/module2chapter3step1im.PNG)

2. Next, create the instruction panel. Start by right clicking the "instructions" button, hover over "3D Object" and select "textmeshpro-text."

   

   ![Module2Chapter3step2im](images/module2chapter3step2im.PNG)

   3. Adjust the scale and the positioning of the text so that it matches with the instructions in your scene. Also, ensure the alignment for all of the text is centered. Then delete the sample text from the text editor. Use the image below to help. 


![Module2Chapter3step3im](images/module2chapter3step3im.PNG)

4. Change the name of the textmeshpro object to "feedbackPanel."
   
   ![Module2Chapter3step4im](images/module2chapter3step4im.PNG)
   
5. In the project panel, select "assets" and right click, then select "show in explorer."
   

![Module2Chapter3step4im](images/module2chapter3step5im.PNG)

Now, click [here](https://onedrive.live.com/?authkey=%21ABXEC8PvyQu8Qd8&id=5B7335C4342BCB0E%21395636&cid=5B7335C4342BCB0E) to download the files needed in the next few steps.

6. Once explorer opens, select the assets folder, then the "ASAModulesAssets" folder, and copy the anchor feedback script and the anchor module script files into the folder. 
   

![Module2Chapter3step5im](images/module2chapter3step6im.PNG)

> note: if you get a pop-up asking you if you would like to overwrite the old or keep the old make sure you select overwrite.

7. Now return to the Assets folder. Then, go into the "AzureSpatialAnchorsPlugin" folder, then the examples folder, and finally the scripts folder, and copy the Azure Spatial Anchors demo wrapper into that folder. 
   

![Module2Chapter3step8im](images/module2chapter3step7im.PNG)

8. Now that the files are uploaded, ensure that the "feedbackpanel" text is selected, in the ASA_feedback hierarchy and click "add component" and add the anchor feedback script by searching for it and selecting it once it appears. 
   
   

![Module2Chapter3step8im](images/module2chapter3step8im.PNG)

9. Drag the "feedbackPanel" text object from the ASA_Feedback hierarchy into the empty slot beneath the script as seen in the picture below. 
   

![Module2Chapter3step9im](images/module2chapter3step9im.PNG)

   

## Congratulations





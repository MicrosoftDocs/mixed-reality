---
title: MR Learning ASA Module Azure Spatial Anchor on HoloLens 2
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# **Part 5 (unsure about name)** 

1. Save the project from the previous lesson (control+S) and name it "HLSharedProjectMainPart5.unity" so that it's easier to find when you need it again.

2. Select the TableAnchor prefab underneath  the "MixedRealityPlayspace" parent object, and delete it.

![Module3Chapter5tep2im](images/module3chapter5step2im.PNG)

3. Just like some of the previous lessons, import a new custom package that you can get [here.](placeholderlink)

![Module3Chapter5step3im](images/module3chapter5step3im.PNG)

4. Once it's imported, grab the newly updated table anchor (from the unity package imported in the previous step) from the "prefabs" folder in the project panel and drop it into the parent object "MixedRealityPlayspace."

![Module3hapter5step4im](images/module3chapter5step4im.PNG)

5. Expand the "MixedRealityPlayspace" parent object, then the "TableAnchor" object, and expand the "buttons" object as well. 

![Module3hapter5step5im](images/module3chapter5step5im.PNG)

6. Now in the hierarchy, select the "ShareAzureAnchorButton" and move your attention to the inspector panel. Scroll down to the dropdown menu shown in the image below, and select "AnchorModuleScript" and click on "ShareAnchorNetework()."

![Module3hapter5step6im](images/module3chapter5step6im.PNG)

7. Much like step 6, select the "GetAzureAnchorButton" and move your attention back to the inspector panel. Scroll down to the dropdown menu shown in the image below, and select "AnchorModuleScript" and click on "GetSharedAnchorNetwork()." Then save.

![Module3hapter5step7im](images/module3chapter5step7im.PNG)




## Congratulations

All of the sharing abilities are set up! Now, you can invite co-workers or friends to your Unity Project and have all users interact with everything you build in the project! Enjoy!


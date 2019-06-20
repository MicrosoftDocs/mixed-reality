---
title: MR Learning Sharing Module for HoloLens 2
description: Complete this course to learn how to implement multi-user shared experiences within a HoloLens 2 application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# Azure Spatial Anchors and Shared Experiences

In this lesson, we will learn how to integrate Azure Spatial Anchors (ASA) into our shared experience. ASA allows multiple co-located devices to have a common understanding if their physical environment in order to anchor virtual experiences such that all participants see objects in the same physical place.

Before proceeding with this lesson, we will need to complete the ASA Learning Module, which will cover ASA basics, Azure account and resource creation, and other fundamental buildings blocks that are required before we can integrate ASA into our shared experience.

Objectives:

- Integrate ASA into a shared experience for multi-device alignment
- Learn the fundamentals of how ASA works in the context of a local shared experience

### Instructions

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

In this Lesson you learned how to integrate Azure's powerful new Spatial Anchors to align co-located devices in a shared experience! This lesson also concludes the Sharing Module. We learned how to set up a new Photon account, integrate Photon and PUN into a new Unity application, configuring avatars and shared objects, and finally aligning multiple participants using ASA. 


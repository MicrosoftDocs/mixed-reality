---
title: MR Learning Sharing Module for HoloLens 2
description: Complete this course to learn how to implement multi-user shared experiences within a HoloLens 2 application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# Synchronizing the Movements of Shared Objects

In this lesson, we will learn how to share the movements of objects so that all participants of a shared session can collaborate together and view each others' interactions. This lesson builds upon the Lunar Launcher that was built as part of the [Base Module Tutorials](mrlearning-base.md).

Objectives:

- Bring in the Lunar Launcher as the 3D model to be shared
- Configure your project to share the movements of the 3D model.
- Learn how to build a basic multi-user collaborative application

### Instructions

1. Save the scene from the previous lesson (control+S). You may name it "HLSharedProjectMainPart4.unity" so that it's easier to find when you need it again.

2. In the Project window, in the Assets > Scripts folder, double click on GenericNetSync to open it in Visual Studio or which ever code editor you are using.  ![](images/module3chapter4updatestep2.png)

3. On lines 34 and 38, remove the "//" to activate the code for the Table that we will use in this lesson.  Then Save the file. ![](images/module3chapter4updatestep3.png)

4. In the project window, double click on the PhotonRoom.cs file in the Assets > Scripts folder to again open it in Visual Studio. ![](images/module3chapter4updatestep4.png)

5. Just like in step 3 we need to remove the "//" to activate the code at lines 25, 26, and 106.![](images/module3chapter4updatestep5a.png) ![](images/module3chapter4updatestep5b.png)

6. In the Hierarchy view, select the NetworkRoom object.![](images/module3chapter4updatestep6.png)

7. In the project view, navigate to Assets > Resources > Prefabs. First, drag and drop the Table prefab to the "Tableprefab" slot on the PhotonRoom class. Next drag and drop the LunarModule prefab to the "Module Prefab" slot on the PhotonRoom class. ![](images/module3chapter4updatestep7.png)

   Note: If you click on one of the prefab objects and release, the inspector will switch to that object. Click, drag, drop and release each object to its appropriate slot.



8. Now, click the arrow to the left of "MixedRealityPlayspace" and move the child game object, "MainCamera" down into the "SharedPlayground" prefab. Then, delete the prefab "MixedRealityPlayspace" (to delete, select the prefab and tap "delete" on your keyboard).

![Module3hapter4step5im](images/module3chapter4step5im.PNG)

note:  Make sure that both the Main Camera and SharedPlayground positions are set to 0,0,0.

9. Create a new game object set as a child object to the "SharedPlayground" parent object (to create a new object, right click on the parent object, and select "create  empty"). 

10. With the new object selected in your hierarchy, change the name of the object to "TableAnchor" in the inspector panel. Also, click "add component" and search for the "TableAnchor" component. Select it and add it to the object. 

![Module3Chapter4step6im](images/module3chapter4step7im.PNG)

> note: set the positioning to x=1, y=-0.55, and z=2. Also, set the rotation to y=90. 
>
> ![Module3Chapter4step6im](images/module3chapter4noteim.PNG)

11. Now in the project panel, in the "prefabs" folder, drag the "table" prefab into the "TableAnchor" child object you just created.

![Module3Chapter4step8im](images/module3chapter4step8im.PNG)



12. Finally, in the "DebugWindow" object, change the width to 80 and the height to 10.

![Module3Chapter4step9im](images/module3chapter4step11im.PNG)




## Congratulations

Once this is complete, all users that join your Unity project can move the Lunar Launcher around. All movements are synchronized so that each user can see each others' interactions. These concepts serve as the foundational building blocks for full-featured shared collaboration experiences. 

Although all users are connected as part of a shared experience and can see the relative movements of objects, the application is still unable to accurately align avatars and objects so that local users see each other and objects in the same place within the physical world. In order to anchor a local shared experiences, every device requires a common understanding of the physical environment. In this module, we will achieve this using [Azure Spatial Anchors](<https://azure.microsoft.com/en-us/services/spatial-anchors/>) (ASA), which will be implemented in the next lesson.

Before proceeding to the next lesson, we will need to complete the ASA Learning Module, which will cover ASA basics, Azure account and resource creation, and other fundamental buildings blocks required before we can integrate this into our shared experience.

[Next Lesson: Sharing(Photon) Lesson 5](mrlearning-sharing(photon)-ch5.md)


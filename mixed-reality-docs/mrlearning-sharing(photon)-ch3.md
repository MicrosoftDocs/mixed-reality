---
title: MR Learning ASA Module Azure Spatial Anchor on HoloLens 2
description: Complete this course to learn how to implement Azure Face Recognition within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# **Connecting Multiple Users** 

1. Like step 12 from the previous lesson, in the "prefabs" folder in the project panel, the next step is to drag and drop the "NetworkLobby" prefab in to the hierarchy. 

![Module3Chapter3step1im](images/module3chapter3step1im.PNG)

2. When you open up the parent prefab, "NetworkLobby," you should see a child prefab, "NetworkRoom." With it selected, go into the inspector panel and click "Add Component." Search for "PhotonView" and add the component.

![Module3Chapter3tep2im](images\module3chapter3step2im.PNG)

3. Create a new empty game object in the hierarchy (right click in the hierarchy and select "empty"). Ensure the positioning is set to x =0, y=0, z=0 and name the object, "PhotonUser."

![Module3Chapter3step3im](images/module3chapter3step3im.PNG)

4. Now, to ensure that you can see the users that are active in your project, right click the "PhotonUser" object you just created, go down to "3D Object" and click "sphere."

![Module3Chapter3step4im](images/module3chapter3step4im.PNG)

5. Scale the sphere down to x=0.06, y=0.06, ad z=0.06.

![Module3hapter3step5im](images/module3chapter3step5im.PNG)

6. Now drag the "PhotonUser" game object into the "prefabs" folder in the project panel. Then, delete it from the scene.

![Module3Chapter3step6im](images/module3chapter3step6im.PNG)

> note: make sure that the game object successfully copied correctly into the "prefabs" folder, otherwise you will have to create it again and copy it again.

7. Much like step 3, create a new object in the hierarchy, but name it "SharedPlayground." Then, click "add component" and search for "generic network manager" and click it. Change the positioning of the object to x=0, y=0, and z =0 as well.

![Module3Chapter3step7im](images/module3chapter3step7im.PNG)


## Congratulations

Once all the steps above are complete, and the build process is complete, when you press the play button and connect your HoloLens 2, you should see a sphere moving around as you move your head! This will be shown for any user that joins your Unity project!

[Next Lesson: Sharing(Photon) Lesson 4](placeholderlink)


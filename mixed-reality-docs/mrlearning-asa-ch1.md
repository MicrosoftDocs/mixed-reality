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

   7. In the "project" tab, underneath the "assets" folder, click on "ASAModuleAssets." Once selected you will see 2 prefabs, "ButtonParent" and "ParentAnchor."

      ![module2chapter1step5bim](images/module2chapter1step7im.PNG)

      8. Drag both of the prefabs into the scene. 

         ![module2chapter1step8im](images/module2chapter1step8im.PNG)

         Double click on the parent anchor to select it. You may need to adjust your view to see the entire scene, so adjust your scene as needed.



### Congratulations
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

[Next Lesson: ASA Lesson 2](mrlearning-base-ch3.md)


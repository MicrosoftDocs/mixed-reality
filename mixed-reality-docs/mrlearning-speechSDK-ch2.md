---
title: Azure Speech Services tutorials - 2. Adding an offline mode for local speech-to-text translation
description: Complete this course to learn to implement Azure Speech SDK within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 06/27/2019
ms.topic: article
keywords: mixed reality, unity, tutorial, hololens
---

# 2. Adding an offline mode for local speech-to-text translation

In this tutorial, we'll add an offline mode that lets you perform local speech-to-text translation when we are unable to connect to the Azure service. We will also *simulate* a disconnected state.

## Instructions

1. Select the Lunarcom_Base object in the hierarchy.
2. Click Add Component in the Inspector panel. Search for and select the Lunarcom Offline Recognition.

![Module4Chapter2step1im](images/module4chapter2step1im.PNG)

3. Click the drop-down in the LunarcomOfflineRecognizer and select Enabled. This programs the project to act like the user doesn't have a connection. 

![Module4Chapter2step1im](images/module4chapter2step2im.PNG)

4. Press Play in Unity Editor, and test it. Press the microphone in the bottom-left corner in the scene and begin speaking. 

> [!NOTE]
> Because we’re offline, wake word functionality has been disabled. You'll need to physically click the microphone every time you wish to have your speech recognized when offline. 

Below is an example of what your scene could look like.

![Module4Chapter2exampleim](images/module4chapter2exampleim.PNG)

## Congratulations

The offline mode has been enabled. Now, when you're offline, you can still work on your project with the speech-SDK! 


[Next Tutorial: 3.	Adding the Azure Cognitive Services speech translation component](mrlearning-speechSDK-ch3.md)


---
title: MR Learning SpeechSDK Module - Speech Recognition and Transcription
description: Complete this course to learn how to implement Azure Speech SDK within a mixed reality application.
author: jessemcculloch
ms.author: jemccull
ms.date: 02/26/2019
ms.topic: article
ms.localizationpriority: high
keywords: mixed reality, unity, tutorial, hololens
---

# Speech SDK Learning Module - Translation

In this lesson, we will add and explore the Azure Cognitive Services Speech Translation feature to our project and test translating into 3 different languages.

## Objectives

- Learn how to translate text in real time using Azure

## Instructions
1. Select the Lunarcom_Base object in the hierarchy and click “Add Component” in the inspector panel. Search for and select “LunarcomTranslationRecognizer.”

![Module4Chapter3step1im](images/module4chapter3step1im.PNG)

> Note: Ensure the offline mode simulator is disabled before testing the Speech-SDK translator. In order to translate, you must be connected to the internet. See image below on where to find this setting. 
>
> ![Module4Chapter3noteim](images/module4chapter3noteim.PNG)

2. Click the dropdown in the “LunarcomTranslationRecognizer” and select the language you would like to translate to.

![Module4Chapter3step2im](images/module4chapter3step2im.PNG)

3. Now, run the application and test the translator by clicking the button with the satellite icon and begin speaking. Press the satellite button again to stop the recognition. Below is an example of what your scene should look like. Feel free to change the language under the "Target Language" dropdown (see image above) to explore translation into other languages.

![Module4Chapter3exampleim](images/module4chapter3exampleim.PNG)

## Congratulations

In this lesson we learned how we can transcribe and translate spoken words into several different languages!

[Next Lesson: Speech SDK Lesson 4](mrlearning-speechSDK-ch4.md)


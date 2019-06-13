# Speech SDK Learning Module

In this tutorial you will create a Mixed Reality application that explores the use of Azure Cognitive Services Speech SDK with the HoloLens 2. When finished with this tutorial series, you will be able to use your device's microphone to transcribe speech to text in real time, translate your speech into other languages, and leverage the Speech SDK’s Intent feature to understand voice commands using artificial intelligence.

Objectives:

- Learn how to integrate the Azure Speech SDK into a HoloLens 2 application
- Learn how to use voice commands
- Learn how to use speech-to-text capabilities

## Instructions

### Getting Started

1. Start Unity and create a new project. Enter the project name “Speech SDK Learning Module.” Choose a location for where to save your project. Then click "Create Project."

![Module2Chapter3step1im](images/module4chapter1step1im.PNG)

> Note: Ensure that the template is set to "3D," as shown in the image above.

2. Download the [Mixed Reality Toolkit](https://github.com/microsoft/MixedRealityToolkit-Unity/releases/download/v2.0.0-RC2/Microsoft.MixedReality.Toolkit.Unity.Foundation-v2.0.0-RC2.unitypackage) Unity package and save it to a folder on your PC. Import the package into your Unity project. For detailed instructions on how to do this, please see [base module lesson 1](mrlearning-base-ch1.md). 

3. Download and import the Azure [Speech SDK](https://aka.ms/csspeech/unitypackage) for Unity asset package. Import the Speech SDK package by clicking on "assets," selecting "import package," then selecting "custom package." Find the Speech SDK package downloaded earlier and open it to begin the importing process. 

![Module4Chapter1step3im](images/module4chapter1step3im.PNG)

4. In the next pop-up window, click “Import” to begin importing the Speech SDK package. Ensure all items are checked, as shown in the image below.

![Module4Chapter1step4im](images/module4chapter1step4im.PNG)


5. Download the [Lunarcom](https://github.com/levilais/Speech-SDK-Module/raw/master/Speech SDK Module/Lunarcom.unitypackage) asset package. The Lunarcom asset package is a collection of assets and scripts developed for this lesson series to showcase a practical use of Azure's Speech SDK. It is a voice-command terminal that will ultimately interface with the lunar module assembly experience developed in the [Base Module Tutorial.](mrlearning-base-ch6)
6. Import the Lunarcom asset package into your Unity project by following similar steps you took to import the Mixed Reality Toolkit and Speech SDK.
7. Configure the Mixed Reality Toolkit (MRTK). To do this, click on the "Mixed Reality Toolkit" panel in the top of your window, and then select "Add to Scene and Configure."

![Module4Chapter1step7im](images/module4chapter1step7im.PNG)

8. Your scene will now have several new items in it from the MRTK. Save your scene under a different name by clicking on "file," then "save as" and name your scene “SpeechScene”. 

   > Note: If you press the play button on your scene after you add the MRTK to your project, and it doesn't enter the "play" mode, you may need to restart Unity. 

9. With the “MixedRealityToolkit" object selected in your hierarchy, click "copy and customize" in the inspector panel.

![Module4Chapter1step9im](images/module4chapter1step9im.PNG)

10. Also in the inspector panel (with the “MixedRealityToolkit" object selected in your hierarchy), disable the diagnostics system by unchecking the box to the right of "Enable Diagnostics System."

![Module4Chapter1step10im](images/module4chapter1step10im.PNG)

11. In the project panel, expand the "Lunarcom" folder and drag the "Lunarcom_Base" prefab into your hierarchy.

![Module4Chapter1step11im](images/module4chapter1step11im.PNG)

12. Select the "Lunarcom_Base" object in your hierarchy and ensure that the position is set to x=0, y=0, and z=0, as well as the rotation set to x=0, y=0, and z=0. Set the scale to read x=0.008, y=0.008, and z=0.01.

![Module4Chapter1step12im](images/module4chapter1step12im.PNG)

13. Click "add component" and search for and select “LunarcomController.” This script is included in the Lunarcom asset pack that you imported in Step 6.

![Module4Chapter1step13im](images/module4chapter1step13im.PNG)

14. To connect our app to Azure Cognitive Services, you must enter a "subscription key" also known as an "API Key" for the Speech Service. Follow the instructions at [this link](https://docs.microsoft.com/en-us/azure/cognitive-services/speech-service/get-started) to obtain a free subscription key. Once you obtain the subscription key, enter it into the “Speech Service API Key” field of the "LunarcomController" component in the inspector panel, as shown in the image below.

15. Enter the Region that you chose when you signed up for the subscription key into the “Speech Service Region” field of the "LunarcomController" component in the inspector panel.

![Module4Chapter1step15im](images/module4chapter1step15im.PNG)

16. In your hierarchy, expand the "Lunarcom_Base" object by clicking the arrow to the left of it, then do the same for its child object, "Terminal" as shown in the image below.

17. While "Lunarcom_Base" is selected, click and drag “Lunarcom Text” from the hierarchy to the "Output Text" slot in the "LunarcomController" component in the inspector panel, as shown in the image below.
18. Now do the same thing with the "Terminal" object into the "terminal" slot and the "Connection Light" object to the "Connection Light Controller" slot.

![Module4Chapter1step18im](images/module4chapter1step18im.PNG)

19. Click the arrow next to the "Lunarcom Buttons" section of the "LunarcomController" script in the inspector panel and change the size to 3 and press the Enter or Return key on your keyboard. This will cause three new "Element" fields to appear.

![Module4Chapter1step19im](images/module4chapter1step19im.PNG)

20. Expand the "Lunarcom Buttons" by clicking the arrow next to it in your hierarchy and, using the same process as above, drag the Mic, Satellite, and Rocket gameobjects to the Element 0, 1, and 2 references respectively in the "LunarcomController" component in the inspector panel. 

![Module4Chapter1step18im](images/module4chapter1step20im.PNG)

21. Select the "Lunarcom_Base" object in your hierarchy. Click “Add Component” in the inspector panel and search for and select “LunarcomWakeWordRecognizer.”

![Module4Chapter1step18im](images/module4chapter1step21im.PNG)

22. In the "Wake Word" slot, type in "Activate Terminal." Also, in the "Dismiss Word" slot, type in "Dismiss Terminal."

![Module4Chapter1step18im](images/module4chapter1step22im.PNG)

## Congratulations

You've set up voice recognition in your application, powered by Azure! Run the application to ensure all functions are working properly. Start with saying the wake word you typed in step 22, "Activate Terminal." Then, select the microphone button to start voice recognition and begin speaking. You will see your words transcribed in the terminal as you speak. Press the microphone button a second time to stop voice recognition. Say "Dismiss Terminal" to hide the Lunarcom terminal. In the next lesson, we'll learn how to dynamically switch to using device-powered voice recognition, for situations where Azure's speech SDK isn't available due to the HoloLens 2 being offline.

[Next Lesson: Speech SDK Lesson 2](placeholderlink)


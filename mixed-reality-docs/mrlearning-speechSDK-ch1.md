# Speech SDK Learning Module

In this tutorial you will create a [Unity](https://unity3d.com/) application that explores the Azure Cognitive Services Speech SDK.  When finished you will be able to use your computer's microphone to transcribe speech to text in real time, translate your speech into multiple languages, and even take advantage of Speech SDK’s Intent feature that provides for more flexible, AI-driven uses. If you are not familiar with Unity, it is recommended to study the [Unity User Manual](https://docs.unity3d.com/Manual/UnityManual.html) before starting your application development.

Objectives:

- Learn how to _____________________________________________

- Learn how to _________________________________________________

  

## Instructions

### Getting Started

1. Start Unity and create a new project. Enter the project name “Speech SDK Learning Module.” Choose a location for where to save your project. Then click "create project."

![Module2Chapter3step1im](C:images/module4Chapter1Step1im.PNG)

> note: ensure that the template is set to "3D."

2. Download the [Mixed Reality Toolkit](https://github.com/Microsoft/MixedRealityToolkit-Unity/releases/download/v2.0.0-RC1/Microsoft.MixedReality.Toolkit.Unity.Foundation-v2.0.0-RC1.unitypackage) Unity package and save it to a folder on your PC. Import the package into your Unity project. For more detailed instructions on how to do this, please see [base module lesson 1](link for base lesson). 


### ![Module2Chapter3step3im](C:/Users/jerem/OneDrive/Documents/GitHub/mixed-reality/mixed-reality-docs/images/Module2chapter3step3im.png)Import the Speech SDK

1. Download the [Speech SDK](https://aka.ms/csspeech/unitypackage) for Unity asset package.
2. Import the Speech SDK package by clicking on Assets>Import>Custom Package. Find the Speech SDK package downloaded in Step 1 and open it to begin the importing process.
3. In the next pop-up window, click “Import” to begin importing the Speech SDK package. Ensure all items are checked, as shown in the image. 

### Import the Lunarcom Unity package

1. Download the [Lunarcom](https://github.com/levilais/Speech-SDK-Module/raw/master/Speech SDK Module/Lunarcom.unitypackage) asset package.
2. Import the Lunarcom asset package by clicking on Assets>Import>Custom Package. Find the Lunarcom package downloaded in Step 1 and open it to begin the importing process.
3. In the next pop-up window, click “Import” to begin importing the Lunarcom. Ensure all items are checked, as shown in the image. 

### Configure Mixed Reality Toolkit

1. Configure the Mixed Toolkit by selecting from the menu bar Mixed Reality Toolkit > Configure. If you don't see this menu item after importing the mixed reality toolkit, please restart Unity. 
2. Your scene will now have several new items and modifications in it from the Mixed Reality Toolkit. Save your scene under a different name by clicking on File>Save As and name your scene “SpeechScene”. Keep your scene organized by saving it to the “Scenes” folder in your project’s Assets folder.
3. If you press Play and it doesn’t enter Play mode, restart Unity
4. In the Hierarchy, click “MixedRealityToolkit”
5. In the Inspector panel click “Copy and customize”
6. In the Inspector panel on the right hand side disable the Enable Diagnostics System by unchecking it.

### Setup Lunarcom prefab

1. In the Project folder below, open up the Lunarcom folder and drag the Lunarcom_Base prefab into the top level of the hierarchy
2. Select the Lunarcom_Base object in the hierarchy
3. Ensure that Position = (0, 0, 0), Rotation = (0, 0, 0), and Scale = (0.008, 0.008, 0.01)

### Add the LunarcomController component to the Lunarcom

1. Select the Lunarcom_Base object in the hierarchy
2. Click “Add Component” in the inspector

1. Search for and select “LunarcomController”
2. In order to connect our app to Azure Cognitive Services, enter the Key that was referenced in the prerequisites above into the “Speech Service API Key” field of the LunarcomController component in the Inspector
3. Enter the Region that was referenced in the prerequisites above into the “Speech Service Region ” field of the LunarcomController component in the Inspector.
4. In the Hierarchy, click the arrow to the left of Lunarcom_Base and then do the same for its child Terminal
5. While Lunarcom_Base is selected, click and drag “Lunarcom Text” from the hierarchy to the Output Text reference in the LunarcomController component in the Inspector.
6. Using the same process, drag “Terminal” from the hierarchy to the “Terminal” reference in the LunarcomController component in the Inspector
7. Using the same process, drag “Connection Light” from the hierarchy to the “Connection Light Controller” reference in the LunarcomController component in the Inspector
8. Click the arrow next to the Lunarcom Buttons section of the LunarcomController in the Inspector and change the Size to 3 and press “Enter”
9. Click the arrow next to Lunarcom Buttons in the Hierarchy and, using the same process as above, drag the Mic, Satellite, and Rocket buttons to the Element 0, 1, and 2 references in the LunarcomController component in the Inspector.

### Add the LunarcomSpeechRecognizer component to the Lunarcom

1. Select the Lunarcom_Base object in the hierarchy
2. Click “Add Component” in the inspector
3. Search for and select “LunarcomSpeechRecognizer”

### Add the LunarcomWakeWordRecognizer component to the Lunarcom

1. Select the Lunarcom_Base object in the hierarchy
2. Click “Add Component” in the inspector
3. Search for and select “LunarcomWakeWordRecognizer”
4. In the Wake Word field of the LunarcomWakeWordRecognizer in the Inspector, enter the text “Activate Terminal”
5. In the Dismiss Word field of the LunarcomWakeWordRecognizer in the Inspector, enter the text “Dismiss Terminal”

### Run and test the application

1. Press the Play button in the Unity Editor
2. Say “Activate Terminal” (the Wake Word we chose)
3. Click the Microphone button to start recognition
4. Begin speaking
5. Press the Microphone button to stop recognition![img](https://lh5.googleusercontent.com/ds0rCIuc4E0JoblR5iSKQRgPKpOpLW5W_9PC5jTdM0cfGtrhffZhTaYAqgPdM5nNippXB3mJMXUgXIHGNKNKGbW8cyZgi3YdKXHKWnJgYFdaFM5fdjWnVZsOW1unE2biVtep9o6X)
6. Press the Play button to stop the app

## Congratulations

[Next Lesson: Speech SDK Lesson 2](placeholderlink)


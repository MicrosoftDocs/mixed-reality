---
title: HoloLens (1st gen) and Azure 301 - Language translation
description: Complete this course to learn how to implement the Azure Translator Text API within a mixed reality application.
author: drneil
ms.author: jemccull
ms.date: 07/04/2018
ms.topic: article
keywords: azure, mixed reality, academy, unity, tutorial, api, translator text, hololens, immersive, vr, language translation, Windows 10, Visual Studio
---

# HoloLens (1st gen) and Azure 301: Language translation

<br>

>[!NOTE]
>The Mixed Reality Academy tutorials were designed with HoloLens (1st gen) and Mixed Reality Immersive Headsets in mind.  As such, we feel it is important to leave these tutorials in place for developers who are still looking for guidance in developing for those devices.  These tutorials will **_not_** be updated with the latest toolsets or interactions being used for HoloLens 2.  They will be maintained to continue working on the supported devices. There will be a new series of tutorials that will be posted in the future that will demonstrate how to develop for HoloLens 2.  This notice will be updated with a link to those tutorials when they are posted.

<br>

In this course, you will learn how to add translation capabilities to a mixed reality application using Azure Cognitive Services, with the Translator Text API.

![Final product](images/AzureLabs-Lab1-00.png)

The Translator Text API is a translation Service which works in near real-time. The Service is cloud-based, and, using a REST API call, an app can make use of the neural machine translation technology to translate text to another language. For more information, visit the [Azure Translator Text API page](https://azure.microsoft.com/services/cognitive-services/translator-text-api/).

Upon completion of this course, you will have a mixed reality application which will be able to do the following:

1.	The user will speak into a microphone connected to an immersive (VR) headset (or the built-in microphone of HoloLens).
2.	The app will capture the dictation and send it to the Azure Translator Text API.
3.	The translation result will be displayed in a simple UI group in the Unity Scene.

This course will teach you how to get the results from the Translator Service into a Unity-based sample application. It will be up to you to apply these concepts to a custom application you might be building.

## Device support

<table>
<tr>
<th>Course</th><th style="width:150px"> <a href="/hololens/hololens1-hardware">HoloLens</a></th><th style="width:150px"> <a href="../../../discover/immersive-headset-hardware-details.md">Immersive headsets</a></th>
</tr><tr>
<td> MR and Azure 301: Language translation</td><td style="text-align: center;"> ✔️</td><td style="text-align: center;"> ✔️</td>
</tr>
</table>

> [!NOTE]
> While this course primarily focuses on Windows Mixed Reality immersive (VR) headsets, you can also apply what you learn in this course to Microsoft HoloLens. As you follow along with the course, you will see notes on any changes you might need to employ to support HoloLens. When using HoloLens, you may notice some echo during voice capture.

## Prerequisites

> [!NOTE]
> This tutorial is designed for developers who have basic experience with Unity and C#. Please also be aware that the prerequisites and written instructions within this document represent what has been tested and verified at the time of writing (May 2018). You are free to use the latest software, as listed within the [install the tools](../../install-the-tools.md) article, though it should not be assumed that the information in this course will perfectly match what you'll find in newer software than what's listed below.

We recommend the following hardware and software for this course:

- A development PC, [compatible with Windows Mixed Reality](https://support.microsoft.com/help/4039260/windows-10-mixed-reality-pc-hardware-guidelines) for immersive (VR) headset development
- [Windows 10 Fall Creators Update (or later) with Developer mode enabled](../../install-the-tools.md#installation-checklist)
- [The latest Windows 10 SDK](../../install-the-tools.md#installation-checklist)
- [Unity 2017.4](../../install-the-tools.md#installation-checklist)
- [Visual Studio 2017](../../install-the-tools.md#installation-checklist)
- A [Windows Mixed Reality immersive (VR) headset](../../../discover/immersive-headset-hardware-details.md) or [Microsoft HoloLens](/hololens/hololens1-hardware) with Developer mode enabled
- A set of headphones with a built-in microphone (if the headset doesn't have a built-in mic and speakers)
- Internet access for Azure setup and translation retrieval

## Before you start

- To avoid encountering issues building this project, it is strongly suggested that you create the project mentioned in this tutorial in a root or near-root folder (long folder paths can cause issues at build-time).
- The code in this tutorial will allow you to record from the default microphone device connected to your PC. Make sure the default microphone device is set to the device you plan to use to capture your voice.
- To allow your PC to enable dictation, go to **Settings > Privacy > Speech, inking & typing** and select the button **Turn On speech services and typing suggestions**.
- If you're using a microphone and headphones connected to (or built-in to) your headset, make sure the option “When I wear my headset, switch to headset mic” is turned on in **Settings > Mixed reality > Audio and speech**.

   ![Mixed reality settings](images/AzureLabs-Lab1-00-5.png)

   ![Microphone setting](images/AzureLabs-Lab1-01.png)

> [!WARNING]
> Be aware that if you are developing for an immersive headset for this lab, you may experience audio output device issues. This is due to an issue with Unity, which is fixed in later versions of Unity (Unity 2018.2). The issue prevents Unity from changing the default audio output device at run time. As a work around, ensure you have completed the above steps, and close and re-open the Editor, when this issue presents itself.

## Chapter 1 – The Azure Portal

To use the Azure Translator API, you will need to configure an instance of the Service to be made available to your application.

1.	Log in to the  [Azure Portal](https://portal.azure.com).

    > [!NOTE]
    > If you do not already have an Azure account, you will need to create one. If you are following this tutorial in a classroom or lab situation, ask your instructor or one of the proctors for help setting up your new account.

2.	Once you are logged in, click on **New** in the top left corner and search for "Translator Text API." Select **Enter**.

    ![New Resource](images/AzureLabs-Lab1-02.png)

    > [!NOTE]
    > The word **New** may have been replaced with **Create a resource**, in newer portals.

3.	The new page will provide a description of the *Translator Text API* Service. At the bottom left of this page, select the **Create** button, to create an association with this Service.

    ![Create Translator Text API Service](images/AzureLabs-Lab1-03.png)

4.	Once you have clicked on **Create**:

    1. Insert your desired **Name** for this Service instance.
    2. Select an appropriate **Subscription**.
    3. Select the **Pricing Tier** appropriate for you, if this is the first time creating a *Translator Text Service*, a free tier (named F0) should be available to you.
    4. Choose a **Resource Group** or create a new one. A resource group provides a way to monitor, control access, provision and manage billing for a collection of Azure assets. It is recommended to keep all the Azure Services associated with a single project (e.g. such as these labs) under a common resource group).

        > If you wish to read more about Azure Resource Groups, please [visit the resource group article](/azure/azure-resource-manager/resource-group-portal).

    5. Determine the **Location** for your resource group (if you are creating a new Resource Group). The location would ideally be in the region where the application would run. Some Azure assets are only available in certain regions.
    6. You will also need to confirm that you have understood the Terms and Conditions applied to this Service.
    7. Select **Create**.

        ![Select Create button.](images/AzureLabs-Lab1-04.png)

5.	Once you have clicked on **Create**, you will have to wait for the Service to be created, this might take a minute.
6.	A notification will appear in the portal once the Service instance is created. 

    ![Azure Service creation notification](images/AzureLabs-Lab1-05.png)

7.	Click on the notification to explore your new Service instance. 

    ![Go to resource popup.](images/AzureLabs-Lab1-06.png)

8.	Click the **Go to resource** button in the notification to explore your new Service instance. You will be taken to your new Translator Text API Service instance. 

    ![Translator Text API Service page](images/AzureLabs-Lab1-07.png)

9.	Within this tutorial, your application will need to make calls to your Service, which is done through using your Service’s Subscription Key. 
10.	From the *Quick start* page of your *Translator Text* Service, navigate to the first step, *Grab your keys*, and click **Keys** (you can also achieve this by clicking the blue hyperlink Keys, located in the Services navigation menu, denoted by the key icon). This will reveal your Service *Keys*.
11.	Take a copy of one of the displayed keys, as you will need this later in your project. 

## Chapter 2 – Set up the Unity project

Set up and test your mixed reality immersive headset.

> [!NOTE]
> You will not need motion controllers for this course. If you need support setting up an immersive headset, please [follow these steps](https://support.microsoft.com/help/4043101/windows-10-set-up-windows-mixed-reality).

The following is a typical set up for developing with mixed reality and, as such, is a good template for other projects:

1.	Open *Unity* and click **New**. 

    ![Start new Unity project.](images/AzureLabs-Lab1-08.png)

2.	You will now need to provide a Unity Project name. Insert **MR_Translation**. Make sure the project type is set to **3D**. Set the *Location* to somewhere appropriate for you (remember, closer to root directories is better). Then, click **Create project**.

    ![Provide details for new Unity project.](images/AzureLabs-Lab1-09.png)

3.	With Unity open, it is worth checking the default **Script Editor** is set to **Visual Studio**. Go to **Edit > Preferences** and then from the new window, navigate to **External Tools**. Change **External Script Editor** to **Visual Studio 2017**. Close the **Preferences** window.

    ![Update script editor preference.](images/AzureLabs-Lab1-10.png)

4.	Next, go to **File > Build Settings** and switch the platform to **Universal Windows Platform**, by clicking on the **Switch Platform** button.

    ![Build Settings window, switch platform to UWP.](images/AzureLabs-Lab1-11.png)

5.	Go to **File > Build Settings** and make sure that:

    1. **Target Device** is set to **Any Device**.

        > For Microsoft HoloLens, set **Target Device** to *HoloLens*.

    2. **Build Type** is set to **D3D**
    3. **SDK** is set to **Latest installed**
    4. **Visual Studio Version** is set to **Latest installed**
    5. **Build and Run** is set to **Local Machine**
    6. Save the scene and add it to the build.

        1. Do this by selecting **Add Open Scenes**. A save window will appear.

            ![Click add open scenes button](images/AzureLabs-Lab1-12.png)

        2. Create a new folder for this, and any future, scene, then select the **New folder** button, to create a new folder, name it **Scenes**.

            ![Create new scripts folder](images/AzureLabs-Lab1-13.png)

        3. Open your newly created **Scenes** folder, and then in the *File name*: text field, type **MR_TranslationScene**, then press **Save**.

            ![Give new scene a name.](images/AzureLabs-Lab1-14.png)

            > Be aware, you must save your Unity scenes within the *Assets* folder, as they must be associated with the Unity Project. Creating the scenes folder (and other similar folders) is a typical way of structuring a Unity project.

    7. The remaining settings, in *Build Settings*, should be left as default for now.

6. In the *Build Settings* window, click on the **Player Settings** button, this will open the related panel in the space where the *Inspector* is located. 

    ![Open player settings.](images/AzureLabs-Lab1-15.png)

7. In this panel, a few settings need to be verified:

    1. In the **Other Settings** tab:

        1. **Scripting Runtime Version** should be **Stable** (.NET 3.5 Equivalent).
        2. **Scripting Backend** should be **.NET**
        3. **API Compatibility Level** should be **.NET 4.6**

            ![Update other settings.](images/AzureLabs-Lab1-16.png)
      
    2. Within the **Publishing Settings** tab, under **Capabilities**, check:

        1. **InternetClient**
        2. **Microphone**

            ![Updating publishing settings.](images/AzureLabs-Lab1-17.png)

    3. Further down the panel, in **XR Settings** (found below **Publish Settings**), tick **Virtual Reality Supported**, make sure the **Windows Mixed Reality SDK** is added.

        ![Update the X R Settings.](images/AzureLabs-Lab1-18.png)

8.	Back in **Build Settings**, *Unity C# Projects* is no longer greyed out; tick the checkbox next to this. 
9.	Close the Build Settings window.
10.	Save your Scene and Project (**FILE > SAVE SCENE / FILE > SAVE PROJECT**).

## Chapter 3 – Main Camera setup

> [!IMPORTANT]
> If you wish to skip the *Unity Set up* component of this course, and continue straight into code, feel free to [download this .unitypackage](https://github.com/Microsoft/HolographicAcademy/raw/Azure-MixedReality-Labs/Azure%20Mixed%20Reality%20Labs/MR%20and%20Azure%20301%20-%20Language%20translation/Azure-MR-301.unitypackage), import it into your project as a [*Custom Package*](https://docs.unity3d.com/Manual/AssetPackages.html), and then continue from [Chapter 5](#chapter-5--create-the-results-class). You will still need to create a Unity Project.

1.	In the *Hierarchy Panel*, you will find an object called **Main Camera**, this object represents your “head” point of view once you are “inside” your application.
2.	With the Unity Dashboard in front of you, select the **Main Camera GameObject**. You will notice that the *Inspector Panel* (generally found to the right, within the Dashboard) will show the various components of that *GameObject*, with *Transform* at the top, followed by *Camera*, and some other components. You will need to reset the Transform of the Main Camera, so it is positioned correctly.
3.	To do this, select the **Gear** icon next to the Camera’s *Transform* component, and selecting **Reset**. 

    ![Reset the Main Camera transform.](images/AzureLabs-Lab1-19.png)
 
4.	The *Transform* component should then look like:

    1. The *Position* is set to **0, 0, 0**
    2. *Rotation* is set to **0, 0, 0**
    3. And *Scale* is set to **1, 1, 1**

        ![Transform information for Camera](images/AzureLabs-Lab1-20.png)

5.	Next, with the **Main Camera** object selected, see the **Add Component** button located at the very bottom of the *Inspector Panel*. 
6.	Select that button, and search (by either typing *Audio Source* into the search field or navigating the sections) for the component called **Audio Source** as shown below and select it (pressing enter on it also works).
7.	An *Audio Source* component will be added to the **Main Camera**, as demonstrated below.

    ![Add an Audio Source component.](images/AzureLabs-Lab1-21.png)

    > [!NOTE]
    > For Microsoft HoloLens, you will need to also change the following, which are part of the **Camera** component on your **Main Camera**:
    > - **Clear Flags:** Solid Color.
    > - **Background** ‘Black, Alpha 0’ – Hex color: #00000000.

## Chapter 4 – Setup Debug Canvas

To show the input and output of the translation, a basic UI needs to be created. For this course, you will create a Canvas UI object, with several ‘Text’ objects to show the data.

1.	Right-click in an empty area of the *Hierarchy Panel*, under **UI**, add a **Canvas**.

    ![Add new Canvas UI object.](images/AzureLabs-Lab1-22.png)

2.	With the Canvas object selected, in the *Inspector Panel* (within the ‘Canvas’ component), change **Render Mode** to **World Space**. 
3.	Next, change the following parameters in the *Inspector Panel’s Rect Transform*:

    1. *POS* -	**X** 0	**Y** 0	**Z** 40
    2. *Width* -	500
    3. *Height* -	300
    4. *Scale* - **X** 0.13	**Y** 0.13	**Z** 0.13

        ![Update the rect transform for the canvas.](images/AzureLabs-Lab1-23.png)
 
4.	Right click on the **Canvas** in the *Hierarchy Panel*, under **UI**, and add a **Panel**. This **Panel** will provide a background to the text that you will be displaying in the scene.
5.	Right click on the **Panel** in the *Hierarchy Panel*, under **UI**, and add a **Text object**. Repeat the same process until you have created four UI Text objects in total (Hint: if you have the first ‘Text’ object selected, you can simply press **‘Ctrl’ + ‘D’**, to duplicate it, until you have four in total). 
6.	For each **Text Object**, select it and use the below tables to set the parameters in the *Inspector Panel*.

    1. For the *Rect Transform* component:

        | Name                   | Transform - *Position*             | Width      | Height    |
        |:----------------------:|:----------------------------------:|:----------:|:---------:|
        | MicrophoneStatusLabel  | **X** -80 **Y** 90 **Z** 0         | 300        | 30        |
        | AzureResponseLabel     | **X** -80 **Y** 30 **Z** 0         | 300        | 30        |
        | DictationLabel         | **X** -80 **Y** -30 **Z** 0        | 300        | 30        |
        | TranslationResultLabel | **X** -80 **Y** -90 **Z** 0        | 300        | 30        |


    2. For the **Text (Script)** component:


        | Name                   | Text               | Font Size    |
        |:----------------------:|:------------------:|:------------:|
        | MicrophoneStatusLabel  | Microphone Status: | 20           |
        | AzureResponseLabel     | Azure Web Response | 20           |
        | DictationLabel         |   You just said:   | 20           |
        | TranslationResultLabel |    Translation:    | 20           |

        ![Input the corresponding values for the UI labels.](images/AzureLabs-Lab1-24.png)

    3. Also, make the Font Style **Bold**. This will make the text easier to read.

        ![Bold Font.](images/AzureLabs-Lab1-25.png)

7.	For each *UI Text object* created in [Chapter 5](#chapter-5--create-the-results-class), create a new *child* **UI Text object**. These children will display the output of the application. Create *child* objects through right-clicking your intended parent (e.g. *MicrophoneStatusLabel*) and then select **UI** and then select **Text**.
8.	For each of these children, select it and use the below tables to set the parameters in the Inspector Panel.

    1. For the **Rect Transform** component:

        | Name                  | Transform - *Position* | Width      | Height    |
        |:---------------------:|:----------------------:|:----------:|:---------:|
        | MicrophoneStatusText  | X 0 Y -30 Z 0          | 300        | 30        |
        | AzureResponseText     | X 0 Y -30 Z 0          | 300        | 30        |
        | DictationText         | X 0 Y -30 Z 0          | 300        | 30        |
        | TranslationResultText | X 0 Y -30 Z 0          | 300        | 30        |

    2. For the **Text (Script)** component:

        | Name                  | Text          | Font Size    |
        |:---------------------:|:-------------:|:------------:|
        | MicrophoneStatusText  |      ??       | 20           |
        | AzureResponseText     |      ??       | 20           |
        | DictationText         |      ??       | 20           |
        | TranslationResultText |      ??       | 20           |

9. Next, select the 'centre' alignment option for each text component:

    ![align text.](images/AzureLabs-Lab1-26.png)

10.	To ensure the **child UI Text** objects are easily readable, change their *Color*. Do this by clicking on the bar (currently ‘Black’) next to *Color*. 

    ![Input corresponding values for the UI text outputs.](images/AzureLabs-Lab1-27.png)
 
11.	Then, in the new, little, *Color* window, change the *Hex Color* to: **0032EAFF**

    ![Update color to blue.](images/AzureLabs-Lab1-28.png)
 
12.	Below is how the **UI** should look.
    1.	In the *Hierarchy Panel*:

        ![Have hierarchy in the provided structure.](images/AzureLabs-Lab1-29.png)

    2.	In the *Scene* and *Game Views*:

        ![Have the scene and game views in the same structure.](images/AzureLabs-Lab1-30.png)

## Chapter 5 – Create the Results class

The first script you need to create is the *Results* class, which is responsible for providing a way to see the results of translation. The Class stores and displays the following: 

- The response result from Azure.
- The microphone status. 
- The result of the dictation (voice to text).
- The result of the translation.

To create this class: 

1.	Right-click in the *Project Panel*, then **Create > Folder**. Name the folder **Scripts**. 
 
    ![Create scripts folder.](images/AzureLabs-Lab1-31.png)

    ![Open the scripts folder.](images/AzureLabs-Lab1-32.png)
 
2.	With the **Scripts** folder create, double click it to open. Then within that folder, right-click, and select **Create >** then **C# Script**. Name the script *Results*. 

    ![Create the first script.](images/AzureLabs-Lab1-33.png)
 
3.	Double click on the new *Results* script to open it with **Visual Studio**.
4.	Insert the following namespaces:

    ```cs
        using UnityEngine;
        using UnityEngine.UI;
    ```

5.	Inside the Class insert the following variables:

    ```cs
        public static Results instance;
   
        [HideInInspector] 
        public string azureResponseCode;
   
        [HideInInspector] 
        public string translationResult;
   
        [HideInInspector] 
        public string dictationResult;
   
        [HideInInspector] 
        public string micStatus;
   
        public Text microphoneStatusText;
   
        public Text azureResponseText;
   
        public Text dictationText;
   
        public Text translationResultText;
    ```

6.	Then add the *Awake()* method, which will be called when the class initializes. 

    ```csharp
        private void Awake() 
        { 
            // Set this class to behave similar to singleton 
            instance = this;           
        } 
    ```

7.	Finally, add the methods which are responsible for outputting the various results information to the UI. 

    ```csharp
        /// <summary>
        /// Stores the Azure response value in the static instance of Result class.
        /// </summary>
        public void SetAzureResponse(string result)
        {
            azureResponseCode = result;
            azureResponseText.text = azureResponseCode;
        }
   
        /// <summary>
        /// Stores the translated result from dictation in the static instance of Result class. 
        /// </summary>
        public void SetDictationResult(string result)
        {
            dictationResult = result;
            dictationText.text = dictationResult;
        }
   
        /// <summary>
        /// Stores the translated result from Azure Service in the static instance of Result class. 
        /// </summary>
        public void SetTranslatedResult(string result)
        {
            translationResult = result;
            translationResultText.text = translationResult;
        }
   
        /// <summary>
        /// Stores the status of the Microphone in the static instance of Result class. 
        /// </summary>
        public void SetMicrophoneStatus(string result)
        {
            micStatus = result;
            microphoneStatusText.text = micStatus;
        }
    ```

8.	Be sure to save your changes in *Visual Studio* before returning to *Unity*.

## Chapter 6 – Create the *MicrophoneManager* class

The second class you are going to create is the *MicrophoneManager*.

This class is responsible for:

- Detecting the recording device attached to the headset or machine (whichever is the default).
- Capture the audio (voice) and use dictation to store it as a string.
- Once the voice has paused, submit the dictation to the Translator class.
- Host a method that can stop the voice capture if desired.

To create this class: 
1.	Double click on the **Scripts** folder, to open it. 
2.	Right-click inside the **Scripts** folder, click **Create > C# Script**. Name the script *MicrophoneManager*. 
3.	Double click on the new script to open it with Visual Studio.
4.	Update the namespaces to be the same as the following, at the top of the *MicrophoneManager* class:

    ```csharp
        using UnityEngine; 
        using UnityEngine.Windows.Speech;
    ```

5.	Then, add the following variables inside the *MicrophoneManager* class:

    ```csharp
        // Help to access instance of this object 
        public static MicrophoneManager instance; 
     
        // AudioSource component, provides access to mic 
        private AudioSource audioSource; 
   
        // Flag indicating mic detection 
        private bool microphoneDetected; 
   
        // Component converting speech to text 
        private DictationRecognizer dictationRecognizer; 
    ```

6.	Code for the *Awake()* and *Start()* methods now needs to be added. These will be called when the class initializes:

    ```csharp
        private void Awake() 
        { 
            // Set this class to behave similar to singleton 
            instance = this; 
        } 
    
        void Start() 
        { 
            //Use Unity Microphone class to detect devices and setup AudioSource 
            if(Microphone.devices.Length > 0) 
            { 
                Results.instance.SetMicrophoneStatus("Initialising..."); 
                audioSource = GetComponent<AudioSource>(); 
                microphoneDetected = true; 
            } 
            else 
            { 
                Results.instance.SetMicrophoneStatus("No Microphone detected"); 
            } 
        } 
    ```

7.	You can *delete* the *Update()* method since this class will not use it.
8.	Now you need the methods that the App uses to start and stop the voice capture, and pass it to the *Translator* class, that you will build soon. Copy the following code and paste it beneath the *Start()* method.

    ```csharp
        /// <summary> 
        /// Start microphone capture. Debugging message is delivered to the Results class. 
        /// </summary> 
        public void StartCapturingAudio() 
        { 
            if(microphoneDetected) 
            {               
                // Start dictation 
                dictationRecognizer = new DictationRecognizer(); 
                dictationRecognizer.DictationResult += DictationRecognizer_DictationResult; 
                dictationRecognizer.Start(); 
    
                // Update UI with mic status 
                Results.instance.SetMicrophoneStatus("Capturing..."); 
            }      
        } 
 
        /// <summary> 
        /// Stop microphone capture. Debugging message is delivered to the Results class. 
        /// </summary> 
        public void StopCapturingAudio() 
        { 
            Results.instance.SetMicrophoneStatus("Mic sleeping"); 
            Microphone.End(null); 
            dictationRecognizer.DictationResult -= DictationRecognizer_DictationResult; 
            dictationRecognizer.Dispose(); 
        }
    ```

    > [!TIP]
    > Though this application will not make use of it, the *StopCapturingAudio()* method has also been provided here, should you want to implement the ability to stop capturing audio in your application.

9.	You now need to add a Dictation Handler that will be invoked when the voice stops. This method will then pass the dictated text to the *Translator* class.

    ```csharp
        /// <summary>
        /// This handler is called every time the Dictation detects a pause in the speech. 
        /// Debugging message is delivered to the Results class.
        /// </summary>
        private void DictationRecognizer_DictationResult(string text, ConfidenceLevel confidence)
        {
            // Update UI with dictation captured
            Results.instance.SetDictationResult(text);
   
            // Start the coroutine that process the dictation through Azure 
            StartCoroutine(Translator.instance.TranslateWithUnityNetworking(text));   
        }
    ```

10.	Be sure to save your changes in Visual Studio before returning to Unity.

> [!WARNING]  
> At this point you will notice an error appearing in the *Unity Editor Console* Panel (“The name ‘Translator’ does not exist...”). This is because the code references the *Translator* class, which you will create in the next chapter.

## Chapter 7 – Call to Azure and translator service

The last script you need to create is the *Translator* class. 

This class is responsible for:

-	Authenticating the App with *Azure*, in exchange for an **Auth Token**.
-	Use the **Auth Token** to submit text (received from the *MicrophoneManager* Class) to be translated.
-	Receive the translated result and pass it to the *Results* Class to be visualized in the UI.

To create this Class: 
1.	Go to the **Scripts** folder you created previously. 
2.	Right-click in the **Project Panel**, **Create > C# Script**. Call the script *Translator*.
3.	Double click on the new *Translator* script to open it **with Visual Studio**.
4.	Add the following namespaces to the top of the file:

    ```csharp
        using System;
        using System.Collections;
        using System.Xml.Linq;
        using UnityEngine;
        using UnityEngine.Networking;
    ```

5.	Then add the following variables inside the *Translator* class:

    ```csharp
        public static Translator instance; 
        private string translationTokenEndpoint = "https://api.cognitive.microsoft.com/sts/v1.0/issueToken"; 
        private string translationTextEndpoint = "https://api.microsofttranslator.com/v2/http.svc/Translate?"; 
        private const string ocpApimSubscriptionKeyHeader = "Ocp-Apim-Subscription-Key"; 
    
        //Substitute the value of authorizationKey with your own Key 
        private const string authorizationKey = "-InsertYourAuthKeyHere-"; 
        private string authorizationToken; 
    
        // languages set below are: 
        // English 
        // French 
        // Italian 
        // Japanese 
        // Korean 
        public enum Languages { en, fr, it, ja, ko }; 
        public Languages from = Languages.en; 
        public Languages to = Languages.it; 
    ```

    > [!NOTE]
    > -	The languages inserted into the languages **enum** are just examples. Feel free to add more if you wish; the [API supports over 60 languages](/azure/cognitive-services/translator/languages) (including Klingon)!
    > - There is a [more interactive page covering available languages](https://www.microsoft.com/translator/business/languages/), though be aware the page only appears to work when the site language is set to '' (and the Microsoft site will likely redirect to your native language). You can change site language at the bottom of the page or by altering the URL.
    > -	The **authorizationKey** value, in the above code snippet, must be the **Key**  you received when you subscribed to the *Azure Translator Text API*. This was covered in [Chapter 1](#chapter-1--the-azure-portal).

6.	Code for the *Awake()* and *Start()* methods now needs to be added. 
7.	In this case, the code will make a call to *Azure* using the authorization Key, to get a *Token*.

    ```csharp
        private void Awake() 
        { 
            // Set this class to behave similar to singleton  
            instance = this; 
        } 
    
        // Use this for initialization  
        void Start() 
        { 
            // When the application starts, request an auth token 
            StartCoroutine("GetTokenCoroutine", authorizationKey); 
        }
    ```

    > [!NOTE]
    > The token will expire after 10 minutes. Depending on the scenario for your app, you might have to make the same coroutine call multiple times.

8.	The coroutine to obtain the Token is the following:

    ```csharp
        /// <summary> 
        /// Request a Token from Azure Translation Service by providing the access key. 
        /// Debugging result is delivered to the Results class. 
        /// </summary> 
        private IEnumerator GetTokenCoroutine(string key)
        {
            if (string.IsNullOrEmpty(key))
            {
                throw new InvalidOperationException("Authorization key not set.");
            }

            using (UnityWebRequest unityWebRequest = UnityWebRequest.Post(translationTokenEndpoint, string.Empty))
            {
                unityWebRequest.SetRequestHeader("Ocp-Apim-Subscription-Key", key);
                yield return unityWebRequest.SendWebRequest();

                long responseCode = unityWebRequest.responseCode;

                // Update the UI with the response code 
                Results.instance.SetAzureResponse(responseCode.ToString());

                if (unityWebRequest.isNetworkError || unityWebRequest.isHttpError)
                {
                    Results.instance.azureResponseText.text = unityWebRequest.error;
                    yield return null;
                }
                else
                {
                    authorizationToken = unityWebRequest.downloadHandler.text;
                }
            }

            // After receiving the token, begin capturing Audio with the MicrophoneManager Class 
            MicrophoneManager.instance.StartCapturingAudio();
        }
    ```

    > [!WARNING]
    > If you edit the name of the IEnumerator method **GetTokenCoroutine()**, you need to update the *StartCoroutine* and *StopCoroutine* call string values in the above code. [As per Unity documentation](https://docs.unity3d.com/ScriptReference/MonoBehaviour.StartCoroutine.html), to Stop a specific *Coroutine*, you need to use the string value method.

9.	Next, add the coroutine (with a “support” stream method right below it) to obtain the translation of the text received by the *MicrophoneManager* class. This code creates a query string to send to the *Azure Translator Text API*, and then uses the internal Unity UnityWebRequest class to make a ‘Get’ call to the endpoint with the query string. The result is then used to set the translation in your Results object. The code below shows the implementation:

    ```csharp
        /// <summary> 
        /// Request a translation from Azure Translation Service by providing a string.  
        /// Debugging result is delivered to the Results class. 
        /// </summary> 
        public IEnumerator TranslateWithUnityNetworking(string text)
        {
            // This query string will contain the parameters for the translation 
            string queryString = string.Concat("text=", Uri.EscapeDataString(text), "&from=", from, "&to=", to);

            using (UnityWebRequest unityWebRequest = UnityWebRequest.Get(translationTextEndpoint + queryString))
            {
                unityWebRequest.SetRequestHeader("Authorization", "Bearer " + authorizationToken);
                unityWebRequest.SetRequestHeader("Accept", "application/xml");
                yield return unityWebRequest.SendWebRequest();

                if (unityWebRequest.isNetworkError || unityWebRequest.isHttpError)
                {
                    Debug.Log(unityWebRequest.error);
                    yield return null;
                }

                // Parse out the response text from the returned Xml
                string result = XElement.Parse(unityWebRequest.downloadHandler.text).Value;
                Results.instance.SetTranslatedResult(result);
            }
        }
    ```

10.	Be sure to save your changes in *Visual Studio* before returning to *Unity*.

## Chapter 8 – Configure the Unity Scene

1.	Back in the Unity Editor, click and drag the *Results* class *from* the **Scripts** folder to the **Main Camera** object in the *Hierarchy Panel*.
2.	Click on the **Main Camera** and look at the *Inspector Panel*. You will notice that within the newly added *Script* component, there are four fields with empty values. These are the output references to the properties in the code. 
3.	Drag the appropriate **Text** objects from the *Hierarchy Panel* to those four slots, as shown in the image below.

    ![Update target references with specified values.](images/AzureLabs-Lab1-34.png)
  
4.	Next, click and drag the *Translator* class from the **Scripts** folder to the **Main Camera** object in the *Hierarchy Panel*. 
5.	Then, click and drag the *MicrophoneManager* class from the **Scripts** folder to the **Main Camera** object in the *Hierarchy Panel*. 
6.	Lastly, click on the **Main Camera** and look at the *Inspector Panel*. You will notice that in the script you dragged on, there are two drop down boxes that will allow you to set the languages.
 
    ![Ensure the intended translation languages are input.](images/AzureLabs-Lab1-35.png)

## Chapter 9 – Test in mixed reality

At this point you need to test that the Scene has been properly implemented.

Ensure that:

- All the settings mentioned in [Chapter 1](#chapter-1--the-azure-portal) are set correctly. 
- The *Results*, *Translator*, and *MicrophoneManager*, scripts are attached to the **Main Camera** object. 
- You have placed your *Azure Translator Text API* Service **Key** within the **authorizationKey** variable within the *Translator* Script.  
- All the fields in the *Main Camera Inspector Panel* are assigned properly.
- Your microphone is working when running your scene (if not, check that your attached microphone is the *default* device, and that you have [set it up correctly within Windows](https://support.microsoft.com/help/4027981/windows-how-to-set-up-and-test-microphones-in-windows-10)).

You can test the immersive headset by pressing the **Play** button in the *Unity Editor*.
The App should be functioning through the attached immersive headset.

> [!WARNING]  
> If you see an error in the Unity console about the default audio device changing, the scene may not function as expected. This is due to the way the mixed reality portal deals with built-in microphones for headsets that have them. If you see this error, simply stop the scene and start it again and things should work as expected.

## Chapter 10 – Build the UWP solution and sideload on local machine

Everything needed for the Unity section of this project has now been completed, so it is time to build it from Unity.

1.	Navigate to **Build Settings**: **File > Build Settings...**
2.	From the **Build Settings** window, click **Build**.

    ![Build the Unity scene.](images/AzureLabs-Lab1-36.png)
  
3.	If not already, tick **Unity C# Projects**.
4.	Click **Build**. Unity will launch a *File Explorer* window, where you need to create and then select a folder to build the app into. Create that folder now, and name it *App*. Then with the *App* folder selected, press **Select Folder**. 
5.	Unity will begin building your project to the *App* folder. 
6.	Once Unity has finished building (it might take some time), it will open a *File Explorer* window at the location of your build (check your task bar, as it may not always appear above your windows, but will notify you of the addition of a new window).

## Chapter 11 – Deploy your application

To deploy your application:

1.	Navigate to your new Unity build (the *App* folder) and open the solution file with *Visual Studio*.
2.	In the Solution Configuration select **Debug**.
3.	In the Solution Platform, select **x86**, **Local Machine**. 

    > For the Microsoft HoloLens, you may find it easier to set this to *Remote Machine*, so that you are not tethered to your computer. Though, you will need to also do the following:
    > - Know the **IP Address** of your HoloLens, which can be found within the *Settings > Network & Internet > Wi-Fi > Advanced Options*; the IPv4 is the address you should use. 
    > - Ensure *Developer Mode* is **On**; found in *Settings > Update & Security > For developers*.

    ![Deploy the solution from Visual Studio.](images/AzureLabs-Lab1-37.png)
    
 
4.	Go to **Build menu** and click on **Deploy Solution** to sideload the application to your PC.
5.	Your App should now appear in the list of installed apps, ready to be launched.
6.	Once launched, the App will prompt you to authorize access to the Microphone. Make sure to click the **YES** button.
7.	You are now ready to start translating!

## Your finished Translation Text API application

Congratulations, you built a mixed reality app that leverages the Azure Translation Text API to convert speech to translated text.

![Final product.](images/AzureLabs-Lab1-00.png)

## Bonus exercises

### Exercise 1

Can you add text-to-speech functionality to the app, so that the returned text is spoken?

### Exercise 2

Make it possible for the user to change the source and output languages ('from' and 'to') within the app itself, so the app does not need to be rebuilt every time you want to change languages.
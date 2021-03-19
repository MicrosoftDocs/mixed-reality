---
title: HoloLens (1st gen) Input 212 - Voice
description: Follow this coding walkthrough using Unity, Visual Studio and HoloLens to learn the details of voice concepts.
author: keveleigh
ms.author: kurtie
ms.date: 10/22/2019
ms.topic: article
keywords: holotoolkit, mixedrealitytoolkit, mixedrealitytoolkit-unity, academy, tutorial, voice, HoloLens, Mixed Reality Academy, unity, mixed reality headset, windows mixed reality headset, virtual reality headset, Windows 10
---


# HoloLens (1st gen) Input 212: Voice

>[!NOTE]
>The Mixed Reality Academy tutorials were designed with HoloLens (1st gen) and Mixed Reality Immersive Headsets in mind.  As such, we feel it is important to leave these tutorials in place for developers who are still looking for guidance in developing for those devices.  These tutorials will **_not_** be updated with the latest toolsets or interactions being used for HoloLens 2.  They will be maintained to continue working on the supported devices. [A new series of tutorials](./mr-learning-base-01.md) has been posted for HoloLens 2.

[Voice input](../../../design/voice-input.md) gives us another way to interact with our holograms. Voice commands work in a very natural and easy way. Design your voice commands so that they are:

* Natural
* Easy to remember
* Context appropriate
* Sufficiently distinct from other options within the same context

>[!VIDEO https://www.youtube.com/embed/BYpYsVFYjdw]

In [MR Basics 101](../../../develop/unity/tutorials/holograms-101.md), we used the KeywordRecognizer to build two simple voice commands. In MR Input 212, we'll dive deeper and learn how to:

* Design voice commands that are optimized for the HoloLens speech engine.
* Make the user aware of what voice commands are available.
* Acknowledge that we've heard the user's voice command.
* Understand what the user is saying, using a Dictation Recognizer.
* Use a Grammar Recognizer to listen for commands based on an SRGS, or Speech Recognition Grammar Specification, file.

In this course, we'll revisit Model Explorer, which we built in [MR Input 210](holograms-210.md) and [MR Input 211](holograms-211.md).

>[!IMPORTANT]
>The videos embedded in each of the chapters below were recorded using an older version of Unity and the Mixed Reality Toolkit. While the step-by-step instructions are accurate and current, you may see scripts and visuals in the corresponding videos that are out-of-date. The videos remain included for posterity and because the concepts covered still apply.


## Device support

<table>
<tr>
<th>Course</th><th style="width:150px"> <a href="/hololens/hololens1-hardware">HoloLens</a></th><th style="width:150px"> <a href="../../../discover/immersive-headset-hardware-details.md">Immersive headsets</a></th>
</tr><tr>
<td>MR Input 212: Voice</td><td style="text-align: center;"> ✔️</td><td style="text-align: center;"> ✔️</td>
</tr>
</table>

## Before you start

### Prerequisites

* A Windows 10 PC configured with the correct [tools installed](../../../develop/install-the-tools.md).
* Some basic C# programming ability.
* You should have completed [MR Basics 101](../../../develop/unity/tutorials/holograms-101.md).
* You should have completed [MR Input 210](holograms-210.md).
* You should have completed [MR Input 211](holograms-211.md).
* A HoloLens device [configured for development](../../../develop/platform-capabilities-and-apis/using-visual-studio.md#enabling-developer-mode).

### Project files

* Download the [files](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-212-Voice.zip) required by the project. Requires Unity 2017.2 or later.
* Un-archive the files to your desktop or other easy to reach location.

>[!NOTE]
>If you want to look through the source code before downloading, it's [available on GitHub](https://github.com/Microsoft/HolographicAcademy/tree/Holograms-212-Voice).

### Errata and Notes

* "Enable Just My Code" needs to be disabled (*unchecked*) in Visual Studio under Tools->Options->Debugging in order to hit breakpoints in your code.

## Unity Setup

### Instructions

1. Start Unity.
2. Select **Open**.
3. Navigate to the **HolographicAcademy-Holograms-212-Voice** folder you previously un-archived.
4. Find and select the **Starting**/**Model Explorer** folder.
5. Click the **Select Folder** button.
6. In the **Project** panel, expand the **Scenes** folder.
7. Double-click **ModelExplorer** scene to load it in Unity.

### Building

1. In Unity, select **File > Build Settings**.
2. If **Scenes/ModelExplorer** is not listed in **Scenes In Build**, click **Add Open Scenes** to add the scene.
3. If you're specifically developing for HoloLens, set **Target device** to **HoloLens**. Otherwise, leave it on **Any device**.
4. Ensure **Build Type** is set to **D3D** and **SDK** is set to **Latest installed** (which should be SDK 16299 or newer).
5. Click **Build**.
6. Create a **New Folder** named "App".
7. Single click the **App** folder.
8. Press **Select Folder** and Unity will start building the project for Visual Studio.

When Unity is done, a File Explorer window will appear.

1. Open the **App** folder.
2. Open the **ModelExplorer Visual Studio Solution**.

If deploying to HoloLens:

1. Using the top toolbar in Visual Studio, change the target from Debug to **Release** and from ARM to **x86**.
2. Click on the drop down arrow next to the Local Machine button, and select **Remote Machine**.
3. Enter **your HoloLens device IP address** and set Authentication Mode to **Universal (Unencrypted Protocol)**. Click **Select**. If you do not know your device IP address, look in **Settings > Network & Internet > Advanced Options**.
4. In the top menu bar, click **Debug -> Start Without debugging** or press **Ctrl + F5**. If this is the first time deploying to your device, you will need to [pair it with Visual Studio](../../../develop/platform-capabilities-and-apis/using-visual-studio.md#pairing-your-device).
5. When the app has deployed, dismiss the **Fitbox** with a **select gesture**.

If deploying to an immersive headset:

1. Using the top toolbar in Visual Studio, change the target from Debug to **Release** and from ARM to **x64**.
2. Make sure the deployment target is set to **Local Machine**.
3. In the top menu bar, click **Debug -> Start Without debugging** or press **Ctrl + F5**.
4. When the app has deployed, dismiss the **Fitbox** by pulling the trigger on a motion controller.

>[!NOTE]
>You might notice some red errors in the Visual Studio Errors panel. It is safe to ignore them. Switch to the Output panel to view actual build progress. Errors in the Output panel will require you to make a fix (most often they are caused by a mistake in a script).

## Chapter 1 - Awareness

>[!VIDEO https://www.youtube.com/embed/fDwijJWuEc0]

### Objectives

* Learn the **Dos and Don'ts** of voice command design.
* Use **KeywordRecognizer** to add gaze based voice commands.
* Make users aware of voice commands using cursor **feedback**.

### Voice Command Design

In this chapter, you'll learn about designing voice commands. When creating voice commands:

#### DO

* Create concise commands. You don't want to use *"Play the currently selected video"*, because that command is not concise and would easily be forgotten by the user. Instead, you should use: *"Play Video"*, because it is concise and has multiple syllables.
* Use a simple vocabulary. Always try to use common words and phrases that are easy for the user to discover and remember. For example, if your application had a note object that could be displayed or hidden from view, you would not use the command *"Show Placard"*, because "placard" is a rarely used term. Instead, you would use the command: *"Show Note"*, to reveal the note in your application.
* Be consistent. Voice commands should be kept consistent across your application. Imagine that you have two scenes in your application and both scenes contain a button for closing the application. If the first scene used the command *"Exit"* to trigger the button, but the second scene used the command *"Close App"*, then the user is going to get very confused. If the same functionality persists across multiple scenes, then the same voice command should be used to trigger it.

#### DON'T

* Use single syllable commands. As an example, if you were creating a voice command to play a video, you should avoid using the simple command *"Play"*, as it is only a single syllable and could easily be missed by the system. Instead, you should use: *"Play Video"*, because it is concise and has multiple syllables.
* Use system commands. The *"Select"* command is reserved by the system to trigger a Tap event for the currently focused object. Do not re-use the *"Select"* command in a keyword or phrase, as it might not work as you expect. For example, if the voice command for selecting a cube in your application was *"Select cube"*, but the user was looking at a sphere when they uttered the command, then the sphere would be selected instead. Similarly app bar commands are voice enabled. Don't use the following speech commands in your CoreWindow View:
    1. Go Back
    2. Scroll Tool
    3. Zoom Tool
    4. Drag Tool
    5. Adjust
    6. Remove
* Use similar sounds. Try to avoid using voice commands that rhyme. If you had a shopping application which supported *"Show Store"* and *"Show More"* as voice commands, then you would want to disable one of the commands while the other was in use. For example, you could use the *"Show Store"* button to open the store, and then disable that command when the store was displayed so that the *"Show More"* command could be used for browsing.

### Instructions

* In Unity's **Hierarchy** panel, use the search tool to find the **holoComm_screen_mesh** object.
* Double-click on the **holoComm_screen_mesh** object to view it in the **Scene**. This is the astronaut's watch, which will respond to our voice commands.
* In the **Inspector** panel, locate the **Speech Input Source (Script)** component.
* Expand the **Keywords** section to see the supported voice command: **Open Communicator**.
* Click the cog to the right side, then select **Edit Script**.
* Explore **SpeechInputSource.cs** to understand how it uses the **KeywordRecognizer** to add voice commands.

### Build and Deploy

* In Unity, use **File > Build Settings** to rebuild the application.
* Open the **App** folder.
* Open the **ModelExplorer Visual Studio Solution**.

(If you already built/deployed this project in Visual Studio during set-up, then you can open that instance of VS and click 'Reload All' when prompted).

* In Visual Studio, click **Debug -> Start Without debugging** or press **Ctrl + F5**.
* After the application deploys to the HoloLens, dismiss the fit box using the [air-tap](../../../design/gaze-and-commit.md#composite-gestures) gesture.
* Gaze at the astronaut's watch.
* When the watch has focus, verify that the cursor changes to a microphone. This provides feedback that the application is listening for voice commands.
* Verify that a tooltip appears on the watch. This helps users discover the *"Open Communicator"* command.
* While gazing at the watch, say *"Open Communicator"* to open the communicator panel.

## Chapter 2 - Acknowledgement

>[!VIDEO https://www.youtube.com/embed/87ViteoPpyU]

### Objectives

* Record a message using the Microphone input.
* Give feedback to the user that the application is listening to their voice.

>[!NOTE]
>The **Microphone** capability must be declared for an app to record from the microphone. This is done for you already in MR Input 212, but keep this in mind for your own projects.
>
>1. In the Unity Editor, go to the player settings by navigating to "Edit > Project Settings > Player"
>2. Click on the "Universal Windows Platform" tab
>3. In the "Publishing Settings > Capabilities" section, check the **Microphone** capability

### Instructions

* In Unity's **Hierarchy** panel, verify that the **holoComm_screen_mesh** object is selected.
* In the **Inspector** panel, find the **Astronaut Watch (Script)** component.
* Click on the small, blue cube which is set as the value of the **Communicator Prefab** property.
* In the **Project** panel, the **Communicator** prefab should now have focus.
* Click on the **Communicator** prefab in the **Project** panel to view its components in the **Inspector**.
* Look at the **Microphone Manager (Script)** component, this will allow us to record the user's voice.
* Notice that the **Communicator** object has a **Speech Input Handler (Script)** component for responding to the **Send Message** command.
* Look at the **Communicator (Script)** component and double-click on the script to open it in Visual Studio.

Communicator.cs is responsible for setting the proper button states on the communicator device. This will allow our users to record a message, play it back, and send the message to the astronaut. It will also start and stop an animated wave form, to acknowledge to the user that their voice was heard.

* In **Communicator.cs**, delete the following lines (81 and 82) from the **Start** method. This will enable the 'Record' button on the communicator.

```cs
// TODO: 2.a Delete the following two lines:
RecordButton.SetActive(false);
MessageUIRenderer.gameObject.SetActive(false);
```

### Build and Deploy

* In Visual Studio, rebuild your application and deploy to the device.
* Gaze at the astronaut's watch and say *"Open Communicator"* to show the communicator.
* Press the **Record** button (microphone) to start recording a verbal message for the astronaut.
* Start speaking, and verify that the wave animation plays on the communicator, which provides feedback to the user that their voice is heard.
* Press the **Stop** button (left square), and verify that the wave animation stops running.
* Press the **Play** button (right triangle) to play back the recorded message and hear it on the device.
* Press the **Stop** button (right square) to stop playback of the recorded message.
* Say *"Send Message"* to close the communicator and receive a 'Message Received' response from the astronaut.

## Chapter 3 - Understanding and the Dictation Recognizer

>[!VIDEO https://www.youtube.com/embed/TIMddr-HqEU]

### Objectives

* Use the Dictation Recognizer to convert the user's speech to text.
* Show the Dictation Recognizer's hypothesized and final results in the communicator.

In this chapter, we'll use the Dictation Recognizer to create a message for the astronaut. When using the Dictation Recognizer, keep in mind that:

* You must be connected to WiFi for the Dictation Recognizer to work.
* Timeouts occur after a set period of time. There are two timeouts to be aware of:
  * If the recognizer starts and doesn't hear any audio for the first five seconds, it will timeout.
  * If the recognizer has given a result but then hears silence for twenty seconds, it will timeout.
* Only one type of recognizer (Keyword or Dictation) can run at a time.

>[!NOTE]
>The **Microphone** capability must be declared for an app to record from the microphone. This is done for you already in MR Input 212, but keep this in mind for your own projects.
>
>1. In the Unity Editor, go to the player settings by navigating to "Edit > Project Settings > Player"
>2. Click on the "Universal Windows Platform" tab
>3. In the "Publishing Settings > Capabilities" section, check the **Microphone** capability

### Instructions

We're going to edit **MicrophoneManager.cs** to use the Dictation Recognizer. This is what we'll add:

1. When the **Record button** is pressed, we'll **start the DictationRecognizer**.
2. Show the **hypothesis** of what the DictationRecognizer understood.
3. Lock in the **results** of what the DictationRecognizer understood.
4. Check for timeouts from the DictationRecognizer.
5. When the **Stop button** is pressed, or the mic session times out, **stop the DictationRecognizer**.
6. Restart the **KeywordRecognizer**, which will listen for the **Send Message** command.

Let's get started. Complete all coding exercises for 3.a in **MicrophoneManager.cs**, or copy and paste the finished code found below:

```cs
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See LICENSE in the project root for license information.

using System.Collections;
using System.Text;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Windows.Speech;

namespace Academy
{
    public class MicrophoneManager : MonoBehaviour
    {
        [Tooltip("A text area for the recognizer to display the recognized strings.")]
        [SerializeField]
        private Text dictationDisplay;

        private DictationRecognizer dictationRecognizer;

        // Use this string to cache the text currently displayed in the text box.
        private StringBuilder textSoFar;

        // Using an empty string specifies the default microphone.
        private static string deviceName = string.Empty;
        private int samplingRate;
        private const int messageLength = 10;

        // Use this to reset the UI once the Microphone is done recording after it was started.
        private bool hasRecordingStarted;

        void Awake()
        {
            /* TODO: DEVELOPER CODING EXERCISE 3.a */

            // 3.a: Create a new DictationRecognizer and assign it to dictationRecognizer variable.
            dictationRecognizer = new DictationRecognizer();

            // 3.a: Register for dictationRecognizer.DictationHypothesis and implement DictationHypothesis below
            // This event is fired while the user is talking. As the recognizer listens, it provides text of what it's heard so far.
            dictationRecognizer.DictationHypothesis += DictationRecognizer_DictationHypothesis;

            // 3.a: Register for dictationRecognizer.DictationResult and implement DictationResult below
            // This event is fired after the user pauses, typically at the end of a sentence. The full recognized string is returned here.
            dictationRecognizer.DictationResult += DictationRecognizer_DictationResult;

            // 3.a: Register for dictationRecognizer.DictationComplete and implement DictationComplete below
            // This event is fired when the recognizer stops, whether from Stop() being called, a timeout occurring, or some other error.
            dictationRecognizer.DictationComplete += DictationRecognizer_DictationComplete;

            // 3.a: Register for dictationRecognizer.DictationError and implement DictationError below
            // This event is fired when an error occurs.
            dictationRecognizer.DictationError += DictationRecognizer_DictationError;

            // Query the maximum frequency of the default microphone. Use 'unused' to ignore the minimum frequency.
            int unused;
            Microphone.GetDeviceCaps(deviceName, out unused, out samplingRate);

            // Use this string to cache the text currently displayed in the text box.
            textSoFar = new StringBuilder();

            // Use this to reset the UI once the Microphone is done recording after it was started.
            hasRecordingStarted = false;
        }

        void Update()
        {
            // 3.a: Add condition to check if dictationRecognizer.Status is Running
            if (hasRecordingStarted && !Microphone.IsRecording(deviceName) && dictationRecognizer.Status == SpeechSystemStatus.Running)
            {
                // Reset the flag now that we're cleaning up the UI.
                hasRecordingStarted = false;

                // This acts like pressing the Stop button and sends the message to the Communicator.
                // If the microphone stops as a result of timing out, make sure to manually stop the dictation recognizer.
                // Look at the StopRecording function.
                SendMessage("RecordStop");
            }
        }

        /// <summary>
        /// Turns on the dictation recognizer and begins recording audio from the default microphone.
        /// </summary>
        /// <returns>The audio clip recorded from the microphone.</returns>
        public AudioClip StartRecording()
        {
            // 3.a Shutdown the PhraseRecognitionSystem. This controls the KeywordRecognizers
            PhraseRecognitionSystem.Shutdown();

            // 3.a: Start dictationRecognizer
            dictationRecognizer.Start();

            // 3.a Uncomment this line
            dictationDisplay.text = "Dictation is starting. It may take time to display your text the first time, but begin speaking now...";

            // Set the flag that we've started recording.
            hasRecordingStarted = true;

            // Start recording from the microphone for 10 seconds.
            return Microphone.Start(deviceName, false, messageLength, samplingRate);
        }

        /// <summary>
        /// Ends the recording session.
        /// </summary>
        public void StopRecording()
        {
            // 3.a: Check if dictationRecognizer.Status is Running and stop it if so
            if (dictationRecognizer.Status == SpeechSystemStatus.Running)
            {
                dictationRecognizer.Stop();
            }

            Microphone.End(deviceName);
        }

        /// <summary>
        /// This event is fired while the user is talking. As the recognizer listens, it provides text of what it's heard so far.
        /// </summary>
        /// <param name="text">The currently hypothesized recognition.</param>
        private void DictationRecognizer_DictationHypothesis(string text)
        {
            // 3.a: Set DictationDisplay text to be textSoFar and new hypothesized text
            // We don't want to append to textSoFar yet, because the hypothesis may have changed on the next event
            dictationDisplay.text = textSoFar.ToString() + " " + text + "...";
        }

        /// <summary>
        /// This event is fired after the user pauses, typically at the end of a sentence. The full recognized string is returned here.
        /// </summary>
        /// <param name="text">The text that was heard by the recognizer.</param>
        /// <param name="confidence">A representation of how confident (rejected, low, medium, high) the recognizer is of this recognition.</param>
        private void DictationRecognizer_DictationResult(string text, ConfidenceLevel confidence)
        {
            // 3.a: Append textSoFar with latest text
            textSoFar.Append(text + ". ");

            // 3.a: Set DictationDisplay text to be textSoFar
            dictationDisplay.text = textSoFar.ToString();
        }

        /// <summary>
        /// This event is fired when the recognizer stops, whether from Stop() being called, a timeout occurring, or some other error.
        /// Typically, this will simply return "Complete". In this case, we check to see if the recognizer timed out.
        /// </summary>
        /// <param name="cause">An enumerated reason for the session completing.</param>
        private void DictationRecognizer_DictationComplete(DictationCompletionCause cause)
        {
            // If Timeout occurs, the user has been silent for too long.
            // With dictation, the default timeout after a recognition is 20 seconds.
            // The default timeout with initial silence is 5 seconds.
            if (cause == DictationCompletionCause.TimeoutExceeded)
            {
                Microphone.End(deviceName);

                dictationDisplay.text = "Dictation has timed out. Please press the record button again.";
                SendMessage("ResetAfterTimeout");
            }
        }

        /// <summary>
        /// This event is fired when an error occurs.
        /// </summary>
        /// <param name="error">The string representation of the error reason.</param>
        /// <param name="hresult">The int representation of the hresult.</param>
        private void DictationRecognizer_DictationError(string error, int hresult)
        {
            // 3.a: Set DictationDisplay text to be the error string
            dictationDisplay.text = error + "\nHRESULT: " + hresult;
        }

        /// <summary>
        /// The dictation recognizer may not turn off immediately, so this call blocks on
        /// the recognizer reporting that it has actually stopped.
        /// </summary>
        public IEnumerator WaitForDictationToStop()
        {
            while (dictationRecognizer != null && dictationRecognizer.Status == SpeechSystemStatus.Running)
            {
                yield return null;
            }
        }
    }
}
```

### Build and Deploy

* Rebuild in Visual Studio and deploy to your device.
* Dismiss the fit box with an air-tap gesture.
* Gaze at the astronaut's watch and say *"Open Communicator"*.
* Select the **Record** button (microphone) to record your message.
* Start speaking. The **Dictation Recognizer** will interpret your speech and show the hypothesized text in the communicator.
* Try saying *"Send Message"* while you are recording a message. Notice that the **Keyword Recognizer** does not respond because the **Dictation Recognizer** is still active.
* Stop speaking for a few seconds. Watch as the Dictation Recognizer completes its hypothesis and shows the final result.
* Begin speaking and then pause for 20 seconds. This will cause the **Dictation Recognizer** to timeout.
* Notice that the **Keyword Recognizer** is re-enabled after the above timeout. The communicator will now respond to voice commands.
* Say *"Send Message"* to send the message to the astronaut.

## Chapter 4 - Grammar Recognizer

>[!VIDEO https://www.youtube.com/embed/J2dYJNSvv18]

### Objectives

* Use the Grammar Recognizer to recognize the user's speech according to an SRGS, or Speech Recognition Grammar Specification, file.

>[!NOTE]
>The **Microphone** capability must be declared for an app to record from the microphone. This is done for you already in MR Input 212, but keep this in mind for your own projects.
>
>1. In the Unity Editor, go to the player settings by navigating to "Edit > Project Settings > Player"
>2. Click on the "Universal Windows Platform" tab
>3. In the "Publishing Settings > Capabilities" section, check the **Microphone** capability

### Instructions

1. In the **Hierarchy** panel, search for **Jetpack_Center** and select it.
2. Look for the **Tagalong Action** script in the **Inspector** panel.
3. Click the little circle to the right of the **Object To Tag Along** field.
4. In the window that pops up, search for **SRGSToolbox** and select it from the list.
5. Take a look at the **SRGSColor.xml** file in the **StreamingAssets** folder.
    1. The SRGS design spec can be found on the W3C website [here](https://www.w3.org/TR/speech-grammar/).

In our SRGS file, we have three types of rules:

* A rule which lets you say one color from a list of twelve colors.
* Three rules which listen for a combination of the color rule and one of the three shapes.
* The root rule, colorChooser, which listens for any combination of the three "color + shape" rules. The shapes can be said in any order and in any amount from just one to all three. This is the only rule that is listened for, as it's specified as the root rule at the top of the file in the initial &lt;grammar&gt; tag.

### Build and Deploy

* Rebuild the application in Unity, then build and deploy from Visual Studio to experience the app on HoloLens.
* Dismiss the fit box with an air-tap gesture.
* Gaze at the astronaut's jetpack and perform an air-tap gesture.
* Start speaking. The **Grammar Recognizer** will interpret your speech and change the colors of the shapes based on the recognition. An example command is "blue circle, yellow square".
* Perform another air-tap gesture to dismiss the toolbox.

## The End

Congratulations! You have now completed **MR Input 212: Voice**.

* You know the Dos and Don'ts of voice commands.
* You saw how tooltips were employed to make users aware of voice commands.
* You saw several types of feedback used to acknowledge that the user's voice was heard.
* You know how to switch between the Keyword Recognizer and the Dictation Recognizer, and how these two features understand and interpret your voice.
* You learned how to use an SRGS file and the Grammar Recognizer for speech recognition in your application.
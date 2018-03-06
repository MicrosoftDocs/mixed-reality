---
title: Holograms 211
description: <meta name="description" content="Follow this coding walkthrough using Unity, Visual Studio and HoloLens to learn the details of gesture concepts." />
author: keveleigh
ms.author: kurtie
ms.date: 2/28/2018
ms.topic: article
keywords: holotoolkit, mixedrealitytoolkit, mixedrealitytoolkit-unity
---



# Holograms 211

[Gestures](gestures.md) turn user intention into action. With gestures, users can interact with holograms. In this course, we'll learn how to track the user's hands, respond to user input, and give feedback to the user based on hand state and location.

>[!VIDEO https://www.youtube.com/embed/c9zlpfFeEtc]

In [Holograms 101](holograms-101.md), we used a simple air-tap gesture to interact with our holograms. Now, we'll move beyond the air-tap gesture and explore new concepts to:
* Detect when the user's hand is being tracked and provide feedback to the user.
* Use a navigation gesture to rotate our holograms.
* Provide feedback when the user's hand is about to go out of view.
* Use manipulation events to allow users to move holograms with their hands.

In this course, we'll revisit the Unity project **Model Explorer**, which we built in [Holograms 210](holograms-210.md). Our astronaut friend is back to assist us in our exploration of these new gesture concepts.

**Prerequisites**
* A Windows 10 PC configured with the correct [tools installed](install-the-tools.md).
* Some basic C# programming ability.
* You should have completed [Holograms 101](holograms-101.md).
* You should have completed [Holograms 210](holograms-210.md).
* A HoloLens device [configured for development](using-visual-studio.md#enabling-developer-mode).

**Project files**
* Download the [files](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-211-Gesture.zip) required by the project. Requires Unity 2017.2 or later.
* If you still need Unity 5.6 support, please use [this release](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.6-211.zip).
* If you still need Unity 5.5 support, please use [this release](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.5-211.zip).
* If you still need Unity 5.4 support, please use [this release](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.4-211.zip).
* Unarchive the files to your desktop or other easy to reach location.

**Errata and Notes**
* "Enable Just My Code" needs to be disabled (*unchecked*) in Visual Studio under Tools->Options->Debugging in order to hit breakpoints in your code.

## Unity Setup

**Instructions**
* Start Unity.
* Select **Open**.
* Navigate to the **Gesture** folder you previously unarchived.
* Find and select the **Model Explorer** folder.
* Click the **Select Folder** button.
* In the **Project** panel, expand the **Scenes** folder.
* Double-click **ModelExplorer** scene to load it in Unity.
* In Unity select **File > Build Settings**.
* If **Scenes/ModelExplorer** is not listed in **Scenes In Build**, click **Add Open Scenes** to add the scene.
* Select **Windows Store** in the **Platform** list and click **Switch Platform**.
* Set **SDK** to **Universal 10** and **UWP Build Type** to **D3D**.
* Check **Unity C# Projects**.
* Click **Build**.
* Create a **New Folder** named "App".
* Single click the **App Folder**.
* Press **Select Folder** and Unity will start building the project for Visual Studio.
* When Unity is done building, a File Explorer window will appear.
* Open the **App Folder**.
* Open the **ModelExplorer Visual Studio Solution**.
* Using the drop-down options near the top, change Debug to **Release** and ARM to **x86**.
* Click the drop-down arrow on the right of 'Local Machine', and select **Remote Machine**.
* Enter your **device IP address** and set Authentication Mode to **Universal (Unencrypted Protocol)**. Click **Select**. If you do not know your device IP address, with your HoloLens look in **Settings > Network & Internet > Advanced Options** or ask Cortana **"Hey Cortana, what's my IP address?"**
* Click **Debug -> Start Without debugging** in the menu or press **Ctrl + F5**. If this is the first time deploying to your device, you will need to pair it with Visual Studio. Follow these instructions: [Pairing your HoloLens with Visual Studio](using-visual-studio.md#pairing-your-device-hololens)
* **Note,** you might notice some red errors in the Visual Studio Errors panel. It is safe to ignore them. Switch to the Output panel to view actual build progress. Errors in the Output panel will require you to make a fix (most often they are caused by a mistake in a script).

## Chapter 1 - Hand detected feedback

>[!VIDEO https://www.youtube.com/embed/D1FcIyuFTZQ]

**Objectives**
* Subscribe to hand tracking events.
* Use cursor feedback to show users when a hand is being tracked.

**Instructions**
* In the **Hierarchy** panel, select the **Managers** object.
* In the **Inspector** panel, click the **Add Component** button.
* In the menu, type in the search box **Hands Manager**. Select the search result.

The **HandsManager.cs** script performs these steps:
1. Subscribes to the InteractionSourceDetected and InteractionSourceLost events.
2. Sets the HandDetected state.
3. Unsubscribes from the SourceDetected and SourceLost events.
* In the **Hierarchy** panel, select the **Cursor** object.
* In the **Inspector** panel, click the **Add Component** button.
* In the menu, type in the search box **Cursor Feedback**. Select the search result.
* In the **Project** panel **Assets\HoloToolkit-Gesture-211\Input\Prefabs** folder, find the **HandDetectedFeedback** asset.
* Drag and drop the **HandDetectedFeedback** asset onto the **Hand Detected Asset** property in the **Cursor Feedback (Script)** component.
* In the **Hierarchy** panel, expand the **Cursor** object.
* Drag and drop **CursorBillboard** onto the **Feedback Parent** property of the **Cursor Feedback (Script)** component.

The **CursorFeedback.cs** script works like this:
1. Instantiates the HandDetectedFeedback asset.
2. Parents the HandDetectedFeedback asset to the cursor billboard object.
3. Activates/deactivates the HandDetectedFeedback asset based on the HandDetected state.

**Build and Deploy**
* In Unity, use **File > Build Settings** to rebuild the application.
* Open the **App** folder.
* If it's not already open, open the **ModelExplorer Visual Studio Solution**.
* (If you already built/deployed this project in Visual Studio during set-up, then you can open that instance of VS and click 'Reload All' when prompted).
* In Visual Studio, click **Debug -> Start Without debugging** or press **Ctrl + F5**.
* After the application deploys to the HoloLens, dismiss the fit box using the air-tap gesture.
* Move your hand into view and point your index finger to the sky to start hand tracking.
* Move your hand left, right, up and down.
* Watch how the cursor changes when your hand is detected and then lost from view.

## Chapter 2 - Navigation

>[!VIDEO https://www.youtube.com/embed/sm-kxtKksSo]

**Objectives**
* Use Navigation gesture events to rotate the astronaut.

**Instructions**

To use Navigation gestures in our app, we are going to edit four scripts to do the following:
1. The focused object will be tracked by **HandsManager.cs**.
2. Navigation events will be handled by **GestureManager.cs**.
3. Rotating objects when the Navigation gesture occurs, will be handled by **GestureAction.cs**.
4. The cursor will provide Navigation feedback to the user via **CursorStates.cs**.

Let's get started.
* Open the **HandsManager.cs** script in Visual Studio.

We track the focused Interactible object in **HandsManager.cs**. Copy the completed code below into **HandsManager.cs**, or you can code this yourself by following the marked coding exercises.




```
using UnityEngine;
using UnityEngine.XR.WSA.Input;

namespace Academy.HoloToolkit.Unity
{
    /// <summary>
    /// HandsManager keeps track of when a hand is detected.
    /// </summary>
    public class HandsManager : Singleton<HandsManager>
    {
        [Tooltip("Audio clip to play when Finger Pressed.")]
        public AudioClip FingerPressedSound;
        private AudioSource audioSource;

        /// <summary>
        /// Tracks the hand detected state.
        /// </summary>
        public bool HandDetected
        {
            get;
            private set;
        }

        // Keeps track of the GameObject that the hand is interacting with.
        public GameObject FocusedGameObject { get; private set; }

        void Awake()
        {
            EnableAudioHapticFeedback();

            InteractionManager.InteractionSourceDetected += InteractionManager_InteractionSourceDetected;
            InteractionManager.InteractionSourceLost += InteractionManager_InteractionSourceLost;

            /* TODO: DEVELOPER CODE ALONG 2.a */

            // 2.a: Register for SourceManager.SourcePressed event.
            InteractionManager.InteractionSourcePressed += InteractionManager_InteractionSourcePressed;

            // 2.a: Register for SourceManager.SourceReleased event.
            InteractionManager.InteractionSourceReleased += InteractionManager_InteractionSourceReleased;

            // 2.a: Initialize FocusedGameObject as null.
            FocusedGameObject = null;
        }

        private void EnableAudioHapticFeedback()
        {
            // If this hologram has an audio clip, add an AudioSource with this clip.
            if (FingerPressedSound != null)
            {
                audioSource = GetComponent<AudioSource>();
                if (audioSource == null)
                {
                    audioSource = gameObject.AddComponent<AudioSource>();
                }

                audioSource.clip = FingerPressedSound;
                audioSource.playOnAwake = false;
                audioSource.spatialBlend = 1;
                audioSource.dopplerLevel = 0;
            }
        }

        private void InteractionManager_InteractionSourceDetected(InteractionSourceDetectedEventArgs obj)
        {
            HandDetected = true;
        }

        private void InteractionManager_InteractionSourceLost(InteractionSourceLostEventArgs obj)
        {
            HandDetected = false;

            // 2.a: Reset FocusedGameObject.
            ResetFocusedGameObject();
        }

        private void InteractionManager_InteractionSourcePressed(InteractionSourcePressedEventArgs hand)
        {
            if (InteractibleManager.Instance.FocusedGameObject != null)
            {
                // Play a select sound if we have an audio source and are not targeting an asset with a select sound.
                if (audioSource != null && !audioSource.isPlaying &&
                    (InteractibleManager.Instance.FocusedGameObject.GetComponent<Interactible>() != null &&
                    InteractibleManager.Instance.FocusedGameObject.GetComponent<Interactible>().TargetFeedbackSound == null))
                {
                    audioSource.Play();
                }

                // 2.a: Cache InteractibleManager's FocusedGameObject in FocusedGameObject.
                FocusedGameObject = InteractibleManager.Instance.FocusedGameObject;
            }
        }

        private void InteractionManager_InteractionSourceReleased(InteractionSourceReleasedEventArgs hand)
        {
            // 2.a: Reset FocusedGameObject.
            ResetFocusedGameObject();
        }

        private void ResetFocusedGameObject()
        {
            // 2.a: Set FocusedGameObject to be null.
            FocusedGameObject = null;

            // 2.a: On GestureManager call ResetGestureRecognizers
            // to complete any currently active gestures.
            GestureManager.Instance.ResetGestureRecognizers();
        }

        void OnDestroy()
        {
            InteractionManager.InteractionSourceDetected -= InteractionManager_InteractionSourceDetected;
            InteractionManager.InteractionSourceLost -= InteractionManager_InteractionSourceLost;

            // 2.a: Unregister the SourceManager.SourceReleased event.
            InteractionManager.InteractionSourceReleased -= InteractionManager_InteractionSourceReleased;

            // 2.a: Unregister for SourceManager.SourcePressed event.
            InteractionManager.InteractionSourcePressed -= InteractionManager_InteractionSourcePressed;
        }
    }
}
```

Now let's work on rotating the astronaut whenever the user performs the Navigation gesture.
* In the **Hierarchy** panel, click on **Cursor**.
* In the **HoloToolkit\Input\Prefabs** folder, find the **ScrollFeedback** asset.
* Drag and drop the **ScrollFeedback** asset onto the **Scroll Detected Asset** property of the **Cursor Feedback (Script)** component, which is visible in the **Inspector** panel.
* In the **Hierarchy** panel, select the **AstroMan** object.
* In the **Inspector** panel, click the **Add Component** button.
* In the menu, type in the search box **Gesture Action**. Select the search result.
* In the **Hierarchy** panel, find and select the **Managers** object.
* Double-click on the **GestureManager** script to open it in Visual Studio.

We need to edit the **GestureManager.cs** file to perform these steps:
1. Instantiate the NavigationRecognizer as a new **GestureRecognizer**.
2. Use **SetRecognizableGestures** to recognize **NavigationX** and **Tap** gestures.
3. Handle NavigationStarted, NavigationUpdated, NavigationCompleted, NavigationCanceled events.

You are welcome to write code by following the comments for coding sections found in **GestureManager.cs**, or you can replace the file contents with the following code block:




```
using UnityEngine;
using UnityEngine.XR.WSA.Input;

namespace Academy.HoloToolkit.Unity
{
    public class GestureManager : Singleton<GestureManager>
    {
        // Tap and Navigation gesture recognizer.
        public GestureRecognizer NavigationRecognizer { get; private set; }

        // Manipulation gesture recognizer.
        public GestureRecognizer ManipulationRecognizer { get; private set; }

        // Currently active gesture recognizer.
        public GestureRecognizer ActiveRecognizer { get; private set; }

        public bool IsNavigating { get; private set; }

        public Vector3 NavigationPosition { get; private set; }

        public bool IsManipulating { get; private set; }

        public Vector3 ManipulationPosition { get; private set; }

        void Awake()
        {
            /* TODO: DEVELOPER CODING EXERCISE 2.b */

            // 2.b: Instantiate the NavigationRecognizer.
            NavigationRecognizer = new GestureRecognizer();

            // 2.b: Add Tap and NavigationX GestureSettings to the NavigationRecognizer's RecognizableGestures.
            NavigationRecognizer.SetRecognizableGestures(
                GestureSettings.Tap |
                GestureSettings.NavigationX);


            // 2.b: Register for the Tapped with the NavigationRecognizer_Tapped function.
            NavigationRecognizer.Tapped += NavigationRecognizer_Tapped;
            // 2.b: Register for the NavigationStarted with the NavigationRecognizer_NavigationStarted function.
            NavigationRecognizer.NavigationStarted += NavigationRecognizer_NavigationStarted;
            // 2.b: Register for the NavigationUpdated with the NavigationRecognizer_NavigationUpdated function.
            NavigationRecognizer.NavigationUpdated += NavigationRecognizer_NavigationUpdated;
            // 2.b: Register for the NavigationCompleted with the NavigationRecognizer_NavigationCompleted function. 
            NavigationRecognizer.NavigationCompleted += NavigationRecognizer_NavigationCompleted;
            // 2.b: Register for the NavigationCanceled with the NavigationRecognizer_NavigationCanceled function. 
            NavigationRecognizer.NavigationCanceled += NavigationRecognizer_NavigationCanceled;

            // Instantiate the ManipulationRecognizer.
            ManipulationRecognizer = new GestureRecognizer();

            // Add the ManipulationTranslate GestureSetting to the ManipulationRecognizer's RecognizableGestures.
            ManipulationRecognizer.SetRecognizableGestures(
                GestureSettings.ManipulationTranslate);

            // Register for the Manipulation events on the ManipulationRecognizer.
            ManipulationRecognizer.ManipulationStarted += ManipulationRecognizer_ManipulationStarted;
            ManipulationRecognizer.ManipulationUpdated += ManipulationRecognizer_ManipulationUpdated;
            ManipulationRecognizer.ManipulationCompleted += ManipulationRecognizer_ManipulationCompleted;
            ManipulationRecognizer.ManipulationCanceled += ManipulationRecognizer_ManipulationCanceled;

            ResetGestureRecognizers();
        }

        void OnDestroy()
        {
            // 2.b: Unregister the Tapped and Navigation events on the NavigationRecognizer.
            NavigationRecognizer.Tapped -= NavigationRecognizer_Tapped;

            NavigationRecognizer.NavigationStarted -= NavigationRecognizer_NavigationStarted;
            NavigationRecognizer.NavigationUpdated -= NavigationRecognizer_NavigationUpdated;
            NavigationRecognizer.NavigationCompleted -= NavigationRecognizer_NavigationCompleted;
            NavigationRecognizer.NavigationCanceled -= NavigationRecognizer_NavigationCanceled;


            // Unregister the Manipulation events on the ManipulationRecognizer.
            ManipulationRecognizer.ManipulationStarted -= ManipulationRecognizer_ManipulationStarted;
            ManipulationRecognizer.ManipulationUpdated -= ManipulationRecognizer_ManipulationUpdated;
            ManipulationRecognizer.ManipulationCompleted -= ManipulationRecognizer_ManipulationCompleted;
            ManipulationRecognizer.ManipulationCanceled -= ManipulationRecognizer_ManipulationCanceled;
        }

        /// <summary>
        /// Revert back to the default GestureRecognizer.
        /// </summary>
        public void ResetGestureRecognizers()
        {
            // Default to the navigation gestures.
            Transition(NavigationRecognizer);
        }

        /// <summary>
        /// Transition to a new GestureRecognizer.
        /// </summary>
        /// <param name="newRecognizer">The GestureRecognizer to transition to.</param>
        public void Transition(GestureRecognizer newRecognizer)
        {
            if (newRecognizer == null)
            {
                return;
            }

            if (ActiveRecognizer != null)
            {
                if (ActiveRecognizer == newRecognizer)
                {
                    return;
                }

                ActiveRecognizer.CancelGestures();
                ActiveRecognizer.StopCapturingGestures();
            }

            newRecognizer.StartCapturingGestures();
            ActiveRecognizer = newRecognizer;
        }

        private void NavigationRecognizer_NavigationStarted(NavigationStartedEventArgs obj)
        {
            // 2.b: Set IsNavigating to be true.
            IsNavigating = true;

            // 2.b: Set NavigationPosition to be Vector3.zero.
            NavigationPosition = Vector3.zero;
        }

		private void NavigationRecognizer_NavigationUpdated(NavigationUpdatedEventArgs obj)
        {
            // 2.b: Set IsNavigating to be true.
            IsNavigating = true;

            // 2.b: Set NavigationPosition to be obj.normalizedOffset.
            NavigationPosition = obj.normalizedOffset;
        }

		private void NavigationRecognizer_NavigationCompleted(NavigationCompletedEventArgs obj)
        {
            // 2.b: Set IsNavigating to be false.
            IsNavigating = false;
        }

        private void NavigationRecognizer_NavigationCanceled(NavigationCanceledEventArgs obj)
        {
            // 2.b: Set IsNavigating to be false.
            IsNavigating = false;
        }

        private void ManipulationRecognizer_ManipulationStarted(ManipulationStartedEventArgs obj)
        {
            if (HandsManager.Instance.FocusedGameObject != null)
            {
                IsManipulating = true;

                ManipulationPosition = Vector3.zero;

                HandsManager.Instance.FocusedGameObject.SendMessageUpwards("PerformManipulationStart", ManipulationPosition);
            }
        }

        private void ManipulationRecognizer_ManipulationUpdated(ManipulationUpdatedEventArgs obj)
        {
            if (HandsManager.Instance.FocusedGameObject != null)
            {
                IsManipulating = true;

                ManipulationPosition = obj.cumulativeDelta;

                HandsManager.Instance.FocusedGameObject.SendMessageUpwards("PerformManipulationUpdate", ManipulationPosition);
            }
        }

        private void ManipulationRecognizer_ManipulationCompleted(ManipulationCompletedEventArgs obj)
        {
            IsManipulating = false;
        }

        private void ManipulationRecognizer_ManipulationCanceled(ManipulationCanceledEventArgs obj)
        {
            IsManipulating = false;
        }

        private void NavigationRecognizer_Tapped(TappedEventArgs obj)
        {
            GameObject focusedObject = InteractibleManager.Instance.FocusedGameObject;

            if (focusedObject != null)
            {
                focusedObject.SendMessageUpwards("OnSelect");
            }
        }
    }
}
```

Next, open **GestureAction.cs** in Visual Studio. Edit the script to do the following:
1. **Rotate the AstroMan** object whenever a Navigation gesture is preformed.
2. Calculate the **rotationFactor** to control the amount of rotation applied to the object.
3. **Rotate the object** around the y-axis when the user moves their hand left or right.

Complete the coding exercises in the script, or replace the code with the completed solution below:




```
using Academy.HoloToolkit.Unity;
using UnityEngine;

/// <summary>
/// GestureAction performs custom actions based on 
/// which gesture is being performed.
/// </summary>
public class GestureAction : MonoBehaviour
{
    [Tooltip("Rotation max speed controls amount of rotation.")]
    public float RotationSensitivity = 10.0f;

    private Vector3 manipulationPreviousPosition;

    private float rotationFactor;

    void Update()
    {
        PerformRotation();
    }

    private void PerformRotation()
    {
        if (GestureManager.Instance.IsNavigating &&
            (!ExpandModel.Instance.IsModelExpanded ||
            (ExpandModel.Instance.IsModelExpanded && HandsManager.Instance.FocusedGameObject == gameObject)))
        {
            /* TODO: DEVELOPER CODING EXERCISE 2.c */

            // 2.c: Calculate rotationFactor based on GestureManager's NavigationPosition.X and multiply by RotationSensitivity.
            // This will help control the amount of rotation.
            rotationFactor = GestureManager.Instance.NavigationPosition.x * RotationSensitivity;

            // 2.c: transform.Rotate along the Y axis using rotationFactor.
            transform.Rotate(new Vector3(0, -1 * rotationFactor, 0));
        }
    }

    void PerformManipulationStart(Vector3 position)
    {
        manipulationPreviousPosition = position;
    }

    void PerformManipulationUpdate(Vector3 position)
    {
        if (GestureManager.Instance.IsManipulating)
        {
            /* TODO: DEVELOPER CODING EXERCISE 4.a */

            Vector3 moveVector = Vector3.zero;

            // 4.a: Calculate the moveVector as position - manipulationPreviousPosition.

            // 4.a: Update the manipulationPreviousPosition with the current position.

            // 4.a: Increment this transform's position by the moveVector.

        }
    }
}
```

**Build and Deploy**
* Rebuild the application in Unity and then build and deploy from Visual Studio to run it in the HoloLens.
* Gaze at the astronaut, two arrows should appear on either side of the cursor. This new visual indicates that the astronaut can be rotated.
* Place your hand in the ready position (index finger pointed towards the sky) so the HoloLens will start tracking your hand.
* To rotate the astronaut, lower your index finger to a pinch position, and then move your hand left or right to trigger the NavigationX gesture.

## Chapter 3 - Hand Guidance

>[!VIDEO https://www.youtube.com/embed/ULzlVw4e14I]

**Objectives**
* Use **hand guidance score** to help predict when hand tracking will be lost.
* Provide **feedback on the cursor** to show when the user's hand nears the camera's edge of view.

**Instructions**
* In the **Hierarchy** panel, select the **Managers** object.
* In the **Inspector** panel, click the **Add Component** button.
* In the menu, type in the search box **Hand Guidance**. Select the search result.
* In the **Project** panel **HoloToolkit\Input\Prefabs** folder, find the **HandGuidanceFeedback** asset.
* Drag and drop the **HandGuidanceFeedback** asset onto the **Hand Guidance Indicator** property in the **Inspector** panel.
* In the **Hierarchy** panel, expand the **Cursor** object.
* In the **Hierarchy** panel, select the **Managers** object.
* Drag & drop **CursorBillboard** from the **Hierarchy** panel onto the **Indicator Parent** property in the **Inspector**.

**Build and Deploy**
* Rebuild the application in Unity and then build and deploy from Visual Studio to experience the app on HoloLens.
* Bring your hand into view and raise your index finger to get tracked.
* Start rotating the astronaut with the Navigation gesture (pinch your index finger and thumb together).
* Move your hand far left, right, up, and down.
* As your hand nears the edge of the gesture frame, an arrow should appear next to the cursor to warn you that hand tracking will be lost. The arrow indicates which direction to move your hand in order to prevent tracking from being lost.

## Chapter 4 - Manipulation

>[!VIDEO https://www.youtube.com/embed/f3m8MvU60-I]

**Objectives**
* Use Manipulation events to move the astronaut with your hands.
* Provide feedback on the cursor to let the user know when Manipulation can be used.

**Instructions**

GestureManager.cs and AstronautManager.cs will allow us to do the following:
1. Use the speech keyword "**Move Astronaut**" to enable **Manipulation** gestures.
2. Switch to using the **Manipulation Gesture Recognizer**.
3. Manage **GestureRecognizer transitions** when switching between Navigation and Manipulation.

Let's get started.
* In the **Hierarchy** panel, select the **Managers** object.
* In the **Inspector** panel, click the **Add Component** button.
* In the menu, type in the search box **Astronaut Manager**. Select the search result.
* In the **Hierarchy** panel, click on **Cursor**.
* In the **Project** panel **Holotoolkit\Input\Prefabs** folder, find the **PathingFeedback** asset.
* Drag and drop the **PathingFeedback** asset onto the **Pathing Detected Asset** property in the **Cursor States (Script)** component in the **Inspector**.

Now we need to add code to **GestureAction.cs** to enable the following:
1. Add code to **PerformManipulationUpdate** function, which will move the astronaut when a **Manipulation** gesture is detected.
2. Calculate the **movement vector** to determine where the astronaut should be moved to based on hand position.
3. **Move** the astronaut to the new position.

Complete the coding exercise in **GestureAction.cs**, or use our completed solution below:




```
using Academy.HoloToolkit.Unity;
using UnityEngine;

/// <summary>
/// GestureAction performs custom actions based on 
/// which gesture is being performed.
/// </summary>
public class GestureAction : MonoBehaviour
{
    [Tooltip("Rotation max speed controls amount of rotation.")]
    public float RotationSensitivity = 10.0f;

    private Vector3 manipulationPreviousPosition;

    private float rotationFactor;

    void Update()
    {
        PerformRotation();
    }

    private void PerformRotation()
    {
        if (GestureManager.Instance.IsNavigating &&
            (!ExpandModel.Instance.IsModelExpanded ||
            (ExpandModel.Instance.IsModelExpanded && HandsManager.Instance.FocusedGameObject == gameObject)))
        {
            /* TODO: DEVELOPER CODING EXERCISE 2.c */

            // 2.c: Calculate rotationFactor based on GestureManager's NavigationPosition.X and multiply by RotationSensitivity.
            // This will help control the amount of rotation.
            rotationFactor = GestureManager.Instance.NavigationPosition.x * RotationSensitivity;

            // 2.c: transform.Rotate along the Y axis using rotationFactor.
            transform.Rotate(new Vector3(0, -1 * rotationFactor, 0));
        }
    }

    void PerformManipulationStart(Vector3 position)
    {
        manipulationPreviousPosition = position;
    }

    void PerformManipulationUpdate(Vector3 position)
    {
        if (GestureManager.Instance.IsManipulating)
        {
            /* TODO: DEVELOPER CODING EXERCISE 4.a */

            Vector3 moveVector = Vector3.zero;

            // 4.a: Calculate the moveVector as position - manipulationPreviousPosition.
            moveVector = position - manipulationPreviousPosition;

            // 4.a: Update the manipulationPreviousPosition with the current position.
            manipulationPreviousPosition = position;

            // 4.a: Increment this transform's position by the moveVector.
            transform.position += moveVector;
        }
    }
}
```

**Build and Deploy**
* Rebuild in Unity and then build and deploy from Visual Studio to run the app in HoloLens.
* Move your hand in front of the HoloLens and raise your index finger so that it can be tracked.
* Focus the cursor over the astronaut.
* Say 'Move Astronaut' to move the astronaut with a Manipulation gesture.
* Four arrows should appear around the cursor to indicate that the program will now respond to Manipulation events.
* Lower your index finger down to your thumb, and keep them pinched together.
* As you move your hand around, the astronaut will move too (this is Manipulation).
* Raise your index finger to stop manipulating the astronaut.
* Note: If you do not say 'Move Astronaut' before moving your hand, then the Navigation gesture will be used instead.

## Chapter 5 - Model expansion

>[!VIDEO https://www.youtube.com/embed/dA11P4P0VO8]

**Objectives**
* Expand the Astronaut model into multiple, smaller pieces that the user can interact with.
* Move each piece individually using Navigation and Manipulation gestures.

**Instructions**

In this section, we will accomplish the following tasks:
1. Add a new keyword "**Expand Model**" to expand the astronaut model.
2. Add a new Keyword "**Reset Model**" to return the model to its original form.

Complete the coding exercise in **AstronautManager.cs**, or copy and paste the finished code from below:




```
using Academy.HoloToolkit.Unity;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.Windows.Speech;

public class AstronautManager : Singleton<AstronautManager>
{
    float expandAnimationCompletionTime;
    // Store a bool for whether our astronaut model is expanded or not.
    bool isModelExpanding = false;

    // KeywordRecognizer object.
    KeywordRecognizer keywordRecognizer;

    // Defines which function to call when a keyword is recognized.
    delegate void KeywordAction(PhraseRecognizedEventArgs args);
    Dictionary<string, KeywordAction> keywordCollection;

    void Start()
    {
        keywordCollection = new Dictionary<string, KeywordAction>();

        // Add keyword to start manipulation.
        keywordCollection.Add("Move Astronaut", MoveAstronautCommand);

        // Add keyword Expand Model to call the ExpandModelCommand function.
        keywordCollection.Add("Expand Model", ExpandModelCommand);

        // Add keyword Reset Model to call the ResetModelCommand function.
        keywordCollection.Add("Reset Model", ResetModelCommand);

        // Initialize KeywordRecognizer with the previously added keywords.
        keywordRecognizer = new KeywordRecognizer(keywordCollection.Keys.ToArray());
        keywordRecognizer.OnPhraseRecognized += KeywordRecognizer_OnPhraseRecognized;
        keywordRecognizer.Start();
    }

    private void KeywordRecognizer_OnPhraseRecognized(PhraseRecognizedEventArgs args)
    {
        KeywordAction keywordAction;

        if (keywordCollection.TryGetValue(args.text, out keywordAction))
        {
            keywordAction.Invoke(args);
        }
    }

    private void MoveAstronautCommand(PhraseRecognizedEventArgs args)
    {
        GestureManager.Instance.Transition(GestureManager.Instance.ManipulationRecognizer);
    }

    private void ResetModelCommand(PhraseRecognizedEventArgs args)
    {
        // Reset local variables.
        isModelExpanding = false;

        // Disable the expanded model.
        ExpandModel.Instance.ExpandedModel.SetActive(false);

        // Enable the idle model.
        ExpandModel.Instance.gameObject.SetActive(true);

        // Enable the animators for the next time the model is expanded.
        Animator[] expandedAnimators = ExpandModel.Instance.ExpandedModel.GetComponentsInChildren<Animator>();
        foreach (Animator animator in expandedAnimators)
        {
            animator.enabled = true;
        }

        ExpandModel.Instance.Reset();
    }

    private void ExpandModelCommand(PhraseRecognizedEventArgs args)
    {
        // Swap out the current model for the expanded model.
        GameObject currentModel = ExpandModel.Instance.gameObject;

        ExpandModel.Instance.ExpandedModel.transform.position = currentModel.transform.position;
        ExpandModel.Instance.ExpandedModel.transform.rotation = currentModel.transform.rotation;
        ExpandModel.Instance.ExpandedModel.transform.localScale = currentModel.transform.localScale;

        currentModel.SetActive(false);
        ExpandModel.Instance.ExpandedModel.SetActive(true);

        // Play animation.  Ensure the Loop Time check box is disabled in the inspector for this animation to play it once.
        Animator[] expandedAnimators = ExpandModel.Instance.ExpandedModel.GetComponentsInChildren<Animator>();
        // Set local variables for disabling the animation.
        if (expandedAnimators.Length > 0)
        {
            expandAnimationCompletionTime = Time.realtimeSinceStartup + expandedAnimators[0].runtimeAnimatorController.animationClips[0].length * 0.9f;
        }

        // Set the expand model flag.
        isModelExpanding = true;

        ExpandModel.Instance.Expand();
    }

    public void Update()
    {
        if (isModelExpanding && Time.realtimeSinceStartup >= expandAnimationCompletionTime)
        {
            isModelExpanding = false;

            Animator[] expandedAnimators = ExpandModel.Instance.ExpandedModel.GetComponentsInChildren<Animator>();

            foreach (Animator animator in expandedAnimators)
            {
                animator.enabled = false;
            }
        }
    }
}
```

**Build and Deploy**
* Try it! Build and deploy the app to the HoloLens.
* Say **Expand Model** to see the expanded astronaut model.
* Use **Navigation** to rotate individual pieces of the astronaut suit.
* Say **Move Astronaut** and then use **Manipulation** to move individual pieces of the astronaut suit.
* Say **Reset Model** to return the astronaut to its original form.

## The End

Congratulations! You have now completed **Holograms 211 - Gesture**.
* You know how to detect and respond to hand tracking, navigation and manipulation events.
* You understand the difference between Navigation and Manipulation gestures.
* You know how to change the cursor to provide visual feedback for when a hand is detected, when a hand is about to be lost, and for when an object supports different interactions (Navigation vs Manipulation).
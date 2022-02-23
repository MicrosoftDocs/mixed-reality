---
title: HoloLens (1st gen) Basics 101 - Complete project with device
description: Follow this coding walkthrough using Unity, Visual Studio and HoloLens to learn the basics of Windows Mixed Reality.
author: keveleigh
ms.author: kurtie
ms.date: 10/22/2019
ms.topic: article
keywords: mixed reality, Windows Mixed Reality, HoloLens, hologram, academy, tutorial, HoloLens, Mixed Reality Academy, unity, mixed reality headset, windows mixed reality headset, virtual reality headset, Windows 10
---

# HoloLens (1st gen) Basics 101: Complete project with device

<br>

>[!IMPORTANT]
>The Mixed Reality Academy tutorials were designed with HoloLens (1st gen), Unity 2017, and Mixed Reality Immersive Headsets in mind.  As such, we feel it is important to leave these tutorials in place for developers who are still looking for guidance in developing for those devices. These tutorials will **_not_** be updated with the latest toolsets or interactions being used for HoloLens 2 and may not be compatible with newer versions of Unity.  They will be maintained to continue working on the supported devices. [A new series of tutorials](mrlearning-base.md) has been posted for HoloLens 2.

<br>

>[!VIDEO https://www.youtube.com/embed/XKIIEC5BMWg]

This tutorial will walk you through a complete project, built in Unity, that demonstrates core Windows Mixed Reality features on HoloLens including [gaze](../../../design/gaze-and-commit.md), [gestures](../../../design/gaze-and-commit.md#composite-gestures), [voice input](../../../design/voice-input.md), [spatial sound](../../../design/spatial-sound.md) and [spatial mapping](../../../design/spatial-mapping.md).

The tutorial will take approximately 1 hour to complete.

## Device support

<table>
<tr>
<th>Course</th><th style="width:150px"> <a href="/hololens/hololens1-hardware">HoloLens</a></th><th style="width:150px"> <a href="/windows/mixed-reality/enthusiast-guide/immersive-headset-hardware-details">Immersive headsets</a></th>
</tr><tr>
<td>MR Basics 101: Complete project with device</td><td style="text-align: center;"> ✔️</td><td style="text-align: center;"> </td>
</tr>
</table>

## Before you start

### Prerequisites

* A Windows 10 PC configured with the correct [tools installed](../../install-the-tools.md).
* A HoloLens device [configured for development](../../advanced-concepts/using-visual-studio.md#enabling-developer-mode).

### Project files

* Download the [files](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-101.zip) required by the project. Requires Unity 2017.2 or later.
  * If you still need Unity 5.6 support, please use [this release](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.6-101.zip).
  * If you still need Unity 5.5 support, please use [this release](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.5-101.zip).
  * If you still need Unity 5.4 support, please use [this release](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.4-101.zip).
* Un-archive the files to your desktop or other easy to reach location. Keep the folder name as **Origami**.

>[!NOTE]
>If you want to look through the source code before downloading, it's [available on GitHub](https://github.com/Microsoft/HolographicAcademy/tree/Holograms-101).

## Chapter 1 - "Holo" world

>[!VIDEO https://www.youtube.com/embed/PmtZGjYFroY]

In this chapter, we'll setup our first Unity project and step through the build and deploy process.

### Objectives

* Set up Unity for holographic development.
* Make a hologram.
* See a hologram that you made.

### Instructions

* Start Unity.
* Select **Open**.
* Enter location as the **Origami** folder you previously un-archived.
* Select **Origami** and click **Select Folder**.
* Since the **Origami** project does not contain a scene, save the empty default scene to a new file using: **File** / **Save Scene As**.
* Name the new scene **Origami** and press the **Save** button.

#### Setup the main virtual camera

* In the **Hierarchy Panel**, select **Main Camera**.
* In the **Inspector** set its transform position to **0,0,0**.
* Find the **Clear Flags** property, and change the dropdown from **Skybox** to **Solid color**.
* Click on the **Background** field to open a color picker.
* Set **R, G, B, and A** to **0**.

#### Setup the scene

* In the **Hierarchy Panel**, click on **Create** and **Create Empty**.
* Right-click the new **GameObject** and select Rename. Rename the GameObject to **OrigamiCollection**.
* From the **Holograms** folder in the Project Panel (expand Assets and select Holograms or double click the Holograms folder in the Project Panel):
  * Drag **Stage** into the Hierarchy to be a child of **OrigamiCollection**.
  * Drag **Sphere1** into the Hierarchy to be a child of **OrigamiCollection**.
  * Drag **Sphere2** into the Hierarchy to be a child of **OrigamiCollection**.
* Right-click the **Directional Light** object in the **Hierarchy Panel** and select **Delete**.
* From the **Holograms** folder, drag **Lights** into the root of the **Hierarchy Panel**.
* In the **Hierarchy**, select the **OrigamiCollection**.
* In the **Inspector**, set the transform position to **0, -0.5, 2.0**.
* Press the **Play** button in Unity to preview your holograms.
* You should see the Origami objects in the preview window.
* Press **Play** a second time to stop preview mode.

#### Export the project from Unity to Visual Studio

* In Unity select **File > Build Settings**.
* Select **Universal Windows Platform** in the **Platform** list and click **Switch Platform**.
* Set **SDK** to **Universal 10** and **Build Type** to **D3D**.
* Check **Unity C# Projects**.
* Click **Add Open Scenes** to add the scene.
* Click **Build**.
* In the file explorer window that appears, create a **New Folder** named "App".
* Single click the **App Folder**.
* Press **Select Folder**.
* When Unity is done, a File Explorer window will appear.
* Open the **App** folder.
* Open (double click) **Origami.sln**.
* Using the top toolbar in Visual Studio, change the target from Debug to **Release** and from ARM to **X86**.
* Click on the arrow next to the Device button, and select **Remote Machine** to deploy over Wi-Fi.
  * Set the **Address** to the name or IP address of your HoloLens. If you do not know your device IP address, look in **Settings > Network & Internet > Advanced Options** or ask Cortana **"Hey Cortana, What's my IP address?"**
  * If the HoloLens is attached over USB, you may instead select **Device** to deploy over USB.
  * Leave the **Authentication Mode** set to **Universal**.
  * Click **Select**

* Click **Debug > Start Without debugging** or press **Ctrl + F5**. If this is the first time deploying to your device, you will need to [pair it with Visual Studio](../../advanced-concepts/using-visual-studio.md#pairing-your-device).

* The Origami project will now build, deploy to your HoloLens, and then run.
* Put on your HoloLens and look around to see your new holograms.

## Chapter 2 - Gaze

>[!VIDEO https://www.youtube.com/embed/MSO2BoFSQbM]

In this chapter, we are going to introduce the first of three ways of interacting with your holograms -- [gaze](../../../design/gaze-and-commit.md).

### Objectives

* Visualize your gaze using a world-locked cursor.

### Instructions

* Go back to your Unity project, and close the Build Settings window if it's still open.
* Select the **Holograms** folder in the **Project panel**.
* Drag the **Cursor** object into the **Hierarchy panel** at the root level.
* Double-click on the **Cursor** object to take a closer look at it.
* Right-click on the **Scripts** folder in the Project panel.
* Click the **Create** sub-menu.
* Select **C# Script**.
* Name the script **WorldCursor**. Note: The name is case-sensitive. You do not need to add the .cs extension.
* Select the **Cursor** object in the **Hierarchy panel**.
* Drag and drop the **WorldCursor** script into the **Inspector panel**.
* Double-click the **WorldCursor** script to open it in Visual Studio.
* Copy and paste this code into **WorldCursor.cs** and **Save All**.

```cs
using UnityEngine;

public class WorldCursor : MonoBehaviour
{
    private MeshRenderer meshRenderer;

    // Use this for initialization
    void Start()
    {
        // Grab the mesh renderer that's on the same object as this script.
        meshRenderer = this.gameObject.GetComponentInChildren<MeshRenderer>();
    }

    // Update is called once per frame
    void Update()
    {
        // Do a raycast into the world based on the user's
        // head position and orientation.
        var headPosition = Camera.main.transform.position;
        var gazeDirection = Camera.main.transform.forward;

        RaycastHit hitInfo;

        if (Physics.Raycast(headPosition, gazeDirection, out hitInfo))
        {
            // If the raycast hit a hologram...
            // Display the cursor mesh.
            meshRenderer.enabled = true;

            // Move the cursor to the point where the raycast hit.
            this.transform.position = hitInfo.point;

            // Rotate the cursor to hug the surface of the hologram.
            this.transform.rotation = Quaternion.FromToRotation(Vector3.up, hitInfo.normal);
        }
        else
        {
            // If the raycast did not hit a hologram, hide the cursor mesh.
            meshRenderer.enabled = false;
        }
    }
}
```

* Rebuild the app from **File > Build Settings**.
* Return to the Visual Studio solution previously used to deploy to your HoloLens.
* Select 'Reload All' when prompted.
* Click **Debug -> Start Without debugging** or press **Ctrl + F5**.
* Now look around the scene and notice how the cursor interacts with the shape of objects.

## Chapter 3 - Gestures

>[!VIDEO https://www.youtube.com/embed/kW3ThJ2MbvQ]

In this chapter, we'll add support for [gestures](../../../design/gaze-and-commit.md#composite-gestures). When the user selects a paper sphere, we'll make the sphere fall by turning on gravity using Unity's physics engine.

### Objectives

* Control your holograms with the Select gesture.

### Instructions

We'll start by creating a script then can detect the Select gesture.

* In the **Scripts** folder, create a script named **GazeGestureManager**.
* Drag the **GazeGestureManager** script onto the **OrigamiCollection** object in the Hierarchy.
* Open the **GazeGestureManager** script in Visual Studio and add the following code:

```cs
using UnityEngine;
using UnityEngine.XR.WSA.Input;

public class GazeGestureManager : MonoBehaviour
{
    public static GazeGestureManager Instance { get; private set; }

    // Represents the hologram that is currently being gazed at.
    public GameObject FocusedObject { get; private set; }

    GestureRecognizer recognizer;

    // Use this for initialization
    void Awake()
    {
        Instance = this;

        // Set up a GestureRecognizer to detect Select gestures.
        recognizer = new GestureRecognizer();
        recognizer.Tapped += (args) =>
        {
            // Send an OnSelect message to the focused object and its ancestors.
            if (FocusedObject != null)
            {
                FocusedObject.SendMessageUpwards("OnSelect", SendMessageOptions.DontRequireReceiver);
            }
        };
        recognizer.StartCapturingGestures();
    }

    // Update is called once per frame
    void Update()
    {
        // Figure out which hologram is focused this frame.
        GameObject oldFocusObject = FocusedObject;

        // Do a raycast into the world based on the user's
        // head position and orientation.
        var headPosition = Camera.main.transform.position;
        var gazeDirection = Camera.main.transform.forward;

        RaycastHit hitInfo;
        if (Physics.Raycast(headPosition, gazeDirection, out hitInfo))
        {
            // If the raycast hit a hologram, use that as the focused object.
            FocusedObject = hitInfo.collider.gameObject;
        }
        else
        {
            // If the raycast did not hit a hologram, clear the focused object.
            FocusedObject = null;
        }

        // If the focused object changed this frame,
        // start detecting fresh gestures again.
        if (FocusedObject != oldFocusObject)
        {
            recognizer.CancelGestures();
            recognizer.StartCapturingGestures();
        }
    }
}
```

* Create another script in the Scripts folder, this time named **SphereCommands**.
* Expand the **OrigamiCollection** object in the Hierarchy view.
* Drag the **SphereCommands** script onto the **Sphere1** object in the Hierarchy panel.
* Drag the **SphereCommands** script onto the **Sphere2** object in the Hierarchy panel.
* Open the script in Visual Studio for editing, and replace the default code with this:

```cs
using UnityEngine;

public class SphereCommands : MonoBehaviour
{
    // Called by GazeGestureManager when the user performs a Select gesture
    void OnSelect()
    {
        // If the sphere has no Rigidbody component, add one to enable physics.
        if (!this.GetComponent<Rigidbody>())
        {
            var rigidbody = this.gameObject.AddComponent<Rigidbody>();
            rigidbody.collisionDetectionMode = CollisionDetectionMode.Continuous;
        }
    }
}
```

* Export, build and deploy the app to your HoloLens.
* Look at one of the spheres.
* Perform the select gesture and watch the sphere drop onto the surface below.

## Chapter 4 - Voice

>[!VIDEO https://www.youtube.com/embed/1-Aq0VVtHM8]

In this chapter, we'll add support for two [voice commands](../../../design/voice-input.md): "Reset world" to return the dropped spheres to their original location, and "Drop sphere" to make the sphere fall.

### Objectives

* Add voice commands that always listen in the background.
* Create a hologram that reacts to a voice command.

### Instructions

* In the **Scripts** folder, create a script named **SpeechManager**.
* Drag the **SpeechManager** script onto the **OrigamiCollection** object in the Hierarchy
* Open the **SpeechManager** script in Visual Studio.
* Copy and paste this code into **SpeechManager.cs** and **Save All**:

```cs
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.Windows.Speech;

public class SpeechManager : MonoBehaviour
{
    KeywordRecognizer keywordRecognizer = null;
    Dictionary<string, System.Action> keywords = new Dictionary<string, System.Action>();

    // Use this for initialization
    void Start()
    {
        keywords.Add("Reset world", () =>
        {
            // Call the OnReset method on every descendant object.
            this.BroadcastMessage("OnReset");
        });

        keywords.Add("Drop Sphere", () =>
        {
            var focusObject = GazeGestureManager.Instance.FocusedObject;
            if (focusObject != null)
            {
                // Call the OnDrop method on just the focused object.
                focusObject.SendMessage("OnDrop", SendMessageOptions.DontRequireReceiver);
            }
        });

        // Tell the KeywordRecognizer about our keywords.
        keywordRecognizer = new KeywordRecognizer(keywords.Keys.ToArray());

        // Register a callback for the KeywordRecognizer and start recognizing!
        keywordRecognizer.OnPhraseRecognized += KeywordRecognizer_OnPhraseRecognized;
        keywordRecognizer.Start();
    }

    private void KeywordRecognizer_OnPhraseRecognized(PhraseRecognizedEventArgs args)
    {
        System.Action keywordAction;
        if (keywords.TryGetValue(args.text, out keywordAction))
        {
            keywordAction.Invoke();
        }
    }
}
```

* Open the **SphereCommands** script in Visual Studio.
* Update the script to read as follows:

```cs
using UnityEngine;

public class SphereCommands : MonoBehaviour
{
    Vector3 originalPosition;

    // Use this for initialization
    void Start()
    {
        // Grab the original local position of the sphere when the app starts.
        originalPosition = this.transform.localPosition;
    }

    // Called by GazeGestureManager when the user performs a Select gesture
    void OnSelect()
    {
        // If the sphere has no Rigidbody component, add one to enable physics.
        if (!this.GetComponent<Rigidbody>())
        {
            var rigidbody = this.gameObject.AddComponent<Rigidbody>();
            rigidbody.collisionDetectionMode = CollisionDetectionMode.Continuous;
        }
    }

    // Called by SpeechManager when the user says the "Reset world" command
    void OnReset()
    {
        // If the sphere has a Rigidbody component, remove it to disable physics.
        var rigidbody = this.GetComponent<Rigidbody>();
        if (rigidbody != null)
        {
            rigidbody.isKinematic = true;
            Destroy(rigidbody);
        }

        // Put the sphere back into its original local position.
        this.transform.localPosition = originalPosition;
    }

    // Called by SpeechManager when the user says the "Drop sphere" command
    void OnDrop()
    {
        // Just do the same logic as a Select gesture.
        OnSelect();
    }
}
```

* Export, build and deploy the app to your HoloLens.
* Look at one of the spheres, and say "**Drop Sphere**".
* Say "**Reset World**" to bring them back to their initial positions.

## Chapter 5 - Spatial sound

>[!VIDEO https://www.youtube.com/embed/Aj4de5Ncbfo]

In this chapter, we'll add music to the app, and then trigger sound effects on certain actions. We'll be using [spatial sound](../../../design/spatial-sound.md) to give sounds a specific location in 3D space.

### Objectives

* Hear holograms in your world.

### Instructions

* In Unity select from the top menu **Edit > Project Settings > Audio**
* In the Inspector Panel on the right side, find the **Spatializer Plugin** setting and select **MS HRTF Spatializer**.
* From the **Holograms** folder in the Project panel, drag the **Ambience** object onto the **OrigamiCollection** object in the Hierarchy Panel.
* Select **OrigamiCollection** and find the **Audio Source** component in the Inspector panel. Change these properties:
  * Check the **Spatialize** property.
  * Check the **Play On Awake**.
  * Change **Spatial Blend** to **3D** by dragging the slider all the way to the right. The value should change from 0 to 1 when you move the slider.
  * Check the **Loop** property.
  * Expand **3D Sound Settings**, and enter **0.1** for **Doppler Level**.
  * Set **Volume Rolloff** to **Logarithmic Rolloff**.
  * Set **Max Distance** to **20**.
* In the **Scripts** folder, create a script named **SphereSounds**.
* Drag and drop **SphereSounds** to the **Sphere1** and **Sphere2** objects in the Hierarchy.
* Open **SphereSounds** in Visual Studio, update the following code and **Save All**.

```cs
using UnityEngine;

public class SphereSounds : MonoBehaviour
{
    AudioSource impactAudioSource = null;
    AudioSource rollingAudioSource = null;

    bool rolling = false;

    void Start()
    {
        // Add an AudioSource component and set up some defaults
        impactAudioSource = gameObject.AddComponent<AudioSource>();
        impactAudioSource.playOnAwake = false;
        impactAudioSource.spatialize = true;
        impactAudioSource.spatialBlend = 1.0f;
        impactAudioSource.dopplerLevel = 0.0f;
        impactAudioSource.rolloffMode = AudioRolloffMode.Logarithmic;
        impactAudioSource.maxDistance = 20f;

        rollingAudioSource = gameObject.AddComponent<AudioSource>();
        rollingAudioSource.playOnAwake = false;
        rollingAudioSource.spatialize = true;
        rollingAudioSource.spatialBlend = 1.0f;
        rollingAudioSource.dopplerLevel = 0.0f;
        rollingAudioSource.rolloffMode = AudioRolloffMode.Logarithmic;
        rollingAudioSource.maxDistance = 20f;
        rollingAudioSource.loop = true;

        // Load the Sphere sounds from the Resources folder
        impactAudioSource.clip = Resources.Load<AudioClip>("Impact");
        rollingAudioSource.clip = Resources.Load<AudioClip>("Rolling");
    }

    // Occurs when this object starts colliding with another object
    void OnCollisionEnter(Collision collision)
    {
        // Play an impact sound if the sphere impacts strongly enough.
        if (collision.relativeVelocity.magnitude >= 0.1f)
        {
            impactAudioSource.Play();
        }
    }

    // Occurs each frame that this object continues to collide with another object
    void OnCollisionStay(Collision collision)
    {
        Rigidbody rigid = gameObject.GetComponent<Rigidbody>();

        // Play a rolling sound if the sphere is rolling fast enough.
        if (!rolling && rigid.velocity.magnitude >= 0.01f)
        {
            rolling = true;
            rollingAudioSource.Play();
        }
        // Stop the rolling sound if rolling slows down.
        else if (rolling && rigid.velocity.magnitude < 0.01f)
        {
            rolling = false;
            rollingAudioSource.Stop();
        }
    }

    // Occurs when this object stops colliding with another object
    void OnCollisionExit(Collision collision)
    {
        // Stop the rolling sound if the object falls off and stops colliding.
        if (rolling)
        {
            rolling = false;
            impactAudioSource.Stop();
            rollingAudioSource.Stop();
        }
    }
}
```

* Save the script, and return to Unity.
* Export, build and deploy the app to your HoloLens.
* Move closer and further from the Stage and turn side-to-side to hear the sounds change.

## Chapter 6 - Spatial mapping

>[!VIDEO https://www.youtube.com/embed/Pkt1_wNLLXY]

Now we are going to use [spatial mapping](../../../design/spatial-mapping.md) to place the game board on a real object in the real world.

### Objectives

* Bring your real world into the virtual world.
* Place your holograms where they matter most to you.

### Instructions

* In Unity, click on the **Holograms** folder in the Project panel.
* Drag the **Spatial Mapping** asset into the root of the **Hierarchy**.
* Click on the **Spatial Mapping** object in the Hierarchy.
* In the **Inspector panel**, change the following properties:
  * Check the **Draw Visual Meshes** box.
  * Locate **Draw Material** and click the circle on the right. Type "**wireframe**" into the search field at the top. Click on the result and then close the window. When you do this, the value for Draw Material should get set to Wireframe.
* Export, build and deploy the app to your HoloLens.
* When the app runs, a wireframe mesh will overlay your real world.
* Watch how a rolling sphere will fall off the stage, and onto the floor!

Now we'll show you how to move the OrigamiCollection to a new location:

* In the **Scripts** folder, create a script named **TapToPlaceParent**.
* In the **Hierarchy**, expand the **OrigamiCollection** and select the **Stage** object.
* Drag the **TapToPlaceParent** script onto the Stage object.
* Open the **TapToPlaceParent** script in Visual Studio, and update it to be the following:

```cs
using UnityEngine;

public class TapToPlaceParent : MonoBehaviour
{
    bool placing = false;

    // Called by GazeGestureManager when the user performs a Select gesture
    void OnSelect()
    {
        // On each Select gesture, toggle whether the user is in placing mode.
        placing = !placing;

        // If the user is in placing mode, display the spatial mapping mesh.
        if (placing)
        {
            SpatialMapping.Instance.DrawVisualMeshes = true;
        }
        // If the user is not in placing mode, hide the spatial mapping mesh.
        else
        {
            SpatialMapping.Instance.DrawVisualMeshes = false;
        }
    }

    // Update is called once per frame
    void Update()
    {
        // If the user is in placing mode,
        // update the placement to match the user's gaze.

        if (placing)
        {
            // Do a raycast into the world that will only hit the Spatial Mapping mesh.
            var headPosition = Camera.main.transform.position;
            var gazeDirection = Camera.main.transform.forward;

            RaycastHit hitInfo;
            if (Physics.Raycast(headPosition, gazeDirection, out hitInfo,
                30.0f, SpatialMapping.PhysicsRaycastMask))
            {
                // Move this object's parent object to
                // where the raycast hit the Spatial Mapping mesh.
                this.transform.parent.position = hitInfo.point;

                // Rotate this object's parent object to face the user.
                Quaternion toQuat = Camera.main.transform.localRotation;
                toQuat.x = 0;
                toQuat.z = 0;
                this.transform.parent.rotation = toQuat;
            }
        }
    }
}
```

* Export, build and deploy the app.
* Now you should now be able to place the game in a specific location by gazing at it, using the Select gesture and then moving to a new location, and using the Select gesture again.

## Chapter 7 - Holographic fun

### Objectives

* Reveal the entrance to a holographic underworld.

### Instructions

Now we'll show you how to uncover the holographic underworld:

* From the **Holograms** folder in the Project Panel:
  * Drag **Underworld** into the Hierarchy to be a child of **OrigamiCollection**.
* In the **Scripts** folder, create a script named **HitTarget**.
* In the **Hierarchy**, expand the **OrigamiCollection**.
* Expand the **Stage** object and select the **Target** object (blue fan).
* Drag the **HitTarget** script onto the **Target** object.
* Open the **HitTarget** script in Visual Studio, and update it to be the following:

```cs
using UnityEngine;

public class HitTarget : MonoBehaviour
{
    // These public fields become settable properties in the Unity editor.
    public GameObject underworld;
    public GameObject objectToHide;

    // Occurs when this object starts colliding with another object
    void OnCollisionEnter(Collision collision)
    {
        // Hide the stage and show the underworld.
        objectToHide.SetActive(false);
        underworld.SetActive(true);

        // Disable Spatial Mapping to let the spheres enter the underworld.
        SpatialMapping.Instance.MappingEnabled = false;
    }
}
```

* In Unity, select the **Target** object.
* Two public properties are now visible on the **Hit Target** component and need to reference objects in our scene:
  * Drag **Underworld** from the **Hierarchy** panel to the **Underworld** property on the **Hit Target** component.
  * Drag **Stage** from the **Hierarchy** panel to the **Object to Hide** property on the **Hit Target** component.
* Export, build and deploy the app.
* Place the Origami Collection on the floor, and then use the Select gesture to make a sphere drop.
* When the sphere hits the target (blue fan), an explosion will occur. The collection will be hidden and a hole to the underworld will appear.

## The end

And that's the end of this tutorial!

You learned:

* How to create a holographic app in Unity.
* How to make use of gaze, gesture, voice, sound, and spatial mapping.
* How to build and deploy an app using Visual Studio.

You are now ready to start creating your own holographic experience!

## See also

* [MR Basics 101E: Complete project with emulator](holograms-101e.md)
* [Gaze](../../../design/gaze-and-commit.md)
* [Head-gaze and commit](../../../design/gaze-and-commit.md)
* [Voice input](../../../design/voice-input.md)
* [Spatial sound](../../../design/spatial-sound.md)
* [Spatial mapping](../../../design/spatial-mapping.md)
=======
title: Holograms 210
description: <meta name="description" content="Follow this coding walkthrough using Unity, Visual Studio and HoloLens to learn the details of gaze concepts." />
author: keveleigh
ms.author: kurtie
ms.date: 2/28/2018
ms.topic: article
keywords: holotoolkit, mixedrealitytoolkit, mixedrealitytoolkit-unity
---



# Holograms 210

[Gaze](gaze.md) is the first form of input and reveals the user's intent and awareness. Holograms 210 (aka Project Explorer) is a deep dive into gaze-related concepts for Windows Mixed Reality. We will be adding contextual awareness to our cursor and holograms, taking full advantage of what your app knows about the user's gaze.

>[!VIDEO https://www.youtube.com/embed/yKAttGduVp0]\


We have a friendly astronaut here to help you learn gaze concepts. In [Holograms 101](holograms-101.md), we had a simple cursor that just followed your gaze. Today we're moving a step beyond the simple cursor:
* We're making the cursor and our holograms gaze-aware: both will change based on where the user is looking - or where the user is *not* looking. This makes them context-aware.
* We will add feedback to our cursor and holograms to give the user more context on what is being targeted. This feedback can be audio and visual.
* We'll show you targeting techniques to help users hit smaller targets.
* We'll show you how to draw the user's attention to your holograms with a directional indicator.
* We'll teach you techniques to take your holograms with the user as she moves around in your world.

**Prerequisites**
* A Windows 10 PC configured with the correct [tools installed](install-the-tools.md).
* Some basic C# programming ability.
* You should have completed [Holograms 101](holograms-101.md).
* A HoloLens device [configured for development](using-visual-studio.md#enabling-developer-mode).

**Project files**
* Download the [files](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-210-Gaze.zip) required by the project. Requires Unity 2017.2 or later.
* If you still need Unity 5.6 support, please use [this release](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.6-210.zip).
* If you still need Unity 5.5 support, please use [this release](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.5-210.zip).
* If you still need Unity 5.4 support, please use [this release](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.4-210.zip).
* Unarchive the files to your desktop or other easy to reach location.

**Errata and Notes**
* In Visual Studio, "Just My Code" needs to be disabled (unchecked) under Tools->Options->Debugging in order to hit breakpoints in your code.

## Chapter 1 - Unity Setup

>[!VIDEO https://www.youtube.com/embed/_Ccn6riQ6vU]

**Objectives**
* Optimize Unity for HoloLens development.
* Import assets and setup the scene.
* View the astronaut in the HoloLens.

**Instructions**
* Start Unity.
* Select **New Project**.
* Name the project **ModelExplorer**.
* Enter location as the **Gaze** folder you previously unarchived.
* Make sure the project is set to **3D**.
* Click **Create Project**.

### Unity settings for HoloLens

We need to let Unity know that the app we are trying to export should create an [immersive view](app-views.md) instead of a 2D view. We do that by adding HoloLens as a virtual reality device.
* Go to **Edit > Project Settings > Player**.
* In the **Inspector Panel** for Player Settings, select the **Windows Store** icon.
* Expand the **XR Settings** group.
* In the **Rendering** section, check the **Virtual Reality Supported** checkbox to add a new **Virtual Reality SDKs** list.
* Verify that **Windows Mixed Reality** appears in the list. If not, select the **+** button at the bottom of the list and choose **Windows Holographic**.
* Go to **Edit > Project Settings > Quality**.
* Click on downward pointing arrow in the **Default** row under the Windows Store icon.
* Select **Very Low** for **Windows Store Apps**.

### Import art assets
* Right click the **Assets** folder in the **Project** panel.
* Click on **Import Package > Custom Package**.
* Navigate to the project files you downloaded and click on **ModelExplorer.unitypackage**.
* Click **Open**.
* After the package loads, click on the **Import** button.

### Setup the scene
* In the Hierarchy, delete the **Main Camera**.
* In the **HoloToolkit** folder, open the **Utilities** folder, then open the **Prefabs** folder.
* Drag and drop the **Main Camera** from the **Prefabs** folder into the **Hierarchy**.
* Right-click the **Directional Light** in the Hierarchy and select **Delete**.
* In the **Holograms** folder, drag and drop the following assets into the root of the **Hierarchy**:
* **AstroMan**
* **Lights**
* **SpaceAudioSource**
* **SpaceBackground**
* Start **Play Mode** to view the astronaut.
* Click **Play Mode** again to **Stop**.
* In the **Holograms** folder, find the **Fitbox** asset and drag it to the root of the **Hierarchy**.
* Select the **Fitbox** in the **Hierarchy** panel.
* Drag the **AstroMan** collection to the **Hologram Collection** property of the Fitbox in the **Inspector** panel.

### Build the project
* Save the new scene: **File > Save Scene As**.
* Click **New Folder** and name the folder **Scenes**.
* Name the file “**ModelExplorer**” and save it in the **Scenes** folder.
* In Unity select **File > Build Settings**.
* Click **Add Open Scenes** to add the scene.
* Select **Windows Store** in the **Platform** list and click **Switch Platform**.
* Set **SDK** to **Universal 10** and **Build Type** to **D3D**.
* Check **Unity C# Projects**.
* Click **Build**.
* Create a **New Folder** named "App".
* Single click the **App Folder**.
* Press **Select Folder**.
* When Unity is done, a File Explorer window will appear.
* Open the **App Folder**.
* Open the **ModelExplorer Visual Studio Solution**.
* In Visual Studio, right click on **Package.appxmanifest** in the Solution Explorer and select **View Code**
* Find the line specifying **TargetDeviceFamily** and change **Name="Windows.Universal"** to **Name="Windows.Holographic"**.
* **Save** the Package.appxmanifest.
* Using the top toolbar in Visual Studio, change the target from Debug to **Release** and from ARM to **x86**.
* Click on the drop down arrow next to the Device button, and select **Remote Machine**.
* Enter **your device IP address** and set Authentication Mode to **Universal (Unencrypted Protocol)**. Click **Select**. If you do not know your device IP address, look in **Settings > Network & Internet > Advanced Options**.
* In the top menu bar, click **Debug -> Start Without debugging** or press **Ctrl + F5**. If this is the first time deploying to your device, you will need to [pair it with Visual Studio](using-visual-studio.md#pairing-your-device-hololens).
* When the app has deployed, dismiss the **Fitbox** with a **select gesture**.

## Chapter 2 - Cursor and target feedback

>[!VIDEO https://www.youtube.com/embed/S24u0V_T7ZI]

**Objectives**
* Cursor visual design and behavior.
* Gaze-based cursor feedback.
* Gaze-based hologram feedback.

We're going to base our work on some cursor design principles, namely:
1. The cursor is always present.
2. Don't let the cursor get too small or big.
3. Avoid obstructing content.

**Instructions**
* Click the **Create menu** on top of the **Hierarchy** panel.
* Select **Create Empty**.
* Right-click the new **GameObject** and rename it to "**Managers**".
* In the **Hierarchy** panel, select the **Managers** object.
* In the **Inspector** panel, click the **Add Component** button.
* In the menu, type in the search box **Gaze Manager**. Select the search result.
* In the **Inspector** panel, select the **RaycastLayerMask** dropdown and **unselect TransparentFX**.
* In the **HoloToolkit\Input\Prefabs** folder, find the **Cursor** asset.
* Drag and drop the **Cursor** onto the **Hierarchy**.
* In the **Hierarchy** panel, select the **Cursor** object.
* In the **Inspector** panel, click the **Add Component** button.
* In the menu, type in the search box **Cursor Manager**. Select the search result.
* Expand the **Cursor** object in the Hierarchy.
* Drag and drop the **CursorOnHolograms** object onto the **Cursor On Holograms** property in the **Inspector**.
* Drag and drop the **CursorOffHolograms** object onto the **Cursor Off Holograms** property in the **Inspector**.

At this point, you need to edit the GazeManager.cs file, and edit it to perform the following tasks:
1. Perform a **physics raycast**,
2. Store the **position and normal** of the raycast intersection,
3. If the raycast did not hit anything, set the position and normal to defaults.

You can write the code yourself by locating comments in GazeManager.cs labeled "Coding Exercise" - each comment corresponds to one line of code. You can also use this completed version:




```
using UnityEngine;

namespace Academy.HoloToolkit.Unity
{
    /// <summary>
    /// GazeManager determines the location of the user's gaze, hit position and normals.
    /// </summary>
    public class GazeManager : Singleton<GazeManager>
    {
        [Tooltip("Maximum gaze distance for calculating a hit.")]
        public float MaxGazeDistance = 5.0f;

        [Tooltip("Select the layers raycast should target.")]
        public LayerMask RaycastLayerMask = Physics.DefaultRaycastLayers;

        /// <summary>
        /// Physics.Raycast result is true if it hits a Hologram.
        /// </summary>
        public bool Hit { get; private set; }

        /// <summary>
        /// HitInfo property gives access
        /// to RaycastHit public members.
        /// </summary>
        public RaycastHit HitInfo { get; private set; }

        /// <summary>
        /// Position of the user's gaze.
        /// </summary>
        public Vector3 Position { get; private set; }

        /// <summary>
        /// RaycastHit Normal direction.
        /// </summary>
        public Vector3 Normal { get; private set; }

        private GazeStabilizer gazeStabilizer;
        private Vector3 gazeOrigin;
        private Vector3 gazeDirection;

        void Awake()
        {
            /* TODO: DEVELOPER CODING EXERCISE 3.a */

            // 3.a: GetComponent GazeStabilizer and assign it to gazeStabilizer.

        }

        private void Update()
        {
            // 2.a: Assign Camera's main transform position to gazeOrigin.
            gazeOrigin = Camera.main.transform.position;

            // 2.a: Assign Camera's main transform forward to gazeDirection.
            gazeDirection = Camera.main.transform.forward;

            // 3.a: Using gazeStabilizer, call function UpdateHeadStability.
            // Pass in gazeOrigin and Camera's main transform rotation.


            // 3.a: Using gazeStabilizer, get the StableHeadPosition and
            // assign it to gazeOrigin.


            UpdateRaycast();
        }

        /// <summary>
        /// Calculates the Raycast hit position and normal.
        /// </summary>
        private void UpdateRaycast()
        {
            /* TODO: DEVELOPER CODING EXERCISE 2.a */

            // 2.a: Create a variable hitInfo of type RaycastHit.
            RaycastHit hitInfo;

            // 2.a: Perform a Unity Physics Raycast.
            // Collect return value in public property Hit.
            // Pass in origin as gazeOrigin and direction as gazeDirection.
            // Collect the information in hitInfo.
            // Pass in MaxGazeDistance and RaycastLayerMask.
            Hit = Physics.Raycast(gazeOrigin,
                           gazeDirection,
                           out hitInfo,
                           MaxGazeDistance,
                           RaycastLayerMask);

            // 2.a: Assign hitInfo variable to the HitInfo public property 
            // so other classes can access it.
            HitInfo = hitInfo;

            if (Hit)
            {
                // If raycast hit a hologram...

                // 2.a: Assign property Position to be the hitInfo point.
                Position = hitInfo.point;
                // 2.a: Assign property Normal to be the hitInfo normal.
                Normal = hitInfo.normal;
            }
            else
            {
                // If raycast did not hit a hologram...
                // Save defaults ...

                // 2.a: Assign Position to be gazeOrigin plus MaxGazeDistance times gazeDirection.
                Position = gazeOrigin + (gazeDirection * MaxGazeDistance);
                // 2.a: Assign Normal to be the user's gazeDirection.
                Normal = gazeDirection;
            }
        }
    }
}
```

Next you will need to edit **CusorManager.cs** in order to achieve the following:
1. Decide which cursor should be active,
2. Update the cursor based on whether it's off or on a hologram,
3. Position the cursor where the user is gazing.

Again, you are welcome to write your own code by locating the comments labeled "Coding Exercise" in CursorManager.cs, or use the following:




```
using UnityEngine;

namespace Academy.HoloToolkit.Unity
{
    /// <summary>
    /// CursorManager class takes Cursor GameObjects.
    /// One that is on Holograms and another off Holograms.
    /// Shows the appropriate Cursor when a Hologram is hit.
    /// Places the appropriate Cursor at the hit position.
    /// Matches the Cursor normal to the hit surface.
    /// </summary>
    public class CursorManager : Singleton<CursorManager>
    {
        [Tooltip("Drag the Cursor object to show when it hits a hologram.")]
        public GameObject CursorOnHolograms;

        [Tooltip("Drag the Cursor object to show when it does not hit a hologram.")]
        public GameObject CursorOffHolograms;

        void Awake()
        {
            if (CursorOnHolograms == null || CursorOffHolograms == null)
            {
                return;
            }

            // Hide the Cursors to begin with.
            CursorOnHolograms.SetActive(false);
            CursorOffHolograms.SetActive(false);
        }

        void Update()
        {
            /* TODO: DEVELOPER CODING EXERCISE 2.b */

            if (GazeManager.Instance == null || CursorOnHolograms == null || CursorOffHolograms == null)
            {
                return;
            }

            if (GazeManager.Instance.Hit)
            {
                // 2.b: SetActive true the CursorOnHolograms to show cursor.
                CursorOnHolograms.SetActive(true);
                // 2.b: SetActive false the CursorOffHolograms hide cursor.
                CursorOffHolograms.SetActive(false);
            }
            else
            {
                // 2.b: SetActive true CursorOffHolograms to show cursor.
                CursorOffHolograms.SetActive(true);
                // 2.b: SetActive false CursorOnHolograms to hide cursor.
                CursorOnHolograms.SetActive(false);
            }

            // 2.b: Assign gameObject's transform position equals GazeManager's instance Position.
            gameObject.transform.position = GazeManager.Instance.Position;

            // 2.b: Assign gameObject's transform up vector equals GazeManager's instance Normal.
            gameObject.transform.up = GazeManager.Instance.Normal;
        }
    }
}
```
* Rebuild the app from **File > Build Settings**.
* Open the **App Folder**.
* Open the **ModelExplorer Visual Studio Solution**.
* Click **Debug -> Start Without debugging** or press **Ctrl + F5**.
* Observe how the cursor is drawn, and how it changes appearance if it is touching a hologram.
* In the **Hierarchy** panel, select the **Managers** object.
* In the **Inspector** panel, click the **Add Component** button.
* In the menu, type in the search box **Interactible Manager**. Select the search result.
* In the **Hierarchy** panel, select the **AstroMan** object.
* In the **Inspector** panel, click the **Add Component** button.
* In the menu, type in the search box **Interactible**. Select the search result.

You'll need to edit both **InteractibleManager.cs** and **Interactible.cs** in order to achieve the following:
1. In **InteractibleManager.cs**, fetch the point the gaze raycast hit and save the **collided GameObject**.
2. Send the **GazeEntered** message if gazing at an object with which you can interact.
3. Send the **GazeExited** message if gazing away from the object with which you can interact.
4. Handle the **GazeEntered** and **GazeExited** callbacks in **Interactible.cs**.

Give it a try yourself with the coding exercises in InteractibleManager.cs and Interactible.cs, or use the following solutions:




```
using Academy.HoloToolkit.Unity;
using UnityEngine;

/// <summary>
/// InteractibleManager keeps tracks of which GameObject
/// is currently in focus.
/// </summary>
public class InteractibleManager : Singleton<InteractibleManager>
{
    public GameObject FocusedGameObject { get; private set; }

    private GameObject oldFocusedGameObject = null;

    void Start()
    {
        FocusedGameObject = null;
    }

    void Update()
    {
        /* TODO: DEVELOPER CODING EXERCISE 2.c */

        oldFocusedGameObject = FocusedGameObject;

        if (GazeManager.Instance.Hit)
        {
            RaycastHit hitInfo = GazeManager.Instance.HitInfo;
            if (hitInfo.collider != null)
            {
                // 2.c: Assign the hitInfo's collider gameObject to the FocusedGameObject.
                FocusedGameObject = hitInfo.collider.gameObject;
            }
            else
            {
                FocusedGameObject = null;
            }
        }
        else
        {
            FocusedGameObject = null;
        }

        if (FocusedGameObject != oldFocusedGameObject)
        {
            ResetFocusedInteractible();

            if (FocusedGameObject != null)
            {
                if (FocusedGameObject.GetComponent<Interactible>() != null)
                {
                    // 2.c: Send a GazeEntered message to the FocusedGameObject.
                    FocusedGameObject.SendMessage("GazeEntered");
                }
            }
        }
    }

    private void ResetFocusedInteractible()
    {
        if (oldFocusedGameObject != null)
        {
            if (oldFocusedGameObject.GetComponent<Interactible>() != null)
            {
                // 2.c: Send a GazeExited message to the oldFocusedGameObject.
                oldFocusedGameObject.SendMessage("GazeExited");
            }
        }
    }
}
```




```
using UnityEngine;

/// <summary>
/// The Interactible class flags a Game Object as being "Interactible".
/// Determines what happens when an Interactible is being gazed at.
/// </summary>
public class Interactible : MonoBehaviour
{
    [Tooltip("Audio clip to play when interacting with this hologram.")]
    public AudioClip TargetFeedbackSound;
    private AudioSource audioSource;

    private Material[] defaultMaterials;

    void Start()
    {
        defaultMaterials = GetComponent<Renderer>().materials;

        // Add a BoxCollider if the interactible does not contain one.
        Collider collider = GetComponentInChildren<Collider>();
        if (collider == null)
        {
            gameObject.AddComponent<BoxCollider>();
        }

        EnableAudioHapticFeedback();
    }

    private void EnableAudioHapticFeedback()
    {
        // If this hologram has an audio clip, add an AudioSource with this clip.
        if (TargetFeedbackSound != null)
        {
            audioSource = GetComponent<AudioSource>();
            if (audioSource == null)
            {
                audioSource = gameObject.AddComponent<AudioSource>();
            }

            audioSource.clip = TargetFeedbackSound;
            audioSource.playOnAwake = false;
            audioSource.spatialBlend = 1;
            audioSource.dopplerLevel = 0;
        }
    }

    /* TODO: DEVELOPER CODING EXERCISE 2.d */

    void GazeEntered()
    {
        for (int i = 0; i < defaultMaterials.Length; i++)
        {
            // 2.d: Uncomment the below line to highlight the material when gaze enters.
            defaultMaterials[i].SetFloat("_Highlight", .25f);
        }
    }

    void GazeExited()
    {
        for (int i = 0; i < defaultMaterials.Length; i++)
        {
            // 2.d: Uncomment the below line to remove highlight on material when gaze exits.
            defaultMaterials[i].SetFloat("_Highlight", 0f);
        }
    }

    void OnSelect()
    {
        for (int i = 0; i < defaultMaterials.Length; i++)
        {
            defaultMaterials[i].SetFloat("_Highlight", .5f);
        }

        // Play the audioSource feedback when we gaze and select a hologram.
        if (audioSource != null && !audioSource.isPlaying)
        {
            audioSource.Play();
        }

        /* TODO: DEVELOPER CODING EXERCISE 6.a */
        // 6.a: Handle the OnSelect by sending a PerformTagAlong message.

    }
}
```
* As before, build the project and deploy to the HoloLens.
* Observe what happens when the gaze is aimed at an object, and when it's not.

## Chapter 3 - Targeting Techniques

>[!VIDEO https://www.youtube.com/embed/TFnuLva4VJ0]

**Objectives**
* Make it easier to target holograms.
* Stabilize natural head movements.

**Instructions**
1. In the **Hierarchy** panel, select the **Managers** object.
2. In the **Inspector** panel, click the **Add Component** button.
3. In the menu, type in the search box **Gaze Stabilizer**. Select the search result.

Now we'll modify our GazeManager to use the GazeStabilizer.
1. Open the **GazeManager** script in Visual Studio.
2. Copy the code below into GazeManager.cs, or complete coding exercise 3.a yourself.




```
using UnityEngine;

namespace Academy.HoloToolkit.Unity
{
    /// <summary>
    /// GazeManager determines the location of the user's gaze, hit position and normals.
    /// </summary>
    public class GazeManager : Singleton<GazeManager>
    {
        [Tooltip("Maximum gaze distance for calculating a hit.")]
        public float MaxGazeDistance = 5.0f;

        [Tooltip("Select the layers raycast should target.")]
        public LayerMask RaycastLayerMask = Physics.DefaultRaycastLayers;

        /// <summary>
        /// Physics.Raycast result is true if it hits a Hologram.
        /// </summary>
        public bool Hit { get; private set; }

        /// <summary>
        /// HitInfo property gives access
        /// to RaycastHit public members.
        /// </summary>
        public RaycastHit HitInfo { get; private set; }

        /// <summary>
        /// Position of the user's gaze.
        /// </summary>
        public Vector3 Position { get; private set; }

        /// <summary>
        /// RaycastHit Normal direction.
        /// </summary>
        public Vector3 Normal { get; private set; }

        private GazeStabilizer gazeStabilizer;
        private Vector3 gazeOrigin;
        private Vector3 gazeDirection;

        void Awake()
        {
            /* TODO: DEVELOPER CODING EXERCISE 3.a */

            // 3.a: GetComponent GazeStabilizer and assign it to gazeStabilizer.
            gazeStabilizer = GetComponent<GazeStabilizer>();
        }

        private void Update()
        {
            // 2.a: Assign Camera's main transform position to gazeOrigin.
            gazeOrigin = Camera.main.transform.position;

            // 2.a: Assign Camera's main transform forward to gazeDirection.
            gazeDirection = Camera.main.transform.forward;

            // 3.a: Using gazeStabilizer, call function UpdateHeadStability.
            // Pass in gazeOrigin and Camera's main transform rotation.
            gazeStabilizer.UpdateHeadStability(gazeOrigin, Camera.main.transform.rotation);

            // 3.a: Using gazeStabilizer, get the StableHeadPosition and
            // assign it to gazeOrigin.
            gazeOrigin = gazeStabilizer.StableHeadPosition;

            UpdateRaycast();
        }

        /// <summary>
        /// Calculates the Raycast hit position and normal.
        /// </summary>
        private void UpdateRaycast()
        {
            /* TODO: DEVELOPER CODING EXERCISE 2.a */

            // 2.a: Create a variable hitInfo of type RaycastHit.
            RaycastHit hitInfo;

            // 2.a: Perform a Unity Physics Raycast.
            // Collect return value in public property Hit.
            // Pass in origin as gazeOrigin and direction as gazeDirection.
            // Collect the information in hitInfo.
            // Pass in MaxGazeDistance and RaycastLayerMask.
            Hit = Physics.Raycast(gazeOrigin,
                           gazeDirection,
                           out hitInfo,
                           MaxGazeDistance,
                           RaycastLayerMask);

            // 2.a: Assign hitInfo variable to the HitInfo public property 
            // so other classes can access it.
            HitInfo = hitInfo;

            if (Hit)
            {
                // If raycast hit a hologram...

                // 2.a: Assign property Position to be the hitInfo point.
                Position = hitInfo.point;
                // 2.a: Assign property Normal to be the hitInfo normal.
                Normal = hitInfo.normal;
            }
            else
            {
                // If raycast did not hit a hologram...
                // Save defaults ...

                // 2.a: Assign Position to be gazeOrigin plus MaxGazeDistance times gazeDirection.
                Position = gazeOrigin + (gazeDirection * MaxGazeDistance);
                // 2.a: Assign Normal to be the user's gazeDirection.
                Normal = gazeDirection;
            }
        }
    }
}
```

## Chapter 4 - Directional indicator

>[!VIDEO https://www.youtube.com/embed/htVbJCMlj64]

**Objectives**
* Add a directional indicator on the cursor to help find holograms.

**Instructions**

We're going to use the **DirectionalIndicator.cs** file which will:
1. Show the directional indicator if the user is not gazing at the holograms.
2. Hide the directional indicator if the user is gazing at the holograms.
3. Update the directional indicator to point to the holograms.

Let's get started.
* Click on the **AstroMan** object in the **Hierarchy** panel and **click the arrow** to expand it.
* In the **Hierarchy** panel, select the **DirectionalIndicator** object under **AstroMan**.
* In the **Inspector** panel, click the **Add Component** button.
* In the menu, type in the search box **Direction Indicator**. Select the search result.
* In the **Hierarchy** panel, drag and drop the **Cursor** object onto the **Cursor** property in the **Inspector**.
* In the **Project** panel, in the **Holograms** folder, drag and drop the **DirectionalIndicator** asset onto the **Directional Indicator** property in the **Inspector**.
* Build and deploy the app to the HoloLens.
* Watch how the direction indicator object helps you find the astronaut

## Chapter 5 - Billboarding

>[!VIDEO https://www.youtube.com/embed/qFiLr_LUACE]

**Objectives**
* Use billboarding to have holograms always face towards you.

We will be using the **Billboard.cs** file to keep a GameObject oriented such that it is facing the user at all times.
* In the **Hierarchy** panel, select the **AstroMan** object.
* In the **Inspector** panel, click the **Add Component** button.
* In the menu, type in the search box **Billboard**. Select the search result.
* In the **Inspector** set the **Pivot Axis** to **Y**.
* Try it! Build and deploy the app to the HoloLens as before.
* See how the Billboard object faces you no matter how you change the viewpoint.
* Delete the script from the **AstroMan** for now.

## Chapter 6 - Tag-Along

>[!VIDEO https://www.youtube.com/embed/Ct8ORZAX5JU]

**Objectives**
* Use Tag-Along to have our holograms follow us around the room.

As we work on this issue, we'll be guided by the following design constraints:
* Content should always be a glance away.
* Content should not be in the way.
* Head-locking content is uncomfortable.

The solution used here is to use a "tag-along" approach.

A tag-along object never fully leaves the user's view. You can think of the a tag-along as being an object attached to the user's head by rubber bands. As the user moves, the content will stay within an easy glance by sliding towards the edge of the view without completely leaving. When the user gazes towards the tag-along object, it comes more fully into view.
* In the **Hierarchy** panel, select the **Managers** object.
* In the **Inspector** panel, click the **Add Component** button.
* In the menu, type in the search box **Gesture Manager**. Select the search result.

We're going to use the **SimpleTagalong.cs** file which will:
1. Determine if the Tag-Along object is within the camera bounds.
2. If not within the view frustum, position the Tag-Along to partially within the view frustum.
3. Otherwise, position the Tag-Along to a default distance from the user.

To do this:
* In the **Holograms** folder click on **Tagalong** asset.
* In the **Inspector**, click on **Tag** dropdown and click **Add Tag …**.
* Click on the **+** sign and name **Tag 0** as **TagAlong**.
* In the **Holograms** folder click on **Tagalong** asset and click on **Tag** dropdown.
* Select **TagAlong** tag.
* We first must change the **Interactible.cs** script to send a message to **InteractibleAction.**
* Edit **Interactible.cs** by completing the coding exercise or use the following:




```
using UnityEngine;

/// <summary>
/// The Interactible class flags a Game Object as being "Interactible".
/// Determines what happens when an Interactible is being gazed at.
/// </summary>
public class Interactible : MonoBehaviour
{
    [Tooltip("Audio clip to play when interacting with this hologram.")]
    public AudioClip TargetFeedbackSound;
    private AudioSource audioSource;

    private Material[] defaultMaterials;

    void Start()
    {
        defaultMaterials = GetComponent<Renderer>().materials;

        // Add a BoxCollider if the interactible does not contain one.
        Collider collider = GetComponentInChildren<Collider>();
        if (collider == null)
        {
            gameObject.AddComponent<BoxCollider>();
        }

        EnableAudioHapticFeedback();
    }

    private void EnableAudioHapticFeedback()
    {
        // If this hologram has an audio clip, add an AudioSource with this clip.
        if (TargetFeedbackSound != null)
        {
            audioSource = GetComponent<AudioSource>();
            if (audioSource == null)
            {
                audioSource = gameObject.AddComponent<AudioSource>();
            }

            audioSource.clip = TargetFeedbackSound;
            audioSource.playOnAwake = false;
            audioSource.spatialBlend = 1;
            audioSource.dopplerLevel = 0;
        }
    }

    /* TODO: DEVELOPER CODING EXERCISE 2.d */

    void GazeEntered()
    {
        for (int i = 0; i < defaultMaterials.Length; i++)
        {
            // 2.d: Uncomment the below line to highlight the material when gaze enters.
            defaultMaterials[i].SetFloat("_Highlight", .25f);
        }
    }

    void GazeExited()
    {
        for (int i = 0; i < defaultMaterials.Length; i++)
        {
            // 2.d: Uncomment the below line to remove highlight on material when gaze exits.
            defaultMaterials[i].SetFloat("_Highlight", 0f);
        }
    }

    void OnSelect()
    {
        for (int i = 0; i < defaultMaterials.Length; i++)
        {
            defaultMaterials[i].SetFloat("_Highlight", .5f);
        }

        // Play the audioSource feedback when we gaze and select a hologram.
        if (audioSource != null && !audioSource.isPlaying)
        {
            audioSource.Play();
        }

        /* TODO: DEVELOPER CODING EXERCISE 6.a */
        // 6.a: Handle the OnSelect by sending a PerformTagAlong message.
        SendMessage("PerformTagAlong");
    }
}
```

The **InteractibleAction.cs** script performs custom actions when you gaze at the holograms. Let's update it for use with the tag-along.
* In the **Scripts** folder click on **InteractibleAction.cs** asset to open in Visual Studio.
* Complete the coding exercise or change it to this:
* At the top of the **Hierarchy**, in the search bar type **ChestButton_Center** and select the result.
* In the **Inspector** panel, click the **Add Component** button.
* In the menu, type in the search box **Interactible Action**. Select the search result.
* In **Holograms** folder find the **Tagalong** asset.
* Select the **ChestButton_Center** object in the **Hierarchy**. Drag and drop the **TagAlong** object from the **Project** panel onto the **Inspector** into the **Object to TagAlong** property.
* Double click the **InteractibleAction** script to open it in Visual Studio.

We need to add the following:
* Add functionality to the PerformTagAlong function in the InteractibleAction script.
* Add billboarding to the gazed-upon object, and set the pivot axis to free.
* Then add simple Tag-Along to the object.

Here's our solution:




```
using Academy.HoloToolkit.Unity;
using UnityEngine;

/// <summary>
/// InteractibleAction performs custom actions when you gaze at the holograms.
/// </summary>
public class InteractibleAction : MonoBehaviour
{
    [Tooltip("Drag the Tagalong prefab asset you want to display.")]
    public GameObject ObjectToTagAlong;

    void PerformTagAlong()
    {
        if (ObjectToTagAlong == null)
        {
            return;
        }

        // Recommend having only one tagalong.
        GameObject existingTagAlong = GameObject.FindGameObjectWithTag("TagAlong");
        if (existingTagAlong != null)
        {
            return;
        }

        GameObject instantiatedObjectToTagAlong = GameObject.Instantiate(ObjectToTagAlong);

        instantiatedObjectToTagAlong.SetActive(true);

        /* TODO: DEVELOPER CODING EXERCISE 6.b */

        // 6.b: AddComponent Billboard to instantiatedObjectToTagAlong.
        // So it's always facing the user as they move.
        instantiatedObjectToTagAlong.AddComponent<Billboard>();

        // 6.b: AddComponent SimpleTagalong to instantiatedObjectToTagAlong.
        // So it's always following the user as they move.
        instantiatedObjectToTagAlong.AddComponent<SimpleTagalong>();

        // 6.b: Set any public properties you wish to experiment with.
    }
}
```
* Try it! Build and deploy the app to the HoloLens.
* Watch how the content follows the center of the gaze point, but not continuously and without blocking it.
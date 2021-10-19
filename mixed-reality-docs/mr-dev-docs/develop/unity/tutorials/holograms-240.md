---
title: HoloLens (1st gen) Sharing 240 - Multiple HoloLens devices
description: Follow this coding walkthrough using Unity, Visual Studio and HoloLens to learn the details of sharing holograms.
author: keveleigh
ms.author: kurtie
ms.date: 10/22/2019
ms.topic: article
keywords: holotoolkit, mixedrealitytoolkit, mixedrealitytoolkit-unity, sharing, networking, academy, tutorial, HoloLens, Mixed Reality Academy, unity, mixed reality headset, windows mixed reality headset, virtual reality headset, Windows 10
---

# HoloLens (1st gen) Sharing 240: Multiple HoloLens devices

>[!IMPORTANT]
>The Mixed Reality Academy tutorials were designed with HoloLens (1st gen), Unity 2017, and Mixed Reality Immersive Headsets in mind.  As such, we feel it is important to leave these tutorials in place for developers who are still looking for guidance in developing for those devices. These tutorials will **_not_** be updated with the latest toolsets or interactions being used for HoloLens 2 and may not be compatible with newer versions of Unity.  They will be maintained to continue working on the supported devices. [A new series of tutorials](mrlearning-base.md) has been posted for HoloLens 2.

Holograms are given presence in our world by remaining in place as we move about in space. HoloLens keeps holograms in place by using various [coordinate systems](../../../design/coordinate-systems.md) to keep track of the location and orientation of objects. When we share these coordinate systems between devices, we can create a shared experience that allows us to take part in a shared holographic world.

In this tutorial, we will:

* Setup a network for a shared experience.
* Share holograms across HoloLens devices.
* Discover other people in our shared holographic world.
* Create a shared interactive experience where you can target other players - and launch projectiles at them!

## Device support

<table>
<tr>
<th>Course</th><th style="width:150px"> <a href="/hololens/hololens1-hardware">HoloLens</a></th><th style="width:150px"> <a href="../../../discover/immersive-headset-hardware-details.md">Immersive headsets</a></th>
</tr><tr>
<td>MR Sharing 240: Multiple HoloLens devices</td><td style="text-align: center;"> ✔️</td><td style="text-align: center;"> </td>
</tr>
</table>

## Before you start

### Prerequisites

* A Windows 10 PC configured with the correct [tools installed](../../../develop/install-the-tools.md) with Internet access.
* At least two HoloLens devices [configured for development](../../../develop/advanced-concepts/using-visual-studio.md#enabling-developer-mode).

### Project files

* Download the [files](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-240-SharedHolograms.zip) required by the project. Requires Unity 2017.2 or later.
  * If you still need Unity 5.6 support, please use [this release](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.6-240.zip).
  * If you still need Unity 5.5 support, please use [this release](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.5-240.zip).
  * If you still need Unity 5.4 support, please use [this release](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.4-240.zip).
* Un-archive the files to your desktop or other easy to reach location. Keep the folder name as **SharedHolograms**.

>[!NOTE]
>If you want to look through the source code before downloading, it's [available on GitHub](https://github.com/Microsoft/HolographicAcademy/tree/Holograms-240-SharedHolograms).

## Chapter 1 - Holo World

>[!VIDEO https://www.youtube.com/embed/c7qHYYW8rxQ]

In this chapter, we'll setup our first Unity project and step through the build and deploy process.

### Objectives

* Setup Unity to develop holographic apps.
* See your hologram!

### Instructions

* Start Unity.
* Select **Open**.
* Enter location as the **SharedHolograms** folder you previously unarchived.
* Select **Project Name** and click **Select Folder**.
* In the **Hierarchy**, right-click the **Main Camera** and select **Delete**.
* In the **HoloToolkit-Sharing-240/Prefabs/Camera** folder, find the **Main Camera** prefab.
* Drag and drop the **Main Camera** into the **Hierarchy**.
* In the **Hierarchy**, click on **Create** and **Create Empty**.
* Right-click the new **GameObject** and select **Rename**.
* Rename the GameObject to **HologramCollection**.
* Select the **HologramCollection** object in the **Hierarchy**.
* In the **Inspector** set the **transform position** to: **X: 0, Y: -0.25, Z: 2**.
* In the **Holograms** folder in the **Project panel**, find the **EnergyHub** asset.
* Drag and drop the **EnergyHub** object from the **Project panel** to the **Hierarchy** as a **child of HologramCollection**.
* Select **File > Save Scene As...**
* Name the scene **SharedHolograms** and click **Save**.
* Press the **Play** button in Unity to preview your holograms.
* Press **Play** a second time to stop preview mode.

**Export the project from Unity to Visual Studio**

* In Unity select **File > Build Settings**.
* Click **Add Open Scenes** to add the scene.
* Select **Universal Windows Platform** in the **Platform** list and click **Switch Platform**.
* Set **SDK** to **Universal 10**.
* Set **Target device** to **HoloLens** and **UWP Build Type** to **D3D**.
* Check **Unity C# Projects**.
* Click **Build**.
* In the file explorer window that appears, create a **New Folder** named "App".
* Single click the **App** folder.
* Press **Select Folder**.
* When Unity is done, a File Explorer window will appear.
* Open the **App** folder.
* Open **SharedHolograms.sln** to launch Visual Studio.
* Using the top toolbar in Visual Studio, change the target from Debug to **Release** and from ARM to **X86**.
* Click on the drop-down arrow next to Local Machine, and select **Remote Device**.
    * Set the **Address** to the name or IP address of your HoloLens. If you do not know your device IP address, look in **Settings > Network & Internet > Advanced Options** or ask Cortana **"Hey Cortana, What's my IP address?"**
    * Leave the **Authentication Mode** set to **Universal**.
    * Click **Select**
* Click **Debug > Start Without debugging** or press **Ctrl + F5**. If this is the first time deploying to your device, you will need to [pair it with Visual Studio](../../../develop/advanced-concepts/using-visual-studio.md#pairing-your-device).
* Put on your HoloLens and find the EnergyHub hologram.

## Chapter 2 - Interaction

>[!VIDEO https://www.youtube.com/embed/W60xG15a8gc]

In this chapter, we'll interact with our holograms. First, we'll add a cursor to visualize our [Gaze](../../../design/gaze-and-commit.md). Then, we'll add [Gestures](../../../design/gaze-and-commit.md#composite-gestures) and use our hand to place our holograms in space.

### Objectives

* Use gaze input to control a cursor.
* Use gesture input to interact with holograms.

### Instructions

**Gaze**

* In the **Hierarchy panel** select the **HologramCollection** object.
* In the **Inspector panel** click the **Add Component** button.
* In the menu, type in the search box **Gaze Manager**. Select the search result.
* In the **HoloToolkit-Sharing-240\Prefabs\Input** folder, find the **Cursor** asset.
* Drag and drop the **Cursor** asset onto the **Hierarchy**.

**Gesture**

* In the **Hierarchy panel** select the **HologramCollection** object.
* Click **Add Component** and type **Gesture Manager** in the search field. Select the search result.
* In the **Hierarchy panel**, expand **HologramCollection**.
* Select the child **EnergyHub** object.
* In the **Inspector panel** click the **Add Component** button.
* In the menu, type in the search box **Hologram Placement**. Select the search result.
* Save the scene by selecting **File > Save Scene**.

**Deploy and enjoy**

* Build and deploy to your HoloLens, using the instructions from the previous chapter.
* Once the app launches on your HoloLens, move your head around and notice how the EnergyHub follows your gaze.
* Notice how the cursor appears when you gaze upon the hologram, and changes to a point light when not gazing at a hologram.
* Perform an air-tap to place the hologram. At this time in our project, you can only place the hologram once (redeploy to try again).

## Chapter 3 - Shared Coordinates

>[!VIDEO https://www.youtube.com/embed/Ey8yBgWiqtg]

It's fun to see and interact with holograms, but let's go further. We'll set up our first shared experience - a hologram everyone can see together.

### Objectives

* Setup a network for a shared experience.
* Establish a common reference point.
* Share coordinate systems across devices.
* Everyone sees the same hologram!

>[!NOTE]
>The **InternetClientServer** and **PrivateNetworkClientServer** capabilities must be declared for an app to connect to the sharing server. This is done for you already in Holograms 240, but keep this in mind for your own projects.

>1. In the Unity Editor, go to the player settings by navigating to "Edit > Project Settings > Player"
>2. Click on the "Windows Store" tab
>3. In the "Publishing Settings > Capabilities" section, check the **InternetClientServer** capability and the **PrivateNetworkClientServer** capability

### Instructions

* In the **Project panel** navigate to the **HoloToolkit-Sharing-240\Prefabs\Sharing** folder.
* Drag and drop the **Sharing** prefab into the **Hierarchy panel**.

Next we need to launch the sharing service. Only **one PC** in the shared experience needs to do this step.

* In Unity - in the top-hand menu - select the **HoloToolkit-Sharing-240 menu**.
* Select the **Launch Sharing Service** item in the drop-down.
* Check the **Private Network** option and click **Allow Access** when the firewall prompt appears.
* Note down the IPv4 address displayed in the Sharing Service console window. This is the same IP as the machine the service is being run on.

Follow the rest of the instructions on **all PCs** that will join the shared experience.

* In the **Hierarchy**, select the **Sharing** object.
* In the **Inspector**, on the **Sharing Stage** component, change the **Server Address** from 'localhost' to the IPv4 address of the machine running SharingService.exe.
* In the **Hierarchy** select the **HologramCollection** object.
* In the **Inspector** click the **Add Component** button.
* In the search box, type **Import Export Anchor Manager**. Select the search result.
* In the **Project panel** navigate to the **Scripts** folder.
* Double-click the **HologramPlacement** script to open it in Visual Studio.
* Replace the contents with the code below.

```cs
using UnityEngine;
using System.Collections.Generic;
using UnityEngine.Windows.Speech;
using Academy.HoloToolkit.Unity;
using Academy.HoloToolkit.Sharing;

public class HologramPlacement : Singleton<HologramPlacement>
{
    /// <summary>
    /// Tracks if we have been sent a transform for the anchor model.
    /// The anchor model is rendered relative to the actual anchor.
    /// </summary>
    public bool GotTransform { get; private set; }

    private bool animationPlayed = false;

    void Start()
    {
        // We care about getting updates for the anchor transform.
        CustomMessages.Instance.MessageHandlers[CustomMessages.TestMessageID.StageTransform] = this.OnStageTransform;

        // And when a new user join we will send the anchor transform we have.
        SharingSessionTracker.Instance.SessionJoined += Instance_SessionJoined;
    }

    /// <summary>
    /// When a new user joins we want to send them the relative transform for the anchor if we have it.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    private void Instance_SessionJoined(object sender, SharingSessionTracker.SessionJoinedEventArgs e)
    {
        if (GotTransform)
        {
            CustomMessages.Instance.SendStageTransform(transform.localPosition, transform.localRotation);
        }
    }

    void Update()
    {
        if (GotTransform)
        {
            if (ImportExportAnchorManager.Instance.AnchorEstablished &&
                animationPlayed == false)
            {
                // This triggers the animation sequence for the anchor model and 
                // puts the cool materials on the model.
                GetComponent<EnergyHubBase>().SendMessage("OnSelect");
                animationPlayed = true;
            }
        }
        else
        {
            transform.position = Vector3.Lerp(transform.position, ProposeTransformPosition(), 0.2f);
        }
    }

    Vector3 ProposeTransformPosition()
    {
        // Put the anchor 2m in front of the user.
        Vector3 retval = Camera.main.transform.position + Camera.main.transform.forward * 2;

        return retval;
    }

    public void OnSelect()
    {
        // Note that we have a transform.
        GotTransform = true;

        // And send it to our friends.
        CustomMessages.Instance.SendStageTransform(transform.localPosition, transform.localRotation);
    }

    /// <summary>
    /// When a remote system has a transform for us, we'll get it here.
    /// </summary>
    /// <param name="msg"></param>
    void OnStageTransform(NetworkInMessage msg)
    {
        // We read the user ID but we don't use it here.
        msg.ReadInt64();

        transform.localPosition = CustomMessages.Instance.ReadVector3(msg);
        transform.localRotation = CustomMessages.Instance.ReadQuaternion(msg);

        // The first time, we'll want to send the message to the anchor to do its animation and
        // swap its materials.
        if (GotTransform == false)
        {
            GetComponent<EnergyHubBase>().SendMessage("OnSelect");
        }

        GotTransform = true;
    }

    public void ResetStage()
    {
        // We'll use this later.
    }
}
```

* Back in Unity, select the **HologramCollection** in the **Hierarchy panel**.
* In the **Inspector panel** click the **Add Component** button.
* In the menu, type in the search box **App State Manager**. Select the search result.

**Deploy and enjoy**

* Build the project for your HoloLens devices.
* Designate one HoloLens to deploy to first. You will need to wait for the Anchor to be uploaded to the service before you can place the EnergyHub (this can take ~30-60 seconds). Until the upload is done, your tap gestures will be ignored.
* After the EnergyHub has been placed, its location will be uploaded to the service and you can then deploy to all other HoloLens devices.
* When a new HoloLens first joins the session, the location of the EnergyHub may not be correct on that device. However, as soon as the anchor and EnergyHub locations have been downloaded from the service, the EnergyHub should jump to the new, shared location. If this does not happen within ~30-60 seconds, walk to where the original HoloLens was when setting the anchor to gather more environment clues. If the location still does not lock on, redeploy to the device.
* When the devices are all ready and running the app, look for the EnergyHub. Can you all agree on the hologram's location and which direction the text is facing?

## Chapter 4 - Discovery

>[!VIDEO https://www.youtube.com/embed/5NxJWMV4BP8]

Everyone can now see the same hologram! Now let's see everyone else connected to our shared holographic world. In this chapter, we'll grab the head location and rotation of all other HoloLens devices in the same sharing session.

### Objectives

* Discover each other in our shared experience.
* Choose and share a player avatar.
* Attach the player avatar next to everyone's heads.

### Instructions

* In the **Project panel** navigate to the **Holograms** folder.
* Drag and drop the **PlayerAvatarStore** into the **Hierarchy**.
* In the **Project panel** navigate to the **Scripts** folder.
* Double-click the **AvatarSelector** script to open it in Visual Studio.
* Replace the contents with the code below.

```cs
using UnityEngine;
using Academy.HoloToolkit.Unity;

/// <summary>
/// Script to handle the user selecting the avatar.
/// </summary>
public class AvatarSelector : MonoBehaviour
{
    /// <summary>
    /// This is the index set by the PlayerAvatarStore for the avatar.
    /// </summary>
    public int AvatarIndex { get; set; }

    /// <summary>
    /// Called when the user is gazing at this avatar and air-taps it.
    /// This sends the user's selection to the rest of the devices in the experience.
    /// </summary>
    void OnSelect()
    {
        PlayerAvatarStore.Instance.DismissAvatarPicker();

        LocalPlayerManager.Instance.SetUserAvatar(AvatarIndex);
    }

    void Start()
    {
        // Add Billboard component so the avatar always faces the user.
        Billboard billboard = gameObject.GetComponent<Billboard>();
        if (billboard == null)
        {
            billboard = gameObject.AddComponent<Billboard>();
        }

        // Lock rotation along the Y axis.
        billboard.PivotAxis = PivotAxis.Y;
    }
}
```

* In the **Hierarchy** select the **HologramCollection** object.
* In the **Inspector** click **Add Component**.
* In the search box, type **Local Player Manager**. Select the search result.
* In the **Hierarchy** select the **HologramCollection** object.
* In the **Inspector** click **Add Component**.
* In the search box, type **Remote Player Manager**. Select the search result.
* Open the **HologramPlacement** script in Visual Studio.
* Replace the contents with the code below.

```cs
using UnityEngine;
using System.Collections.Generic;
using UnityEngine.Windows.Speech;
using Academy.HoloToolkit.Unity;
using Academy.HoloToolkit.Sharing;

public class HologramPlacement : Singleton<HologramPlacement>
{
    /// <summary>
    /// Tracks if we have been sent a transform for the model.
    /// The model is rendered relative to the actual anchor.
    /// </summary>
    public bool GotTransform { get; private set; }

    /// <summary>
    /// When the experience starts, we disable all of the rendering of the model.
    /// </summary>
    List<MeshRenderer> disabledRenderers = new List<MeshRenderer>();

    void Start()
    {
        // When we first start, we need to disable the model to avoid it obstructing the user picking a hat.
        DisableModel();

        // We care about getting updates for the model transform.
        CustomMessages.Instance.MessageHandlers[CustomMessages.TestMessageID.StageTransform] = this.OnStageTransform;

        // And when a new user join we will send the model transform we have.
        SharingSessionTracker.Instance.SessionJoined += Instance_SessionJoined;
    }

    /// <summary>
    /// When a new user joins we want to send them the relative transform for the model if we have it.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    private void Instance_SessionJoined(object sender, SharingSessionTracker.SessionJoinedEventArgs e)
    {
        if (GotTransform)
        {
            CustomMessages.Instance.SendStageTransform(transform.localPosition, transform.localRotation);
        }
    }

    /// <summary>
    /// Turns off all renderers for the model.
    /// </summary>
    void DisableModel()
    {
        foreach (MeshRenderer renderer in gameObject.GetComponentsInChildren<MeshRenderer>())
        {
            if (renderer.enabled)
            {
                renderer.enabled = false;
                disabledRenderers.Add(renderer);
            }
        }

        foreach (MeshCollider collider in gameObject.GetComponentsInChildren<MeshCollider>())
        {
            collider.enabled = false;
        }
    }

    /// <summary>
    /// Turns on all renderers that were disabled.
    /// </summary>
    void EnableModel()
    {
        foreach (MeshRenderer renderer in disabledRenderers)
        {
            renderer.enabled = true;
        }

        foreach (MeshCollider collider in gameObject.GetComponentsInChildren<MeshCollider>())
        {
            collider.enabled = true;
        }

        disabledRenderers.Clear();
    }


    void Update()
    {
        // Wait till users pick an avatar to enable renderers.
        if (disabledRenderers.Count > 0)
        {
            if (!PlayerAvatarStore.Instance.PickerActive &&
            ImportExportAnchorManager.Instance.AnchorEstablished)
            {
                // After which we want to start rendering.
                EnableModel();

                // And if we've already been sent the relative transform, we will use it.
                if (GotTransform)
                {
                    // This triggers the animation sequence for the model and
                    // puts the cool materials on the model.
                    GetComponent<EnergyHubBase>().SendMessage("OnSelect");
                }
            }
        }
        else if (GotTransform == false)
        {
            transform.position = Vector3.Lerp(transform.position, ProposeTransformPosition(), 0.2f);
        }
    }

    Vector3 ProposeTransformPosition()
    {
        // Put the model 2m in front of the user.
        Vector3 retval = Camera.main.transform.position + Camera.main.transform.forward * 2;

        return retval;
    }

    public void OnSelect()
    {
        // Note that we have a transform.
        GotTransform = true;

        // And send it to our friends.
        CustomMessages.Instance.SendStageTransform(transform.localPosition, transform.localRotation);
    }

    /// <summary>
    /// When a remote system has a transform for us, we'll get it here.
    /// </summary>
    /// <param name="msg"></param>
    void OnStageTransform(NetworkInMessage msg)
    {
        // We read the user ID but we don't use it here.
        msg.ReadInt64();

        transform.localPosition = CustomMessages.Instance.ReadVector3(msg);
        transform.localRotation = CustomMessages.Instance.ReadQuaternion(msg);

        // The first time, we'll want to send the message to the model to do its animation and
        // swap its materials.
        if (disabledRenderers.Count == 0 && GotTransform == false)
        {
            GetComponent<EnergyHubBase>().SendMessage("OnSelect");
        }

        GotTransform = true;
    }

    public void ResetStage()
    {
        // We'll use this later.
    }
}
```

* Open the **AppStateManager** script in Visual Studio.
* Replace the contents with the code below.

```cs
using UnityEngine;
using Academy.HoloToolkit.Unity;

/// <summary>
/// Keeps track of the current state of the experience.
/// </summary>
public class AppStateManager : Singleton<AppStateManager>
{
    /// <summary>
    /// Enum to track progress through the experience.
    /// </summary>
    public enum AppState
    {
        Starting = 0,
        WaitingForAnchor,
        WaitingForStageTransform,
        PickingAvatar,
        Ready
    }

    /// <summary>
    /// Tracks the current state in the experience.
    /// </summary>
    public AppState CurrentAppState { get; set; }

    void Start()
    {
        // We start in the 'picking avatar' mode.
        CurrentAppState = AppState.PickingAvatar;

        // We start by showing the avatar picker.
        PlayerAvatarStore.Instance.SpawnAvatarPicker();
    }

    void Update()
    {
        switch (CurrentAppState)
        {
            case AppState.PickingAvatar:
                // Avatar picking is done when the avatar picker has been dismissed.
                if (PlayerAvatarStore.Instance.PickerActive == false)
                {
                    CurrentAppState = AppState.WaitingForAnchor;
                }
                break;
            case AppState.WaitingForAnchor:
                if (ImportExportAnchorManager.Instance.AnchorEstablished)
                {
                    CurrentAppState = AppState.WaitingForStageTransform;
                    GestureManager.Instance.OverrideFocusedObject = HologramPlacement.Instance.gameObject;
                }
                break;
            case AppState.WaitingForStageTransform:
                // Now if we have the stage transform we are ready to go.
                if (HologramPlacement.Instance.GotTransform)
                {
                    CurrentAppState = AppState.Ready;
                    GestureManager.Instance.OverrideFocusedObject = null;
                }
                break;
        }
    }
}
```

**Deploy and Enjoy**

* Build and deploy the project to your HoloLens devices.
* When you hear a pinging sound, find the avatar selection menu and select an avatar with the air-tap gesture.
* If you're not looking at any holograms, the point light around your cursor will turn a different color when your HoloLens is communicating with the service: initializing (dark purple), downloading the anchor (green), importing/exporting location data (yellow), uploading the anchor (blue). If your point light around your cursor is the default color (light purple), then you are ready to interact with other players in your session!
* Look at other people connected to your space - there will be a holographic robot floating above their shoulder and mimicking their head motions!

## Chapter 5 - Placement

>[!VIDEO https://www.youtube.com/embed/afFTwHQIw0s]

In this chapter, we'll make the anchor able to be placed on real-world surfaces. We'll use shared coordinates to place that anchor in the middle point between everyone connected to the shared experience.

### Objectives

* Place holograms on the spatial mapping mesh based on players’ head position.

### Instructions

* In the **Project panel** navigate to the **Holograms** folder.
* Drag and drop the **CustomSpatialMapping** prefab onto the **Hierarchy**.
* In the **Project panel** navigate to the **Scripts** folder.
* Double-click the **AppStateManager** script to open it in Visual Studio.
* Replace the contents with the code below.

```cs
using UnityEngine;
using Academy.HoloToolkit.Unity;

/// <summary>
/// Keeps track of the current state of the experience.
/// </summary>
public class AppStateManager : Singleton<AppStateManager>
{
    /// <summary>
    /// Enum to track progress through the experience.
    /// </summary>
    public enum AppState
    {
        Starting = 0,
        PickingAvatar,
        WaitingForAnchor,
        WaitingForStageTransform,
        Ready
    }

    // The object to call to make a projectile.
    GameObject shootHandler = null;

    /// <summary>
    /// Tracks the current state in the experience.
    /// </summary>
    public AppState CurrentAppState { get; set; }

    void Start()
    {
        // The shootHandler shoots projectiles.
        if (GetComponent<ProjectileLauncher>() != null)
        {
            shootHandler = GetComponent<ProjectileLauncher>().gameObject;
        }

        // We start in the 'picking avatar' mode.
        CurrentAppState = AppState.PickingAvatar;

        // Spatial mapping should be disabled when we start up so as not
        // to distract from the avatar picking.
        SpatialMappingManager.Instance.StopObserver();
        SpatialMappingManager.Instance.gameObject.SetActive(false);

        // On device we start by showing the avatar picker.
        PlayerAvatarStore.Instance.SpawnAvatarPicker();
    }

    public void ResetStage()
    {
        // If we fall back to waiting for anchor, everything needed to
        // get us into setting the target transform state will be setup.
        if (CurrentAppState != AppState.PickingAvatar)
        {
            CurrentAppState = AppState.WaitingForAnchor;
        }

        // Reset the underworld.
        if (UnderworldBase.Instance)
        {
            UnderworldBase.Instance.ResetUnderworld();
        }
    }

    void Update()
    {
        switch (CurrentAppState)
        {
            case AppState.PickingAvatar:
                // Avatar picking is done when the avatar picker has been dismissed.
                if (PlayerAvatarStore.Instance.PickerActive == false)
                {
                    CurrentAppState = AppState.WaitingForAnchor;
                }
                break;
            case AppState.WaitingForAnchor:
                // Once the anchor is established we need to run spatial mapping for a
                // little while to build up some meshes.
                if (ImportExportAnchorManager.Instance.AnchorEstablished)
                {
                    CurrentAppState = AppState.WaitingForStageTransform;
                    GestureManager.Instance.OverrideFocusedObject = HologramPlacement.Instance.gameObject;

                    SpatialMappingManager.Instance.gameObject.SetActive(true);
                    SpatialMappingManager.Instance.DrawVisualMeshes = true;
                    SpatialMappingDeformation.Instance.ResetGlobalRendering();
                    SpatialMappingManager.Instance.StartObserver();
                }
                break;
            case AppState.WaitingForStageTransform:
                // Now if we have the stage transform we are ready to go.
                if (HologramPlacement.Instance.GotTransform)
                {
                    CurrentAppState = AppState.Ready;
                    GestureManager.Instance.OverrideFocusedObject = shootHandler;
                }
                break;
        }
    }
}
```

* In the **Project panel** navigate to the **Scripts** folder.
* Double-click the **HologramPlacement** script to open it in Visual Studio.
* Replace the contents with the code below.

```cs
using UnityEngine;
using System.Collections.Generic;
using UnityEngine.Windows.Speech;
using Academy.HoloToolkit.Unity;
using Academy.HoloToolkit.Sharing;

public class HologramPlacement : Singleton<HologramPlacement>
{
    /// <summary>
    /// Tracks if we have been sent a transform for the model.
    /// The model is rendered relative to the actual anchor.
    /// </summary>
    public bool GotTransform { get; private set; }

    /// <summary>
    /// When the experience starts, we disable all of the rendering of the model.
    /// </summary>
    List<MeshRenderer> disabledRenderers = new List<MeshRenderer>();

    /// <summary>
    /// We use a voice command to enable moving the target.
    /// </summary>
    KeywordRecognizer keywordRecognizer;

    void Start()
    {
        // When we first start, we need to disable the model to avoid it obstructing the user picking a hat.
        DisableModel();

        // We care about getting updates for the model transform.
        CustomMessages.Instance.MessageHandlers[CustomMessages.TestMessageID.StageTransform] = this.OnStageTransform;

        // And when a new user join we will send the model transform we have.
        SharingSessionTracker.Instance.SessionJoined += Instance_SessionJoined;

        // And if the users want to reset the stage transform.
        CustomMessages.Instance.MessageHandlers[CustomMessages.TestMessageID.ResetStage] = this.OnResetStage;

        // Setup a keyword recognizer to enable resetting the target location.
        List<string> keywords = new List<string>();
        keywords.Add("Reset Target");
        keywordRecognizer = new KeywordRecognizer(keywords.ToArray());
        keywordRecognizer.OnPhraseRecognized += KeywordRecognizer_OnPhraseRecognized;
        keywordRecognizer.Start();
    }

    /// <summary>
    /// When the keyword recognizer hears a command this will be called.  
    /// In this case we only have one keyword, which will re-enable moving the
    /// target.
    /// </summary>
    /// <param name="args">information to help route the voice command.</param>
    private void KeywordRecognizer_OnPhraseRecognized(PhraseRecognizedEventArgs args)
    {
        ResetStage();
    }

    /// <summary>
    /// Resets the stage transform, so users can place the target again.
    /// </summary>
    public void ResetStage()
    {
        GotTransform = false;

        // AppStateManager needs to know about this so that
        // the right objects get input routed to them.
        AppStateManager.Instance.ResetStage();

        // Other devices in the experience need to know about this as well.
        CustomMessages.Instance.SendResetStage();

        // And we need to reset the object to its start animation state.
        GetComponent<EnergyHubBase>().ResetAnimation();
    }

    /// <summary>
    /// When a new user joins we want to send them the relative transform for the model if we have it.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    private void Instance_SessionJoined(object sender, SharingSessionTracker.SessionJoinedEventArgs e)
    {
        if (GotTransform)
        {
            CustomMessages.Instance.SendStageTransform(transform.localPosition, transform.localRotation);
        }
    }

    /// <summary>
    /// Turns off all renderers for the model.
    /// </summary>
    void DisableModel()
    {
        foreach (MeshRenderer renderer in gameObject.GetComponentsInChildren<MeshRenderer>())
        {
            if (renderer.enabled)
            {
                renderer.enabled = false;
                disabledRenderers.Add(renderer);
            }
        }

        foreach (MeshCollider collider in gameObject.GetComponentsInChildren<MeshCollider>())
        {
            collider.enabled = false;
        }
    }

    /// <summary>
    /// Turns on all renderers that were disabled.
    /// </summary>
    void EnableModel()
    {
        foreach (MeshRenderer renderer in disabledRenderers)
        {
            renderer.enabled = true;
        }

        foreach (MeshCollider collider in gameObject.GetComponentsInChildren<MeshCollider>())
        {
            collider.enabled = true;
        }

        disabledRenderers.Clear();
    }


    void Update()
    {
        // Wait till users pick an avatar to enable renderers.
        if (disabledRenderers.Count > 0)
        {
            if (!PlayerAvatarStore.Instance.PickerActive &&
            ImportExportAnchorManager.Instance.AnchorEstablished)
            {
                // After which we want to start rendering.
                EnableModel();

                // And if we've already been sent the relative transform, we will use it.
                if (GotTransform)
                {
                    // This triggers the animation sequence for the model and
                    // puts the cool materials on the model.
                    GetComponent<EnergyHubBase>().SendMessage("OnSelect");
                }
            }
        }
        else if (GotTransform == false)
        {
            transform.position = Vector3.Lerp(transform.position, ProposeTransformPosition(), 0.2f);
        }
    }

    Vector3 ProposeTransformPosition()
    {
        Vector3 retval;
        // We need to know how many users are in the experience with good transforms.
        Vector3 cumulatedPosition = Camera.main.transform.position;
        int playerCount = 1;
        foreach (RemotePlayerManager.RemoteHeadInfo remoteHead in RemotePlayerManager.Instance.remoteHeadInfos)
        {
            if (remoteHead.Anchored && remoteHead.Active)
            {
                playerCount++;
                cumulatedPosition += remoteHead.HeadObject.transform.position;
            }
        }

        // If we have more than one player ...
        if (playerCount > 1)
        {
            // Put the transform in between the players.
            retval = cumulatedPosition / playerCount;
            RaycastHit hitInfo;

            // And try to put the transform on a surface below the midpoint of the players.
            if (Physics.Raycast(retval, Vector3.down, out hitInfo, 5, SpatialMappingManager.Instance.LayerMask))
            {
                retval = hitInfo.point;
            }
        }
        // If we are the only player, have the model act as the 'cursor' ...
        else
        {
            // We prefer to put the model on a real world surface.
            RaycastHit hitInfo;

            if (Physics.Raycast(Camera.main.transform.position, Camera.main.transform.forward, out hitInfo, 30, SpatialMappingManager.Instance.LayerMask))
            {
                retval = hitInfo.point;
            }
            else
            {
                // But if we don't have a ray that intersects the real world, just put the model 2m in
                // front of the user.
                retval = Camera.main.transform.position + Camera.main.transform.forward * 2;
            }
        }
        return retval;
    }

    public void OnSelect()
    {
        // Note that we have a transform.
        GotTransform = true;

        // And send it to our friends.
        CustomMessages.Instance.SendStageTransform(transform.localPosition, transform.localRotation);
    }

    /// <summary>
    /// When a remote system has a transform for us, we'll get it here.
    /// </summary>
    /// <param name="msg"></param>
    void OnStageTransform(NetworkInMessage msg)
    {
        // We read the user ID but we don't use it here.
        msg.ReadInt64();

        transform.localPosition = CustomMessages.Instance.ReadVector3(msg);
        transform.localRotation = CustomMessages.Instance.ReadQuaternion(msg);

        // The first time, we'll want to send the message to the model to do its animation and
        // swap its materials.
        if (disabledRenderers.Count == 0 && GotTransform == false)
        {
            GetComponent<EnergyHubBase>().SendMessage("OnSelect");
        }

        GotTransform = true;
    }

    /// <summary>
    /// When a remote system has a transform for us, we'll get it here.
    /// </summary>
    void OnResetStage(NetworkInMessage msg)
    {
        GotTransform = false;

        GetComponent<EnergyHubBase>().ResetAnimation();
        AppStateManager.Instance.ResetStage();
    }
}
```

**Deploy and enjoy**

* Build and deploy the project to your HoloLens devices.
* When the app is ready, stand in a circle and notice how the EnergyHub appears in the center of everyone.
* Tap to place the EnergyHub.
* Try the voice command 'Reset Target' to pick the EnergyHub back up and work together as a group to move the hologram to a new location.

## Chapter 6 - Real-World Physics

>[!VIDEO https://www.youtube.com/embed/XNpQVSyXwMo]

In this chapter we'll add holograms that bounce off real-world surfaces. Watch your space fill up with projects launched by both you and your friends!

### Objectives

* Launch projectiles that bounce off real-world surfaces.
* Share the projectiles so other players can see them.

### Instructions

* In the **Hierarchy** select the **HologramCollection** object.
* In the **Inspector** click **Add Component**.
* In the search box, type **Projectile Launcher**. Select the search result.

**Deploy and enjoy**

* Build and deploy to your HoloLens devices.
* When the app is running on all devices, perform an air-tap to launch projectile at real world surfaces.
* See what happens when your projectile collides with another player's avatar!

## Chapter 7 - Grand Finale

>[!VIDEO https://www.youtube.com/embed/kDUPUvZEqRg]

In this chapter, we'll uncover a portal that can only be discovered with collaboration.

### Objectives

* Work together to launch enough projectiles at the anchor to uncover a secret portal!

### Instructions

* In the **Project panel** navigate to the **Holograms** folder.
* Drag and drop the **Underworld** asset as a **child of HologramCollection**.
* With **HologramCollection** selected, click the **Add Component** button in the **Inspector**.
* In the menu, type in the search box **ExplodeTarget**. Select the search result.
* With **HologramCollection** selected, from the **Hierarchy** drag the **EnergyHub** object to the **Target** field in the **Inspector**.
* With **HologramCollection** selected, from the **Hierarchy** drag the **Underworld** object to the **Underworld** field in the **Inspector**.

**Deploy and enjoy**

* Build and deploy to your HoloLens devices.
* When the app has launched, collaborate together to launch projectiles at the EnergyHub.
* When the underworld appears, launch projectiles at underworld robots (hit a robot three times for extra fun).
---
title: MR Sharing 250 - HoloLens and immersive headsets
description: Follow this coding walkthrough using Unity, Visual Studio, HoloLens, and Windows Mixed Reality headsets to learn the details of sharing holograms between mixed reality devices.
author: keveleigh
ms.author: kurtie
ms.date: 10/22/2019
ms.topic: article
keywords: holotoolkit, mixedrealitytoolkit, mixedrealitytoolkit-unity, immersive, motion controller, sharing, xbox controller, networking, cross-device
---

# MR Sharing 250: HoloLens and immersive headsets

>[!NOTE]
>The Mixed Reality Academy tutorials were designed with HoloLens (1st gen) and Mixed Reality Immersive Headsets in mind.  As such, we feel it is important to leave these tutorials in place for developers who are still looking for guidance in developing for those devices.  These tutorials will **_not_** be updated with the latest toolsets or interactions being used for HoloLens 2.  They will be maintained to continue working on the supported devices. [A new series of tutorials](/learn/paths/beginner-hololens-2-tutorials/) has been posted for HoloLens 2.

With the flexibility of Universal Windows Platform (UWP), it is easy to create an application that spans multiple devices. With this flexibility, we can create experiences that leverage the strengths of each device. This tutorial will cover a basic shared experience that runs on both HoloLens and Windows Mixed Reality immersive headsets. This content was originally delivered at the Microsoft Build 2017 conference in Seattle, WA.

**In this tutorial, we will:**

* Setup a network using UNET.
* Share holograms across mixed reality devices.
* Establish a different view of the application depending on which mixed reality device is being used.
* Create a shared experience where HoloLens users guide immersive headsets users through some simple puzzles.

## Device support

<table>
<tr>
<th>Course</th><th> <a href="/hololens/hololens1-hardware">HoloLens</a></th><th> <a href="/windows/mixed-reality/enthusiast-guide/immersive-headset-hardware-details">Immersive headsets</a></th>
</tr><tr>
<td>MR Sharing 250: HoloLens and immersive headsets</td><td> ✔️</td><td> ✔️</td>
</tr>
</table>

## Before you start

### Prerequisites

* A Windows 10 PC with the [necessary development tools](../develop/install-the-tools.md) and [configured to support a Windows Mixed Reality immersive headset](/windows/mixed-reality/enthusiast-guide/windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines).
* An Xbox controller that works with your PC.
* At least one HoloLens device and one immersive headset.
* A network which allows UDP Broadcast for discovery.

### Project files

* Download the [files](https://github.com/Microsoft/MixedReality250/archive/master.zip) required by the project. Extract the files to an easy to remember location.
* This project requires the [a recommended version of Unity with Windows Mixed Reality support](../develop/install-the-tools.md).

>[!NOTE]
>If you want to look through the source code before downloading, it's [available on GitHub](https://github.com/Microsoft/MixedReality250).

## Chapter 1 - Holo World

>[!VIDEO https://www.youtube.com/embed/IC0rp6rLiEc]

### Objectives

Make sure the development environment is ready to go with a simple project.

### What we will build

An application that shows a hologram on either HoloLens or a Windows Mixed Reality immersive headset.

### Steps

* Open Unity.
    * Select **Open**.
    * Navigate to where you extracted the project files.
    * Click **Select Folder**.
    * *It will take a little while for Unity to process the project the first time.*
* Check that Mixed Reality is enabled in Unity.
    * Open the build settings dialog (**Control+Shift+B** or **File > Build Settings...**).
    * Select **Universal Windows Platform** then click **Switch Platform**.
    * Select **Edit>Player Settings**.
    * In the **Inspector** panel on the right hand side, expand **XR Settings**.
    * Check the **Virtual Reality Supported** box.
    * *Windows Mixed Reality should be the Virtual Reality SDK.*
* Create a scene.
    * In the **Hierarchy** right click **Main Camera** select **Delete**.
    * From **HoloToolkit > Input > Prefabs** drag **MixedRealityCameraParent** to the **Hierarchy**.
* Add Holograms to the scene
    * From **AppPrefabs** drag **Skybox** to the **Scene View**.
    * From **AppPrefabs** drag **Managers** to the **Hierarchy**.
    * From **AppPrefabs** drag **Island** to the **Hierarchy**.
* Save And build
    * Save (either **Control+S** or **File > Save Scene**)
    * Since this is a new scene, you'll need to name it. Name doesn't matter, but we use SharedMixedReality.
* Export To Visual Studio
    * Open the build menu (**Control+Shift+B** or **File > Build Settings**)
    * Click **Add Open Scenes.**
    * Check **Unity C# Projects**
    * Click **Build**.
    * In the file explorer window that appears, create a New Folder named **App**.
    * Single click the **App** folder.
    * Press **Select Folder.**
    * **Wait for the build to complete**
    * In the file explorer window that appears, navigate into the **App** folder.
    * Double-click **SharedMixedReality.sln** to launch Visual Studio
* Build From Visual Studio
    * Using the top toolbar change target to **Release** and **x86**.
    * Click the arrow next to **Local Machine** and select **Device** to deploy to HoloLens
    * Click the arrow next to **Device** and select **Local Machine** to deploy for the mixed reality headset.
    * Click **Debug->Start Without Debugging** or **Control+F5** to start the application.

### Digging into the code

In the project panel, navigate to **Assets\HoloToolkit\Input\Scripts\Utilities** and double click **MixedRealityCameraManager.cs** to open it.

**Overview:** MixedRealityCameraManager.cs is a simple script that adjusts quality level and background settings based on the device. Key here is HolographicSettings.IsDisplayOpaque, which allows a script to detect if the device is a HoloLens (IsDisplayOpaque returns false) or an immersive headset (IsDisplayOpaque returns true).

### Enjoy your progress

At this point the application will just render a hologram. We will add interaction to the hologram later. Both devices will render the hologram the same. The immersive headset will also render a blue sky and clouds background.

## Chapter 2 - Interaction

>[!VIDEO https://www.youtube.com/embed/Lrb1y4sQRvI]

### Objectives

Show how to handle input for a Windows Mixed Reality application.

### What we will build

Building on the application from chapter 1, we will add functionality to allow the user to pick up the hologram and place it on a real world surface in HoloLens or on a virtual table in an immersive headset.

**Input Refresher:** On HoloLens the select gesture is the **air tap**. On immersive headsets, we will use the **A** button on the Xbox controller. For more information check out the [interaction model overview](../design/interaction-fundamentals.md).

### Steps

* Add Input manager
    * From **HoloToolkit > Input > Prefabs** drag **InputManager** to **Hierarchy** as a child of **Managers**.
    * From **HoloToolkit > Input > Prefabs > Cursor** drag **Cursor** to **Hierarchy**.
* Add Spatial Mapping
    * From **HoloToolkit > SpatialMapping > Prefabs** drag **SpatialMapping** to **Hierarchy**.
* Add Virtual Playspace
    * In **Hierarchy** expand **MixedRealityCameraParent** select **Boundary**
    * In **Inspector** panel check the box to enable **Boundary**
    * From **AppPrefabs** drag **VRRoom** to **Hierarchy**.
* Add WorldAnchorManager
    * In **Hierarchy**, Select **Managers**.
    * In **Inspector**, click **Add Component**.
    * Type **World Anchor Manager**.
    * Select **World Anchor Manager** to add it.
* Add TapToPlace to the Island
    * In **Hierarchy**, expand **Island**.
    * Select **MixedRealityLand**.
    * In **Inspector**, click **Add Component**.
    * Type **Tap To Place** and select it.
    * Check **Place Parent On Tap**.
    * Set **Placement Offset** to **(0, 0.1, 0)**.
* Save and Build as before

### Digging into the code

**Script 1 - GamepadInput.cs**

In the project panel navigate to **Assets\HoloToolkit\Input\Scripts\InputSources** and double click **GamepadInput.cs** to open it. From the same path in the project panel, also double click **InteractionSourceInputSource.cs**.

Note that both scripts have a common base class, BaseInputSource.

BaseInputSource keeps a reference to an InputManager, which allows a script to trigger events. In this case, the InputClicked event is relevant. This will be important to remember when we get to script 2, TapToPlace. In the case of GamePadInput, we poll for the A button on the controller to be pressed, then we raise the InputClicked event. In the case of InteractionSourceInputSource, we raise the InputClicked event in response to the TappedEvent.

**Script 2 - TapToPlace.cs**

In the project panel navigate to **Assets\HoloToolkit\SpatialMapping\Scripts** and double click **TapToPlace.cs** to open it.

The first thing many developers want to implement when creating a Holographic application is moving Holograms with gesture input. As such, we've endeavored to thoroughly comment this script. A few things are worth highlighting for this tutorial.

First, note that TapToPlace implements IInputClickHandler. IInputClickHandler exposes the functions that handle the InputClicked event raised by GamePadInput.cs or InteractionSourceInputSource.cs. OnInputClicked is called when a BaseInputSource detects a click while the object with TapToPlace is in focus. Either airtapping on HoloLens or pressing the A button on the Xbox controller will trigger the event.

Second is the code be executed in update to see if a surface is being looked at so we can place the game object on a surface, like a table. The immersive headset doesn't have a concept of real surfaces, so the object that represents the table top (Vroom > TableThingy > Cube) has been marked with the SpatialMapping physics layer, so the ray cast in Update will collide with the virtual table top.

### Enjoy your progress

This time you can select the island to move it. On HoloLens you can move the island to a real surface. In the immersive headset you can move the island to the virtual table we added.

## Chapter 3 - Sharing

>[!VIDEO https://www.youtube.com/embed/1diycJvxfDc]

### Objectives

Ensure that the network is correctly configured and detail how spatial anchors are shared between devices.

### What we will build

We will convert our project to a multiplayer project. We will add UI and logic to host or join sessions. HoloLens users will see each other in the session with clouds over their heads, and immersive headset users have clouds near to where the anchor is. Users in the immersive headsets will see the HoloLens users relative to the origin of the scene. HoloLens users will all see the hologram of the island in the same place. It is key to note that the users in the immersive headsets will not be on the island during this chapter, but will behave very similarly to HoloLens, with a birds eye view of the island.

### Steps

* Remove Island and VRRoom
    * In **Hierarchy** right-click **Island** select **Delete**
    * In **Hierarchy** right-click **VRRoom** select **Delete**
* Add Usland
    * From **AppPrefabs** drag **Usland** to **Hierarchy**.
* From **AppPrefabs** drag each of the following to **Hierarchy**:
    * **UNETSharingStage**
    * **UNetAnchorRoot**
    * **UIContainer**
    * **DebugPanelButton**
* Save and Build as before

### Digging into the code

In the project panel, navigate to **Assets\AppPrefabs\Support\SharingWithUnet\Scripts** and double-click on **UnetAnchorManager.cs**. The ability for one HoloLens to share tracking information with another HoloLens such that both devices can share the same space is near magical. The power of mixed reality comes alive when two or more people can collaborate using the same digital data.

A few things to point out in this script:

In the start function, notice the check for **IsDisplayOpaque**. In this case, we pretend that the Anchor is established. This is because the immersive headsets do not expose a way to import or export anchors. If we are running on a HoloLens, however, this script implements sharing anchors between the devices. The device that starts the session will create an anchor for exporting. The device that joins a session will request the anchor from the device that started the session.

**Exporting:**

When a user creates a session, NetworkDiscoveryWithAnchors will call UNETAnchorManagers CreateAnchor function. Let's follow CreateAnchor flow.

We start by doing some housekeeping, clearing out any data we may have collected for previous anchors. Then we check if there is a cached anchor to load. The anchor data tends to be between 5 and 20 MB, so reusing cached anchors can save on the amount of data we need to transfer over the network. We'll see how this works a bit later. Even if we are reusing the anchor, we need to get the anchor data ready in case a new client joins that doesn't have the anchor.

Speaking of getting the anchor data ready, the WorldAnchorTransferBatch class exposes the functionality to prepare anchor data for sending to another device or application and the functionality to import the anchor data. Since we're on the export path, we will add our anchor to the WorldAnchorTransferBatch and call the ExportAsync function. ExportAsync will then call the WriteBuffer callback as it generates data for export. When all of the data has been exported ExportComplete will be called. In WriteBuffer we add the chunk of data to a list we keep for exporting. In ExportComplete we convert the list to an array. The AnchorName variable is also set, which will trigger other devices to request the anchor if they don't have it.

In some cases the anchor won't export or will create so little data that we will try again. Here we just call CreateAnchor again.

A final function in the export path is AnchorFoundRemotely. When another device finds the anchor, that device will tell the host, and the host will use that as a signal that the anchor is a "good anchor" and can be cached.

**Importing:**

When a HoloLens joins a session, it needs to import an anchor. In UNETAnchorManager's Update function, the AnchorName is polled. When the anchor name changes, the import process begins. First, we try to load the anchor with the specified name from the local anchor store. If we already have it, we can use it without downloading the data again. If we don't have it, then we call WaitForAnchor which will initiate the download.

When the download is completed, NetworkTransmitter_dataReadyEvent is called. This will signal the Update loop to call ImportAsync with the downloaded data. ImportAsync will call ImportComplete when the import process is complete. If the import is successful, the anchor will be saved in the local player store. PlayerController.cs actually makes the call to AnchorFoundRemotely to let the host know that a good anchor has been established.

### Enjoy your progress

This time a user with a HoloLens will host a session using the **start session** button in the UI. Other users, both on HoloLens or an immersive headset, will select the session and then select the **join session** button in the UI. If you have multiple people with HoloLens devices, they will have red clouds over their heads. There will also be a blue cloud for each immersive headset, but the blue clouds will not be above the headsets, as the headsets are not trying to find the same world coordinate space as the HoloLens devices.

This point in the project is a contained sharing application; it doesn't do very much, and could act as a baseline. In the next chapters, we will start building an experience for people to enjoy. To get further guidance on shared experience design, go here.

## Chapter 4 - Immersion and teleporting

>[!VIDEO https://www.youtube.com/embed/kUHZ5tCOfvY]

### Objectives

Cater the experience to each type of mixed reality device.

### What we will build

We will update the application to put immersive headset users on the island with an immersive view. HoloLens users will still have the bird's eye view of the island. Users of each device type can see other users as they appear in the world. For instance, immersive headset users can see the other avatars on other paths on the island, and they see the HoloLens users as giant clouds above the island. Immersive headset users will also see the cursor of the HoloLens user's gaze ray if the HoloLens user is looking at the island. HoloLens users will see an avatar on the island to represent each immersive headset user.

**Updated Input for the Immersive device:**

* The left bumper and right bumper buttons on the Xbox controller rotate the player
* Holding the Y button on the Xbox controller will enable a [teleport](../discover/navigating-the-windows-mixed-reality-home.md#getting-around-your-home) cursor. If the cursor has a spinning arrow indicator when you release the Y button, you will be teleported to the cursor's location.

### Steps

* Add MixedRealityTeleport to MixedRealityCameraParent
    * In **Hierarchy**, select **Usland**.
    * In **Inspector**, enable **Level Control**.
    * In **Hierarchy**, select **MixedRealityCameraParent**.
    * In **Inspector**, click **Add Component**.
    * Type **Mixed Reality Teleport** and select it.

### Digging into the code

Immersive headset users will be tethered to their PCs with a cable, but our island is larger than the cable is long. To compensate, we need the ability to move the camera independently of the user's motion. Please see the [comfort page](../design/comfort.md) for more information about designing your mixed reality application (in particular self motion and locomotion).

In order to describe this process it will be useful to define two terms. First, **dolly** will be the object that moves the camera independently from the user. A child game object of the **dolly** will be the **main camera**. The main camera is attached to the user's head.

In the project panel, navigate to **Assets\AppPrefabs\Support\Scripts\GameLogic** and double-click on **MixedRealityTeleport.cs**.

MixedRealityTeleport has two jobs. First, it handles rotation using the bumpers. In the update function we poll for 'ButtonUp' on LeftBumper and RightBumper. GetButtonUp only returns true on the first frame a button is up after having been down. If either button had been raised, then we know the user needs to rotate.

When we rotate we do a fade out and fade in using a simple script called 'fade control'. We do this to prevent the user from seeing an unnatural movement which could lead to discomfort. The fade in and out effect is fairly simple. We have a black quad hanging in front of the **main camera**. When fading out we transition the alpha value from 0 to 1. This gradually causes the black pixels of the quad to render and obscure anything behind them. When fading back in we transition the alpha value back to zero.

When we calculate the rotation, note that we are rotating our **dolly** but calculating the rotation around the **main camera**. This is important as the farther the **main camera** is away from 0,0,0, the less accurate a rotation around the dolly would become from the point of view of the user. In fact, if you do not rotate around the camera position, the user will move on an arc around the **dolly** rather than rotating.

The second job for MixedRealityTeleport is to handle moving the **dolly**. This is done in SetWorldPosition. SetWorldPosition takes the desired world position, the position where the user wants to percieve that they inhabit. We need to put our **dolly** at that position minus the local position of the **main camera**, as that offset will be added each frame.

A second script calls SetWorldPosition. Let's look at that script. In the project panel, navigate to **Assets\AppPrefabs\Support\Scripts\GameLogic** and double-click on **TeleportScript.cs**.

This script is a little more involved than MixedRealityTeleport. The script is checking for the Y Button on the Xbox controller to be held down. While the button is held down a teleport cursor is rendered and the script casts a ray from the user's gaze position. If that ray collides with a surface that is more or less pointing up, the surface will be considered a good surface to teleport to, and the animation on the teleport cursor will be enabled. If the ray does not collide with a surface more or less pointing up, then the animation on the cursor will be disabled. When the Y button is released and the calculated point of the ray is a valid position, the script calls SetWorldPosition with the position the ray intersected.

### Enjoy your progress

This time you'll need to find a friend.

Once again, a user with the HoloLens will host a session. Other users will join the session. The application will place the first three users to join from an immersive headset on one of the three paths on the island. Feel free to explore the island in this section.

Details to notice:

1. You can see faces in the clouds, which helps an immersed user see which direction a HoloLens user is looking.
2. The avatars on the island have necks that rotate. They won't follow what the user is doing is real reality (we don't have that information) but it makes for a nice experience.
3. If the HoloLens user is looking at the Island, the immersed users can see their cursor.
4. The clouds that represent the HoloLens users cast shadows.

## Chapter 5 - Finale

>[!VIDEO https://www.youtube.com/embed/n_HDWJbfpNg]

### Objectives

Create a collaborative interactive experience between the two device types.

### What we will build

Building on chapter 4, when a user with an immersive headset gets near a puzzle on the island, the HoloLens users will get a tool tip with a clue to the puzzle. Once all of the immersive headset users get past their puzzles and onto the "ready pad" in the rocket room, the rocket will launch.

### Steps

* In **Hierarchy**, select **Usland**.
* In **Inspector**, in **Level Control**, check **Enable Collaboration**.

### Digging into the code

Now let us look at LevelControl.cs. This script is the core of the game logic and maintains the game state. Since this is a multiplayer game using UNET we need to understand how data flows, at least well enough to modify this tutorial. For a more complete overview of UNET, please refer to Unity's documentation.

In the project panel, navigate to **Assets\AppPrefabs\Support\Scripts\GameLogic** and double-click on **LevelControl.cs**.

Let us understand how an immersive headset indicates that they are ready for the rocket launch. Rocket Launch readiness is communicated by setting one of three bools in a list of bools that correspond to the three paths on the island. A path's bool will be set when the user assigned to the path is on top of the brown pad inside the rocket room. Okay, now to the details.

We will start in the Update() function. You will note that there is a 'cheat' function. We used this in development to test the rocket launch and reset sequence. It won't work in the multi user experience. Hopefully by the time you internalize the following infromation you can make it work. After we check to see if we should cheat, we check to see if the local player is immersed. We want to focus on how we find that we're at the goal. Inside of the if (Immersed) check, there is a call to CheckGoal hiding behind the **EnableCollaboration** bool. This corresponds to the checkbox you checked while completing the steps for this chapter. Inside of EnableCollaboration we see a call to CheckGoal().

CheckGoal does some math to see if we are more or less standing on the pad. When we are, we Debug.Log "Arrived at goal" and then we call 'SendAtGoalMessage()'. In SendAtGoalMessage we call playerController.SendAtGoal. To save you some time, here's the code:

```cs
private void CmdSendAtGoal(int GoalIndex)
{
    levelState.SetGoalIndex(GoalIndex);
}
```

```cs
public void SendAtGoal(int GoalIndex)
{
    if (isLocalPlayer)
    {
        Debug.Log("sending at goal " + GoalIndex);
        CmdSendAtGoal(GoalIndex);
    }
}
```

Note that SendAtGoalMessage calls CmdSendAtGoal, which calls levelState.SetGoalIndex, which is back in LevelControl.cs. At first glance this seems strange. Why not just call SetGoalIndex rather than this strange routing through the player controller? The reason is that we are conforming to the data model UNET uses to keep data in sync. To prevent cheating and thrashing, UNET requires that each object has a user who has authority to change the synchronized variables. Further, only the host (the user that started the session) can change data directly. Users who are not the host, but have authority, need to send a 'command' to the host which will change the variable. By default the host has authority over all objects, except for the object spawned to represent the user. In our case this object has the playercontroller script. There is a way to request authority for an object and then make changes, but we choose to leverage the fact that the player controller has self authority and route commands through the player controller.

Said another way, when we've found ourselves at our goal, the player needs to tell the host, and the host will tell everyone else.

Back in LevelControl.cs look at SetGoalIndex. Here we are setting the value of a value in a synclist (AtGoal). Remember that we are in the context of the host while we do this. Similar to a command, an RPC is something the host can issue that will cause all clients to run some code. Here we call 'RpcCheckAllGoals'. Each client will individually check to see if all three AtGoals are set, and if so, launch the rocket.

### Enjoy your progress

Building on the previous chapter, we will start the session as before. This time as the users in the immersive headset get to the "door" on their path, a tooltip will appear that only the HoloLens users can see. The HoloLens users are responsible for communicating this clue to the users in the immersive headset. The rocket will launch to space once each avatar has stepped on its corresponding brown pad inside the volcano. The scene will reset after 60 seconds so you can do it again.

## See also

* [MR Input 213: Motion controllers](mixed-reality-213.md)
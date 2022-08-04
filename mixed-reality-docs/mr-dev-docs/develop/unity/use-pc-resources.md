---
title: Use PC resources to power your app with Holographic Remoting remote app
description: Use PC resources, instead of relying on the on-board processing power of the HoloLens, to power your app with Holographic Remoting
author: vtieto
ms.author: vinnietieto
ms.date: 08/04/2022
ms.topic: article
keywords: openxr, unity, hololens, hololens 2, mixed reality, MRTK, Mixed Reality Toolkit, augmented reality, virtual reality, mixed reality headsets, learn, tutorial, getting started, holographic remoting, desktop, preview, debug
---

# Use PC resources to power your app with Holographic Remoting remote app

This article explains the following use case for Holographic Remoting:

-  **You want the resources of a PC to power your app instead of relying on the HoloLens on-board resources**: You can create and build an app that has Holographic Remoting capability. The user experiences the app on the HoloLens, but the app actually runs on a PC, which allows the app to take advantage of the PC's more powerful resources. This can be especially helpful if your app has high-resolution assets or models and you don't want the frame rate to suffer. We call this a _Holographic Remoting remote app_. Inputs from the HoloLens--gaze, gesture, voice, and spatial mapping--are sent to the PC, where the content is rendered in a virtual immersive view. The rendered frames are then sent to the HoloLens.

This type of Holographic Remoting is also available for Windows Mixed Reality (WMR) immersive headsets. This could be useful if, for example, your WMR headset is connected to a backpack PC and you wish to stream your app from a more powerful PC to the backpack PC.

To learn more about Holographic Remoting, see [Holographic Remoting Overview](../native/holographic-remoting-overview.md)

Note that you can also use Holographic Remoting if [you want to preview and debug your app during the development process](preview-and-debug-your-app.md).

## Two modes in Holographic Remoting are available

|Mode   |Remote App running on PC        | Holographic Remoting player app running on HoloLens 2|
|-------|--------------------------------|------------------------------------------------------|
|Mode 1 |Connect mode                    |   Listen mode                                        |
|Mode 2 |Listen mode                     |   Connect mode                                       |



## Set up the Holographic Remoting Player app

To use Holographic Remoting in Mode 1 alone, install the [Holographic Remoting Player](../native/holographic-remoting-player.md) app from the Microsoft Store on your HoloLens 2 (in this article, we'll refer to it simply as "the Player"). As explained below, after you download and run the app, you'll see the version number and IP address to connect to. **We recommend using the latest version of the Player available**.

Holographic Remoting requires a fast PC and Wi-Fi connection. You can find more details in the Player article linked above.

![Screenshot of the Holographic Remoting Player running in the HoloLens](images/openxr-features-img-01.png)

To use Holographic Remoting in both modes specified above, you need to clone [Holographic Remoting Sample player](https://github.com/microsoft/MixedReality-HolographicRemoting-Samples/blob/main/player/sample/SamplePlayer.sln) and deploy it to the HoloLens 2 using Visual Studio.

## Build a remote app running on PC for Holographic Remoting using Unity

1. On the menu bar, select **Edit > Project Settings**.
1. In the left-side column, select **XR plug-in Management**.
1. Ensure that you're in the **Universal Windows Platform settings** tab.

    ![Screenshot that shows the XR-Plug in Management window with the Universal Windows Platform tab selected.](images/038-uwp-tab.png)

1. In the **OpenXR** plug-in section, select **Microsoft HoloLens feature group** and **Holographic Remoting remote app feature group**.

    ![Screenshot that shows the OpenXr plug-in with "Microsoft HoloLens feature group" and "Holographic Remoting remote app feature group" selected.](images/039-select-holo-remoting.png)

1. Unselect the **Initialize XR on Startup** check box.

    ![Screenshot of the XR Plug-in Management window with "Initialize XR on Startup" unselected.](images/040-unselect-unit-xr.png)

1. Write some code to set the remoting configuration and trigger XR initialization. The app can either call into **Connect** function for Mode 1, or call into **Listen** function for Mode 2. To see an example, download our [Open XR Unity Mixed Reality samples](https://github.com/microsoft/OpenXR-Unity-MixedReality-Samples) and then, in the **RemotingSample** project, view the **AppRemoting.cs** script.

1. For Mode 1, the **Connect** mode, call `Microsoft.MixedReality.OpenXR.Remoting.AppRemoting.Connect` with a filled-in `RemotingConfiguration`. The sample app exposes this in the Inspector and shows how to fill in the IP address from a text field. Calling `Connect` will set the configuration and automatically initialize XR, which is why it must be called as a coroutine:

    ``` cs
    StartCoroutine(Remoting.AppRemoting.Connect(remotingConfiguration));
    ```
1. For Mode 2, the **Listen** mode, call `Microsoft.MixedReality.OpenXR.Remoting.AppRemoting.Listen` with a filled-in `RemotingListenConfiguration`. The sample app exposes this in the Inspector. Calling `Listen` will set the configuration and wait for a connection from the Holographic Remoting sample player, which is why it must be called as a coroutine:

    ``` cs
    StartCoroutine(Remoting.AppRemoting.Listen(remotingListenConfiguration));
    ```
1. While running, you can obtain the current connection state with the `AppRemoting.TryGetConnectionState` API, and optionally disconnect and de-initialize XR using `AppRemoting.Disconnect()`. This could be used to disconnect and reconnect to a different device within the same app session. The RemotingSample app provides a tappable cube which will disconnect the remoting session if tapped.

## Run the Holographic Remoting remote app and the Player app in the modes described above

### Mode 1: Run the Holographic Remoting remote app on PC in Connect Mode and the Player in Listen Mode:

1. If the Player is already installed from the store on the HoloLens 2, skip step numbers 2 and 3 below where you build and run the Sample Player app. Instead, run the installed Player and continue on with step #4.

1. Open the Holographic Remoting Sample Player app using VS 2019 and then do one of the following:

    **To run on a HoloLens 2 using a USB cable**:
    
    - Configure the build options as shown here:

    ![Screen shot of the Visual Studio build settings for if the user is connected via USB cable.](images/har-sample-player-run-sol.png)

    - Open the **Properties** page for the project, and then navigate to **Configuration Properties** > **Debugging**.
    - Click the **Debugger to launch** drop-down, and then select **Device**.
    - In the **Command Line Arguments** field, add "-listen".

    ![Screenshot of the command line arguments for building using a USB cable.](images/har-sample-player-listening.png)

    **To run on a HoloLens 2 using Wifi**:

    - Configure the build options as shown here:

    ![Screen shot of the Visual Studio build settings for if the user building to the HoloLens using Wifi.](images/041-build-settings-for-wifi.png)

    - Open the **Properties** page for the project, and then navigate to **Configuration Properties** > **Debugging**.
    - Click the **Debugger to launch** drop-down, and then select **Device**.
    - In the **Command Line Arguments** field, add "-listen".

    ![Screen shot of the Machine Name build settings for if the user building to the HoloLens using Wifi.](images/042-connect-via-wifi.png)

1. To deploy the SamplePlayer solution to the HoloLens 2, press the play button in Visual Studio. You'll be able to see the HAR Sample player running on HoloLens 2, displaying that it's "Waiting for a connection on IP address of HoloLens 2."

1. In the remote app running on the host PC, add the IP address of the HoloLens 2 displayed above and then select **Connect**.

1. After the connection is established, the Player running on HoloLens 2 will start "Receiving".

### Mode 2: Run the remote app on your PC in Listen Mode and the HAR player app in Connect Mode:

- On the 2D UI screen in the remote app running on PC, click **Listen**.

    ![Screen shot of the Visual Studio build settings for if the user is connected via USB cable.](images/har-sample-player-run-sol.png)

- Open the **Properties** page for the project, and then navigate to **Configuration Properties** > **Debugging**.
- Click the **Debugger to launch** drop-down, and then select **Device**.
- In the **Command Line Arguments** field, add the IP address of the host PC.

![Screenshot of the command line arguments for building using a USB cable.](images/har-sample-player-listening.png)

- To deploy the SamplePlayer solution to the HoloLens 2, in the Visual Studio solution, click the play button. You'll be able to see the HAR Sample player running on the HoloLens 2, displaying that it's "Connecting to IP address given in command line arguments."

- After the connection is established, the Holographic Remoting Sample Player app running on the HoloLens 2 will start "Receiving".

> [!TIP]
> For best results, make sure your app properly sets the [../focus point](focus-point-in-unity.md). This helps Holographic Remoting to best adapt your scene to the latency of your wireless connection.

## Migrate from previous Holographic Remoting APIs

To learn more about Holographic Remoting, see [Holographic Remoting Overview](../native/holographic-remoting-overview.md)

#### UnityEngine.XR.WSA.HolographicRemoting

From the sample code on [Unity's docs](https://docs.unity3d.com/2020.1/Documentation/ScriptReference/XR.WSA.HolographicRemoting.html):

| XR.WSA.HolographicRemoting | OpenXR.Remoting.AppRemoting |
| ---- | ---- |
| `HolographicRemoting.ConnectRemotingSession()` | `AppRemoting.Connect(RemotingConfiguration)` |
| `HolographicRemoting.DisconnectRemotingSession()` | `AppRemoting.Disconnect()` |
| `HolographicRemoting.ConnectionState` | `AppRemoting.TryGetConnectionState(out ConnectionState, out DisconnectReason)`|

#### Unity​Engine.​XR.​Windows​MR.WindowsMRRemoting

| XR.​Windows​MR.WindowsMRRemoting | OpenXR.Remoting.AppRemoting |
| ---- | ---- |
| `WindowsMRRemoting.Connect()` | `AppRemoting.Connect(RemotingConfiguration)` |
| `WindowsMRRemoting.Listen()`  | `AppRemoting.Listen(RemotingListenConfiguration)` |
| `WindowsMRRemoting.Disconnect()` | `AppRemoting.Disconnect()` |
| `WindowsMRRemoting.TryGetConnectionState(out ConnectionState)` and `WindowsMRRemoting.TryGetConnectionFailureReason(out ConnectionFailureReason)`| `AppRemoting.TryGetConnectionState(out ConnectionState, out DisconnectReason)`|
| `WindowsMRRemoting.isAudioEnabled`, `WindowsMRRemoting.maxBitRateKbps`, `WindowsMRRemoting.remoteMachineName` | Passed into `AppRemoting.Connect` via the `RemotingConfiguration` struct |
| `WindowsMRRemoting.isConnected` | `AppRemoting.TryGetConnectionState(out ConnectionState state, out _) && state == ConnectionState.Connected`

## See Also

* [Holographic Remoting Overview](../native/holographic-remoting-overview.md)
* [Preview and debug your app with Holographic Remoting and Play mode](preview-and-debug-your-app.md)
* [Tutorial: Getting started with PC Holographic Remoting](/learn/modules/pc-holographic-remoting-tutorials/)
* [Tutorial: Creating a Holographic Remoting PC application](/learn/modules/pc-holographic-remoting-tutorials/4-create-holographic-remoting-pc-application)
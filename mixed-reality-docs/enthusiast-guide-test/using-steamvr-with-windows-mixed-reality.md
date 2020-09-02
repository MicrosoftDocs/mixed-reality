---
title: Using SteamVR with Windows Mixed Reality
description: How to play SteamVR games on Windows Mixed Reality headsets with compatible PCs.
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, games, SteamVR, Steam, system requirements
---


# Using SteamVR with Windows Mixed Reality
Windows Mixed Reality for SteamVR allows users to run SteamVR experiences on Windows Mixed Reality immersive headsets. After installing the Windows Mixed Reality for SteamVR, users can launch their favorite SteamVR applications from their desktop or Steam library and play them directly on their Windows headset.

## Get your PC ready
* Make sure you have no pending updates: Select **Start > Settings > Update & Security > Windows Update**. If updates are available, select **Install now**. If no updates are available, select **Check for updates**, and then install any new ones. 
* PC requirements vary for the apps and content on Steam. See the minimum requirements per title. A PC with a GTX 1070 graphics card (or equivalent) and an Intel® Core™ i7 processor should offer a good experience for a broad range of titles.

## Set up Windows Mixed Reality for SteamVR
1. If you haven't already setup up [Windows Mixed Reality](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/set-up-windows-mixed-reality).
2. Install [Steam](http://store.steampowered.com/about/) and **login** or **create a new account.**
3. Install [SteamVR](https://store.steampowered.com/app/250820/SteamVR/). With your headset plugged in, launch Steam and you should see a dialog prompting you to install SteamVR. Follow the prompts on the dialog to install it. 
    * If you don't see the popup, install SteamVR by navigating to the *Tools* section of your *library*. Locate SteamVR in the list and then right click and select *Install Game*.
4. Install [Windows Mixed Reality for SteamVR](https://store.steampowered.com/app/719950/Windows_Mixed_Reality_for_SteamVR/). 

## Play SteamVR games
1. Connect your headset to your PC and turn on your motion controllers.
2. Once the Windows Mixed Reality home has loaded and your controllers are visible, open the Steam app on your desktop.
3. Use the Steam app to launch a SteamVR game from your Steam library. 

**Tip**: To launch SteamVR games without taking off your headset, use the Desktop app (**Start > Desktop**) to view and interact with your PC desktop inside Windows Mixed Reality.

## Using Motion Controllers with SteamVR
You'll use your motion controllers differently in different games. Here are a few basics to help you get started:
* To open the Steam dashboard, press straight down on the left or right thumbstick. 
* To exit a SteamVR game and return to the Windows Mixed Reality home, press the Windows button.

## Changing the resolution

You can adjust the Application Resolution slider in the SteamVR -> Settings -> Applications window at any time if you'd like to play games at a higher resolution. **Note** that when using a higher resolution multiplier you can expect the game to put more strain on your PC. If you increase the multiplier and see degraded performance readjust this slider to the default level and restart the game to ensure that the change takes effect.![Adjust Application Resolution](images/SteamVR_Settings_Applications.png)

## Using multiple headsets

If you're a VR enthusiast you might regularly use more than one VR headset on the same PC. If that's the case note that when a Windows Mixed Reality headset is plugged in, SteamVR games will always launch to the Windows Mixed Reality headset. If you'd like to launch SteamVR games on another headset make sure to first unplug the Windows Mixed Reality headset before continuing. 

## Preview programs

We release regular updates to improve the performance, reliability, and overall experience of using SteamVR on Windows Mixed Reality immersive headsets. While none of these preview programs are required, we encourage you to join them if you would like to get updates sooner and more frequently (and give us feedback on those updates!).

### Windows Mixed Reality for SteamVR Beta

Windows Mixed Reality for SteamVR is the component you install from the Steam Store that enables SteamVR to work with your Windows Mixed Reality headset.  We publish updates to this "bridge" regularly and Steam installs them automatically.

If you want to get updates more frequently, we encourage you to join our public Beta.  Updates go to our Beta audience first, and we use their feedback to make sure the updates are high quality before publishing them to all users.  If you’re not in our Beta program, you’ll eventually get all of the same fixes and features, but after they have been tested by our Beta users.

To join:
  1. In Steam, use the drop down under the **Library** menu to filter to **Software**.
  2. In the list, right-click **Windows Mixed Reality for SteamVR** and select **Properties**.
  3. Click the **Betas** tab.
  4. Opt-in to **"beta - public beta"** and click **Close** to confirm. Note that the beta access code field should be left blank.
  
### SteamVR Beta

SteamVR is built and released by Valve and is common across all SteamVR headsets.  It follows a similar model of releasing updates to Beta members before publising to all users.

To join:
  1. In Steam, use the drop down under the **Library** menu to filter to **Tools**.
  2. In the list, right-click **SteamVR** and select **Properties**.
  3. Click the **Betas** tab.
  4. Opt-in to **"beta - public beta"** and click **Close** to confirm.  Note that the beta access code field should be left blank.![Switch to the SteamVR beta in the properties dialog for SteamVR](images/steamvr-beta.png)

### Windows Insider Program

Windows Mixed Reality is a part of Windows 10.  Many fixes and features that affect SteamVR users come with the Windows OS.  If you want to try the latest Windows 10 preview builds, we encourage you to join the [Windows Insider Program](https://insider.windows.com).
  
## Enabling controller thumbstick controls in any SteamVR application

**Windows Mixed Reality for SteamVR** has an experimental feature to enable the use of a controller thumbstick for artificial movement in any StreamVR application.  Thumbstick controls simulate real movement as if you were actually walking around your physical space.  This may cause issues for some applications.

To enable thumbstick controls:
1. Edit "C:\Program Files (x86)\Steam\steamapps\common\MixedRealityVRDriver\resources\settings\default.vrsettings"
    * Path will be different if **Windows Mixed Reality for SteamVR** was installed to a different library.
2. Change **thumbstickControlsEnabled** to true as shown in the examples below.
3. To reverse the handedness of the controls, change **thumbstickControlsReversed** to true.
4. To increase comfort, this feature defaults to small discrete turns. If you would prefer a smooth turning experience, set **thumbstickTurnSmooth** to true.

**Example 1: Enabling thumbstick controls**
```
  "driver_Holographic_Experimental" : {
        // Some people may experience increased discomfort such as nausea, motion sickness, dizziness,
        // disorientation, headache, fatigue, or eye strain when using thumbstick controls in Windows Mixed Reality.
        "thumbstickControlsEnabled" : true,
        "thumbstickControlsReversed" : false,
        "thumbstickTurnSmooth" : false,
        "thumbstickDeadzone" : 0.25
    }
```
    
**Example 2: Enabling smooth turn**
```
  "driver_Holographic_Experimental" : {
        // Some people may experience increased discomfort such as nausea, motion sickness, dizziness,
        // disorientation, headache, fatigue, or eye strain when using thumbstick controls in Windows Mixed Reality.
        "thumbstickControlsEnabled" : true,
        "thumbstickControlsReversed" : false,
        "thumbstickTurnSmooth" : true,
        "thumbstickDeadzone" : 0.25
    }
```

## Enabling motion reprojection for SteamVR Apps
Windows Mixed Reality for SteamVR has an experimental motion reprojection feature to make 90 FPS reprojection more smooth.

When motion reprojection is enabled, all Steam VR games will render nominally at ½ frame rate (45 fps instead of 90 FPS) while Windows Mixed Reality for SteamVR uses motion vectors generated by the GPU to extrapolate the next frame. For SteamVR games that reliably hit 60 FPS+ on a given PC, this should result in a solid 90 FPS experience with occasional artifacts while maintaining a comfortable experience. 

When motionReprojectionMode is set to "auto", motion reprojection will turn on automatically when a game is rendering too slowly to maintain 90 FPS. When a game begins to maintain 90 FPS or starts rendering at less than 45 FPS, motion reprojection will turn off. Asynchronous rotational reprojection is enabled at all times.

**Expected Visual Artifacts** 
1.	When using a application resolution greater than 150% you may experience blurring. When using motion reprojection we recommend using a value less than 150%.
2. Sharp contrast edges or text, especially on in-game HUDs or menus, may look temporarily warped or distorted due to disocclusion.
3.	SteamVR Home and many other games that do not reliably hit 50-60 FPS on your PC will continue to have a poor experience with this mode.
4.  Some games have been reported to run at 50% speed or with increased latency (lag). Please report these games through the [Windows Feedback Hub](filing-feedback.md) instructions below.
 
Initially we have experimental support for recent generation NVidia GPUs. We are continuing to iterate on and improve our motion reprojection support on additional GPUs, and we’re eager to hear your feedback.


**Supported GPUs:** Nvidia GeForce GTX1060, AMD RX470 or better, with Windows Mixed Reality compatible graphics drivers installed

To enable motion reprojection: 
1.	Make sure you have opted into the **Windows Mixed Reality for SteamVR Beta** using the instructions above.
2.	Close SteamVR if it is running.
3.	Edit "C:\Program Files (x86)\Steam\steamapps\common\MixedRealityVRDriver\resources\settings\default.vrsettings"
    * Path will be different if Windows Mixed Reality for SteamVR was installed to a different library.
4.	Add the following line just below "driver_Holographic_Experimental" as shown in Example 1 below.
    * *"motionReprojectionMode" : "auto",*
5.	Restart SteamVR with Windows Mixed Reality

**Motion Reprojection Indicator**
*motionReprojectionIndicatorEnabled* is a new setting in the configuration file to help diagnose issues with the experimental automatic motion reprojection feature. When set to true, you will see an indicator in the top-left of your headset display during automatic motion reprojection. The color and position of this indicator corresponds to the current motion reprojection mode - see the diagram below for examples.

![mvLSR Indicator](images/mvLSRIndicator.png)
 
**Example 1: Enabling automatic motion reprojection**
 ```
  "driver_Holographic_Experimental" : {
         "motionReprojectionMode" : "auto", 
         
         // motionReprojectionIndicatorEnabled is a new setting in the configuration file to help diagnose issues with the experimental automatic motion reprojection feature. When set to true, you will see an indicator in the headset that corresponds to the current motion reprojection mode:
        // green = off because application can render at full framerate
        // light blue = on because application is cpu bound
        // dark blue = on because application is gpu bound
        // red = off because application running at less than half framerate, reduce super sampling if enabled
        // Uncomment the next line to enable the motion reprojection indicator
        
        // "motionReprojectionIndicatorEnabled" : true,
         
        // Some people may experience increased discomfort such as nausea, motion sickness, dizziness,
        // disorientation, headache, fatigue, or eye strain when using thumbstick controls in Windows Mixed Reality.
        "thumbstickControlsEnabled" : false,
        "thumbstickControlsReversed" : false,
        "thumbstickTurnSmooth" : false,
        "thumbstickDeadzone" : 0.25        
    }
```
**Example 2: Enabling motion reprojection at all times**
 ```
  "driver_Holographic_Experimental" : {
         "motionReprojectionMode" : "motionvector",      
         
        // Some people may experience increased discomfort such as nausea, motion sickness, dizziness,
        // disorientation, headache, fatigue, or eye strain when using thumbstick controls in Windows Mixed Reality.
        "thumbstickControlsEnabled" : false,
        "thumbstickControlsReversed" : false,
        "thumbstickTurnSmooth" : false,
        "thumbstickDeadzone" : 0.25        
    }
```
**Example 3: Disabling motion reprojection**
```
  "driver_Holographic_Experimental" : {
        // "motionReprojectionMode" : "auto", 
        
        // Some people may experience increased discomfort such as nausea, motion sickness, dizziness,
        // disorientation, headache, fatigue, or eye strain when using thumbstick controls in Windows Mixed Reality.
        "thumbstickControlsEnabled" : false,
        "thumbstickControlsReversed" : false,
        "thumbstickTurnSmooth" : false,
        "thumbstickDeadzone" : 0.25
    }
```

## Sharing feedback on SteamVR

Your feedback is invaluable when it comes to improving the Windows Mixed Reality SteamVR experience. Please submit all feedback and bugs through the [Windows Feedback Hub](filing-feedback.md). Please follow these suggestions to help us get the most from your feedback: 
1. In Feedback Hub, indicate that you're reporting a new Problem in the "What kind of feedback is it?" section at the top.
2. Select the **Mixed Reality** category and the **Apps** subcategory.
3. Put the word "SteamVR" in the problem summary. That helps us find your feedback.
4. Describe what SteamVR game or application you were using when you encountered the issue.
5. Please consider attaching a SteamVR System Report to your feedback. This provides additional logs that can help us diagnose your problem. 
    1. On the SteamVR Window (the small windows that shows your controller status) click on the title to open the menu.
    2. Select "Create System Report".
    3. Save to File.
    4. Attach the generated file to your Feedback Hub entry directly.
6. If your feedback is about SteamVR performance, please collect a Mixed Reality Performance trace: 
    1. Click the **Recreate my Problem** button.
    2. In the drop down next to "include data about" select **Mixed Reality Performance**.
    3. Make sure the game is running and click **Start Capture**.
    4. Spend a few seconds playing the game to capture the trace. Please do not capture the trace for more than 10-15 seconds, or it will be too large to submit.
    5. Click **Stop Capture**.
7. Click **Submit** once you have completed the rest of the fields.

If you have questions or comments to share, you can also reach us on our [Steam forum](http://steamcommunity.com/app/719950/discussions/).

## See also
* [Troubleshooting SteamVR with Windows Mixed Reality](steamvr-questions.md)
* [Using games and apps in Windows Mixed Reality](using-games-and-apps-in-windows-mixed-reality.md)
* [Minimum PC hardware guidelines](windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md)
* [Filing bugs and feedback](filing-feedback.md)

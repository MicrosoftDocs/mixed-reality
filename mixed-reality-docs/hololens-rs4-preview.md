---
title: HoloLens RS4 Preview
description: Learn more about the RS4 Preview build for HoloLens, including how to install the preview, a description of the new features included, and how to provide feedback and get support.
author: mattzmsft
ms.author: mazeller
ms.date: 03/23/2018
keywords: HoloLens, preview, insider, os, rs4, new features
---

# HoloLens RS4 Preview

>[!IMPORTANT]
>By downloading *or* using the HoloLens RS4 Preview builds, you are acknowledging and agreeing to the **HoloLens RS4 Preview – EULA (End User License Agreement)**, included in the preview setup package.

In this article, you'll learn more about the HoloLens RS4 Preview. This preview is available to all HoloLens users, however, please note that installing this preview will erase all of your content and restore your device to factory settings. Like any pre-release software, you may encounter bugs and other issues along the way. For this reason, Preview builds are made for people who know their way around HoloLens and don’t mind frequent updates with significant changes.

In order to install this preview, you must first download the latest version of the Windows Device Recovery Tool and ensure that your HoloLens is enrolled in the Windows Insider Program. After installing the preview, [check for updated preview builds](#staying-up-to-date) with **Windows Update**.

## Downloading the HoloLens RS4 Preview package

You can download the preview setup package from [https://aka.ms/hololenspreviewdownload](https://aka.ms/hololenspreviewdownload).

>[!IMPORTANT]
>All updates to the HoloLens RS4 Preview will be delivered over-the-air (OTA) through Windows Update. If you've already manually installed the HoloLens RS4 Preview, please read [Staying up-to-date](#staying-up-to-date) below. For additional information on each release, refer to [Update history](#update-history) below.

### What's in the package?

| File | Description |
|------|------|
| rs4_release_svc_analog.retail.10.0.17134.1004.FFU | The HoloLens RS4 Preview image that you will flash to your device using the Windows Device Recovery Tool. |
| HoloLens RS4 Preview – EULA | HoloLens RS4 Preview - Evaluation Use Terms (End User License Agreement) |

## Installing the preview

1. On a retail HoloLens device (Windows Holographic 10.0.14393), opt-in to Insider Preview builds to prepare your device for the RS4 Preview:
   * Launch the **Settings** app, then select **Update & Security > Get Insider Preview builds > Get started**.
   * Select **Restart** to restart the device to prepare to install Preview builds and wait until your device is once again booted.

>[!NOTE]
>If you need assistance getting your device back to a known state, refer to the [Reset & Recovery instructions](reset-or-recover-your-hololens.md).

2. Install an updated version of the **Windows Device Recovery Tool (WDRT)** from [https://aka.ms/wdrt](https://aka.ms/wdrt).

>[!NOTE]
>This preview requires WDRT version 3.14.07501 (or newer)

3. Flash the OS Preview Build using the Windows Device Recovery Tool:

   a. Launch Windows Device Recovery Tool from your Start menu or Desktop shortcut.
   
   ![WDRT shortcut](images/WDRT314-RS4Preview-1.png)
   
   b. Plug in your HoloLens device, and then select **Microsoft HoloLens** to continue.
   
   ![Device selection](images/WDRT314-RS4Preview-2.png)
   
   c. Select **Manual package selection** to select a custom OS image to use, then navigate to the .FFU file provided as part of the [Preview package](#downloading-the-hololens-rs4-preview-package).
   
   ![Manual package selection](images/WDRT314-RS4Preview-3.png)
   
   d. Confirm that the correct package is listed, and then select **Install software** to begin the OS installation.
   
   ![Install software](images/WDRT314-RS4Preview-4.png)
   
   e. **WARNING:** this process will erase all the content on your HoloLens device; confirm by selecting **Continue**.
   
   ![Warning](images/WDRT314-RS4Preview-5.png)
   
   f. The installation process will take a few minutes, during which a progress bar will be displayed on-screen.
   
   ![Installation progress](images/WDRT314-RS4Preview-6.png)
   
   g. Once installation is complete, your device will reboot; select **Finish** to complete the process.
   
   ![Finish](images/WDRT314-RS4Preview-7.png)
   
   h. You can confirm the new OS version on your device by selecting your device again in the tool, and verifying on the **Device info** page.
   
   ![Device info](images/WDRT314-RS4Preview-8.png)

4. Go through the HoloLens on-device OOBE setup flow. Sign-in with your personal or work account to experience all the features of this Preview.

5. After signing-in, check for HoloLens RS4 Preview updates with **Windows Update** (see [Staying up-to-date](#staying-up-to-date) section below).

## Staying up-to-date

>[!IMPORTANT]
>After manually installing the HoloLens RS4 Preview build using the instructions above, you will need to use **Windows Update** to download the most recent preview build. Check this page regularly for information on [new preview builds](#update-history), including fixes, improvements, and known issues.

Check for HoloLens RS4 Preview updates with **Windows Update**:
1. Launch the **Settings** app, then select **Update & Security > Windows Insider Program** to confirm you're opted-in to Windows Insider Preview builds on HoloLens. 
   * Select **Get started** if you aren't currently opted-in. You may need to restart your device.
   * You also need to sign-up for the Windows Insider Program if you haven't already. Learn more at [http://insider.windows.com](http://insider.windows.com).
2. Under "What kind of content would you like to receive?”, choose **Active development of Windows**.
3. Under “What pace do you want to get new builds?”, choose **Fast** to receive builds as soon as possible or **Slow** for less frequent updates.
4. Navigate to **Windows Update** in the left bar, and select **Check for updates** to ensure you’re on the latest available build.

>[!NOTE]
>You may need to first select **Get started**, **Fix me**, or **Take control** at the top of the page depending on the state of your Microsoft account, and whether you have previously configured Windows Insider Program settings on your account. Additionally, you may see messages regarding content being on a different release – you can safely ignore these messages, as preview updates will continue to be delivered.

## New features in this preview

### For all users

<table>
  <tr>
    <th>Feature</th><th>Details</th><th>Instructions</th>
  </tr>
  <tr>
    <td>Auto-placement of 2D and 3D content on launch</td><td>A 2D app launcher or 2D UWP app auto-places in the world at an optimal size and distance when launched instead of requiring the user to place it. If an <a href="app-views.md">immersive app</a> uses a 2D app launcher instead of a <a href="3d-app-launcher-design-guidance.md">3D app launcher</a>, the immersive app will auto-launch from the 2D app launcher same as in RS1.<br><br>A 3D app launcher from the Start menu also auto-places in the world. Instead of auto-launching the app, users can then click on the launcher to launch the immersive app. 3D content opened from the Holograms app and from Edge also auto-places in the world.</td><td>When opening an app from the Start menu, you will no longer be asked to place it in the world.<br><br>If the 2D app/<a href="3d-app-launcher-design-guidance.md">3D app launcher</a> placement is not optimal, you can easily move them using new fluid app manipulations described below. You can also re-position the 2D app launcher/3D content by saying "Move this" and then using gaze to re-position the content.</td>
  </tr>
  <tr>
    <td>Fluid app manipulation</td><td>Move, resize, and rotate 2D and 3D content without having to enter "Adjust" mode.</td><td>To move a 2D UWP app or 2D app launcher, simply gaze at its app bar and then use the tap + hold + drag gesture. You can move 3D content by gazing anywhere on the object and then using tap + hold + drag.<br><br>To resize 2D content, gaze at its corner. The gaze cursor will turn into a resize cursor, and then you can tap + hold + drag to resize. You can also make 2D content taller or wider by looking at its edges and dragging.<br><br>To resize 3D content, lift up both your hands into gesture frame, fingers up in the ready position. You'll see the cursor turn into a state with 2 little hands. Do the tap and hold gesture with both your hands. Moving your hands closer or farther apart you will change the size of the object. Moving your hands forward and backward relative to each other will rotate the object. You can also resize/rotate 2D content this way.</td>
  </tr>
  <tr>
    <td>2D app horizontal resize with reflow</td><td>Make a 2D UWP app wider in aspect ratio to see more app content. For example, making the Mail app wide enough to show the Preview Pane.</td><td>Simply gaze at the left or right edge of the 2D UWP app to see the resize cursor, then use the tap + hold + drag gesture to resize.</td>
  </tr>
  <tr>
    <td>Expanded voice command support</td><td>You can do more simply using your voice.</td><td>Try these voice commands:<ul><li>"Go to Start" - Brings up the Start menu or exits an <a href="app-views.md">immersive app</a>.</li><li>"Move this" - Allows you to move an object.</li></ul></td>
  </tr>
  <tr>
    <td>Updated Holograms and Photos apps</td><td>Updated Holograms app with new holograms. Updated Photos app.</td><td>You will notice an updated look to the Holograms and Photos apps. The Holograms app includes several new Holograms and a label maker for easier creation of text.</td>
  </tr>
  <tr>
    <td>Improved mixed reality capture</td><td>Hardware shortcut start and end MRC video.</td><td>Hold Volume Up + Down for 3 seconds to start recording MRC video. Tap both again or use the bloom gesture to end.</td>
  </tr>
  <tr>
    <td>Consolidated spaces</td><td>Simplify space management for holograms into a single space.</td><td>HoloLens finds your space automatically, and no longer requires you to manage or select spaces. If you have problems with holograms around you, you can go to <b>Settings > System > Holograms > Remove nearby holograms</b>. If needed, you can also select <b>Remove all holograms</b>.</td>
  </tr>
  <tr>
    <td>Improved audio immersion</td><td>You can now hear HoloLens better in noisy environments, and experience more lifelike sound from applications as their sound will be obscured by real walls detected by the device.</td><td>You don't have to do anything to enjoy the improved spatial sound.</td>
  </tr>
  <tr>
    <td>File Explorer</td><td>Move and delete files from within HoloLens.</td><td>You can use the <b>File Explorer</b> app to move and delete files from within HoloLens.<br><br><b>Tip:</b> If you don’t see any files, the "Recent" filter may be active (clock icon is highlighted in left pane). To fix, select the <b>This Device</b> document icon in the left pane (beneath the clock icon), or open the menu and select <b>This Device</b>.
</td>
  </tr>
  <tr>
    <td>MTP (Media Transfer Protocol) support</td><td>Enables your desktop PC to access your libraries (photos, videos, documents) on HoloLens for easy transfer.</td><td>Similar to other mobile devices, connect your HoloLens to your PC to bring up <b>File Explorer</b> to access your HoloLens libraries (photos, videos, documents) for easy transfer.<br><br><b>Tips:</b><ul><li>If you don't see any files, please ensure you sign in to your HoloLens to enable access to your data.</li><li>From <b>File Explorer</b> on your PC, you can select <b>Device properties</b> to see Windows Holographic OS version number (firmware version) and device serial number.</li></ul><b>Known issue:</b> Renaming HoloLens via <b>File Explorer</b> on your PC is not enabled.</td>
  </tr>
  <tr>
    <td>Captive portal network support during setup</td><td>You can now set up your HoloLens on a guest network at hotels, conference centers, retail shops, or businesses that use captive portal.</td><td>During setup, select the network, check connect automatically if desired, and enter the network information as prompted.</td>
  </tr>
</table>

### For developers

<table>
  <tr>
    <th>Feature</th><th>Details</th><th>Instructions</th>
  </tr>
  <tr>
    <td>Spatial mapping improvements</td><td>Quality, simplification, and performance improvements.</td><td>Spatial mapping mesh will appear cleaner – fewer triangles are required to represent the same level of detail. You may notice changes in triangle density in the scene.</td>
  </tr>
  <tr>
    <td>Automatic selection of focus point based on depth buffer</td><td>Submitting a depth buffer to Windows allows HoloLens to select a focus point automatically to optimize hologram stability.</td><td>In Unity, go to <b>Edit > Project Settings > Player > Universal Windows Platform tab > XR Settings</b>, expand the <b>Windows Mixed Reality SDK</b> item, and ensure <b>Enable Depth Buffer Sharing</b> is checked. This will be automatically checked for new projects.<br><br>For DirectX apps, ensure you call the <a href="https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.commitdirect3d11depthbuffer">CommitDirect3D11DepthBuffer </a> method on <b>HolographicRenderingParameters</b> each frame to supply the depth buffer to Windows.
</td>
  </tr>
  <tr>
    <td>Holographic reprojection modes</td><td>You can now disable positional reprojection on HoloLens to improve the hologram stability of rigidly body-locked content such as 360-degree video.</td><td>In Unity, set <a href="https://docs.unity3d.com/ScriptReference/XR.WSA.HolographicSettings.ReprojectionMode.html">HolographicSettings.ReprojectionMode</a> to <a href="https://docs.unity3d.com/ScriptReference/XR.WSA.HolographicSettings.HolographicReprojectionMode.html>HolographicReprojectionMode.OrientationOnly</a> when all content in view is rigidly body-locked.<br><br>For DirectX apps, set <a href="https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.reprojectionmode"> HolographicCameraRenderingParameters.ReprojectionMode</a> to <a href="https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographicreprojectionmode">HolographicReprojectionMode.OrientationOnly</a> when all content in view is rigidly body-locked.</td>
  </tr>
  <tr>
    <td>App tailoring APIs</td><td>Windows APIs know more about where your app is running, such as whether the device’s display is transparent (HoloLens) or opaque (immersive headset) and whether a UWP app’s 2D view is showing up in the holographic shell.</td><td>Unity had previously manually exposed <a href="https://docs.unity3d.com/ScriptReference/XR.WSA.HolographicSettings.IsDisplayOpaque.html">HolographicSettings.IsDisplayOpaque</a> in a way that worked even before this build.<br><br>For DirectX apps, you can now access existing APIs like <a href="https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographicdisplay.isopaque">HolographicDisplay.GetDefault().IsOpaque</a> and <a href="https://docs.microsoft.com/en-us/uwp/api/windows.applicationmodel.preview.holographic.holographicapplicationpreview.iscurrentviewpresentedonholographicdisplay">HolographicApplicationPreview.IsCurrentViewPresentedOnHolographicDisplay</a> on HoloLens as well.
</td>
  </tr>
  <tr>
    <td>Research mode</td><td>Allows developers to access key HoloLens sensors when building academic and industrial applications to test new ideas in the fields of computer vision and robotics:<ul><li>The four <b>environment tracking cameras</b> used by the system for spatial map building and head-tracking.</li><li>Two versions of the <b>depth mapping camera data</b> - one for high-frequency (30 fps) near-depth sensing, commonly used in hand tracking, and the other for lower-frequency (1 fps) far-depth sensing, currently used by spatial mapping.</li><li>Two versions of an <b>IR-reflectivity stream</b>, used to compute depth, but valuable in its own right as these images are illuminated from the HoloLens and reasonably unaffected by ambient light.</li></ul></td><td>First, ensure "Use developer features" and "Enable Device Portal" are set to <b>On</b> in <b>Settings > Update & Security > For developers</b> on HoloLens. Next, on a desktop PC, use <a href="using-the-windows-device-portal.md">Device Portal</a> to access your HoloLens through a web browser, expand <b>System</b>, select <b>Research mode</b>, and check the box next to "Allow access to sensor streams." Reboot your HoloLens for the settings to take effect.<br><br><b>Note:</b> Apps built using Research mode cannot be submitted to the Microsoft Store.<br><br><b>Coming soon:</b> sample applications and documentation to leverage sensor data will be posted in April 2018.</td>
  </tr>
</table>

### For commercial customers

<table>
  <tr>
    <th>Feature</th><th>Details</th><th>Instructions</th>
  </tr>
  <tr>
    <td>Use multiple AAD user accounts on a single device</td><td>Share a HoloLens with multiple AAD users, each with their own user settings and user data on device.</td><td><b>Initial setup:</b> During setup, you must sign in with an AAD account using the option "My work or school owns it". After setup, ensure that the "Windows Holographic for Business" edition update has been applied (<b>Settings >  System > About</b>), and that "Other People" appears in <b>Settings > Accounts</b>.<br><br><b>Adding a user:</b><ol><li>Trigger sign in by pressing the power button once to go to standby, and again to return to the lock screen <b>or</b> by selecting the user tile on the upper right of the Start menu to sign out the current user.</li><li>In <b>Other user</b> to the right of the current user, enter email address and password as prompted.</li></ol><b>Subsequent sign-ins</b><ol><li>Trigger sign in by pressing the power button once to go to standby, and again to return to the lock screen <b>or</b> by selecting the user tile on the upper right of the Start menu to sign out the current user.</li><li>If you are the current user on the center panel, or previous user on the left panel, you can sign in with your password/PIN</li><li>If you do not appear on the left or center panel, you can sign in using <b>Other user</b> on the right panel by entering your email address and password as prompted.</li></ol><b>To see other user accounts on the device:</b> Go to <b>Settings > Accounts > Other users</b>.<br><br><b>To remove a user from the device:</b> Go to <b>Settings > Accounts > Other users</b> and select <b>Remove</b> to remove the undesired user.<br><br><b>Note:</b> Each subsequent user will need to perform calibration in order to set their correct IPD while signed in.</td>
  </tr>
  <tr>
    <td>Change Wi-Fi network on sign-in</td><td>Change Wi-Fi network before sign-in to enable another user to sign in with his or her AAD user account for the first time, allowing users to share devices at various locations and job sites.</td><td>On the sign-in screen, you can use the network icon below the password field to connect to a network. This is helpful when this is your first time signing into a device.</td>
  </tr>
  <tr>
    <td>Unified enrollment</td><td>It's now easy for a HoloLens user who set up the device with a personal Microsoft account to add a work account (AAD) and join the device to their MDM server.</td><td>If you originally signed in with a Microsoft account, you can now add a work account (AAD) via <b> Settings > Accounts > Access Work or School > Connect</b></td>
  </tr>
  <tr>
    <td>Mail Sync without MDM enrollment</td><td>Support for Exchange Active Sync (EAS) mail sync without requiring MDM enrollment.</td><td>You can now sync email without enrolling in MDM. You can set up the device with a Microsoft Account, download and install the Mail app, and add a work email account directly.</td>
  </tr>
</table>

### For IT pros

<table>
  <tr>
    <th>Feature</th><th>Details</th><th>Instructions</th>
  </tr>
  <tr>
    <td>New OS name when Commercial Suite features enabled: "Windows Holographic for Business"</td><td>Clear edition naming to reduce confusion on edition upgrade license application.</td><td>You can see what edition of Windows Holographic is running in <b>Settings > System > About</b>. "Windows Holographic for Business" will appear if an edition update has been applied to enable Commercial Suite features.</td>
  </tr>
  </tr>
  <tr>
    <td>Configurable setup (OOBE)</td><td>Hide calibration, gesture/gaze training, and Wi-Fi configuration screens during setup.</td><td>The necessary tools for this feature will be made available with the official public release of RS4 for HoloLens.</td>
  </tr>
  <tr>
  <td>Windows Configuration Designer (WCD)</td><td>Create and edit provisioning packages to configure HoloLens via updated WCD app. New simple HoloLens wizard for edition update, configurable OOBE, region/time zone, bulk AAD token, network, and developer CSP. Advanced editor filtered to HoloLens supported options, including new Assigned Access and Account Management CSPs.</td><td>The necessary tools for this feature will be made available with the official public release of RS4 for HoloLens.</td>
  </tr>
  <tr>
    <td>Bulk AAD token support</td><td>Pre-register device to AAD directory tenant for quicker user setup flow.</td><td>The necessary tools for this feature will be made available with the official public release of RS4 for HoloLens.</td>
  </tr>
  <tr>
  <td>Developer CSP</td><td>Deploy profile to set up HoloLens in <b>Developer mode</b>. Useful for both development and demo devices.</td><td>The necessary tools for this feature will be made available with the official public release of RS4 for HoloLens.</td>
  </tr>
  <tr>
  <td>Assigned access</td><td>Windows assigned access for first-line workers or demos. Single or multi-app lockdown. No need to developer unlock.</td><td>The necessary tools for this feature will be made available with the official public release of RS4 for HoloLens.</td>
  </tr>
  <tr>
  <td>Assigned access with guest</td><td>Windows assigned access with password-less guest account for demos. Single or multi-app lockdown. No need to developer unlock.</td><td>The necessary tools for this feature will be made available with the official public release of RS4 for HoloLens.</td>
  </tr>
  <tr>
  <td>Account management</td><td>Share a HoloLens device and remove user data after sign-out or inactivity/storage thresholds for temporary usage. Supports AAD accounts.</td><td>The necessary tools for this feature will be made available with the official public release of RS4 for HoloLens.</td>
  </tr>
  <tr>
    <td>Set up (OOBE) diagnostics</td><td>Get diagnostic logs from HoloLens so you can troubleshoot AAD sign-in failures (before Feedback Hub is available to the user whose sign-in failed).</td><td>Diagnostic logs are now available in some cases if you have problems adding your work account during initial device setup. When available, select <b>Collect info</b>. You can connect your HoloLens to a desktop PC and copy the diagnostic files to use for troubleshooting the issue.</td>
  </tr>
  <tr>
    <td>Local account indefinite password expiry</td><td>Remove disruption of device reset when local account password expires.</td><td>When provisioning a local account, you no longer need to change the password every 42 days in <b>Settings</b>, as the account password no longer expires.</td>
  </tr>
  <tr>
    <td>MDM sync status and details</td><td>Standard Windows functionality to understand MDM sync status and details from within HoloLens.</td><td>To check mobile device management (MDM) sync state for your account, you can go to <b>Settings > Accounts > Access Work or School</b>, and select <b>Info</b> for the work account of interest. You will see the <b>Device Sync Status</b> section, with an option to trigger an MDM sync using the <b>Sync</b> button. You can also see areas managed by MDM (Policies, Apps, etc.) and other MDM sync information, including the ability to <b>Create</b> and <b>Export</b> an Advanced Diagnostics Report for MDM (you can connect your HoloLens to a PC to copy over the report).</td>
  </tr>
</table>

## Update history

### Update 5 - Build 17134.1008

*Released May 2, 2018*

This build is delivered over the air (OTA) through Windows Update after you've manually installed the HoloLens RS4 Preview using the instructions at the top of this page.

**General changes, improvements, and fixes:**

Developer experience improvements (APIs and emulator)

### Update 4 - Build 17134.1004

*Released April 25, 2018*

This build is delivered over the air (OTA) through Windows Update to devices that already have the HoloLens RS4 Preview, or can be manually installed using the HoloLens RS4 Preview package at the top of the page.

**General changes, improvements, and fixes:**

   * App launch times.
   * Animated 3D app launchers.
   * Device management tool.

### Update 3 - Build 17134.1000

*Released April 18, 2018*

This build is delivered over the air (OTA) through Windows Update after you've manually installed the HoloLens RS4 Preview using the instructions at the top of this page.

**General changes, improvements, and fixes:**

   * Reliability issues for exclusive apps.
   * Interactions while moving slates and blooming.
   * Cortana/Skype integration.
   * Speech in OOBE stability.
   * UWP app reliability with mouse/gamepad integration.

### Update 2 - Build 17133.1009

*Released April 10, 2018*

This build is delivered over the air (OTA) through Windows Update after you've manually installed the HoloLens RS4 Preview using the instructions at the top of this page.

* **General changes, improvements, and fixes**

   * Fixes for overall reliability and sign-in using PIN.

* **Known issues**

   * Users may experience reliability issues with using voice to launch apps for the first time.


### Update 1 - Build 17133.1004

*Released April 3, 2018*

This build is delivered over the air (OTA) through Windows Update after you've manually installed the HoloLens RS4 Preview using the instructions at the top of this page.

* **General changes, improvements, and fixes**

   * Fixes for speech reliability and overall reliability of the product.

* **Known issues**

   * Users may experience reliability issues with using voice to place Skype calls or launch apps for the first time.

### Preview setup package FFU - Build 17123.1004

*Released March 26, 2018*

This is the build used for manually installing the HoloLens RS4 Preview (included in the [preview setup package](#downloading-the-hololens-rs4-preview-package) at the top of this page).

* **General changes, improvements, and fixes**

   * See the list of [new features in this preview](#new-features-in-this-preview) above.

* **Known issues**

   * Some users have reported an issue with Windows Insider Program settings on this build. If you encounter problems, please file a bug in Feedback Hub, and re-flash your device.

## Updating HoloLens apps for RS4

You are welcome to try developing your applications using this build of HoloLens. Continue using the [Windows Mixed Reality developer documentation](index.md) to guide your development, as these apply to this latest build of HoloLens as well. You can use the same builds of [Unity and Visual Studio](install-the-tools.md) that you're already using for HoloLens development. Reference the [new features list above](#new-features-in-this-preview) for capabilities specific to the HoloLens RS4 Preview.

HoloLens RS4 changes that may affect your apps:
* **Permission requests to use sensitive resources (camera, microphone, etc.)** - RS4 on HoloLens will enforce permission requests for apps intending to access sensitive resources, such as the camera or microphone. RS1 on HoloLens did not force these prompts, so, if your app assumes immediate access to these resources, it may crash in RS4 (even if the user grants permission to the requested resource). Please read the relevant [UWP app capability declarations article](https://docs.microsoft.com/en-us/windows/uwp/packaging/app-capability-declarations) for more information.
* **Calls to apps outside your own** - RS4 on HoloLens will enforce proper use of the [*Windows.System.Launcher* class](https://docs.microsoft.com/en-us/uwp/api/Windows.System.Launcher) to launch another app from your own. For example, we've seen issues with apps calling *Windows.System.Launcher.LaunchUriForResultsAsync* from a non-ASTA (UI) thread. This would succeed in RS1 on HoloLens, but RS4 requires the call to be executed on the UI thread.

## Provide feedback and report issues

Please use the [Feedback Hub app on HoloLens](give-us-feedback.md#feedback-for-hololens) to provide feedback and report issues. Using Feedback Hub ensures that all necessary diagnostics information is included to help our engineers quickly debug and resolve the problem.

>[!IMPORTANT]
>Be sure to accept the prompt that asks whether you’d like Feedback Hub to access your Documents folder (select **Yes** when prompted).

## Questions and support

You can ask questions and engage with our support team in a new section of the [HoloLens developer forums](https://aka.ms/hololenspreviewhelp).

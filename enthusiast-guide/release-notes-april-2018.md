---
title: Release notes - April 2018
description: Stay up to date on HoloLens and Windows Mixed Reality release notes for the Windows 10 April 2018/RS4 Update.
author: mattzmsft
ms.author: mazeller
ms.date: 05/21/2018
ms.topic: article
keywords: release notes, version, windows 10, build, rs4, os
---

# Release notes - April 2018

The **[Windows 10 April 2018 Update](https://blogs.windows.com/windowsexperience/2018/04/30/whats-new-in-the-windows-10-april-2018-update)** (also known as RS4) includes new features for both HoloLens and Windows Mixed Reality immersive headsets connected to PCs. 

To update to the latest release for either device type, open the **Settings** app, go to **Update & Security**, then select the **Check for updates** button. On a Windows 10 PC, you can also manually install the Windows 10 April 2018 Update using the [Windows media creation tool](https://www.microsoft.com/software-download/windows10).

**Latest release for Desktop:** Windows 10 April 2018 Update (**10.0.17134.1**)<br>
**Latest release for HoloLens:** Windows 10 April 2018 Update (**10.0.17134.80**)<br>
<br>

>[!VIDEO https://www.youtube.com/embed/O-84oWjSbr0]

*A message from Alex Kipman and overview of new mixed reality features in the Windows 10 April 2018 Update*

## New features for Windows Mixed Reality immersive headsets

The Windows 10 April 2018 Update includes many improvements for using Windows Mixed Reality immersive (VR) headsets with your desktop PC, such as: 

* **New environments for the mixed reality home** - Choose between the Cliff House and the new Skyloft environment by selecting **Places** on the Start menu. We've also added [an experimental feature](/windows/mixed-reality/design/add-custom-home-environments) that will let you use custom environments you've created.
* **Quick access to mixed reality capture** - Take mixed reality photos using a motion controller across environments and apps, but won't capture content protected with DRM. Hold the Windows button and then tap the trigger. .
* **New options for launching and resizing content** - Apps are now automatically placed in front of you when you launch them from the Start menu. You can also now resize 2D apps by dragging the edges and corners of the window.
* **Easily jump to content with "teleport" voice command** - Quickly teleport in front of content in the Windows Mixed Reality home by gazing at content and saying "teleport."
* **[Animated 3D app launchers](/windows/mixed-reality/distribute/creating-3d-models-for-use-in-the-windows-mixed-reality-home#animation-guidelines) and [decorative 3D objects](/windows/mixed-reality/distribute/enable-placement-of-3d-models-in-the-home) for the mixed reality home**. You can now add animation to 3D app launchers and allow users to place decorative 3D models from a webpage or 2D app into the Windows Mixed Reality home.
* **[Improvements to Windows Mixed Reality for SteamVR](/windows/mixed-reality/develop/porting-apps/updating-your-steamvr-application-for-windows-mixed-reality)** - Windows Mixed Reality for SteamVR is out of "early access" with new upgrades, including: haptic feedback when using motion controllers, improved performance and reliability, and improvements to the appearance of motion controllers in SteamVR.
* **Other improvements** - Updated automatic performance settings provide a more optimized experience (you can [manually override](#visual-quality) this setting). Setup now provides more detailed information about common compatibility issues with USB 3.0 controllers and graphics cards.

## New features for HoloLens

The Windows 10 April 2018 Update has arrived for all HoloLens customers! This update is packed with improvements introduced since the last major release of HoloLens software in [August 2016](release-notes-august-2016.md).

### For everyone

<table>
  <tr>
    <th>Feature</th><th>Details</th><th>Instructions</th>
  </tr>
  <tr>
    <td>Auto-placement of 2D and 3D content on launch</td><td>A 2D app launcher or 2D UWP app auto-places in the world at an optimal size and distance when launched instead of requiring the user to place it. If an <a href="/windows/mixed-reality/design/app-views">immersive app</a> uses a 2D app launcher instead of a <a href="/windows/mixed-reality/distribute/3d-app-launcher-design-guidance">3D app launcher</a>, the immersive app will auto-launch from the 2D app launcher same as in RS1.<br><br>A 3D app launcher from the Start menu also auto-places in the world. Instead of auto-launching the app, users can then click on the launcher to launch the immersive app. 3D content opened from the Holograms app and from Edge also auto-places in the world.</td><td>When opening an app from the Start menu, you won't be asked to place it in the world.<br><br>If the 2D app/<a href="/windows/mixed-reality/distribute/3d-app-launcher-design-guidance">3D app launcher</a> placement isn't optimal, you can easily move them using new fluid app manipulations described below. You can also reposition the 2D app launcher/3D content by saying "Move this" and then using gaze to reposition the content.</td>
  </tr>
  <tr>
    <td>Fluid app manipulation</td><td>Move, resize, and rotate 2D and 3D content without having to enter "Adjust" mode.</td><td>To move a 2D UWP app or 2D app launcher, simply gaze at its app bar and then use the tap + hold + drag gesture. You can move 3D content by gazing anywhere on the object and then using tap + hold + drag.<br><br>To resize 2D content, gaze at its corner. The gaze cursor will turn into a resize cursor, and then you can tap + hold + drag to resize. You can also make 2D content taller or wider by looking at its edges and dragging.<br><br>To resize 3D content, lift up both your hands into gesture frame, fingers up in the ready position. You'll see the cursor turn into a state with 2 little hands. Do the tap and hold gesture with both your hands. Moving your hands closer or farther apart  change the size of the object. Moving your hands forward and backward in relation to each other will rotate the object. You can also resize/rotate 2D content this way.</td>
  </tr>
  <tr>
    <td>2D app horizontal resize with reflow</td><td>Make a 2D UWP app wider in aspect ratio to see more app content. For example, making the Mail app wide enough to show the Preview Pane.</td><td>Simply gaze at the left or right edge of the 2D UWP app to see the resize cursor, then use the tap + hold + drag gesture to resize.</td>
  </tr>
  <tr>
    <td>Expanded voice command support</td><td>You can do more simply using your voice.</td><td>Try these voice commands:<ul><li>"Go to Start" - Brings up the Start menu or exits an <a href="/windows/mixed-reality/design/app-views">immersive app</a>.</li><li>"Move this" - Allows you to move an object.</li></ul></td>
  </tr>
  <tr>
    <td>Updated Holograms and Photos apps</td><td>Updated Holograms app with new holograms. Updated Photos app.</td><td>You'll notice an updated look to the Holograms and Photos apps. The Holograms app includes several new Holograms and a label maker for easier creation of text.</td>
  </tr>
  <tr>
    <td>Improved mixed reality capture</td><td>Hardware shortcut start and end MRC video.</td><td>Hold Volume Up + Down for 3 seconds to start recording MRC video. Tap both again or use the bloom gesture to end.</td>
  </tr>
  <tr>
    <td>Consolidated spaces</td><td>Simplify space management for holograms into a single space.</td><td>HoloLens finds your space automatically, and no longer requires you to manage or select spaces. If you have problems with holograms around you, you can go to <b>Settings > System > Holograms > Remove nearby holograms</b>. If needed, you can also select <b>Remove all holograms</b>.</td>
  </tr>
  <tr>
    <td>Improved audio immersion</td><td>You can now hear HoloLens better in noisy environments and experience more lifelike sound from applications because sound is obscured by real walls detected by the device.</td><td>You don't have to do anything to enjoy the improved spatial sound.</td>
  </tr>
  <tr>
    <td>File Explorer</td><td>Move and delete files from within HoloLens.</td><td>You can use the <b>File Explorer</b> app to move and delete files from within HoloLens.<br><br><b>Tip:</b> If you don’t see any files, the "Recent" filter may be active (clock icon is highlighted in left pane). To fix, select This Device</b> document icon in the left pane (beneath the clock icon), or open the menu and select <b>This Device</b>.
</td>
  </tr>
  <tr>
    <td>MTP (Media Transfer Protocol) support</td><td>Enables your desktop PC to access your libraries (photos, videos, documents) on HoloLens for easy transfer.</td><td>Similar to other mobile devices, connect your HoloLens to your PC to bring up <b>File Explorer</b> to access your HoloLens libraries (photos, videos, documents) for easy transfer.<br><br><b>Tips:</b><ul><li>If you don't see any files, ensure you sign in to your HoloLens to enable access to your data.</li><li>From <b>File Explorer</b> on your PC, you can select <b>Device properties</b> to see Windows Holographic OS version number (firmware version) and device serial number.</li></ul><b>Known issue:</b> Renaming HoloLens via <b>File Explorer</b> on your PC isn't enabled.</td>
  </tr>
  <tr>
    <td>Captive portal network support during setup</td><td>You can now set up your HoloLens on a guest network at hotels, conference centers, retail shops, or businesses that use captive portal.</td><td>During setup, select the network, check connect automatically, and enter the network information as prompted.</td>
  </tr>
  <tr>
    <td>Photo and video sync through OneDrive app</td><td>Your photos and videos from HoloLens will now sync via the OneDrive app from the Microsoft Store instead of the Photos app.</td><td>To set this up, download and launch the OneDrive app from the Store. On first run you'll be prompted to automatically upload your photos to OneDrive. If this prompt doesn't appear, you can find the option in the app settings.</td>
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
    <td>Automatic selection of focus point based on depth buffer</td><td>Submitting a depth buffer to Windows allows HoloLens to select a focus point automatically to optimize hologram stability.</td><td>In Unity, go to <b>Edit > Project Settings > Player > Universal Windows Platform tab > XR Settings</b>, expand the <b>Windows Mixed Reality SDK</b> item, and check <b>Enable Depth Buffer Sharing</b>. This will be automatically checked for new projects.<br><br>For DirectX apps, ensure you call the <a href="/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.commitdirect3d11depthbuffer">CommitDirect3D11DepthBuffer </a> method on <b>HolographicRenderingParameters</b> each frame to supply the depth buffer to Windows.
</td>
  </tr>
  <tr>
    <td>Holographic reprojection modes</td><td>You can now disable positional reprojection on HoloLens to improve the hologram stability of rigidly body-locked content such as 360-degree video.</td><td>In Unity, set <a href="https://docs.unity3d.com/2020.1/Documentation/ScriptReference/XR.WSA.HolographicSettings.ReprojectionMode.html">HolographicSettings.ReprojectionMode</a> to <a href="https://docs.unity3d.com/2019.1/Documentation/ScriptReference/XR.WSA.HolographicSettings.HolographicReprojectionMode.OrientationOnly.html">HolographicReprojectionMode.OrientationOnly</a> when all content in view is rigidly body-locked.<br><br>For DirectX apps, set <a href="/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters.reprojectionmode"> HolographicCameraRenderingParameters.ReprojectionMode</a> to <a href="/uwp/api/windows.graphics.holographic.holographicreprojectionmode">HolographicReprojectionMode.OrientationOnly</a> when all content in view is rigidly body-locked.</td>
  </tr>
  <tr>
    <td>App tailoring APIs</td><td>Windows APIs know more about where your app is running, like whether the device’s display is transparent (HoloLens) or opaque (immersive headset), and whether a UWP app’s 2D view is showing up in the holographic shell.</td><td>Unity had previously manually exposed <a href="https://docs.unity3d.com/2019.4/Documentation/ScriptReference/XR.WSA.HolographicSettings.IsDisplayOpaque.html">HolographicSettings.IsDisplayOpaque</a> in a way that worked even before this build.<br><br>For DirectX apps, you can now access existing APIs like <a href="/uwp/api/windows.graphics.holographic.holographicdisplay.isopaque">HolographicDisplay.GetDefault().IsOpaque</a> and <a href="/uwp/api/windows.applicationmodel.preview.holographic.holographicapplicationpreview.iscurrentviewpresentedonholographicdisplay">HolographicApplicationPreview.IsCurrentViewPresentedOnHolographicDisplay</a> on HoloLens as well.
</td>
  </tr>
  <tr>
      <td>Research mode</td><td>Allows developers to access key HoloLens sensors when building academic and industrial applications to test new ideas in the fields of computer vision and robotics, including:<ul><li>The four environment tracking cameras</li><li>Two versions of the depth-mapping camera data</li><li>Two versions of an IR-reflectivity stream</li></ul></td><td><a href="/windows/mixed-reality/develop/platform-capabilities-and-apis/research-mode">Research mode documentation</a><br><a href="https://github.com/Microsoft/HoloLensForCV">Research mode sample apps</a></td>
  </tr>
</table>

### For commercial customers

<table>
  <tr>
    <th>Feature</th><th>Details</th><th>Instructions</th>
  </tr>
  <tr>
    <td>Use multiple Azure Active Directory user accounts on a single device</td><td>Share a HoloLens with multiple Azure AD users, each with their own user settings and user data on device.</td><td><a href="/hololens/hololens-multiple-users">IT Pro Center: Share HoloLens with multiple people</a></td>
  </tr>
  <tr>
    <td>Change Wi-Fi network on sign-in</td><td>Change Wi-Fi network before sign-in to enable another user to sign in with his or her Azure AD user account for the first time, allowing users to share devices at various locations and job sites.</td><td>On the sign-in screen, you can use the network icon below the password field to connect to a network. This is helpful when this is your first-time signing into a device.</td>
  </tr>
  <tr>
    <td>Unified enrollment</td><td>It's now easy for a HoloLens user who set up the device with a personal Microsoft account to add a work account (Azure AD) and join the device to their MDM server.</td><td>Sign in with an Azure AD account, and enrollment happens automatically.</td>
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
    <td>New "Windows Holographic for Business" OS name</td><td>Clear edition naming to reduce confusion on edition upgrade license application when Commercial Suite features are enabled on HoloLens.</td><td>You can see which edition of Windows Holographic is on your device in <b>Settings > System > About</b>. "Windows Holographic for Business" will appear if an edition update has been applied to enable Commercial Suite features. Learn how to <a href="/hololens/hololens-upgrade-enterprise">unlock Windows Holographic for Business features</a>.</td>
  </tr>
  <tr>
  <td>Windows Configuration Designer (WCD)</td><td>Create and edit provisioning packages to configure HoloLens via updated WCD app. Simple HoloLens wizard for edition update, configurable OOBE, region/time zone, bulk Azure AD token, network, and developer CSP. Advanced editor filtered to HoloLens supported options, including Assigned Access and Account Management CSPs.</td><td><a href="/hololens/hololens-provisioning">IT Pro Center: Configure HoloLens using a provisioning package</a></td>
  </tr>
  <tr>
    <td>Configurable setup (OOBE)</td><td>Hide calibration, gesture/gaze training, and Wi-Fi configuration screens during setup.</td><td><a href="/hololens/hololens-provisioning#create-a-provisioning-package-for-hololens-using-the-hololens-wizard">IT Pro Center: Configure HoloLens using a provisioning package</a></td>
  </tr>
  <tr>
    <td>Bulk Azure AD token support</td><td>Pre-register device to Azure AD directory tenant for quicker user setup flow.</td><td><a href="/hololens/hololens-provisioning">IT Pro Center: Configure HoloLens using a provisioning package</a></td>
  </tr>
  <tr>
  <td>DeveloperSetup CSP</td><td>Deploy profile to set up HoloLens in Developer mode. Useful for both development and demo devices.</td><td><a href="/hololens/hololens-provisioning">IT Pro Center: Configure HoloLens using a provisioning package</a></td>
  </tr>
  <tr>
  <td>AccountManagement CSP</td><td>Share a HoloLens device and remove user data after sign-out or inactivity/storage thresholds for temporary usage. Supports Azure AD accounts.</td><td><a href="/hololens/hololens-provisioning">IT Pro Center: Configure HoloLens using a provisioning package</a></td>
  </tr>
  <tr>
  <td>Assigned access</td><td>Windows assigned access for first-line workers or demos. Single or multi-app lockdown. No need to developer unlock.</td><td><a href="/hololens/hololens-kiosk">IT Pro Center: Set up HoloLens in kiosk mode</a></td>
  </tr>
  <tr>
  <td>Guest access for kiosk devices</td><td>Windows assigned access with password-less guest account for demos. Single or multi-app lockdown. No need to developer unlock.</td><td><a href="/hololens/hololens-kiosk#guest">IT Pro Center: Set up HoloLens in kiosk mode</a></td>
  </tr>
  <tr>
    <td>Set up (OOBE) diagnostics</td><td>Get diagnostic logs from HoloLens so you can troubleshoot Azure AD sign-in failures (before Feedback Hub is available to the user whose sign-in failed).</td><td>When setup or sign-in fails, choose the new <b>Collect info</b> option to get diagnostic logs for troubleshooting.</td>
  </tr>
  <tr>
    <td>Local account indefinite password expiry</td><td>Remove disruption of device reset when local account password expires.</td><td>When provisioning a local account, you no longer need to change the password every 42 days in <b>Settings</b>, as the account password no longer expires.</td>
  </tr>
  <tr>
    <td>MDM sync status and details</td><td>Standard Windows functionality to understand MDM sync status and details from within HoloLens.</td><td>You can check the MDM sync status for a device in <b>Settings > Accounts > Access Work or School > Info</b>. In the <b>Device sync status<b> section, you can start a sync, see areas managed by MDM, and create and export an advanced diagnostics report.</td>
  </tr>
</table>

## Known issues

We've worked hard to deliver a great Windows Mixed Reality experience, but we're still tracking some known issues. If you find others, please [give us feedback](/windows/mixed-reality/give-us-feedback).

### HoloLens

#### After update

You may notice the following issues after updating from RS1 to RS4 on your HoloLens:
* **Pins reset** - The 3x3 apps pinned to your Start menu will be reset to the defaults after update. 
* **Apps and placed holograms reset** - Apps placed in your world will be removed after the update and will need to be re-placed throughout your space. 
* **Feedback Hub may not launch immediately** - Immediately after update, it will take a few minutes before you're able to launch some inbox apps such as Feedback Hub, while they update themselves. 
* **Corporate Wi-Fi certificates need to be re-synced** - We're investigating an issue that requires the HoloLens to be connected to a different network in order for corporate certificates to be re-synced to the device before it can reconnect to corporate networks using certificates. 
* **H.265 HEVC Video Playback doesn't work** - Applications that attempt to play back H.265 videos will receive an error message. The workaround is to [access the Windows Device Portal](/windows/mixed-reality/develop/platform-capabilities-and-apis/using-the-windows-device-portal), select **Apps** on the left navigation bar, and **remove** the HEVC application. Then, install the latest [HEVC Video Extension](https://www.microsoft.com/p/hevc-video-extensions/9nmzlz57r3t7) from the Microsoft Store. We're investigating the issue. 

#### For developers: updating HoloLens apps for devices running Windows 10 April 2018 Update

Along with a great list of [new features](#new-features-for-hololens), the Windows 10 April 2018 Update (RS4) for HoloLens enforces some code behaviors that previous versions didn't:
* **Permission requests to use sensitive resources (camera, microphone, and so on)** - RS4 on HoloLens will enforce permission requests for apps intending to access sensitive resources, such as the camera or microphone. RS1 on HoloLens didn't force these prompts, so, if your app assumes immediate access to these resources, it may crash in RS4 (even if the user grants permission to the requested resource). Read the relevant [UWP app capability declarations article](/windows/uwp/packaging/app-capability-declarations) for more information.
* **Calls to apps outside your own** - RS4 on HoloLens will enforce proper use of the [*Windows.System.Launcher* class](/uwp/api/Windows.System.Launcher) to launch another app from your own. For example, we've seen issues with apps calling *Windows.System.Launcher.LaunchUriForResultsAsync* from a non-ASTA (UI) thread. This would succeed in RS1 on HoloLens, but RS4 requires the call to be executed on the UI thread.

### Windows Mixed Reality on Desktop

#### Visual quality

* If you notice after the Windows 10 April 2018 Update that graphics are more blurry than before, or that the field of view looks smaller on your headset, the automatic performance setting may have been changed to maintain a sufficient framerate on a less powerful graphics card (such as Nvidia 1050). You can manually override this (if you choose) by navigating to **Settings > Mixed reality > Headset display > Experience options > Change** and changing "Automatic" to "90 Hz." You can also try changing **Visual quality** (on the same Settings page) to "High."

#### Windows Mixed Reality setup

* When setting up Windows with a headset connected, your PC monitor may go blank. Unplug your headset to enable output to your PC monitor to complete Windows setup.
* If you don't have headphones connected, you may miss tips when you first visit the Windows Mixed Reality home.
* Other Bluetooth devices can cause interference with motion controllers. If the motion controllers have connection/pairing/tracking issues, make sure the Bluetooth radio (if an external dongle) is plugged in to an unobstructed location and not immediately next to another Bluetooth dongle. Also try powering down other Bluetooth peripherals during Windows Mixed Reality sessions to see if it helps.

#### Games and apps from the Microsoft Store

* Some graphically intensive games, like Forza Motorsport 7, may cause performance issues on less capable PCs when played inside Windows Mixed Reality.

#### Audio

* If Cortana is enabled on your host PC before you use your Windows Mixed Reality headset, you may lose spatial sound simulation applied to the apps you place around the Windows Mixed Reality home. 
   * The work-around is to enable "Windows Sonic for Headphones" on all the audio devices attached to your PC, even your headset-connected audio device:
      1. Left-click the speaker icon on the desktop taskbar and select from list of audio devices.
      2. Right-click the speaker icon on the desktop taskbar and select "Windows Sonic for Headphones" in the "Speaker setup" menu.
      3. Repeat these steps for all of your audio devices (endpoints).
   * Another option is turning off "Let Cortana respond to Hey Cortana" in **Settings** > **Cortana** on your desktop before launching Windows Mixed Reality.
* When another multimedia USB device (such as a web cam) shares the same USB hub (either external or inside your PC) with the Windows Mixed Reality headset, in rare cases the headset's audio jack/headphones may either have a buzzing sound or no audio at all. You can fix this by your headset into a USB port that doesn't share the same hub as the other device, or disconnect/disable your other USB multimedia device.
* In rare cases, the host PC's USB hub can't provide enough power to the Windows Mixed Reality headset and you may notice a burst of noise from the headphones connected to the headset.

#### Holograms

* If you've placed a large number of holograms in your Windows Mixed Reality home, some may disappear and reappear as you look around. To avoid this, remove some of the holograms in that area of the Windows Mixed Reality home.

#### Motion controllers

* If input isn't being routed to the headset, the motion controller will briefly disappear when being held next to the room boundary. Pressing Win+Y to ensure there's a blue banner across the Desktop monitor will resolve this. 
* Occasionally, when you click on a web page in Microsoft Edge, the content will zoom instead of click.

#### Desktop app in the Windows Mixed Reality home

* Snipping Tool doesn't work in Desktop app.
* Desktop app doesn't persist setting on relaunch.
* If you're using Mixed Reality Portal preview on your desktop, when opening the Desktop app in the Windows Mixed Reality home, you may notice the infinite mirror effect. 
* Running the Desktop app may cause performance issues on non-Ultra Windows Mixed Reality PCs; it isn't recommended.  
* Desktop app may auto-launch because an invisible window on Desktop has focus. 
* Desktop User Account Control prompt will make headset display black until the prompt is completed.

#### Windows Mixed Reality for SteamVR

* You may need to launch Mixed Reality Portal after updating to ensure the necessary software updates for the Windows 10 April 2018 Update have completed before launching SteamVR. 
* You must be on a recent version of Windows Mixed Reality for SteamVR to remain compatible with the Windows 10 April 2018 Update. Make sure automatic updates are turned on for Windows Mixed Reality for SteamVR, which is located in the "Software" section of your library in Steam.  

#### Other issues

>[!IMPORTANT]
>An early version of the Windows 10 April 2018 Update pushed to Insiders (version 17134.5) was missing a piece of software necessary to run Windows Mixed Reality. We recommend avoiding this version if using Windows Mixed Reality. 

We've identified a performance regression when using Surface Book 2 on the initial release of this update (10.0.17134.1) that we're working to fix in an upcoming update patch. We suggest waiting until this has been fixed before updating manually or waiting for the update to roll out normally.

## Provide feedback and report issues

Use the [Feedback Hub app on your HoloLens or Windows 10 PC](/windows/mixed-reality/give-us-feedback) to provide feedback and report issues. Using Feedback Hub ensures that all necessary diagnostics information is included to help our engineers quickly debug and resolve the problem.

>[!NOTE]
>Be sure to accept the prompt that asks whether you’d like Feedback Hub to access your Documents folder (select **Yes** when prompted).

## Prior release notes

* [Release notes - October 2017](release-notes-october-2017.md)
* [Release notes - August 2016](release-notes-august-2016.md)
* [Release notes - May 2016](release-notes-may-2016.md)
* [Release notes - March 2016](release-notes-march-2016.md)

## See also
* [Immersive headset support (external link)](./troubleshooting-windows-mixed-reality.md)
* [HoloLens support (external link)](https://support.microsoft.com/products/hololens)
* [Install the tools](/windows/mixed-reality/develop/install-the-tools)
* [Give us feedback](/windows/mixed-reality/give-us-feedback)
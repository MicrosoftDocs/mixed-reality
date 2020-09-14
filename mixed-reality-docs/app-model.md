---
title: App model
description: Windows Mixed Reality uses the app model provided by the Universal Windows Platform, a model and environment for modern Windows apps.
author: thetuvix
ms.author: alexturn
ms.date: 03/21/2018
ms.topic: article
keywords: UWP, app model, lifecycle, suspend, resume, tile, views, contracts
---

# App model

Windows Mixed Reality uses the app model provided by the [Universal Windows Platform](https://docs.microsoft.com/windows/uwp/get-started/) (UWP), a model and environment for modern Windows apps. The UWP app model defines how apps are installed, updated, versioned and removed safely and completely. It governs the application life cycle - how apps execute, sleep and terminate - and how they can preserve state. It also covers integration and interaction with the operating system, files and other apps.

![2D apps arranged in the Windows Mixed Reality home in a breakfast area](images/20160112-055908-hololens-500px.jpg)<br>
*Apps with a 2D view arranged in the Windows Mixed Reality home*

## App lifecycle

The lifecycle of a mixed reality app involves standard app concepts such as placement, launch, termination and removal.

### Placement is launch

Every app starts in mixed reality by placing an app tile (just a [Windows secondary tile](https://docs.microsoft.com/uwp/api/Windows.UI.StartScreen.SecondaryTile)) in the [Windows Mixed Reality home](navigating-the-windows-mixed-reality-home.md). These app tiles, on placement, will start running the app. These app tiles persist and stay at the location where they are placed, acting like launchers for anytime you want to get back to the app.

![Placement puts a secondary tile in the world](images/slide1-600px.png)<br>
*Placement puts a secondary tile in the world*

As soon as placement completes (unless the placement was started by an [app to app](app-model.md#protocols) launch), the app starts launching. Windows Mixed Reality can run a limited number of apps at one time. As soon as you place and launch an app, other active apps may suspend, leaving a screenshot of the app's last state on its app tile wherever you placed it. See [Windows 10 UWP app lifecycle](https://docs.microsoft.com/windows/uwp/launch-resume/app-lifecycle) for more information on handling resume and other app life cycle events.

![After placing a tile, the app starts running](images/slide2-500px.png) ![State diagram for app running, suspended or not running](images/ic576232-500px.png)<br>
*Left: after placing a tile, the app starts running. Right: state diagram for app running, suspended, or not running.*

### Remove is close/terminate process

When you remove a placed app tile from the world, this closes the underlying processes. This can be useful for ensuring your app is terminated or restarting a problematic app.

### App suspension/termination

In the [Windows Mixed Reality home](navigating-the-windows-mixed-reality-home.md), the user is able to create multiple entry points for an app. They do this by launching your app from the Start menu and placing the app tile in the world. Each app tile behaves as a different entry point, and has a separate tile instance in the system. A query for [SecondaryTile.FindAllAsync](https://docs.microsoft.com/uwp/api/Windows.UI.StartScreen.SecondaryTile#Windows_UI_StartScreen_SecondaryTile_FindAllAsync) will result in a **SecondaryTile** for each app instance.

When a UWP app suspends, a screenshot is taken of the current state.

![Screenshots are shown for suspended apps](images/slide9-800px.png)<br>
*Screenshots are shown for suspended apps*

One key difference from other Windows 10 shells is how the app is informed of an app instance activation via the [CoreApplication.Resuming](https://docs.microsoft.com/uwp/api/Windows.ApplicationModel.Core.CoreApplication#Windows_ApplicationModel_Core_CoreApplication_Resuming) and [CoreWindow.Activated](https://docs.microsoft.com/uwp/api/windows.ui.core.corewindow#Windows_UI_Core_CoreWindow_Activated) events.

|  Scenario |  Resuming  |  Activated | 
|----------|----------|----------|
|  Launch new instance of app from the Start menu  |   |  **Activated** with a new [TileId](https://docs.microsoft.com/uwp/api/windows.ui.startscreen.secondarytile#Windows_UI_StartScreen_SecondaryTile_TileId) | 
|  Launch second instance of app from the Start menu  |   |  **Activated** with a new **TileId** | 
|  Select the instance of the app that is not currently active  |   |  **Activated** with the **TileId** associated with the instance | 
|  Select a different app, then select the previously active instance  |  **Resuming** raised  |  | 
|  Select a different app, then select the instance that was previously inactive  |  **Resuming** raised  |  Then **Activated** with the **TileId** associated with the instance | 

### Extended execution

Sometimes your app needs to continue doing work in the background or playing audio. [Background tasks](https://docs.microsoft.com/windows/uwp/launch-resume/declare-background-tasks-in-the-application-manifest) are available on HoloLens.

![Apps can run in the background](images/slide10-800px.png)<br>
*Apps can run in the background*

## App views

When your app activates, you can choose what type of view you'd like to display. For an app's **CoreApplication**, there is always a primary [app view](https://docs.microsoft.com/uwp/api/Windows.UI.ViewManagement.ApplicationView) and any number of further app views you would like to create. On desktop, you can think of an app view as a window. Our mixed reality app templates create a Unity project where the primary app view is [immersive](app-views.md). 

Your app can create an additional 2D app view using technology like XAML, to use Windows 10 features such as in-app purchase. If your app started as a UWP app for other Windows 10 devices, your primary view is 2D, but you could "light up" in mixed reality by adding an additional app view that's immersive to show an experience volumetrically. Imagine building a photo viewer app in XAML where the slideshow button switched to an immersive app view that flew photos from the app across the world and surfaces.

![The running app can have a 2D view or an immersive view](images/slide3-800px.png)<br>
*The running app can have a 2D view or an immersive view*

### Creating an immersive view

Mixed reality apps are those that create an immersive view, which is achieved with the [HolographicSpace](https://docs.microsoft.com/uwp/api/windows.graphics.holographic.holographicspace) type.

An app that is purely immersive should always create an immersive view on launch, even if launched from the desktop. Immersive views always show up in the headset, regardless of where they were created from. Activating an immersive view will display the Mixed Reality Portal and guide the user to put on their headset.

An app that starts with a 2D view on the desktop monitor may create a secondary immersive view to show content in the headset. An example of this is a 2D Edge window on the monitor displaying a 360-degree video in the headset.

![Apps running in immersive view are the only one visible](images/slide4-800px.png)<br>
*An app running in an immersive view is the only one visible*

### 2D view in the Windows Mixed Reality home

Anything other than an immersive view is rendered as a 2D view in your world.

An app may have 2D views on both the desktop monitor and in the headset. Note that a new 2D view will be placed in the same shell as the view that created it, either on the monitor or in the headset. It is not currently possible for an app or a user to move a 2D view between the Mixed Reality home and the monitor.

![Apps running in 2D view share the space in the mixed world with other apps](images/slide5-800px.png)<br>
*Apps running in a 2D view share the space with other apps*

### Placement of additional app tiles

You can place as many apps with a 2D view in your world as you want with the [Secondary Tile APIs](https://docs.microsoft.com/windows/uwp/design/shell/tiles-and-notifications/secondary-tiles). These "pinned" tiles will appear as splash screens that users must place and then can later use to launch your app. Windows Mixed Reality does not currently support rendering any of the 2D tile content as live tiles.

![Apps can have multiple placements using secondary tiles](images/slide6-800px.png)<br>
*Apps can have multiple placements using secondary tiles*

### Switching views

#### Switching from the 2D XAML view to the immersive view

If the app uses XAML, then the XAML [IFrameworkViewSource](https://docs.microsoft.com/uwp/api/windows.applicationmodel.core.iframeworkviewsource) will control the first view of the app. The app will need to switch to the immersive view before activating the **CoreWindow**, to ensure the app launches directly into the immersive experience.

Use [CoreApplication.CreateNewView](https://docs.microsoft.com/uwp/api/Windows.ApplicationModel.Core.CoreApplication#Windows_ApplicationModel_Core_CoreApplication_CreateNewView_Windows_ApplicationModel_Core_IFrameworkViewSource_) and [ApplicationViewSwitcher.SwitchAsync](https://docs.microsoft.com/uwp/api/Windows.UI.ViewManagement.ApplicationViewSwitcher#Windows_UI_ViewManagement_ApplicationViewSwitcher_SwitchAsync_System_Int32_) to make it the active view.

> [!NOTE]
>* Do not specify the [ApplicationViewSwitchingOptions.ConsolidateViews](https://docs.microsoft.com/uwp/api/windows.ui.viewmanagement.applicationviewswitchingoptions) flag to **SwitchAsync** when switching from the XAML view to the immersive view, or the slate that launched the app will be removed from the world.
>* **SwitchAsync** should be called using the [Dispatcher](https://docs.microsoft.com/uwp/api/windows.ui.core.corewindow#Windows_UI_Core_CoreWindow_Dispatcher) associated with the view you are switching into.
>* You will need to **SwitchAsync** back to the XAML view if you need to launch a virtual keyboard or want to activate another app.

![Apps can switch between 2D views and immersive views](images/slide7-600px.png) ![When an app goes into an immersive view, the mixed world and other apps disappear](images/slide8-600px.png)<br>
*Left: apps can switch between 2D view and immersive view. Right: when an app goes into an immersive view, the Windows Mixed Reality home and other apps disappear.*

#### Switching from the immersive view back to a keyboard XAML view

One common reason for switching back-and-forth between views is displaying a keyboard in a mixed reality app. The shell is only able to display the system keyboard if the app is showing a 2D view. If the app needs to get text input, it may provide a custom XAML view with a text input field, switch to it, and then switch back after the input is complete.

Like in the previous section, you can use **ApplicationViewSwitcher.SwitchAsync** to transition back to a XAML view from your immersive view.

## App size

2D app views always appear in a fixed virtual slate. This makes all 2D views show the exact same amount of content. Here are some further details about the size of your app's 2D view:
* The aspect ratio of the app is preserved while resizing.
* App [resolution and scale factor](building-2d-apps.md#2d-app-view-resolution-and-scale-factor) are not changed by resizing.
* Apps are not able to query their actual size in the world.

![2D apps appear with fixed window sizes](images/12493521-10104043956964683-6118765685995662420-o-500px.jpg)<br>
*Apps with a 2D view appear with fixed window sizes*

## App tiles

The Start menu uses the standard small tile and medium tile for pins and the **All Apps** list in mixed reality. 

![The Start menu for Windows Mixed Reality](images/start-500px.png)<br>
*The Start menu for Windows Mixed Reality*

## App to app interactions

As you build apps, you have access to the rich app to app communication mechanisms available on Windows 10. Many of the new Protocol APIs and file registrations work perfectly on HoloLens to enable app launching and communication. 

Note that for desktop headsets, the app associated with a given file extension or protocol may be a Win32 app that can only appear on the desktop monitor or in the desktop slate.

### Protocols

HoloLens supports app to app launching via the [Windows.System.Launcher APIs](https://docs.microsoft.com/uwp/api/Windows.System.Launcher).

There are some things to consider when launching another application:

* When doing a non-modal launch, such as [LaunchUriAsync](https://docs.microsoft.com/uwp/api/Windows.System.Launcher#Windows_System_Launcher_LaunchUriAsync_Windows_Foundation_Uri_), the user must place the app before interacting with it.

* When doing a modal launch, such as through [LaunchUriForResultsAsync](https://docs.microsoft.com/uwp/api/Windows.System.Launcher#Windows_System_Launcher_LaunchUriForResultsAsync_Windows_Foundation_Uri_Windows_System_LauncherOptions_Windows_Foundation_Collections_ValueSet_), the modal app is placed on top of the window.

* Windows Mixed Reality cannot overlay applications on top of exclusive views. In order to show the launched app, Windows takes the user back to the world to display the application.

### File pickers

HoloLens supports both [FileOpenPicker](https://docs.microsoft.com/uwp/api/Windows.Storage.Pickers.FileOpenPicker) and [FileSavePicker](https://docs.microsoft.com/uwp/api/Windows.Storage.Pickers.FileSavePicker) contracts. However, no app comes pre-installed that fulfills the file picker contracts. These apps - OneDrive, for example - can be installed from the Microsoft Store.

If you have more than one file picker app installed, you will not see any disambiguation UI for choosing which app to launch; instead, the first file picker installed will be chosen. When saving a file, the filename is generated which includes the timestamp. This cannot be changed by the user.

By default, the following extensions are supported locally:

|  App  |  Extensions | 
|----------|----------|
|  Photos  |  bmp, gif, jpg, png, avi, mov, mp4, wmv | 
|  Microsoft Edge  |  htm, html, pdf, svg, xml | 

### App contracts and Windows Mixed Reality extensions

App contracts and extension points allow you to register your app to take advantage of deeper operating system features like handling a file extension or using background tasks. This is a list of the supported and unsupported contracts and extension points on HoloLens.

|  Contract or Extension  |  Supported? | 
|----------|----------|
| [Account Picture Provider (extension)](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#account_picture_provider) | Unsupported | 
| [Alarm](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#alarm) | Unsupported | 
| [App service](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#app_service) | Supported but not fully functional | 
| [Appointments provider](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#appointmnets_provider) | Unsupported | 
| [AutoPlay (extension)](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#autoplay) | Unsupported | 
| [Background tasks (extension)](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#background_tasts) | Partially Supported (not all triggers work) | 
| [Update task (extension)](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#update_task) | Supported | 
| [Cached file updater contract](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#cached_file_updater) | Supported | 
| [Camera settings (extension)](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#camera_settings) | Unsupported | 
| [Dial protocol](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#dial_protocol) | Unsupported | 
| [File activation (extension)](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#file_activation) | Supported | 
| [File Open Picker contract](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#file_open_picker_contract) | Supported | 
| [File Save Picker contract](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#file_save_picker_contract) | Supported | 
| [Lock screen call](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#lock_screen_call) | Unsupported | 
| [Media playback](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#media_playback) | Unsupported | 
| [Play To contract](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#playto_contract) | Unsupported | 
| [Preinstalled config task](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#preinstalled_config_task) | Unsupported | 
| [Print 3D Workflow](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#print_3d_workflow) | Supported | 
| [Print task settings (extension)](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#print_task_settings) | Unsupported | 
| [URI activation (extension)](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#protocol_activation) | Supported | 
| [Restricted launch](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#restricted_launch) | Unsupported | 
| [Search contract](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#search_contract) | Unsupported | 
| [Settings contract](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#settings_contract) | Unsupported | 
| [Share contract](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#share_contract) | Unsupported | 
| [SSL/certificates (extension)](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#ssl_certificates) | Supported | 
| [Web account provider](https://msdn.microsoft.com/library/windows/desktop/hh464906.aspx#web_account_provider) | Supported | 

## App file storage

All storage is through the [Windows.Storage namespace](https://docs.microsoft.com/uwp/api/Windows.Storage). See the following documentation for more details. HoloLens does not support app storage sync/roaming.

* [Files, folders, and libraries](https://docs.microsoft.com/windows/uwp/files/index)
* [Store and retrieve settings and other app data](https://docs.microsoft.com/windows/uwp/design/app-settings/store-and-retrieve-app-data)

### Known folders

See [KnownFolders](https://docs.microsoft.com/uwp/api/Windows.Storage.KnownFolders) for the full details for UWP apps.

<table>
<tr>
<th> Property</th><th> Supported on HoloLens</th><th> Supported on immersive headsets</th><th> Description</th>
</tr><tr>
<td><a href="https://docs.microsoft.com/uwp/api/Windows.Storage.KnownFolders#Windows_Storage_KnownFolders_AppCaptures">AppCaptures</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td><td>Gets the App Captures folder.</td>
</tr><tr>
<td><a href="https://docs.microsoft.com/uwp/api/Windows.Storage.KnownFolders#Windows_Storage_KnownFolders_CameraRoll">CameraRoll</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td><td>Gets the Camera Roll folder.</td>
</tr><tr>
<td><a href="https://docs.microsoft.com/uwp/api/Windows.Storage.KnownFolders#Windows_Storage_KnownFolders_DocumentsLibrary">DocumentsLibrary</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td><td>Gets the Documents library. The Documents library is not intended for general use.</td>
</tr><tr>
<td><a href="https://docs.microsoft.com/uwp/api/Windows.Storage.KnownFolders#Windows_Storage_KnownFolders_MusicLibrary">MusicLibrary</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td><td>Gets the Music library.</td>
</tr><tr>
<td><a href="https://docs.microsoft.com/uwp/api/Windows.Storage.KnownFolders#Windows_Storage_KnownFolders_Objects3D">Objects3D</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td><td>Gets the Objects 3D folder.</td>
</tr><tr>
<td><a href="https://docs.microsoft.com/uwp/api/Windows.Storage.KnownFolders#Windows_Storage_KnownFolders_PicturesLibrary">PicturesLibrary</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td><td>Gets the Pictures library.</td>
</tr><tr>
<td><a href="https://docs.microsoft.com/uwp/api/Windows.Storage.KnownFolders#Windows_Storage_KnownFolders_Playlists">Playlists</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td><td>Gets the play lists folder.</td>
</tr><tr>
<td><a href="https://docs.microsoft.com/uwp/api/Windows.Storage.KnownFolders#Windows_Storage_KnownFolders_SavedPictures">SavedPictures</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td><td>Gets the Saved Pictures folder.</td>
</tr><tr>
<td><a href="https://docs.microsoft.com/uwp/api/Windows.Storage.KnownFolders#Windows_Storage_KnownFolders_VideosLibrary">VideosLibrary</a></td><td style="text-align: center;">✔️</td><td style="text-align: center;">✔️</td><td>Gets the Videos library.</td>
</tr><tr>
<td><a href="https://docs.microsoft.com/uwp/api/Windows.Storage.KnownFolders#Windows_Storage_KnownFolders_HomeGroup">HomeGroup</a></td><td></td><td style="text-align: center;">✔️</td><td>Gets the HomeGroup folder.</td>
</tr><tr>
<td><a href="https://docs.microsoft.com/uwp/api/Windows.Storage.KnownFolders#Windows_Storage_KnownFolders_MediaServerDevices">MediaServerDevices</a></td><td></td><td style="text-align: center;">✔️</td><td>Gets the folder of media server (Digital Living Network Alliance (DLNA)) devices.</td>
</tr><tr>
<td><a href="https://docs.microsoft.com/uwp/api/Windows.Storage.KnownFolders#Windows_Storage_KnownFolders_RecordedCalls">RecordedCalls</a></td><td></td><td style="text-align: center;">✔️</td><td>Gets the recorded calls folder.</td>
</tr><tr>
<td><a href="https://docs.microsoft.com/uwp/api/Windows.Storage.KnownFolders#Windows_Storage_KnownFolders_RemovableDevices">RemovableDevices</a></td><td></td><td style="text-align: center;">✔️</td><td>Gets the removable devices folder.</td>
</tr>
</table>

## App package

With Windows 10 you no longer target an operating system but instead [target your app to one or more device families](https://docs.microsoft.com/windows/uwp/get-started/universal-application-platform-guide#device-families). A device family identifies the APIs, system characteristics, and behaviors that you can expect across devices within the device family. It also determines the set of devices on which your app can be installed from the [Microsoft Store](submitting-an-app-to-the-microsoft-store.md#specifying-target-device-families).

* To target both desktop headsets and HoloLens, target your app to the **Windows.Universal** device family.
* To target just desktop headsets, target your app to the **Windows.Desktop** device family.
* To target just HoloLens, target your app to the **Windows.Holographic** device family.

## See also

* [App views](app-views.md)
* [Updating 2D UWP apps for mixed reality](building-2d-apps.md)
* [3D app launcher design guidance](3d-app-launcher-design-guidance.md)
* [Implementing 3D app launchers](implementing-3d-app-launchers.md)

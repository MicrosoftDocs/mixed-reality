---
title: Release notes - May 2016
description: HoloLens release notes for the Windows Holographic May 2016 Update.
author: mattzmsft
ms.author: mazeller
ms.date: 03/21/2018
ms.topic: article
keywords: HoloLens, release notes, os, features, build, platform
---



# Release notes - May 2016

The HoloLens team is committed to provide you with an update on our latest feature development and major fixes through the Windows Insider Program. Thanks to all your suggestions, we take your feedback to heart. Please continue to [give us feedback](give-us-feedback.md) through the Feedback Hub, the [developer forums](https://forums.hololens.com) and [Twitter via @HoloLens](https://twitter.com/hololens).

**Release version:** Windows Holographic May 2016 Update (**10.0.14342.1016**)

>[!VIDEO https://www.youtube.com/embed/XM5OHHrOGqQ]

To update to the current release, open the *Settings* app, go to *Update & Security*, then select the *Check for updates* button.

## New features

* You can now **run up to three apps in 2D view simultaneously**. This enables endless use cases for multi-tasking in HoloLens. Have the new Feedback Hub with the list of Quests open while exploring the new features on this flight.

  ![HoloLens can run three apps at the same time](images/img-3625-400px.jpg)<br>
  Run up to three apps in 2D view simultaneously

* We've added new **voice commands**:
   * Try looking at a hologram and rotate it by saying "face me"
   * Change its size by saying "bigger" or "smaller"
   * Move an app by saying "Hey Cortana, move *app name* here."
* We've made **developing on HoloLens easier**. You can now browse, upload, and download files through the [Windows Device Portal](using-the-windows-device-portal.md). You can access the Documents folder, Pictures folder, and the local storage for any app you side-loaded or deployed through Visual Studio.
* The **emulator now supports log-in with a Microsoft Account** just like you would on a real HoloLens. You can enable this from the Additional Tools menu ">>".
* **2D Apps now hide the app bar and cursor when watching video full screen** to avoid distraction. With this, your video watching experience will be even more enjoyable on HoloLens.
* You can also **pin photos without the app bar** in your world .

  ![The app bar can be hidden for 2D apps like photos](images/img-3626-400px.jpg)<br>
  The app bar can be hidden for apps with a 2D view, like Photos
  
* **File picker** works just like you expect it to on HoloLens.
* Updated **Edge browser** to map unified user experience with desktop and phone. We enabled multiple instances of your browser, custom HoloLens new tab page, tab peek, and open in new windows, along with power & performance improvements.
* **Groove Music** app is now on HoloLens. Visit the store to download it and try playing in the background.
* You can easily customize how apps are arranged in your world. Try **rotating your holograms** in adjust mode by simply click and drag on circle in the middle vertical wireframes. You might notice holograms have **tighter fitted bounding boxes** to ensure maximized interaction. You can also resize all flat apps vertically (except Photos and Hologram apps).

  ![Holograms can be rotated after you place them in the world](images/img-3627-400px.jpg)<br>
  Rotate holograms after you place them in your world

* We've made a lot of **input improvement** in this flight. You can connect a regular Bluetooth mouse to HoloLens. The clicker has been fine tuned to enable resizing & moving holograms with a clicker. Keyboard is also running better than ever.
* Now you can take **mixed reality pictures** by simply pressing down the volume up + volume down simultaneously. You can also share your mixed reality captured photos & videos to Facebook, Twitter and YouTube.
* The maximum recording length of **mixed reality videos** has been increased to five minutes.
* **Photos app** now streams videos from OneDrive instead of having to download the entire video before playback.
* We've improved how your **holograms will be right where you left them**. You will also be presented the option to re-connect to Wi-Fi and try again if HoloLens cannot detect where they are.
* The keyboard has an **improved layout for entering email address** with keys that allow you to enter the most popular email domains with a single click.
* Faster **app registration** and **auto detection of time zone** during OOBE, giving you the best first user experience.
* **Storage sense** allows you to view remaining and used disk space by the system and apps in the settings app.
* We have converged Feedback App and Inside Hub into a single app **Feedback Hub** that will be the go-to tool for **giving us feedback**, which features you love, which features you could do without, or when something could be better. When you join the Insider Program, you can keep up on **get latest Insider news**, **rate builds** and go on **feedback quests** from Feedback Hub.
* We've also [published an updated HoloLens Emulator](install-the-tools.md) build.
* Your mixed reality videos now look better due to automatic **video stabilization**.

## Major fixes

We fixed issues with hologram spaces where the spaces would be slow or incorrectly detected. We fixed a shutdown issue that could continue to try launching the shell during shutdown.

We fixed an issue
* that blocks the ability to resume a XAML application.
* where a crash would leave a black screen and some jagged lines.
* scrolling would sometimes stick in the wrong direction when using some apps.
* the power LEDs could indicate an off state when the device was still on.
* WiFi could get turned off after resuming from standby.
* the Xbox identity provider offers gamertag setup and then gets stuck in a loop.
* the Shell occasionally crashes when selecting a downloaded file in the OneDrive File Picker.
* pressing and holding on a link sometimes both opens a new, broken tab and opens a context menu.
* where windows device portal didn’t allow IPD adjustments from 50 to 80

We fixed issues with Photos where
* an image would occasionally display rotated due to ignoring the EXIF orientation property.
* it could crash during start-up on pinned Photos.
* videos would restart after pausing instead of continuing from where last paused.
* replay of a shared video could be prevented if it was shared while playing.
* Mixed Reality Capture recordings would begin with 0.5-1 second of audio only feed.
* the Sync button disappears during initial OneDrive sync.

We fixed issues with settings where
* a refresh was needed when the environment changes.
* 'Enter' on keyboard would not behave like clicking Next in some dialogs.
* it was hard to know when the clicker failed pairing.
* it could become unresponsive with WiFi disconnect and connect.

We fixed issues with Cortana where
* it could get stuck displaying the Listening UI.
* asking "Hey Cortana, what can I say" from an exclusive mode app would get stuck if you answered maybe rather yes/no to the request to exit the app.
* the Cortana listening UI doesn't resume correctly if you ask Cortana to go to sleep and then resume.
* the queries "What network am I connected to?" and the "Am I connected?" could fail when the first network profile comes back with no connectivity.
* the UI froze on "Listening" but upon exiting an app would immediately began doing speech recognition again.
* where signing out of the Cortana app wouldn't let you sign back into it until a reboot.
* it would not launch when Mixed Reality Capture UI was active.

We fixed issues with Visual Studio where
* background task debugging did not work.
* frame analysis in the graphics debugger did not work.
* the HoloLens Emulator did not appear in the drop-down list for Visual Studio unless your project's TargetPlatformVersion was set to 10240.

## Changes from previous release
* The Cortana command **Hey Cortana, reboot the device** does not work. User can say **Hey Cortana, restart** or **Hey Cortana, restart the device**.
* Kiosk mode has been removed from the product.

## Prior release notes
* [Release notes - March 2016](release-notes-march-2016.md)

## See also
* [HoloLens known issues](hololens-known-issues.md)
* [Install the tools](install-the-tools.md)
* [Shell](navigating-the-windows-mixed-reality-home.md)
* [Updating 2D UWP apps for mixed reality](building-2d-apps.md)
* [Hardware accessories](hardware-accessories.md)
* [Mixed reality capture](mixed-reality-capture.md)
* [Voice input](voice-input.md)
* [Submitting an app to the Windows Store](submitting-an-app-to-the-microsoft-store.md)
* [Using the HoloLens emulator](using-the-hololens-emulator.md)

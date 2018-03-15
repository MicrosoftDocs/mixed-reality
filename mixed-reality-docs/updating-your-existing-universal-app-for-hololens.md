---
title: Updating your existing universal app for HoloLens
description: How to make your existing 2D UWP app work best on HoloLens
author: thetuvix
ms.author: alexturn
ms.date: 2/28/2018
ms.topic: article
keywords: UWP, 2D app, flat app, app model, back button, app bar, dpi
---



# Updating your existing universal app for HoloLens

Universal Windows Platform (UWP) is about making it easy for app experiences to work across devices. This is a quick guide to making your 2D UWP app work great in mixed reality.

## Universal App Resolution and Scale Factor

![From responsive design](images/scale-500px.png)

Windows 10 moves all visual design from real screen pixels to **effective pixels**. That means, developers design their UI following the Windows 10 Human Interface Guidelines for effective pixels, and Windows scaling ensures those effective pixels are the right size for usability across devices, resolutions, DPI, etc. See this [great read on MSDN](https://msdn.microsoft.com/library/windows/apps/Dn958435.aspx) to learn more as well as this [BUILD presentation](http://video.ch9.ms/sessions/build/2015/2-63_Build_2015_Windows_Scaling.pptx).

Even with the unique ability to place apps in your world at a range of distances, TV-like viewing distances are recommended to produce the best readability and interaction with gaze/gesture. Because of that, a virtual slate in the Mixed Reality Home will display your flat UWP view at:

**1280x720, 150%DPI** (853x480 effective pixels)

This resolution has several advantages:
* This effective pixel layout will have about the same information density as a tablet or small desktop.
* It matches the fixed DPI and effective pixels for UWP apps running on Xbox One, enabling seamless experiences across devices.
* This size looks good when scaled across our range of operating distances for apps in the world.

## Interface Design Dos and Don'ts

**Do:**
* Follow the [Windows 10 Human Interface Guidelines (HIG)](https://dev.windows.com/en-us/design) for styles, font sizes and button sizes. HoloLens will do the work to ensure your app will have compatible app patterns, readable text sizes, and appropriate hit target sizing.
* Ensure your UI follows best practices for [responsive design](https://msdn.microsoft.com/en-us/library/windows/apps/dn958435.aspx) to look best at HoloLen's unique resolution and DPI.
* Use the "light" color theme recommendations from Windows.

**Don't:**
* Change your UI too drastically when in mixed reality, to ensure users have a familiar experience in and out of the headset.

## Understand the App Model

The [app model](app-model.md) for mixed reality is designed to use the Mixed Reality Home, where many apps live together. Think of this as the mixed reality equivalent of the desktop, where you run many 2D apps at once. This has implications on app life cycle, Tiles, and other key features of your app.

## App bar and back button

2D views are decorated with a app bar above their content. The app bar has two points of app-specific personalization:

**Title:** displays the *displayname* of the Tile associated with the app instance

**Back Button:** raises the *[BackRequested](https://msdn.microsoft.com/en-us/library/windows/apps/windows.ui.core.systemnavigationmanager.backrequested.aspx)* event when pressed. Back Button visibility is controlled by *[SystemNavigationManager.AppViewBackButtonVisibility](https://msdn.microsoft.com/en-us/library/windows/apps/windows.ui.core.systemnavigationmanager.aspx)*.

![App bar UI in 2D app view](images/12697297-10104100857470613-1470416918759008487-o-500px.jpg)

## Test your app

It is important to test your app to make sure the text is readable, the buttons are targetable, and the overall app looks correct. You can [test](testing-your-app-on-hololens.md) on a desktop headset, a HoloLens, an emulator, or a touch device with resolution set to 1280x720 @150%.

## See also
* [Submitting an app to the Windows Store](submitting-an-app-to-the-microsoft-store.md)
* [Testing your app on HoloLens](testing-your-app-on-hololens.md)

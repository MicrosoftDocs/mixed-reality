---
title: Updating 2D UWP apps for Windows Mixed Reality
description: This article outlines updating your existing 2D Universal Windows Platform app to run on HoloLens and Windows Mixed Reality immersive headsets.
author: mattzmsft
ms.author: mazeller
ms.date: 03/21/2018
ms.topic: article
keywords: 2D app, UWP, flat app, HoloLens, immersive headset, app model, back button, app bar, dpi, resolution, scale, porting, HoloLens 1st gen, HoloLens 2, mixed reality headset, windows mixed reality headset, migration, Windows 10
---

# Updating 2D UWP apps for Windows Mixed Reality

Windows Mixed Reality lets your users see holograms as if they're right around them in the physical and digital world. At its core, both HoloLens and the Desktop PCs you attach immersive headset accessories to are Windows 10 devices. You're able to run almost all Universal Windows Platform (UWP) apps in the Store as 2D apps.

## Creating a 2D UWP app for mixed reality

The first step to bringing a 2D app to mixed reality headsets is to get your app running as a standard 2D app on your desktop monitor.

### Building a new 2D UWP app

To build a new 2D app for mixed reality, you build a standard 2D Universal Windows Platform (UWP) app. No other app changes are required for that app to then run as a slate in mixed reality.

To get started building a 2D UWP app, check out the [Create your first app](/windows/uwp/get-started/your-first-app) article.

### Bringing an existing 2D Store app to UWP

If you already have a 2D Windows app in the Store, make sure it's targeting the Windows 10 Universal Windows Platform (UWP). Here are all the potential starting points you may have with your Store app today:
<br>

|  Starting Point  |  AppX Manifest Platform Target  |  How to make this Universal? | 
|----------|----------|----------|
|  Windows Phone (Silverlight)  |  Silverlight App Manifest |  [Migrate to WinRT](/previous-versions/windows/apps/dn642486(v=vs.105)) | 
|  Windows Phone 8.1 Universal  |  8.1 AppX Manifest that Doesn't Include Platform Target  |  [Migrate your app to the Universal Windows Platform](/previous-versions/visualstudio/visual-studio-2015/misc/migrate-apps-to-the-universal-windows-platform-uwp) | 
|  Windows Store 8  |  8 AppX Manifest that Doesn't Include Platform Target  |  [Migrate your app to the Universal Windows Platform](/previous-versions/visualstudio/visual-studio-2015/misc/migrate-apps-to-the-universal-windows-platform-uwp) | 
|  Windows Store 8.1 Universal  |  8.1 AppX Manifest that Doesn't Include Platform Target  |  [Migrate your app to the Universal Windows Platform](/previous-versions/visualstudio/visual-studio-2015/misc/migrate-apps-to-the-universal-windows-platform-uwp) | 

If you have a 2D Unity app today built as a Win32 app on the **PC, Mac & Linux Standalone** build target, switch to the **Universal Windows Platform** build target for mixed reality.

We'll talk about ways that you can restrict your app specifically to HoloLens using the Windows.Holographic device family [below](#publish-and-maintain-your-universal-app).

### Run your 2D app in a Windows Mixed Reality immersive headset

If you've deployed your 2D app to a desktop machine and tried it out on your monitor, you're ready to try it out on an immersive desktop headset!

Just go to the Start menu within the mixed reality headset and launch the app from there. The desktop shell and the holographic shell both share the same set of UWP apps, and so the app should already be present once you've deployed from Visual Studio.

## Targeting both immersive headsets and HoloLens

Congratulations! Your app is now using the Windows 10 Universal Windows Platform (UWP).

Your app is now capable of running on today's Windows devices like Desktop, Mobile, Xbox, Windows Mixed Reality immersive headsets, HoloLens, and future Windows devices. However, to actually target all of those devices, you will need to ensure your app is targeting the Windows. Universal device family.

### Change your device family to Windows.Universal

Now let's jump into your AppX manifest to ensure your Windows 10 UWP app can run on HoloLens:
* Open your app's solution file with **Visual Studio** and navigate to the app package manifest
* Right-click the **Package.appxmanifest** file in your Solution and go to **View Code**<br>
  ![package.appxmanifest in Solution Explorer](images/openappxmanifest-500px.png)<br>
* Ensure your Target Platform is Windows. Universal in the dependencies section
  ```
  <Dependencies>
    <TargetDeviceFamily Name="Windows.Universal" MinVersion="10.0.10240.0" MaxVersionTested="10.0.10586.0" />
  </Dependencies>
  ```
* Save!

If you don't use Visual Studio for your development environment, you can open **AppXManifest.xml** in the text editor of your choice to ensure you're targeting the **Windows.Universal** *TargetDeviceFamily*.

### Run in the HoloLens Emulator

Now that your UWP app targets "Windows.Universal", let's build your app and run it in the [HoloLens Emulator](../platform-capabilities-and-apis/using-the-hololens-emulator.md).
* Make sure you're [installed the HoloLens Emulator](../install-the-tools.md).
* In Visual Studio, select the **x86** build configuration for your app

  ![x86 build configuration in Visual Studio](../platform-capabilities-and-apis/images/x86setting.png)<br>
* Select **HoloLens Emulator** in the deployment target drop-down menu

  ![HoloLens Emulator in deployment target list](images/deployemulator-500px.png)<br>
* Select **Debug > Start Debugging** to deploy your app and start debugging.
* The emulator will start and run your app.
* With a keyboard, mouse, and an Xbox controller, place your app in the world to launch it.

  ![HoloLens Emulator loaded with a UWP sample](images/hololensemulatorwithuwpsample-800px.png)<br>

### Next steps

At this point, one of two things can happen:
1. Your app will show its splash and start running after it's placed in the Emulator! Awesome!
2. Or after you see a loading animation for a 2D hologram, loading will stop and you'll just see your app at its splash screen. This means that something went wrong and it will take more investigation to understand how to bring your app to life in Mixed Reality.

You'll need to debug to get to the root of possible issues that are stopping your UWP app from starting on HoloLens.

### Running your UWP app in the debugger

These steps will walk you through debugging your UWP app using the Visual Studio debugger.
* If you haven't already done so, open your solution in Visual Studio. Change the target to the **HoloLens Emulator** and the build configuration to **x86**.
* Select **Debug > Start Debugging** to deploy your app and start debugging.
* Place the app in the world with your mouse, keyboard, or Xbox controller.
* Visual Studio should now break somewhere in your app code.
  - If your app doesn't immediately crash or break into the debugger because of an unhandled error, then go through a test pass of the core features of your app to make sure everything is running and functional. You may see errors like pictured below (internal exceptions that are being handled). To ensure you don't miss internal errors that impact the experience of your app, run through your automated tests and unit tests to make sure everything behaves as expected.

![HoloLens Emulator loaded with a UWP sample showing a system exception](images/hololensemulatorwithuwpsampleexception-800px.png)

## Update your UI

Now that your UWP app is running on immersive headsets and HoloLens as a 2D hologram, next we'll make sure it looks beautiful. Here are some things to consider:
* Windows Mixed Reality will run all 2D apps at a fixed resolution and DPI that equates to 853x480 effective pixels. Consider if your design needs refinement at this scale and review the design guidance below to improve your experience on HoloLens and immersive headsets.
* Windows Mixed Reality [doesn't support](../../design/app-model.md) 2D live tiles. If your core functionality is showing information on a live tile, consider moving that information back into your app or explore [3D app launchers](../../distribute/3d-app-launcher-design-guidance.md).

### 2D app view resolution and scale factor

![From responsive design](images/scale-500px.png)

Windows 10 moves all visual design from real screen pixels to **effective pixels**. That means, developers design their UI following the Windows 10 Human Interface Guidelines for effective pixels, and Windows scaling ensures those effective pixels are the right size for usability across devices, resolutions, DPI, and so on. See this [great read on MSDN](/windows/uwp/design/layout/screen-sizes-and-breakpoints-for-responsive-design) and this [BUILD presentation](https://video.ch9.ms/sessions/build/2015/2-63_Build_2015_Windows_Scaling.pptx) for more information.

Even with the unique ability to place apps in your world at a range of distances, TV-like viewing distances are recommended to produce the best readability and interaction with gaze/gesture. Because of that, a virtual slate in the Mixed Reality Home will display your flat UWP view at:

**1280x720, 150%DPI** (853x480 effective pixels)

This resolution has several advantages:
* This effective pixel layout will have about the same information density as a tablet or small desktop.
* It matches the fixed DPI and effective pixels for UWP apps running on Xbox One, enabling seamless experiences across devices.
* This size looks good when scaled across our range of operating distances for apps in the world.

### 2D app view interface design best practices

**Do:**
* Follow the [Windows 10 Human Interface Guidelines (HIG)](https://dev.windows.com/design) for styles, font sizes and button sizes. HoloLens will do the work to ensure your app will have compatible app patterns, readable text sizes, and appropriate hit target sizing.
* Ensure your UI follows best practices for [responsive design](/windows/uwp/design/layout/screen-sizes-and-breakpoints-for-responsive-design) to look best at HoloLens's unique resolution and DPI.
* Use the "light" color theme recommendations from Windows.

**Don't:**
* Change your UI too drastically when in mixed reality, to ensure users have a familiar experience in and out of the headset.

### Understand the app model

The [app model](../../design/app-model.md) for mixed reality is designed to use the Mixed Reality Home, where many apps live together. Think of this as the mixed reality equivalent of the desktop, where you run many 2D apps at once. This has implications on app life cycle, Tiles, and other key features of your app.

### App bar and back button

2D views are decorated with an app bar above their content. The app bar has two points of app-specific personalization:

**Title:** displays the *displayname* of the Tile associated with the app instance

**Back Button:** raises the *[BackRequested](/uwp/api/Windows.UI.Core.SystemNavigationManager)* event when pressed. Back Button visibility is controlled by *[SystemNavigationManager.AppViewBackButtonVisibility](/uwp/api/Windows.UI.Core.SystemNavigationManager)*.

![App bar UI in 2D app view](images/12697297-10104100857470613-1470416918759008487-o-500px.jpg)<br>
*App bar UI in 2D app view*

### Test your 2D app's design

It's important to test your app to make sure the text is readable, the buttons are targetable, and the overall app looks correct. You can [test](../platform-capabilities-and-apis/testing-your-app-on-hololens.md) on a desktop headset, a HoloLens, an emulator, or a touch device with resolution set to 1280x720 @150%.

## New input possibilities

HoloLens uses advanced depth sensors to see the world and see users. This enables advanced hand gestures like [bloom](../../design/system-gesture.md#bloom) and [air-tap](../../design/gaze-and-commit.md#composite-gestures). Powerful microphones also enable [voice experiences](../../design/voice-input.md).

With Desktop headsets, users can use motion controllers to point at apps and take action. They can also use a gamepad, targeting objects with their gaze.

Windows takes care of all of this complexity for UWP apps, translating your [gaze](../../design/gaze-and-commit.md), gestures, voice, and motion controller input to [pointer events](/windows/uwp/design/input/handle-pointer-input#pointer_events) that abstract away the input mechanism. For example, a user may have done an air-tap with their hand or pulled the Select trigger on a motion controller, but 2D applications don't need to know where the input came from - they just see a 2D touch press, as if on a touchscreen.

Here are the high-level concepts/scenarios you should understand for input when bringing your UWP app to HoloLens:
* [Gaze](../../design/gaze-and-commit.md) turns into hover events, which can unexpectedly trigger menus, flyouts or other user interface elements to pop up just by gazing around your app.
* Gaze isn't as precise as mouse input. Use appropriately sized hit targets for HoloLens, similar to touch-friendly mobile applications. Small elements near the edges of the app are especially hard to interact with.
* Users must switch input modes to go from scrolling to dragging to two finger panning. If your app was designed for touch input, consider ensuring that no major functionality is locked behind two finger panning. If so, consider having alternative input mechanisms like buttons that can start two finger panning. For example, the Maps app can zoom with two finger panning but has a plus, minus, and rotate button to simulate the same zoom interactions with single clicks.

[Voice input](../../design/voice-input.md) is a critical part of the mixed reality experience. We've enabled all of the speech APIs that are in Windows 10 powering Cortana when using a headset.

## Publish and Maintain your Universal app

Once your app is up and running, package your app to [submit it to the Microsoft Store](../../distribute/submitting-an-app-to-the-microsoft-store.md).

## See also
* [App model](../../design/app-model.md)
* [Head-gaze and commit](../../design/gaze-and-commit.md)
* [Motion controllers](../../design/motion-controllers.md)
* [Voice input](../../design/voice-input.md)
* [Submitting an app to the Microsoft Store](../../distribute/submitting-an-app-to-the-microsoft-store.md)
* [Using the HoloLens emulator](../platform-capabilities-and-apis/using-the-hololens-emulator.md)
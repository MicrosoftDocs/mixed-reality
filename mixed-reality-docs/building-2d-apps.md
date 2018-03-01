---
title: Building 2D apps
description: 
author: 
ms.author: mazeller
ms.date: 2/28/2018
ms.topic: article
keywords: 
---



# Building 2D apps

Windows Mixed Reality enables a user to see holograms as if they are right around you, in your physical or digital world. At its core, both HoloLens and the Desktop PCs you attach headset accessories to are Windows 10 devices; this means that you're able to run almost all of the Universal Windows Platform (UWP) apps in the Store as 2D apps.

## Creating a 2D UWP app for mixed reality

The first step to bringing a 2D app to mixed reality headsets is to get your app running as a standard 2D app on your desktop monitor.

### Building a new 2D UWP app

To build a new 2D app for mixed reality, you simply build a standard 2D Universal Windows Platform (UWP) app. No other app changes are required for that app to then run as a slate in mixed reality.

To get started building a 2D UWP app, check out the [Create your first app](https://docs.microsoft.com/en-us/windows/uwp/get-started/your-first-app) article.

### Bringing an existing 2D Store app to UWP

If you already have a 2D Windows app in the Store, you must first ensure it is targeting the Windows 10 Universal Windows Platform (UWP). Here are all the potential starting points you may have with your Store app today:

|  Starting Point  |  AppX Manifest Platform Target  |  How to make this Universal? | 
|----------|----------|----------|
|  Windows Phone (Silverlight)  |  Silverlight App Manifest |  [Migrate to WinRT](https://msdn.microsoft.com/en-us/library/windows/apps/dn642486(v=vs.105).aspx) | 
|  Windows Phone 8.1 Universal  |  8.1 AppX Manifest that Doesn't Include Platform Target  |  [Migrate your app to the Universal Windows Platform](https://msdn.microsoft.com/en-us/library/mt148501.aspx) | 
|  Windows Store 8  |  8 AppX Manifest that Doesn't Include Platform Target  |  [Migrate your app to the Universal Windows Platform](https://msdn.microsoft.com/en-us/library/mt148501.aspx) | 
|  Windows Store 8.1 Universal  |  8.1 AppX Manifest that Doesn't Include Platform Target  |  [Migrate your app to the Universal Windows Platform](https://msdn.microsoft.com/en-us/library/mt148501.aspx) | 

If you have a 2D Unity app today built as a Win32 app (the "PC, Mac & Linux Standalone" build target), you can target mixed reality by switching Unity to the "Universal Windows Platform" build target instead.

We'll talk about ways that you can restrict your app specifically to the HoloLens device using the Windows.Holographic device family [below](#publish-and-maintain-your-universal-app-on-hololens).

### Run your 2D app in a desktop mixed reality headset

If you've deployed your 2D app to the desktop machine where you are developing and tried it out on your monitor, you're already ready to try it out in an immersive desktop headset!

Just go to the Start menu within the mixed reality headset and launch the app from there. The desktop shell and the holographic shell both share the same set of UWP apps, and so the app should already be present once you've deployed from Visual Studio.

## Targeting both desktop headsets and HoloLens

Congratulations! Your app is now using the Windows 10 Universal Windows Platform (UWP).

Your app is now capable of running on today's Windows devices like Desktop, Mobile, Xbox, and HoloLens as well as future Windows devices. However, to actually target all of those devices, you will need to ensure your app is targeting the Windows.Universal device family.

### Change your device family to Windows.Universal

Now let's jump into your AppX manifest to ensure your Windows 10 UWP app can run on HoloLens:
* Open your app's solution file with **Visual Studio** and navigate to the app package manifest
* Right click the **Package.appxmanifest** file in your Solution and go to **View Code**

![package.appxmanifest in Solution Explorer](images/openappxmanifest-500px.png)
* Ensure your Target Platform is Windows.Universal in the dependencies section

```
<Dependencies>
  <TargetDeviceFamily Name="Windows.Universal" MinVersion="10.0.10240.0" MaxVersionTested="10.0.10586.0" />
</Dependencies>
```
* Save!

If you do not use Visual Studio for your development environment, you can open **AppXManifest.xml** in the text editor of your choice to ensure you're targeting the **Windows.Universal** *TargetDeviceFamily*.

### Run in the HoloLens Emulator

Now that your UWP app targets "Windows.Universal", let's build your app and run it in the [HoloLens Emulator](using-the-hololens-emulator.md).
* Make sure you have [installed the HoloLens Emulator](install-the-tools.md).
* In Visual Studio, select the **x86** build configuration for your app

![x86 build configuration in Visual Studio](images/x86setting.png)
* Select **HoloLens Emulator** in the deployment target drop-down menu

![HoloLens Emulator in deployment target list](images/deployemulator-500px.png)
* Select **Debug > Start Debugging** to deploy your app and start debugging.
* The emulator will start and run your app.
* With a keyboard, mouse, and/or an Xbox controller, place your app in the world to launch it.

![HoloLens Emulator loaded with a UWP sample](images/hololensemulatorwithuwpsample-800px.png)

### Next steps

At this point, one of two things can happen:
1. Your app will show its splash and start running after it is placed in the Emulator! Awesome!
2. Or after you see a loading animation for a 2D hologram, loading will stop and you will just see your app at its splash screen. This means that something went wrong and it will take more investigation to understand how to bring your app to life in Mixed Reality.

## How to debug issues specific to HoloLens

HoloLens Development Edition is a new device target of the Windows 10 operating system, so there are [Universal Windows Platform APIs that are still undergoing testing and development](current-limitations-for-apps-using-apis-from-the-shell.md#universal-apis-not-supported). We've experienced our own challenges bringing Microsoft UWP apps to HoloLens.

Here are some high level areas that we've found to be a problem:
* Querying for File System paths not supported on startup.
* Using legacy authentication methods outside of Web Authentication Broker or Web Account Manager.
* Making deep device hardware queries on startup (i.e. games).
* Using Calendar, People, Contact APIs on startup.
* Using large 3rd party libraries or services that may not be fully vetted on HoloLens.

To get to the bottom of what's causing your UWP app not to start on HoloLens, you'll have to debug.

### Running your UWP app in the debugger

These steps will walk you through debugging your UWP app using the Visual Studio debugger.
* If you haven't already done so, open your solution in Visual Studio. Change the target to the **HoloLens Emulator** and the build configuration to **x86**.
* Select **Debug > Start Debugging** to deploy your app and start debugging.
* Place the app in the world with your mouse, keyboard, or Xbox controller.
* Visual Studio should now break somewhere in your app code.
* If your app doesn't immediately crash or break into the debugger because of an unhandled error, then go through a test pass of the core features of your app to make sure everything is running and functional. You may see errors like pictured below (internal exceptions that are being handled). To ensure you don't miss internal errors that impact the experience of your app, run through your automated tests and unit tests to make sure everything behaves as expected.

![HoloLens Emulator loaded with a UWP sample showing a system exception](images/hololensemulatorwithuwpsampleexception-800px.png)

### Understanding the failure

As mentioned above, there are known issues with APIs under testing and development for the HoloLens Development Edition. If you find that your app uses one of the APIs in the namespaces [listed as having potential problems](current-limitations-for-apps-using-apis-from-the-shell.md#universal-apis-not-supported), use the Windows Feedback tool to send feedback to Microsoft.

**How to open the Windows Feedback tool**
1. [Bloom](gestures.md#bloom) to see the **Start menu**
2. Launch and place the **Windows Feedback** app.
3. Select **Developer Platform** and send us the details of your problem.

We are continually fixing platform bugs in the APIs of UWP. For APIs that are failing by design - because they are not supported on HoloLens - here are the patterns that you can expect in your app and design around:

**Error codes**
* Should not return a special failure HRESULT just because the API is partially-functional. Instead, APIs should signal failure via the design of the API itself by using empty collections, boolean return values, explicit status codes, etc. Note that if the API already returns HRESULTs due to programming errors (eg, passing invalid arguments) then it will continue to return those failures as appropriate.

**Collections**
* Should not return a null IVector[View], IMap[View], or Array from a property getter or method return. Instead, they will return a valid object that has zero items in it. If the type of the map or vector is mutable (ie, not a View) then allow the app to make changes even if they are not used anywhere.
* In some rare cases, APIs expose a read / write collection property that allows the app to provide a value of their own. In these cases, if the API already returns null in the fully-functional case, it should continue to return null in the partially-functional case. Note however that this is an API Design anti-pattern and should not generally be followed by most UWP APIs.

**Asynchronous functions**
* Should not return a null IAsyncAction or IAsyncOperation from an Async method. Instead, they will return a valid object that is already in the completed state and has the appropriate result (empty collection, status code, etc.).

**Events**
* Will not fail or ignore event registrations. Instead, API should accept the event registration / un-registration but simply never raise the event. The API must hold on to any registered event handlers (rather than silently ignoring them) since an app might inadvertently rely on the registration for lifetime management.

## Update your UI

Now that your UWP app is running on Desktop headsets and/or HoloLens as a 2D hologram, next we'll make sure it looks beautiful. Here are some things to consider:
* Windows Mixed Reality will run all 2D apps at a fixed resolution and DPI that equates to 853x480 effective pixels. Consider if your design needs refinement at this scale and think through our [2D UI guidance](updating-your-existing-universal-app-for-hololens.md) to improve your experience on HoloLens.
* Windows Mixed Reality [does not support](app-model.md) 2D live tiles. If your core functionality is showing information on a live tile, consider moving that information back into your app.
* Windows Mixed Reality on HoloLens [does not support](current-limitations-for-apps-using-apis-from-the-shell.md) the Share contract, 2D Printing, full screen mode, casting, and other features that may be in your app.

## New input possibilities

HoloLens uses advanced depth sensors to see the world and see users. This enables advanced hand gestures like [bloom](gestures.md#bloom) and [air-tap](gestures.md#air-tap). Powerful microphones also enable [voice experiences](voice-input.md).

With Desktop headsets, users can use motion controllers to point at apps and take action. They can also use a gamepad, targeting objects with their gaze.

Windows takes care of all of this complexity for UWP apps, translating your [gaze](gaze.md), gestures, voice and motion controller input to [pointer events](https://msdn.microsoft.com/en-us/library/windows/apps/mt404610#pointer_events) that abstract away the input mechanism. For example, a user may have done an air-tap with their hand or pulled the Select trigger on a motion controller, but 2D applications don't need to know where the input came from - they just see a 2D touch press, as if on a touchscreen.

Here are the high level concepts/scenarios you should understand for input when bringing your UWP app to HoloLens:
* [Gaze](gaze.md) turns into hover events, which can unexpectedly trigger menus, flyouts or other user interface elements to pop up just by gazing around your app.
* Gaze is not as precise as mouse input. Use appropriately sized hit targets for HoloLens, similar to touch-friendly mobile applications. Small elements near the edges of the app are especially hard to interact with.
* Users must switch input modes to go from scrolling to dragging to two finger panning. If your app was designed for touch input, consider ensuring that no major functionality is locked behind two finger panning. If so, consider having alternative input mechanisms like buttons that can initiate two finger panning. For example, the Maps app can zoom with two finger panning but has a plus, minus, and rotate button to simulate the same zoom interactions with single clicks.

[Voice input](voice-input.md) is a critical part of the mixed reality experience. We've enabled all of the speech APIs that are in Windows 10 powering Cortana when using a headset.

## Publish and Maintain your Universal app

Once your app is up and running, package your app to [submit it to the Universal Windows Store](submitting-an-app-to-the-microsoft-store.md).

## See also
* [App model](app-model.md)
* [Updating your existing universal app for HoloLens](updating-your-existing-universal-app-for-hololens.md)
* [Gaze](gaze.md)
* [Gesture](gestures.md)
* [Motion controllers](motion-controllers.md)
* [Voice](voice-input.md)
* [Submitting an app to the Windows Store](submitting-an-app-to-the-microsoft-store.md)
* [Using the HoloLens emulator](using-the-hololens-emulator.md)
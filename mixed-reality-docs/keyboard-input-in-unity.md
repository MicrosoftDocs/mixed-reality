---
title: Keyboard input in Unity
description: 
author: 
ms.author: alexturn
ms.date: 2/28/2018
ms.topic: article
keywords: 
---



# Keyboard input in Unity

**Namespace:** *UnityEngine*\
 **Type**: [TouchScreenKeyboard](http://docs.unity3d.com/ScriptReference/TouchScreenKeyboard.html)

While HoloLens supports many forms of input including Bluetooth keyboards, most applications cannot assume that all users will have a physical keyboard available. If your application requires text input, some form of on screen keyboard should be provided.

Unity provides the [TouchScreenKeyboard](http://docs.unity3d.com/ScriptReference/TouchScreenKeyboard.html) class for accepting keyboard input when there is no physical keyboard available.

## HoloLens system keyboard behavior in Unity

On HoloLens, the TouchScreenKeyboard leverages the system's on screen keyboard. The system's on screen keyboard is unable to overlay on top of a volumetric view so Unity has to create a secondary 2D XAML view to show the keyboard then return back to the volumetric view once input has been submitted. The user flow goes like this:
1. The user performs an action causing app code to call TouchScreenKeyboard
* *The app is responsible for pausing app state before calling TouchScreenKeyboard*
* *The app may terminate before ever switching back to the volumetric view*
2. Unity switches to a 2D XAML view which is auto-placed in the world
3. The user enters text using the system keyboard and submits or cancels
4. Unity switches back to the volumetric view
* *The app is responsible for resuming app state when the TouchScreenKeyboard is done*
5. Submitted text is available in the TouchScreenKeyboard

### Available keyboard views

There are six different keyboard views available:
* Single-line textbox
* Single-line textbox with title
* Multi-line textbox
* Multi-line textbox with title
* Single-line password box
* Single-line password box with title

## How to enable the system keyboard in Unity

The HoloLens system keyboard is only available to Unity applications that are exported with the "UWP Build Type" set to "XAML". There are tradeoffs you make when you choose "XAML" as the "UWP Build Type" over "D3D". If you aren't comfortable with those tradeoffs, you may wish to explore an [alternative input solution](#alternative-keyboard-options) to the system keyboard.
1. Open the **File** menu and select **Build Settings...**
2. Ensure the **Platform** is set to **Windows Store**, the **SDK** is set to **Universal 10**, and set the **UWP Build Type** to **XAML**.
3. In the **Build Settings** dialog, click the **Player Settings...** button
4. Select the **Settings for Windows Store** tab
5. Expand the **Other Settings** group
6. In the **Rendering** section, check the **Virtual Reality Supported** checkbox to add a new **Virtual Reality Devices** list
7. Ensure **Windows Holographic** appears in the list of Virtual Reality SDKs
* *Without marking the build as Virtual Reality Supported with the HoloLens device, the project will export as a 2D XAML app*

## Using the system keyboard in your Unity app

### Declare the keyboard

In the class, declare a variable to store the TouchScreenKeyboard and a variable to hold the string the keyboard returns.

```
UnityEngine.TouchScreenKeyboard keyboard;
public static string keyboardText = "";
```

### Invoke the keyboard

When an event occurs requesting keyboard input, call one of these functions depending upon the type of input desired. Note that the title is specified in the textPlaceholder parameter.

```
// Single-line textbox
keyboard = TouchScreenKeyboard.Open("", TouchScreenKeyboardType.Default, false, false, false, false);

// Single-line textbox with title
keyboard = TouchScreenKeyboard.Open("", TouchScreenKeyboardType.Default, false, false, false, false, "Single-line title");

// Multi-line textbox
keyboard = TouchScreenKeyboard.Open("", TouchScreenKeyboardType.Default, false, true, false, false);

// Multi-line textbox with title
keyboard = TouchScreenKeyboard.Open("", TouchScreenKeyboardType.Default, false, true, false, false, "Multi-line Title");

// Single-line password box
keyboard = TouchScreenKeyboard.Open("", TouchScreenKeyboardType.Default, false, false, true, false);

// Single-line password box with title
keyboard = TouchScreenKeyboard.Open("", TouchScreenKeyboardType.Default, false, false, true, false, "Secure Single-line Title");
```

### Retrieve typed contents

In the update loop, check if the keyboard received new input and store it for use elsewhere.

```
if (TouchScreenKeyboard.visible == false && keyboard != null)
{
       if (keyboard.done == true)
       {
           keyboardText = keyboard.text;
           keyboard = null;
       }
}
```

## Alternative keyboard options

We understand that switching out of a volumetric view into a 2D view isn't the ideal way to get text input from the user.

The current alternatives to leveraging the system keyboard through Unity include:
* Using speech dictation for input
* *This is often error prone for words not found in the dictionary and is not suitable for password entry*
* Create a keyboard that works in your applications exclusive view
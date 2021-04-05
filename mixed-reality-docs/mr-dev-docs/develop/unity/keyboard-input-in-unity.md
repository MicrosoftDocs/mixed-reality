---
title: Keyboard input in Unity
description: Unity provides the TouchScreenKeyboard class for accepting keyboard input when there's no physical keyboard available.
author: MaxWang-MS
ms.author: wangmax
ms.date: 03/30/2021
ms.topic: article
keywords: keyboard, input, unity, touchscreenkeyboard, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens, HoloLens 2
---


# Keyboard input in Unity

**Namespace:** *UnityEngine*<br>
 **Type**: *[TouchScreenKeyboard](https://docs.unity3d.com/ScriptReference/TouchScreenKeyboard.html)*

While HoloLens supports many forms of input including Bluetooth keyboards, most applications can't assume that all users will have a physical keyboard available. If your application requires text input, some form of on-screen keyboard should be provided.

Unity provides the *[TouchScreenKeyboard](https://docs.unity3d.com/ScriptReference/TouchScreenKeyboard.html)* class for accepting keyboard input when there's no physical keyboard available.

## HoloLens system keyboard behavior in Unity

On HoloLens, the *TouchScreenKeyboard* leverages the system's on-screen keyboard and directly overlays on top of the volumetric view of your MR application. The experience is similar to using keyboard in the built-in apps of HoloLens. Note that the system keyboard will behave according to the target platform's capabilities, for example the keyboard on HoloLens 2 would support direct hand interactions, while the keyboard on HoloLens (1st gen) would support GGV (Gaze, Gesture, and Voice). Additionally, the system keyboard will not show up when performing Unity Remoting from the editor to a HoloLens.

## Using the system keyboard in your Unity app

### Declare the keyboard

In the class, declare a variable to store the *TouchScreenKeyboard* and a variable to hold the string the keyboard returns.

```cs
UnityEngine.TouchScreenKeyboard keyboard;
public static string keyboardText = "";
```

### Invoke the keyboard

When an event occurs requesting keyboard input, use the following to show the keyboard.

```cs
keyboard = TouchScreenKeyboard.Open("text to edit");
```

You can use additional parameters passed into the `TouchScreenKeyboard.Open` function to control the behavior of the keyboard (e.g. setting placeholder text or supporting autocorrection). For the full list of parameters please refer to [Unity's documentation](https://docs.unity3d.com/ScriptReference/TouchScreenKeyboard.Open.html).

### Retrieve typed contents

The content can simply be retrieved by calling `keyboard.text`. You may want to retrieve the content per frame or only when the keyboard is closed.

```cs
keyboardText = keyboard.text;
```

## Alternative keyboard options

Besides using the *TouchScreenKeyboard* class directly, you can also get user input by using Unity's *UI Input Field* or *TextMeshPro Input Field*. Additionally, there is an implementation based on *TouchScreenKeyboard* in the [HandInteractionExamples scene](/windows/mixed-reality/mrtk-unity/features/example-scenes/hand-interaction-examples) of [MRTK](/windows/mixed-reality/mrtk-unity) (there is a keyboard interaction sample on the left hand side).

## Next Development Checkpoint

If you're following the Unity development journey we've laid out, you're in the midst of exploring the Mixed Reality platform capabilities and APIs. From here, you can continue to any [topic](unity-development-overview.md#3-advanced-features) or jump directly to deploying your app on a device or emulator.

> [!div class="nextstepaction"]
> [Deploy to HoloLens or Windows Mixed Reality immersive headsets](../platform-capabilities-and-apis/using-visual-studio.md)

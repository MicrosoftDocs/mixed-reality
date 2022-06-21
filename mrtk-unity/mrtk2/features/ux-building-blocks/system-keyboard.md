---
title: System keyboard -- MRTK2
description: Overview of System Key Board in MRTK
author: maxwang-ms
ms.author: wangmax
ms.date: 01/12/2021
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK, System Keyboard,
---

# System keyboard -- MRTK2

![System keyboard](../images/system-keyboard/MRTK_SystemKeyboard_Main.png)

A Unity application can invoke the system keyboard at any time. Note that the system keyboard will behave according to the target platform's capabilities, for example the keyboard on HoloLens 2 would support direct hand interactions, while the keyboard on HoloLens (1st gen) would support GGV (Gaze, Gesture, and Voice)<sup>[1](/windows/mixed-reality/gaze)</sup>. Additionally, the system keyboard will not show up when performing [Unity Remoting](../tools/holographic-remoting.md) from the editor to a HoloLens.

## How to invoke the system keyboard

```c#
public TouchScreenKeyboard keyboard;

...

public void OpenSystemKeyboard()
{
    keyboard = TouchScreenKeyboard.Open("", TouchScreenKeyboardType.Default, false, false, false, false);
}
```

## How to read the input

```c#
public TouchScreenKeyboard keyboard;

...

private void Update()
{
    if (keyboard != null)
    {
        keyboardText = keyboard.text;
        // Do stuff with keyboardText
    }
}
```

## System keyboard example

You can see a simple example of how to bring up system keyboard in `MixedRealityKeyboard.cs` (Assets/MRTK/SDK/Experimental/Features/UX/MixedRealityKeyboard.cs)

## See Also

- [Mixed Reality Keyboard Helper Classes](../experimental/mixed-reality-keyboard.md)

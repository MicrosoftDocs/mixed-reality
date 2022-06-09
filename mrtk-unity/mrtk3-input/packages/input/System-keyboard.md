---
title: System keyboard | MRTK3
description: System keyboard in MRTK3
author: MaxWang-MS
ms.author: wangmax
ms.date: 6/7/2022
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, MRTK3, data binding, theme, theming, Mixed Reality Toolkit
---

# System keyboard | MRTK3

![System keyboard](../images/system-keyboard.png)

A Unity application can invoke the system keyboard at any time. The system keyboard will behave according to the target platform's capabilities. For example, the keyboard on HoloLens 2 would support direct hand interactions. Additionally, the system keyboard won't show up when performing Holographic Remoting from the editor to a HoloLens.

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

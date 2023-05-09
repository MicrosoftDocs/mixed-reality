---
title: Keyboard Preview
description: Documentation for the Keyboard Preview in MRTK3
author: marlenaklein-msft
ms.author: marlenaklein
ms.date: 5/5/2023
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, MRTK, MRTK3, UX, Keyboard Preview
---

# Keyboard Preview

![Image showing a keyboard preview](images/keyboardpreview.png)

There is a Canvas UX prefab, `Keyboard Preview`, which provides a visual for the text that a user inputs with the [System Keyboard](/windows/mixed-reality/mrtk-unity/mrtk3-input/packages/input/system-keyboard).

This visual uses a [Follow Solver](/windows/mixed-reality/mrtk-unity/mrtk3-spatialmanipulation/packages/spatialmanipulation/solvers/solver#follow) to position itself in front of the user. It can be connected to the System Keyboard using a script like `SystemKeyboardExample.cs`. An example can be found in the `HandInteractionExamples` scene.
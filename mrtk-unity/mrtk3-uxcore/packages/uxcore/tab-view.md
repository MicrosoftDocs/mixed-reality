---
title: Tab View
description: Documentation for the Tab View in MRTK3
author: marlenaklein-msft
ms.author: marlenaklein
ms.date: 5/5/2023
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, UX, UXCore, UX Core, packaging, Tab View
---

# Tab View
![Image showing the tab view](images/tabviews.png)

`TabView` is a helper component that allows the user to switch between views at a click. It accomplishes this by enabling and disabling sub-objects based on the currently toggled index of a `ToggleCollection`.

To set up a `TabView`, you'll have to create a target `ToggleCollection` containing all of the tab toggles. In the example above, this would be the buttons labeled "Logo", "Text", "Image", and "Buttons". You can then map each item in the `Toggle Collection` to a `TabSection`. Each `TabSection` you add to the list should specify a GameObject with the content to show and hide when the user switches views.

![Image showing the inspector for a TabView component](images/tabview_inspector.png)

An example can be found in the `TopNavigationExample` scene.

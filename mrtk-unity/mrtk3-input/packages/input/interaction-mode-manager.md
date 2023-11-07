---
title: Interaction Mode Manager
description: Mixed Reality Toolkit 3 for developers - Interaction Mode Manager.
author: AMollis
ms.author: amollis
ms.date: 5/12/2023
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, development, InteractionModeManager, MRTK3
---

# Interaction Mode Manager &#8212; MRTK3

## Overview

An **interaction mode** represents a subset of [interactors](https://docs.unity3d.com/Packages/com.unity.xr.interaction.toolkit@2.1/api/UnityEngine.XR.Interaction.Toolkit.IXRInteractor.html) that should be enabled based on contextual information about what the user is doing. For example, a **near interaction mode** may disable all ray interactors while permitting the use of grab and poke interactors. Conversely, when the user is grabbing an object, you may want to enter a **near grab interaction mode**, which disables the touch interactor, preventing any accidental touch activations while grabbing the object.

![Sample Near Interaction Mode](../images/InteractionModeManager/interaction-mode.png)

The **interaction Mode Manager** mediates between these interaction contexts. It relies on mode **Interaction Mode Detector** to determine the best mode for the current context. Mode detectors, such as `ProximityModeDetector`, dictate which mode should be active for a given [Controller](https://docs.unity3d.com/Packages/com.unity.xr.interaction.toolkit@2.1/api/UnityEngine.XR.Interaction.Toolkit.XRController.html) based on any arbitrary condition. Developers can create new ways to disambiguate between interaction contexts by implementing `IInteractionModeDetector`.

![Near Interaction Mode Detector in Action](../images/InteractionModeManager/interaction-mode-management.gif)

The priority of each mode is determined by their order within the **Interaction Mode Manager**. Modes listed later in the list have higher priority, making them the dominant mode in cases where multiple interaction contexts may be valid. The Interaction Mode Manager also allows the user to specify a default interaction mode.

![Mode Manager Priority](../images/InteractionModeManager/interaction-mode-list.png)

## Detectors

The MRTK contains a set `IInteractionModeDetectors` implementation, each specifying which `InteractionMode` to enable or disable.

### Interaction Detector
The `InteractionDetector` enables or disables the specified hover and select interaction modes whenever one of the associated interactors has a valid hover or select target.

### Proximity Detector
The `ProximityDetector` enables or disables the specified interaction mode when the detector is near an interactable's collider.

### Near Interaction Mode Detector
The `NearInteractionModeDetector` enables or disables the specified interaction mode when the detector or one of the associated interactors is near am interactable's collider.

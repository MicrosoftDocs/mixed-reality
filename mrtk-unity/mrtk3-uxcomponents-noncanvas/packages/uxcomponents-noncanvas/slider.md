---
title: Slider (Non-Canvas)
description: Non-Canvas sliders in MRTK3
author: Zee2
ms.author: finnsinclair
ms.date: 6/6/2022
ms.localizationpriority: high
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, UI, Slider, PinchSlider
---

# Slider (Non-Canvas) &#8212; MRTK3

![Slider example](../../../mrtk3-overview/images/UXBuildingBlocks/MRTK_UX_v3_Slider.png)

> [!NOTE]
> In the majority of cases, the hybrid Canvas UI prefabs offer a much more powerful designer workflow, with dynamic resizing, reflow, alignment, padding, realtime layouts, and more. [Learn more about how the hybrid Canvas UI system works.](../../../mrtk3-uxcore/packages/uxcore/canvas-ui.md). These prefabs are located in the com.microsoft.mrtk.uxcomponents package. [See the documentation here.](../../../mrtk3-uxcomponents/packages/uxcomponents/overview.md)

Sliders are UI components that allow you to continuously change a value by moving a slider on a track. Sliders can be interacted with using Poke, Grab, Ray, Gaze-Pinch, or any other valid interaction in XRI or MRTK3.

As with other interactables in MRTK, the main Slider interactable doesn't render any visuals. You must combine the Slider script with a visuals script. For the non-Canvas Slider, `SliderVisuals` offer non-RectTransform-based slider visuals. [See the Canvas slider documentation](../../../mrtk3-uxcomponents/packages/uxcomponents/slider.md) for RectTransform-based sliders.

## Layout

Non-Canvas UX components do not offer any layout capabilities. Non-Canvas sliders can be manually configured by dragging the start and end points of the slider.

## Audio

Sounds are currently provided by a dedicated audio driver script, `SliderSounds`. This script hooks into the Slider's events in order to play the audio clips at the appropriate times.

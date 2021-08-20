---
title: Button
description: Learn how to trigger an immediate action with buttons, which is one of mixed reality's foundational components.
author: cre8ivepark
ms.author: dongpark
ms.date: 11/01/2019
ms.topic: article
keywords: Mixed Reality, Controls, interaction, ui, ux, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens, MRTK, Mixed Reality Toolkit, button
---

# Button

![Button](images/UX_Hero_Button.jpg)

A button is one of the most foundational and crucial UI elements in mixed reality. It lets your users trigger immediate actions. Since there is no physical feedback in mixed reality, it is crucial to provide enough visual and audio feedback to increase the user's interaction confidence. 

In HoloLens 2 button design, based on many design iterations, prototypings, and user research studies, we integrated multiple visual affordances and audio cues that help the user's depth perception and interaction in empty space. 

## Visual affordances

>[!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RWJHgW]


:::row:::
    :::column:::
       ![Button with proximity light effect shown](images/UX_Button_Affordance_ProximityLight.jpg)<br>
       **Proximity light**<br>
    :::column-end:::
    :::column:::
       ![Button selected with focus highlight effect shown](images/UX_Button_Affordance_FocusHighlight.jpg)<br>
        **Focus highlight**<br>
    :::column-end:::
:::row-end:::

:::row:::
    :::column:::
       ![Button being pressed with compression cage effect shown](images/UX_Button_Affordance_Compression.jpg)<br>
       **Compressing cage**<br>
    :::column-end:::
    :::column:::
       ![Button being pressed with trigger pulse effect shown](images/UX_Button_Affordance_Pulse.jpg)<br>
        **Pulse on trigger**<br>
    :::column-end:::
:::row-end:::

<br>

## Audio cues

Proper audio feedback can dramatically improve the user experience. HoloLens 2's button provides audio feedback to communicate the following cues:
* **Contact begins**: Play sound when touch begins (near interaction)
* **Contact ends**: Play sound on touch end (near interaction)
* **Pinch begins**: Play sound on pinch select(far interaction with gaze or rays)
* **Pinch ends**: Play sound on pinch release(far interaction with gaze or rays)

<br>

---

:::row:::
    :::column:::
        ## Voice commanding - 'See it, Say it' model<br>
        For any buttons in mixed reality, it's important to support alternative interaction options. By default, we recommend that voice commanding be supported for any buttons. In HoloLens 2's button design, we provide a tooltip during the hover state to improve discoverability.
        <br>
        *Image: Tooltip for the voice command*
    :::column-end:::
        :::column:::
       ![voice commanding](images/640px-interactibleobject-voicecommand.png)<br>
    :::column-end:::
:::row-end:::


<br>

---

## Sizing recommendations

To ensure all interactable objects can easily be touched, we recommend making sure the interactable meets a minimum size based on the distance it's placed from the user. The visual angle is often measured in degrees of visual arc. Visual angle is based on the distance between the user's eyes and the object and stays constant, while the physical size of the target may change as the distance from the user changes. To determine the necessary physical size of an object based on the distance from the user, try using a visual angle calculator such as [this one](https://elvers.us/perception/visualAngle/).

Below are the recommendations for minimum sizes of interactable content.

### Target size for direct hand interaction

| Distance | Viewing angle | Size |
|---------|---------|---------|
| 45 cm  | no smaller than 2° | 1.6 x 1.6 cm |

![Target size for direct hand interaction](images/TargetSizingNear.jpg)<br>
*Target size for direct hand interaction*

<br>

### Target size for buttons

When creating buttons for direct interaction, we recommend a larger minimum size of 3.2 x 3.2 cm to ensure that there's enough space to contain an icon and potentially some text.

| Distance | Minimum size |
|---------|---------|
| 45 cm  | 3.2 x 3.2 cm |

![Target size for the buttons](images/TargetSizingButtons.png)<br>
*Target size for the buttons*

<br>

### Target size for hand ray or gaze interaction
| Distance | Viewing angle | Size |
|---------|---------|---------|
| 2 m  | no smaller than 1° | 3.5 x 3.5 cm |

![Target size for hand ray or gaze interaction](images/TargetSizingFar.jpg)<br>
*Target size for hand ray or gaze interaction*

<br>

## Design guidelines
When designing menu UI with buttons, it is recommended to use opaque backplate. Transparent backplates are not recommended for the following reasons:
* Hard to interact with because it is difficult to understand how deep the button has to be pressed to trigger event
* Legibility issue on complex physical environment
* Holograms displayed through the transparent plate can show swimming effect issue when used with Depth LSR stabilization technology.

See [Designing content for holographic display](designing-content-for-holographic-display.md) for more details on color choices and guidelines for holographic display.

![Transparent UI examples](images/color_transparent_examples.jpg)
*Examples of transparent UI backplate*




---

## Button in MRTK(Mixed Reality Toolkit) for Unity
**[MRTK for Unity](https://github.com/Microsoft/MixedRealityToolkit-Unity)** provides various types of button prefabs, including shell-style buttons for HoloLens 2 and HoloLens (1st gen). The HoloLens 2 button prefab contains several detailed affordances that help improve user confidence:

* Proximity-based highlight
* Compressing front cage
* Pulse effect on trigger.

* Check out the [MRTK - Button](/windows/mixed-reality/mrtk-unity/features/ux-building-blocks/button) for more instructions and customized examples.

<br>

---

## See also

* [Cursors](cursors.md)
* [Hand ray](point-and-commit.md)
* [Button](button.md)
* [Interactable object](interactable-object.md)
* [Bounding box and App bar](app-bar-and-bounding-box.md)
* [Manipulation](direct-manipulation.md)
* [Hand menu](hand-menu.md)
* [Near menu](near-menu.md)
* [Object collection](object-collection.md)
* [Voice command](voice-input.md)
* [Keyboard](keyboard.md)
* [Tooltip](tooltip.md)
* [Slate](slate.md)
* [Slider](slider.md)
* [Shader](shader.md)
* [Billboarding and tag-along](billboarding-and-tag-along.md)
* [Displaying progress](progress.md)
* [Surface magnetism](surface-magnetism.md)
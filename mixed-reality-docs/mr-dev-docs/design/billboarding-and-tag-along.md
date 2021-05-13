---
title: Billboarding and tag-along
description: Learn how to use objects with billboarding, which always orient themselves to face the user in mixed reality applications.
author: radicalad
ms.author: adlinv
ms.date: 03/21/2018
ms.topic: article
keywords: Windows Mixed Reality, billboarding, tag-along, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens, MRTK, Mixed Reality Toolkit
---

# Billboarding and tag-along

<br>

<img src="images/MRTK_TagAlong.gif" alt="HoloLens perspective of a menu system that always faces the user" width="940px">
<br>

## What is billboarding?

Billboarding is a behavioral concept that can be applied to objects in mixed reality. Objects with billboarding always orient themselves to face the user. Text and menu systems are common use cases, where static objects placed in the user's environment (world-locked) would be otherwise obscured or unreadable when users move around.

Objects with billboarding enabled can rotate freely in the user's environment. They can also be constrained to a single axis depending on design considerations. Keep in mind, billboarded objects can clip or occlude themselves when placed too close to other objects, or in HoloLens, too close scanned surfaces. To avoid this, think about the total footprint an object may produce when rotated on the axis enabled for billboarding.

<br>

---
## What is a tag-along?

Tag-along is a behavioral concept that can be added to holograms. A tag-along object attempts to stay in a range that allows the user to interact comfortably.

![The HoloLens pins panel is a great example of how tag-along behaves](images/tagalong-1000px.jpg)<br>
*The HoloLens Start menu is a great example of tag-along behavior*

Tag-along objects have parameters, which can fine-tune the way they behave. Content can be in or out of the user’s line of sight while the user moves around their environment. As you move, the content attempts to stay within the user’s periphery by sliding towards the edge of the view. The content might be temporarily out of view depending on how quickly the user is moving. When the user gazes towards the tag-along object, it comes more fully into view. Think of content always being "a glance away" so users never forget what direction their content is in.

Extra parameters can make the tag-along object feel attached to the user's head by a rubber band. Dampening acceleration or deceleration gives weight to the object making it feel more physically present. This spring behavior is an affordance that helps the user build an accurate mental model of how tag-along works. Audio helps provide other cues for when users have objects in tag-along mode. Audio should reinforce the speed of movement; a fast head turn should provide a more noticeable sound effect, while walking at a natural speed should have minimal or no audio effects.

Just like truly head-locked content, tag-along objects can prove overwhelming or nauseating if they move wildly or spring too much in the user’s view. As a user looks around, then quickly stops, their senses tell them they've stopped. Their balance informs them that their head has stopped turning and their vision sees the world stop turning. However, if tag-along keeps on moving when the user has stopped, it may confuse their senses.

<br>

---

## Billboarding and Tag-along in MRTK (Mixed Reality Toolkit) for Unity
**[MRTK](https://github.com/Microsoft/MixedRealityToolkit-Unity)** provides scripts for the Billboarding and tag-along behavior. Assign the Billboard.cs script onto any object to add billboarding behavior and make the object always face you. To add tag-along behavior, use the RadialView.cs script. You can adjust various options such as lerping time, distance, and degree.

* [MRTK - Radial View Solver](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/features/ux-building-blocks/solvers/solver#radialview)
* [MRTK - Billboard script](https://github.com/microsoft/MixedRealityToolkit-Unity/blob/mrtk_release/Assets/MixedRealityToolkit.SDK/Features/UX/Scripts/Utilities/Billboard.cs)


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

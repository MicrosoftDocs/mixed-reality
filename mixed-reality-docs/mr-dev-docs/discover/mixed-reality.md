---
title: What is Mixed Reality?
description: Discussion on Mixed Reality, demomstrating the use of AR and VR devices on the Mixed Reality spectrum.
author: brandonbray
ms.author: branbray
ms.date: 08/26/2020
ms.topic: article
keywords: Mixed Reality, holographic, AR, VR, MR, XR, augmented reality, virtual reality, explanation, case study, mixed reality headset, windows mixed reality headset, virtual reality headset, what is virtual reality, what is augmented reality
ms.localizationpriority: high
---

# What is Mixed Reality?

![Point and commit with hands on HoloLens 2](images/02_MixedRealitySlashMixedReality.png)

Mixed Reality is a blend of physical and digital worlds, unlocking the links between human, computer, and environment interaction. This new reality is based on advancements in computer vision, graphical processing power, display technology, and input systems. However, the term *Mixed Reality* was introduced in a 1994 paper by Paul Milgram and Fumio Kishino, "[A Taxonomy of Mixed Reality Visual Displays](https://search.ieice.org/bin/summary.php?id=e77-d_12_1321)." Their paper explored the concept of the *virtuality continuum* and the categorization of taxonomy applied to displays. Since then, the application of Mixed Reality has gone beyond displays to include:
* Environmental input
* Spatial sound
* Locations and positioning in both real and virtual spaces

![The Mixed Reality spectrum image](images/mixedrealityspectrum-worlds.png)<br>
*Image: Mixed Reality is the result of blending the physical world with the digital world.*

<br>

---

## Environmental input and perception

Over the past several decades, exploration into the relationship between human and computer input has continued, leading to the discipline known as *human computer interaction* or HCI. Human input happens through different means, including keyboards, mice, touch, ink, voice, and even Kinect skeletal tracking.

Advancements in sensors and processing are creating new areas of computer input from environments. The interaction between computers and environments is environmental understanding or *perception*, which is why the API names in Windows that reveal environmental information are called the [perception APIs](/uwp/api/Windows.Perception). Environmental input captures things like a person's position in the world ([head tracking](../design/coordinate-systems.md)), surfaces, and boundaries ([spatial mapping](../design/spatial-mapping.md) and [scene understanding](../design/scene-understanding.md)), ambient lighting, environmental sound, object recognition, and location.

<br>

![Venn diagram showing interactions between computers, humans and environments](images/mixed-reality-venn-diagram-300px.png)<br> 
*Image: The interactions between computers, humans, and environments.*

<br>

The combination of all three - **computer processing, human input, and environmental input** - sets the stage for creating true Mixed Reality experiences. Movement through the physical world translates to movement in the digital world. Boundaries in the physical world influence application experiences, such as game play, in the digital world. Without environmental input, experiences can't blend between physical and digital realities.<br>

<br>

---


## The Mixed Reality spectrum

Since Mixed Reality blends both physical and digital worlds, these two realities define the polar ends of a spectrum known as the virtuality continuum. We refer to the array of realities as the *Mixed Reality spectrum*. On the left-hand side, we have the physical reality that we as humans exist in. On the right-hand side, we have the corresponding digital reality.

<br>

<iframe width="940" height="530" src="https://www.youtube.com/embed/_xpI0JosYUk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<br>

### Augmented vs. virtual reality

Most mobile phones on the market today have little to no environmental understanding capabilities. The experiences they offer can't mix physical and digital realities. The experiences that overlay graphics on video streams of the physical world are *augmented reality*. The experiences that occlude your view to present a digital experience are *virtual reality*. The experiences enabled between augmented and virtual reality form *Mixed Reality*:
* Starting with the physical world, placing a digital object, such as a hologram, as if it was there.
* Starting with the physical world, a digital representation of another person--an avatar--shows the location where they were standing when leaving notes. In other words, experiences that represent asynchronous collaboration at different points in time.
* Starting with a digital world, physical boundaries from the physical world like walls and furniture appear digitally within the experience to help users avoid physical objects.

<br>

![The Mixed Reality spectrum](images/mixedrealityspectrum.png)<br>
*Image: The Mixed Reality spectrum*

<br>

Most augmented reality and virtual reality offerings available today represent a small part of this spectrum and are considered subsets of the larger Mixed Reality spectrum. Windows 10 is built with the entire spectrum in mind, and allows blending digital representations of people, places, and things with the real world.


## Devices and experiences

There are two main types of devices that deliver Windows Mixed Reality experiences:
1. **Holographic devices** are characterized by the device's ability to place digital content in the real world as if it were there.
2. **Immersive devices** are characterized by the device's ability to create a sense of "presence"--hiding the physical world, and replacing it with a digital experience.

<table>
<tr>
<th width="30%"> Characteristic</th><th width="35%"> Holographic devices</th><th width="35%"> Immersive devices</th>
</tr><tr>
<td><strong>Example device</strong></td><td> Microsoft HoloLens<br><br> <img alt="Microsoft HoloLens 2 image" width="300" height="169" src="images/HoloLens2.jpg" /></td><td> Samsung HMD Odyssey+<br><br> <img alt="Samsung HMD Odyssey+ image" width="300" height="169" src="images/Samsung-HMD-Odyssey.jpg" /></td>
</tr><tr>
<td><strong>Display</strong></td><td> See-through display. Allows user to see the physical environment while wearing the headset.</td><td> Opaque display. Blocks out the physical environment while wearing the headset.</td>
</tr><tr>
<td><strong>Movement</strong></td><td> Full six-degrees-of-freedom movement, both rotation and translation.</td><td> Full six-degrees-of-freedom movement, both rotation and translation.</td>
</tr>
</table> 


> [!NOTE]
> Whether a device is connected to or tethered to a separate PC (via USB cable or Wi-Fi) or self-contained (untethered) doesn't reflect whether a device is holographic or immersive. Features that improve mobility lead to better experiences, and both holographic and immersive devices could be tethered or untethered.

Technological advancement enables Mixed Reality experiences, but there aren't any devices today that can run experiences across the entire spectrum. Windows 10 provides a common Mixed Reality platform for both device manufacturers and developers. Devices today can support a specific range within the Mixed Reality spectrum, with new devices expanding that range. In the future, holographic devices will be immersive, and immersive devices will be more holographic.

<br>

![Device types in the Mixed Reality spectrum](images/Final_WhatIsMixedReality07.png)<br>
*Image: Where devices exist on the Mixed Reality spectrum*

It's best to think what type of experience an application or game developer wants to create. The experiences will typically target a specific point or part on the spectrum. Developers should consider the capabilities of devices they want to target. Experiences that rely on the physical world will run best on HoloLens.
* **Towards the left (near physical reality).** Users remain present in their physical environment and are never made to believe they have left that environment.
* **In the middle (fully Mixed Reality).** These experiences blend the real world and the digital world. Viewers who have seen the movie [Jumanji](https://en.wikipedia.org/wiki/Jumanji) can reconcile how the physical structure of the house where the story took place was blended with a jungle environment.
* **Towards the right (near digital reality).** Users experience a digital environment, and are unaware of what occurs in the physical environment around them.

## Next Discovery Checkpoint

If you're following the [discovery journey](get-started-with-mr.md) we've laid out, you're in the midst of exploring the basics of Mixed Reality. From here, you can continue to the next foundational topic: 

> [!div class="nextstepaction"]
> [What is a hologram?](hologram.md)

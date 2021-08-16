---
title: Test the stabilization plane
description: Download a test scene and try out stabilization plane exercises.
author: thetuvix
ms.author: v-vtieto
ms.date: 08/16/21
ms.topic: article
keywords: openxr, unity, hololens, hololens 2, mixed reality, MRTK, Mixed Reality Toolkit, augmented reality, virtual reality, mixed reality headsets, learn, tutorial, getting started, holographic remoting, desktop, preview, debug, stability, stabilization plane
---
# Test the stabilization plane

We recommend that you first gain a solid understanding of [how the stabilization plane works](../platform-capabilities-and-apis/case-study-using-the-stabilization-plane-to-reduce-holographic-turbulence.md). At the end of that article, there's a link that returns you to this article. If you have a HoloLens, you can download a test scene to try out the following exercises. The test scene uses Unity’s built-in gizmo API to help you visualize where your plane is being set. 

1. Sync the latest version of [MixedRealityToolkit-Unity](https://github.com/Microsoft/MixedRealityToolkit-Unity).
2. Open the [HoloToolkit-Examples/Utilities/Scenes/StabilizationPlaneSetting.unity](https://github.com/Microsoft/MixedRealityToolkit-Unity/blob/htk_release/Assets/HoloToolkit-Examples/Utilities/Scenes/StabilizationPlaneSetting.unity) scene.
3. Build and configure the generated project.
4. Run on your device.

### Exercise 1

You'll see several white dots around you at different orientations. In front of you, you’ll see three dots at different depths. Air tap to change which dot the plane is set to. For this exercise, and for the other two, move around your space while gazing at the dots. Turn your head left, right, up, and down. Move closer to and farther from the dots. See how they react when the stabilization plane is set to different targets.

### Exercise 2

Now, turn to your right until you see two moving dots, one oscillating on a horizontal path and one on a vertical path. Once again, air-tap to change which dot the plane is set to. Notice how color separation is lessened and appears on the dot that is connected to the plane. Tap again to use the dot’s velocity in the plane setting function. This parameter gives a hint to HoloLens about the object’s intended motion. It’s important to know when to use this, as you’ll notice when velocity is used on one dot, the other moving dot will show greater color separation. Keep this in mind when designing your apps—having a cohesive flow to the motion of your objects can help prevent artifacts from appearing.

### Exercise 3

Turn to your right once more until you see a new configuration of dots. In this case, there are dots in the distance and one dot spiraling in and out in front of them. Air tap to change which dot the plane is set to, alternating between the dots in the back and the dot in motion. Notice how setting the plane position and the velocity to that of the spiraling dot makes artifacts appear everywhere.

**Tips**
* Keep your plane setting logic simple. As you’ve seen, you don’t need complex plane setting algorithms to make an immersive experience. The stabilization plane is only one piece of the puzzle.
* When at all possible, always move the plane between targets smoothly. Instantly switching distant targets can visually disrupt the scene.
* Consider having an option in your plane setting logic to lock onto a specific target. That way, you can have the plane locked on an object, such as a logo or title screen, if needed.

## About the author

<table style="border-collapse:collapse">
<tr>
<td style="border-style: none" width="60px"><img alt="Picture of Ben Strukus" width="60" height="60" src="images/genericusertile.jpg"></td>
<td style="border-style: none"><b>Ben Strukus</b><br>Software Engineer @Microsoft</td>
</tr>
</table>

## See also
* [MR Basics 100: Getting started with Unity](../unity/tutorials/holograms-100.md)
* [Focus point in Unity](../unity/focus-point-in-unity.md)
* [Hologram stability](hologram-stability.md)
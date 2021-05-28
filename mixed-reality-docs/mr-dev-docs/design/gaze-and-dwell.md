---
title: Gaze and dwell
description: Get a general overview of the eye and head gaze-and-dwell input model for mixed reality applications.
author:  sostel
ms.author: sostel
ms.date: 10/31/2019
ms.topic: article
keywords: Mixed Reality, gaze, dwell, interaction, design, eye tracking, head tracking, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens, MRTK, Mixed Reality Toolkit
---

# Gaze and dwell

When hands are occupied with tools and parts, gestures can be tedious or impossible.
Voice commands may also be unreliable in certain contexts, for example under excessively loud conditions.
Gaze and dwell offers a familiar and easy-to-master mechanism for working heads-up and hands-free on HoloLens.
Additionally, gaze and dwell is a great fallback, which is independent of noise interference or silence constraints in the operating environment.
We distinguish two variants of _gaze and dwell_: [Head-gaze and dwell](gaze-and-dwell-head.md) and [Eye-gaze and dwell](gaze-and-dwell-eyes.md).

## Scenarios

Gaze and dwell excels in scenarios where a person's hands are busy with other tasks, and voice isn't 100% reliable or available because of environmental or social constraints.
A good example is a person wearing a HoloLens to overlay reference information while repairing a car engine.
Their hands are busy with tools or supporting their body as they lean into the engine compartment.
The garage space is loud, with the constant banging and buzzing of tools, making voice commands difficult.
Gaze and dwell allows the person using the HoloLens to confidently navigate their reference material without interrupting their workflow.

## Device support

<table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <tr>
        <td><strong>Input model</strong></td>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens (1st gen)</strong></a></td>
        <td><a href="https://docs.microsoft.com/hololens/hololens2-hardware"><strong>HoloLens 2</strong></td>
        <td><a href="../discover/immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Head-gaze and dwell</td>
        <td>✔️ Recommended</td>
        <td>✔️ Recommended</td>
        <td>✔️ Recommended</td>
    </tr>
	 <tr>
        <td>Eye-gaze and dwell</td>
        <td>❌ Not available</td>
        <td>✔️ Recommended</td>
        <td>❌ Not available</td>
    </tr>
</table>


<br>

---

 ## See also

* [Eye-based interaction](eye-gaze-interaction.md)
* [Eye tracking on HoloLens 2](eye-tracking.md)
* [Gaze and commit](gaze-and-commit.md)
* [Hands - Direct manipulation](direct-manipulation.md)
* [Hands - Gestures](gaze-and-commit.md#composite-gestures)
* [Hands - Point and commit](point-and-commit.md)
* [Instinctual interactions](interaction-fundamentals.md)
* [Voice input](voice-input.md)
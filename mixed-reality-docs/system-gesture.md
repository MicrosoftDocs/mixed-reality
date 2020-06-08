---
title: Start gesture
description: Start gesture to call out the Start Menu. 
author: shengkait
ms.author: cmeekhof
ms.date: 10/22/2019
ms.topic: article
keywords: Mixed Reality, Gestures, interaction, design
---
# Start gesture

The Start gesture is a hand gesture used to invoke the Start Menu. It is the equivalent of pressing the Windows key on the keyboard, the Xbox button on an Xbox controller, or the Windows button on the immersive headset motion controller. It's important to understand which gestures are reserved for the system on each Mixed Reality device to prevent conflicts when designing your interactions.

## Device support

<table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <tr>
        <td><strong>Feature</strong></td>
        <td><a href="hololens-hardware-details.md"><strong>HoloLens (1st gen)</strong></a></td>
        <td><a href="https://docs.microsoft.com/hololens/hololens2-hardware"><strong>HoloLens 2</strong></td>
        <td><a href="immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Bloom</td>
        <td>✔️</td>
        <td>❌</td>
        <td>❌</td>
    </tr>
     <tr>
        <td>Wrist button</td>
        <td>❌</td>
        <td>✔️</td>
        <td>❌</td>
    </tr>
    <tr>
        <td>Eye gaze and palm up pinch</td>
        <td>❌</td>
        <td>✔️</td>
        <td>❌</td>
    </tr>
</table>

## Bloom
To bring up the start menu in HoloLens (1st gen), we designed “Bloom”, which is a symbolic gesture mimicking the flower blossom. It's distinctive for surefooted interaction, easy to perform, and quick to recall. To do the bloom gesture on HoloLens (1st gen), hold out your hand with your palm up and fingertips together, then open your hand by spreading your fingers.

:::row:::
    :::column:::
        ![Bloom close](images/bloom-close.png)<br>
        **Step 1: Palm up with fingertips together**<br>
    :::column-end:::
    :::column:::
        ![Bloom open](images/bloom-open.png)<br>
        **Step 2: Palm up with fingertips spread**<br>
    :::column-end:::
:::row-end:::

<br>

---

## Start gesture
In HoloLens 2, we replaced the Bloom gesture with a virtual wrist button that allows for more instinctual interactions that require no additional teaching. By showing users the button on the wrist, they can intuitively reach out and press it with their other hand.

:::row:::
    :::column:::
        ![Wrist button ready](images/wrist-button-ready.png)<br>
        **Step 1: Palm up to show the wrist button**<br>
    :::column-end:::
    :::column:::
        ![Wrist button press](images/wrist-button-press.png)<br>
        **Step 2: Press the wrist button**<br>
    :::column-end:::
:::row-end:::

<br>

---


## One-handed Start gesture

> [!IMPORTANT]
> For the one-handed Start gesture to work:
>
> 1. You must update to the November 2019 update (build 18363.1039) or later.
> 1. Your eyes must be calibrated on the device so that eye tracking functions correctly. If you do not see orbiting dots around the Start icon when you look at it, your eyes are not calibrated on the device.

You can also perform the Start gesture with only one hand. To do this, hold out your hand with your palm facing you and look at the **Start icon** on your inner wrist. **While keeping your eye on the icon**, pinch your thumb and index finger together.<br>
:::row:::
    :::column:::
        ![Wrist button ready](images/wrist-button-ready.png)<br>
        **Step 1: Palm up to show the wrist button**<br>
    :::column-end:::
    :::column:::
        ![Wrist button pinch](images/wrist-button-pinch.png)<br>
        **Step 2: Eye gaze at the button then pinch**<br>
    :::column-end:::
:::row-end:::

<br>

---

## See also

* [Instinctual interactions](interaction-fundamentals.md)
* [Eye-gaze](eye-tracking.md)
* [Voice input](voice-input.md)

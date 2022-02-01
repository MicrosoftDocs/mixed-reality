---
title: Start gesture
description: Learn how to use the start gesture to call out the Start Menu on HoloLens and Windows Mixed Reality immersive headsets. 
author: shengkait
ms.author: cmeekhof
ms.date: 10/22/2019
ms.topic: article
keywords: Mixed Reality, Gestures, interaction, design, mixed reality headset, windows mixed reality headset, virtual reality headset, HoloLens, MRTK, Mixed Reality Toolkit, bloom
---

# Start gesture

The Start gesture is a hand gesture used to invoke the Start Menu. It's the equivalent of pressing the Windows key on keyboards, the Xbox icon on Xbox controllers, or the Windows icon on immersive headset motion controllers. Pay special attention to reserved system gestures on each Mixed Reality device to prevent conflicts when you're designing interactions.

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
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens (1st gen)</strong></a></td>
        <td><a href="/hololens/hololens2-hardware"><strong>HoloLens 2</strong></td>
        <td><a href="/windows/mixed-reality/enthusiast-guide/immersive-headset-hardware-details"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Bloom</td>
        <td>✔️</td>
        <td>❌</td>
        <td>❌</td>
    </tr>
     <tr>
        <td>Wrist icon</td>
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

We designed “Bloom” to bring up the start menu in HoloLens (1st gen), which is a symbolic gesture mimicking a flower blossom. It's distinctive for sure-footed interaction, easy of use, and quick to recall. To use the gesture, hold out your hand with your palm up and fingertips together, then open your hand by spreading your fingers.

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

In HoloLens 2, we replaced the Bloom gesture with a virtual wrist icon, which is more instinctual for users. By showing users the icon on the wrist, they can intuitively reach out and press it with their other hand.

:::row:::
    :::column:::
        ![Wrist icon ready](images/wrist-button-ready.png)<br>
        **Step 1: Palm up to show the wrist icon**<br>
    :::column-end:::
    :::column:::
        ![Wrist icon press](images/wrist-button-press.png)<br>
        **Step 2: Press the wrist icon**<br>
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

You can also use the Start gesture with only one hand. Hold out your hand with your palm facing you and look at the **Start icon** on your inner wrist. **While keeping your eye on the icon**, pinch your thumb and index finger together.<br>
:::row:::
    :::column:::
        ![Wrist icon ready](images/wrist-button-ready.png)<br>
        **Step 1: Palm up to show the wrist icon**<br>
    :::column-end:::
    :::column:::
        ![Wrist icon pinch](images/wrist-button-pinch.png)<br>
        **Step 2: Eye gaze at the icon then pinch**<br>
    :::column-end:::
:::row-end:::

<br>

---

## See also

* [Instinctual interactions](interaction-fundamentals.md)
* [Eye-gaze](eye-tracking.md)
* [Voice input](voice-input.md)
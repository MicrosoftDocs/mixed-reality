---
title: System gesture
description: System gesture to call out the Start Menu. 
author: shengkait
ms.author: cmeekhof
ms.date: 10/22/2019
ms.topic: article
keywords: Mixed Reality, Gestures, interaction, design
---
# System gesture

The system gesture is a hand gesture used to invoke the Start Menu. It is the equivalent to pressing the Windows key on the keyboard, the Xbox button on an Xbox controller, or the Windows button on the immersive headset motion controller. It will be important to understand which gestures are reserved for the system on each version of Mixed Reality devices to prevent conflicts.

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
        <td><strong>HoloLens 2</strong></td>
        <td><a href="immersive-headset-hardware-details.md"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td>Bloom</td>
        <td>✔️</td>
        <td>✔️</td>
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
To bring up the start menu in HoloLens (1st gen), we designed “Bloom”, which is a symbolic gesture mimicking the flower blossom. It's distinctive for surefooted interaction, easy to perform, and quick to recall. To do the bloom gesture on HoloLens, hold out your hand with your palm up and fingertips together, then open your hand by spreading your fingers.

:::row:::
    :::column:::
        ![Bloom close](images/bloom-close.png)<br>
        **Palm up with fingertips together**<br>
    :::column-end:::
    :::column:::
        ![Bloom open](images/bloom-open.png)<br>
        **Palm up with fingertips spreaded**<br>
    :::column-end:::
:::row-end:::

## Wrist button
In HoloLens 2, we replaced the Bloom gesture with a wrist button, allowing for a more Instinctual Interaction that requires no additional teaching. By showing users the button on the wrist, they can intuitively reach out and press it with the other hand.

:::row:::
    :::column:::
        ![Wrist button ready](images/wrist-button-ready.png)<br>
        **Palm up to show the wrist button**<br>
    :::column-end:::
    :::column:::
        ![Wrist button press](images/wrist-button-press.png)<br>
        **Press the wrist button**<br>
    :::column-end:::
:::row-end:::

## Eye gaze and palm up pinch
We have also designed a one-handed solution for ease of access in HoloLens 2. This gesture requires users to eye gaze at the wrist button, then use the same hand to perform a palm up pinch between the thumb and index finger.<br>
:::row:::
    :::column:::
        ![Wrist button ready](images/wrist-button-ready.png)<br>
        **Palm up to show the wrist button**<br>
    :::column-end:::
    :::column:::
        ![Wrist button pinch](images/wrist-button-pinch.png)<br>
        **Eye gaze at the button then pinch**<br>
    :::column-end:::
:::row-end:::

## See also

* [Instinctual interactions](interaction-fundamentals.md)
* [Voice input](voice-input.md)

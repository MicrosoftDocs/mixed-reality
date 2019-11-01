---
title: Hand menu
description: Hand menus allow users to quickly bring up hand-attached UI for frequently used functions. These are our best practices and recommendations for hand menus.
author: nbarragan23
ms.author: nobarr
ms.date: 08/27/2019
ms.topic: article
keywords: hand, menu, button, quick access, layout
---
# Hand menu

![Ulnar side hand location](images/UX/UX_Hero_HandMenu.jpg)

Hand menus allow users to quickly bring up hand-attached UI for frequently used functions. 

Below are the best practices we have found for hand menus. You can also find an example scene demonstrating the hand menu in [MRTK](https://github.com/microsoft/MixedRealityToolkit-Unity/blob/mrtk_release/Documentation/README_Solver.md#hand-menu-with-handconstraint-and-handconstraintpalmup).

<br>

---

## Behavior best practices
**A. Keep the number of buttons small:** 
Due to the close distance between a hand-locked menu and the eyes and also the user's tendency to focus on a relatively small visual area at any time (the attentional cone of vision is roughly 10 degrees), we recommend keeping the number of buttons small. Based on our exploration, one column with three buttons work well by keeping all the content within the field of view (FOV) even when users move their hands to the center of the FOV. 

**B. Utilize hand menu for quick action:** 
Raising an arm and maintaining the position could easily cause arm fatigue. Use a hand-locked method for the menu requiring a short interaction. If your menu is complex and requires extended interaction times, consider using world-locked or body-locked instead. 

**C. Button / Panel angle:**
Menus should billboard towards the opposite shoulder and middle of the head: This allows a natural hand move to interact with the menu with the opposite hand and avoids any awkward or uncomfortable hand positions when touching buttons. 

**D. Consider supporting one-handed or hands-free operation:**
Do not assume both of the user's hands are always available. Consider a wide range of contexts when one or both hands are not available, and make sure your design accounts for those situations. To support a one-handed hand menu, you can try transitioning the menu placement from hand-locked to world-locked when the hand flips (goes palm down). For hands-free scenarios, consider using a voice command to invoke the hand menu buttons.

**E. Two-step invocation:**
If you use just palm-up as an event to trigger the hand menu, it may accidentally appear when you don't need it (false-positive), because people move their hands a lot both intentionally (for communication and object manipulation) and unintentionally. If you experience false-positives in your app, consider adding an additional step besides the palm-up event to invoke the hand menu such as fully opened fingers.

**F. Avoid adding buttons near the wrist (system home button):**
If the hand menu buttons are placed too close to the home button, it may get accidentally triggered while interacting with the hand menu.

**G. Test, test, test:**
People have different bodies, with different thresholds for comfort and discomfort, etc. Be sure to test out your design on and get feedback from a variety of people.

<br>

---

## Hand menu placement best practices

In human anatomy, the ulnar nerve is a nerve that runs near the ulna bone. The ulna is a long bone found in the forearm that stretches from the elbow to the smallest finger.

Below are 2 recommended placements based on our explorations:


:::row:::
    :::column:::
        ![Ulnar side hand location](images/UlnarSideHandMenu.gif)<br>
        **A. Ulnar inside palm**<br>
        This position is reliable because the hands do not overlap each other. This is critical for accurate hand detection and tracking.
    :::column-end:::
    :::column:::
        ![Ulnar side hand location](images/UlnarAboveHandMenu.gif)<br>
        **B. Ulnar above hand**<br>
        This location is comfortable for users because they don't need to raise their arm too much to interact with the hand menu. We recommend placing menus **13cm** above the palm and align the buttons inside the ulnar palm. [Read more about the optimal button size](interactable-object.md)<br>
        <br>
        For technical reasons we recommend this location with one required implementation: the developer will need to freeze the menu once the user's opposite hand gets close to interacting with it. This will avoid jitteriness from overlapping hands and also allows for a faster targeting of the buttons.<br>
        <br>
        HoloLens 2 cameras identify hands accurately when they are separate from each other. Any overlapping hands can cause hand menus move away from the anchor location.<br>
    :::column-end:::
:::row-end:::



<br>

---

## Menu positions that are not recommended
We have done user research with different menus layouts and locations, the following menu locations are **NOT recommended**, find the cons of each study below:


:::row:::
    :::column:::
        ![Above arm](images/AboveArm.gif)<br>
        **Above the arm**<br>
        1 - Difficult to maintain good hand tracking<br>
        2 - Causes user fatigue due to unnatural position
    :::column-end:::
    :::column:::
        ![Above fingers](images/AboveFingers.gif)<br>
        **Above fingers**<br>
        1 - Hand fatigue due to holding hand for long time<br>
        2 - Hand tracking issues on index and middle finger
    :::column-end:::
:::row-end:::

<br>

:::row:::
    :::column:::
        ![Above center palm](images/handCenter.gif)<br>
        **Above-center palm**<br>
        1 - Hand tracking issues due to overlapping hands<br>
        2 - Hand fatigue due to holding hands for long time in order to interact with menus
    :::column-end:::
    :::column:::
        ![Top Fingertip](images/TopFingerTip.gif)
        **Top fingertip**<br>
        1 - Hand tracking issues<br>
        2 - Hand fatigue holding hand above normal posture<br>
        3 - Issues pressing buttons with other fingers by accident due to limited space between fingers
    :::column-end:::
:::row-end:::

<br>

:::row:::
    :::column:::
        ![Back of the Arm](images/BackOfTheArm.gif)<br>
        **Back of the arm**<br>
        1 - Can trigger home button by accident<br>
        2 - Not a natural or comfortable position for users
    :::column-end:::
    :::column:::
    :::column-end:::
:::row-end:::

<br>

---


## See also

* [Interactable object](interactable-object.md)
* [Direct manipulation with hands](direct-manipulation.md)
* [Hands and motion controllers](hands-and-tools.md)

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

The hand menu is one of the most unique UX patterns in HoloLens 2. It allows you to quickly bring up hand-attached UI. Since it is accessible anytime and can be shown and hidden easily, it is great for quick actions.

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4AJAg]

Below are the best practices we have found for hand menus. You can also find an example scene demonstrating the hand menu in [MRTK](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_HandMenu.html).

<br>


---

## Best practices
**Keep the number of buttons small** 

Due to the close distance between a hand-locked menu and the eyes and also the user's tendency to focus on a relatively small visual area at any time (the attentional cone of vision is roughly 10 degrees), we recommend keeping the number of buttons small. Based on our exploration, one column with three buttons works well by keeping all the content within the field of view (FOV) even when a user moves their hands to the center of the FOV. 

**Utilize hand menu for quick action** 

Raising an arm and maintaining the position could easily cause arm fatigue. Use a hand-locked method for the menu requiring a short interaction. If your menu is complex and requires extended interaction times, consider using world-locked or body-locked instead. 

**Button / Panel angle**

Menus should billboard towards the opposite shoulder and middle of the head: This allows a natural hand move to interact with the menu with the opposite hand and avoids any awkward or uncomfortable hand positions when touching buttons. 

**Consider supporting one-handed or hands-free operation**

Do not assume both of the user's hands are always available. Consider a wide range of contexts when one or both hands are not available, and make sure your design accounts for those situations. To support a one-handed hand menu, you can try transitioning the menu placement from hand-locked to world-locked when the hand flips (goes palm down). For hands-free scenarios, consider using a voice command to invoke the hand menu.

**Avoid adding buttons near the wrist (system home button)**

If the hand menu buttons are placed too close to the home button, it may get accidentally triggered while interacting with the hand menu.

<br>

## Hand menu with large and complex UI controls
<img src="images/UX/HandMenu_SizeExample.png" alt="HoloLens perspective of a menu system that always faces the user" width="940px">
It is recommended to limit the number of buttons or UI controls on hand-attached menus. This is because extended interaction with a large number of UI elements can cause arm fatigue. If your experience requires a large menu, provide an easy way for the user to world lock the menu. One technique we recommend is to world-lock then menu when the hand drops or flips away from the user. A second technique is to allow the user to directly grab the menu with the other hand. When the user releases the menu, the menu should world lock. This way, a user can interact with various UI elements comfortably and confidently over an extended period of time. 

When the menu is world-locked, make sure to provide a way to move the menu, and close the menu when it is no longer needed. Make the menu movable by providing handles on the sides or top of menu. Add a close button to allow the menu to close. Allow for the menu to re-attach to the hand when the user hand faces the user. We also recommend requiring that the users gazes at their hand to prevent false activations (see below).

**Large menu that shows a usability issue**

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4AOPx]

**World-locked menu on hand drop**

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4AGZi]

**Manual grab & pull to world-lock the menu**

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4AJAf]


## How to prevent false activation

If you use just palm-up as an event to trigger the hand menu, it may accidentally appear when you don't need it (false-positive), because people move their hands both intentionally (for communication and object manipulation) and unintentionally. To reduce false activations, add an additional step besides the palm-up event to invoke the hand menu (such as fully opened fingers, or the user intentionally gazing at their hand).

**Require Flat Palm**
By requiring a flat open hand, you can prevent false activation that might occur as the user manipulates objects or gestures while communicating within an environment. 

**Require Gaze**
By requiring the user to gaze at their hand (either with eye gaze or head gaze), it prevents false activations due to the user having to intentionally direct their attention to the hand as a secondary activation step (with a tunable distance threshold used to allow for user comfort).  

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4Asn4]

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
        1 - Hand fatigue due to holding out hand for a long time<br>
        2 - Hand tracking issues on index and middle fingers
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
        2 - Hand fatigue from holding hand above normal posture<br>
        3 - Issues pressing buttons with other fingers by accident due to limited space between fingers
    :::column-end:::
:::row-end:::

<br>

:::row:::
    :::column:::
        ![Back of the Arm](images/BackOfTheArm.gif)<br>
        **Back of the arm**<br>
        1 - Can trigger home button by accident<br>
        2 - Not a natural or comfortable position
    :::column-end:::
    :::column:::
    :::column-end:::
:::row-end:::

<br>

---

## Hand menu in MRTK (Mixed Reality Toolkit) for Unity
**[MRTK](https://github.com/Microsoft/MixedRealityToolkit-Unity)** provides scripts and example scenes for the hand menu. The HandConstraintPalmUp solver script allows you to attach any objects to the hands with various configurable options. MRTK's hand menu examples include useful options such as flat palm and gaze requirement for preventing false activation.

* [Hand Menu Documentations](https://microsoft.github.io/MixedRealityToolkit-Unity/Documentation/README_HandMenu.html)
* [Hand Menu Example Scene](https://github.com/microsoft/MixedRealityToolkit-Unity/blob/mrtk_development/Assets/MRTK/Examples/Demos/HandTracking/Scenes/HandMenuExamples.unity)

You can try hand menu examples in HoloLens 2 with MRTK Examples Hub app. 
* [Hand Menu Scene in MRTK Examples Hub](https://www.microsoft.com/en-us/p/mrtk-examples-hub/9mv8c39l2sj4?activetab=pivot:overviewtab)

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

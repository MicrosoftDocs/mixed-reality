---
title: Hand menu
description: Hand menus allow users to quickly bring up and hand-attached UI for frequently used functions. These are our best practices and recommendations for hand menus.
author: nbarragan23
ms.author: nobarr
ms.date: 08/27/2019
ms.topic: article
keywords: hand, menu, button, quick access, layout
---
# Hand menu
![Ulnar side hand location](images/MRTK_UX_HandMenu.png)

Hand menus allow users to quickly bring up and hand-attached UI for frequently used functions. 

Below are the best practices we have found for hand menus. You can also find an example scene demonstrating the hand manu in [MRTK](https://github.com/microsoft/MixedRealityToolkit-Unity/blob/mrtk_release/Documentation/README_Solver.md#hand-menu-with-handconstraint-and-handconstraintpalmup).

## Behavior best practices
**A. Keep the number of buttons small:** 
Due to the close distance between hand-locked menu and eyes and also users' tendency to focus on a relatively small visual area at any time (the attentional cone of vision is roughly 10 degrees), we recommend keeping the number of buttons small. Based on our exploration, one column with three buttons work well by keeping all the content within the FOV even when users move their hands to the center of FOV. 

**B. Utilize hand menu for quick action:** 
Raising arm and maintaining the position could easily cause arm fatigue. Use hand-locked method for the menu requiring short interaction. If your menu is complex and requires extended interaction times, consider using world-lock or body-lock instead. 

**C. Button / Panel angle:**
Menu should billboard towards opposite shoulder and middle head: This allows a natural hand move to interact with opposite hand with menu and avoids awkward and uncomfortable hand positions when touching buttons. 

**D. Consider supporting one-handed or hands-free operation:**
Do not assume both of users' hands are always available. Consider a wide range of contexts when user's one or both hands are not available, and accommodate your design for those situations. To support one-handed hand menu, you can try transitioning menu placement from hand-lock to world-lock when hand flips (palm down). For hands-free scenario, you can consider using voice command to invoke the hand menu buttons.

**E. Two-step invocation:**
If you use just palm-up as an event to trigger hand menu, it may accidentally appear when you don't need it (false-positive), because people moves their hands a lot both intentionally (for communication and object manipulation) and unintentionally. If you experience many false-positives in your app, consider adding additional step besides palm-up event to invoke hand menu such as fully opened fingers.

**F. Avoid adding buttons near the wrist (system home button):**
If hand menu buttons are placed too close to the home button, it may get accidentally triggered while interacting with hand menu.

**G. Test, test, test:**

People have different bodies, different positions of comfort and discomfort, etc.
Complex menu placement – anything that requires extended interaction times should be more persistent. Suggestions include body-locking or world-locking


## Hand menu placement best practices

In human anatomy, the ulnar nerve is a nerve that runs near the ulna bone. The ulna is a long bone found in the forearm that stretches from the elbow to the smallest finger.

Below are 2 recommended placements based on our exploration:


![Ulnar side hand location](images/UlnarSideHandMenu.gif)

**A. Ulnar inside palm:** This position is very reliable because hands do not overlap to each other which is critical for accurate hand detection and tracking.

<br>

![Ulnar side hand location](images/UlnarAboveHandMenu.gif)

**B. Ulnar above hand:**
The location is comfortable for users because is not necessary to raise users’ arm too much to interact with hand menu. We recommend to place menus 13cm above palm and align buttons inside Ulnar palm

For technical reasons we recommend this location with one required implementation, developer need to freeze menus once users get closer with opposite hand to interact with menu, this will avoid jitteriness from overlapping hands, and also allows for fast targeting of buttons.

HoloLens 2 cameras identify hands accurately when they are separate from each other, any overlapping hands can cause hand menus move away from the anchor location

[Read more about the optimal button size](interactable-object.md)


## Suboptimal positions
We have done user research with different menus layouts and locations, the following menu locations are **NOT recommended**, find the cons of each study below:

![Above arm](images/AboveArm.gif)

**Above the arm**
1. Difficult maintain a good hand tracking
2. Cause fatigue on users due to unnatural position

<br>

![Above fingers](images/AboveFingers.gif)

**Above fingers**
1. Hand fatigue due to holding hand for long time
2. Hand tracking issues on index and middle finger

<br>

![Above center palm](images/handCenter.gif)

**Above-center palm**
1. Hand track issues due to overlapping hands
2. Hand fatigue holding hands for long time to interact with menus

<br>

![Top Fingertip](images/TopFingerTip.gif)

**Top fingertip**
1. Hand tracking issues
2. Hand fatigue holding hand above a normal posture
3. Issues pressing buttons with other fingers by accident due to limited space between fingers

<br>

![Back of the Arm](images/BackOfTheArm.gif)

**Back of the arm**
1. Tigger home button by accident
2. Not a natural comfortable position for users


## See also

* [Interactable object](interactable-object.md)
* [Direct manipulation with hands](direct-manipulation.md)
* [Hands and motion controllers](hands-and-tools.md)

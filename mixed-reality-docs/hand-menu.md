---
title: Hand Menu
description: Best practices and recommendations for hand menus
author: Noe Barragan & Hae Jin Lee
ms.date: 08/27/2019
ms.topic: article
keywords: hand, menu, button, quick access, layout
---
# Hand menu

Hand is one of the most versatile tools in our body. With HoloLens2, you can make our hand become even more powerful by augmenting it with new capabilities, like quick action menus. 
Compared to other placement mechanisms such as world lock or tag-along, hand locked menus are highly accessible without getting in the way of users.

Have you ever wanted to become a cyborg by augmenting yourself with extra capabilities? With HoloLens 2, now you can! Thanks to fully articulated hand tracking, you can make holograms follow your hand, as if they are extension of your body.

This placement method is similar to body-locked behavior in terms’ it’s tethered to users’ body parts and making holograms highly discoverable. However, different from body-locked holograms, hand-locked menu can be completely invisible when hand is not in view, allowing unobstructed view of holographic content placed in front of users.

Due to these strength, UI menu is a good candidate for the hand-locked hologram, and you can find an example scene in [MRTK toolkit](https://github.com/microsoft/MixedRealityToolkit-Unity/blob/mrtk_release/Assets/MixedRealityToolkit.Examples/Demos/HandTracking/Scenes/HandBasedMenuExample.unity).

## What are they?
2D Holographic buttons, the main function of these buttons is to get a quick access to the most common used functions of your Holographic experiences.

## Where are They?
These are 2 recommended placements based on our exploration.

**Ulnar** In human anatomy, the ulnar nerve is a nerve that runs near the ulna bone. The ulna is a long bone found in the forearm that stretches from the elbow to the smallest finger.

![Ulnar side hand location](images/UlnarSideHandMenu.jpg)

**a. Ulnar inside palm:** This position is very reliable because hands do not overlap to each other which is critical for accurate hand detection and tracking.

![Ulnar side hand location](images/UlnarAboveHandMenu.jpg)

**b. Ulnar above hand:**
The location is comfortable for users because is not necessary to raise users’ arm too much to interact with hand menu. We recommend to place menus 13cm above palm and align buttons inside Ulnar palm

For technical reasons we recommend this location with one required implementation, developer need to freeze menus once users get closer with opposite hand to interact with menu, this will avoid jitteriness from overlapping hands, and also allows for fast targeting of buttons.

HoloLens 2 cameras identify hands accurately when they are separate from each other, any overlapping hands can cause hand menus move away from the anchor location

To read more details for best button size, [click here](https://docs.microsoft.com/en-us/windows/mixed-reality/interactable-object)

## Best practices 
**A. Keep the number of button small:** 
Due to the close distance between hand-locked menu and eyes and also users' tendency to focus on a relatively small visual area at any time (the attentional cone of vision is roughly 10 degree), we recommend keeping the number of button small. Based on our exploration, one column with three buttons work well by keeping all the content within the FOV even when users move their hands to the center of FOV. 

**B. Utilize hand menu for quick action:** 
Raising arm and maintaining the position could easily cause arm fatigue. Use hand-locked method for the menu requiring short interaction. If your menu is complex and requires extended interaction times, consider using world-lock or body-lock instead. 

**C. Button / Panel angle:**
Menu should billboard towards opposite shoulder and middle head: This allows a natural hand move to interact with opposite hand with menu and avoids awkward and uncomfortable hand positions when touching buttons. 

**D. Consider supporting one Handed or hands-free operation:**
Do not assume both of users' hands are always available. Consider a wide range of contexts when user's one or both hands are not available, and accommodate your design for those situations. To support one-handed hand menu, you can try transitioning menu placement from hand-lock to world-lock when hand flips (palm down). For hands-free scenario, you can consider using voice command to invoke the hand menu buttons.

**E. Two-step invocation:**
If you use just palm-up as an event to trigger hand menu, it may accidentally appear when you don't need it (false-positive), because people moves their hands a lot both intentionally (for communication and object manipulation) and unintentionally. If you experience many false-positive in your app, especially because it requires many other hand interactions, consider adding additional step besides palm-up event to invoke hand menu such as fully opened fingers.

**F. Avoid adding buttons near home button:**
A good design practice is to help users to avoid false positives to get a good experience, adding buttons near home button can potentially cause to show home button without having the intention to see home menu

**G. Test, test, test:**
People have different bodies, different positions of comfort and discomfort, etc.
Complex menu placement – anything that requires extended interaction times should be more persistent. Suggestions include body-locking or world-locking

**H. Suboptimal positions:** We have done user research with different menus layouts and locations, the following menu locations are **NOT recommended**, find the cons of each study below:

![Above Arm](images/AboveArm.gif)

**Above the arm**
1. Difficult maintain a good hand tracking
2. Cause fatigue on users due to unnatural position
3. Due to some positions hand overlap

![Above Fingers](images/AboveFingers.gif)

**Above Fingers**
1. Hand fatigue due to holding hand for long time
2. Hand tracking issues on index and middle finger

![Above Center Palm](images/palmCenter.gif)

**Above-center palm**
1. Hand track issues due to overlapping hands
2. Hand fatigue holding hands for long time to interact with menus

![Top Fingertip](images/TopFingerTip.gif)

**Top fingertip**
1. Hand tracking issues
2. Hand fatigue holding hand above a normal posture
3. Issues pressing buttons with other fingers by accident due to limited space between fingers

![Back of the Arm](images/BackOfTheArm.gif)

**Back of the arm**
1. Tigger home button by accident
2. Not a natural comfortable position for users

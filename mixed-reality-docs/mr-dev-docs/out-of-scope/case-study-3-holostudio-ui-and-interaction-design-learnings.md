---
title: Case study - 3 HoloStudio UI and interaction design learnings
description: HoloStudio UI and interaction design learnings
author: rwinj
ms.author: randyw
ms.date: 03/21/2018
ms.topic: article
keywords: HoloLens, HoloStudio, Windows Mixed Reality
---

# Case study - 3 HoloStudio UI and interaction design learnings

[HoloStudio](https://www.youtube.com/watch?v=BRIJG0x_We8) was one of the first Microsoft apps for HoloLens. Because of this, we had to create new best practices for 3D UI and interaction design. We did this through a lot of user testing, prototyping, and trial and error.

We know that not everyone has the resources at their disposal to do this type of research, so we had our Sr. Holographic Designer, Marcus Ghaly, share three things we learned during the development of HoloStudio about UI and interaction design for HoloLens apps.

## Watch the video

>[!VIDEO https://www.youtube.com/embed/sX6yKHmN1qM]

## Problem #1: People didn't want to move around their creations

We originally designed the workbench in HoloStudio as a rectangle, much like you'd find in the real world. The problem is that people have a lifetime of experience that tells them to stay still when they're sitting at a desk or working in front of a computer, so they weren't moving around the workbench and exploring their 3D creation from all sides.

![The rectangular design of the workbench in HoloStudio dissuaded users from moving around and seeing their creations from all sides.](images/rectangular-workbench-500px.jpg)

We had the insight to make the workbench round, so that there was no "front" or clear place that you were supposed to stand. When we tested this, suddenly people started moving around and exploring their creations on their own.

![The circular workbench design encouraged users to walk all the way around their creations.](images/circular-workbench-500px.jpg)

**What we learned**

Always be thinking about what's comfortable for the user. Taking advantage of their physical space is a cool feature of HoloLens and something you can't do with other devices.

## Problem #2: Modal dialogs are sometimes out of the holographic frame

Sometimes, your user may be looking in a different direction from something that needs their attention in your app. On a PC, you can just pop up a dialog, but if you do this in someone's face in a 3D environment, it can feel like the dialog is getting in their way. You need them to read the message, but their instinct is to try to get away from it. This reaction is great if you're playing a game, but in a tool designed for work, it's less than ideal.

After trying a few different things, we finally settled on using a "thought bubble" system for our dialogs and added tendrils that users can follow to where their attention is needed in our application. We also made the tendrils pulse, which implied a sense of directionality so that users knew where to go.

![The "Thought Bubble" system included pulsing tendrils which provided a sense of direction, leading users to where their attention was needed in the app.](images/thought-bubble-500px.jpg)

**What we learned**

It's much harder in 3D to alert users to things they need to pay attention to. Using attention directors such as [spatial sound](../design/spatial-sound.md), light rays, or thought bubbles, can lead users to where they need to be.

## Problem #3: Sometimes UI can get blocked by other holograms

There are times when a user wants to interact with a hologram and its associated UI controls, but they are blocked from view because another hologram is in front of them. While we were developing HoloStudio, we used trial and error to come to a solution for this.

![A UI control associated with a hologram can become blocked if there is another hologram between it and the user wearing HoloLens.](images/ui-blocked-500px.jpg)

We tried moving the UI control closer to the user so it couldn't get blocked, but found that it wasn't comfortable for the user to look at a control that was near to you while simultaneously looking at a hologram that was far away. If, however, we moved the control in front of the closest hologram to the user, they felt like it was detached from the hologram it should be affecting.

We finally ended up ghosting the UI control, and put it at the same distance from the user as the hologram it's associated with, so they both feel connected. This allows the user to interact with the control even though it's been obscured.

![The solution: we ghosted the UI control, which both allowed interaction with the control and made it feel connected to the hologram it was affecting.](images/ghosting-ui-500px.jpg)

**What we learned**

Users need to be able to easily access UI controls even if they've been blocked, so figure out methods to ensure that users can complete their tasks no matter where their holograms are in the real world.

## About the author

<table>
<tr>
<td width="60"><img alt="Picture of Marcus Ghaly" width="60" height="60" src="images/marcus-ghaly-200px.jpg"></td>
<td><b>Marcus Ghaly</b><br>Sr. Holographic Designer @Microsoft</td>
</tr>
</table>

## See also
* [Instinctual interactions](../design/interaction-fundamentals.md)

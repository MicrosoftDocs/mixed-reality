---
title: Hand joint chaser -- MRTK2
description: Hand joint chaser in MRTK
author: CDiaz-MS
ms.author: cadia
ms.date: 01/12/2021
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK,
---

# Hand joint chaser -- MRTK2

![Hand joint chasers](../images/hand-joint-chaser/MRTK_HandJointChaser_Main.jpg)
This example scene demonstrates how to use Solver to attach objects to the hand joints.

## Example scene

You can find the example scene **HandJointChaserExample** scene in the `Assets/MRTK/Examples` folder under `Demos/Input/Scenes/`.

## Solver handler

Click **Tracked Object To Reference** and select **Hand Joint Left** or **Hand Joint Right**. You will be able to see **Tracked Hand Joint** drop down. From the drop down list, you can select specific joint to track.
This example scene uses Radial View Solver to make an object follow the target object. See [Solver](../ux-building-blocks/solvers/solver.md) page for more details.

![Hand joint solver](../images/hand-joint-chaser/MRTK_Solver_HandJoint.jpg)

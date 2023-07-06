---
title: Case study - Lessons from the Lowe's kitchen
description: The HoloLens team wants to share some of the best practices that were derived from the Lowe's HoloLens project.
author: brandonbray
ms.author: kevincol
ms.date: 03/21/2018
ms.topic: article
keywords: Windows Mixed Reality, Lowe's, HoloLens, kitchen, case study
---



# Case study - Lessons from the Lowe's kitchen

The HoloLens team wants to share some of the best practices that were derived from the Lowe's HoloLens project. Below is a video of the Lowe's HoloLens projected demonstrated at Satya's 2016 Ignite keynote.
<br>
>[!VIDEO https://www.youtube.com/embed/gC_4JxF0e_k]

## Lowe's HoloLens Best Practices

The two videos cover best practices that were derived from the Lowe's HoloLens Pilot that has been in two Lowe's stores since April 2016. The key topics are:
* Maximize performance for a mobile device
* Create UX methods with a full holographic frame (2nd talk)
* Precision alignment (2nd talk)
* Shared holographic experiences (2nd talk)
* Interacting with customers (2nd talk)

## Video 1

**Maximize performance for a mobile device** HoloLens is an untethered device with all the processing taking place in the device. This requires a mobile platform and requires a mindset similar to creating mobile applications. Microsoft recommends that your HoloLens application maintain 60FPS to provide a delicious experience for your users. Having low FPS can result in unstable holograms.

Some of the most important things to look at when developing on HoloLens is asset optimization/decimation, using custom shaders (available for free in the [HoloLens Toolkit](https://github.com/Microsoft/HoloToolkit-Unity)). Another important consideration is to measure the frame rate from the very beginning of your project. Depending on the project, the order of displaying your assets can also be a big contributor
<br>
>[!VIDEO https://www.youtube.com/embed/o0QIPwgiP9A]

## Video 2

**Create UX methods with a full holographic frame** It's important to understand the placement of holograms in a physical world. With Lowe's we talk about different UX methods that help users experience holograms up close while still seeing the larger environment of holograms.

**Precision alignment** For the Lowe's scenario, it was paramount to the experience to have precision alignment of the holograms to the physical kitchen. We discuss techniques helps ensure an experience that convinces users that their physical environment has changed.

**Shared holographic experiences** Couples are the primary way that the Lowe's experience is consumed. One person can change the countertop and the other person will see the changes. We called this "shared experiences".

**Interacting with customers** Lowe's designers are not using a HoloLens, but they need to see what the customers are seeing. We show how to capture what the customer is seeing on a UWP application.
<br>
>[!VIDEO https://www.youtube.com/embed/LceMdyKZ4PI]

---
title: Interaction Multimodal  overview
description: Overview of the multimodal interaction
author: shengkait
ms.author: shengkait
ms.date: 04/11/2019
ms.topic: article
keywords: Mixed Reality, Gaze, gaze targeting, interaction, design, hololens, MMR, multimodal 
---

# Introducing instinctual interactions

The philosophy of simple, instinctual interactions is woven throughout the Microsoft Mixed Reality (MMR) platform, from hardware to software.

These instinctual interactions utilize all available input technologies, including inside-out tracking, hand tracking, eye tracking, and natural language, in seamless multimodal interaction models. Based on our research, designing and developing multimodals, and not based on single inputs, is critical when creating instinctive experiences.

The Instinctual Interaction models also naturally align across device types.  For example, far interaction on an immersive headset with a 6 degrees of freedom (DoF) controller and far interaction on a HoloLens 2 use the same affordances, patterns, and behaviors.  Not only is this convenient for developers and designers, but it feels natural to end users.

We've structures our guidance to reflect this philosophy: that the most instinctual interaction models are multimodal, and that interaction is consistent across device types and whether users are using controllers or not.

## Multimodal interaction models

Based on our research and work with customers to date, we've discovered three primary interaction models that suit the majority of Mixed Reality experiences.  

Think of these interaction models as the user's mental model for completing their flows.

| [Hands and Tools](https://review.docs.microsoft.com/en-us/windows/mixed-reality/hands-and-tools?branch=master) | [Hands free](https://review.docs.microsoft.com/en-us/windows/mixed-reality/hands-free?branch=master) | [Gaze and Commit](https://review.docs.microsoft.com/en-us/windows/mixed-reality/gaze-and-commit?branch=master) |
| --- | --- | --- |

Each of these interaction models is convenient, powerful, and usable in its own right, and all are optimized for a set of customer needs. View the chart below, for scenarios, examples, and benefits of each interaction model.  

**Model** | **Hands and Tools** | **Hands-free** | **Gaze and Commit**
|--------- | --------------| ------------| ---------|
**Example Scenarios** | 3D spatial experiences, e.g. spatial layout and design, content manipulation, or simulation | Contextual experiences where a user's hands are occupied, e.g. on the-job learning, maintenance| Click-through experiences, e.g. 3D presentations, demos
**Fit** | Great for new users, coupled wit voice, eye tracking or head gaze. Low learning curve. Consistent UX across hand tracking and 6 DoF controllers. | Some learning required. If hands are unavailable pairs well with voice and natural language | Requires training on HMDs but not on mobile. Best for accessible controllers Best for HoloLens (1st gen) |
**Hardware** | HoloLens 2 Immersive headsets | HoloLens 2 HoloLens (1st gen) Immersive headsets | HoloLens 2 Immersive headsets | HoloLens 2 HoloLens (1st gen) Immersive headsets Mobile AR |

Detailed information for using all available inputs seamlessly together in each interaction model is on the pages that follow, as well as illustrations and links to sample content from our Unity MRTK.

## Choose an interaction model for your customer

Most likely, developers and creators also already have some ideas in mind of the kinds of interaction experience they want their users to have.

Even so, to encourage a customer-focused approach to design, we recommend a look at the guidance outlined in the next article, [Choosing interaction for your customer](coming-soon.md)

This article outlines some of the tips and tricks we've learned to keep users confident in different scenarios.

> [!Note]
> Check out the [Customer-focused creative process](coming-soon.md) section for suggestions on identifying your customer and creating a great Mixed Reality concept.

## Transition interaction models

There are also cases where customer or use cases require that your experience work with more than one interaction model – for example, if the core interaction model is Hands and tools, but a special Hands-free mode is required for field technicians.  

If your experience does require multiple interaction models, we've found that many end users may encounter difficulty transitioning from one model to another -- especially end users who are new to mixed reality.

To help guide designers and developers through choices that can be difficult in mixed reality, we've also included guidance on using multiple interaction models in the Transitioning interaction models article below.

> [!Note]
> Utilizing multiple interaction models in a single application can create difficulties for end users.  Please check out our guidance in the article [Transitioning interaction models](coming-soon.md).

## Next section: visual design language

Click the link below or follow the page navigation to continue to the next section on [Visual design language](coming-soon.md).

## See also

* [Gaze and commit](gaze-and-commit.md)
* [Direct manipulation](direct-manipulation.md)
* [Point and commit](point-and-commit.md)
* [Gaze targeting](gaze-targeting.md)
* [Gestures](gestures.md)
* [Voice design](voice-design.md)
* [Motion controllers](motion-controllers.md)
* [Spatial sound design](spatial-sound-design.md)
* [Spatial mapping design](spatial-mapping-design.md)
* [Comfort](comfort.md)

---
title: Multimodal interaction overview
description: Overview of the multimodel interaction
author: shengkait
ms.author: shengkait
ms.date: 04/11/2019
ms.topic: article
keywords: Mixed Reality, Gaze, gaze targeting, interaction, design
---

# Introducing instinctual interactions
The philosophy of simple, instinctual interactions is woven throughout the Microsoft Mixed Reality platform, from hardware to software. 

These instinctual interactions utilize all available input technologies, including inside out tracking, hand tracking, eye tracking, and natural language, in seamless multimodal interaction models.  Based on our research, designing and developing multimodally, and not based on single inputs, is critical to creating instinctive experiences. 

The Instinctual Interaction models also naturally align across device types.  For example, far interaction on an immersive headset with a 6 DoF controlller and far interaction on a HoloLens 2 use the same affordances, patterns, and behaviors.  Not only is this convenient for developers and designers, but it feels natural to end users. 

We've structures our guidance to reflect this philosophy: that the most instinctual interaction models are multimodal, and that interaction is consistent across device types and whether users are using controllers or not.

## Multimodal interaction models
Based on our research and work with customers to date, we've discovered three primary interaction models that suit the majority of Mixed Reality experiences.  

Think of these interaction models as the user's mental model for completing their flows. 
<br><br>
<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><strong><a href="hands-and-tools.md">Hands and tools</a></strong></td>
        <td><strong><a href="hands-free.md">Hands-free</a></strong></td>
        <td><strong><a href="gaze-and-commit.md">Gaze and commit</a></strong></td>
    </tr> 
</table>
<br>
Each of these interaction models is convenient, powerful, and usable in its own right, and each is optimized for a set of customer needs. Check out the chart below for some examples of scenarios and benefits of each interaction model.  
<br><br>
<table>
    <colgroup>
    <col width="10%" />
    <col width="30%" />
    <col width="30%" />
    <col width="30%" />
    </colgroup>
    <tr>
        <td><strong>Model</strong></td>
        <td><strong>Hands and tools</strong></td>
        <td><strong>Hands-free</strong></td>
        <td><strong>Gaze and commit</strong></td>
    </tr>
    <tr>
        <td>Example scenarios</td>
        <td>3D spatial experiences<br>e.g. spatial layout and design, content manipulation, or simulation</td>
        <td>Contextual experiences where a user's hands are occupied<br>e.g. on the-job learning, maintenance</td>
        <td>Click-through experiences<br> e.g. 3D presentations, demos</td>
    </tr>
    <tr>
        <td>Fit</td>
        <td>Great for new users<br>Low learning curve<br>Grounded in easy visual affordances<br>Consistent UX across hand tracking and 6 DoF controllers<br>Great when coupled with voice, eye tracking, or head gaze</td>
        <td>Some learning required<br>If hands are unavailable<br>pairs well with voice and natural language</td>
        <td>Requires training on HMDs but not on mobile<br>Best for accessible controllers<br>Best for HoloLens (1st gen)</td>
    </tr>
    <tr>
        <td>Hardware</td>
        <td>HoloLens 2<br>Immersive headsets</td>
        <td>HoloLens 2<br>HoloLens (1st gen)<br> Immersive headsets</td>
        <td>HoloLens 2<br>HoloLens (1st gen)<br> Immersive headsets<br> Mobile AR</td>
    </tr>
</table>
<br>



**Should we flip this table like this?**<br>

<table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <tr>
        <td><strong>Model</strong></td>
        <td><strong>Example scenarios</strong></td>
        <td><strong>Fit</strong></td>
        <td><strong>Hardware</strong></td>
    </tr>
    <tr>
        <td><a href="hands-and-tools.md">Hands and tools</a></td>
        <td>3D spatial experiences<br>e.g. spatial layout and design, content manipulation, or simulation</td>
        <td>Great for new users<br>Low learning curve<br>Grounded in easy visual affordances<br>Consistent UX across hand tracking and 6 DoF controllers<br>Great when coupled with voice, eye tracking, or head gaze</td>
        <td>HoloLens 2<br>Immersive headsets</td>
    </tr>
    <tr>
        <td><a href="hands-free.md">Hands-free</a></td>
        <td>Contextual experiences where a user's hands are occupied
e.g. on the-job learning, maintenance</td>
        <td>Some learning required<br>If hands are unavailable<br>pairs well with voice and natural language</td>
        <td>HoloLens 2<br>HoloLens (1st gen)<br> Immersive headsets</td>
    </tr>
    <tr>
        <td><a href="gaze-and-commit.md">Gaze and commit</a></td>
        <td>Click-through experiences e.g. 3D presentations, demos</td>
        <td>Requires training on HMDs but not on mobile<br>Best for accessible controllers<br>Best for HoloLens (1st gen)</td>
        <td>HoloLens 2<br>HoloLens (1st gen)<br> Immersive headsets<br> Mobile AR</td>
    </tr>
</table>
<br>
Detailed information for using all available inputs seamlessly together in each interaction model is on the pages that follow, as well as illustrations and links to sample content from our Unity MRTK.

## Choosing an interaction model for your customer

Most likely, developers and creators also already have some ideas in mind of the kinds of interaction experience they want their users to have. 

Even so, to encourage a customer-focused approach to design, we recommend a look at the guidance outlined in the next article, [Choosing interaction for your customer](coming-soon.md)

This article outlines some of the tips and tricks we've learned to keep users confident in different scenarios. 

> [!Note]
> Check out the [Customer-focused creative process](coming-soon.md) section for suggestions on identifying your customer and creating a great Mixed Reality concept.


## Why optimize? 
	•  It can be very distracting to optimize for all at once
		○ Example: cursors! See it, say it tooltips! Rays!
	• As users build intuition for the modalities, we recommend guiderails to build understanding and confidence

## What does optimization mean?
	• Affordances for each mode can be very different
		○ What is possible 
			* Ex: hover state grabbable areas and ghost hands for hands [needs graphic]
			* Ex: contextual help and guided experiences for voice [needs graphic]
			* Ex: Cursor for point + commit [needs graphic]
		○ what is working
			* Ex: Hand mesh [needs graphic]
			* Ex: Hypothesis for voice [needs graphic]
			* Ex: Dwell progress indicator [needs graphic]
		○ What you can do next
			* Ex: Arrow affordances for hands [needs graphic]
			* Ex: Prompts for voice [needs graphic]

	• Teaching transitions is as important as teaching the actual mechanics. This allows the user to have complete control and allowing her to adjust depending on the situation. 


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



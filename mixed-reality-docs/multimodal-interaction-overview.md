---
title: Multimodal Interaction Overview
description: Overview of the multimodel interaction
author: Nick, shengkait
ms.author: shengkait
ms.date: 04/11/2019
ms.topic: article
keywords: Mixed Reality, Gaze, gaze targeting, interaction, design
---

# Introducing Instinctual Interactions
The philosophy of simple, instinctual interactions is woven throughout the Microsoft Mixed Reality platform, from hardware to software. 

These instinctual interactions utilize all available input technologies, including inside out tracking, hand tracking, eye tracking, and natural language, in seamless multimodal interaction models.  Based on our research, designing and developing multimodally, and not based on single inputs, is critical to creating instinctive experiences. 

The Instinctual Interaction models also naturally align across device types.  For example, far interaction on a Windows Immersive headset with a 6DOF controlller and far interaction on a HoloLens 2 use the same affordances, patterns, and behaviors.  Not only is this convenient for developers and designers, but it feels natural to end users. 

We've structures our guidance to reflect this philosophy: that the most instinctual interaction models are multimodal, and that interaction is consistent across device types and whether users are using controllers or not.

## Multimodal Interaction Models
Based on our research and work with customers to date, we've discovered three primary interaction models that suit the majority of Mixed Reality experiences.  

Think of these interaction models as the user's mental model for completing their flows. 

<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <tr>
        <td><strong>Hands and Tools</strong></td>
        <td><strong>Hands-Free</strong></td>
        <td><strong>Gaze and Commit</strong></td>
    </tr> 
</table>

Each of these interaction models is convenient, powerful, and usable in its own right, and each is optimized for a set of customer needs. Check out the chart below for some examples of scenarios and benefits of each interaction model.  

<table>
    <colgroup>
    <col width="10%" />
    <col width="30%" />
    <col width="30%" />
    <col width="30%" />
    </colgroup>
    <tr>
        <td><strong>IM</strong></td>
        <td><strong>Hands and Tools</strong></td>
        <td><strong>Hands-Free</strong></td>
        <td><strong>Gaze and Commit</strong></td>
    </tr>
    <tr>
        <td>Example Scenarios</td>
        <td>* 3D Spatial experiences<br>e.g. spatial layout and design, content manipulation, or simulation</td>
        <td>* Contextual experiences where a user's hands are occupied<br>e.g. on the-job learning, maintenance</td>
        <td>* Click-through experiences<br> e.g. 3d presentations, demos</td>
    </tr>
    <tr>
        <td>Fit</td>
        <td>* Great for new users<br>* Low learning curve<br>* Grounded in easy visual affordances<br>* Consistent UX across hand tracking and 6dof controllers<br>* Great when coupled with voice, ET, or head gaze</td>
        <td>* Some learning required<br>* If hands are unavailable<br>* pairs well with voice and natural language</td>
        <td>* Requires training on HMDs but not on Mobile<br>* Best for accessible controllers<br>* Best for HL1</td>
    </tr>
    <tr>
        <td>HW</td>
        <td>HoloLens 2 Windows Immersive w/ 6DOF Controllers</td>
        <td>HL2<br>HL1<br> Windows Immersive</td>
        <td>HL2<br> HL1<br> Windows Immersive<br> Mobile AR</td>
    </tr>
</table>

Detailed information for using all available inputs seamlessly together in each interaction model is on the pages that follow, as well as illustrations and links to sample content from our Unity MRTK.

## Choosing an Interaction Model for Your Customer

Most likely, developers and creators also already have some ideas in mind of the kinds of interaction experience they want their users to have. 

Even so, to encourage a customer-focused approach to design, we recommend a look at the guidance outlined in the next article, Choosing Interaction for Your Customer (<----- this should be a link)

This article outlines some of the tips and tricks we've learned to keep users confident in different scenarios. 

> [!Note]
> check out the Customer-Focused Creative Process section for suggestions on identifying your customer and creating a great Mixed Reality concept. [coming soon].


## Transition Interaction Models
There are also cases where customer or use cases require that your experience work with more than one interaction model – for example, if the core interaction model is Hands and Tools, but a special Hands-Free mode is required for field technicians.  

If your experience does require multiple interaction models, we've found that many end users may encounter difficulty transitioning from one model to another -- especially end users who are new to MR. 

To help guide designers and developers through choices that can be difficult in MR, we've also included guidance on using multiple interaction models in the Transitioning Interaction Models article below. 

Areas of special attention - like Transitioning interaction Models - will be called out with the following:
<table>
    <colgroup>
    <col width="10%" />
    <col width="90%" />
    </colgroup>
    <tr>
        <td><strong>IM</strong></td>
        <td><strong>Utilizing multiple interaction models in a single application can create difficulties for end users.  Please check out our guidance in the article Transitioning Interaction Models [link]</strong></td>  
    </tr>
 </table>
 
## Next Section: Visual Design Language
Click the link below or follow the page navigation to continue to the next section on Visual Design Language.


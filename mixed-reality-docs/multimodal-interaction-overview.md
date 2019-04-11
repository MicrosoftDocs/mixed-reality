---
title: Multimodal Interaction Overview
description: Overview of the multimodel interaction
author: Nick, shengkait
ms.author: shengkait
ms.date: 04/11/2019
ms.topic: article
keywords: Mixed Reality, Gaze, gaze targeting, interaction, design
---

# Multimodal Interaction Overview
The philosophy of simple, instinctual interactions is woven throughout the Microsoft Mixed Reality platform, from hardware to software. 

These instinctual interactions bring all major input technologies, including inside out tracking, spatial mapping, hand tracking, eye tracking, and natural language together into seamless multimodal interaction models.  Based on our research, designing and developing multimodally, instead of based on specific inputs, is critical to instinctive experiences. 

Moreover, interaction across MSMR products is naturally aligned across device types.  For example, far interaction with 6DOF controllers on Windows Immersive headsets is compatible with far interaction using your hands on HL2.  Not only is this convenient for developers and designers, but it feels natural to end users. 

We've structures our guidance to reflect this philosophy: that the most instinctual interaction models are multimodal, and that interaction is consistent across device types and whether users are using controllers or not.

## Interaction Models
When designing for MR, we urge developers and creators to focus on outcomes that address key customer needs, whether that means improving a customer's flow, reducing pinch points they may encounter, or creating a compelling experience for an audience.  A critical part of that process is gathering, understanding, and incorporating feedback from end users, customers, and developers into our design process.

Based on our research and work with customers to date, we've discovered three primary interaction models that suit the majority of Mixed Reality experiences.  Think of these interaction models as the user's mental model for completing their flows. 

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

Each of these interaction models is convenient, powerful, and usable in its own right, and each is optimized for a set of customer needs. 

We recommend following the guidance in the Creative Process section (LINK) to understand your customer and scenario and then selecting one interaction model for your experience. 

However, there are cases where more than one interaction model are required.  For that case, we recommend following the guidance in the article Transitioning Interaction Models, below.

We've included articles on each interaction model below, as well as as well as sample code and sample components in our MRTK, which are linked in the article. 

<table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <tr>
        <td><strong>IM</strong></td>
        <td><strong>Hands and Tools</strong></td>
        <td><strong>Hands-Free</strong></td>
        <td><strong>Gaze and Commit</strong></td>
    </tr>
    <tr>
        <td><strong>Fit</strong></td>
        <td><strong></strong></td>
        <td><strong></strong></td>
        <td><strong></strong></td>
    </tr>
    <tr>
        <td><strong>Scenario</strong></td>
        <td><strong></strong></td>
        <td><strong></strong></td>
        <td><strong></strong></td>
    </tr>
</table>


Most likely, developers and creators also already have some ideas in mind of the kinds of interaction experience they want their users to have. Even so, to encourage a customer-focused approach to design, we recommend going through the process of selecting your interaction model outlined in the next article, Interaction for Your Customer.

If your experience does require multiple interaction models, we've found that many end users may encounter difficulty transitioning from one model to another -- especially end users who are new to MR.  To help guide designers and developers through choices that can be difficult in MR, we've also included guidance on using multiple interaction models in the Transitioning Interaction Models article below. 

Areas of special attention will be called out with the following:

## Input Techniques
To design and develop multimodally, it is important to understand the capabilities of each input.
<table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <tr>
        <td><strong>Hands Tracking</strong></td>
        <td><strong>Head Gaze</strong></td>
        <td><strong>Eye Tracking</strong></td>
        <td><strong>Voice and Natural Language</strong></td>
    </tr>
    <tr>
        <td><strong>6 DOF Controllers</strong></td>
        <td><strong>3 DOF Controllers</strong></td>
        <td><strong>Clicker</strong></td>
    </tr>
    <tr>
        <td><strong>Spatial Mapping</strong></td>
        <td><strong>Spatial Anchor</strong></td>
        <td><strong>Object Tracking</strong></td>
    </tr>
</table>

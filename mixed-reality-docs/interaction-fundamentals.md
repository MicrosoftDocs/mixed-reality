---
title: Multimodal interaction overview
description: Overview of the multimodal interaction
author: shengkait
ms.author: shengkait
ms.date: 04/11/2019
ms.topic: article
keywords: Mixed Reality, gaze, gaze targeting, interaction, design
---

# Introducing instinctual interactions
The philosophy of simple, instinctual interactions is woven throughout the Microsoft Mixed Reality platform.  We've taken three steps to ensure that application designers and developers can provide easy and intuitive interactions for their customers. 

First, we've made sure our amazing sensors and input technology, including hand tracking, eye tracking, and natural language, combine into seamless multimodal interaction models.  Based on our research, designing and developing multimodally -- and not based on single inputs -- is the key to creating instinctual experiences.

Secondly, we recognize that many developers target multiple devices, whether that means HL2 and HL1 or HoloLens and VR.  So we've designed our interaction models to work across devices (even if the input technology varies on each device).  For example, far interaction on a Windows Immersive headset with a 6DOF controller and far interaction on a HoloLens 2 both use the identical affordances and patterns, making it easy for cross-device applications. Not only is this convenient for developers and designers, but it feels natural to end users. 

Lastly, while we recognize that there are thousands of effective, engaging, and magical interactions possible in MR, we have found that intentionally employing a single interaction model end to end in an application is the best way to ensure users are successful and have a great experience.  To that end, we've included three things in this interaction guidance:
* We've structured this guidance around the three primary interaction models and the components and patterns required for each
* We've included supplemental guidance on other benefits that our platform provides
* We've included guidance to help select the appropriate interaction model for your scenario

We hope this guidance is helpful and we welcome your feedback on how to improve in the future.  Please contact [LINK] with any thoughts and suggestions. 

## Three multimodal interaction models
Based on our research and work with customers to date, we've discovered that three primary interaction models suit the majority of Mixed Reality experiences.

In many ways, the interaction model  is the user's mental model for completing their flows.  Each of these interaction models is optimized for a set of customer needs, and each is convenient, powerful, and usable in its own right. 

The chart below is a simplified overview.  Detailed information for using each interaction model is linked in the pages below with images and code samples.  

<br>

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

The best way to ensure there are no gaps or holes in the interaction for your experience is to follow the guidance for a single model from beginning to end. 

To speed design and development, we've included detailed information and links to images and code samples within our coverage of each model.

But first, the sections below walk through the steps of selecting and implementing one of these interaction models.  
 
By the end of this page, you will understand our guidance on:
 
* Choosing an interaction model for your customer
* Using the interaction model guidance
* Transitioning between interaction models
* Design Next steps

## Choosing an interaction model for your customer

Most likely, developers and creators also already have some ideas in mind of the kinds of interaction experience they want their users to have.

> [!Note]
> For additional guidance on identifying your customer and understanding their needs, please see the [Customer-Focused Creative Process](coming-soon.md) section and then return to this section to continue design.

To encourage a customer-focused approach to design, we recommend following the guidance below to select the interaction model that's optimized for your customer.

Why follow this guidance?

* Our interaction models are tested for objective and subjective criteria such as physical and cognitive effort, intuitiveness, and learnability. 
* Because interaction differs, visual and audio affordances and object behavior may also differ between the interaction models.  
* Combining parts of multiple interaction models together creates the risk of competing affordances, such as simultaneous hand rays and a gaze cursor, which overwhelm and confuse users.

Here are some examples of how affordances and behaviors are optimized for each interaction model.  We often see new users as similar questions, such as "how do I know the system is working, how do I know what I can do, and how do I know if it understood what I just did?"

<br><br>

<table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <tr>
        <td><strong>Model</strong></td>
        <td><strong>Is it working?</strong></td>
        <td><strong>What can I do?</strong></td>
        <td><strong>What did I do?</strong></td>
    </tr>
    <tr>
        <td><a href="hands-and-tools.md">Hands and tools</a></td>
        <td>Hand mesh<br>Hand and controller rays</td>
        <td>Grabbable handles and a bounding box appear when your hands or rays are nearby</td>
        <td>Audible clicks and tones upon grab and release</td>
    </tr>
    <tr>
        <td>Gaze and commit</a></td>
        <td>Gaze cursor has a ready and hover state</a></td>
        <td>Gaze cursor has a ready and hover state</a></td>
        <td>Visible and audible response to the action</a></td>
    </tr>	
    <tr>
        <td>Gaze and dwell</a></td>
        <td>Gaze cursor has a ready and hover state</a></td>
        <td>Progress indicator as the user dwells on an interactable</a></td>
        <td>Visible and audible response to the action</a></td>
    </tr>
    <tr>
        <td>Voice commanding</a></td>
        <td>'Listening' indicator<br>Captions to show you what we heard</a></td>
        <td>Voice prompts<br>Hints<br>"What can I say?"</a></td>
        <td>Visible and audible response to the action<br>Disambiguation when necessary</a></td>
    </tr>
</table>

Below are the questions that we've found help teams select an interaction model:
 
1.	Q:  Do my users want to touch holograms and perform precision holographic manipulations?
A:  If so, check out the Hands and Tools interaction model for precision targeting and manipulation with hands or motion controllers.
 
2.	Q:  Do my users need to keep their hands free, for real-world tasks?
A:  If so, take a look at the Hands-Free interaction model, which provides a great hands-free experience through gaze- and voice-based interactions.
 
3.	Q:  Do my users have time to learn interactions for my mixed reality application, or do they need the interactions with the lowest learning curve possible?
A:  We recommend the Hands and Tools model for the lowest learning curve and most intuitive interactions, as long as users are able to use their hands for interaction.
 
4.	Q:  Do my users use motion controllers for pointing and manipulation ?
A:  The Hands and Tools model includes all guidance for a great experience with motion controllers.
 
5.	Q:  Do my users use an accessibility controller or a common Bluetooth controller, such as a clicker?
A:  We recommend the Gaze and Commit model for all non-tracked controllers.  It's designed to allow a user to traverse an entire experience with a simple "target and commit" mechanic. 
 
6.	Q: Do my users only progress through an experience by "clicking through" (for example in a 3d slideshow-like environment), as opposed to navigating dense layouts of UI controls?
A:  If users do not need to control a lot of UI, Gaze and Commit offers a learnable option where users do not have to worry about targeting. 
 
7.	Q:  Do my users use both HoloLens 1 and HoloLens 2/ Windows Immersive (VR headsets)
A:  Since Gaze and Commit is the interaction model for HoloLens Gen 1, we recommend that creators who support HoloLens Gen 1 use Gaze and Commit for any features or modes that users may experience on a HoloLens Gen 1 headset.  Please also see the next section on [LINK] Transitioning Interaction Models for details on making a great experience for multiple HoloLens generations.
 
7.	Q: What about for users who are generally mobile (covering a large space or moving between spaces), versus users who tend to work in a single space?  
A:  Any of the interaction models will work for these users.  Please see the [LINK] App Design Guidance section for more information on our recommended tag-along behaviors for UI that follows users as they move.


## Transition interaction models
There are also use cases which require that your experience works with more than one interaction model – for example, your core interaction model may be _hands and tools_, but you also need to support a special _hands-free mode_ for field technicians.  

If your experience does require multiple interaction models, we've found that many end users may find it difficult to transition from one model to another -- especially end users who are new to mixed reality. 

To help guide designers and developers through choices that can be difficult in mixed reality, we've also included guidance on using multiple interaction models in the [Transitioning interaction models](coming-soon.md) article. 

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

---
title: Multimodal interaction overview
description: Overview of the multimodal interaction
author: shengkait
ms.author: shengkait
ms.date: 04/11/2019
ms.topic: article
ms.localizationpriority: high
keywords: Mixed Reality, Gaze, gaze targeting, interaction, design, hololens, MMR, multimodal 
---

# Introducing instinctual interactions

The philosophy of simple, instinctual interactions is woven throughout the Microsoft Mixed Reality (MMR) platform, from hardware to software.

These instinctual interactions utilize all available input technologies, including inside-out tracking, hand tracking, eye tracking, and natural language, in seamless multimodal interaction models. Based on our research, designing and developing multimodals, and not based on single inputs, is critical when creating instinctive experiences.

The Instinctual Interaction models also naturally align across device types.  For example, far interaction on an immersive headset with a 6 degrees of freedom (DoF) controller and far interaction on a HoloLens 2 use the same affordances, patterns, and behaviors.  Not only is this convenient for developers and designers, but it feels natural to end users.


Lastly, while we recognize that there are thousands of effective, engaging, and magical interactions possible in MR, we have found that intentionally employing a single interaction model end to end in an application is the best way to ensure users are successful and have a great experience.  To that end, we've included three things in this interaction guidance:
* We've structured this guidance around the three primary interaction models and the components and patterns required for each
* We've included supplemental guidance on other benefits that our platform provides
* We've included guidance to help select the appropriate interaction model for your scenario

## Multimodal interaction models

Based on our research and work with customers to date, we've discovered three primary interaction models that suit the majority of Mixed Reality experiences.  

Think of these interaction models as the user's mental model for completing their flows.

Each of these interaction models is convenient, powerful, and usable in its own right, and all are optimized for a set of customer needs. View the chart below, for scenarios, examples, and benefits of each interaction model.  

**Model** | **[Hands and motion controllers](hands-and-tools.md)** | **[Hands free](hands-free.md)** | **[Head-gaze and commit](gaze-and-commit.md)**
|--------- | --------------| ------------| ---------|
**Example Scenarios** | 3D spatial experiences, e.g. spatial layout and design, content manipulation, or simulation | Contextual experiences where a user's hands are occupied, e.g. on the-job learning, maintenance| Click-through experiences, e.g. 3D presentations, demos
**Fit** | Great for new users, coupled wit voice, eye tracking or head gaze. Low learning curve. Consistent UX across hand tracking and 6 DoF controllers. | Some learning required. If hands are unavailable pairs well with voice and natural language | Requires training on HMDs but not on mobile. Best for accessible controllers. Best for HoloLens (1st gen). |
**Hardware** | HoloLens 2 <br>Immersive headsets | HoloLens 2 <br>HoloLens (1st gen) <br>Immersive headsets | HoloLens 2 <br>Immersive headsets | HoloLens 2 <br>HoloLens (1st gen) <br>Immersive headsets <br>Mobile AR |

Detailed information for using all available inputs seamlessly together in each interaction model is on the pages that follow, as well as illustrations and links to sample content from our Unity MRTK.


## Choose an interaction model for your customer


Most likely, developers and creators also already have some ideas in mind of the kinds of interaction experience they want their users to have.
To encourage a customer-focused approach to design, we recommend following the guidance below to select the interaction model that's optimized for your customer.

### Why follow this guidance?

* Our interaction models are tested for objective and subjective criteria such as physical and cognitive effort, intuitiveness, and learnability. 
* Because interaction differs, visual and audio affordances and object behavior may also differ between the interaction models.  
* Combining parts of multiple interaction models together creates the risk of competing affordances, such as simultaneous hand rays and a head-gaze cursor, which overwhelm and confuse users.

Here are some examples of how affordances and behaviors are optimized for each interaction model.  We often see new users as similar questions, such as "how do I know the system is working, how do I know what I can do, and how do I know if it understood what I just did?"

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
        <td><strong>How do I know it's working?</strong></td>
        <td><strong>How do I know what I can do?</strong></td>
        <td><strong>How do I know what I just did?</strong></td>
    </tr>
    <tr>
        <td><a href="hands-and-tools.md">Hands and motion controllers</a></td>
        <td>I see a hand mesh, I see a fingertip affordance or hand/ controller rays.</td>
        <td>I see grabbable handles or a bounding box appear when my hand is near.</td>
        <td>I hear audible tones and see animations on grab and release.</td>
    </tr>
    <tr>
        <td><a href="gaze-and-commit.md">Head-gaze and commit</a></td>
        <td>I see a cursor in the center of my field of view.</td>
        <td>The head-gaze cursor changes state when over certain objects.</td>
        <td>I see/ hear visual and audible confirmations when I take action.</td>
    </tr>	
    <tr>
        <td><a href="hands-free.md">Hands-free (Head-gaze and dwell)</a></td>
        <td>I see a cursor in the center of my field of view.</td>
        <td>I see a progress indicator when I dwell on an interactable object.</td>
        <td>I see/ hear visual and audible confirmations when I take action.</td>
    </tr>
    <tr>
        <td><a href="hands-free.md">Hands-free (Voice commanding)</a></td>
        <td>I see a listening indicator and captions that show what the system heard.</td>
        <td>I get voice prompts and hints.  When I say "what can I say?" I see feedback.</td>
        <td>I see/ hear visual and audible confirmations when I give a command, or get disambiguation UX when needed.</a></td>
    </tr>
</table>

### Below are the questions that we've found help teams select an interaction model:
 
1.	Q:  Do my users want to touch holograms and perform precision holographic manipulations?<br><br>
A:  If so, check out the Hands and tools interaction model for precision targeting and manipulation with hands or motion controllers.
 
2.	Q:  Do my users need to keep their hands free, for real-world tasks?<br><br>
A:  If so, take a look at the Hands-free interaction model, which provides a great hands-free experience through gaze- and voice-based interactions.
 
3.	Q:  Do my users have time to learn interactions for my mixed reality application, or do they need the interactions with the lowest learning curve possible?<br><br>
A:  We recommend the Hands and Tools model for the lowest learning curve and most intuitive interactions, as long as users are able to use their hands for interaction.
 
4.	Q:  Do my users use motion controllers for pointing and manipulation?<br><br>
A:  The Hands and tools model includes all guidance for a great experience with motion controllers.
 
5.	Q:  Do my users use an accessibility controller or a common Bluetooth controller, such as a clicker?<br><br>
A:  We recommend the Head-gaze and Commit model for all non-tracked controllers.  It's designed to allow a user to traverse an entire experience with a simple "target and commit" mechanic. 
 
6.	Q: Do my users only progress through an experience by "clicking through" (for example in a 3d slideshow-like environment), as opposed to navigating dense layouts of UI controls?<br><br>
A:  If users do not need to control a lot of UI, Head-gaze and commit offers a learnable option where users do not have to worry about targeting. 
 
7.	Q:  Do my users use both HoloLens (1st gen) and HoloLens 2/ Windows Immersive (VR headsets)<br><br>
A:  Since Head-gaze and commit is the interaction model for HoloLens (1st gen), we recommend that creators who support HoloLens (1st gen) use Head-gaze and commit for any features or modes that users may experience on a HoloLens (1st gen) headset.  Please see the next section below on *Transitioning interaction models* for details on making a great experience for multiple HoloLens generations.
 
8.	Q: What about for users who are generally mobile (covering a large space or moving between spaces), versus users who tend to work in a single space?<br><br>
A:  Any of the interaction models will work for these users.  

> [!NOTE]
> More guidance specific to app design [coming soon](index.md#news-and-notes).


## Transition interaction models
There are also cases where your use cases may require that utilizing more than one interaction model.  For example, your app's "creation flow" utilizes the Hands and tools interaction model, but you want to employ a Hands-free mode for field technicians.  

If your experience does require multiple interaction models, we've found that many end users may encounter difficulty transitioning from one model to another -- especially end users who are new to MR.

> [!Note]
> To help guide designers and developers through choices that can be difficult in MR, we're working on more guidance for using multiple interaction models.
 

## See also
* [Head-gaze and commit](gaze-and-commit.md)
* [Head-gaze and dwell](gaze-and-dwell.md)
* [Direct manipulation with hands](direct-manipulation.md)
* [Point and commit with hands](point-and-commit.md)
* [Gestures](gestures.md)
* [Voice commanding](voice-design.md)
* [Motion controllers](motion-controllers.md)
* [Spatial sound design](spatial-sound-design.md)
* [Spatial mapping design](spatial-mapping-design.md)
* [Comfort](comfort.md)


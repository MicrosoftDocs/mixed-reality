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

The philosophy of simple, instinctual interactions is interwoven throughout the Mixed Reality platform.  We've taken three steps to ensure that application designers and developers can provide their customers with easy and intuitive interactions. 

First, we've made sure our sensors and input technologies (which includes hand and eye tracking along with natural language input) combine into seamless, multimodal interaction models.  Based on our research, designing and developing within a multimodal framework, and not based on single inputs, is the key to creating instinctual experiences.

Second, we recognize that many developers target multiple HoloLens devices, such as HoloLens 2 and HoloLens (1st gen) or HoloLens and VR.  So we've designed our interaction models to work across devices, even if the input technology varies on each device.  For example, far interaction on a Windows Immersive headset with a 6DOF controller and far interaction on a HoloLens 2 both use  identical affordances and patterns, making it easy for cross-device application development that provides a natural feel to end-user interactions. 

While we recognize that there are thousands of effective, engaging, and magical interactions possible in mixed reality (MR), we've found that intentionally employing a single interaction model, end-to-end, in an application is the best way to ensure users are successful and have a great experience. To that end, we've included three things in this interaction guidance:
* This guidance is structured around the three primary interaction models and the components and patterns required for each.
* Supplemental guidance has been included about other benefits that our platform provides.
* Guidance has also been included to help select the appropriate interaction model for your development scenario.

## Multimodal interaction models

Based on our research as well as feedback from customers, we've discovered that three primary interaction models suit the majority of mixed reality experiences.

In many ways, the interaction model is the user's mental model for completing their flows. Each of these interaction models is optimized for a set of customer needs. Each is convenient, powerful, and usable in its own right. 

The chart below is a simplified overview. Detailed information for using each interaction model is linked in the pages below with images and code samples. 

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
        <td><a href="hands-and-tools.md">Hands and motion controllers</a></td>
        <td>3D spatial experiences, such as spatial layout and design, content manipulation, or simulation.</td>
        <td>Great for new users coupled with voice, eye tracking or head gaze. Low learning curve. Consistent UX across hand tracking and six DoF controllers.</td>
        <td>HoloLens 2<br>Immersive headsets</td>
    </tr>
    <tr>
        <td><a href="hands-free.md">Hands-free</a></td>
        <td>Contextual experiences where a user's hands are occupied, such as on-the-job learning, and maintenance.</td>
        <td>Some learning required. If hands are unavailable, the device pairs well with voice and natural language.</td>
        <td>HoloLens 2<br>HoloLens (1st gen)<br>Immersive headsets</td>
    </tr>
    <tr>
        <td><a href="gaze-and-commit.md">Head-gaze and commit</a></td>
        <td>Click-through experiences, e.g. 3D presentations, demos.</td>
        <td>Requires training on HMDs but not on mobile. Best for accessible controllers. Best for HoloLens (1st gen).</td>
        <td>HoloLens 2<br>HoloLens (1st gen)<br>Immersive headsets<br>Mobile AR</td>
    </tr>
</table>
<br>

To ensure that there are no gaps or holes in the user interaction experience, it is best to follow the guidance for a single model from beginning to end. 

To speed up design and development, we've included detailed information and links to images and code samples within our coverage of each model.

The sections below walk through the steps for selecting and implementing one of these interaction models.  
 
### By the end of this page, you will understand our guidance on:
 
* Choosing an interaction model for your customer
* Using the interaction model guidance
* Transitioning between interaction models
* Design next steps


## Choose an interaction model for your customer


Typically, developers and creators have thought through the types of interactions that their customers can have. To encourage a customer-focused approach to design, we recommend the following guidance for selecting the interaction model that's optimized for your customer.

### Why follow this guidance?

* Our interaction models are tested for objective and subjective criteria, such as physical and cognitive effort, intuitiveness, and learnability. 
* Because interactions differ, visual and audio affordances and object behavior might differ between interaction models.  
* Combining parts of multiple interaction models creates the risk of competing affordances, such as simultaneous hand rays and a head-gaze cursor that can overwhelm and confuse users.

Here are some examples of how affordances and behaviors are optimized for each interaction model.  We often see new users have similar questions, such as "how do I know the system is working, how do I know what I can do, and how do I know if it understood what I just did?"

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
        <td>I see a hand mesh, I see a fingertip affordance or hand/controller rays.</td>
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
        <td>I see/hear visual and audible confirmations when I take action.</td>
    </tr>
    <tr>
        <td><a href="hands-free.md">Hands-free (Voice commanding)</a></td>
        <td>I see a listening indicator and captions that show what the system heard.</td>
        <td>I get voice prompts and hints. When I say: "what can I say?" I see feedback.</td>
        <td>I see/ hear visual and audible confirmations when I give a command, or get disambiguation UX when needed.</a></td>
    </tr>
</table>

### Below are the questions that we've found help teams select an interaction model:
 
1.	Q:  Do my users want to touch holograms and perform precision holographic manipulations?<br><br>
A:  If so, check out the Hands and Tools interaction model for precision targeting and manipulation with hands or motion controllers.
 
2.	Q:  Do my users need to keep their hands free for real-world tasks?<br><br>
A:  If so, take a look at the Hands-Free interaction model, which provides a great hands-free experience through gaze and voice-based interactions.
 
3.	Q:  Do my users have time to learn interactions for my MR application or do they need the interactions with the lowest learning curve possible?<br><br>
A:  We recommend the Hands and Tools model for the lowest learning curve and most intuitive interactions, as long as users are able to use their hands for interaction.
 
4.	Q:  Do my users use motion controllers for pointing and manipulation?<br><br>
A:  The Hands and Tools model includes all guidance for a great experience with motion controllers.
 
5.	Q:  Do my users use an accessibility controller or a common Bluetooth controller, such as a clicker?<br><br>
A:  We recommend the Head-Gaze and Commit model for all non-tracked controllers. It's designed to allow a user to traverse an entire experience with a simple "target and commit" mechanism. 
 
6.	Q: Do my users only progress through an experience by "clicking through" (for example in a 3D slideshow-like environment), as opposed to navigating dense layouts of UI controls?<br><br>
A:  If users do not need to control a lot of UI, Head-Gaze and Commit offers a learnable option where users do not have to worry about targeting. 
 
7.	Q:  Do my users use both HoloLens (1st Gen) and HoloLens 2/ Windows Immersive (VR headsets)<br><br>
A:  Since Head-Gaze and Commit is the interaction model for HoloLens (1st gen), we recommend that creators who support HoloLens (1st gen) use Head-Gaze and Commit for any features or modes that users will experience on a HoloLens (1st gen) headset. Please see the next section below on *Transitioning interaction models* for details on making a great experience for multiple HoloLens generations.
 
8.	Q: What about users who are generally mobile, covering a large space or moving between spaces, versus users who tend to work in a single space?<br><br>
A:  Any of the interaction models will work for these users.  

> [!NOTE]
> More guidance specific to app design [coming soon](index.md#news-and-notes).


## Transition interaction models
There are also use cases that might require  utilizing more than one interaction model. For example, your application's creation flow utilizes the Hands and Motion Controllers Interaction model, but you want to employ a hands-free mode for field technicians.  

If your experience does require multiple interaction models, keep in mind that many end users mith encounter difficulty when transitioning from one model to another--especially for users who are new to mixed reality.

> [!Note]
> We're constantly working on more guidance that will be available to developers and designers, informing them about the how, when, and why for using multiple MR interaction models.
 

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


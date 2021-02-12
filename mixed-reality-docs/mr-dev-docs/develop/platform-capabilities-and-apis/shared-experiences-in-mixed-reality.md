---
title: Shared experiences in mixed reality
description: Holographic apps may share spatial anchors from one HoloLens to another, enabling users to render a hologram at the same place in the real world, across multiple devices.
author: thetuvix
ms.author: grbury
ms.date: 02/10/2019
ms.topic: article
keywords: shared experience, mixed reality, hologram, spatial anchor, multi-user, multi
---

# Shared experiences in mixed reality

Holograms don't need to stay private to just one user. Holographic apps may share [spatial anchors](../../design/spatial-anchors.md) from one HoloLens, iOS, or Android device to another, enabling users to render a hologram at the same place in the real world across multiple devices.

## Six questions to define shared scenarios

Before you begin designing for shared experiences, it’s important to define the target scenarios. These scenarios help clarify what you’re designing and establish a common vocabulary to help compare and contrast features required in your experience. Understanding the core problem, and the different avenues for solutions, is key to uncovering opportunities inherent in this new medium.

Through internal prototypes and explorations from our HoloLens partner agencies, we created six questions to help you define shared scenarios. These questions form a framework, not intended to be exhaustive, to help distill the important attributes of your scenarios.

### 1. How are they sharing?

A presentation might be led by a single virtual user, while multiple users can collaborate, or a teacher might provide guidance to virtual students working with virtual materials—the complexity of the experiences increases based on the level of agency a user has or can have in a scenario.

![Man and women with holograph on table](images/man-and-women-with-holograph-on-table-500px.png)

There are many ways to share, but we’ve found that most of them fall into three categories:

* **Presentation**: When the same content is being shown to several users. For example: A professor is giving out a lecture to several students using the same holographic material being presented to everyone. The professor, however, could have his/her own hints and notes that may not be visible to others.
* **Collaboration**: When people are working together to achieve some common goals. For example: The professor gave out a project to learn about doing a heart surgery. Students pair up and create a shared skills lab experience, which allows medical students to collaborate on the heart model and learn.
* **Guidance**: When one person is helping someone to solve a problem in a more one-to-one style interaction. For example: The professor giving guidance to a student when he/she is doing the heart surgery skills lab in the shared experience.

### 2. What is the group size?

**One-to-one** sharing experiences can provide a strong baseline and ideally your proofs of concept can be created at this level. But be aware that sharing with large groups (beyond six people) can lead to difficulties both technical (data and networking) and social (the impact of being in a room with [several avatars](https://vimeo.com/160704056)). Complexity increases exponentially as you go from **small** to **large groups**.

We have found that the needs of groups can fall into three size categories:
* 1:1
* Small < 7
* Large >= 7

Group size makes for an important question because it influences:

* Representations of people in holographic space
* Scale of objects
* Scale of environment

### 3. Where is everyone?

The strength of mixed reality comes into play when a shared experience can take place in the same location. We call that **colocated**. Conversely, when the group is distributed and at least one participant isn't in the same physical space (as is often the case with VR) we call that a **remote experience**. Often, it’s the case that your group has **both** colocated and remote participants (for example, two groups in conference rooms).

![Three people with holograph on table](images/three-people-with-holograph-on-table-500px.png)

Following categories help convey where users are located:

* **Colocated**: All your users will be in the same physical space.
* **Remote**: All your users will be in separate physical spaces.
* **Both**: Your users will be a mix of colocated and remote spaces.

This question is crucial because it influences:

* How people communicate?
    * For example: Whether they should have avatars?
* What objects they see. Are all objects shared?
* Whether we need to adapt to their environment?

### 4. When are they sharing?

We typically think of **synchronous** experiences when shared experiences come to mind: We’re all doing it together. But if we include a single, virtual element that was added by someone else, we have an **asynchronous** scenario. Imagine a note, or voice memo, left in a virtual environment. How do you handle 100 virtual memos left on your design? What if they’re from dozens of people with different levels of privacy?

Consider your experiences as one of these categories of time:

* **Synchronously**: Sharing the holographic experience at the same time. For example: Two students doing the skills lab at the same time.
* **Asynchronously**: Sharing the holographic experience at different times. For example: Two students doing the skills lab but working on separate sections at different times.
* **Both**: Your users will sometimes be sharing synchronously but other times asynchronously. For example: A professor grading the assignment done by the students at a later time and leaving notes for students for the next day.

This question is important because it influences:

* Object and environment persistence. For example: Storing the states so they can be retrieved.
* User perspective. For example: Perhaps remembering what the user was looking at when leaving notes.

### 5. How similar are their physical environments?

The likelihood of two identical real-life environments, outside of colocated experiences, is slim unless those environments have been designed to be identical. You’re more likely to have **similar** environments. For example, conference rooms are similar—they typically have a centrally located table surrounded by chairs. Living rooms, on the other hand, are dissimilar** and can include any number of pieces of furniture in an infinite array of layouts.

![Holograph on table](images/holograph-on-table-500px.png)

Consider your sharing experiences fitting into one of these two categories:

* **Similar**: Environments that tend to have similar furniture, ambient light and sound, physical room size. For example: Professor is in lecture hall A and students are in lecture hall B. Lecture hall A might have fewer chairs than B but they both may have a physical desk to place holograms on.
* **Dissimilar**: Environments that are different in furniture settings, room sizes, light, and sound considerations. For example: A professor is in a focus room, but students are in a large lecture hall, filled with students and teachers.

It's important to [think about the environment](/hololens/hololens-environment-considerations), as it will influence:

* How people will experience these objects. For example: If your experience works best on a table and the user has no table? Or on a flat floor surface but the user has a cluttered space.
* Scale of the objects. For example: Placing a six feet human model on a table could be challenging but a heart model would work great.

### 6. What devices are they using?

Today you’re often likely to see shared experiences between two [**immersive devices**](../../discover/immersive-headset-hardware-details.md) (those devices might differ slightly For buttons and relative capability, but not greatly) or two **holographic devices** given the solutions being targeted at these devices. But consider if **2D devices** (a mobile/desktop participant or observer) will be a necessary consideration, especially in situations of **mixed 2D and 3D devices**. Understanding the types of devices your participants will be using is important, not only because they come with different fidelity and data constraints and opportunities, but because users have unique expectations for each platform.

## Exploring the potential of shared experiences

Answers to the questions above can be combined to better understand your shared scenario, crystallizing the challenges as you expand the experience. For the team at Microsoft, this helped establish a road map for improving the experiences we use today, understanding the nuance of these complex problems and how to take advantage of shared experiences in mixed reality.

For example, consider one of Skype’s scenarios from the HoloLens launch: a user worked through [how to fix a broken light switch](https://www.youtube.com/watch?v=iBfzs3G8BEA) with help from a remotely located expert.

![Fixing a light switch with assistance via Skype for HoloLens](images/fix-a-broken-switch-with-hololens-640px.jpg)

*An expert provides **1:1** guidance from his **2D**, desktop computer to a user of a **3D, mixed-reality** device. The **guidance** is **synchronous** and the physical environments are **dissimilar**.*

An experience like this is a step-change from our current experience—applying the paradigm of video and voice to a new medium. But as we look to the future, we must better define the opportunity of our scenarios and build experiences that reflect the strength of mixed reality.

Consider the [OnSight collaboration tool](https://www.youtube.com/watch?v=XtUyUJAVQ6w), developed by NASA’s Jet Propulsion Laboratory. Scientists working on data from the Mars rover missions can collaborate with colleagues in real time within the data from the Martian landscape.

![Collaborating between colleagues separated remotely to plan work for the Mars Rover](images/onsight-nasa-jpl.gif)

*A scientist explores an environment using a **3D, mixed-reality** device with a **small** group of **remote** colleagues using **3D and 2D** devices. The **collaboration** is **synchronous** (but can be revisited asynchronously) and the physical environments are (virtually) **similar**.*

Experiences like OnSight present new opportunities to collaborate. From physically pointing out elements in the virtual environment to standing next to a colleague and sharing their perspective as they explain their findings. OnSight uses the lens of immersion and presence to rethink sharing experiences in mixed reality.

Intuitive collaboration is the bedrock of conversation, working together and understanding how we can apply this intuition to the complexity of mixed reality is crucial. If we can not only recreate sharing experiences in mixed reality but supercharge them, it will be a paradigm shift for the future of work. Designing for shared experiences in mixed reality is new and exciting space—and we’re only at the beginning.

## Get started building shared experiences

Depending on your application and scenario, there will be various requirements to achieve your desired experience. Some of these include:

* **Match-making**: Ability to create sessions, advertise sessions, discover and invite specific people, both locally and remotely to join your session.
* **Anchor sharing**: Ability to align coordinates across multiple devices in a common local space, so holograms appear in the same place for all people.
* **Networking**: Ability to have positions, interactions, and movements of people and holograms synchronized in real time across all participants.
* **State storage**: Ability to store hologram characteristics and locations in space for mid-session join, recall at a later time, and robustness against network issues.

The key to shared experiences is having multiple users seeing the same holograms in the world on their own device, frequently done by sharing anchors to align coordinates across devices.

To share anchors, use the [Azure Spatial Anchors](/azure/spatial-anchors):

* First the user places the hologram.
* App creates a [spatial anchor](../../design/spatial-anchors.md), to pin that hologram precisely in the world.
* The anchors can be shared to HoloLens, iOS, and Android devices via [Azure Spatial Anchors](/azure/spatial-anchors/).

With a shared spatial anchor, the app on each device now has a [common coordinate system](../../design/coordinate-systems.md) in which they can place content. Now the app can ensure to position and orient the hologram at the same location.

On HoloLens devices, you can also share anchors offline from one device to another.  Use the links below to decide what's best for your application.

## Evaluating tech options

There are various service and technology options available to help build multi-user mixed reality experiences.  It can be tricky to choose a path, so taking a scenario-focused perspective, some options are detailed below.

## Shared static holograms (no interactions)

Leverage [Azure Spatial Anchors](/azure/spatial-anchors/) in your app.  Enabling and sharing spatial anchors across devices allows you to create an application where users see holograms in the same place at the same time.  Additional syncing across devices is needed to enable users to interact with holograms and see movements or state updates of holograms.

## Share first person perspective

Leverage built-in Miracast support, for local users when you have a supported Miracast receiver, such as a PC or TV – no additional app code is needed.

Leverage [MixedReality-WebRTC](https://github.com/microsoft/mixedreality-webrtc) in your app, for remote users or when you have non-Miracast devices that you’d like to share to.  Enabling a WebRTC connection enables 1:1 audio/video streams between users, with a data channel for messaging across devices, as well.  The mixed reality implementation optimizes for HoloLens, by providing mixed reality capture video stream of the view of the HoloLens user to others.  If you desire to scale up video streaming to multiple remote clients, an [MCU service provider](https://webrtcglossary.com/mcu/) (Multipoint Conferencing Unit) is typically used, such as [SignalWire](https://signalwire.com/).  A one-click SignalWire deployment to Azure is available via [Freeswitch](https://github.com/andywolk/azure-freeswitch-gpu-windows).

> [!NOTE]
> Please note that SignalWire is a paid service and is not owned/affiliated with Microsoft.

## Presenter-Spectator applications and Demos

Leverage [MixedReality-SpectatorView](https://github.com/microsoft/MixedReality-SpectatorView) to bring [spectator view functionality](spectator-view.md) into your app.  Enable other devices (HL, Android, iOS, and video cameras) to see what the HoloLens sees from a different perspective in the same location, and receive updates on interactions of the host HoloLens user interacting with the holograms.  Watch, take pictures, and record video of what the host does with the holograms in the application from your own spatial perspective with the spectator companion of the same app.

**Note:** Pictures are taken via screenshot on iOS/Android devices.

## Multi-user collaborative experience

Start with our [multi-user learning tutorial](../unity/tutorials/mr-learning-sharing-02.md), which leverages [Azure Spatial Anchors](/azure/spatial-anchors/) for local users and [Photon SDK](https://www.photonengine.com/PUN) for syncing the content/state in the scene. Create locally collaborative applications where each user has his/her own perspective on the holograms in the scene and can each fully interact with the holograms.  Updates are provided across all devices and interaction conflict management is handled by Photon.

> [!NOTE]
> Please note that [Photon](https://www.photonengine.com/) is a non-Microsoft product, so a billing relationship with Photon may be required to productize and scale for higher usage.

## Future work

Component capabilities and interfaces will help in providing common consistency and robust support across the various scenarios and underlying technologies.  Until then, choose the best path that aligns to the scenario you're trying to achieve in your application.

Different scenario or desire to use a different tech/service? Provide feedback as GitHub issues in the corresponding repo, at the bottom of this page, or reach out on [HoloDevelopers slack](https://holodevelopers.slack.com/).

## See also

* [Azure Spatial Anchors](/azure/spatial-anchors)
* [Shared spatial anchors in DirectX](shared-spatial-anchors-in-directx.md)
* [Shared experiences in Unity](../unity/shared-experiences-in-unity.md)
* [Spectator view](spectator-view.md)
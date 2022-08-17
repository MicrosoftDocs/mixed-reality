---
layout: LandingPage
title: Azure mixed reality cloud services overview
description: Learn about all the Azure mixed reality cloud services you can integrate into your Unity or Unreal applications.
author: hferrone
ms.author: v-haferr
ms.date: 12/9/2020
ms.topic: overview
ms.localizationpriority: high
keywords: Mixed Reality, develop, development, HoloLens, cloud services, Azure, remote rendering, spatial anchors, cognitive services, cognition, unity, machine learning, speech translation, computer vision, Microsoft Graph
---

# Azure mixed reality cloud services overview

![ Azure Spatial Anchors image](../design/images/AzureSpatialAnchors.jpg)

Unlock what every human is an expert at—the three-dimensional, physical world around us—with Azure mixed reality services. Help people create, learn, and collaborate more effectively by capturing and surfacing digital information within the context of their work and world. Bring 3D to mobile devices, headsets, and other untethered devices. Using Azure, help ensure that your most sensitive information is protected.

## Mixed Reality services

Mixed Reality cloud services like **Azure Remote Rendering** and **Azure Spatial Anchors** help developers build compelling immersive experiences on a variety of platforms. These services allow you to integrate spatial awareness into your projects when you're making applications for 3D training, predictive equipment maintenance, and design review, all in the context of your users’ environments.

### Azure Remote Rendering

[Azure Remote Rendering](/azure/remote-rendering/), or ARR, is a service that lets you render highly complex 3D models in real time and stream them to a device. ARR is now generally available and can be added to your Unity or Native C++ projects targeting HoloLens 2 or Windows desktop PC.

<br>

> [!VIDEO https://docs.microsoft.com/en-us/shows/Mixed-Reality/Intro-to-Azure-Mixed-Reality-Services-Azure-Remote-Rendering/player]

ARR is an essential component of any Mixed Reality application that runs on an untethered device, as they have less computational rendering power. Take the following side-by-side engine model comparison as an example: the high-fidelity model on the left has over 18 million triangles, while the reduced model on the right has only around 200,000. In scenarios where every detail matters—industrial plant management, design review for assets like truck engines, pre-operative surgery planning, and more—3D visualization brings that detail to life. It's what helps designers, engineers, doctors, and students better understand complex information and make the right call. But this simplification can result in a loss of important detail that's needed in key business and design decisions.

![Example of Azure Remote Rendering in Unity showcase app](images/arr-engine.png)

ARR solves this problem by moving the rendering workload to high-end GPUs in the cloud. A cloud-hosted graphics engine then takes over and renders the image, encodes it as a video stream, and streams the model directly to the target device. 

* For complex models that are too much for one high-end GPU to handle, ARR distributes the workload to multiple GPUs and merges the result into a single image, making the process entirely transparent to the user. 

As an added bonus, ARR doesn't restrict what kind of user interface you can use in your app. At the end of a frame, your locally rendered content is automatically combined with the remote image as seen in the image below:

![Example of Azure Remote Rendering in Unity showcase app](images/showcase-app.png)

### Azure Spatial Anchors

[Azure Spatial Anchors](/azure/spatial-anchors/), or ASA, is a cross-platform service that allows you to build spatially aware mixed reality applications. With Azure Spatial Anchors, you can map, persist, and share holographic content across multiple devices at real-world scale. AOA is now in public preview for you to try out in your apps.

Azure Spatial Anchors is a uniquely tailored solution for common use cases in Mixed Reality, including:
* **Way-finding**: Where two or more spatial anchors could be connected to create a task list or points of interest a user must interact with.
* **Multi-user experiences**: Where users could pass moves back and forth by interacting with objects in the same virtual space.
* **Persisting virtual content in the real-world**: Where users could place virtual objects in the real-world that are viewable from other supported devices.

![Example of Azure Spatial Anchors](images/persistence.gif)

The service can be developed in a host of environments and deployed to a large group of devices and platforms. This gives them special dispensation for their own list of available platforms:
* Unity for HoloLens
* Unity for iOS
* Unity for Android
* Native iOS
* Native Android
* C++/WinRT and DirectX for HoloLens
* Xamarin for iOS
* Xamarin for Android

### Azure Object Anchors

[Azure Object Anchors](/azure/object-anchors/), or AOA, is a mixed reality service that helps you create rich, immersive experiences by automatically aligning 3D content with physical objects. Gain contextual understanding of objects without the need for markers or manual alignment. Save significant touch labor, reduce alignment errors, and improve user experiences by building mixed reality applications with Object Anchors.

Azure Object Anchors are especially tailored to common Mixed Reality use cases, including:
* **Training**: Create Mixed Reality training experiences for your workers, without the need to place markers or spend time manually adjusting hologram alignment.
* **Task Guidance**: Walking employees through a set of tasks can be greatly simplified when using Mixed Reality.
* **Asset Finding**: If you already have a 3D model of some object in your physical space, Azure Object Anchors can enable you to locate and track instances of that object in your physical environment.

![Virtual overlay of azure object anchors on an open car engine](images/aoa-img-01.png)

## Cognitive Services

:::row:::
    :::column:::
       [![Speech](../whats-new/images/speech.jpg)](/azure/cognitive-services/speech-service/)
    :::column-end:::
    :::column span="2":::
        ### [Speech](/azure/cognitive-services/speech-service/)
        Discover how Speech enables the integration of speech processing capabilities into any app or service. Convert spoken language into text or produce natural sounding speech from text using standard (or customizable) voice fonts. Try any service free—and quickly build speech-enabled apps and services with the following capabilities.
    :::column-end:::
:::row-end:::

---

:::row:::
    :::column:::
       [![Vision](../whats-new/images/vision.jpg)](/azure/cognitive-services/computer-vision/)
    :::column-end:::
    :::column span="2":::
        ### [Vision](/azure/cognitive-services/computer-vision/)
        Recognize, identify, caption, index, and moderate your pictures, videos, and digital ink content.Learn how Vision makes it possible for apps and services to accurately identify and analyze content within images, videos, and digital ink.
    :::column-end:::
:::row-end:::


## Standalone Unity services

The standalone services listed below don't apply to Mixed Reality, but can be helpful in a wide range of development contexts. If you're developing in Unity, each of these services can be integrated into your new or existing projects.

### Device support
<table>
    <tr>
        <td><strong>Azure Cloud Service</strong></td>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens 1st Gen</strong></a></td>
        <td><a href="/windows/mixed-reality/enthusiast-guide/immersive-headset-hardware-details"><strong>Immersive headsets</strong></a></td>
    </tr>
     <tr>
        <td><a href="unity/tutorials/mr-azure-301.md">Language translation</a></td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
    <tr>
        <td><a href="unity/tutorials/mr-azure-302.md">Computer vision</a></td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
    <tr>
        <td><a href="unity/tutorials/mr-azure-302b.md">Custom vision</a></td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
    <tr>
        <td><a href="unity/tutorials/mr-azure-303.md">Cross-device notifications</a></td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
    <tr>
        <td><a href="unity/tutorials/mr-azure-304.md">Face recognition</a></td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
    <tr>
        <td><a href="unity/tutorials/mr-azure-305.md">Functions and storage</a></td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
    <tr>
        <td><a href="unity/tutorials/mr-azure-306.md">Streaming video</a></td>
        <td>❌</td>
        <td>✔️</td>
    </tr>
    <tr>
        <td><a href="unity/tutorials/mr-azure-307.md">Machine learning</a></td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
    <tr>
        <td><a href="unity/tutorials/mr-azure-308.md">Functions and storage</a></td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
    <tr>
        <td><a href="unity/tutorials/mr-azure-309.md">Application insights</a></td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
    <tr>
        <td><a href="unity/tutorials/mr-azure-310.md">Object detection</a></td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
    <tr>
        <td><a href="unity/tutorials/mr-azure-311.md">Microsoft Graph</a></td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
    <tr>
        <td><a href="unity/tutorials/mr-azure-312.md">Bot integration</a></td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
</table>

## See also

* Azure Spatial Anchor tutorials for HoloLens 2 - [1 of 3 Getting started with Azure Spatial Anchors](/learn/modules/azure-spatial-anchors-tutorials/2-get-started-with-azure-spatial-anchors)
* Azure Speech Services tutorials for HoloLens 2 - [1 of 4 Integrating and using speech recognition and transcription](/learn/modules/azure-speech-services-tutorials-mrtk/)
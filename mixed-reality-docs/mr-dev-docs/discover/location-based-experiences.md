---
title: Location Based Entertainment with Windows Mixed Reality
description: Learn about Windows Mixed Reality for Location Based Entertainment—hardware, backpack PCs, tracking, configuration, and support.
author: jessemcculloch
ms.author: ishitak
ms.date: 08/03/2020
ms.topic: article
keywords: mixed reality, vr, lbe, location, mixed reality headset, windows mixed reality headset, virtual reality headset, hardware, HoloLens, multi-player, cloud services, azure
---

# Location Based Entertainment with Windows Mixed Reality

In the last couple of years, we've seen an incredible amount of growth and innovation in the Location Based Entertainment category. Traditional venues like theme parks and theaters have started offering immersive, multi-player experiences as complimentary experiences to existing rides and installations. New operators and venues are bringing unique multi-sensorial, multi-player experiences at an attractive price to the masses. All of these experiences are pushing the envelope for what’s possible with mixed reality.

This document is a guide to get started with Windows Mixed Reality in the Location Based Entertainment category. The guidance below may additionally be applicable to location-based experiences beyond entertainment such as training, product design, and other use cases.

## Engineering FAQ

### Hardware

**Q: What hardware is available from Microsoft and its partners that I can use in my setup?**

A: Microsoft and its OEM partners offer a compelling portfolio of devices to choose from depending on your needs.  

If the experiences you’re providing to your customers requires a virtual reality headset, in-market headsets from HP, Samsung, and Acer are a great fit. Each headset has their own differentiated attributes. More details on each below.

HP Reverb: [Details](https://hp.com/go/Reverbpro)

Samsung Odyssey+: [Details](https://www.samsung.com/us/computing/hmd/windows-mixed-reality/hmd-odyssey-windows-mixed-reality-headset-xe800zba-hc1us/)

Acer: [Details](https://www.acer.com/ac/en/US/content/model/VD.R05AP.002)

If your location specializes in mixed or augmented reality experiences with see-through headsets, check out the Microsoft HoloLens 2.  

HoloLens 2: [Pre-order interest](https://www.microsoft.com//hololens/buy)

If you’re experimenting with experiences that use advanced computer vision, speech, and body tracking, the Azure Kinect DK is a good fit.  

Azure Kinect: [Details](https://azure.microsoft.com//services/kinect-dk/)

**Q: What is the portfolio of backpack PCs I can use to run my PC-tethered VR experiences?**

For PC-tethered VR experiences, our OEMs offer an incredible selection of backpack PCs built exactly for that need.

HP just launched their HP VR backpack G2, the world’s most powerful wearable PC – optimized for free-roam experiences, now with 30% more power with an RTX 2080 GPU inside. [Details](https://www8.hp.com/us/en/vr/vr-backpack.html)

### Setup

**Q: How can I more easily configure setup and customize the Mixed Reality Portal for LBE?**

>[!NOTE]
>This feature requires version 2000.19061.1011.0 or greater.  

You may find that you need more customization of Mixed Reality Portal than is normally available through the app for deploying apps to kiosks or customized experiences. The latest July update of Mixed Reality Portal supports several advanced settings, which you can set via a configuration file:  

Allow failed system checks – normally the setup process checks the PC for compatibility with Windows Mixed Reality before completing setup. Bypassing compatibility checks may cause issues when trying to run Windows Mixed Reality if there are compatibility issues.  

Skip Device Companion App – the DCA provides headset-specific setup steps provided by the manufacturer and allows for updating the headset’s firmware.  

Skip room setup – instead of being prompted to create a room boundary, you can continue directly into the headset in Seated/Standing mode.  

Skip installing apps from the Store - normal setup installs several Store apps including 3D Viewer and the Edge 360 Viewer add-on. This will skip the install of these apps, but you may be missing device functionality.  

Show preview in full screen – Mixed Reality Portal will default to showing the headset preview in full-screen on the desktop PC while the headset is in use.  

Hide New for you side panel – prevents the New for you panel from being expanded on launch of Mixed Reality Portal.  

#### How to configure:  

To set any of these configurations, you need to create a file called _UserConfig.json_ under this directory: 
_$env:LOCALAPPDATA\Packages\Microsoft.MixedReality.Portal_8wekyb3d8bbwe\LocalState\\_

For most users, this will look like:
_C:\Users\<username>\AppData\Local\Packages\microsoft.mixedreality.portal_8wekyb3d8bbwe\LocalState\\_

The JSON file should have the below contents with “true” set for any of the above settings you want enabled:  

```
{

  "shouldAllowFailedSystemChecks": true,

  "shouldSkipDcaApp": true,

  "shouldSkipRoomSetup": true,

  "shouldSkipStoreAppInstall": true,

  "shouldShowPreviewFullScreen": true,

  "shouldHideEngagementPane": true

}
```
 
**Q: Is there any guidance on configuring the playspace?**

A: Configuring a playspace should be done as you would with a consumer setup experience. The Room Setup process will also let you define your room boundaries. More details on configuring room boundaries can be read [here](/windows/mixed-reality/enthusiast-guide/set-up-windows-mixed-reality#set-up-your-room-boundary).

As discussed in the above document the maximum reasonable single coordinate playspace is around 5mx5m. If you want to have a larger area, you can make use of the Spatial Anchors capability in the Windows Holographic API stack. Using this API will require custom engineering in the experiences you're producing.  

More details on how to optimize your content for different space sizes can be read [here](/windows/mixed-reality/coordinate-systems).
 

**Q: My space is too large and I’m running into errors when I try to set up a Standing experience with boundaries. What should I do to set up my large free-roam experience work?**

A: To set up a larger space than ~18x18ft, you can't use the boundary experience provided by the system.  The boundary systems rely on a single fixed coordinate “anchor”, which can become unstable when a user is too far from the center stage anchor. 

You can set up “seated” mode, which won't display the boundary or configure a stage bounds or playspace.  You’ll need to configure multiple spatial anchors within the app to reference physical boundary areas. 

The application developer is responsible to display necessary safeguards so that users don’t collide with physical surroundings.  These could be digital walls within the experience or a customized game boundary visual. 

Guidance on setting up the room boundary with WMR can be found [here](/windows/mixed-reality/enthusiast-guide/set-up-windows-mixed-reality#set-up-your-room-boundary).

**Q: Where is the origin of the playspace?**

A: The origin of the playspace is determined by the Room Setup experience, more specifically the HMD position when the Center button is pressed during setup. 

### MULTI-PLAYER SETUP

**Q: I’m deploying a multi-player experience in at my venue. Is that supported on Windows Mixed Reality?**

A: If you opt into the Windows 20H1 or later build via our Insider program, you can access a new interface for map sharing. This new functionality is available via the [Map Manager](../develop/platform-capabilities-and-apis/using-the-windows-device-portal.md#map-manager) interface of the Windows Device portal. To use this tool, follow the steps below:
* Make sure you're opted into 20H1 or later - after September 2019, this means using our Insider program
* Enable the Windows Device Portal (WDP) using these [instructions](/windows/uwp/debug-test-perf/device-portal-desktop)
* Plug in a Windows Mixed Reality HMD that you wish to either download an existing map from or import a new map
* Navigate to the WDP in your browser of choice using the URL provided in the settings screen.
    * Once there Navigate to the "Mixed Reality" section and select "Map Manager".
    * You can now use the "Download" button to export an existing map from the machine.
    * You can use the "Upload a map file" button to import a map from a previous export (perhaps on a different machine).
    * You can use "Import" to enable the system to use that map for this HMD on this machine.

> [!NOTE] 
> Previously, it was possible to use the Spatial Data Packager Tool, however, that tool was originally released as unsupported and is now officially deprecated and no longer functional on 20H1. Instead, please use the inbox [Map Manager](../develop/platform-capabilities-and-apis/using-the-windows-device-portal.md#map-manager) tool as described above. 

### TRACKING

Q: How does the tracking technology in the Windows Mixed Reality headsets work?  

Mixed Reality shares the same tracking technology as the HoloLens. To learn more about the inside-out tracking system, check out the documentation [here](/windows/mixed-reality/enthusiast-guide/tracking-system).

For a description of how the higher-level spatial mapping system works you can read our description [here](../design/spatial-mapping.md).

**Q: Are there any best practices for getting a reliable tracking volume?**

To best configure the environment for tracking success, you can read best practices in this [post](/hololens/hololens-environment-considerations).

**Q: Are there any specific nuances with tracking in warehouse-scale spaces or optimizations to consider?**

A: The following practices can help with getting a more reliable tracking volume:  

Providing different features in the room that overlap at multiple positions will help the tracking system get a solid lock. Think of random paint splatters and hatching rather than using solid contour style lines. 

Minimize the dynamic range of lighting in your area where possible. The tracking cameras on our Mixed Reality HMDs aren't HDR and have AGC (auto gain) and AEC (auto exposure) going to deal with different lighting. Depending on the distribution of surface light, patterns and contrast, either AGC or AEC may conclude you’re in a much all white or black room, which can wash out your features that may be in the opposite “color”. If you're trying to take an interior picture in front of an exterior window with bright daylight behind and you adjust exposure so you can see detail outside, then everything on the interior is underexposed and black. Or if set for inside, then everything outside is now overexposed and all white.  

Spotlights in a room (even overhead) that are in view if tracking cameras can sometimes be culprits, which confuse the AEC/AGC of the tracking cameras. Flat/diffused lighting helps.  

### MIXED REALITY CLOUD SERVICES AND AZURE 

**Q: How can Microsoft Azure help my business scale?**

A: Azure based onsite and remote management can help your business be data-driven, reduce operational costs and scale deployment across existing and new locations. Azure cloud services such as Azure Storage, Azure Functions, App Service, Azure Networking, and IOT Hub can help with the following use cases:  

Remote Device Deployment & Management 

Real-Time Onsite Analytics 

Intelligent Adaptable LBE Gameplay 

LBE Content Streaming and Deployment 

LBE Player Preference Heatmap 

LBE Reservation and Booking System 

**Q: I’m developing a spatial MMOG to deploy over a massive footprint. Any services that help me manage my content and object persistence?**

A: Azure Spatial Anchors is a new Mixed Reality service that enables multi-user, spatially aware mixed reality experiences across HoloLens, iOS, and Android devices. You can learn more about Azure Spatial Anchors [here](https://azure.microsoft.com//services/spatial-anchors/).

**Q. Our venue specializes in multi-player experiences and I’d like to focus our development time on content and front-end development. Are there offerings that can help me bootstrap or offload backend development?**

A: Azure PlayFab is a complete backend platform for live games. You can learn more about it [here](https://playfab.com/).

### Misc

**Q: I use SteamVR to deploy my experiences. Does Windows Mixed Reality work with SteamVR?**

A: Windows Mixed Reality for SteamVR allows users to run SteamVR experiences on Windows Mixed Reality immersive headsets. Learn more about SteamVR with WMR [here](/windows/mixed-reality/enthusiast-guide/using-steamvr-with-windows-mixed-reality).

### Support and community  

We have a few helpful resources to help you engage with subject matter experts on our team, get troubleshooting support, and contribute to the broader mixed reality dev community.  

If you run into issues with any publicly released features, file a bug using Feedback Hub.For guidance, refer to this [page](/windows/mixed-reality/enthusiast-guide/filing-feedback).

For other troubleshooting help with WMR, file a [support request](https://support.microsoft.com//supportforbusiness/productselection?sapId=96bfb202-bc79-741b-bf7a-774d8b767782) with our customer support team.

Join our HoloDevelopers Slack channel to engage with the mixed reality developers and subject matter experts: [aka.ms/holodevelopers](https://aka.ms/holodevelopers)

Twitter: Follow our Mixed Reality Developer Relations team for news, events, and updates @MxdRealityDev 

If you happen to be in or around San Francisco, there’s always something going on at the Microsoft Reactor. You can see our calendar of events [here](https://developer.microsoft.com//reactor/Location/San%20Francisco).

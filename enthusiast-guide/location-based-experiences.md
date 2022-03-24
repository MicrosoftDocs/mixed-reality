---
title: Location Based Entertainment with Windows Mixed Reality
description: Learn about Windows Mixed Reality for Location Based Entertainment—hardware, backpack PCs, tracking, configuration, and support.
author: qianw211
ms.author: qianwen
ms.date: 11/17/2021
ms.topic: article
keywords: mixed reality, vr, lbe, location, mixed reality headset, windows mixed reality headset, virtual reality headset, hardware, HoloLens, multiplayer, cloud services, azure
---

# Location Based Entertainment with Windows Mixed Reality

In the last couple of years, we've seen an incredible amount of growth and innovation in the Location Based Entertainment (LBE) category. Traditional venues like theme parks and theaters have started offering immersive, multiplayer experiences as complementary experiences to existing rides and installations. New operators and venues are bringing unique multi-sensorial, multiplayer experiences at an attractive price to the masses. All of these experiences are pushing the envelope for what’s possible with mixed reality.

This document is a guide to get started with Windows Mixed Reality in the Location Based Entertainment category. The guidance below may additionally be applicable to location-based experiences beyond entertainment-- for example,  training and product design.

## Engineering FAQ

### Hardware

**Q: What hardware is available from Microsoft and its partners that I can use in my LBE location or business?**

A: Windows Mixed Reality supports a compelling portfolio of devices to choose from depending on your needs.  

Currently available headsets from our partners at HP are a great fit, as each headset has their own differentiated attributes tailored to your specific business needs. More details on each below. 

1. [HP Reverb G2](https://www.hp.com/us-en/vr/reverb-vr-headset-gaming.html)
1. [HP Reverb G2 Omnicept Edition](https://www.hp.com/us-en/vr/reverb-g2-vr-headset-omnicept-edition.html)
1. [HP Reverb G1](https://h20195.www2.hp.com/V2/getpdf.aspx/c06227520.pdf)

If your location specializes in mixed or augmented reality experiences with see-through headsets, check out the Microsoft HoloLens 2.  

HoloLens 2: [Shop HoloLens 2 offerings](https://www.microsoft.com//hololens/buy).

If you’re experimenting with experiences that use advanced computer vision, speech, and body tracking, the Azure Kinect DK is a good fit.  

Azure Kinect: [Details](https://azure.microsoft.com//services/kinect-dk/)

**Q: What backpack PCs can I use to support untethered VR experiences in my LBE location or business?**

For PC-tethered VR experiences, we recommend that you use the HP Z VR Backpack G2. It's the world’s most powerful wearable PC and is optimized for free-roam experiences. The system now offers 30% more power with an RTX 2080 GPU inside. See [details](https://www.hp.com/us-en/shop/mdp/hp-z-vr-backpack-g1-workstation--1?jumpid=cp_r11260_us/en/psg/vr_ready_workstations/zvrbackpack-shop-32gb#!&tab=vao).

### How to setup

**Q: How can I more easily configure setup and customize the Mixed Reality Portal for LBE?**

>[!NOTE]
>This feature requires the [Mixed Reality Portal](./install-windows-mixed-reality.md#launch-mixed-reality-portal) version 2000.19061.1011.0 or greater.  

You may find that you need more customization of Mixed Reality Portal than is normally available through the app for deploying apps to kiosks or customized experiences. [Mixed Reality Portal](./install-windows-mixed-reality.md#launch-mixed-reality-portal) supports several advanced settings, which you can set via a configuration file:  

* **Allow failed system checks** – normally the setup process checks the PC for compatibility with Windows Mixed Reality before completing setup. Bypassing compatibility checks may result in a degraded experience when attempting to run Windows Mixed Reality on an incompatible host PC. 

* **Skip Device Companion App** – the DCA provides headset-specific setup steps provided by the manufacturer and allows for updating the headset’s firmware.

* **Skip room setup** – instead of being prompted to create a room boundary, you can continue directly into the headset in Seated/Standing mode.  

  >[!Caution]
  >Failure to set up, use, and properly care for your device can increase the risk of serious injury, death, property damage, or damage to the product or related accessories. See [details](./wmr-health-safety-comfort.md).

* **Skip installing apps from the Store** - normal setup installs several Store apps including [3D Viewer](https://www.microsoft.com/p/3d-viewer/9nblggh42ths?activetab=pivot:overviewtab) and the [Edge 360 Viewer add-on](./webvr.md). When you choose this option, you skip installing these apps, but this may result in missing device functionality.  

* **Show preview in full screen** – [Mixed Reality Portal](./install-windows-mixed-reality.md#launch-mixed-reality-portal) will default to showing the headset preview in full-screen on the desktop PC while the headset is in use.  

* **Hide New for you side panel** – prevents the **New for you** panel from being expanded on launch of Mixed Reality Portal.  

#### How to configure

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

A: Configuring a playspace should be done as you would with a consumer setup experience. The Room Setup process will also let you define your room boundaries. More details on configuring room boundaries can be read [here](./set-up-windows-mixed-reality.md#set-up-your-room-boundary).

As discussed in the above document the maximum reasonable single coordinate playspace is around 5mx5m. If you want to have a larger area, you can make use of the Spatial Anchors capability in the Windows Holographic API stack. Using this API will require custom engineering in the experiences you're producing.  

More details on how to optimize your content for different space sizes can be read [here](/windows/mixed-reality/coordinate-systems).
 

**Q: My space is too large and I’m running into errors when I try to set up a Standing experience with boundaries. What should I do to set up my large free-roam experience work?**

A: To set up a larger space than ~18x18ft, you can't use the boundary experience provided by the system.  The boundary systems rely on a single fixed coordinate “anchor”, which can become unstable when a user is too far from the center stage anchor. 

You can set up “seated” mode, which won't display the boundary or configure a stage bounds or playspace.  You’ll need to configure multiple spatial anchors within the app to reference physical boundary areas. 

The application developer is responsible to display necessary safeguards so that users don’t collide with physical surroundings.  These could be digital walls within the experience or a customized game boundary visual. 

Guidance on setting up the room boundary with WMR can be found [here](./set-up-windows-mixed-reality.md#set-up-your-room-boundary).

**Q: Where is the origin of the playspace?**

A: The origin of the playspace is determined by the Room Setup experience, more specifically the HMD position when the Center button is pressed during setup. 

### Multiplayer setup

**Q: Is deployment of a multiplayer experience at my venue supported in Windows Mixed Reality**

A: If you opt in to the Windows 20H1 or later build via our [Windows Insider program](https://insider.windows.com/), you can access an interface for map sharing. This new functionality is available via the [Map Manager](/windows/mixed-reality/develop/advanced-concepts/using-the-windows-device-portal#map-manager) interface of the Windows Device portal. To use this tool, follow the steps below:

* Make sure you're opted into 20H1 or later - the [Windows Insider program](https://insider.windows.com/)
* Enable the Windows Device Portal (WDP) using these [instructions](/windows/uwp/debug-test-perf/device-portal-desktop)
* Connect the Windows Mixed Reality headset that you wish to either download an existing map from or import a new map
* Navigate to the WDP in your browser of choice using the URL provided in the settings screen.
    * Once there Navigate to the "Mixed Reality" section and select "Map Manager".
    * You can now use the "Download" button to export an existing map from the machine.
    * You can use the "Upload a map file" button to import a map from a previous export (perhaps on a different machine).
    * You can use "Import" to enable the system to use that map for this HMD on this machine.

> [!NOTE] 
> Previously, it was possible to use the Spatial Data Packager Tool, however, that tool was originally released as unsupported and is now officially deprecated and no longer functional on 20H1. Instead, please use the inbox [Map Manager](/windows/mixed-reality/develop/advanced-concepts/using-the-windows-device-portal#map-manager) tool as described above. 

### Tracking

Q: How does the tracking technology in the Windows Mixed Reality headsets work?  

Mixed Reality shares the same tracking technology as the HoloLens. For more information, see [inside-out tracking system](./tracking-system.md).

For a description of how the higher-level spatial mapping system works, see [Spatial mapping](/windows/mixed-reality/design/spatial-mapping).

**Q: Are there any best practices for getting a reliable tracking volume?**

To best configure the environment for tracking success, you can find best practices in [HoloLens environment considerations](/hololens/hololens-environment-considerations).

**Q: Are there any specific nuances with tracking in warehouse-scale spaces or optimizations to consider?**

A: The following practices can help with getting a more reliable tracking volume:  

Providing different features in the room that overlap at multiple positions will help the tracking system get a solid lock. Think of random paint splatters and hatching rather than using solid contour style lines. 

Minimize the dynamic range of lighting in your area where possible. The tracking cameras on our Mixed Reality HMDs aren't HDR and have AGC (auto gain) and AEC (auto exposure) going to deal with different lighting. Depending on the distribution of surface light, patterns and contrast, either AGC or AEC may conclude you’re in a much all white or black room, which can wash out your features that may be in the opposite “color”. If you're trying to take an interior picture in front of an exterior window with bright daylight behind and you adjust exposure so you can see detail outside, then everything on the interior is underexposed and black. Or if set for inside, then everything outside is now overexposed and all white.  

Spotlights in a room (even overhead) that are in view if tracking cameras can sometimes be culprits, which confuse the AEC/AGC of the tracking cameras. Flat/diffused lighting helps.  

### Mixed Reality Cloud Services and Azure

**Q: How can [Microsoft Azure](https://azure.microsoft.com/) help my business scale?**

A: Azure based onsite and remote management can help your business be data-driven, reduce operational costs and scale deployment across existing and new locations. Azure cloud services such as [Azure Storage](/azure/storage/common/storage-introduction), [Azure Functions](/azure/azure-functions/functions-overview), [App Service](/azure/app-service/overview), [Azure Networking](https://azure.microsoft.com/product-categories/networking/), and [IOT Hub](https://azure.microsoft.com/services/iot-hub/) can help with the following use cases:  

* Remote Device Deployment & Management 

* Real-Time Onsite Analytics 

* Intelligent Adaptable LBE Gameplay 

* LBE Content Streaming and Deployment 

* LBE Player Preference Heatmap 

* LBE Reservation and Booking System 

**Q: I’m developing a spatial MMOG to deploy over a massive footprint. Any services that help me manage my content and object persistence?**

A: Azure Spatial Anchors is a new Mixed Reality service that enables multi-user, spatially aware mixed reality experiences across HoloLens, iOS, and Android devices. You can learn more about [Azure Spatial Anchors](https://azure.microsoft.com//services/spatial-anchors/).

**Q. Our venue specializes in multiplayer experiences, and I’d like to focus our development time on content and front-end development. Are there offerings that can help me bootstrap or offload backend development?**

A: Azure PlayFab is a complete backend platform for live games. You can learn more at <https://playfab.com/>.

### Using SteamVR for Location Based Entertainment

**Q: I use SteamVR to deploy my experiences. Does Windows Mixed Reality work with SteamVR?**

A: Windows Mixed Reality for SteamVR allows users to run SteamVR experiences on Windows Mixed Reality immersive headsets. Learn more about [using SteamVR with WMR](./using-steamvr-with-windows-mixed-reality.md).

### Support and community  

We have a few helpful resources to help you engage with subject matter experts on our team, get troubleshooting support, and contribute to the broader mixed reality dev community.  

If you run into issues with any publicly released features, file a bug using Feedback Hub.For guidance, refer to this [page](./filing-feedback.md).

For other troubleshooting help with WMR, file a [support request](https://support.microsoft.com//supportforbusiness/productselection?sapId=96bfb202-bc79-741b-bf7a-774d8b767782) with our customer support team.

Join our HoloDevelopers Slack channel to engage with the mixed reality developers and subject matter experts: [aka.ms/holodevelopers](https://aka.ms/holodevelopers)

Twitter: Follow our Mixed Reality Developer Relations team for news, events, and updates @MxdRealityDev 

If you happen to be in or around San Francisco, there’s always something going on at the Microsoft Reactor. Check out our [calendar of events](https://developer.microsoft.com//reactor/Location/San%20Francisco).
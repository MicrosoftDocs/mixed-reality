---
title: Enterprise and Location-Based Entertainment support FAQ
description: Enterprise and Location-Based Entertainment support FAQ
author: qianw211
ms.author: qianwen
ms.date: 4/7/2022
ms.topic: article
keywords: mixed reality, vr, lbe, location, mixed reality headset, windows mixed reality headset, virtual reality headset, hardware, HoloLens, multiplayer, cloud services, azure, prototyping, manufacturing
---

# Enterprise and Location-Based Entertainment support FAQ

Here is a list of Enterprise and Location-Based Entertainment Support FAQ topics:

* [Design and development FAQ](#design-and-development-faq)
* [Hardware and updates FAQ](#hardware--updates-faq)
* [Mixed Reality Portal FAQ](#mixed-reality-portal-faq)
* [Multiplayer FAQ](#multiplayer-faq)
* [Tracking FAQ](#tracking-faq)
* [Cloud Services and Azure FAQ](#cloud-services--azure-faq)
* [Support and community](#support-and-community)

## Design and development FAQ

### What resources does the Windows Mixed Reality platform have to assist with designing and developing immersive experiences? 

The Mixed Reality Docs hub contains several pages covering different components of the immersive experience design process, including [core concepts](/windows/mixed-reality/design/core-concepts-landingpage), [interaction models](/windows/mixed-reality/design/interaction-fundamentals), [UX elements](/windows/mixed-reality/design/app-patterns-landingpage), etc.  

Additionally, there are many pages dedicated to developing immersive experiences.

* [How to get started](/windows/mixed-reality/develop/development) and [port apps](/windows/mixed-reality/develop/porting-apps/porting-overview).
* Introduction to popular engines like [Unity](/windows/mixed-reality/develop/unity/unity-development-wmr-overview) and [Unreal](/windows/mixed-reality/develop/unity/unity-development-wmr-overview).
* What [Azure mixed reality services](/windows/mixed-reality/develop/mixed-reality-cloud-services) are available to assist with building professional and informative immersive training and simulation experiences.
 
### Where should I begin with learning how to build immersive experiences for use with the Windows Mixed Reality platform or other virtual reality devices?

Begin your native development journey by getting acquainted with [OpenXR](/windows/mixed-reality/develop/native/openxr), which can be used to develop unique immersive experiences with on any Windows Mixed Reality immersive VR headset. OpenXR is an open royalty-free API standard from [Khronos](https://www.khronos.org/), providing engines with native access to various devices across the [mixed reality spectrum](/windows/mixed-reality/discover/mixed-reality).

OpenXR lets you write code once that's portable across a wide range of hardware platforms. The OpenXR API uses a loader to connect your application directly to your headset's native platform support. End users get maximum performance and minimum latency, whether they're using a Windows Mixed Reality device or any other headset.

### Our venue specializes in multiplayer experiences, and I'd like to focus our development time on content and front-end development. Are there offerings that can help me bootstrap or offload backend development?

Azure PlayFab is a complete backend platform for live games. Learn more about [Azure PlayFab](https://azure.microsoft.com/services/playfab/#overview).

### I use SteamVR to deploy my experiences. Does Windows Mixed Reality work with SteamVR?

Windows Mixed Reality for SteamVR allows users to run SteamVR experiences on Windows Mixed Reality immersive headsets. Learn more about [using SteamVR with WMR](using-steamvr-with-windows-mixed-reality.md).

## Hardware & Updates FAQ 

### What hardware is available from Microsoft and its partners that I can use in my LBE location or business?

Windows Mixed Reality supports a compelling portfolio of devices depending on your needs.

Currently available headsets from our partners at HP are a great fit, as each headset has its differentiated attributes tailored to your specific business needs. More details on each are below.

* [HP Reverb G2](https://www.hp.com/us-en/vr/reverb-vr-headset-gaming.html)
* [HP Reverb G2 Omnicept Edition](https://www.hp.com/us-en/vr/reverb-g2-vr-headset-omnicept-edition.html)
* [HP Reverb G1](https://h20195.www2.hp.com/V2/getpdf.aspx/c06227520.pdf)

If your location specializes in mixed or augmented reality experiences with see-through headsets, check out the Microsoft HoloLens 2.

* HoloLens 2: [Shop HoloLens 2 offerings](https://www.microsoft.com/hololens/buy)

Azure Kinect DK is a good fit if you're experimenting with experiences that use advanced computer vision, speech, and body tracking.

* Azure Kinect: [Details](https://azure.microsoft.com/services/kinect-dk/)
 
### What backpack PCs can I use to support untethered VR experiences in my LBE location or business?

For PC-tethered VR experiences, we recommend that you use the HP Z VR Backpack G2, which is optimized for free-roam experiences. [See details](https://valuehub.hp.com/workstations/virtual-reality/hp-z-vr-backpack-pc/).

### Where can I find the latest device and software updates to support the Windows Mixed Reality platform?

>[!Note] 
>Windows 10, version 1709 (the Fall Creator's Update) or newer and Windows 11 contain key OS components and technologies that maintains full Windows Mixed Reality platform functionality

The Windows Mixed Reality platform consists of the following major components:

1. The **Mixed Reality feature-on-demand package** (FOD) is automatically downloaded and installed during Mixed Reality Portal's first run. You can find more information about the FOD package [here](/windows/application-management/manage-windows-mixed-reality).
1. The **Mixed Reality headset and motion controller driver**, also known as the HoloLens Sensors driver, is the key driver package that enables Windows Mixed Reality headsets to work with Windows Mixed Reality. This is automatically downloaded and installed via Windows Update the first time your Mixed Reality headset is plugged in, and is regularly updated via Windows Update.
1. The **Mixed Reality motion controller model drivers** contain the 3D models of the Mixed Reality motion controllers and needed for third-party Mixed Reality experiences. This is automatically downloaded and installed via Windows Update the first time your Mixed Reality motion controllers are paired to your PC, and is updated via Windows Update.
1. You can find more details by visiting the [Mixed Reality software overview and release history](mixed-reality-software.md) page.

## Mixed Reality Portal FAQ

### What solutions does the Windows Mixed Reality platform have to suppress the Mixed Reality Portal virtual home experience and get into SteamVR faster? 

>[!Note] 
>This feature requires installations of [Steam](https://store.steampowered.com/about/%3Fsnr%3D1_4_4__11), [SteamVR](https://store.steampowered.com/app/250820/SteamVR/), and [Windows Mixed Reality for SteamVR](https://store.steampowered.com/app/719950/Windows_Mixed_Reality_for_SteamVR/).  <br> <br> This feature is available on Windows 10 (version 2004 and newer) and Windows 11.

To suppress the Mixed Reality Portal's virtual home experience and launch directly into SteamVR, open the Settings menu, select the 'Startup & desktop' option within the 'Mixed Reality' tab, and select the 'Automatic startup' drop down option. Check the box next to the option, "When I open Mixed Reality Portal, automatically start Windows Mixed Reality for SteamVR."
 
### What solutions does the Windows Mixed Reality platform have to limit the number of system resources consumed by the Mixed Reality Portal virtual home experience? 

>[!Note] 
>This feature is available on Windows 10 (version 2004 and newer) and Windows 11].

There are multiple home environments available to pick from within the Mixed Reality Portal virtual home space. Each option affords more virtual space to use at the cost of a less performant VR experience. To set the home experience to the least resource-heavy option, open the virtual Pins Panel, select the 'Places' option, and select the 'Infinite Expanse' option. Once a virtual live hologram of this space appears, select it, and the 'Infinite Expanse' virtual home environment will now become your new default virtual home environment. 
 
### Where can I find the latest software updates to support the Mixed Reality Portal?

The Mixed Reality Portal is updated differently depending on which version of Windows is being used:

* Windows 10 (versions 1709 and 1803): Mixed Reality Portal is a key component of the Windows 10 operating system updated via Windows Update.
* Windows 10 (versions 1809 and newer) and Windows 11: Mixed Reality Portal is updated via the Microsoft Store app. More information can be found on the Get Mixed Reality Portal page.

Visit the [Mixed Reality software overview and release history](mixed-reality-software.md) page for more details.  

### How can I enable or block the use of the Windows Mixed Reality platform in enterprise environments?

Businesses often have robust network security to prevent the Windows Mixed Reality platform from being usable in an enterprise environment by default. To enable or block the use of the Windows Mixed Reality platform in enterprise environments, please refer to the [Enable or block Windows Mixed Reality apps in enterprises](/windows/application-management/manage-windows-mixed-reality) page.
 
### What options do I have to more easily configure setup and customize the Mixed Reality Portal for enterprise and location-based entertainment scenarios?

>[!Note] 
>This feature requires the [Mixed Reality Portal](install-windows-mixed-reality.md#launch-mixed-reality-portal) version 2000.19061.1011.0 or greater.

You may find that you need more customization of Mixed Reality Portal than normally available through the app, such as deploying apps to kiosks or customized experiences. [Mixed Reality Portal](install-windows-mixed-reality.md#launch-mixed-reality-portal) supports several advanced settings, which you can set via a configuration file:

* **Allow failed system checks* - normally, the setup process checks the PC for compatibility with Windows Mixed Reality before completing setup. Bypassing compatibility checks may result in a degraded experience when attempting to run Windows Mixed Reality on an incompatible host PC.
* **Skip Device Companion App** - the DCA provides headset-specific setup steps provided by the manufacturer and allows for updating the headset's firmware.
* **Skip room setup** - instead of being prompted to create a room boundary, you can continue directly into the headset in Seated/Standing mode.
    >[!Caution] 
    >Failure to set up, use, and properly care for your device can increase the risk of serious injury, death, property damage, or damage to the product or related accessories. See [details](wmr-health-safety-comfort.md).
* **Skip installing apps from the Store** - typical setup installs several Store apps, including [3D Viewer](https://www.microsoft.com/p/3d-viewer/9nblggh42ths?activetab=pivot:overviewtab) and the [Edge 360 Viewer add-on](webvr.md). When you choose this option, you skip installing these apps, but this may result in missing device functionality.
* **Show preview in full screen** - [Mixed Reality Portal](install-windows-mixed-reality.md#launch-mixed-reality-portal) will default to showing the headset preview in full-screen on the desktop PC while the headset is in use.
* **Hide New for you side panel** - prevents the **New for you** panel from being expanded on launch of Mixed Reality Portal.
 
### How do I enable these configurations for Mixed Reality Portal? 

To set any of these configurations, you need to create a file called `UserConfig.json` under this directory: 
`$env:LOCALAPPDATA\Packages\Microsoft.MixedReality.Portal_8wekyb3d8bbwe\LocalState\`

For most users, this will look like: 

`C:\Users<username>\AppData\Local\Packages\microsoft.mixedreality.portal_8wekyb3d8bbwe\LocalState\`

The JSON file should have the below contents with "true" set for any of the above settings you want enabled:

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
 
### What guidance is available for configuring playspaces?

Configuring a playspace should be done as you would with a consumer setup experience. The Room Setup process will also let you define your room boundaries. More details on configuring room boundaries can be read [here](set-up-windows-mixed-reality.md#set-up-your-room-boundary).

As discussed in the above document, the maximum reasonable single coordinate playspace is around 5mx5m. If you want to have a larger area, you can use the Spatial Anchors capability in the Windows Holographic API stack. Using this API will require custom engineering in the experiences you're producing.

See [here](/windows/mixed-reality/coordinate-systems) for more details on optimizing your content for different space sizes.

### What guidance is available for enabling playspaces to support larger free-roam experiences?

To set up a larger space than ~18x18ft, you can't use the boundary experience provided by the system. The boundary systems rely on a single fixed coordinate "anchor," which can become unstable when a user is too far from the center stage anchor.

You can set up "seated" mode, which won't display the boundary or configure a stage bound or playspace. You'll need to configure multiple spatial anchors to reference physical boundary areas within the app.

The application developer is responsible for displaying necessary safeguards so that users don't collide with physical surroundings. These could be digital walls within the experience or a customized game boundary visual.

See [here](set-up-windows-mixed-reality.md#set-up-your-room-boundary) for guidance on setting up the room boundary with WMR.

## Multiplayer FAQ

### What type of support does the Windows Mixed Reality platform provide for deploying a multiplayer experience at my venue?

If you opt in to the Windows 20H1 or later build via our Windows Insider program, you can access an interface for map sharing. This new functionality is available via the Map Manager interface of the Windows Device portal. To use this tool, follow the steps below: 

* Make sure you're opted into 20H1 or later - the Windows Insider program.
* Enable the Windows Device Portal (WDP) using these instructions.
* Connect the Windows Mixed Reality headset that you wish to either download an existing map from or import a new map.
* Navigate to the WDP in your browser using the URL provided in the settings screen.
    * Once there, Navigate to the "Mixed Reality" section and select "Map Manager."
    * You can now use the **Download** button to export an existing map from the machine.
    * You can use the "Upload a map file" button to import a map from a previous export (perhaps on a different device).
    * You can use "Import" to enable the system to use that map for this HMD on this machine.

>[!Note]
>Previously, it was possible to use the Spatial Data Packager Tool. However, that tool was originally released as unsupported and is now officially deprecated and no longer functional on 20H1. Instead, please use the inbox [Map Manager](/windows/mixed-reality/develop/advanced-concepts/using-the-windows-device-portal#map-manager) tool as described above. 
 
### What solutions does the Windows Mixed Reality platform have for hygienically sharing devices between several other staff or customers?

If you expect multitudes of staff and customers to be using the same devices in an enterprise or location-based entertainment environment, we recommend using the [HP Reverb G2](https://www.hp.com/us-en/vr/reverb-vr-headset-gaming.html), which has additional and clean facial gaskets available, that can swap easily between individual uses. 

See HP Reverb G2 Wipeable Gasket 3 Pack: [Details](https://www.hp.com/us-en/shop/pdp/hp-reverb-g2-wipeable-gasket-3-pack)

## Tracking FAQ

### How does the tracking technology in the Windows Mixed Reality headsets work?

Mixed Reality shares the same tracking technology as the HoloLens. For more information, see [inside-out tracking system](tracking-system.md).

For a description of how the higher-level spatial mapping system works, see [spatial mapping](/windows/mixed-reality/design/spatial-mapping).
 
### Are there any best practices for getting a reliable tracking volume?

To best configure the environment for tracking success, you can find best practices in [HoloLens environment considerations](/windows/mixed-reality/design/spatial-mapping).

### Are there any specific nuances with tracking in warehouse-scale spaces or optimizations to consider?

The following practices can help with getting a more reliable tracking volume:

Providing different features in the room that overlap at multiple positions will help the tracking system get a solid lock. Think of random paint splatters and hatching rather than solid contour style lines.

Minimize the dynamic range of lighting in your area where possible. The tracking cameras on our Mixed Reality HMDs aren't HDR and have AGC (auto gain) and AEC (auto exposure) dealing with different lighting. Depending on the distribution of surface light, patterns, and contrast, either AGC or AEC may conclude you're in a much all-white or black room, which can wash out your features in the opposite "color." When you're trying to take an interior picture in front of an exterior window with bright daylight behind, you adjust exposure so you can see detail outside; everything on the interior is underexposed and black. Or if set for inside, everything outside is now overexposed and all white.

Spotlights in a room (even overhead) in the tracking cameras' view can sometimes be culprits, which can confuse the AEC/AGC of the tracking cameras. Flat/diffused lighting would help.

## Cloud Services & Azure FAQ

### How can [Microsoft Azure](https://azure.microsoft.com/services/kinect-dk/) help my business scale?

Azure-based onsite and remote management can help your business be data-driven, reduce operational costs, and scale deployment across existing and new locations. Azure cloud services such as [Azure Storage](/azure/storage/common/storage-introduction), [Azure Functions](/azure/azure-functions/functions-overview), [App Service](/azure/app-service/overview), [Azure Networking](https://azure.microsoft.com/product-categories/networking/), and [IoT Hub](https://azure.microsoft.com/services/iot-hub/) can help with the following use cases:

* Remote Device Deployment & Management
* Real-Time Onsite Analytics
* Intelligent Adaptable LBE Gameplay
* LBE Content Streaming and Deployment
* LBE Player Preference Heatmap
* LBE Reservation and Booking System

### I'm developing a spatial MMOG to deploy over a massive footprint. Any services that help me manage my content and object persistence?

Azure Spatial Anchors is a new Mixed Reality service that enables multi-user, spatially aware mixed reality experiences across HoloLens, iOS, and Android devices. Learn more about [Azure Spatial Anchors](https://azure.microsoft.com/services/spatial-anchors/).

## Support and community

We have a few helpful resources to help you engage with subject matter experts on our team, get troubleshooting support, and contribute to the broader mixed reality dev community.

If you run into issues with any publicly released features, file a bug using Feedback Hub. For guidance, refer to this page.

For other troubleshooting help with WMR, file a support request with our customer support team.

Join our HoloDevelopers Slack channel to engage with the mixed reality developers and subject matter experts: [aka.ms/holodevelopers](https://aka.ms/holodevelopers).

**Twitter**: Follow our Mixed Reality Developer Relations team for news, events, and updates @MxdRealityDev

If you happen to be in or around San Francisco, there's always something going on at the Microsoft Reactor.
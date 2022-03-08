---
title: Windows Mixed Reality PC compatibility guidelines
description: Overview chart outlining the minimum PC system requirements for compatibility with Windows Mixed Reality.
author: qianw211
ms.author: qianwen
ms.date: 09/22/2021
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Ultra, compatible, compatibility, system requirements, PC
appliesto:
    - Windows 10 and Windows 11
---

# Windows Mixed Reality minimum PC hardware compatibility guidelines

![PC compatibility hero image](images/pc-comp-hero.png)

## Features and experiences

Windows 10 and Windows 11 powers Windows Mixed Reality on variety of headsets across a diverse set of PC hardware.  The power of your PC will determine what experiences you can have.
With higher end PCs, you get some extra capabilities and features:

* Crisper visuals and a higher refresh rate.
* More apps and experiences—including the most graphics-intensive games.
* A ‘’mirror’’ window on your desktop that shows what you see in mixed reality.
* Record and share videos and photos of your mixed reality experiences.

## Minimum PC hardware guidelines

See if your PC can run Windows Mixed Reality by reviewing the hardware guidelines below and running the [Mixed Reality Portal](https://www.microsoft.com/store/apps/9NG1H8B3ZC7M) app.

Remember, your performance will vary depending on your exact setup. You'll also need to make sure your PC has the [right ports](recommended-adapters-for-windows-mixed-reality-capable-pcs.md) for the Windows Mixed Reality immersive headset that you're using.

>[!NOTE]
>Guidelines for development PCs are higher than those for consumers' PCs running mixed reality apps. If you're a mixed reality developer, [see recommended development PC specifications](https://developer.microsoft.com/en-us/windows/mixed-reality/install_the_tools#immersive_headset_development).

## Mixed Reality Portal app

[Mixed Reality Portal](https://www.microsoft.com/store/productid/9ng1h8b3zc7m) is the best way to make sure your PC is ready to run Windows Mixed Reality.

After running the app, you'll get one of the following messages:

* **You're good to go.**  Your PC is ready to run mixed reality games and experiences.
* **Supports some features.** Your PC can run some mixed reality experiences.
* **Can't run mixed reality.** This PC doesn't meet the minimum requirements needed to run Windows Mixed Reality.

You'll then get an analysis of your PC against the required hardware, drivers, and operating system.
![Screenshot of Windows Mixed Reality PC Check](images/screenshot-mr-pc-check.jpg)

| Icon | What it means |
| --- | --- |
| <img alt="Succeeded" width="30" height="30" src="images/glyph-succeeded.png" /> | Your PC passes the required item. |
| <img alt="Warning" width="30" height="30" src="images/glyph-warning.png" /> | There may be issues with your PC for the given requirement. If you come across issues, you may need to troubleshoot or upgrade your PC. 
| <img alt="Error" width="30" height="30" src="images/glyph-error.png" /> | Your PC doesn't meet the requirements for the specified item. |

 [Get help with Mixed Reality Portal results](get-help-with-pc-compatibility.md)

## Compatibility guidelines

> [!IMPORTANT]
> We will be updating, making additions to and may be revising these Windows Mixed Reality PC Compatibility Guidelines. Please check back regularly for the latest guidelines and requirements.

### High Resolution Headset Requirements

Because of the higher resolution, the following requirements apply to the HP Reverb G1, G2 and Omnicept product lines to ensure optimal 90 Hz, full resolution experience:

- Intel Core i5, i7, Intel Xeon E3-1240 v5, equivalent or better. AMD Ryzen 5 equivalent or better.  
- NVIDIA GeForce GTX 1080, AMD Radeon RX 5700, equivalent or better  
- Memory: 8 GB RAM or more  
- 1x Display Port 1.3  
- 1x USB 3.0 Type-C with power delivery (or included power adapter) 
- Windows 10 May 2019 update or later  
 
**All Other WMR Compatible Headsets** <br>
For all other HMDs, refer to the following requirements:

| | Windows Mixed Reality 90Hz PCs | Windows Mixed Reality 60Hz PCs |
| --- | --- | --- |
| Operating System | Windows 10 Fall Creators Update (RS3) or later - Home, Pro, Business, Education. <br/>    (<b>Note</b>: Not supported on N versions or Windows 10 Pro in S Mode) |
| Processor | Intel Core i5 4590 (4th generation), quad-core (or better) <br> AMD Ryzen 5 1400 3.4Ghz (desktop), quad-core (or better) | Intel Core i5 7200U (7th generation mobile), dual-core with Intel Hyper-Threading Technology enabled (or better) <br> AMD Ryzen 5 1400 3.4Ghz (desktop), quad-core (or better) |
| RAM | 8 GB DDR3 (or better) | 8 GB DDR3 dual channel (or better) |
| Free disk space | At least 10 GB | At least 10 GB |
| Graphics Card| <ul> <li>NVIDIA GTX 1060 (or greater) DX12-capable discrete GPU </li> <li>AMD RX 470/570 (or greater) DX12-capable discrete GPU </li> </ul> <br> <b>Note:</b> GPU must be hosted in a PCIe 3.0 x4+ Link slot |  <ul>  <li>Integrated Intel HD Graphics 620 (or greater) DX12-capable integrated GPU <a href="https://en.wikipedia.org/wiki/List_of_Intel_graphics_processing_units">(check if your model is greater)</a></li> <li>NVIDIA MX150 (or greater) discrete GPU</li> <li>Nvidia GeForce GTX 1050 discrete GPU</li> <li>Nvidia 965M discrete GPU</li> <li>AMD Radeon RX 460/560</li> </ul> <b>Note:</b> Older Intel GPUs such as HD Graphics 4xx, 5xx, 2xxx, 3xxx, 4xxx, 5xxx, and 6xxx aren't supported. |
| Graphics Driver | Windows Display Driver Model (WDDM) 2.2 |  |
| [Graphics display port](Recommended-adapters-for-Windows-Mixed-Reality-Capable-PCs.md) | HDMI 2.0 or DisplayPort 1.2 | HDMI 1.4 or DisplayPort 1.2 |
| Display | Connected external or integrated VGA (800x600) display (or better) | 
| [USB connectivity](Recommended-adapters-for-Windows-Mixed-Reality-Capable-PCs.md) | USB 3.0 | |
| Bluetooth connectivity (for [motion controllers](controllers-in-wmr.md) | Bluetooth 4.0 | |
| Expected headset framerate | 90 Hz | 60 Hz |
| Power | USB 3.0 ports | USB 3.0 ports |

**Additional information:**

* Larger laptops with screens of at least 15" do the best.
* Hybrid graphics configurations are compatible only with Windows Mixed Reality 90Hz. The discrete graphics adapter in any hybrid configuration must meet all the requirements listed in the Windows Mixed Reality guidelines for discrete graphics adapters.
* If you have a discrete graphics card that should run Windows Mixed Reality 90Hz, but it's defaulting to a 60Hz (60 frames per second) refresh rate, use a full-size DisplayPort to HDMI 2.0 adapter to plug in your headset and enable a 90Hz refresh rate.
* Different headsets may require different hardware ports, so make sure your PC has the correct ports or [necessary adapters](Recommended-adapters-for-Windows-Mixed-Reality-Capable-PCs.md) to connect to your headset.

>[!NOTE]
>Discrete and integrated graphics hardware that don't meet the minimum confirmed specifications have not been tested, confirmed, or optimized for Windows Mixed Reality and may not function properly or at all.

## Windows Mixed Reality and Surface

For the best Windows Mixed Reality experience on a Surface device, we recommend the latest SurfaceBook (15”) configured with at least the NVIDIA GeForce GTX 1060 GB and 16 GB of RAM.  This configuration supports all Windows Mixed Reality features and has been tested for Windows Mixed Reality.  The latest Surface Book (13.5”), Surface Studio, Surface Laptop, and Surface Pro (2017) will all support some Windows Mixed Reality features when configured with an Intel Core i5 CPU (or better) and at least 8 GB of RAM.

**Requirements:**

* Surface products require driver updates to be compatible with Windows Mixed Reality. These drivers can be installed on your Surface by going to **Settings > Update and Security > Check for Updates**.
* Surface products require an [adapter](Recommended-adapters-for-Windows-Mixed-Reality-Capable-PCs.md) from the video port (Mini DisplayPort or USB-C, depending on the Surface PC) to HDMI 2.0 for Windows Mixed Reality headsets. The most recent version of the Surface Mini-DisplayPort to HDMI AV Adapter is compatible with HDMI 2.0 (the older version isn't). Similarly, the <a href="https://www.microsoft.com/en-us/store/d/surface-usb-c-to-hdmi-adapter/94chb2m80s54/4gj5">Surface USB-C to HDMI Adapter</a> is also compatible with HDMI 2.0.

## See also

* [Ask the community](https://answers.microsoft.com)
* [Contact us for support](https://support.microsoft.com/contactus/)
* [Recommended adapters for Windows Mixed Reality capable PCs](recommended-adapters-for-windows-mixed-reality-capable-pcs.md)

---
title: Minimum PC hardware guidlines
description: Overview chart outlining the minimum PC system requirements for compatibility with Windows Mixed Reality.
author: qianw211
ms.author: qianwen
ms.date: 11/22/2022
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Ultra, compatible, compatibility, system requirements, PC
appliesto:
    - Windows 10 and Windows 11
---

# Minimum PC hardware guidelines

![PC compatibility hero image](images/pc-comp-hero.png)

## Features and experiences

Windows 10 and Windows 11 powers Windows Mixed Reality on various supported headsets across a diverse set of PC hardware configurations.  The specs and capabilities of your PC will determine what experiences you're capable of running. On high-end PCs, some extra capabilities and features are enabled:

* Crisper visuals and a higher refresh rate.
* Run more apps and experiences—including the most visually astounding games.
* "Mirror" what you see in mixed reality on your desktop.
* Record and share videos and photos of your mixed reality experiences.

## Minimum PC hardware guidelines

To better understand if your PC can run Windows Mixed Reality, download and install the [Mixed Reality Portal](https://apps.microsoft.com/store/detail/mixed-reality-portal/9NG1H8B3ZC7M) app and refer to the hardware guidelines below.

Remember, your experience will vary depending on your unique PC configuration. Additionally, you'll also need to make sure your PC has the [right ports](recommended-adapters-for-windows-mixed-reality-capable-pcs.md) for the Windows Mixed Reality immersive headset that you're using.

>[!NOTE]
>Guidelines for development PCs are higher than those for consumer PCs running mixed reality apps. If you're a mixed reality developer, see the [Introduction to mixed reality development](/windows/mixed-reality/develop/development).

## Mixed Reality Portal app

[Mixed Reality Portal](https://www.microsoft.com/store/productid/9ng1h8b3zc7m) is the best way to make sure your PC is ready to run Windows Mixed Reality.

When initially running the app, you'll receive an analysis of your PC against the required hardware, drivers, and operating system:

* **You're good to go.**  Your PC is ready to run Windows Mixed Reality and most mixed reality experiences.
* **Supports some features.** Your PC is ready to run Windows Mixed Reality, though some features and experiences may not be supported.
* **Can't run mixed reality.** Your PC doesn't meet the minimum requirements needed to run Windows Mixed Reality.

![Screenshot of Windows Mixed Reality PC Check](images/screenshot-mr-pc-check.jpg)

| Icon | Description |
| --- | --- |
| <img alt="Succeeded" width="30" height="30" src="images/glyph-succeeded.png" /> | Your PC passes the required system check. |
| <img alt="Warning" width="30" height="30" src="images/glyph-warning.png" /> | There may be issues with your PC for the required system check and additional troubleshooting or PC upgrades may be required. |
| <img alt="Error" width="30" height="30" src="images/glyph-error.png" /> | Your PC doesn't pass the required system check. |

 [Get help with Mixed Reality Portal results](get-help-with-pc-compatibility.md)

## Compatibility guidelines

> [!IMPORTANT]
> We will be updating, making additions to and may be revising these Windows Mixed Reality PC Compatibility Guidelines. Please check back regularly for the latest guidelines and requirements.

### High Resolution Headset Requirements

Because of the higher resolution capabilities of certain headsets like the [HP Reverb G2](https://www.hp.com/us-en/vr/reverb-g2-vr-headset.html) and [HP Reverb G2 Omnicept Edition](https://www.hp.com/us-en/vr/reverb-g2-vr-headset-omnicept-edition.html), the following system requirements must be met or exceeded to ensure optimal 90 Hz, full resolution experience:

- Intel Core i5, i7, Intel Xeon E3-1240 v5, equivalent or better. 
- AMD Ryzen 5 equivalent or better.  
- NVIDIA GeForce GTX 1080, AMD Radeon RX 5700, equivalent or better  
- 8-GB RAM or more  
- 1x Display Port 1.3  
- 1x USB 3.0 Type-C with power delivery (or included power adapter) 
- [Windows 10 Version 20H2 or later](before-you-start.md#make-sure-you-have-windows-10-version-20h2-or-newer-installed)
 
**All Other WMR Compatible Headsets** <br>
For all other HMDs, refer to the following requirements:

|Component| Windows Mixed Reality 90 Hz PCs | Windows Mixed Reality 60 Hz PCs |
| --- | --- | --- |
| Operating System | [Windows 10 Version 20H2 or later](before-you-start.md#make-sure-you-have-windows-10-version-20h2-or-newer-installed) - Home, Pro, Business, or Education. <br/>    **Note**: Not supported on N versions or Windows 10 Pro in S Mode. | [Windows 10 Version 20H2 or later](before-you-start.md#make-sure-you-have-windows-10-version-20h2-or-newer-installed) - Home, Pro, Business, or Education. <br/>   **Note**: Not supported on N versions or Windows 10 Pro in S Mode. |
| Processor | <ul> <li> Intel Core i5 4590 (4th generation), quad-core (or better) </li> <li> AMD Ryzen 5 1400 3.4Ghz (desktop), quad-core (or better) </li> </ul> | <ul> <li> Intel Core i5 7200U (7th generation mobile), dual-core with Intel Hyper-Threading Technology enabled (or better) </li> <li> AMD Ryzen 5 1400 3.4Ghz (desktop), quad-core (or better) </li> </ul> |
| RAM | 8 GB DDR3 (or better) | 8 GB DDR3 dual channel (or better) |
| Free disk space | At least 10 GB | At least 10 GB |
| Graphics Card| <ul> <li>NVIDIA GTX 1060 (or greater) DX12-capable discrete GPU </li> <li>AMD RX 470/570 (or greater) DX12-capable discrete GPU </li> </ul> <br> <b>Note:</b> GPU must be hosted in a PCIe 3.0 x4+ Link slot |  <ul>  <li>Integrated Intel HD Graphics 620 (or greater) DX12-capable integrated GPU <a href="https://en.wikipedia.org/wiki/List_of_Intel_graphics_processing_units">(check if your model is greater)</a></li> <li>NVIDIA MX150 (or greater) discrete GPU</li> <li>Nvidia GeForce GTX 1050 discrete GPU</li> <li>Nvidia 965M discrete GPU</li> <li>AMD Radeon RX 460/560</li> </ul> **Note**: Older Intel GPUs such as HD Graphics 4xx, 5xx, 2xxx, 3xxx, 4xxx, 5xxx, and 6xxx aren't supported. |
| Graphics Driver | Windows Display Driver Model (WDDM) 2.2 | Windows Display Driver Model (WDDM) 2.2  |
| [Graphics display port](Recommended-adapters-for-Windows-Mixed-Reality-Capable-PCs.md) | HDMI 2.0 or DisplayPort 1.2 | HDMI 1.4 or DisplayPort 1.2 |
| Display | Connected external or integrated VGA (800x600) display (or better) | Connected external or integrated VGA (800x600) display (or better) |
| [USB connectivity](Recommended-adapters-for-Windows-Mixed-Reality-Capable-PCs.md) | USB 3.0 | USB 3.0 |
| Bluetooth connectivity (for [motion controllers](controllers-in-wmr.md) | Bluetooth 4.0 | Bluetooth 4.0 |
| Expected headset framerate | 90 Hz | 60 Hz |
| Power | USB 3.0 ports | USB 3.0 ports |

**Additional information:**

* Larger laptops with screens of at least 15" perform the best.
* Hybrid graphics configurations are compatible only with Windows Mixed Reality 90 Hz. The discrete graphics adapter in any hybrid configuration must meet all the requirements listed in the Windows Mixed Reality guidelines for discrete graphics adapters.
* If you have a discrete graphics card that should run Windows Mixed Reality 90Hz, but it's defaulting to a 60Hz (60 frames per second) refresh rate, use a full-size DisplayPort to HDMI 2.0 adapter to plug in your headset and enable a 90-Hz refresh rate.
* Different headsets may require different hardware ports, so make sure your PC has the correct ports or [necessary adapters](Recommended-adapters-for-Windows-Mixed-Reality-Capable-PCs.md) to connect to your headset.

>[!NOTE]
>Discrete and integrated graphics hardware that doesn't meet the minimum confirmed specifications have not been tested, confirmed, or optimized for Windows Mixed Reality and may not function properly or at all.

## Get help with PC compatibility

Microsoft Surface devices aren't officially supported by Windows Mixed Reality at this time and aren't recommended for use with Windows Mixed Reality headsets. 

## See also

* [Get help with PC compatibility](get-help-with-pc-compatibility.md)
* [Troubleshooting Windows Mixed Reality](troubleshooting-windows-mixed-reality.md)
* [Recommended adaptors](recommended-adapters-for-windows-mixed-reality-capable-pcs.md)

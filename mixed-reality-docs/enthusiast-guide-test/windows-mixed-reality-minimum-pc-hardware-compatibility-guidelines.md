---
title: Windows Mixed Reality minimum PC hardware compatibility guidelines
description: Chart outlining the minimum PC system requirements for compatibility with Windows Mixed Reality.
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Ultra, compatible, compatibility, system requirements, PC
---


# Minimum PC hardware guidelines

For the best experience with Windows Mixed Reality, start with a new [Windows Mixed Reality-ready PC](https://support.microsoft.com/en-us/help/4039260/windows-10-mixed-reality-pc-hardware-guidelines) or a Windows Mixed Reality-compatible PC that can provide Windows Mixed Reality Ultra experiences. Windows Mixed Reality Ultra provides crisper visuals at higher refresh rates, more apps and experiences including the most graphics-intensive games, mirroring of your Windows Mixed Reality experience on your desktop and the ability to record and share (photo and video) your experiences with others. 

To see if your PC can run Windows Mixed Reality review the hardware guidelines below and run the [Mixed Reality Portal App](https://www.microsoft.com/store/apps/9NG1H8B3ZC7M).

Remember, your performance will vary depending on your exact setup. You'll also need to make sure your PC has the [right ports](recommended-adapters-for-windows-mixed-reality-capable-pcs.md) for the Windows Mixed Reality immersive headset that you are using.

>[!NOTE]
>Guidelines for development PCs are higher than those for consumers' PCs running mixed reality apps. If you're a mixed reality developer, [see recommended development PC specifications](https://developer.microsoft.com/en-us/windows/mixed-reality/install_the_tools#immersive_headset_development).



## Mixed Reality Portal app

Mixed Reality Portal is the best way to make sure your PC is ready to run Windows Mixed Reality. 

<a href="https://www.microsoft.com/store/productid/9ng1h8b3zc7m"><img alt="Download Mixed Reality Portal" src="images/WMR-PC-Check-app.png"/></a>

After running the app, you'll get one of the following messages:
* **You're good to go.** Your PC has what it takes to run Windows Mixed Reality.
* **Supports some features.** This PC may be able to run Windows Mixed Reality, but some features might be limited.
* **Can't run mixed reality.** This PC doesn't meet the minimum requirements needed to run Windows Mixed Reality.

You will then get an analysis of your PC against the required hardware, drivers, and operating system.
![Screenshot of Windows Mixed Reality PC Check](images/screenshot-mr-pc-check.jpg) 

<table>
<tr>
<th>Icon</th><th>What it means</th>
</tr><tr>
<td> <img alt="Succeeded" width="30" height="30" src="images/glyph-succeeded.png" /></td><td style="vertical-align: middle">Your PC passes the required item.</td>
</tr><tr>
<td> <img alt="Warning" width="30" height="30" src="images/glyph-warning.png" /></td><td style="vertical-align: middle">There may be issues with your PC for the given requirement. If you encounter issues, you may need to troubleshoot or upgrade your PC.</td>
</tr><tr>
<td> <img alt="Error" width="30" height="30" src="images/glyph-error.png" /></td><td style="vertical-align: middle">Your PC does not meet the requirements for the specified item.</td>
</tr>
</table>

 [Get help with Mixed Reality Portal results](https://support.microsoft.com/en-us/help/4045777/windows-10-get-help-with-pc-compatibility-in-windows-mixed-reality)

## Compatibility guidelines
> [!IMPORTANT]
> We will be updating, making additions to and may be revising these Windows Mixed Reality PC Compatibility Guidelines. Please check back regularly for the latest guidelines and requirements.

**HP Reverb Compatible Specs**<br>
Due to the higher resolution, the following requirements apply to the HP Reverb G1 & G2 product lines to ensure optimal 90Hz, full resolution experience: 

<ul>
<li> Intel Core i5, i7, Intel Xenon E3-1240 v5, equivalent or better. AMD Ryzen 5 equivalent or better. </li>
<li> NVIDIA GeForce GTX 1080, AMD Radeon RX 5700, equivalent or better </li> 
<li> Memory: 8 GB RAM or more </li> 
<li> 1x Display Port 1.3 </li> 
<li> 1x USB 3.0 Type-C with power delivery (or included power adapter)</li>
<li> Windows 10 May 2019 update or later </li>
</ul>

**All Other WMR Compatible Headsets** <br>
For all other HMD's, please refer to the following requirements: 

<table>
<tr>
    <th style="width:10%"></th><th style="vertical-align: middle; text-align: center; width:30%">Windows Mixed Reality Ultra PCs</th>
    <th style="vertical-align: middle; text-align: center; width:30%">Windows Mixed Reality PCs</th>
</tr><tr>
    <td style="vertical-align: middle">Operating System</td><td colspan="2" style="vertical-align: middle; text-align: center;">Windows 10 Fall Creators Update (RS3) or later - Home, Pro, Business, Education.<br/>    (<b>Note</b>: Not supported on N versions or Windows 10 Pro in S Mode)</td>
</tr><tr>
    <td style="vertical-align: middle">Processor</td>
    <td style="vertical-align: middle; text-align: center;">Intel Core i5 4590 (4th generation), quad-core (or better) <br>AMD Ryzen 5 1400 3.4Ghz (desktop), quad-core (or better)</td>
    <td style="vertical-align: middle; text-align: center;">Intel Core i5 7200U (7th generation mobile), dual-core with Intel Hyper-Threading Technology enabled (or better)</td>
</tr><tr>
    <td style="vertical-align: middle">RAM</td>
    <td style="vertical-align: middle; text-align: center;">8GB DDR3 (or better)</td>
    <td style="vertical-align: middle; text-align: center;">8GB DDR3 dual channel (or better)</td>
</tr><tr>
    <td style="vertical-align: middle">Free disk space</td>
    <td colspan="3" style="vertical-align: middle; text-align: center;">At least 10 GB</td>
</tr><tr>
    <td style="vertical-align: middle">Graphics Card</td>
    <td style="vertical-align: middle; text-align: middle;">
            <ul> 
            <li>NVIDIA GTX 1060 (or greater) DX12-capable discrete GPU</li>
            <li>AMD RX 470/570 (or greater) DX12-capable discrete GPU </li>
            </ul>     
            <b>Note:</b> GPU must be hosted in a PCIe 3.0 x4+ Link slot
    </td>
    <td style="vertical-align: middle; text-align: middle;">
            <li>Integrated Intel HD Graphics 620 (or greater) DX12-capable integrated GPU <a href="https://en.wikipedia.org/wiki/List_of_Intel_graphics_processing_units">(check if your model is greater)</a></li>
        <li>NVIDIA MX150 (or greater) discrete GPU</li>
        <li>965M (or greater) DX12-capable discrete GPU</li>
        <li>AMD Radeon RX 460/560</li>
    </td>
</tr><tr>
    <td style="vertical-align: middle">Graphics Driver</td>
    <td colspan="3" td style="vertical-align: middle; text-align: center;">Windows Display Driver Model (WDDM) 2.2</td>
</tr><tr>
    <td style="vertical-align: middle"><a href="Recommended-adapters-for-Windows-Mixed-Reality-Capable-PCs.md">Graphics display port</a></td>
    <td style="vertical-align: middle; text-align: center;">HDMI 2.0 or DisplayPort 1.2</td>
    <td style="vertical-align: middle; text-align: center;">HDMI 1.4 or DisplayPort 1.2</td>
</tr><tr>
    <td style="vertical-align: middle">Display</td>
    <td colspan="3" style="vertical-align: middle; text-align: center;">Connected external or integrated VGA (800x600) display (or better)</td>
</tr><tr>
    <td style="vertical-align: middle"><a href="Recommended-adapters-for-Windows-Mixed-Reality-Capable-PCs.md">USB connectivity</a></td>
    <td colspan="2" style="vertical-align: middle; text-align: center;">USB 3.0 Type-A </td>
</tr><tr>
    <td style="vertical-align: middle">Bluetooth connectivity (for <a href="Motion-controllers.md">motion controllers</a>)</td>
    <td colspan="3" style="vertical-align: middle; text-align: center;">Bluetooth 4.0</td>
</tr><tr>
    <td style="vertical-align: middle">Expected headset framerate</td>
    <td style="vertical-align: middle; text-align: center;">90 Hz</td>
    <td style="vertical-align: middle; text-align: center;">60 Hz</td>
</tr>
<tr>
    <td style="vertical-align: middle">Power</td>
    <td style="vertical-align: middle; text-align: center;">USB 3.0 (Type A) ports</td>
    <td style="vertical-align: middle; text-align: center;">USB 3.0 (Type A) ports</td>
</tr>
</table>



**Additional information:**
* Larger laptops (with screens of at least 15") perform best.
* Hybrid graphics configurations are compatible only with a Windows Mixed Reality Ultra setup. The hybrid system’s discrete card must meet the same specifications listed for Windows Mixed Reality Ultra above.
* Different headsets may require different hardware ports, so make sure your PC has the correct ports or [necessary adapters](Recommended-adapters-for-Windows-Mixed-Reality-Capable-PCs.md) to connect to your headset.

>[!NOTE]
>Discrete and integrated graphics hardware that don't meet the minimum confirmed specifications have not been tested, confirmed, or optimized for Windows Mixed Reality and may not function properly or at all.

## Windows Mixed Reality and Surface

For the best Windows Mixed Reality experience on a Surface device, we recommend the SurfaceBook 2 (15”) configured with the NVIDIA GeForce GTX 1060 and 16GB of RAM.  This configuration supports all Windows Mixed Reality features @ 90Hz and has been tested and badged for Windows Mixed Reality Ultra.  The Surface Book 2 (13”), Surface Studio, Surface Laptop and Surface Pro (2017) will all support some Windows Mixed Reality features when configured with an Intel Core i5 CPU (or better) and at least 8GB of RAM.

**Requirements:**
* Surface products require driver updates to be compatible with Windows Mixed Reality. These drivers can be installed on your Surface by going to **Settings > Update and Security > Check for Updates**.
* Surface products require an [adapter](Recommended-adapters-for-Windows-Mixed-Reality-Capable-PCs.md) from the video port (Mini DisplayPort or USB-C, depending on the Surface PC) to HDMI 2.0 for Windows Mixed Reality headsets. The most recent version of the Surface Mini-DisplayPort to HDMI AV Adapter is compatible with HDMI 2.0 (the older version is not). Similarly, the <a href="https://www.microsoft.com/en-us/store/d/surface-usb-c-to-hdmi-adapter/94chb2m80s54/4gj5">Surface USB-C to HDMI Adapter</a> is also compatible with HDMI 2.0.

>[!WARNING]
>Not all Mini DisplayPort or USB-C to HDMI adapters are HDMI 2.0-capable. Consider checking for explicit “HDMI 2.0” compatibility or “4K” compatibility on any adapter.

More information on Surface compatibility with Windows Mixed Reality is available in the table below:

<table>
    <tr>
        <th> Surface Device </th><th> Windows Mixed Reality Feature Support? </th><th> Recommended configuration </th><th> Notes</th>
    </tr>
    <tr>
        <td style="vertical-align: middle"> Surface Pro (original)/ Surface Pro 2 </td><td style="vertical-align: middle"> None </td><td> </td><td></td>
    </tr>
    <tr>
        <td style="vertical-align: middle"> Surface Pro 3 </td><td style="vertical-align: middle"> None </td><td> </td><td></td>
    </tr>
 (with Windows 10 Pro installed) <tr>
        <td style="vertical-align: middle"> Surface Pro 4 </td><td style="vertical-align: middle"> None </td><td> </td><td></td>
    </tr>
    <tr>
        <td style="vertical-align: middle"> Surface 3 </td><td style="vertical-align: middle"> None </td><td> </td><td></td>
    </tr>
    <tr>
        <td style="vertical-align: middle"> Surface Book </td><td style="vertical-align: middle"> None </td><td> </td><td></td>
    </tr>
    <tr>
        <td style="vertical-align: middle"> Surface Book with Performance Base </td><td style="vertical-align: middle"> None </td><td> </td><td></td>
    </tr>
    <tr>
        <td style="vertical-align: middle"> Surface Go </td><td style="vertical-align: middle"> None </td><td> </td><td></td>
    </tr>
<tr>
        <td style="vertical-align: middle"> Surface Book 2 (15&quot;) </td><td style="vertical-align: middle"> Full </td><td style="vertical-align: middle"> Intel Core i7/NVIDIA GTX 1060/16GB of RAM </td>
        <td>
            <ul>
                <li><b>RECOMMENDED</b>: For the best Windows Mixed Reality experience on a Surface Device, we recommend the SurfaceBook 2 15” configured with the NVIDIA GeForce GTX 1060 and 16GB of RAM.  This configuration is tested and Badged as Windows Mixed Reality Ultra so will support All Windows Mixed Reality Features and will allow you to enjoy the widest array of compatible apps and games.</li>
                <li>The NVIDIA GeForce GTX 1060 discrete GPU will provide a Windows Mixed Reality Ultra @ 90Hz experience</li><br/>                <li>For best performance, please use the Nvidia graphics drivers specifically released for Surface Book 2. Newer drivers may be available on Nvidia&#39;s website, but are untested.</li><br/>                <li>Requires <a href="https://www.microsoft.com/en-us/store/d/surface-usb-c-to-hdmi-adapter/94chb2m80s54/4gj5">Surface USB-C to HDMI Adapter</a> (other adapters may work, but are untested)</li>
                <li><b>Note on Surface Dock</b>: The use of Surface Dock with Surface Book 2 is not officially supported with Windows Mixed Reality, due to Surface Dock’s power supply limitations.</li><br/>                <li><b>Note on Windows 10 Version 1803</b>: If you&#39;re running Windows 10 Version 1803, please make sure you&#39;re on OS build 17134.137 or newer (installed by KB4284848) to ensure that you have the latest performance fixes. For more information, please see the release notes for <a href="https://support.microsoft.com/en-us/help/4284848/windows-10-update-kb4284848">KB4284848</a>.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td style="vertical-align: middle"> Surface Book 2 (13.5&quot;) </td><td style="vertical-align: middle"> Partial </td><td style="vertical-align: middle"> Intel Core i7/NVIDIA GTX 1050/16GB of RAM </td>
        <td>
            <ul>
                <li><b>NOTE</b>: The Surface Book 2 (13”) is not badged for Windows Mixed Reality but will support some Windows Mixed Reality Features allowing you to use a limited number of compatible apps and games.  Performance will depend on your configuration.</li>
                <li>Configurations with an Intel Core i5 /Intel HD Graphics 620 integrated GPU will provide a Windows Mixed Reality @ 60Hz experience</li>
                <li>Configurations with an Intel Core i7/NVIDIA GeForce GTX 1050 discrete GPU will provide a Windows Mixed Reality @ 90Hz experience</li>                       <li>For best performance, please use the Nvidia graphics drivers specifically released for Surface Book 2. Newer drivers may be available on Nvidia&#39;s website, but are untested.</li>
                <li>Requires <a href="https://www.microsoft.com/en-us/store/d/surface-usb-c-to-hdmi-adapter/94chb2m80s54/4gj5">Surface USB-C to HDMI Adapter</a> (other adapters may work, but are untested)</li>
                <li><b>Note on Surface Dock</b>: The use of Surface Dock with Surface Book 2 is not officially supported with Windows Mixed Reality, due to Surface Dock’s power supply limitations.</li>
                <li><b>Note on Windows 10 Version 1803</b>: If you&#39;re running Windows 10 Version 1803, please make sure you&#39;re on OS build 17134.137 or newer (installed by KB4284848) to ensure that you have the latest performance fixes. For more information, please see the release notes for <a href="https://support.microsoft.com/en-us/help/4284848/windows-10-update-kb4284848">KB4284848</a>.</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td style="vertical-align: middle"> Surface Studio </td><td style="vertical-align: middle"> Partial </td><td style="vertical-align: middle"> Intel Core i7/ NVIDIA GeForce GTX 980m/16GB of RAM </td>
        <td>
            <ul>
                <li><b>NOTE</b>: The Surface Studio is not badged for Windows Mixed Reality but will support some Windows Mixed Reality Features allowing you to use a limited number of compatible apps and games.  Performance will depend on your configuration.</li>
                <li>Configurations with NVIDIA GeForce GTX 965m will provide a Windows Mixed Reality  @ 60Hz experience.</li>
                <li>Configurations with NVIDIA GeForce GTX 980m will provide a Windows Mixed Reality @ 90Hz experience.</li>
                <li>Surface Mini DisplayPort to HDMI 2.0 Adapter (other adapters may work, but are untested)</li>
                <li>Windows Mixed Reality headset must be connected to USB port with “+” symbol</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td style="vertical-align: middle"> Surface Pro (2017) </td><td style="vertical-align: middle"> Partial </td><td style="vertical-align: middle"> Intel Core i7/ Intel® Iris™ Plus Graphics 640/16GB of RAM </td>
        <td>
            <ul>
                <li><b>NOTE</b>: The Surface Pro (2017) is not badged for Windows Mixed Reality but will support some Windows Mixed Reality Features allowing you to use a limited number of compatible apps and games.  Performance will depend on your configuration.</li>
                <li>Configurations with an Intel Core M3/Intel HD Graphics 615 integrated GPU is <b>Not Supported</b></li>
                <li>Configurations with an Intel Core i5 /Intel HD Graphics 620 integrated GPU will provide a Windows Mixed Reality @ 60Hz experience</li>
                <li>Configurations with an Intel Core i7/ Intel® Iris™ Plus Graphics 640 integrated GPU will provide a Windows Mixed Reality @ 60Hz experience</li><br/><li>Requires Surface Mini DisplayPort to HDMI 2.0 Adapter (other adapters may work, but are untested)</li>
                <li>Requires <a href="https://support.microsoft.com/en-us/help/4023450/surface-surface-battery-and-power">Performance Slider</a> set to “Best Performance” during usage</li>
            </ul>
        </td>
    </tr><br/>    <tr>
        <td style="vertical-align: middle"> Surface Laptop </td><td style="vertical-align: middle"> Partial </td><td style="vertical-align: middle"> Intel Core i7/ Intel® Iris™ Plus Graphics 640/16GB of RAM </td>
        <td>
            <ul>
                <li><b>NOTE</b>: The Surface Laptop is not badged for Windows Mixed Reality but will support some Windows Mixed Reality Features allowing you to use a limited number of compatible apps and games.  Performance will depend on your configuration.</li>
                <li>Configurations with an Intel Core M3/Intel HD Graphics 615 integrated GPU is <b>Not Supported</b></li>
                <li>Configurations with an Intel Core i5 /Intel HD Graphics 620 integrated GPU will provide a Windows Mixed Reality @ 60Hz experience</li>
                <li>Configurations with an Intel Core i7/ Intel® Iris™ Plus Graphics 640 integrated GPU will provide a Windows Mixed Reality @ 60Hz experience</li><br/><li>Requires Surface Mini DisplayPort to HDMI 2.0 Adapter (other adapters may work, but are untested)</li>
                <li>Requires <a href="https://support.microsoft.com/en-us/help/4023450/surface-surface-battery-and-power">Performance Slider</a> set to “Best Performance” during usage</li>
            </ul>
        </td>
    </tr>
</table>

## See also
* [Recommended adapters for Windows Mixed Reality capable PCs](recommended-adapters-for-windows-mixed-reality-capable-pcs.md)

---
title: Immersive hardware realted FAQ
description: Additional Windows Mixed Reality troubleshooting tips that go beyond our standard consumer support documentation.
author: qianw211
ms.author: qianwen
ms.date: 1/9/2023
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Troubleshoot, Errors, Help, Support, Uninstalling Windows Mixed Reality, Supported Languages
appliesto:
    - Windows 10
---

# Other questions

## My graphics driver isn't supported (I'm getting graphics driver failure errors).

Search for and run "dxdiag":

1.	If the result is “Basic Renderer”, the graphics driver isn't installed. To fix this:
    * Go to **Device Manager > Action > Scan for Hardware Changes**.
    * Use Windows Update to update the driver.
    * If this doesn't fix the problem, go to the manufacturer’s website and install the latest driver update. 
    * If an update isn't available for your GPU, WMR may not be supported on your device. If you think it should be, contact [support](https://support.microsoft.com).
2.	If you get a “WDDM 2.1” or lower version, the graphics driver is installed but it might not be the latest version. To get the latest version:
    * Use Windows Update to update the driver.
    * If that update doesn't fix the problem, go to the manufacturer’s website and install the latest driver update. 
    * If an update isn't available for your GPU, WMR may not be supported on your device. If you think it should be, contact [support](https://support.microsoft.com).

If Windows Mixed Reality setup says your graphics card doesn’t meet the requirements and you think it does, make sure your headset is plugged into the correct card.

## My Samsung Odyssey or Odyssey+ headset firmware update is stuck.

Samsung owns and publishes headset firmware updates delivered via their "Samsung HMD Odyssey Setup" and "Samsung HMD Odyssey+ Setup" device companion apps. For more details and for help with Samsung firmware update issues, contact Samsung customer service.

If the firmware update process is getting stuck, and there has been no progress for more than five minutes:

* Unplug all of your other USB devices temporarily and retry the firmware update.
* Connect your Samsung headset to a different USB 3.0 port on your PC.
* Disable or uninstall any software installed that may interfere with firmware updates, like Gigabyte's AORUS App Center.
* Use a different PC to update the Samsung headset firmware.

## How do I access my PC desktop in mixed reality?
Launch the Desktop app in the headset from **Windows Button > All apps > Desktop** to access your PC desktop in mixed reality.

## How can I see multiple monitors in Mixed Reality

By default, Desktop app automatically switches to display the monitor with focus. If you want to see all of your monitors in mixed reality:

* Select the monitor icon on the top-left corner of the app.
* Disable "Automatically Switch Monitor".
* Pick the monitor you want to see.
* Launch another instance of the Desktop app.
* Pick the monitor you want to see on that instance.
* Repeat for all of your physical monitors.
You'll have to reselect the monitor to show on each Desktop app every time you restart mixed reality.

## My Desktop app only shows a black screen

If your PC has a Nvidia hybrid GPU, the Nvidia device running the runtimebroker.exe on the discrete GPU instead of the integrated one may be the culprit. To fix this issue, follow these instructions under "[How do I create Optimus settings for a new program?](http://nvidia.custhelp.com/app/answers/detail/a_id/2615/~/how-do-i-customize-optimus-profiles-and-settings%3F)" to add C:\windows\system32\runtimebroker.exe and force it to run on the "Integrated graphics" processor. 

## My Wi-Fi slows down when I'm using Windows Mixed Reality.

If you're using a 2.4-GHz Wi-Fi connection, your motion controllers might slow down your Wi-Fi:

* Switch to a 5-GHz Wi-Fi connection, if one is available. [Learn more](https://support.microsoft.com/help/4000461).
* Use a separate Bluetooth adapter to connect your motion controllers to your PC. See [recommended adapters](https://support.microsoft.com/help/4039260/windows-10-mixed-reality-pc-hardware-guidelines).

## I got a message that said to plug in and charge my PC. Why?

If you're using a laptop, Windows Mixed Reality works best when the PC is both fully charged and plugged in.

## What is the Experience options setting? 

**Settings > Mixed reality > Headset display > Experience options** allows you to change the Windows Mixed Reality performance settings. This enables you to choose the best experience for your hardware configuration across a range of content. You have three experience options to choose from:

* Let Windows decide: this option enables Windows to assess the best experience option based on your current PC hardware configuration.
* Optimize for performance: this experience option ensures a more comfortable user experience, especially on PCs with integrated graphics.
* Best visual quality: this experience option ensures the highest quality visual experience, but may impact performance on lower-end PC hardware configurations.  

## What languages are supported in Windows Mixed Reality

Windows Mixed Reality is available in the following languages:

* Chinese Simplified (China)
* English (Australia)
* English (Canada)
* English (Great Britain)
* English (United States)
* French (Canada)
* French (France)
* German (Germany)
* Italian (Italy)
* Japanese (Japan)
* Spanish (Mexico)
* Spanish (Spain)

You can use Windows Mixed Reality if your PC is set to a different language. However, the interface will appear in English (United States), and speech commands and dictation won't be available. The Windows Mixed Reality onscreen keyboard is English (United States) only. To enter text in another language, use a physical keyboard connected to your PC. You can also use dictation in one of the supported Windows Mixed Reality languages listed above—just select microphone on the onscreen keyboard.

Windows Mixed Reality is also available in the following languages without speech commands or dictation features:
* Chinese Traditional (Taiwan and Hong Kong)
* Dutch (Netherlands)
* Korean (Korea)
* Russian (Russia)

## I have questions about my headset hardware.

For details about your headset, check with the manufacturer. There may be a product guide in the box, or you can try the manufacturer’s website.

## How do I uninstall Windows Mixed Reality?

1. Disconnect your headset from your PC.
2. Close Windows Mixed Reality Portal.
2. Go to  **Start > Settings > Mixed Reality** and select "Uninstall".

When you're ready to start using your headset again, plug it in, and Windows Mixed Reality Portal will take you through setup.

## I got a "We couldn't finish uninstalling Windows Mixed Reality" message.

Some files, including information about your environment, might still be on your computer. This can cause problems if you decide to reinstall Windows Mixed Reality later. You can manually remove any remaining Windows Mixed Reality info from your PC by modifying the registry and using Windows PowerShell to run commands. _If you modify the registry incorrectly, serious problems might occur. Make sure to follow these steps carefully. For added protection, back up your registry before you modify it so you can restore it if a problem occurs._ For more information, see [How to back up and restory the registry in Windows](https://support.microsoft.com/en-us/help/322756/how-to-back-up-and-restore-the-registry-in-windows). 

To uninstall Windows mixed reality using these commands:
1. Restart your PC.
2. In the **Search** box, type "regedit" and then select "Yes".
3. Remove these registry values:
   <ul>
    <li><b>HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Holographic</b>, then delete "FirstRunSucceeded".</li> 
    <li><b>HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Holographic\SpeechAndAudio</b>, then delete "PreferDesktopSpeaker" and "PreferDesktopMic".</li> 
    <li><b>HKEY_CURRENT_USER\Software\Microsoft\Speech_OneCore&gt; Settings\Holographic</b>, then delete "DisableSpeechInput". Note: The registry items in HHKEY_CURRENT_USER must be deleted for every user account on the PC that has used Windows Mixed Reality.</li> 
    <li><b>HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\PerceptionSimulationExtensions</b>, then delete "DeviceID" and "Mode".</li> 
    <li><b>HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Holographic</b>, then delete "OnDeviceLearningCompleted".</li> 
   </ul>
4. Remove the following registry keys: 
   <ul>
   <li> <b>HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\HoloSI</b></li> 
   <li> <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\HoloSI</b></li> 
   <li> <b>HKEY_CURRENT_USER\Software\Microsoft\Speech_OneCore\Settings\HolographicPreferences</b></li><br/></ul>
5. Close the Registry Editor.
6. Go to **C:\Users\user name\AppData\Local\Packages\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy\LocalState** and delete "RoomBounds.json". Repeat this for each user who has used Windows Mixed Reality.
7. Open admin cmd prompt and go to **C:\ProgramData\WindowsHolographicDevices\SpatialStore\HoloLensSensors**. Delete the contents of the "HeadTracking data" folder (but not the folder itself).
8. Type "powershell" in the "Search box", right-click "Windows PowerShell", and then select "Run as administrator".
9. In Windows PowerShell:
   <ul>
   <li>At the command prompt, copy and paste <b>Dism /online /Get-Capabilities</b>, then press Enter.</b></li> 
   <li>Copy the Capability Identity that begins with Analog.Holographic.Desktop. If it isn't there, the item isn't installed and you can skip to step 10).</li> 
   <li>Copy and paste the following command prompt, then press Enter: <b>Dism /online /Remove-Capability /CapabilityName: the Capability Identity copied in the last step</b></li>
   </ul>
10. Restart your PC.


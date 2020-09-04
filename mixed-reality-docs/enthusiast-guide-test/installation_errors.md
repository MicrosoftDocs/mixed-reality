---
title: Installation errors
description: Advanced Windows Mixed Reality troubleshooting that goes beyond our standard consumer support documentation.
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Troubleshoot, Errors, Help, Support, Installation
---

# Installation errors

## "Your PC can’t run Windows Mixed Reality"

Your PC doesn’t meet the [minimum requirements](https://support.microsoft.com/en-us/help/4039260/windows-10-mixed-reality-pc-hardware-guidelines) needed to run Windows Mixed Reality. This could be because the computer’s hardware setup isn’t compatible with Windows Mixed Reality, or because you need to [update to the latest version of Windows](https://support.microsoft.com/en-us/help/12373/windows-update-faq). 

Note that Windows Mixed Reality requires a graphics card driver that supports at least WDDM 2.2, so make sure you have the latest driver update from the manufacturer. If Windows Mixed Reality setup says your graphics card doesn’t meet the requirements and you think it does, make sure your headset is plugged into the correct card.

## "You’re nearly there—this PC doesn’t meet the minimum requirements needed to run Windows Mixed Reality"

Your PC doesn’t meet the [minimum requirements](https://support.microsoft.com/en-us/help/4039260/windows-10-mixed-reality-pc-hardware-guidelines) needed for the best experience in Windows Mixed Reality. Your PC may be able to run an immersive headset, but may not be able to run certain applications or might have problems with performance.

Note that Windows Mixed Reality requires a graphics card driver that supports at least WDDM 2.2, so make sure you have the latest driver update from the manufacturer. If Windows Mixed Reality setup says your graphics card doesn’t meet the requirements and you think it does, make sure your headset is plugged into the correct card.

## "Before we can set up Windows Mixed Reality, your administrator will need to enable it for your organization. Learn More"

You are probably on an enterprise managed network and your organization is using Windows Server Update Services (WSUS) or has other policies that may block the download. Contact your organization's IT department or system administrator to [enable Windows Mixed Reality](https://docs.microsoft.com/windows/application-management/manage-windows-mixed-reality#enable).

## "We couldn't download the mixed reality software" or "Hang tight while we do some downloading"

* Sometimes a pending update can block the Mixed Reality Software download. Go to **Settings > Update & security > Windows Update** and make sure Windows Update is on. Then download and install any waiting updates. If you get a Windows Update error, get help [here](https://support.microsoft.com/en-us/help/10164/fix-windows-update-errors).
* Make sure your PC is connected to the internet and has at least 2GB of free storage space. Check your network status at: **Settings > Network & Internet > Status**. If you can't connect to the internet, get help [here](https://support.microsoft.com/en-us/help/10741/windows-10-fix-network-connection-issues).  
* Restart your PC and try again. 

If these solutions don't work, try:
* If your Wi-Fi network connection is set to [metered](https://support.microsoft.com/en-us/help/17452/windows-metered-internet-connections-faq), change it to unmetered. To turn off a metered connection, go to: **Settings > Network & Internet > Status > Change connection properties > Set as metered connection** and select "Off".  
* If you recently installed an update, it can cause problems. We don’t recommend that you remove any installed updates, especially security updates which keep your PC safe, but sometimes removing the most recent update can help determine the source of the problem. To do this: 
    * Go to **Settings > Update & Security > View Installed Update History > Uninstall Updates**
    * Select the last update installed and "Uninstall".
    * When prompted "Are you sure you want to uninstall this update?" answer "Yes". If you get an error when attempting these steps go [here](https://support.microsoft.com/en-us/help/10164/fix-windows-update-errors). 
    * Restart your PC and try again. 
    * If Windows Mixed Reality installs correctly, reinstall the latest updates under **Settings > Windows Update > Check for Updates** and see if Windows Mixed Reality continues to work. If it does not install correctly, reinstall the updates and contact Windows Support. 

## "Something went wrong, and we couldn't start Windows Mixed Reality"
To get more information about a specific error code, look [here](error-codes.md). You can also try to:

* Unplug both headset cables from the PC.
* Restart the PC.
* Go to **Settings > Update & security > Windows Update** and make sure that Windows Update is turned on. Download and install any waiting updates.
* Reconnect your headset to the PC and then try setup again.

If these steps don’t work, uninstall and then reinstall Windows Mixed Reality:
* Go to **Settings > Mixed reality > Uninstall** and select "Uninstall". 
* Restart your PC. 
* To start the setup process again, just plug your headset into your PC.

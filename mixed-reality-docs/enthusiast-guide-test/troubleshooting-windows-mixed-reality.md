---
title: Troubleshooting Windows Mixed Reality
description: Advanced Windows Mixed Reality troubleshooting that goes beyond our standard consumer support documentation.
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Troubleshoot, Errors, Help, Support
---



# Troubleshooting Windows Mixed Reality (FAQs)

## Understanding common installation error messages

### "Your PC can’t run Windows Mixed Reality"

Your PC doesn’t meet the [minimum requirements](https://support.microsoft.com/en-us/help/4039260/windows-10-mixed-reality-pc-hardware-guidelines) needed to run Windows Mixed Reality. This could be because the computer’s hardware setup isn’t compatible with Windows Mixed Reality, or because you need to [update to the latest version of Windows](https://support.microsoft.com/en-us/help/12373/windows-update-faq). 

Note that Windows Mixed Reality requires a graphics card driver that supports at least WDDM 2.2, so make sure you have the latest driver update from the manufacturer. If Windows Mixed Reality setup says your graphics card doesn’t meet the requirements and you think it does, make sure your headset is plugged into the correct card.

### "You’re nearly there—this PC doesn’t meet the minimum requirements needed to run Windows Mixed Reality"

Your PC doesn’t meet the [minimum requirements](https://support.microsoft.com/en-us/help/4039260/windows-10-mixed-reality-pc-hardware-guidelines) needed for the best experience in Windows Mixed Reality. Your PC may be able to run an immersive headset, but may not be able to run certain applications or might have problems with performance.

Note that Windows Mixed Reality requires a graphics card driver that supports at least WDDM 2.2, so make sure you have the latest driver update from the manufacturer. If Windows Mixed Reality setup says your graphics card doesn’t meet the requirements and you think it does, make sure your headset is plugged into the correct card.

### "Before we can set up Windows Mixed Reality, your administrator will need to enable it for your organization. Learn More"

You are probably on an enterprise managed network and your organization is using Windows Server Update Services (WSUS) or has other policies that may block the download. Contact your organization's IT department or system administrator to [enable Windows Mixed Reality](https://docs.microsoft.com/windows/application-management/manage-windows-mixed-reality#enable).

### "We couldn't download the mixed reality software" or "Hang tight while we do some downloading"

* Sometimes a pending update can block the Mixed Reality Software download. Go to **Settings > Update & security > Windows Update** and make sure Windows Update is turned on. Then download and install any updates that are waiting to be installed. If you get an error with Windows Update when attempting these steps go [here](https://support.microsoft.com/en-us/help/10164/fix-windows-update-errors).
* Make sure your PC is connected to the internet and has at least 2GB of free storage space. Check your network status at: **Settings > Network & Internet > Status**. If you are unable to connect to the internet go [here](https://support.microsoft.com/en-us/help/10741/windows-10-fix-network-connection-issues) for help.  
* Restart your PC and try again. 

If the previous solutions don't work, try:
* If your Wi-Fi network connection is set to [metered](https://support.microsoft.com/en-us/help/17452/windows-metered-internet-connections-faq), change it to unmetered. To turn off a metered connection, go to: **Settings > Network & Internet > Status > Change connection properties > Set as metered connection** and select "Off".  
* If you recently installed an update, it can cause problems. We don’t recommend that you remove any installed updates, especially security updates which keep your PC safe, but sometimes removing the most recent update can help determine the source of the problem. To do this: 
    * Go to **Settings > Update & Security > View Installed Update History > Uninstall Updates**
    * Select the last update installed and "Uninstall".
    * When prompted "Are you sure you want to uninstall this update?" answer "Yes". If you get an error when attempting these steps go [here](https://support.microsoft.com/en-us/help/10164/fix-windows-update-errors). 
    * Restart your PC and try again. 
    * If Windows Mixed Reality installs correctly, reinstall the latest updates under **Settings > Windows Update > Check for Updates** and see if Windows Mixed Reality continues to work. If it does not install correctly, reinstall the latest updates and contact Windows Support. 

### "Something went wrong, and we couldn't start Windows Mixed Reality"
* Unplug both cables of your headset from the PC.
* Restart the PC.
* Go to **Settings > Update & security > Windows Update** and make sure that Windows Update is turned on. Then download and install any waiting updates.
* Reconnect your headset to the PC and then try setup again.

If the above steps don’t work, try uninstalling and then reinstalling Windows Mixed Reality:
* Go to **Settings > Mixed reality > Uninstall** and select "Uninstall". 
* Restart your PC. 
* To start the setup process again, just plug your headset into your PC.
    

## Troubleshooting setup questions 

### My Xbox controller isn't working with Windows Mixed Reality.

* Make sure your controller is turned on, fully charged, and connected to the PC.
* Replace the controller’s batteries.
* If you're using a Bluetooth controller, go to **Settings > Devices > Bluetooth & other devices** on your PC and make sure it's paired (it should be listed on the page).

### I can't direct input (controllers, gamepad, mouse/keyboard) into Windows Mixed Reality.

When you put on your headset, input should automatically get toggled to your mixed reality experience through your headset's presence sensor. A blue bar should appear on your Desktop:

![Windows Desktop with input being directed to headset](images/1050px-windowsy.png)

If input doesn't get toggled automatically, you will need to manually toggle input to your headset. You can do this by typing **Windows Key + Y** on your keyboard (and the same to toggle input back to the desktop).

### When I plug in my headset, nothing happens. The Mixed Reality Portal doesn’t open.
Mixed Reality Portal, the app that takes you through Windows Mixed Reality setup, is designed to open automatically when you plug in a compatible headset. If it doesn’t open, go to Start and type "Mixed Reality Portal" in the Search box to open the app from there. If you can’t find Mixed Reality Portal, that might mean you need to [update to the latest version of Windows](https://support.microsoft.com/en-us/help/12373/windows-update-faq).

### How do I choose between "Seated and standing" and "All experiences"?

If you choose "Seated and standing", either during headset setup or later on, you'll be using your headset without a boundary. You can sit down or stand up, but you'll otherwise need to stay in one place, as you’ll have no boundary to help you avoid physical obstacles. Some apps might be designed to work with a boundary, so you might not be able to use them or you might not have the same experience if you use them without a boundary. See "What's a boundary and why should I create one?" below for more information.

If you choose "All experiences", you'll set up a boundary and you can use apps and experiences that work with a boundary as well as those that don't require one. 

### Learn Mixed Reality didn't run on first launch, and I went right into the Windows Mixed Reality home.

You can re-run the learning experience by following the [re-run steps](learn-mixed-reality.md#how-do-i-re-run-the-learning-experience). 


## Boundary setup and other questions

### What's a boundary and why should I create one?

A boundary defines the area in which you can move around while you're wearing your Windows Mixed Reality immersive headset. Because you can't see your surroundings while you're using your headset, it's important to create a boundary to help you avoid obstacles. The boundary looks like a white outline inside mixed reality and appears when you come close to it. When you see it, slow your movements, and avoid crossing the boundary or extending your limbs beyond it.

The area inside the boundary should be free of furniture, low-hanging light fixtures, ceiling fans, etc. so you won't bump into or trip over anything. [Learn about health and safety in Windows Mixed Reality](https://support.microsoft.com/en-us/help/4039969/windows-10-mixed-reality-immersive-headset-health-safety-comfort).

### How do I create a boundary?

When you first set up your headset, the setup app (Mixed Reality Portal) will take you through the steps to create a boundary. But you can create one at any time. To do this:
1. Select **Start > Mixed Reality Portal** on your desktop. 
2. Open "Menu".
3. Select "Run setup" to create a new boundary.

If someone else uses your headset, make sure they understand the boundary and how to use it. If you move your headset to a new location, you'll need to set up a new boundary that works for that space.

### I get an error message when I try to create a boundary.

* Don't get too close to a wall or other obstruction when creating a boundary.
* Make sure to hold your headset at waist height, and face your computer while you trace the boundary.
* Make sure the sensor isn’t blocked and there’s enough light.
* The space you’re tracing should be larger than three square meters.
* The space should not be too large or too complicated. Stick to a simple geometric shape without a lot of twists and turns.
* Don’t cross back over your own path as you’re tracing.
* If you get stuck in a corner, start over.

### During start up of Mixed Reality, I'm stuck at the step "Turn your head side to side, and then at the floor".

This step lets your headset recognize your space and restore any existing virtual floor and boundary. When you put on your headset, this scanning process can take up to 10 seconds. After it is complete, you will either be in the Mixed Reality Home or you will be prompted to set up your boundary again.

If the scanning process takes longer than 10 seconds, there could be a problem with the proximity sensor in the headset:
1. Check that the sticker has been removed from the proximity sensor. The proximity sensor is located inside the headset roughly where the center of your forehead would be.
2. Check that your proximity sensor is toggling input to your headset: with your finger, cover and uncover the proximity sensor a few times to verify input is switching to the headset. You should see the **Windows Key + Y** banner at the top of your PC. You can manually switch input to the headset at any time by typing **Windows Key + Y** on your keyboard.

### I see a message that says my boundary can't be found. What should I do?

Windows Mixed Reality might have trouble identifying your existing boundary. You can create a new boundary or you can use your device in "Seated and standing" mode. 

### I see a message that says “Lost tracking” or “We don’t have a boundary for this space”.

You must create a new boundary. To do this:
* Select **Start > Mixed Reality Portal**.
* Select "Run setup".

### The boundary is always visible. How can I make it go away?

The boundary appears when you are close to it. If your boundary includes any sections that have a narrow or irregular shape, you might end up getting close to it, and causing it to appear, more often than you’d like. To fix this, try creating your boundary again using a larger and more regular shape. To do this:
* Select **Start > Mixed Reality Portal**.
* Select "Run setup".

### How can I turn off the boundary temporarily?

* Select **Start > Mixed Reality Portal**.
* Open "Menu". 
* Turn "Boundary" to "Off". Make sure to stay in one place while the boundary is off.


## Problems in Windows Mixed Reality Home

### My controllers aren't showing in my Windows Mixed Reality Home.

Make sure your controllers have full batteries and that they are paired correctly using Bluetooth. Try powering the controllers off and on using the Windows Button. If you still cannot see your controllers, try in-pairing and re-pairing each controller in the Settings menu under **Devices > Bluetooth**.

### The floor of my Windows Mixed Reality Home doesn't appear to be at the correct height, or it is slanted.

Select **Start > Room Adjustment** which will launch once you place the app in the world, to make changes while wearing your headset. In this app, you will be directed to use the touch pad (motion controller) or direction pad (gamepad) to adjust the floor height. When the floor feels correct, use the Windows button to exit back to your Home.

### My headset has stopped tracking.

Make sure the lights are on and that there isn't anything obstructing the inside-out tracking cameras on the front of your headset. If tracking is lost, it can take a few seconds to resume. If tracking does not resume, try restarting the Windows Mixed Reality Portal. See [Tracking Troubleshooting](tracking.md) for more details.

### I can't show a preview of what I'm seeing in my headset on my desktop screen.

Mixed Reality Portal has a **Play** button at the bottom of the screen that allows you to show a preview of what you're seeing in your headset on your desktop's screen. But for performance reasons, this feature is only available on PCs running at Windows Mixed Reality Ultra (90Hz).

## Headset connectivity issues

### My computer does not have an HDMI port.
If your computer does not have an HDMI port but does have a DisplayPort (DP), mini DisplayPort (miniDP) or USB Type-C (USB-C) port for outputting video, you may need to use a [supported adapter](recommended-adapters-for-windows-mixed-reality-capable-pcs.md).

### Can I use USB or HDMI extension cables with Windows Mixed Reality headsets?
Windows Mixed Reality headsets do not officially support the use of USB or HDMI extension cables. Using these cables may significantly impact your Mixed Reality experience because of variances in resulting signal integrity and bus power between your PC's USB controller and the Mixed Reality headset. If the headset display briefly shows a blue screen and then turn black and Mixed Reality Portal restarts or completely de-enumerates during use, or if the headset audio cuts out or becomes glitchy, or if the headset flickers between black and the correct display, try using your headset without extension cables.

### I am getting a "Check your display cable" error.

* If you are using any adapters to connect your headset to your PC, make sure they support Windows Mixed Reality. Also try connecting the adapter to the PC before connecting the HMD to the adapter.
* If your PC has both integrated and discrete graphics, make sure you're using the HDMI port on your active graphics card. In some cases, this may mean that you'll need to connect your PC display to a non HDMI port.
* If your PC has both integrated and discrete graphics, and the integrated graphics is older and does not support Windows Mixed Reality, try disabling the integrated GPU.
* Connect a PC monitor to your PC's HDMI port. Make sure your graphics drivers are up to date. Download and install the ones from AMD, Nvidia or Intel directly as they will likely be newer than what's published to Windows Update.
* Make sure that you plugged your headset's HDMI cable into an **HDMI out** port on your PC, not an HDMI in port.
* Windows may be unable to detect the display cable connection. Open the Device Manager and see if the headset is listed under "Monitors". If not, select **Action > Scan for hardware changes**. 

### I see a message that says "Put on your headset" even though I have my headset on.

When you put on your headset, Windows Mixed Reality may need a few seconds to reload your space. If this message doesn't go away, make sure the protective sticker has been removed from the proximity sensor, which is on the inside of the headset between the lenses. If this doesn't resolve the problem, contact your headset manufacturer.

### A message says "Connect your headset" even though I’ve plugged in my headset.

1. Make sure the headset's USB and HDMI cables are connected to the correct ports on your PC. Here is how to identify the correct ports:
    * USB 3.0 ports have a special logo with an "SS" mark (indicating "SuperSpeed"). The port's inside piece is normally blue, whereas older USB 2.0 ports are typically black or white on the inside.
    * If your computer has two HDMI ports, use the one that connects to the graphics card, not the computer's motherboard. It's not always obvious which is which, though discrete ports are often located in an expansion slot on the computer. If you try one port and it doesn't work, try the other.
2. Unplug and plug in the USB and HDMI cables from your headset to make sure they are securely connected. When plugging in the USB cable, try not to pause during insertion of the USB cable.
3. Open Device Manager and confirm that your headset is listed under "Mixed Reality devices". Double click on your headset under "Mixed Reality devices" and confirm that the device status indicates "This device is working properly". Yellow exclamation marks on devices listed in Device Manager indicate errors reported by the devices connected to your PC.
    * If "Hololens Sensors" is listed with a yellow exclamation mark in Device Manager, double click on the device. If you see a **"Code 10: The drivers for this device are not installed. There are no compatible drivers for this device"**, follow the [instructions](headset-connectivity.md#the-headset-driver-did-not-install-automatically-when-i-plugged-in-the-headset) to manually install the headset driver.
    * If you use multiple Mixed Reality headsets on your PC and have manually installed the Mixed Reality headset driver before, in some circumstances the manual driver update may only apply to the headset connected at the time and not to your other headsets. In this case, you'll see **"Code 31: This device is not working properly because Windows cannot load the drivers required for this device. (Code 31). The ALPC message requested is no longer available"** in Device Manager. In Device Manager, right click on your headset under "Mixed Reality devices", and select "Uninstall device". Select "OK" to confirm and then unplug and replug your headset.
4. If you're seeing partial enumeration of the headset (a series of USB devices enumerate, but nothing under "Mixed Reality headsets" in Device Manager), try an externally powered USB 3.0 hub.
5. Go to the headset manufacturer’s website and update the drivers and firmware for your headset.
6. Connect your headset to another PC and open Device Manager. Even if that PC is not fully compatible with Windows Mixed Reality, you can check to see if your headset enumerates. If your headset does not enumerate on multiple PCs, it could have a hardware issue.

**Note for Surface users:** Earlier versions of the Surface Dock and Surface Book USB Hub firmware update software are incompatible with Mixed Reality headsets. If you get a "Connect your headset" message on a Surface PC, check to see if any devices are reporting a **"Code 10: The device cannot start" error** in Device Manager. If so, [remove the conflicting driver](https://support.microsoft.com/en-us/help/4032123/kinect-sensor-is-not-recognized-on-a-surface-book). You should only need to do this once.

**Note for Windows 10 N users:** If your PC is running Windows 10 N, you'll see a **"Code 28: The install class is not present or is invalid" error** in Device Manager after plugging in your Mixed Reality headset. N-editions of Windows 10 are not supported by Windows Mixed Reality. Follow these [instructions](troubleshooting-windows-mixed-reality.md#im-getting-a-the-install-class-is-not-present-or-is-invalid-error-in-device-manager) for more information.

### A message says "Check your USB cable" or "Insufficient USB speed".

* Make sure that you're using a supported USB 3.0 port on your PC:
    * Make sure that your headset's USB cable is plugged in all the way.
    * Run the [Windows Mixed Reality PC Check](https://aka.ms/pccheckapp) app to make sure your PC's USB 3.0 controller is supported.
    * Try each of the other USB 3.0 ports on your PC. Some PCs have more than one USB 3.0 controller.
    * Temporarily disconnect all of the USB devices attached to your PC, and only connect your headset.
    * On custom-built PCs, even though a port may be marked as a USB 3.0 port, it may be connected to a USB 2.0 controller. With your headset connected, open Device Manager, locate and single click any of the devices enumerated from your headset, then go to **View > Devices by connection**.
* Try your headset on another PC. If that other PC is not fully compatible with Windows Mixed Reality, check in Device Manager to see if you see the "insufficient USB speed" message. If your headset does not enumerate properly on multiple PCs, your headset could be defective.

### The Mixed Reality Portal did not launch automatically after I plugged in my headset.

The headset might not have been detected properly because of an underlying issue. Try launching the Mixed Reality Portal manually and look for any error messages that appear. 

### My headset stopped working after putting my PC to sleep, in hibernation mode, or when restarting my PC with my headset attached.

1. Open Device Manager and confirm that your headset is listed under "Mixed Reality devices".
2. Double click on your headset under "Mixed Reality devices" and confirm that the device status indicates "This device is working properly".
3. If you see a "Code 43" error indicating that the device has stopped working, or if you don't see your headset listed under "Mixed Reality devices", unplug and replug in your headset's USB cable. Microsoft is investigating a potential software/driver interoperability issue which may result in this error. This issue affects a small number of PCs, and is expected to be resolved in a future update to the Mixed Reality headset driver.

### My headset causes my PC to generate a Bug Check (blue screen) when I put my PC to sleep or when it is in hibernation mode.

Microsoft is investigating a potential software/driver interoperability issue which may result in a small number of PCs potentially generating a "9F" Bug Check (blue screen) when the PC is put to sleep or into hibernation mode with the headset attached. This issue is expected to be resolved in a future update to the Mixed Reality headset driver.

### The headset driver did not install automatically when I plugged in the headset.

On new PCs, or PCs with a newly installed copy of Windows 10, the headset driver could be queued behind other Windows updates and may not install immediately. If you have an "N"-edition of Windows, you will need to switch to a regular edition of Windows 10 to use Windows Mixed Reality. To install it manually:

1. Go to **Start > Device Manager** and look under "Other devices" for a "HoloLens Sensors" device with a yellow exclamation mark:
![View of Device Manager HoloLens Sensors](images/hololenssensors.png)
2. Right click on the device and select properties. If the device's properties read **The drivers for this device are not installed (Code 28)**, close the window and proceed. If there is another message, follow troubleshooting steps on the rest of this page.
![Code 28 of HoloLens Sensors in Device Manager](images/code28.png)
3. Right click on the device again and select "Update Drivers..." and then "Search automatically for updated driver software"
After the device updates, you should see your headset listed under "Mixed Reality devices" in Device Manager:
![Mixed Reality Device appear in Device Manager](images/mixedrealitydevices.png)

If the manual install doesn’t work, or you don't find the driver under Other Devices, then you probably need to uninstall the existing driver and reinstall it. To do that:
1. Go to **Start > Device Manager** and look under "Mixed Reality devices" for your headset. The device status should indicate that "The device is working properly".
2. Right click on the device and select "Uninstall Device".
3. In the new popup that appears, select the check box "Delete the driver software for this device" and then select "Uninstall".
4. When that completes, unplug the headset from your PC, and plug it back in. Windows Update will now download and install a new driver.

### Troubleshooting flowchart

![Connect your headset/check your USB cable](images/hmd-connectivity2.jpg)


## Mixed Reality headset display problems ##

### My headset displays are black.

* Check your PC performance and stability:
    * Use the Task Manager to see if any processes are maxing out your PC's CPU, GPU, and/or disk drives.
    * Look at the Applications and System Event Logs in Windows (using Event Viewer) to see if you have an app that is frequently crashing and generating Windows Error Reporting (WER) reports.
    * Check Windows Update to make sure your version of Windows is current. You may have to select "Check for Updates" multiple times.
* Check app and game stability:
    * Ensure that your PC meets the minimum system requirements to run any app/game that is not performing correctly.    
    * Make sure your GPU driver version is recent, and check for any new performance and compatibility issues and regressions on new drivers.
    * If you are using SteamVR apps and games, make sure SteamVR and the Windows Mixed Reality for SteamVR components are up to date.
* Check HDMI adapter compatibility:
    * Make sure that the HDMI cable is plugged in all the way.
    * If you're using an HDMI adapter (for example, a Mini DisplayPort to HDMI adapter), make sure it is compatible with Windows Mixed Reality. The adapter must support HDMI 2.0, and there are many older adapters that only support 1080p. See [Recommended adapters for Windows Mixed Reality](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/recommended-adapters-for-windows-mixed-reality-capable-pcs).
    * Plug order can be important. Connect the HDMI adapter to your PC before connecting the headset to the adapter, especially if you're using a USB-C to HDMI adapter. 
    * Try removing extension cables if you are using them.
* Check graphics card and driver compatibility:
    * Try your PC's HDMI port with a PC monitor. Some PCs may have more than one HDMI port, and not all of them may be active.
    * If your PC has both an integrated graphics processing unit (iGPU) and a discrete graphics processing unit (dGPU), make sure that you are plugged into your dGPU's HDMI port.<br> ![HDMI Ports](images/HP_HDMI_Ports_s.png)
    * Double check your GPU driver version. Make sure it's recent, but also pay attention to any new performance and compatibility issues and regressions on brand new drivers.
    * If you're using Mixed Reality on a laptop and you've installed a newer graphics driver from the graphics card manufacturer's website, try downgrading to the latest graphics card driver provided on your PC manufacturer's website, or on Windows Update.
    * If you have multiple PC monitors connected to your PC, try temporarily disconnecting all but one PC monitor.
    * If you've set a custom refresh rate for your PC monitor, try temporarily reverting to a standard refresh rate, such as 60Hz.
    * If you've recently changed your graphics card without reinstalling Windows, check that the headset monitor still has the correct driver installed. With your headset plugged in, confirm that "Mixed Reality headset" is listed under the Monitors node in Device Manager.
    * If your PC has an Nvidia graphics card, make sure that Nvidia's 3D Vision software is disabled.
    * On some graphics cards (especially older graphics cards), the HDMI port may not support HDMI 2.0 or may not be fully compatible with Windows Mixed Reality. Please try your graphics card's DisplayPort port by using an [active DisplayPort 1.2 to HDMI 2.0 adapter](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/recommended-adapters-for-windows-mixed-reality-capable-pcs)
    * HP Omen PCs with HP product number 1RJ99EA#ABU have HDMI ports that are incompatible with Windows Mixed Reality. To look this up, open up the "HP Support Assistant" and the product number will be listed towards the bottom of the app.
    * If your PC has an AMD R9-series graphics card and you're using a Samsung Mixed Reality headset, you'll need to update your headset's firmware to version 1.0.8 or newer in order to use the HDMI port of your graphics card with the headset.
    * If you're using a Surface Book 2, please make sure you're using the [Surface USB-C to HDMI adapter](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/recommended-adapters-for-windows-mixed-reality-capable-pcs).
* Check for a Mixed Reality headset hardware issue:
    * To confirm or rule out hardware issues with your Mixed Reality headset, try connecting your Mixed Reality headset to another PC. 
    * Check for PC compatibility and setup issues first, as the symptoms are very similar.
* Check to make sure the USB cable is plugged into a USB 3.0 or faster port. USB 3.0 ports have SS (Super Speed) written next to them. They are often (but not always) colored blue.		

If helpful, consult the headset black screen troubleshooting flow chart below.

![Black screen/Can't see anything](images/hmd-connectivity.jpg)

### My headset display occasionally turns black after some use.

* Try disabling any USB suspend or power saving features your PC might have. For example, [USB selective suspend](https://docs.microsoft.com/windows-hardware/drivers/usbcon/usb-selective-suspend) in Windows power options, the "Allow the computer to turn off this device to save power" setting in Device Manager, and any USB power saving settings in your PC's firmware.
* Temporarily disconnect any other USB devices and peripherals connected to your PC.
* Double check your GPU driver version. Make sure it's recent, but also pay attention to any new performance and compatibility issues and regressions on brand new drivers.

### One of the displays on my headset is black.

* If you're using an HDMI adapter, make sure it supports HDMI 2.0.
* Remove any USB and HDMI extension cables that you may be using.
* Make sure your graphics driver is up-to-date.
* Try the Mixed Reality headset on another PC.

### My headset displays turn blue for a moment, and then Mixed Reality Portal reinitializes.

This typically indicates an occasional USB controller reliability issue on your PC:
* Try another USB port. Your PC may have multiple USB 3.0 controllers.
* Remove any extension cables (if applicable).
* Try unplugging all other USB devices from your PC.
* Try connecting an externally-powered USB 3.0 hub to your PC, and connecting your headset to the hub.
* If you're using a Desktop PC, consider purchasing a USB 3.0 PCIe card to add another USB controller to your PC.

### My headset causes my PC to hang or show a black screen while starting up.

On some PCs, leaving your headset plugged in before turning on or while rebooting your PC may interfere with its startup process. Your PC could select the headset displays as the "primary monitor" to show PC startup progress or it could be prevented from starting up properly and may "hang" and/or produce a beeping error code. The behavior depends largely on the PC make and model, and/or the make and model of the graphics card. To fix this:
* Connect your headset to a different port on your graphics card (you may need to use an adapter to use the other ports).
* Make sure your PC's BIOS / UEFI firmware is up-to-date (but only update your PC's BIOS / UEFI firmware if you're comfortable doing so).

### My PC or headset displays flicker, flash or remain black when using a Surface PC.

* Make sure you're using an HDMI adapter that supports HDMI 2.0. Many older HDMI adapters only support 1080p resolution, which is insufficient for Mixed Reality headsets.
* Make sure your graphics driver is up-to-date. In addition to checking Windows Update, you may wish to check the PC manufacturer's website for an updated graphics driver.
* Some Surface devices are incompatible with Windows Mixed Reality. Learn more about [Surface compatiblity and requirements](windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md#windows-mixed-reality-and-surface).

### My headset display doesn't work after I shut down and do a fast startup.

Unplug the HDMI cable and the USB cable from the headset and then plug them back in.

### My headset displays are very choppy, but Mixed Reality Portal's preview window appears fine.

* Make sure your PC's system resources (CPU, memory, and hard drive) are available and not pegged or maxed out by another app or process.
* Update your graphics driver.

### I'm getting a "The install class is not present or is invalid" error in Device Manager.

If you see "HoloLens Sensors" with a yellow exclamation mark in Device Manager, double click on the device for additional details. If you see a message saying "The drivers for this device are not installed. (Code 28) -- The install class is not present or is invalid", this is typically because your PC is running [Windows 10 N](https://support.microsoft.com/en-us/help/4039813/media-feature-pack-for-windows-10-n-october-2017). Please note that N-editions of Windows 10 do not support Windows Mixed Reality, and you'll need to install a non-N version of Windows 10.

### My WMR environment is jittery or stutters when I move my head and displays double vision.

On a laptop with integrated graphics and an Nvidia GPU, an error occurs after a period of time that appears to cause a previous frame to display after the next frame, resulting in double vision the faster you move your head in a yaw, pitch, or roll movement. The issue appears to be on drivers after Nvidia Graphics Driver 436.48.  Installing this driver will fix the issue until Nvidia solves the problem in the updated drivers. For a direct install of Nvidia Graphics Driver 436.48, visit [NVIDIA](https://www.nvidia.com/Download/driverResults.aspx/152007/en-us).

### I’m experiencing discomfort when I use my headset.
For general info about comfort in Windows Mixed Reality, see [Windows Mixed Reality immersive headset health, safety, and comfort](https://support.microsoft.com/en-us/help/4039969/windows-10-mixed-reality-immersive-headset-health-safety-comfort). For details about your specific headset, check with the headset manufacturer.

### How can I get a clearer view in my headset?
Try adjusting the fit of your headset. Adjust its position on your face by moving it up and down or left and right, and adjust the straps so it feels snug.

If your headset supports it, you can also adjust its calibration settings. If the headset has a knob to adjust calibration, use that. If it doesn’t, go to **Settings > Mixed reality > Visual quality** and adjust the calibration there. For more information on calibration for your specific device, check with your headset manufacturer.

## Mixed Reality Portal error messages and problems

### I got a "Something went wrong" error message, or I'm having problems in the Mixed Reality Portal.

Restart Windows Mixed Reality:
1. Disconnect both headset cables from your PC.
2. Restart your PC.
3. Reconnect your headset.

If that doesn't work, make sure that your PC recognizes your headset:
1. Select Start.
2. Type "device manager" in the search box and select it in the list. 
3. Expand "Mixed reality devices" and see if your headset is listed. 

If it isn't listed, try the following:
1. Plug the headset into different ports on the PC, if available.
2. Check for the latest software updates from Windows Update.
3. Uninstall and reinstall Windows Mixed Reality:
    1. Disconnect both headset cables from your PC.
    2. Select **Settings  > Mixed reality > Uninstall**.
    3. Select **Settings  > Devices  > Bluetooth & other devices** to unpair your motion controllers. Select each controller, and then select "Remove device".
    4. Plug your headset back into your PC to reinstall Windows Mixed Reality.
    
### I'm getting a "Check your USB cable" error message.

Connect your headset to a different USB port (and make sure it’s a SuperSpeed USB 3.0). Also, try removing any extenders or hubs between the headset and the computer.

### I'm getting a "Check your display cable" error message.

Try the following:
* Connect your headset to a DisplayPort 1.2 or later, or HDMI 1.4 or later. Make sure the port corresponds with the most advanced graphics card on your PC.
* If you’re using an adapter, make sure it's 4K capable.
* Try using a different HDMI port.
* If you have an external monitor plugged into an HDMI port, try plugging it into a DisplayPort instead, and use the HDMI port for your headset.


## "Something Went Wrong" error codes and how to resolve them

| **Windows 10 error codes** (version 1809/versions 1709, 1803) | **Error message and troubleshooting suggestions**                    |
|-------------------------------------------------------------|--------------------------------------------------------------------|
|   1-4 / 2197815297-4  | **Check your display cable: Make sure your headset's display cable is plugged in correctly.** <br/><br/><ol start="1"><li>Unplug both your headset's USB and HDMI cables, then plug them back in.</li><li>Check Device Manager and confirm that under "Monitors", the "Mixed Reality headset" monitor is present.</li><li>Make sure your graphics drivers are up to date (from your graphics card manufacturer's website).</li><li>If you're using an adapter to connect your headset, make sure it [supports Windows Mixed Reality](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/recommended-adapters-for-windows-mixed-reality-capable-pcs).</li><li>If your graphics card has both DisplayPort and HDMI ports, try using the DisplayPort port on your graphics card, and use a supported Mixed Reality DisplayPort-to-HDMI adapter.</li><li>Try a different USB 3.0 port on your PC</li></ol> |
|   1-5 / 2197815297-5  | **Check your display cable: Your headset displays failed to initialize properly. Try restarting your PC and reconnecting your headset.**<br/><br/>Windows sees your headset monitor, but Windows Mixed Reality is having trouble communicating with the displays on your Mixed Reality headset. To fix this:<br/><ol start="1"><li>Make sure your graphics drivers are up to date (from your graphics card manufacturer's website).</li><li>If you're using an adapter to connect your headset, make sure it [supports Windows Mixed Reality](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/recommended-adapters-for-windows-mixed-reality-capable-pcs).</li><li>If your graphics card has both DisplayPort and HDMI ports, try using the DisplayPort port on your graphics card, and use a supported Mixed Reality DisplayPort-to-HDMI adapter.</li><li>Try restarting your PC.</li></ol> |
|   7-1, 7-2, 7-3  / 2181038087-1, 2181038087-2, 2181038087-3  | **Windows Mixed Reality is having trouble connecting to your headset. Try unplugging your headset and plugging it back in.**<br/><br/>The Mixed Reality headset failed to completely initialize. This is most likely a transient error. Unplug your headset and plug it back in to resolve this issue.
|   7-4  / 2181038087-4  | **Windows Mixed Reality is having trouble connecting to your headset. Try unplugging your headset and plugging it back in.**<br/><br/>The Mixed Reality headset driver failed to initialize the tracking cameras on your headset. This is most likely a transient error. Unplug your headset and plug it in again to resolve this issue.
|   7-5  / 2181038087-5  | **Windows Mixed Reality is having trouble connecting to your headset. Try plugging your headset into a different USB port and temporarily unplugging any other USB devices connected to your PC.**<br/><br/>Windows Mixed Reality lost synchronization between the Mixed Reality camera frame timestamps and your PC timestamps. This could be a transient error, or an indication of USB signal integrity issues. To fix this:</li><li>Temporarily unplug all of your USB devices and peripherals, remove all extension cables, and plug in just your headset.</li><li>Disable any USB suspend/power saving features on your PC, like Selective suspend in Windows power options, the "Allow the computer to turn off this device to save power" setting in Device Manager, and any USB power saving settings in your PC's firmware.</li></ul>
|   7-6  / 2181038087-6  | **There is a problem with your headset firmware. Try unplugging your headset and plugging it back in.** <br/><br/>This can be transient error. Try unplugging and re-plugging in your headset. If that doesn't work:</li><li>Check Windows Updates to ensure that you are running the latest headset driver available.</li><li>Try your headset on another PC. If you see the same error message, your headset will need to be serviced.</li></ul>
|   7-7  / 2181038087-7  | **Windows Mixed Reality is having trouble connecting to your headset. Try plugging your headset into a different USB port and temporarily unplugging any other USB devices connected to your PC.**<br/><br/>The Mixed Reality headset driver failed to initialize the firmware on your headset. This can be transient error. Try unplugging and re-plugging in your headset. If that doesn't work:<li>Temporarily unplug USB devices and peripherals you don't need to run Windows Mixed Reality.</li><li>Check Windows Updates to ensure that you are running the latest available headset driver.</li></ul>
|   7-11  / 2181038087-11 | **Your CPU is too old to be compatible with Windows Mixed Reality.**<br/><br/>Your PC is failing the compatibility check because your CPU is missing the AVX instruction set required by the Mixed Reality motion controllers. You'll need a [Windows Mixed Reality compatible PC](https://www.microsoft.com/en-us/windows/view-all-devices?col=wmr-pcs#icons).
|   7-12  / 2181038087-12 | **Your headset is connected to an incompatible USB controller. Try plugging your headset into a different USB port, if available. Or, try installing a Microsoft USB driver in place of any incompatible drivers.**<br/><br/>Your headset may be plugged in to a USB port connected to an incompatible non-Microsoft USB controller driver. These USB 3.0 controller drivers are often missing the ability to read and handle the [ContainerID descriptor](https://docs.microsoft.com/windows-hardware/drivers/usbcon/usb-containerids-in-windows), which aggregates the disparate parts of the Mixed Reality headset into a cohesive unit (to play audio out of the correct headphones, video out the correct displays, and pull tracking data from the correct sensors). To change your USB controller driver: <ol start="1"><li>Launch Device Manager.</li><li>Expand the category for Universal Serial Bus controllers and right click to uninstall the driver for each item that includes the text "eXtensible Host Controller" **and** does not have "Microsoft" in the name.</li><li>Select "Delete the driver software for this device" to ensure the old drivers are removed.</li><li>Verify that each item that includes the text "eXtensible Host Controller" has "Microsoft" at the end.</li><li>Plug in the HMD.</li></ol>Alternatively, if the issue is intermittent, the HMD might not be properly responding to commands from the HMD driver. To fix, unplug the HMD for 30 or more seconds, then plug it back in. | 
|   7-13  / 2181038087-13 | **Your headset is connected to an incompatible USB controller. Try plugging your headset into a different USB port, if available. If not, you'll need to install a new USB 3.0 controller.**<br/><br/>Windows Mixed Reality is unable to synchronize the Mixed Reality camera frame timestamps to your PC timestamps. This is most likely caused by an incompatible USB 3.0 host controller that does not support ITP (Isochronous Timestamp Packets). Contact your PC manufacturer to see if ITP can be enabled, or switch to another USB Host controller with ITP support. |
|   7-14  / 2181038087-14 | **Windows Mixed Reality is having trouble connecting to your headset. Try unplugging your headset and plugging it back in.**<br/><br/>Windows Mixed Reality is having trouble initializing the presence sensor on your Mixed Reality headset. In Device Manager, the headset will show the error message "PoseThread failed to initialize presence sensor". To fix this:<br/><ol start="1"><li>Unplug your headset, then plug it back in. Make sure the USB cable is plugged in all the way.</li><li>Try another USB port on your PC.</li><li>Try your headset on another PC to see if the headset enumerates completely in Device Manager on that PC.</li><li>Check if any other conflicting HID drivers are installed on your PC, for example from your keyboard or mouse. (Look for any HID devices in Device Manager with a question-mark logo on them.)</li><li>If you are using a Samsung Mixed Reality headset running Windows 10 Version 1709 or Version 1803, follow the instructions for error code 2181038087-12 to check if your USB 3.0 controller is running a non-Microsoft USB controller driver.</li></ol> |
|   7-15  / 2181038087-15 | **Windows Mixed Reality has detected an incompatible WinUSB driver installed.**<br/><br/><ol start="1"><li>Ensure that the WinUSB driver on your PC is the one that comes with Windows, and that any third-party USB drivers have not overwritten the copy of WinUSB on your PC.</li><li>You may need to recover or reinstall your Windows installation if the problem persists.</li></ol> |
|   13-11 / -            | The Mixed Reality Portal has encountered an app registration issue with Windows. Check the Application Event Log (using Event Viewer) to see if there are additional details. |
|   14-1  / -            | The Mixed Reality Portal is having trouble initializing the graphics and composition stack. To fix this:<ul><li>Desktop Window Manager (DWM, a key component of the Windows Graphics stack) may be crashing. Check the Application Event Log (using Event Viewer) to see if this is occurring.</li><li>Try a clean uninstall of your graphics driver, and then install the latest graphics driver from the graphics card manufacturer's website.</li></ul> |
|   14-2  / C0001160-101  | **We ran into a problem connecting to your headset. Try removing any extension cables you might be using, and make sure you've connected the headset to the correct port for your graphics card. If you're using any adapters, make sure they're compatible with Mixed Reality. If you're still having problems, try updating your graphics driver.**<br/><br/>The Mixed Reality display and composition stack failed to initialize. Your PC's graphics card or graphics card driver may not be compatible with Windows Mixed Reality. To check this: <ul><li>Double check that your PC meets the minimum system requirements for Windows Mixed Reality.</li><li>If you are using Dell Inspiron 5577 PCs on Windows 10, version 1809, or newer, you may see this error due to a conflict with Dell's TrueColor graphics post-processing functionality. To work around this issue, use Dell's TrueColor app to turn off the TrueColor capability, then try running Mixed Reality Portal again.</li><li>On a desktop PC, install the latest graphics driver from the graphics card manufacturer's website. On a laptop, install the latest graphics driver for your make and model from the laptop manufacturer's website.</li><li>If you have third party graphics or display software/accessories, temporarily uninstall these apps and drivers.</li><li>Select "Try again" to see if it's a transient issue.</li></ul> |
|   14-3  / -             | **We ran into a problem connecting to your headset. Try removing any extension cables you might be using, and make sure you've connected the headset to the correct port for your graphics card. If you're using any adapters, make sure they're compatible with Mixed Reality. If you're still having problems, try updating your graphics driver.** <br/><br/><ul><li>If you're using any custom modes or refresh rates on your PC monitor, try setting their refresh rates to 60Hz.</li><li>Make sure any adapters you are using support Windows Mixed Reality.</li><li>Try installing the latest graphics driver from the graphics card manufacturer's website.</li><li>Click "Try again" to see if it's a transient issue.</li></ul> |
| 14-4  / -             | **We ran into a problem connecting to your headset. Try removing any extension cables you might be using, and make sure you've connected the headset to the correct port for your graphics card. If you're using any adapters, make sure they're compatible with Mixed Reality. If you're still having problems, try updating your graphics driver.** <br/><br/><ul><li>Your PC may have more PC monitors connected than your graphics adapter can support. Disconnect all but your primary PC monitor.</li><li>Make sure any adapters you are using support Windows Mixed Reality.</li><li>Install the latest graphics driver from the graphics card manufacturer's website.</li><li>Click "Try again" to see if it's a transient issue.</li></ul> |
|   15-5  / -             | **Mixed Reality Portal has lost synchronization with core Mixed Reality and Windows components it depends on.**<br/><br/><ul><li>This could be caused by a performance issue with your PC. Make sure your CPU, GPU and HDD are not pegged in Task Manager.</li><li>Temporarily disconnect all other USB devices from your PC.</li><li>Restart your PC.</li></ul> |
|   -     / H0002000-0    | **Your PC's operating system has gotten into a mismatched state for Windows Mixed Reality**<br/><br/>Check Windows Updates for updates. |
|   -     / S0002261-101, S0002361-101 | **A problem with a Mixed Reality shell component is preventing Mixed Reality Portal from starting properly**<br/><br/><ul><li>Open the Application Log using Event Viewer on your PC to check for any application crashes at around the time you tried to start Windows Mixed Reality.</li><li>Make sure your graphics driver is up-to-date.</li><li>The HDMI adapter you are using is incompatible with Windows Mixed Reality. See the supported and recommended HDMI to mini display port (DP) dongle [here](recommended-adapters-for-windows-mixed-reality-capable-pcs.md).</li></ul> |


## Motion controller problems

### My Motion controllers aren't working properly.

If your [motion controllers](https://support.microsoft.com/en-us/help/4040517/windows-10-controllers-windows-mixed-reality) aren’t working, aren't connecting, or if you don’t see an image of the controllers when you’re wearing your headset, try the following:
1. Make sure your controllers are turned on. To turn them on, press and hold the Windows button for two seconds.
2. Make sure the controllers are fully charged and replace the batteries if they are not.
3. Turn the controllers off and on again while holding them in front of you. Press and hold the Windows button for four seconds to turn a controller off, then press and hold it again for two seconds to turn it on. 
4. Select **Settings > Devices > Bluetooth & other devices** on your PC and make sure the controllers are listed as paired. If they’re not, you’ll need to [pair them](https://support.microsoft.com/en-us/help/4040517/windows-10-controllers-windows-mixed-reality). 
5. Make sure the motion controllers show up as "Connected". "Paired" does not necessarily mean the controllers are connected to the PC. Controllers should appear under "Mouse, keyboard & pen" category. Motion controllers under "Other devices" have failed the pairing process and are not functional. Check the motion controllers LEDs: Brightly lit controllers are paired and connected, dimly lit controllers aren't connected.
6. Go to **Start  > Mixed Reality Portal** on your PC and select "Menu". You should see your motion controllers listed, along with a status message:
    * Ready – The controllers are all set.
    * Lost tracking – Mixed Reality Portal can’t find your controllers. Hold them in front of your headset and restart them by pressing the Windows button for 4 seconds, then again for 2 seconds.
    * Low battery – Replace the controller batteries.
7. If you're using an external USB Bluetooth Adapter, make sure it’s plugged into a black USB 2.0 port. It should also be plugged in as far away as possible from any other wireless transmitters or USB flash drives, including the USB connector for your headset. 
8. Verify that there’s only one Bluetooth radio in the PC by right clicking on the Windows Start Menu and select Device Manager. Expand the Bluetooth section and look for one Adapter. If you are using the desktop PC configuration with built-in radio, check if an external antenna is connected. If there is no external antenna connected, it can cause tracking issues. Or use an external bluetooth dongle (USB), disable the internal Bluetooth capability, and retry pairing and connecting.
9. Close the Bluetooth settings window if it's open. If it is open in the background, a lot of extra calls are made to the Bluetooth protocol.
10. Check the virtual battery level on the motion controller. In mixed reality, turn the controllers over, and you'll be able to see a battery icon. If it is red, replace the batteries. Battery reporting typically reports higher than the actual level immediately after connecting a controller. Wait about 15 seconds to let the battery level stabilize and then read the level.
11. Remove Bluetooth headphones and speakers in **Settings > Devices > Bluetooth & other devices**, and turn the devices off. Use the headphone jack or built-in speakers on your Mixed Reality headset for the best audio experience.
12. If you have other Bluetooth devices paired with your PC, such as headphones or gamepads, remove some of them. Select **Settings > Devices > Bluetooth & other devices on your PC**, select the devices, and then select "Remove device".
13. Unplug the USB cable on your headset and plugging it back into the PC to restart the controller functionality on the PC.
14. Controller lights flash when they are undergoing a firmware update. Wait for the firmware update to complete and the controllers should appear in Mixed Reality.
15. Make sure your PC is connected to a 5GHz Wi-Fi network. If your laptop is connected to a 2.4GHz Wifi network, it is typically sharing the Bluetooth connection. This may negatively impact either Wifi or Bluetooth performance, depending on the product design. Change the preferred band to 5Ghz in the network adapter settings. If your network does not support 5GHz, a Bluetooth dongle can be used instead of the internal Bluetooth capability.
16. If your Bluetooth settings have motion controllers already paired, Windows won’t discover the new devices until those are removed (if they have been added using a specific dongle, they can be only removed with that dongle).
17. If your PC has built-in Bluetooth and you’re having connection problems, try using a USB Bluetooth adapter instead. To do this, you’ll need to turn off your built-in Bluetooth radio in Device Manager and then pair your other Bluetooth devices with the new adapter.

### Motion controller troubleshooting flowchart

![Troubleshooting Flow Chart for Motion Controllers](images/motion-controllers.jpg)

### My controller is stuck in an infinite reboot (buzzing after LEDs cycle).

This is a critical battery indicator, so make sure you have fresh batteries in the device. If the issue persists, perform [device recovery](motion-controller-problems.md#how-can-i-restore-the-controllers-to-factory-settings) to reset the controller to factory settings.

### I'm trying to pair my controllers, but they never show up in the "Add a new device menu" in Bluetooth Settings.

Check that you do not have controllers paired already, remove them and try again. If problem persists restart the PC and try again. If that fails, consult the [Bluetooth FAQs](motion-controller-problems.md#how-can-i-tell-if-im-using-bluetooth-technology).

### Wi-Fi speeds becomes slow on my notebook when motion controllers are turned on.

Your notebook may share its Wi-Fi antenna with Bluetooth when connected to 2.4GHz access point. Check from device manager if you can switch band preference to 5GHz. If 5GHz network is not available and performance is severely impacted, consider using a Bluetooth dongle.

![Wifi band selection settings can be found through device manager](images/wifi5ghz.png)

### My second controller takes a long time to reconnect.

Some older Intel radios experience this issue if motion controllers are powered on at the same time. Avoid powering on controllers at the same time.

### My Qualcomm Bluetooth radio cannot pair controllers after a PC crash.

Qualcomm (QCA) Bluetooth radio drivers prior to 10.0.0.448 may end up in bad state after a Windows crash. Power off the PC completely to workaround this problem. 

### I'm experiencing poor controller tracking with Marvell radio.

Go to **Device Manager > Bluetooth > Marvell AVASTAR Bluetooth Radio Adapter > Properties > Driver** and make sure that you are using driver 15.68.9210.47 or later.

### The Mixed Reality Portal is working, but my motion controllers are tracking poorly (controllers keep flying away, shaking, etc.).

1. Some lighting conditions can affect tracking. Make sure that you are not exposed to direct sunlight and that you don't have a lot of point light sources visible to your HMD (for example, strings of lights like a christmas tree). 
2. Check the [Bluetooth FAQs](motion-controller-problems.md#how-can-i-tell-if-im-using-bluetooth-technology). These symptoms are generally caused by failures to communicate between the controller and the host PC, and indicate poor Bluetooth link quality.

### Motion Controller LEDs are not lit, but the buttons and thumbstick still work in Mixed Reality Portal.

The Motion Controller calibration cache may be corrupt. To delete the cache, run the following command in an Administrator Command Prompt:

`rmdir /S /Q C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Windows\MotionController\Calibration`

This folder is not accessible in Windows Explorer and can only be modified from an Administrator Command Prompt. After you have deleted the folder, restart your PC and reconnect your Motion Controllers to restore the calibration files.

### Motion controllers do not appear in SteamVR apps and games.

If you're able to see your Motion Controllers in the cliff house, but not in SteamVR apps and games, the Motion Controller model driver may not be installed properly. This driver is automatically downloaded and installed via Windows Update, but if you're on a PC that has enterprise policies or if Windows Update is otherwise restricted, you may need to install this manually. To check that the Motion Controller model driver is correctly installed:
1. Turn on both of your motion controllers, and make sure they show up as "Connected" in the Settings app under **Devices > Bluetooth & other devices**. If they do not show up or show up as "Paired", [pair them](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/set-up-windows-mixed-reality).
2. Open Device Manager and look for "Motion controller - Left" and "Motion controller - Right" under "Bluetooth".
3. Select either device and then go to **View > Devices by Connection**.
4. You will now see a view of the Motion Controller Bluetooth devices roll up to your Bluetooth radio. Under the same node as the two Motion Controllers should be two "Bluetooth HID Device" devices, and under each Bluetooth HID Device should be devices named "Motion Controller" (with gray icons).
5. Double click each of the "Motion Controller" devices and go to the **Driver** tab. Confirm that the Driver Version listed corresponds to one of [these Motion Controller model driver versions](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/mixed-reality-software#mixed-reality-motion-controller-model-driver-release-history).

To manually download and install the Motion Controller model driver, visit [this page](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/mixed-reality-software#mixed-reality-motion-controller-model-driver-release-history) and look for the driver version corresponding to your version of Windows 10. Installation instructions are available on the download page.

### The Motion controllers firmware update takes significantly longer than two minutes.

Check the [Bluetooth FAQs](motion-controller-problems.md#how-can-i-tell-if-im-using-bluetooth-technology). Poor Bluetooth link quality is usually the cause of these problems.

### I just inserted fresh batteries but the controller virtual battery level does not indicate full level.

Motion controller battery level is tuned for AA batteries. Some low voltage rechargeable batteries may not report as full although being fully charged.

### My controller does not vibrate when battery is low.

Haptics is disabled when battery level gets low. Replace your batteries.

### My device vibrated three times and then shutdown.

Your batteries are running low and hit the cut-off threshold. Replace your batteries.

### My Samsung motion controller’s touchpad is off-center or has a dead spot.

This is probably a hardware defect and you should go back to your retailer or equipment manufacturer for a replacement or exchange.

### The controller isn't working correctly and I can't update the device.

Restore it to factory conditions (you will need fresh batteries):
1. Unplug and power off the controllers.
2. Open the battery cover.
3. Insert your new batteries.
4. Press and hold the pairing button (the tab at the bottom under the batteries).
5. While holding the pairing button, power on the controller by pressing and holding the Windows button for five seconds (keep both buttons depressed).
6. Release the buttons and wait for controller to power on. This takes up to 15 seconds and there are no indicators when device recovery is happening. If device powers on immediately on button release, the recovery button sequence did not get registered and you need to try again.
7. Go to **Settings > Bluetooth > other devices**, and select "Motion controller - Left" or "Motion controller - Right" and "Remove device") to remove old controller associations from Bluetooth settings. 
8. Pair the controller with the PC again.
9. After connecting with the host and HMD, the device will update to the latest available firmware.

### Lights and indicators

The LED constellation ring and haptics indicate the state of the motion controller.

| State    | What causes the state | Light and vibration behavior associated with the state |
|----------------------------|-----------------------------|----------------------------------------------------------------------|
| **Power on**               | Press and hold Windows button on controller for two seconds to turn on the controller.       | LEDs turn on and controller vibrates once. |
| **Power off**              | Press and hold Windows button on controller for four seconds to turn off controller.      | LEDs turn off and controller vibrates twice. |
| **Sleeping**               | The controller enters sleeping state automatically when it’s motionless for 30 seconds. The controller automatically wakes when it detects motion except when the device is not paired with the host PC. In that case, a button press will be required to wake it up. | LEDs turn off and blink every three seconds while in sleeping state. |
| **Pairing**                | Press and hold pairing button inside battery case for three seconds.     | LEDs slowly pulse while in pairing mode, and go solid when exiting pairing mode. The controller vibrates once if pairing was successful or vibrates three times if pairing is unsuccessful and times out. |
| **Controller connects/disconnects from PC** | The controller successfully connects to PC after you turn it on, or the controller disconnects from the PC during use for some reason.| The controller vibrates once on PC connection or disconnection. |
| **Low Battery Level**      | The battery level is low.| There is no LED or vibration indication when battery is low. There is a battery indicator icon on the handle of the controller representation in headset. When battery is low, the indicator icon will show 1/4 full. |
| **Critical Battery Level** | During power on when battery level is "Critical". "Critical" battery level means there is insufficient power and the controller will turn off automatically.| The controller vibrates three times when you turn it on and then automatically turns off. As you approach this state, the battery indicator icon will display red. |


### How can I tell if I'm using Bluetooth technology?

Motion controllers use the same Bluetooth technology found in many consumer devices and are designed to work with the Bluetooth capability included in any recent PC. To verify that your PC has a Bluetooth radio (it should if the device passed the Mixed Reality Compatibility Checker): 
* Right click on the Windows Start Menu and select "Device Manager". 
* Expand the Bluetooth section and look for an adapter. 
* If your PC doesn’t have Bluetooth, one recommended dongle is the [Plugable USB Bluetooth 4.0 Low Energy Micro Adapter](https://www.amazon.com/Plugable-Bluetooth-Adapter-Raspberry-Compatible/dp/B009ZIILLI/ref=sr-1-1?ie=UTF8&qid=1490148230&sr=8-1&keywords=plugable+broadcom).\
![Screenshot of an Example Device Manager. The Adapter is the Bluetooth radio.](images/devicemanagerbtadapterpic.png) 


### My PC has Bluetooth technology but I'm having problems with my motion controllers.

Motion controllers should work with other Bluetooth keyboards, mice, and game controllers, but the experience will vary depending on the model of keyboard, mouse, or game controller you use. Here are some things you can do to improve performance:
* If your computer has Bluetooth but you are still having problems with the motion controllers, consider replacing your Bluetooth radio with the Plugable external Bluetooth Adapter plugged into USB. Note that you can only have one Bluetooth radio adapter active at a time. If you plug in an external radio in addition to an existing radio you need to disable your existing Bluetooth radio in Device Manager (right click on the adapter and select "Disable Device") and un-pair/re-pair all of your previous Bluetooth devices.
* If you're using a USB Bluetooth Adapter, connect it to a USB 2.0 port (2.0 ports are black and aren’t labeled "SS"), if available. The port should be physically separated from:
    - the HMD USB connector
    - flash drives
    - hard drives
    - wireless USB receivers like those for keyboards/mice
Ideally, plug the USB Bluetooth Adapter into the opposite side of the computer as far as possible from these other connectors.
* Do not install any third party software.
* Close the Bluetooth settings window if it's open. Leaving it open in the background means that a lot of extra calls are made to the Bluetooth protocol.
* Disable "Show notification to connect using Swift Pair" setting under Bluetooth & other devices to reduce host radio scanning activity.
* If you are using an internal Bluetooth card, please ensure you are using an external Bluetooth antenna. 
  * Lack of external Bluetooth antenna in this case is known to cause tracking issues. 
  * If this doesn’t work, please use an external Bluetooth dongle (USB) after disabling the internal Bluetooth.
* It is important that the device appears under the "Mouse, Keyboard & Pen" category in the Bluetooth settings. If under "Other devices" then unpair and pair the device.
* Remove, un-pair, and power off Bluetooth headphones and speakers. These are not supported with Windows Mixed Reality. You can use the headphone jack or built-in speakers on your Mixed Reality headset for the best audio experience.

### How can I pair my motion controllers to a Windows Mixed Reality headset with built-in Bluetooth radio, or return them to their factory pairing?

Some Windows Mixed Reality headsets, including the Acer OJO 500 and Samsung Odyssey+, have built-in Bluetooth radios for use with motion controllers. The motion controllers that come with these headsets are pre-paired to the headset from the factory, and do not require your PC to have a separate Bluetooth radio. These motion controllers _can_ be manually paired to your PC's Bluetooth radio, for example, for use with Windows Mixed Reality headsets that do not have built-in Bluetooth radios. To return the motion controllers to their factory pairing, or to pair them with a Windows Mixed Reality headset with built-in Bluetooth radio, run the headset's device companion app (for example, the "Acer OJO 500" app or the "Samsung HMD Odyssey+ Setup" app, automatically installed the first time the headset is plugged in) and follow the instructions for motion controller pairing.


## Performance questions

### How can I tell if the Windows Mixed Reality headset is rendering at 60Hz or 90Hz framerate?

Check the **Device Portal > Performance** tab. 

**Note**: If you have a discrete GPU with HDMI 2.0 ports and a CPU with four or more physical cores, you should be getting 90 Hz. If your GPU only has a HDMI 1.4 output, you can use a DisplayPort to [HDMI 2.0 adapter](https://holodocswiki.com/wiki/Recommended_adapters_for_Windows_Mixed_Reality_Capable_PCs) as a workaround. 

**Note**: The **Headset display > visual quality settings** only affect the rendering of the Windows Mixed Reality Home experience.

### What do I do if my PC appears to be running slowly?

The system may be sluggish for many reasons and in most cases this will subside after a few seconds. If you experience this problem over long periods of time:
1. Close all unused application on the desktop.
2. Ensure that your laptop is plugged into a power source.
3. Ensure that the PC is not warming up.
4. Lower the visual quality in your Windows Mixed Reality Home.
5. Ensure that you have the latest graphics drivers for your PC (see the graphics drivers section).

### My PC is warming up as I run the Mixed Reality experiences. How do I keep it cool?

1. Ensure that the battery is charged and power source is plugged in.
2. Make sure that the fans that blow air into or out of the PC are not blocked.
3. Use the PC in a relatively cool environment.
4. Make sure there are no heat sources (for example, the sun or heat vents) pointed at the PC.

### My visuals are choppy, load slowly, or don't look good.
* Make sure your headset is plugged into the correct graphics card on your PC. Some PCs have both integrated and discrete graphics cards. The discrete card will generally provide the best performance. [Learn more about PC hardware](https://support.microsoft.com/en-us/help/4039260/windows-10-mixed-reality-pc-hardware-guidelines).
* Close unused applications on your desktop.
* Make sure your headset fits snugly (move it lower and higher or left and right to adjust).
* Adjust your headset's visual settings in **Settings > Mixed reality > Headset display**. When "Visual quality" is set to "Automatic", we'll choose the best mixed reality experience for your PC. For an experience with more visual detail, set "Visual quality" to "High". If your visuals are choppy, you may want to select a lower setting.
* Try adjusting your headset's calibration. The lenses should be adjusted to match your interpupillary distance (IPD), the distance between your pupils. If you don't know your IPD, an optometrist should be able to measure it for you. There are also websites designed to measure IPD. Once you know your IPD, use your headset's calibration knob to make adjustments. If the headset doesn't have a calibration knob, select **Settings > Mixed reality > Headset display** and adjust the "Calibration control".


## Tracking system problems

### The system cannot find the boundary and I'm being presented with setup UI.

This means that the tracking system was unable to recognize your environment. If you are in a new environment, you must set up the [boundary](https://docs.microsoft.com/windows/mixed-reality/enthusiast-guide/set-up-windows-mixed-reality#set-up-your-room-boundary). If you have previously used the device in this environment and set up a boundary:
* Make sure the room has enough light.
* Make sure you have worn the device and looked around the room. The device must observe your environment to know where it is. It will not find your bounds if it is sitting on a desk or table.
* Unplug the device, close Windows Mixed Reality, and plug the device in again.
* Something may have changed in your environment and the device no longer recognizes it. Try setting up a new boundary.

If these steps do not resolve the problem, then delete your environment data and set up the boundary again.

### The system is presenting me with UI that asks me to choose setup for all experiences or seated/standing, and I see my bounds.

The device is taking too long to find the bounds. You can bypass this message by choosing the option to use a boundary and you will be taken to your Windows Mixed Reality Home with your bounds present.

### I frequently see a message saying "I've lost my bounds".

The tracking system is having a hard time tracking and identifying your environment. In this state, the device can no longer display your bounds and the headset switches to 3DOF to keep you from to bumping into things in the real world until it locates your bounds again. To fix this:
1. Make sure that the room has enough light.
2. Rerun the setup if you recently redecorated or remodeled the room.
3. Unplug the device, close Windows Mixed Reality, and plug it in again.
4. Clear your environment data and set up the device again.
5. If the message persists, contact customer support.

### I can look around but I can't translate (I'm stuck in 3DOF).

This means that the tracking system cannot generate pose, or the application has stopped using new pose data to render. Check the following:
* Make sure the room has enough light.
* Make sure the room has enough details to track.
* Unplug the device, close Windows Mixed Reality, and plug in the device again.
* If the message persists, contact customer support

### The view in the HMD is completely frozen.

This usually means the application or a system level component has failed. Try to:
1. Press the "home" button to leave the application.
2. Unplug the device, close MRP and plug the device back in.
3. Reboot the PC.

### I frequently see a black border around the edges of the view in the HMD. Sometimes it looks like I'm looking down a tunnel.

This means that the application is not able to hit frame rate on your PC and the system is using old frames to render the view in the HMD. Since applications only render the part of the world you are looking at, if they do not consistently hit their frame rates, then the system will attempt to continue to render the world from a previous point of view and will fill in the missing details with black. If this happens frequently:
1. Close or terminate all unneeded programs to free up memory and CPU.
2. Reduce detail settings in your application.
3. Reduce detail settings in Windows Mixed Reality settings.

### The view in the HMD is jittering and stuttering a lot.

There are several reasons this may happen. The primary causes are the system not being able to render content to the headset, or the tracking system is experiencing problems. Check the following:
1. Make sure your PC is not under resource contention. Open Task Manager and ensure your compute resources are free (for example, 80% CPU free, 400MB of ram and disk IO is below 80%).
2. Make sure you have the latest graphics drivers for your hardware. See the graphics driver section for more info.
3. Make sure the room has enough light.
4. Unplug the device, close Windows Mixed Reality, and plug the device in again.
5. Reboot your PC.
6. If the problem persists, contact customer support.

### The world briefly froze and perhaps tilted or flipped upside before returning to normal.

This could be caused by an app or system level component hitting a fatal error, or a temporary lack of memory or CPU resources. Check the following:
1. Open "Task Manager" and ensure you have at least 20% CPU free and 400MB memory free (e.g. 80% CPU free, 400MB of ram and disk IO is below 80%).
2. Open "Event Viewer" and go to **Windows Logs > Application and Error** event entries around the time of the freeze. Check to see if any processes crashed.
3. Try rebooting the PC if this problem persists.

### The world flipped upside down momentarily and returned to normal.

This is typically caused by errors in obtaining sensor data from the headset to inform the tracking algorithms. If this happens frequently:
1. Plug the headset into a different USB 3.0 port.
2. Plug the headset directly into the PC rather than a USB 3.0 hub.
3. If the problem persists, contact customer support.

### The world is tilted but I can navigate and walk around fine in Windows Mixed Reality.

This is usually caused by sensor data errors being recorded into the environment data that is stored on your PC. This can cause the Windows Mixed Reality to appear tilted, sometimes permanently. Try the following:
1. Unplug the HMD, close Windows Mixed Reality and plug the headset back in.
2. Reboot the PC.
3. Clear your environment data.

## WebVR questions

### Why can’t I see my controllers when viewing VR content from Edge?

Not all WebVR content is authored to support motion controllers. WebVR allows developers of content to support different types of input, such as game controllers or motion controllers. If you do not see your controllers on a site, it likely doesn’t have motion controller support.

### Why can't I use the mouse in an immersive WebVR view?

This is an optional feature of the WebVR specification. Not all browsers support this feature, and not all WebVR content is authored to support mouse input. WebVR allows content developers to support different types of input, such as mouse, keyboard, game controllers or motion controllers. Mouse input behavior varies per browser. Within Microsoft Edge, website authors must ensure they take 'pointerlock' when presenting to the headset for mouse input to work.

### Why does my controller look like a Vive/Oculus, has strange orientation, or the buttons are incorrectly mapped?

The website likely doesn’t have full motion controller support.

### Why can’t I view 360 degree videos from Youtube/Facebook/Vimeo/The Guardian/New York Times, etc. from Edge in VR?

Just like any other web specification or standard, the author has the choice to implement it or not. There is a WebVR specification that allows websites to launch VR experiences directly from the browser and the authors of these websites have not implemented this specification at this time. There may be downloadable apps on some platforms that enable viewing of VR content from these vendors.

### Why can’t I enter VR from Firefox or Chrome?

WebVR is only supported by Windows Mixed Reality devices in Edge at this time.

### When I enter VR from a website, why do I see a blank screen in my headset?

The website may not have implemented support for Multi GPU machines (including Hybrid GPU laptops). Try to:
* Reload the page.
* On desktop machines, plug the headset into the same graphics adapter as the monitor that is displaying Microsoft Edge. Plug both into the higher powered graphics card, not into the integrated graphics adapter.

### When I exit VR when watching a video from Edge, the sound continues playing but the Edge window is grayed out.

This is a known issue when running WebVR from Edge in the Mixed Reality cliffhouse. To resolve it, press escape on the keyboard rather than pressing the windows button to exit the WebVR experience, or activate the greyed out Edge window by selecting it and then stop the video.

### Can I use WebVR on the HoloLens?

Microsoft has not announced anything about WebVR on the HoloLens at this point.

### Why is my view at floor level when viewing WebVR content from Edge?

The website does not properly support Windows Mixed Reality headsets. To work around this:
1. Place the headset on the floor of your space.
2. Navigate to the WebVR page using Microsoft Edge on your desktop (not within Mixed Reality).
3. Click the button on the webpage to Enter VR.
4. Wait 5-10 seconds for the experience to fully enter immersive mode.
5. Pick up the headset and place it on your head.

### The display is very low resolution in some WebVR experiences.

The websites do not properly support high resolution headsets. To workaround this:
* If launching WebVR from the desktop (as opposed to from within the Mixed Reality cliffhouse), ensure the window is maximized prior to Entering VR.
* Avoid resizing the Microsoft Edge window after you have entered VR.

### Why does the WebVR immersive view exit when I change browser tabs?

This is expected behavior. For security reasons, only the active browser tab can access connected headsets.

### Why can't I hear audio on a particular WebVR experience?

The website may be using the OGG audio file format, which Microsoft Edge does not currently support.

You can report broken sites directly to the Microsoft Edge browser team in the [issue tracker](https://developer.microsoft.com/en-us/microsoft-edge/platform/issues/), or via twitter using [#EdgeBug hashtag](https://blogs.windows.com/msedgedev/2016/08/11/edgebug-twitter/).

### Why does Haptic feedback not work in WebVR with motion controllers?

Microsoft Edge does not currently support haptics on the WebVR gamepad API extensions.


## SteamVR questions

### How can I play SteamVR games in my Windows Mixed Reality immersive headset?

You must install Windows Mixed Reality for SteamVR on your PC and set up SteamVR:
* [Download and install SteamVR](https://steamcdn-a.akamaihd.net/client/installer/SteamWindowsMRInstaller.exe).
* Start SteamVR. The SteamVR Tutorial should start automatically.
* Connect your headset to your PC and turn on your motion controllers.
* Once the Windows Mixed Reality home has loaded and your controllers are visible, open the Steam app on your desktop.
* Use the Steam app to launch a SteamVR game from your Steam library. To launch SteamVR games without taking off your headset, you can find and launch them under Windows Mixed Reality's **Start > All Apps**. 

### I get a message that says “To use SteamVR with Windows Mixed Reality, you need to install the latest Windows Update" or "Windows Developer Mode Required".

1. Make sure your PC is running the latest version of Windows 10. To check this, go to **Settings  > System > About**. Under "Windows specifications", make sure "OS Build" is 16299.64 or greater.
2. Make sure you don’t have any updates waiting to download or install. Go to **Settings  > Update & Security > Windows Update** and select "Check for updates". You may have to check for updates multiple times so keep checking for updates until no further updates are available and then restart your PC.

### SteamVR is crashing after updating Windows.

Some older versions of Windows Mixed Reality for SteamVR are no longer compatible with Windows. You may have an old version of Windows Mixed Reality for SteamVR. To ensure that you are up to date:
1. In your Steam library, go to **Software > Windows Mixed Reality for SteamVR**.
2. Right click it and go to "Properties".
3. Select the "Update" tab and select "Always keep this application up to date".
4. Force the update by going to the "Local Files" tab and selecting “Verify integrity of application files”.
5. Restart Steam and SteamVR.

If SteamVR is still crashing after updating you may have two installations of Windows Mixed Reality for SteamVR on your machine. To confirm if this is the case:
1. Locate %localappdata%\openvr\openvrpaths.vrpath and open it in Notepad.
2. Under the "external drivers" sections look for multiple entries for "MixedRealityVRDriver" 
   ```json
   "external_drivers" : [
      "D:\\Steam\\steamapps\\common\\MixedRealityVRDriver",
      "E:\\Steam\\steamapps\\common\\MixedRealityVRDriver"
   ],
   ```
3. If you see multiple entries, remove the older of the two entries. Note that once you have only one entry there should no longer be a comma at the end of the line, for example:
   ```json
   "external_drivers" : [
      "D:\\Steam\\steamapps\\common\\MixedRealityVRDriver"
   ],
   ```
4. Save the file and close it.
5. Restart Steam and SteamVR.

### My controllers aren't working as expected in SteamVR.

1. Close SteamVR.
2. Return to the Mixed Reality Home and confirm that your controllers are working as expected.
3. Launch the SteamVR experience again and your controllers should be back to normal.
4. If issues persist please file feedback using the [Windows Feedback Hub](https://support.microsoft.com/en-us/help/4021566/windows-10-send-feedback-to-microsoft-with-feedback-hub-app) under the Mixed Reality category and include SteamVR in the summary.

Note that you'll use your motion controllers differently in different games. Here are a few basics to help you get started:
* To open the Steam dashboard, press straight down on the left thumbstick.
* To exit a SteamVR game and return to the Windows Mixed Reality home, press the Windows button. Then select the Mixed Reality Home button that appears on screen.

### My left and right controllers are reversed in SteamVR.

Start the game with your controllers off and then turn the left one on, followed by the right one.

### My games are running slowly.

1. Confirm that your PC meets the specifications for SteamVR in Windows Mixed Reality
2. Confirm that your PC meets the specifications for the SteamVR game you are playing.
2. In Mixed Reality Portal on your desktop, select "Pause" to stop desktop preview.
3. Follow the instructions above to make sure you are running Windows 10 build 16299.64 or later.
4. Make sure your PC has the latest graphics drivers.
5. Check Task Manager to see what other processes might be running on your PC and consuming resources.
6. Check to see if Steam is downloading a game in the background. This can consume resources and make games run poorly.
7. There is a known performance issue that affects a small class of apps that do not have a visible window, for example, SteamVR Home. The vast majority of apps do not fall into this category, and a fix will be available in a future update.

If you're still running into unexpected performance issues, please send us feedback using the Windows Feedback Hub. Make sure to follow the instructions to [include a SteamVR Performance Trace](using-steamvr-with-windows-mixed-reality.md#sharing-feedback-on-steamvr). 

### SteamVR is showing a compositor error (for example, "Shared IPC Compositor Connect Failed (400)").

There is a known issue where this can happen if your headset and primary monitor are on two different video adapters. Attach your monitor to the same adapter as your headset and configure that monitor to be the primary monitor in **Settings app > System > Display**.

### SteamVR content appears in the wrong place, like beneath the floor or above my head.

Reset your position: 
1. Click the left controller's thumbstick to bring up the "SteamVR Dashboard".
2. Select the "Settings" button.
3. Select "Reset Seated Position".

### My Steam app closed unexpectedly.

The Steam app will close if you lock your PC screen, remove your headset, switch users, or if your PC goes to sleep.


## Speech and audio problems

### I can't hear any sound in my headset, or sound is playing through my computer instead of my headset.

* If your immersive headset doesn’t include built-in headphones, you’ll need to connect headphones to the audio jack on the headset. The jack is often located just behind or under the headset visor or lenses. Check with your headset manufacturer if you can't find it.
* Some audio headsets have physical buttons to control the volume. If audio isn't working, check to see whether the volume is turned down or muted.
* Windows Mixed Reality is designed to play sound through your immersive headset when the Mixed Reality Portal is running and you have headphones connected to it. When you take the headset off or flip the visor up, close the Mixed Reality Portal application, or when that app has not been used for 15 minutes, audio will switch to your default Windows playback device. You can change this setting in **Settings > Mixed reality > Audio and speech.**
* Make sure your audio headset is plugged into the audio jack completely. The Acer headset in particular may require more care to ensure the audio headset is plugged in all the way.
* Check that the audio headset/microphone is plugged into the headset and not the PC.
* The Windows Sound Control Panel only shows enabled audio endpoints, not disabled endpoints. The headset audio device will be disabled when you're not wearing the headset, so you have to right-click in the sound control panel and choose "Show disabled devices" to see it; the device name is "Realtek USB2.0 Audio". Once you do this, you can change the name in the "Properties" page to something you'll recognize more easily. You can do this for both the playback and recording tabs.
* If your audio is not working in Mixed Reality apps (for example, Netflix), this may be caused by a known issue where Windows Mixed Reality is not be automatically updated to match the OS version. To fix this issue and get the best Mixed Reality experience, go to **Settings > Update & Security > Windows Update > Check for Updates**.

**Note:** Windows Mixed Reality spatial audio works best with headphones built into or connected directly to your immersive headset. PC speakers or headphones connected to the PC might not work well for spatial audio.

**Note:** Windows Mixed Reality doesn’t support Bluetooth audio headsets.

### I'm experiencing sudden volume changes, lost audio, or buzzing.

* Some applications, including many of those launched through SteamVR, can lose audio or hang when the audio device changes as you start or stop the Mixed Reality Portal. Restart the app after you have opened the Mixed Reality Portal app to correct this.
* If another multimedia USB device (such as a web cam) shares the same internal or external USB hub with the Windows Mixed Reality headset, the headset's audio jack/headphones may occasionally have a buzzing sound or no audio at all. Plug your headset into a USB port that uses a different hub or disconnect/disable your other USB multimedia device.
* If you notice a loud burst of noise from headphones connected to the headset, it is possible that the PC's USB hub is not able to provide enough power to the Windows Mixed Reality headset. If this occurs, file a [Feedback Hub](https://docs.microsoft.com/hololens/hololens-feedback) bug immediately. Workarounds that may help include not using extension cables, using a dedicated, external powered USB 3.0 HUB, or trying a different USB port on the PC.

### My Bluetooth audio headset isn't working as expected.

Microsoft does not recommend using Bluetooth audio headsets with Windows Mixed Reality. Bluetooth audio peripherals do not work well with Windows Mixed Reality voice and spatial sound experiences, and Bluetooth audio headsets cannot support microphone input and stereo output at the same time, so you won't hear stereo or spatialized sound when using it for gamechat or other voice input. Bluetooth audio headsets can also negatively affect your motion controller experience. 

### Sound isn't coming from expected directions.

The Windows Mixed Reality home includes spatial sound (audio that sounds like it comes from the apps located in your home). As you turn around and move closer or farther from each app, the sound direction and level will change to further the sense of realism. Here are some reasons for unexpected sound directions: 
* When you open and play music from a background-capable music app (like Groove Music) in your home and then open an immersive VR experience (like a game), the sound from the music app will crossfade from spatial sound to stereo. It may appear louder than before because there is no longer any distance between you and the sound.
* If you had Cortana enabled on your host PC prior to using your Windows Mixed Reality headset, you may lose the spatial sound applied to the apps in your Windows Mixed Reality home. To fix this, either turn off "Let Cortana respond to Hey Cortana" in **Settings > Cortana** on your desktop before launching Windows Mixed Reality, or enable "Windows Sonic for Headphones" from within the Desktop app window in Windows Mixed Reality home:
    1. Left-click the speaker icon on the desktop taskbar and select it from the list of audio devices.
    2. Right-click the speaker icon on the desktop taskbar and select "Windows Sonic for Headphones" in the "Speaker setup" menu.
    3. Repeat these steps for all of your audio devices (endpoints).

### Speech commands are not working as expected.

* To use speech commands, speech and language settings on your PC must be set to a [language supported in Windows Mixed Reality](https://support.microsoft.com/en-us/help/4039262/windows-10-mixed-reality-setup-faq#Languages). To check your Windows speech and language settings, select **Settings  > Time & language > Region & language** and **Settings  > Time & language > Speech**.
* If your headset doesn’t have a built-in microphone, you’ll need to attach headphones with a microphone to the headset or to your PC. To have microphone input switch automatically to your headset when you wear it, go to **Settings > Mixed reality > Audio and speech**, and turn on "When I wear my headset, switch to headset mic".
* Some audio headsets have a physical button to mute and unmute the microphone. If speech commands aren't working, check to see whether your microphone is muted.
* Audio headsets with a microphone that dangles from the earbud cable do not perform well for voice commands in environments with ambient noise.
* Cortana can be slow the first time she is invoked in a Mixed Reality Portal session. Go to **Settings > Cortana > Talk to Cortana** and make sure "Let Cortana respond to Hey Cortana" is enabled.
* On some PCs, the default voice capture gain for your headset-connected microphone may be set too low. If you experience unreliable speech commands or dictation, you can try running the Microphone Setup troubleshooter. You can reach this troubleshooter through the **Settings > Time & Language > Speech**, then select "Get Started" in the "Microphone" section. Do this through the Desktop app in the Windows Mixed Reality home while wearing the headset to affect the microphone you use for Windows Mixed Reality. Select the appropriate endpoint in the troubleshooter wizard.

### I only have one audio headset and I want to use it for both Desktop and my headset.

If you only have one audio headset and do not have a headset with built in headphones, connect the audio headset to the host PC instead of the headset. Then turn off "switch to headset audio" in the MRP settings.

### I want to switch to Dolby Atmos for Headphones.

Windows Mixed Reality environments and its applications use Windows Sonic for Headphones spatial audio technology which is customized for mixed reality experiences. Other spatial audio technologies, like Dolby Atmos for Headphones, can be applied for full screen applications like SteamVR games but not for the Windows Mixed Reality shell environments and applications (such as placing a web browser on the wall of the Cliff House or the Sky Loft) which have been designed using Windows Sonic for Headphones spatial sound and acoustics.


## Questions about Desktop in Mixed Reality

### How do I access my PC desktop in Mixed Reality?
You can access your PC desktop in Mixed Reality using the Desktop app. Launch it in the headset from **Windows Button > All apps > Desktop**. 

### How can I see multiple monitors in Mixed Reality?
By default, Desktop app automatically switches to display the monitor with focus. If you want to see all of your monitors in Mixed Reality: 
* Click the monitor icon on the top left corner of the app
* Disable "Automatically Switch Monitor"
* Pick the monitor you want to see
* Launch another instance of the Desktop app
* Pick the monitor you want to see on that instance 
* Repeat for all of your physical monitors 
Note that you will have to reselect the monitor to show on each Desktop app every time you restart Mixed Reality. 

### My Desktop app only shows a black screen.
If your PC has an Nvidia hybrid GPU, the issue may be caused by Nvidia device running the runtimebroker.exe on the discrete GPU instead of the integrated one. To fix this issue, follow these instructions under "[How do I create Optimus settings for a new program?](http://nvidia.custhelp.com/app/answers/detail/a_id/2615/~/how-do-i-customize-optimus-profiles-and-settings%3F)" to add C:\windows\system32\runtimebroker.exe and force it to run on the "Integrated graphics" processor. 


## Other Questions

### My Samsung Odyssey or Odyssey+ headset firmware update is getting stuck.

Samsung owns and publishes headset firmware updates delivered via their "Samsung HMD Odyssey Setup" and "Samsung HMD Odyssey+ Setup" Device Companion apps. For more details and for help with Samsung firmware update issues, please reach out to Samsung Customer Service.

If the firmware update process is getting stuck, and there has been no progress for more than five minutes:
* Unplug all of your other USB devices temporarily and retry the firmware update.
* Connect your Samsung headset to a different USB 3.0 port on your PC.
* Disabling and/or uninstall any software installed that may interfere with firmware updates, like Gigabyte's AORUS App Center.
* Use a different PC to perform the Samsung headset firmware update.

### My Wi-Fi slows down when I'm using Windows Mixed Reality.

If you're using a 2.4GHz Wi-Fi connection, your motion controllers might slow down your Wi-Fi. Try one of the following:
* Switch to a 5GHz Wi-Fi connection, if one is available. [Learn more](https://support.microsoft.com/en-us/help/4000461).
* Use a separate Bluetooth adapter to connect your motion controllers to your PC. See [recommended adapters](https://support.microsoft.com/en-us/help/4039260/windows-10-mixed-reality-pc-hardware-guidelines).

### I got a message that said to plug in and charge my PC. Why?

If you're using a laptop, Windows Mixed Reality works best when the PC is both fully charged and plugged in. 

### What is the Experience options setting?

The Experience options setting (**Settings > Mixed reality > Headset display > Experience options**) allows you to change the Windows Mixed Reality performance settings. This enables you to choose the best possible experience for your hardware configuration across a range of content. The 90Hz experience is available to all systems, but you might want to try Automatic to see which setting you prefer. Here are the options:
* Automatic: Windows Mixed Reality will determine the best experience for your hardware configuration. For most people, this is the best choice to start with.
* 60Hz: Sets the refresh rate to 60Hz and turns off certain features, such as video capture and preview in Mixed Reality Portal.
* 90Hz: Sets the refresh rate to 90Hz.

### What languages are supported in Windows Mixed Reality?

Windows Mixed Reality is available in the following languages. If your PC is set to a different language, you can still use Windows Mixed Reality, but the interface will appear in English (United States), and speech commands and dictation won't be available.

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

The Windows Mixed Reality onscreen keyboard is English (United States) only. To enter text in another language, use a physical keyboard connected to your PC. You can also use dictation in one of the supported Windows Mixed Reality languages listed above—just select microphone on the onscreen keyboard.

Windows Mixed Reality is also available in the following languages without speech commands or dictation features:

* Chinese Traditional (Taiwan and Hong Kong)
* Dutch (Netherlands)
* Korean (Korea)
* Russian (Russia)

### I have questions about my headset hardware.

For details about your headset, check with the manufacturer. There may be a product guide in the box, or you can try the manufacturer’s website.


## How to uninstall Windows Mixed Reality

### How do I uninstall Windows Mixed Reality?

1. Disconnect your headset from your PC.
2. Close Mixed Reality Portal.
2. Go to  **Start > Settings > Mixed Reality** and select "Uninstall".

When you're ready to start using your headset again, plug it in, and Mixed Reality Portal will take you through setup.

### I got a "We couldn't finish uninstalling Windows Mixed Reality" message.

This means that some files, including information about your environment, might still be on your computer. This can cause problems if you decide to reinstall Windows Mixed Reality later. You can manually remove any remaining Windows Mixed Reality info from your PC by modifying the registry and using Windows PowerShell to run commands. _If you modify the registry incorrectly, serious problems might occur. Make sure to follow these steps carefully. For added protection, back up your registry before you modify it so you can restore it if a problem occurrs._ For more info, see [How to back up and restory the registry in Windows](https://support.microsoft.com/en-us/help/322756/how-to-back-up-and-restore-the-registry-in-windows). 

To uninstall Windows mixed reality using these commands:
1. Restart your PC.
2. In the **Search** box, type "regedit" and then select **Yes**.
3. Remove the following registry values:
   <ul>
    <li><b>HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Holographic</b>, then delete <b>FirstRunSucceeded</b>.</li> 
    <li><b>HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Holographic\SpeechAndAudio</b>, then delete <b>PreferDesktopSpeaker</b> and <b>PreferDesktopMic</b>.</li> 
    <li><b>HKEY_CURRENT_USER\Software\Microsoft\Speech_OneCore&gt; Settings\Holographic</b>, then delete <b>DisableSpeechInput</b>. Note:the registry items in HHKEY_CURRENT_USER must be deleted for every user account on the PC that has used Windows Mixed Reality.</li> 
    <li><b>HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\PerceptionSimulationExtensions</b>, then delete <b>DeviceID</b> and <b>Mode</b>.</li> 
    <li><b>HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Holographic</b>, then delete <b>OnDeviceLearningCompleted</b>.</li> 
   </ul>
4. Remove the following registry keys: 
   <ul>
   <li> <b>HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\HoloSI</b></li> 
   <li> <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\HoloSI</b></li> 
   <li> <b>HKEY_CURRENT_USER\Software\Microsoft\Speech_OneCore\Settings\HolographicPreferences</b></li><br/></ul>
5. Close the Registry Editor.
6. Navigate to **C:\Users\user name\AppData\Local\Packages\Microsoft.Windows.HolographicFirstRun_cw5n1h2txyewy\LocalState**, and then delete **RoomBounds.json**. Repeat this for each user who has used Windows Mixed Reality.
7. Open admin cmd prompt and navigate to **C:\ProgramData\WindowsHolographicDevices\SpatialStore\HoloLensSensors**. Then delete the contents of the **HeadTracking data** folder (but not the folder itself).
8. Type "powershell" in the **Search box**, right-click **Windows PowerShell**, and then select **Run as administrator**.
9. In Windows PowerShell, do the following:
   <ul>
   <li>Copy and paste the following at the command prompt, then press Enter: <b>Dism /online /Get-Capabilities</b></li> 
   <li>Copy the Capability Identity that begins with Analog.Holographic.Desktop (if it isn&#39;t there, that means this item isn&#39;t installed. In that case, skip to step 10 ).</li> 
   <li>Copy and paste the following command prompt, then press Enter: <b>Dism /online /Remove-Capability /CapabilityName:the Capability Identity copied in the last step</b></li>
   </ul>
10. Restart your PC.





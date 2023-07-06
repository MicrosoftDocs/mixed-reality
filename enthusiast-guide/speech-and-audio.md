---
title: Speech and audio FAQs
description: Speech and Audio Windows Mixed Reality troubleshooting that goes beyond our standard consumer support documentation.
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Troubleshoot, Errors, Help, Support, Audio problems, Speech problems
---

# Speech and audio FAQs

## I can't hear any sound in my headset, or sound is playing through my computer instead of my headset

* If your immersive headset doesn’t include built-in headphones, connect headphones to the audio jack on the headset. The jack is often located just behind or under the headset visor or lenses. Check with your headset manufacturer if you can't find it.
* Some audio headsets have physical buttons to control the volume. If audio isn't working, check to see whether the volume is turned down or muted.
* Audio will switch to your default Windows playback device: 
    * If you take off the headset
    * Flip the visor up
    * Close the Mixed Reality Portal app
    * When an app hasn't been used for 15 minutes. 
    * You can change this setting in **Settings > Mixed reality > Audio and speech.**
* Make sure your audio headset is plugged into the audio jack. The Acer headset in particular may require more care to ensure the audio headset is plugged in.
* Check that the audio headset/microphone is plugged into the headset and not the PC.
* The Sound Control Panel in **Settings > System > Sound** only shows enabled audio endpoints, not disabled endpoints. The headset audio device will be disabled when you're not wearing the headset. To see it, right-click in the Sound Control Panel and choose "Show disabled devices". The device name is "Realtek USB2.0 Audio", which can be renamed in the "Properties" page. You can do this for both the playback and recording tabs.
* If your audio isn't working in Mixed Reality apps, for example, with the Netflix app. This may be caused by a known issue where Windows Mixed Reality isn't automatically updated to match the OS version. To fix this issue and get the best Mixed Reality experience, go to **Settings > Update & Security > Windows Update > Check for Updates**.

> [!NOTE]
> * Windows Mixed Reality spatial audio works best with headphones built into or connected directly to your immersive headset. PC speakers or headphones connected to the PC might not work well for spatial audio.
> * Windows Mixed Reality doesn’t support Bluetooth audio headsets.

## I'm experiencing sudden volume changes, lost audio, or buzzing

* Some apps, like those launched through SteamVR, can lose audio or hang when the audio device changes as you start or stop the Mixed Reality Portal. To correct this, reopen the Mixed Reality Portal and restart the app.
* If another multimedia USB device (such as a web cam) shares the same internal or external USB hub with the Windows Mixed Reality headset, the headset audio jack or headphones may occasionally have a buzzing sound or no audio at all. Plug your headset into a USB port that uses a different hub or disconnect/disable your other USB multimedia device.
* If you notice a loud burst of noise from your connected headphones, the PC's USB hub might not able to provide enough power to the Windows Mixed Reality headset. If this occurs, file a [Feedback Hub](/hololens/hololens-feedback) bug and try:
    * removing extension cables
    * using a dedicated, external powered USB 3.0 HUB
    * a different USB port on the PC

## My Bluetooth audio headset isn't working as expected

Microsoft doesn't recommend using Bluetooth audio headsets with Windows Mixed Reality. Bluetooth audio peripherals don't work well with Windows Mixed Reality voice and spatial sound experiences. Bluetooth audio headsets can't support microphone input and stereo output at the same time, so you won't hear stereo or spatialized sound when using it for gamechat or other voice input. Bluetooth audio headsets can also negatively affect your motion controller experience.

## Sound isn't coming from expected directions

The Windows Mixed Reality Home includes spatial sound (audio that sounds like it comes from the applications located in your Home). As you turn around and move closer or farther from each app, the sound direction and level will change to increase the sense of realism. Below are some potential reasons for unexpected sound directions:

* If you open and play music from a background-capable music app (like Groove Music) in your home and then open an immersive VR experience like a game, the sound from the music app crossfades from spatial sound to stereo. It may appear louder because there's no longer any distance between you and the sound.
* If you had Cortana enabled on your PC before using your Windows Mixed Reality headset, you may lose the spatial sound applied to the apps in your Windows Mixed Reality home. To fix this, turn off "Let Cortana respond to Hey Cortana" in **Settings > Cortana** on your desktop before launching Windows Mixed Reality, or enable "Windows Sonic for Headphones":
    1. Go to the Desktop app window in Windows Mixed Reality home.
    2. Left-click the speaker icon on the Desktop taskbar and select it from the list of audio devices.
    3. Right-click the speaker icon on the Desktop taskbar and select "Windows Sonic for Headphones" in the "Speaker setup" menu.
    4. Repeat these steps for all of your audio devices (endpoints).

## Speech commands are not working as expected

* To use speech commands, speech and language settings on your PC must be set to a [language supported in Windows Mixed Reality](https://support.microsoft.com/help/4039262/windows-10-mixed-reality-setup-faq#Languages). To check your Windows speech and language settings, select **Settings  > Time & language > Region & language** and **Settings  > Time & language > Speech**.
* If your headset doesn’t have a built-in microphone, you’ll need to attach headphones with a microphone to the headset or to your PC. To have microphone input switch automatically to your headset when you wear it, go to **Settings > Mixed reality > Audio and speech**, and turn on "When I wear my headset, switch to headset mic".
* Some audio headsets have a physical button to mute and unmute the microphone. If speech commands aren't working, check to see whether your microphone is muted.
* Audio headsets with a microphone that dangles from the earbud cable don't do well for voice commands in environments with ambient noise.
* Cortana can be slow the first time she's invoked in a Mixed Reality Portal session. Go to **Settings > Cortana > Talk to Cortana** and make sure "Let Cortana respond to Hey Cortana" is enabled.
* On some PCs, the default voice capture gain for your headset-connected microphone may be set too low. If you experience unreliable speech commands or dictation, run the Microphone Setup troubleshooter:
    1. Go to the Desktop app in the Windows Mixed Reality home while wearing the headset (to affect the microphone you use for Windows Mixed Reality).
    2. Go to **Settings > Time & Language > Speech**.
    3. Select "Get Started" in the "Microphone" section.
    4. Select the appropriate endpoint in the troubleshooter wizard.

## I only have one audio headset and I want to use it for both Desktop and my headset

If you only have one audio headset and don't have a headset with built-in headphones, connect the audio headset to the PC instead of the headset. Then turn off "switch to headset audio" in the Mixed Reality Portal settings.

## I want to switch to Dolby Atmos for Headphones

Windows Mixed Reality environments and its apps use Windows Sonic for Headphones spatial audio technology, which is customized for mixed reality experiences. Other spatial audio technologies, like Dolby Atmos for Headphones, can be applied for full screen apps like SteamVR games but not for the Windows Mixed Reality shell environments and apps (such as placing a web browser on the wall of the Cliff House or the Sky Loft) which have been designed using Windows Sonic for Headphones spatial sound and acoustics.
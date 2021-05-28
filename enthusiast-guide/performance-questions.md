---
title: Performance FAQs
description: Performance Windows Mixed Reality troubleshooting that goes beyond our standard consumer support documentation.
ms.author: v-hferrone
ms.date: 09/15/2020
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Troubleshoot, Errors, Help, Support, Performance
appliesto:
    - Windows 10
---

# Performance FAQs

## Is my Windows Mixed Reality headset rendering at 60 Hz or 90-Hz framerate

If you have a discrete GPU with HDMI 2.0 ports and a CPU with four or more physical cores, you should be getting 90 Hz. To confirm, check the **Device Portal > Performance** tab.

Note: If your GPU only has an HDMI 1.4 output, you can use a DisplayPort to [HDMI 2.0 adapter](recommended-adapters-for-windows-mixed-reality-capable-pcs.md) as a workaround.

Note: The visual quality settings in "Headset display" only affect the rendering of the Windows Mixed Reality home experience.

## My PC is running slowly

The system may be slow for many reasons, usually lasting only a few seconds. If you experience this problem over long periods of time:

1. Close all unused application on the desktop.
2. Ensure that your laptop is plugged into a power source.
3. Make sure that the PC isn't warming up.
4. Lower the visual quality in your Windows Mixed Reality home.
5. Ensure that you have the latest [graphics drivers](other-questions.md#my-graphics-driver-isnt-supported-im-getting-graphics-driver-failure-errors) for your PC.

## My PC is warming up as I run the Mixed Reality experiences. How do I keep it cool

1. Check that the battery is charged and the power source is plugged in.
2. Make sure that the PC fans aren't blocked.
3. Use the PC in a relatively cool environment.
4. Make sure there are no heat sources (for example, the sun or heat vents) pointed at the PC.

## My visuals are choppy, load slowly, or don't look good

* Make sure your headset is plugged into the correct graphics card on your PC. Some PCs have both integrated and discrete graphics cards. The discrete card will generally provide the best performance. [Learn more about PC hardware](windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines.md).
* Close unused applications on your desktop.
* Make sure your headset fits snugly (move it lower and higher, or left and right, to adjust).
* Adjust your headset's visual settings in **Settings > Mixed reality > Headset display**. When "Visual quality" is set to "Automatic", the mixed reality experience for your PC will be chosen automatically. For more visual detail, set "Visual quality" to "High". If your visuals are choppy, select a lower setting.
* Adjust the headset calibration knob to make sure that the lenses are set to the correct distance between your pupils (called IPD). If you don't know your IPD, an optometrist can measure it for you, or use a website designed to measure IPD. If the headset doesn't have a calibration knob, select **Settings > Mixed reality > Headset display** and adjust the "Calibration control".
* If you’re using a USB-C or DisplayPort to HDMI adapter, try a different one. See [recommended adapters.](recommended-adapters-for-windows-mixed-reality-capable-pcs.md)
* Disconnect any extra monitors that may be connected to your PC’s graphics card.
* Try some different mixed reality apps from the Windows Store—some may work better with your computer setup.

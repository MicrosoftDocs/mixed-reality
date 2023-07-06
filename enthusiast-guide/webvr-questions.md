---
title: WebVR FAQs
description: Stay up to date with Mixed Reality troubleshooting for web applications that goes beyond our standard consumer support documentation.
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Troubleshoot, Errors, Help, Support, WebVR
---

# WebVR FAQs

## Why can’t I see my controllers when viewing VR content from Edge

Not all WebVR content is authored to support motion controllers. WebVR allows content developers to support different types of input, such as game controllers or motion controllers. If you don't see your controllers on a site, it probably doesn’t have motion controller support.

## Why can't I use the mouse in an immersive WebVR view

Using a mouse is an optional feature of the WebVR specification. Not all browsers support this feature, and not all WebVR content is authored to support mouse input. WebVR allows content developers to support different types of input, such as mouse, keyboard, game controllers, or motion controllers. Mouse input behavior varies per browser. Within Microsoft Edge, website authors must ensure they take 'pointerlock' when presenting to the headset for mouse input to work.

## Why can’t I view 360-degree videos from Youtube/Facebook/Vimeo/The Guardian, etc. from Edge in VR

There's a WebVR specification that lets websites launch VR experiences directly from the browser. The authors of these websites haven't implemented this specification at this time. There may be downloadable apps on some platforms that enable viewing of VR content from these vendors.

## Why can’t I enter VR from Firefox or Chrome

WebVR is only supported by Windows Mixed Reality devices in Edge at this time.

## When I enter VR from a website, why do I see a blank screen in my headset

The website may not have implemented support for multi GPU machines (including hybrid GPU laptops). Try to:

* Reload the page.
* On desktop machines, plug the headset into the same graphics adapter as the monitor that is displaying Microsoft Edge. Plug both into the higher powered graphics card, not into the integrated graphics adapter.

## When I exit VR when watching a video from Edge, the sound continues playing but the Edge window is grayed out

This is a known issue when running WebVR from Edge in the Mixed Reality Cliff House. To resolve it, press escape on the keyboard instead of the windows button to exit the WebVR experience, or activate the greyed out Edge window by selecting it and then stop the video.

## Can I use WebVR on the HoloLens

Microsoft hasn't announced anything about WebVR on the HoloLens at this point.

## Why is my view at floor level when viewing WebVR content from Edge

The website doesn't properly support Windows Mixed Reality headsets. To work around this:

1. Place the headset on the floor of your space.
2. Navigate to the WebVR page using Microsoft Edge on your desktop (not within mixed reality).
3. Select "Enter VR".
4. Wait five to 10 seconds for the experience to fully enter immersive mode.
5. Put on the headset.

## The display is low resolution in some WebVR experiences

Those websites don't properly support high-resolution headsets. To work around this:

* If launching WebVR from the desktop (rather than the mixed reality Cliff House), ensure the window is maximized before selecting "Enter VR".
* Avoid resizing the Microsoft Edge window after you have entered VR.

## Why does the WebVR immersive view exit when I change browser tabs

This is expected behavior. For security reasons, only the active browser tab can access connected headsets.

## Why can't I hear audio on a particular WebVR experience

The website may be using the OGG audio file format, which Microsoft Edge doesn't currently support.

You can report broken sites directly to the Microsoft Edge browser team in the [issue tracker](https://developer.microsoft.com/microsoft-edge/platform/issues/), or via twitter using [#EdgeBug hashtag](https://blogs.windows.com/msedgedev/2016/08/11/edgebug-twitter/).

## Why does haptic feedback not work in WebVR with motion controllers

Microsoft Edge doesn't currently support haptics on the WebVR gamepad API extensions.
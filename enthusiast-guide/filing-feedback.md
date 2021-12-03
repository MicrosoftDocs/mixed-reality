---
title: Filing bugs and feedback
description: Help us make Windows Mixed Reality better by filing feedback using the correct categories in the Feedback Hub app.
author: qianw211
ms.author: v-qianwen
ms.date: 12/2/2021
ms.topic: article
keywords: Windows Mixed Reality, Mixed Reality, Virtual Reality, VR, MR, Feedback, Feedback Hub, bugs
appliesto:
    - Windows 10
---

# Filing bugs and feedback

## Why it's important

The engineering team uses the same mechanism for tracking and fixing internal bugs, so please use Feedback Hub to report anything odd that you're seeing - we're listening!

>[!Note]
>In order to provide us with full data for feedback and diagnostics, double check the settings on your PC before filing feedback: <ol> <li> Open the Windows **Settings** app. </li> <li> Select **Privacy**. </li> <li> Go to **Feedback & diagnostics** on the left pane, which has been renamed to **Diagnostics & feedback** in recent Windows Insider builds of Windows. </li> <li> Under **Select how much data you send to Microsoft**, select **Full** if it isn't already selected. </li> <li> Be sure to restart your PC and repeat the steps to reproduce your issue before filing feedback. </li> <ol>

## How to file feedback for Windows Mixed Reality immersive headsets on PC

1. Ensure you have the immersive headset connected to your PC.
2. Launch **Feedback Hub** on desktop with the HMD connected. If you don't already have **Feedback Hub** installed, you can download and install the latest [Feedback Hub](https://www.microsoft.com/p/feedback-hub/9nblggh4r32n?rtc=1&activetab=pivot:overviewtab) app from Microsoft Store.
3. Go to **Feedback Tab** on the left pane. ![Feedback Tab](images/feedback1.png) 
4. Select **Add new feedback** button to enter the feedback. ![Add new feedback](images/feedback2.png)
5. Select **Problem** in **What kind of feedback is this?** to make the feedback actionable. ![Details and repro steps](images/feedback3.png)
6. Provide meaningful feedback title in **Summarize your issue** box.
7. Provide details and steps to reproduce the issue in the **Give us more detail** box.
8. Select **Mixed Reality** as the top category and then pick an applicable sub category:

   | Subcategory      | Description                                                                           |
   |------------------|---------------------------------------------------------------------------------------|
   | Apps             | Issues with a specific application.                                                   |
   | Developer        | Issues in authoring / running an app for Mixed Reality.                               |
   | Device           | Issues with the HMD itself.                                                           |
   | Home experience  | Issues with your VR environment: interactions with the Windows Mixed Reality Home.    |
   | Input            | Issues with input methods: motion controllers, speech, gamepad, or mouse and keyboard.|
   | Set up           | Anything that is preventing you from setting up the device.                           |
   | All other issues | Anything else.                                                                        |

9. To help us identify and fix the bug faster, capturing traces and video is helpful. To start collecting traces, select **Start capture**. This will begin collecting traces and a video capture of your mixed reality scenario.![Start Capture](images/feedback4.png)
10. Leave the Feedback app and run through the broken scenario. Don't close the Feedback Hub app at this point.
11. After you're done with your scenario, go back to the feedback app and select **Stop Capture**. Once you do that, you should see that a file containing the traces has been added.
12. Select **Submit**.![Submit](images/feedback5.png)

This will lead you to the "Thank You" page. At this point, your feedback has been successfully submitted.

It's easy to direct other people to your feedback after submission by going to **Feedback > My Feedback**, selecting the issue, and using the **Share** icon to get a shortened URL. You can give the URL to coworkers, Microsoft staff, [forum](https://forums.hololens.com/) readers, and so on, to upvote or escalate.

> [!IMPORTANT]
> Before filing a bug, please ensure you meet the following constraints so that the logs are successfully uploaded with the feedback.
>    * Have a minimum of 3GB free disk space available on the main drive of the device.
>    * Ensure that a non-metered network is available in order to upload cabs.

## After filing feedback

Make sure to check back regularly with Feedback Hub after filing feedback! In most cases, we'll try to respond as soon as we can. If you're not already in touch with us when you file feedback, the only way we can reach out to you with troubleshooting suggestions or more questions is via the comments system in Feedback Hub. Unfortunately, at this time, notifications aren't sent to you outside of Feedback Hub.

## See also

* [Troubleshooting](troubleshooting-windows-mixed-reality.md)
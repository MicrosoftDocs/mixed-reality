---
title: QR code tracking overview
description: Learn how to detect QR codes, add webcam capabilities, and manage coordinate systems in mixed reality apps on HoloLens 2.
author: qianw211
ms.author: v-qianwen
ms.date: 11/8/2021
ms.topic: article
keywords: vr, lbe, location based entertainment, vr arcade, arcade, immersive, qr, qr code, hololens2, tracking
---

# QR code tracking overview

HoloLens 2 can detect QR codes in the environment around the headset, establishing a coordinate system at each code's real-world location. HoloLens 2 can also render holograms in the same location on multiple devices to create a shared experience. Once you enable your device's webcam, you'll recognize QR codes in the latest versions of your projects. Before going to production, we recommend that you follow the [best practices](#best-practices-for-qr-code-detection) we've included at the end of the article.

## Device support

| Feature          | [HoloLens 1st Gen](/hololens/hololens1-hardware) | [HoloLens 2](https://www.microsoft.com/hololens/hardware) | Immersive headsets         |
|:------------:|:--------------------------------------------------------------------------:|:---------------------------------------------------------:|:------------------:|
| QR code detection |                                                                         | :heavy_check_mark:                                        | :heavy_check_mark: |

> [!NOTE]
> QR code tracking with immersive Windows Mixed Reality headsets on desktop PCs is supported on Windows 10 Version 2004 and higher. Use the Microsoft.MixedReality.QRCodeWatcher.IsSupported() API to determine whether the feature is supported on the current device.

## Best practices for QR code detection

### Quiet zones around QR Codes

To be read correctly, QR codes require a margin around all sides of the code. This margin must not contain any printed content and should be four modules (a single black square in the code) wide. 

The [QR spec](https://www.qrcode.com/en/howto/code.html) contains more information about quiet zones.

### Lighting and backdrop
QR code detection quality is susceptible to varying illumination and backdrop. 

In a scene with bright lighting, print a code that is black on a gray background. Otherwise, print a black QR code on a white background.

If the backdrop to the code is dark, try a black on gray code if your detection rate is low. If the backdrop is relatively light, a regular code works fine.

### Size of QR codes
Windows Mixed Reality devices don't work with QR codes with sides smaller than 5 cm each.

For QR codes between 5 cm and 10-cm length sides, you must be fairly close to detect the code. It will also take longer to detect codes at this size. 

The exact time to detect codes depends not only on the size of the QR codes, but how far you're away from the code. Moving closer to the code will help offset issues with size.

### Distance and angular position from the QR code
The tracking cameras can only detect a certain level of detail. For small codes - < 10 cm along the sides - you must be fairly close. For a version 1 QR code varying from 10 cm to 25 cm wide, the minimum detection distance ranges from 0.15 meter to 0.5 meter. 

The detection distance for size increases linearly, but also depends on QR version or module size. The higher the version, the smaller the modules, which can only be detected from a closer position. You can also try micro QR codes if you want the distance of detection to be longer. QR detection works with a range of angles += 45 deg to ensure we have proper resolution to detect the code.

> [!IMPORTANT]
> Always make sure you have enough contrast and a proper border.

### QR codes with logos
QR codes with logos haven't been tested and are currently unsupported.

### Managing QR code data
Windows Mixed Reality devices detect QR codes at the system level in the driver. When the device is rebooted, the detected QR codes are gone and will be re-detected as new objects next time.

We recommend configuring your app to ignore QR codes older than a specific timestamp. Currently, the API doesn't support clearing QR code history.

### QR code placement in a space
For recommendations on where and how to place QR codes, refer to [Environment considerations for HoloLens](/hololens/hololens-environment-considerations).

## Troubleshooting and FAQ

### How do I enable or disable the QR Tracking Feature in the driver For Windows Mixed Reality devices (Supported min version 19h1 builds)

In order to turn **ON** QR tracking, run the following script in cmd and then replug in your headset.

```
reg add "HKLM\SOFTWARE\Microsoft\HoloLensSensors" /v  EnableQRTrackerDefault /t REG_DWORD /d 1 /F
```

In order to turn **OFF** QR Tracking, run the following script in cmd and then re-plug in your headset. Any currently found QR codes will become non-locatable.

```
reg add "HKLM\SOFTWARE\Microsoft\HoloLensSensors" /v  EnableQRTrackerDefault /t REG_DWORD /d 0 /F
```

This registry setting is only temporary until the driver has the capability to check for APP capabilities.

### What capabilities are needed?

You'll need the <mark> **capability t "webcam"** </mark> added to your manifest (checkbox in Unity). Request access by calling the following function:

```
#if WINDOWS_UWP

async QRCodeWatcher.RequestAccessAsync();

#endif
```

If the access status should be `(status == QRCodeWatcherAccessStatus::Allowed)`.

If the user denies, then the feature will return the access denied when you start the QRTracking.

This API should be called before you construct the `QRCodeWatcher` object.

### How to make QR Code Tracking Feature work on HoloLens 2 devices (Supported min version 19h1 builds)

For QR Code tracking to work on HoloLens 2, you need to be on builds 19H1 or later.

QR tracking is automatic on HoloLens 2, and you will need the "webcam" capability added to your app.

### Where do I find the API plugin files?

All the required files and documentation can be found here.

<https://www.nuget.org/packages/Microsoft.MixedReality.QR/0.5.2032-rc>

### How do I prepare a UWP to use Microsoft.MixedReality.QR.QRCodeWatcher?

Use the NuGet pack to unpack the required files.

Add a reference to the `Microsoft.MixedReality.QR.winmd` in your project and start using the API.

Add the correct architecture versions of the plugins and use them accordingly in the build.

### How do I prepare Unity with the Microsoft.MixedReality.QR.QRCodeWatcher?

Use NuGet for unity and point to the NuGet pack above.

### How can I make QR codes?

* From any QR code generator, see <https://www.the-qrcode-generator.com/>

### If it doesn't work on your Oasis device:

* Do you have a build 19h1or later?
* Did you add the reg key?

### If it doesn't work on your HoloLens device:

* Do you have 19h1 or later build?

### If it doesn't work in general:

* If RS5, have you set the reg key? Restarted the device afterwards? Are you using the plugin from MRTK?
* If RS6/19H1 are you using the RS6/19H1plugin? Are you using latest plugin from RS6/19H1 builds. If oasis, did you set the reg key?
* Is the QR Code version a supported version? We don't support the high density versions like version 40. Nothing above version 10 is guaranteed, versions above 20 are not supported.
* Are you close enough to the QR code?
* How is the lighting? There is a known issue where detection becomes difficult when the QR code is on a dark background.

### What's the accuracy?

When detected in a single frame, the size is expected to have at most a 1% error from the actual size, for example: a 10-cm code might be up to +/- 1mm off in measured size. Under continuous detection, a code's position might drift around by up to +/- 2.5 mm. Once you have moved out of detection range, a previous detection's position is up to the mercy of the map error.

### How close do I need to be to the QR code to detect it?

The distance obviously depends on the size of the QR code, and also what version it is.

* On Baraboo, for a version 1 QR code varying from 5 cm sides to 25-cm sides, the minimum detection distance ranges from 0.25 meters to 0.5 meters. The furthest QR Codes can be detected goes from about 0.5 m for the smallest code to 2 meters for the bigger ones.
* On Oasis, these distances for the sizes are halved.
* For any codes bigger, extrapolate - the detection distance for size increases linearly. For any code smaller, detection simply will not occur - 4-5 cm is the smallest we can detect.

### Why can't I read QR codes with logos?

Currently, we don't support QR codes with logos.

### Are MicroQR Codes supported?

Micro QR Codes support is coming soon.

### QR codes detected, but why am I getting no data?

* In RS5 version of the plugin, not all encodings are supported. If the platform cannot decode the qrcode, there will be no data.  You can use the stream and interpret the data using open source code. In RS6, more encodings are supported.
* Some features such as structure append and micro QR codes are not supported.

### How to clear the codes from my app? It seems once you find a code, they tend to persist.

QR codes only persist in the boot session. Once you reboot your device (or restart the driver), QR codes will be detected as new objects. QR codes are unique and persist within the driver session.

#### How does that work with the underlying platform?  Where do they persist? 

They only persist in memory (asic/soc).

#### How do I clear them during testing, when it's most useful to clear them? 

You can ignore the QR codes older than a timestamp if you want. Currently the API does not have a way to clear them as multiple apps might be interested in them. At the app level, you can ignore QR codes not updated recently. A logic can be added to ignore the ones not updated, for example time `t`.  It's app-specific, and up to the app to decide on what to do.

#### How do I get the time stamp from the qpc ticks?

```
long EndingTime = System.Diagnostics.Stopwatch.GetTimestamp();
long ElapsedTime = EndingTime - (long)qrCode.LastDetectedQPCTicks;
double ElapsedSecs = ElapsedTime * (1.0f / System.Diagnostics.Stopwatch.Frequency);

QRTimeStamp.text = "Time:" + System.DateTime.Now.AddSeconds(-ElapsedSecs).ToString("MM/dd/yyyy HH:mm:ss.fff");
```

#### Are QR Codes saved at the ‘space’ level or app level?  It seems to me it is beyond app? 

QR Codes are saved at the system level in driver session, or boot session on HoloLens.

### From a plugin standpoint, what should I do. My plugin right now is configured for x64. Is the DLL OK to just reconfigure in Unity as x86?

* See the <mark> preparing unity section </mark>.

### Is the `rs_analog_runtime_undock` the only branch that works for QR tracking API in Baraboo?

* All the branches with builds RS6 and later should work.

### Do I need the registry entry in HoloLens? If so, how do I add it?  <mark> [Not familiar w/ editing registry in HoloLens] </mark>

If using RS5 builds and RS5 plugin, see the first section at the top of the page for more details: <https://www.qrcode.com/en/howto/code.html>

### How wide is the PV Camera field of view? 

Horizontal field of view for the HoloLens 2 PV camera is ~65 degrees.

### What is the PV Camera focus range? If it has auto focus, how far before it's ineffective? 

The HoloLens 2 PV camera has autofocus. The autofocus system can adjust object distance from 30 cm to infinity.

The effective focal length for the HoloLens 2 PV camera lens is 4.87 mm +/- 5%.  In addition to the 5% variation due to manufacturing tolerance, the focal length will change dynamically due to the autofocus system. The AF travel (stroke) is up to 0.2 mm.

## See also
* [QR code tracking with native C++ and C## samples](../native/qr-code-tracking-cs-cpp.md)
* [QR code tracking in Unity](../unity/qr-code-tracking-unity.md)
* [Coordinate systems](../../design/coordinate-systems.md)
* <a href="/azure/spatial-anchors/overview" target="_blank">Azure Spatial Anchors</a>
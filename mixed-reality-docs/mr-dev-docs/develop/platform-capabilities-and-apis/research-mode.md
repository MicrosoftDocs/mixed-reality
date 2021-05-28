---
title: HoloLens Research Mode
description: Using Research Mode on HoloLens, an application can access key device sensor streams (depth, environment tracking, and IR-reflectivity).
author: hferrone
ms.author: v-hferrone
ms.date: 07/31/2020
ms.topic: article
keywords: Research Mode, cv, rs4, computer vision, research, HoloLens, HoloLens 2
---


# HoloLens Research Mode

Research Mode was introduced on HoloLens (1st Gen) devices to give access to key sensors, specifically for research applications that aren't intended for deployment.  Research Mode for HoloLens 2 keeps the capabilities of HoloLens 1 but adds access to the following streams:

* **Visible Light Environment Tracking Cameras** - Gray-scale cameras used by the system for head tracking and map building.
* **Depth Camera** – Operates in two modes:  
    + AHAT, high-frequency (45 FPS) near-depth sensing used for hand tracking. Differently from the first version short-throw mode, AHAT gives pseudo-depth with phase wrap beyond 1 meter. 
    + Long-throw, low-frequency (1-5 FPS) far-depth sensing used by [Spatial Mapping](../../design/spatial-mapping.md)

* **Two versions of the IR-reflectivity stream** - Used by the HoloLens to compute depth. These images are illuminated by infrared and unaffected by ambient visible light.

If you're using a HoloLens 2, you also have access to the additional inputs below:

* **Accelerometer** – Used by the system to determine linear acceleration along the X, Y, and Z axes and gravity.
* **Gyro** – Used by the system to determine rotations.
* **Magnetometer** – Used by the system to estimate absolute orientation.

> [!IMPORTANT]
> Research Mode is currently in Public Preview. 

![Research Mode app screenshot](images/sensor-stream-viewer.jpg)<br>
*A mixed reality capture of a test application that displays the eight sensor streams available in Research Mode*

## Usage

Research Mode is designed for academic and industrial researchers exploring new ideas in the fields of Computer Vision and Robotics.  It's not intended for applications deployed in enterprise environments or available through the Microsoft Store or other distribution channels.

Additionally, Microsoft doesn't provide assurances that Research Mode or equivalent functionality is going to be supported in future hardware or OS updates. However, don't let that stop you from using it to develop and test new ideas!

## Security and performance

Enabling Research Mode uses more battery power than using the HoloLens 2 under normal conditions, even if the application using the Research Mode features isn't running.  Enabling this mode can also lower the overall security of your device because applications may misuse sensor data.  You can find more information on device security in the [HoloLens security FAQ](/hololens/hololens-faq-security).  

## Device support
<table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" /> 
    </colgroup>
    <tr>
        <td><strong>Feature</strong></td>
        <td><a href="/hololens/hololens1-hardware"><strong>HoloLens first Gen</strong></a></td>
        <td><a href="/hololens/hololens2-hardware"><strong>HoloLens 2</strong></a></td>
    </tr>
     <tr>
        <td>Head Tracking Cameras</td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
    <tr>
        <td>Depth & IR Camera</td>
        <td>✔️</td>
        <td>✔️</td>
    </tr>
    <tr>
        <td>Accelerometer</td>
        <td>❌</td>
        <td>✔️</td>
    </tr>
    <tr>
        <td>Gyroscope</td>
        <td>❌</td>
        <td>✔️</td>
    </tr>
    <tr>
        <td>Magnetometer</td>
        <td>❌</td>
        <td>✔️</td>
    </tr>
</table>

## Enabling Research Mode (HoloLens first Gen and HoloLens 2)

Research Mode is an extension of Developer Mode. Before starting, the developer features of the device need to be enabled to access the Research Mode settings: 

* Open **Start Menu > Settings** and select **Updates**.
* Select **For Developers** and enable **Developer Mode**.
* Scroll down and enable **Device Portal**.

After the developer features  are enabled, [connect to the device portal](/windows/uwp/debug-test-perf/device-portal-hololens) to enable the Research Mode features:

* Go to **System > Research Mode** in the **Device Portal**.
* Select **Allow access to sensor stream**.
* Restart the device from the **Power** menu item at the top of the page.

Once you've restarted the device, the applications loaded through the **Device Portal** can access Research Mode streams.

![Research Mode tab of HoloLens Device Portal](images/ResearchModeDevPortal.png)<br>
*Research Mode window in the HoloLens Device Portal*

> [!IMPORTANT]
> Research Mode for HoloLens 2 is available beginning with build 19041.1364 . If you need access in an earlier build, sign up for our [Insider Preview](/hololens/hololens-insider) program. You can find more details in the [Research Mode GitHub repository](https://github.com/microsoft/HoloLens2ForCV).

### Using sensor data in your apps

Applications can access the sensor stream data in the same way that [Media Foundation](/windows/win32/medfound/microsoft-media-foundation-sdk) accesses photo and video camera streams. 

All APIs that work for HoloLens development are also available in Research Mode. In particular, the application  knows precisely where HoloLens is in 6DoF space at each sensor frame capture time.

We have sample applications showing Research Mode stream access, using the [intrinsics and extrinsics](/windows/mixed-reality/locatable-camera#locating-the-device-camera-in-the-world), and recording streams:
* [HoloLens (first gen)](https://github.com/Microsoft/HoloLensForCV)
* [HoloLens 2](https://github.com/microsoft/HoloLens2ForCV)

## Support

For HoloLens (first gen), use the [issue tracker](https://github.com/Microsoft/HololensForCV/issues) in the HoloLensForCV repository to post feedback and track known issues.

For HoloLens 2, use the [issue tracker](https://github.com/microsoft/HoloLens2ForCV/issues) in the HoloLens2ForCV repository to post feedback and track known issues.

## See also

* [Microsoft Media Foundation](/windows/win32/medfound/microsoft-media-foundation-sdk)
* [HoloLensForCV GitHub repo](https://github.com/Microsoft/HoloLensForCV)
* [HoloLens2ForCV GitHub repo](https://github.com/microsoft/HoloLens2ForCV)
* [Using the Windows Device Portal](using-the-windows-device-portal.md)
---
title: Power Thermal Notifications in Unity
description: Learn how to subscribe and handle Power Thermal events within a Unity mixed reality app.
author: chorkin
ms.author: chorkin
ms.date: 10/22/2021
ms.topic: article
keywords: Unity, power, performance, thermal, mitigation, mixed reality headset, windows mixed reality headset, virtual reality headset
---

# Power Thermal Notifications in Unity

When the device is running in warm environments or with heavy performance requirements (CPU/GPU usage, peripheral usage, etc.), the device may take actions to keep itself from overheating.

These actions would include things like:

* Adjusting frame rate(s)
* Adjusting charging performance
* Providing user feedback
* Terminating applications

... and in worst case scenarios:

* Shutting down the device

If your application demands high peripheral performance, consider using the PowerThermalNotification SDK to subscribe to notification events and implement your own custom actions.  Doing so can allow the device to operate longer in situations when otherwise an application may be terminated by the system.

This article describes the PowerThermalNotification SDK and its basic usage to get you started.

## Where do I get the SDK?

The PowerThermalNotification SDK is downloadable via the [Mixed Reality Feature Tool](../unity/welcome-to-mr-feature-tool.md).

PowerThermalNotification SDK supports language projections for C# and C++, allowing developers to develop applications for Win32 or UWP platforms.

## Conceptual Overview

The power consumed by our devices is dissipated in heat.  A traditional PC device would have a fan to address this, but a wearable device must be lightweight.  Because of this the cooling solution is more complex.  HoloLens 2 has built in hardware and software safety features to ensure the headset does not get too hot for the user, but these features must be balanced with customer experience as well.

For example, if we know which part of the device is heating up, we can choose to throttle the peripherals responsible for this heat.  As a last resort, we might close an application thought to be responsible for the power that led to this heat.

HoloLens 2 does just this.  It has several temperature sensors on the device that feed into a thermal framework.  The framework ties groups of sensors to different peripherals on the device.  They are grouped because it may be impossible to differentiate the exact peripheral in a physical area responsible for the power draw that heats up the device.

The PowerThermalNotification SDK exposes the APIs necessary to monitor these groups of sensors.  SDK events fire when a peripheral being used by the application is showing signs that a mitigation may be required.  The application can then adapt its customer experience to reduce the thermal impact.  Reducing impact means less risk of system action such as application or device shutdown.

A simple example of this would be an application that is using CPU to process a large amount of video data.  The application could subscribe to a performance notification for the CPU component and when it receives a notification, the application can reduce the CPU workload.  When another event is received indicating no further mitigation is necessary, the CPU workload can be restored.

## Platform Response

The following table is a breakdown of system actions by peripheral.  These actions column can be suppressed using the SDK.  See [Suppressing Default Device Actions](#suppressing-default-device-actions)

|                           |                                               |                  |                   |                                                          |
|---------------------------|-----------------------------------------------|------------------|-------------------|----------------------------------------------------------|
| **Peripheral**                | **MinimumUserImpact**                             | **MediumUserImpact** | **MaximumUserImpact** | **Last Resort**                      |
| ISLAND_PERIPHERAL_GPU     | Throttle MRC Quality </br> Adjust VSYNC Interval |                  |                   |                                                    |
| ISLAND_PERIPHERAL_DISPLAY | Depth FPS Reduction                        |                  |                   |                                                    |
| Any Peripheral            | n/a                                        | n/a              | n/a               | Display Warning </br> Close Application </br> Stop MRC Capture |
> [!NOTE]
> <!--Last Resort Note-->Actions in the "Last Resort" column cannot be suppressed

## Registering for Events

Talk here about registering for events and include a sample:

```cs
this is as sample()
```

## Suppressing Default Device Actions

Talk here about suppressing actions the device might take as mentioned earlier.
Also include a nice code snippet:

```cs
Oh wow this code is great()
```

> [!NOTE]
> <!--Foreground Note-->The suppression APIs will only work if the process using the PowerThermalNotification class is in the foreground.  Background processes can still subscribe to events but may not disable device actions.

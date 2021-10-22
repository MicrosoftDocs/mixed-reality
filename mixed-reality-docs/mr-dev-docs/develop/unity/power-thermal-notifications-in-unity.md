---
title: Power Thermal Notifications in Unity
description: Learn how to subscribe and handle Power Thermal events within a Unity mixed reality app.
author: chorkin
ms.author: chorkin
ms.date: 10/22/2021
ms.topic: article
keywords: Unity, power, performance, thermal, mitigation, mixed reality headset, windows mixed reality headset, virtual reality headset
---
git
# Power Thermal Notifications in Unity

When the device is running in warm environments or with heavy performance requirements (CPU/GPU usage, peripheral usage, etc.), the device may take actions to keep itself from overheating.

These actions include but are not limited to:

* Adjusting framerate(s)
* Adjusting charging performance
* Providing user feedback
* Terminating applications

and in worst case scenarios:

* Shutting down the device

Applications that may require a heavier performance profile may use the PowerThermalNotification SDK to subscribe to notification events to implement their own actions in addition to/ or in place of these.  Doing so can allow the device to operate longer in situations when otherwise an application may be terminated by the system.

This article describes the PowerThermalNotification SDK and its basic usage to get you started.

## Where do I get the SDK?

The PowerThermalNotification SDK is downloadable via the [Mixed Reality Feature Tool](../unity/welcome-to-mr-feature-tool.md).

PowerThermalNotification SDK supports language projections for C# and C++ allowing applications to develop applications for Win32 or UWP platforms.

## Conceptual Overview

Talk here about temperature sensors and those being associated with one or more peripherals.  Maybe a pretty picture.


## Registering for Events

Talk here about registering for events and include a sample:

```cs
this is as sample()
```

## Suppressing Default Device Actions

Talk here about suppressing actions the device might take as mentioned earlier.  Have a 
Also include a nice code snippet:
```cs
Oh wow this code is great()
```
> [!NOTE] 
> <!--Foreground Note-->The suppression APIs will only work if the process using the PowerThermalNotification class is in the foreground.  Background processes can still subscribe to events but they may not disable device actions

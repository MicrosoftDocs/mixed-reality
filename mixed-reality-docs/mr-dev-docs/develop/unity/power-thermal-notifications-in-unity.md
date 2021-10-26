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
* Closing applications

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

A simple example would be an application that is using CPU to process a large amount of video data.  The application could subscribe to a performance notification for the CPU component.  When it receives a notification, the application can reduce the CPU workload.  If another event is received indicating no further mitigation is necessary, the CPU workload can be restored.

## Platform Response

The following table is a breakdown of system actions by peripheral.  Actions described below can be suppressed using the SDK.  See [Suppressing Default System Mitigations](#suppressing-default-system-mitigations)

| **Peripheral**    |  **MinimumUserImpact**  |   **MediumUserImpact** |    **MaximumUserImpact** |**Last Resort**  |
|-------------------|-------------------------|------------------------|--------------------------|---------------- |
| ISLAND_PERIPHERAL_GPU     | Throttle MRC Quality </br> Adjust VSYNC Interval |  |               |                 |
| ISLAND_PERIPHERAL_DISPLAY | Depth FPS Reduction                      |       |  |               |                 |
| Any Peripheral            |                 |                        |                          | Display Warning </br> Close Application </br> Stop MRC Capture |
> [!NOTE]
> <!--Last Resort Note-->Actions in the "Last Resort" column cannot be suppressed

## Registering for Events

To get notifications, there are three requirements:

* System support for the API including the specified peripheral
* A non-empty **PeripheralsOfInterest** property
* A non-empty **PowerThermalMitigationLevelChanged** notification handler

You won't receive events if your application doesn't meet these requirements.

The first item can be checked using the **IsSupported()** function.  If the system supports notifications for at least one of the peripherals in the mask, the function will return true.  You may choose not to check support using this function as long as your application doesn't explicitly depend on PowerThermalNotification SDK events.

Here's a code snippet for grabbing the **PowerThermalNotification** class instance and configuring it for notifications for both the **PeripheralFlags.Cpu** and **PeripheralFlags.PhotoVideoCamera**:

```cs
using Microsoft.MixedReality.PowerThermalNotification;

private void NotificationHandler(object sender, PowerThermalEventArgs args)
{
    //  Notification handling can be done here using information contained in args
}

private void InitializeThermalNotifications()
{
    PowerThermalNotification p = PowerThermalNotification.GetForCurrentProcess();
    
    PeripheralFlags requestedFlags = PeripheralFlags.Cpu | PeripheralFlags.PhotoVideoCamera;
     if (PowerThermalNotification.IsSupported(requestedFlags))
    {
        //At least one of these peripherals is supported by the system
        p.PeripheralsOfInterest = requestedFlags;
        p.PowerThermalMitigationLevelChanged += NotificationHandler;
    }  
}
```

## Handling Events

When the **PowerThermalMitigationLevelChanged** event fires, it comes with **PowerThermalEventArgs**.  These should be used to understand the event.  

When an event is received, the event handler should inspect **args.ImpactedPeripherals** which identifies which peripheral(s) are impacted.  The **args.MitigationLevel** indicates how severe of a mitigation is recommended for the specified peripherals.  If the mitigation level is **PowerThermalMitigationLevel.NoUserImpact** then any mitigations associated with the specified peripherals should be removed.

Here's an example handler:

```css
bool doCpuThrottle = false;

private void NotificationHandler(object sender, PowerThermalEventArgs args)
{
    if (args.ImpactedPeripherals.HasFlag(PeripheralFlags.Cpu))
    {
        if(args.MitigationLevel = PowerThermalMitigationLevel.NoUserImpact)
        {
            doCpuThrottle = false;
        }
        else if(args.MitigationLevel >= PowerThermalMitigationLevel.MinimumUserImpact)
        {
            // Note that this only kicks in at MinimumUserImpact and does not get released until 
            doCpuThrottle = true;
        }
    }

    if (args.ImpactedPeripherals.HasFlag(PeripheralFlags.PhotoVideoCamera))
    {
        SetMitigationStatus(PhotoVideoCameraStatusText, PhotoVideoRectangle, args.MitigationLevel);
    }
}
```

> [!NOTE]
> <!--Hysteresis Note-->Mitigation levels for peripherals have hysteresis.  Once the level increases, it does not decrease until it releases.  The release is an event with args.MitigationLevel set to PowerThermalMitigationLevel.NoUserImpact.

## Suppressing Default System Mitigations

If you don't want the system to attempt to mitigate certain peripherals, you can suppress them.  To do this, just update the **SuppressedPlatformMitigationForPeripherals** property, or call the **SuppressPlatformMitigation** function.

Here's a small snippet:

```cs
PowerThermalNotification p = PowerThermalNotification.GetForCurrentProcess();
PeripheralFlags requestedFlags = PeripheralFlags.Cpu | PeripheralFlags.PhotoVideoCamera;

//You can do this to set the property explicitly
p.SuppressedPlatformMitigationForPeripherals = requestedFlags;

//Or you can do this to manipulate the property mask. 
//This specific example clears the CPU, leaving the PhotoVideoCamera suppressed
p.SuppressPlatformMitigation(PeripheralFlags.Cpu, false);
```

> [!NOTE]
> <!--Foreground Note-->The suppression APIs will only work if the process using the PowerThermalNotification class is in the foreground.  Background processes can still subscribe to events but may not disable device actions.

## Putting it Together

Here's a simple example of a set of scripts that can be used in unity to enable this functionality.  The NotificationComponent class can be added to any game object and that game object can track the mitigation level of the assigned peripheral.  The NotificationManager class deals with the SDK managing subscriptions through the single instance of the **PowerThermalNotification** class

Here's the NotificationManager class:

```css
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

using Microsoft.MixedReality.PowerThermalNotification;

public class NotificationManager
{
    private static readonly object listLock = new object();
    private static List<NotificationComponent> components = new List<NotificationComponent>();
    private static PowerThermalNotification p = PowerThermalNotification.GetForCurrentProcess();
    private static bool FirstTime = true;

    private static void NotificationHandler(object sender, PowerThermalEventArgs args)
    {
        lock (listLock)
        {
            foreach (NotificationComponent c in components)
            {
                UnityEngine.WSA.Application.InvokeOnAppThread(() =>
                {
                    c.SetMitigationLevel(args.ImpactedPeripherals, args.MitigationLevel);
                }, false);
            }
        } 
    }

    public static void ChangeSuppression(PeripheralFlags peripherals, bool suppress)
    {
        p.SuppressPlatformMitigation(peripherals, suppress);
    }

    public static void AddNotification(NotificationComponent component, PeripheralFlags peripheralsOfInterest)
    {
        if (FirstTime)
        {
            p.PowerThermalMitigationLevelChanged += NotificationHandler;
            FirstTime = false;
        }
        
        if (PowerThermalNotification.IsSupported(peripheralsOfInterest))
        {
            lock (listLock)
            {
                component.SetMitigationLevel(peripheralsOfInterest, (PowerThermalMitigationLevel)0);
                components.Add(component);
                p.PeripheralsOfInterest |= peripheralsOfInterest;
            }
        }
    }
}
```

Here is the NotificationComponent class:

```css
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using Microsoft.MixedReality.PowerThermalNotification;

public class NotificationComponent : MonoBehaviour
{
    //Note that this could be multiple peripherals, just need to make sure to look at impactedPeripherals in the handler
    public PeripheralFlags monitoredPeripheral = (PeripheralFlags) 0;
    public bool isSuppressed = false;

    public void SetMitigationLevel(PowerThermalMitigationLevel level)
    {
        Color newColor = Color.white;

        if (level == PowerThermalMitigationLevel.NoUserImpact)
        {
            newColor = Color.green;
        }
        else if (level == PowerThermalMitigationLevel.MinimumUserImpact)
        {
            newColor = Color.yellow;
        }
        else if (level == PowerThermalMitigationLevel.MediumUserImpact)
        {
            newColor = new Color32(255, 127, 37, 255);//Orange
        }
        else
        {
            newColor = Color.red;
        }

        MaterialPropertyBlock props = new MaterialPropertyBlock();
        props.SetColor("_Color", newColor);
        GetComponent<Renderer>().SetPropertyBlock(props);
    }

    public void SetMitigationLevel(PeripheralFlags impactedPeripherals, PowerThermalMitigationLevel level)
    {
        if (impactedPeripherals.HasFlag(monitoredPeripheral))
        {
            SetMitigationLevel(level);
        }
    }


    // Start is called before the first frame update
    void Start()
    {
        NotificationManager.AddNotification(this, monitoredPeripheral);
        NotificationManager.ChangeSuppression(monitoredPeripheral, isSuppressed);
    }

    // Update is called once per frame
    void Update()
    {
    }
}

```

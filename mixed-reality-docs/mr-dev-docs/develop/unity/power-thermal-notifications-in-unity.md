---
title: Power Thermal Notifications in Unity
description: Learn how to subscribe and handle Power Thermal events within a Unity mixed reality app.
author: chorkin
ms.author: chorkin
ms.date: 1/20/2022
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

The power consumed by our devices is dissipated in heat.  A traditional PC device would have a fan to address this, but a wearable device must be lightweight.  Because of this the cooling solution is more complex.  HoloLens 2 has built-in hardware and software safety features to ensure the headset does not get too hot for the user, but these features must be balanced with customer experience as well.

For example, if we know which part of the device is heating up, we can choose to throttle the peripherals responsible for this heat.  As a last resort, we might close an application that's thought to be responsible for the power that led to this heat.

HoloLens 2 does this using temperature sensors. A thermal framework ties groups of sensors to different peripherals on the device.  The sensors are grouped because it may be impossible to determine which peripheral in a physical area is responsible for the power draw that heats up the device.

The PowerThermalNotification SDK exposes the APIs necessary to monitor these groups of sensors.  SDK events fire when a peripheral being used by the application is showing signs that a mitigation may be required.  The application can then adapt its customer experience to reduce the thermal impact.  Reducing impact means less risk of system action such as application or device shutdown.

A simple example would be an application that's using the CPU to process a large amount of video data.  The application could subscribe to a performance notification for the CPU component.  When the application receives a notification, it can reduce the CPU workload.  If another event is received that indicates no further mitigation is necessary, the CPU workload can be restored.

## Platform Response

The following table is a breakdown of system actions by peripheral.  Actions described below can be suppressed using the SDK.  See [Suppressing Default System Mitigations](#suppressing-default-system-mitigations)

| **Peripheral**    |  **MinimumUserImpact**  |   **MediumUserImpact** |    **MaximumUserImpact** |**Last Resort**  |**Software Shutdown**| **Failsafe**|
|-------------------|-------------------------|------------------------|--------------------------|-----------------|-----------------|-----------------|
| Gpu     |  |Throttle MRC Quality </br> Adjust VSYNC Interval  |               |                 |                 |                 |
| Display | | Depth FPS Reduction |               |                 |                 |                 |
| Any Peripheral            |                                                  |  |               | Display Warning </br> Close Application </br> Stop MRC Capture | OS Shutdown | Hardware Shutdown |
> [!NOTE]
> <!--Last Resort Note-->Actions in the "Last Resort", "Software Shutdown", and "Failsafe" columns cannot be suppressed

## Suggestions for Application Response

The following is a breakdown of suggested mitigations an application can take based on which peripheral(s) need mitigation.  It is up to the application developer to determine which of these actions may have a more significant effect on each peripheral given every application is different.  Developers should prioritize actions they take based on the impact to the end user.

### Suggested Mitigations by Peripheral

#### CPU

* Reduce framerate
* Adjust per frame workload
  * Physics operations
  * Minimize background CPU cycles

#### GPU

* Reduce framerate
* Reduce resolution
* Reduce scene complexity (number of triangles and texture)
* Reduce field of view (FOV)
* Foveation
* Reduce PhotoVideoCamera frame processing

#### Dram

* Texture complexity
* Reduce framerate
* Reduce resolution
* Foveation

#### Network

* Reduce bandwidth
* Reduce video call framerate
* Stop background network activity (ex: application telemetry)

#### Battery

* Move to a cooler environment
* Use device without a charger

#### Display

* Increase the number of black pixels in the scene
* Use low-power colors (ex: green)

#### PhotoVideoCamera

* Reduce framerate
* Reduce resolution
* Stop using the PhotoVideoCamera

## Implementation use Cases

The SDK is designed to support two standard use cases to get information:

* Event based
* Polling based

Event based notification will provide the quickest feedback path to the application in case it needs to take action.  However in some cases it may be more convenient for the developer to use a polling methodology.

> [!NOTE]
> <!--Polling Note--> State information is update at most every few seconds for each peripheral, so polling any faster than that may waste CPU cycles.

## Event Based API Usage

### Registering for Events

To get notifications, there are three requirements:

* System support for the API including the specified peripheral
* A non-empty [PeripheralsOfInterest](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermalnotification.peripheralsofinterest) property
* A non-empty [PowerThermalMitigationLevelChanged](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermalnotification.powerthermalmitigationlevelchanged) notification handler

You won't receive events if your application doesn't meet these requirements.

The first item can be checked using the [IsSupported](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermalnotification.issupported) function.  If the system supports notifications for at least one of the peripherals in the mask, the function will return true.  You can choose not to check support using this function as long as your application doesn't explicitly depend on PowerThermalNotification SDK events.

Once you meet the three requirements above, you will receive initial notifications for all supported [PeripheralsOfInterest](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermalnotification.peripheralsofinterest).  If you later change [PeripheralsOfInterest](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermalnotification.peripheralsofinterest) or [PowerThermalMitigationLevelChanged](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermalnotification.powerthermalmitigationlevelchanged), you will receive another set of notifications based on current status.

Here's a code snippet for grabbing the [PowerThermalNotification](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermalnotification) class instance and configuring it for notifications for both [PowerThermalPeripheralFlags.Cpu](/dotnet/api/microsoft.mixedreality.powerthermalnotification.PowerThermalPeripheralFlags) and [PowerThermalPeripheralFlags.PhotoVideoCamera](/dotnet/api//microsoft.mixedreality.powerthermalnotification.PowerThermalPeripheralFlags):

```cs
using Microsoft.MixedReality.PowerThermalNotification;

private void NotificationHandler(object sender, PowerThermalEventArgs args)
{
    //  Notification handling can be done here using information contained in args
}

private void InitializeThermalNotifications()
{
    PowerThermalNotification p = PowerThermalNotification.GetForCurrentProcess();
    
    PowerThermalPeripheralFlags requestedFlags = PowerThermalPeripheralFlags.Cpu | PowerThermalPeripheralFlags.PhotoVideoCamera;
     if (PowerThermalNotification.IsSupported(requestedFlags))
    {
        //At least one of these peripherals is supported by the system
        p.PeripheralsOfInterest = requestedFlags;
        p.PowerThermalMitigationLevelChanged += NotificationHandler;
    }  
}
```

### Handling Events

When the [PowerThermalMitigationLevelChanged](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermalnotification.powerthermalmitigationlevelchanged) event fires, it comes with [PowerThermalEventArgs](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermaleventargs).  These should be used to understand the event.  

When an event is received, the event handler should inspect [args.ImpactedPeripherals](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermaleventargs.impactedperipherals) which identifies which peripheral(s) are impacted (there may be more than one).  The [args.MitigationLevel](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermaleventargs.mitigationlevel) indicates how severe of a mitigation is recommended for the specified peripherals.  If the mitigation level is [PowerThermalMitigationLevel.NoUserImpact](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermalmitigationlevel) then any mitigations associated with the specified peripherals should be removed.  The **args.ThermalScore** indicates a score from 100 to 0 reflecting a linear scale approaching an application shutdown event (zero).  The Thermal Score range begins outside of the mitigation reporting range to allow earlier notification to the application when approaching the need for mitigations.

Here's an example handler:

```cs
bool doCpuThrottle = false;

private void NotificationHandler(object sender, PowerThermalEventArgs args)
{
    if (args.ImpactedPeripherals.HasFlag(PowerThermalPeripheralFlags.Cpu))
    {
        if(args.MitigationLevel = PowerThermalMitigationLevel.NoUserImpact)
        {
            doCpuThrottle = false;
        }
        else if(args.MitigationLevel >= PowerThermalMitigationLevel.MinimumUserImpact)
        {
            // Note that this only kicks in at MinimumUserImpact and does not get released until NoUserImpact
            doCpuThrottle = true;
        }
    }

    if (args.ImpactedPeripherals.HasFlag(PowerThermalPeripheralFlags.PhotoVideoCamera))
    {
        SetMitigationStatus(PhotoVideoCameraStatusText, PhotoVideoRectangle, args.MitigationLevel);
    }
}
```

> [!NOTE]
> <!--Hysteresis Note-->The ImpactedPeripherals parameter of args only identifies those peripherals that were both impacted AND part of PeripheralsOfInterest.  Other impacted peripherals that were not included in PeripheralsOfInterest will not be identified.

> [!NOTE]
> <!--Hysteresis Note-->Mitigation levels for peripherals have hysteresis.  Once the level increases, it doesn't decrease until it releases.  The release is an event with args.MitigationLevel set to PowerThermalMitigationLevel.NoUserImpact.

### Putting it Together (Event Based Model)

Here's a simple example of a set of scripts that can be used in Unity to enable this functionality.  The NotificationComponent class can be added to any game object and that game object can track the mitigation level of the assigned peripheral.  The NotificationManager class deals with the SDK managing subscriptions through the single [instance](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermalnotification.getforcurrentprocess) of the [PowerThermalNotification](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermalnotification) class

Here's the NotificationManager class:

```cs
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

    public static void ChangeSuppression(PowerThermalPeripheralFlags peripherals, bool suppress)
    {
        p.SuppressPlatformMitigation(peripherals, suppress);
    }

    public static void AddNotification(NotificationComponent component, PowerThermalPeripheralFlags peripheralsOfInterest)
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

```cs
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using Microsoft.MixedReality.PowerThermalNotification;

public class NotificationComponent : MonoBehaviour
{
    //Note that this could be multiple peripherals, just need to make sure to look at impactedPeripherals in the handler
    public PowerThermalPeripheralFlags monitoredPeripheral = (PowerThermalPeripheralFlags) 0;
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

    public void SetMitigationLevel(PowerThermalPeripheralFlags impactedPeripherals, PowerThermalMitigationLevel level)
    {
        if (impactedPeripherals.HasFlag(monitoredPeripheral))
        {
            SetMitigationLevel(level);
        }
    }

    void Start()
    {
        NotificationManager.AddNotification(this, monitoredPeripheral);
        NotificationManager.ChangeSuppression(monitoredPeripheral, isSuppressed);
    }

}

```

## Polling Based API Usage

### Updating Peripherals Of Interest

Similar to the event based usage, setting the [PeripheralsOfInterest](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermalnotification.peripheralsofinterest) property is required to poll a given peripheral.

>[!WARNING]
>If you attempt to call **GetLatestPeripheralState** for a given peripheral without first setting that flag in  [PeripheralsOfInterest](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermalnotification.peripheralsofinterest) an exception will be thrown. Similarly, attempts to use **GetLatestPeripheralState** with an invalid value (multiple flag bits set, or an unsupported bit) an exception will be thrown.

### Calling the Polling APIs

Once [PeripheralsOfInterest](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermalnotification.peripheralsofinterest) has the peripheral bits set that you wish to poll, you may call into **GetLatestPeripheralState**.

The returned **PowerThermalPeripheralState** contains latest values for Thermal Score and Mitigation Level.

> [!NOTE]
> It is possible that in future platforms given peripherals may not be supported.  In these cases the API will return a Thermal Score of 100 and a Mitigation Level of NoUserImpact.  The application may check the **IsSupportedPeripheral** field of the structure to check whether or not this is the case for a given peripheral.

See [Handling Events](#handling-Events) for details on handling of the Thermal Score and Mitigation Levels returned by **PowerThermalPeripheralState**.

Here's a small snippet showing polling:

```cs
private async void timerCallback(object state)
{
    await Dispatcher.RunAsync(Windows.UI.Core.CoreDispatcherPriority.Normal, () =>
    {
        PowerThermalNotification p = PowerThermalNotification.GetForCurrentProcess();

        PowerThermalPeripheralState CpuState = p.GetLatestPeripheralState(PowerThermalPeripheralFlags.Cpu);
        PowerThermalPeripheralState PhotoVideoCameraState = p.GetLatestPeripheralState(PowerThermalPeripheralFlags.PhotoVideoCamera);
        
        CpuScoreText.Text = CpuState.ThermalScore.ToString();
        PhotoVideoScoreText.Text = PhotoVideoCameraState.ThermalScore.ToString();
    });
}

private void InitializeThermalNotifications()
{
    PowerThermalNotification p = PowerThermalNotification.GetForCurrentProcess();

    PowerThermalPeripheralFlags requestedFlags = PowerThermalPeripheralFlags.Cpu | PowerThermalPeripheralFlags.PhotoVideoCamera;
    p.SuppressedPlatformMitigationForPeripherals = requestedFlags;//Suppress any platform mitigation on CPU or PhotoVideoCamera

    if (PowerThermalNotification.IsSupported(requestedFlags))
    {
        p.PeripheralsOfInterest = requestedFlags;

        Timer timer = new Timer(timerCallback, null, 0, 3000);
    }
    else
    {
        TitleLabel.Text = "Not Supported";
    }
}
```

## Suppressing Default System Mitigations

If you don't want the system to attempt to mitigate certain peripherals, you can suppress them.  To do this, just update the [SuppressedPlatformMitigationForPeripherals](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermalnotification.suppressedplatformmitigationforperipherals) property, or call the [SuppressPlatformMitigation](/dotnet/api/microsoft.mixedreality.powerthermalnotification.powerthermalnotification.suppressplatformmitigation) function.

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

## Testing

Once you have integrated the SDK into your application, you will want to test it.  For HoloLens 2 operating systems that supports the SDK, a developer page will be available in [Device Portal](../advanced-concepts/using-the-windows-device-portal.md#powerthermalsdk-test)

From this page you may control the mitigation levels and thermal scores for each peripheral.  You may also monitor which peripherals have mitigations being actively suppressed.

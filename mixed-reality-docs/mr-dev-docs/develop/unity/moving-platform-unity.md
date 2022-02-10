---
title: Moving Platform Mode in Unity
description: Learn about how to interact with Moving Platform Mode from unity.
author: JoshuaElsdon
ms.author: alexturn
ms.date: 02/15/2022
ms.topic: article
keywords: Moving, Platform, Mode, Tracking, Vehicles, Cars, Ships, Stability
---

# Moving Platform Mode in Unity

Moving Platform Mode is a feature that's available for Hololens 2 and allows the device to work correctly on moving platforms such as ships, oil platforms, etc.

[Learn more about Moving Platform Mode](https://docs.microsoft.com/hololens/hololens2-moving-platform)

## Where do I get the SDK?

The Moving Platform SDK is downloadable via the [Mixed Reality Feature Tool](https://review.docs.microsoft.com/en-us/windows/mixed-reality/develop/unity/welcome-to-mr-feature-tool).
The Moving Platform SDK supports language projections for C# and C++, allowing developers to develop applications for Win32 or UWP platforms.

## Conceptual Overview

For mixed reality systems to work correctly, the headset must be tracked relative to the environment. This allows the graphics to be rendered such that they appear to the user of the headset to be solidly locked in the environment. This is usually done by combining poses that are calculated through outward-looking cameras on the headset and measurements from the IMU (Inertial Measurement Unit). This works well when the environment is in the inertial frame of reference (neglecting small effects like planetary motion.).

Note that when the environment isn't in the inertial frame of reference, the normal head tracking system will fail. The Moving Platform Mode feature solves this problem by accounting for the motion of the environment relative to the inertial frame. Thus, when in Moving Platform Mode, Hololens 2 can render holograms that appear fixed to the environment, even if the environment is a lurching ship!

## How should I activate Moving Platform Mode?

In order to enable a range of use cases, various methods have been provided to activate Moving Platform Mode. It's important that you carefully consider which method to choose based on the use case that you're developing for. A key question to ask is: Who knows whether the Hololens 2 is currently within a moving platform? See the following table for an example:

| Who knows if HL2 is in a moving platform | Best method of setting Moving Platform Mode | Benefits | Costs |
|--------------|------------------------|-----|---- |
|System Administrator| [Mobile Device Management](/hololens/hololens2-moving-platform#via-mobile-device-management-mdm)|  The user does not need to be involved. Any app will work without modification. Device can be protected from entering the incorrect mode.| User and Apps cannot change the mode. |
|End User            | [The Settings App](/hololens/hololens2-moving-platform#on-device-settings)| The user is often the most knowledgeable about when and where they are using the device. Any app will work without modification.| The user may not know the mode exists. |
|The Application     | Use the SDK described in this article.| Use case specific cues can be used to swap the mode when this cannot be known ahead of time. Removes the requirement that a user has to make this decision and change the mode in settings.| A poorly designed app can give a very bad experience, and leave the device in an unexpected mode. |

## Best practices for Moving Platform Mode

| Principal | Description|
|-----------|------------|
|Respect user choice | You should offer the user the choice before changing the mode for them, and you should continue to respect that choice for the runtime of the app|
|Provide a warning to the user| Avoid changing mode immediately on start/resume of the app, this presents a poor user experience, as the user may not know why the device is losing tracking.|
|Minimize changing mode | When changing the Moving Platform Mode settings the device will lose tracking, causing a negative user experience. It is therefore recommended that you minimize the frequency with which you change the mode. Ideally the mode would only be changed if the device is transitioning from a stationary environment to a moving one, or vice versa.|
|If uncertain about environment, use Moving Platform Mode | Moving Platform Mode can work in both stationary environments and moving ones, the regular tracking algorithms will only work in stationary environments. Hence if you are uncertain about whether the environment is moving, choosing Moving Platform Mode can be the safer choice. |
|Do not use Moving Platform Mode in known stationary environments| Moving Platform Mode performs less well than the standard mode in stationary environments. This is a small degradation, though will be noticeable to most users.|
|Consider what mode to leave the device in | This SDK is unusual in that it allows a system wide setting to be set by an application, this is so that developers can design experiences that are robust accros boot of the device. Consider if the device will be on a moving platform next time it is booted, and leave the device in the appropriate mode.|

## How do I use this SDK

First, install the SDK plugin from the [Mixed Reality Feature Tool](https://review.docs.microsoft.com/windows/mixed-reality/develop/unity/welcome-to-mr-feature-tool). You can then set up your script to use MovingPlatformManger as follows:

```cs
// Top of file
using Microsoft.MixedReality.MovingPlatform;
// Code body
m_movingPlatformManager = new MovingPlatformManager();
```

### Reading the current mode

The current value of the mode can be read as follows:
```cs
MovingPlatformMode currentMode = m_movingPlatformManager.Mode;
```
MovingPlatformMode is an enum that is defined as follows:
```cs
public enum MovingPlatformMode
{
    Standard,                // The legacy mode that devices use out-of-the-box.
    MovingPlatformOptimized  // Allows tracking on moving platforms.
}
```

Devices that do not have Moving Platform Mode available, like VR devices and Hololens 1, will always return 'Standard'.

### Setting the mode

You can set the Moving Platform Mode value as follows:
```cs
bool success = m_movingPlatformManager.TrySetMode(MovingPlatformMode.MovingPlatformOptimized);
```
TrySetMode will return true if the device mode now matches the requested mode. If the mode is already in the desired state, nothing will be done and the device won't lose tracking.

### Callback on mode change

At times, it could be useful to know if another app, or the user, has changed the Moving Platform Mode value. You can do this as follows.
```cs
// Code Body
m_movingPlatformManager.ModeChanged += CallbackOnMPMChanged;
...
void CallbackOnMPMChanged(object sender, MovingPlatformEventArgs args)
{
    movingPlatformModeChanged = true;
    movingPlatformModeValue = args.ModeEntered;
}
...
void Update()
{
    // It is not reccomended to do work in the callback.
    if (movingPlatformModeChanged)
    {
        movingPlatformModeChanged = false;
        // Do some work
    }
}
```

### Checking if mode is settable

Sometimes it's useful to know whether the mode is settable before attempting to change it, for example, if you'd like to know if there is any value in asking the user their preference. You can achieve this with the IsSetModeSupported function:
```cs
bool supported = m_movingPlatformManager.IsSetModeSupported();
```
This function will return true if the device can change modes, and false if that's not possible. This function does account for Mobile Device Management (MDM) policies. For example, if MDM forces the MovingPlatformMode to "On", then this function will return false.

## A demo script

This script shows all of the important elements of the SDK in one place. The example doesn't follow the best practices shown above. 
```cs
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Microsoft.MixedReality.MovingPlatform;
using System;

public class MovingPlatformDemo : MonoBehaviour
{
    public GameObject cube; // A simple cube to display colors.
    private MovingPlatformManager m_movingPlatformManager;
    private Renderer cubeRenderer;
    private bool movingPlatformModeChanged;
    private MovingPlatformMode movingPlatformModeValue;

    // Start is called before the first frame update
    void Start()
    {
        m_movingPlatformManager = new MovingPlatformManager();
        cubeRenderer = cube.GetComponent<Renderer>();

        // Get initial value of mode, 
        // Just this mechanism would be adequate if a one time check is acceptable. 
        MovingPlatformMode initialMovingPlatformMode = m_movingPlatformManager.Mode;

        // Find if it is possible to change the mode. 
        bool isSettable = m_movingPlatformManager.IsSetModeSupported();

        // Here you would add some use case specific logic using initialMovingPlatformMode and isSettable
        // to decide if you should ask the user if they want to change the mode. 

        // To set the mode.
        bool success = m_movingPlatformManager.TrySetMode(MovingPlatformMode.MovingPlatformOptimized);

        // Visual indicator of current state: Green = Moving Platform Optimized, Red = Regular.
        SetColourFromState(m_movingPlatformManager.Mode, cubeRenderer);

        // We set a callback to be notified if there is a change in mode. This is typically optional.
        m_movingPlatformManager.ModeChanged += CallbackOnMPMChanged;
        movingPlatformModeChanged = false;
    }

    // Update is called once per frame
    void Update()
    {
        // This must be done in the UI thread.
        if (movingPlatformModeChanged)
        {
            movingPlatformModeChanged = false;
            SetColourFromState(movingPlatformModeValue, cubeRenderer);
        }
    }

    // Sets renderer to:
    // Green = Moving Platform Mode Enabled
    // Red = Moving Platform Mode Disabled
    void SetColourFromState(MovingPlatformMode mode, Renderer thisRend)
    {
        if (mode == MovingPlatformMode.MovingPlatformOptimized)
        {
            thisRend.material.color = new Color(0f, 1f, 0f, 1f);
        }
        else
        {
            thisRend.material.color = new Color(1f, 0f, 0f, 1f);
        }
    }

    void CallbackOnMPMChanged(object sender, MovingPlatformEventArgs args)
    {
        movingPlatformModeChanged = true;
        movingPlatformModeValue = args.ModeEntered;
    }
}
```


## See also

* [Moving Platform Mode](https://docs.microsoft.com/en-us/hololens/hololens2-moving-platform)

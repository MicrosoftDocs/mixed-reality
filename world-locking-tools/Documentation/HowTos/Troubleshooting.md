---
title: Troubleshooting
description: Notes on things that have gone wrong and what was done to fix them.
author: fast-slow-still
ms.author: mafinc
ms.date: 10/06/2021
ms.prod: mixed-reality
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Augmented Reality, Mixed Reality, ARCore, ARKit, development, MRTK
---

# Troubleshooting World Locking Tools

Annoying issues will be noted here. Also, here's a [recommended strategy](TroubleshootingAdvanced.md) for narrowing world-locking problems.

## World Locking issues

### Low frame rate

World Locking Tools should have no discernable impact on your framerate. (An exception is that the visualizations will eventually drag down your framerate after many anchors have been created, but the visualizers are just for diagnostics, not for shipping with your application.)

If you see a framerate drop after adding World Locking Tools to your application, check your Unity logs. That usually means an exception is being repeatedly generated.

### "Missing DLL" errors

These errors are usually from the Frozen World Engine DLL. To resolve them, follow the instructions in the setup documentation to [upgrade the FrozenWorld engine to a later version](~/documentation/howtos/initialsetup.md#manual-frozen-world-engine-dll-installation). Following those instructions without changing the version number will repair the installation.

Alternately, you can [install using the MR Feature Tool](WLTviaMRFeatureTool.md). The Tool handles the installation of dependencies for you.

### Missing 'FrozenWorld' namespace

Errors like the following (usually a lot):

> Assets\WorldLocking.Engine\Plugin.cs(10,37): error CS0234: The type or namespace name 'FrozenWorld' does not exist in the namespace 'Microsoft.MixedReality' (are you missing an assembly reference?)

It's missing the FrozenWorld.Engine DLL. See [NuGet Setup](InitialSetup.md#frozenworld-engine-installation).

Alternately, [install using the MR Feature Tool](WLTviaMRFeatureTool.md) and have dependencies installation handled for you.

### It's not working

Check the Unity logs for errors and exceptions.

Confirm that your scene camera is attached to at least one other object. See the setup in [WorldLocking.Examples.WorldLockingPhysicsSample](~/docs/howtos/samples/worldlockedphysicssample.md) for an example. If you're doing dynamic camera manipulation, you may need to keep `WorldLockingManager` informed of the current camera. See [WorldLockingManager.AdjustmentFrame](xref:Microsoft.MixedReality.WorldLocking.Core.WorldLockingManager.AdjustmentFrame) and [WorldLockingManager.CameraParent](xref:Microsoft.MixedReality.WorldLocking.Core.WorldLockingManager.CameraParent).

## More general Unity/AR problems

### "DirectoryNotFoundException: Could not find a part of the path"

The path has grown too long. See fuller [explanation here](InitialSetup.md#a-warning-note-on-installation-path-length).

### You see "A remote operation is taking longer than expected" message box and then there's a failure to deploy

Check your USB connection. A bad cable, a bad port, or missing IPOverUSB can all cause this problem. But it's probably somewhere on the communication path from your PC to your device.

### Missing Windows SDK components

Mismatch between Visual Studio version indicated in Unity versus Visual Studio version you're trying to build with. Check:

> `Unity > File > Build Settings > Visual Studio Version`

Especially dangerous is if that's set to `Latest Installed` and you have multiple versions of Visual Studio installed.

### On HoloLens, application starts up as a slate, rather than an AR experience

If targeting the Unity's built-in VR support, also known as Legacy XR, then check:

> `Unity > Project Settings > Player > XR Settings`  

You must have **Virtual Reality Supported** selected, and the **Windows Mixed Reality** selected in **Virtual Reality SDKs**.

If you're using Unity's AR Subsystems / XR SDK, confirm that you've followed all the steps in our [Cross Platform using Unity's XR SDK Plugin system](XRSDK.md) article. Likely culprits are:

* Missing one of the required packages.
* The appropriate profile hasn't been set on the MixedRealityToolkit object (if using MRTK).

### When the app is built for ARM on HoloLens2, the app stops at startup, ARM64 works fine

[Known issue](https://issuetracker.unity3d.com/issues/enabling-graphics-jobs-in-2019-dot-3-x-results-in-a-crash-or-nothing-rendering-on-hololens-2).

The fix is either disable Graphics Jobs under

> `Project Settings > Player > Other Settings > Graphics Jobs`

or just build for ARM64.

## See also

* [WLT troubleshooting strategy](TroubleshootingAdvanced.md)

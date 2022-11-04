---
title: Input providers
description: Documentation on diffrent types of Input Providers in MRTK
author: keveleigh
ms.author: kurtie
ms.date: 01/12/2021
keywords: Unity,HoloLens, HoloLens 2, Mixed Reality, development, MRTK,
---

# Input providers &#8212; MRTK2

Input providers are registered in the **Registered Service Providers Profile**, found in the Mixed Reality Toolkit component:

<img src="../images/input/RegisteredServiceProviders.PNG" width="650px" alt="Service providers">

These are the input providers available out of the box, together with their corresponding controllers:

| Input Provider | Controllers |
| --- | --- |
| [`Input Simulation Service`](xref:Microsoft.MixedReality.Toolkit.Input.InputSimulationService?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) | Simulated Hand |
| [`Mouse Device Manager`](xref:Microsoft.MixedReality.Toolkit.Input.UnityInput.MouseDeviceManager?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) | Mouse  |
| [`OpenVR Device Manager`](xref:Microsoft.MixedReality.Toolkit.OpenVR.Input.OpenVRDeviceManager?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) | Generic OpenVR, Vive Wand, Vive Knuckles, Oculus Touch, Oculus Remote, Windows Mixed Reality OpenVR  |
| [`Unity Joystick Manager`](xref:Microsoft.MixedReality.Toolkit.Input.UnityInput.UnityJoystickManager?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) | Generic Joystick  |
| [`Unity Touch Device Manager`](xref:Microsoft.MixedReality.Toolkit.Input.UnityInput.UnityTouchDeviceManager?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) | Unity Touch Controller  |
| [`Windows Dictation Input Provider`](xref:Microsoft.MixedReality.Toolkit.Windows.Input.WindowsDictationInputProvider?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) | *None*  |
| [`Windows Mixed Reality Device Manager`](xref:Microsoft.MixedReality.Toolkit.WindowsMixedReality.Input.WindowsMixedRealityDeviceManager?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) | WMR Articulated Hand, WMR Controller, WMR GGV (Gaze, Gesture, and Voice) Hand |
| [`Windows Speech Input Provider`](xref:Microsoft.MixedReality.Toolkit.Windows.Input.WindowsSpeechInputProvider?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) | *None* |

Dictation and Speech providers don't create any controllers, they raise their own specialized input events directly.

Custom input providers can be created by implementing the [`IMixedRealityInputDeviceManager`](xref:Microsoft.MixedReality.Toolkit.Input.IMixedRealityInputDeviceManager?view=mixed-reality-toolkit-unity-2020-dotnet-2.8.0&preserve-view=true) interface.

For more information, please see [creating an input system data provider](create-data-provider.md).

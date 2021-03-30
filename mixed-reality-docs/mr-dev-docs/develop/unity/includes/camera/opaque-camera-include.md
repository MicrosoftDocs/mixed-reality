# [MRTK](#tab/mrtk)
<!-- NEVER CHANGE THE ABOVE LINE! -->

MRTK will handle specific camera settings automatically, based on the [configuration in the camera system profile](https://docs.microsoft.com/windows/mixed-reality/mrtk-unity/features/camera-system/camera-system-overview#display-settings).

**Namespace:** *Microsoft.MixedReality.Toolkit.CameraSystem*<br>
**Type:** *MixedRealityCameraSystem*

To check the camera's opaqueness, the MixedRealityCamera system has [an `IsOpaque` property](https://docs.microsoft.com/dotnet/api/microsoft.mixedreality.toolkit.camerasystem.mixedrealitycamerasystem.isopaque).

```cs
CoreServices.CameraSystem.IsOpaque;
```

# [XR SDK](#tab/xr)
<!-- NEVER CHANGE THE ABOVE LINE! -->

**Namespace:** *UnityEngine.XR*<br>
**Type:** *XRDisplaySubsystem*

You can use script code to determine at runtime whether the headset is immersive or holographic by checking [displayOpaque](https://docs.unity3d.com/ScriptReference/XR.XRDisplaySubsystem-displayOpaque.html) on the actively running [XRDisplaySubsystem](https://docs.unity3d.com/ScriptReference/XR.XRDisplaySubsystem.html).

# [Legacy WSA](#tab/wsa)
<!-- NEVER CHANGE THE ABOVE LINE! -->

**Namespace:** *UnityEngine.XR.WSA*<br>
**Type:** *HolographicSettings*

You can use script code to determine at runtime whether the headset is immersive or holographic by checking [HolographicSettings.IsDisplayOpaque](https://docs.unity3d.com/ScriptReference/XR.WSA.HolographicSettings.IsDisplayOpaque.html).
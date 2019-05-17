---
title: Mixed Reality native objects in Unity
description: HoloLens locatable camera usage in Unity.
author: vladkol
ms.author: vladkol
ms.date: 03/21/2018
ms.topic: article
keywords: unity, mixed reality, native, xrdevice, holographicframe, holographiccamera
---



# Mixed Reality native objects in Unity

[Getting a Holographic Space](getting-a-holographicspace.md) is what every Mixed Reality app does before it starts receiving camera data and render frames. In Unity, the engine takes care of those steps for you, handling Holographic objects and updates internally. 

Although, in certain scenarios you may want to get access to underlying native objects, such as Holographic Cameras and current Holographic Frame. [UnityEngine.XR.XRDevice](https://docs.unity3d.com/ScriptReference/XR.XRDevice.html) is what provides access to these objects.

## XRDevice 

**Namespace:** *UnityEngine.XR*<br>
**Type:** *XRDevice*

The *XRDevice* type allows you to take access underlying native objects using [GetNativePtr](https://docs.unity3d.com/ScriptReference/XR.XRDevice.GetNativePtr.html) method. What GetNativePtr returns varies between different platforms. On Universal Windows Platform, when running a Mixed Reality app, with XR enabled, GetNativePtr a pointer (IntPtr) to the following structure: 

```cs
struct HolographicDeviceStructure
{
    public uint VersionNumber;
    public uint MaxNumberOfCameras;
    public IntPtr ISpatialCoordinateSystemPtr; // Windows::Perception::Spatial::ISpatialCoordinateSystem
    public IntPtr IHolographicFramePtr; // Windows::Graphics::Holographic::IHolographicFrame 
    public IntPtr IHolographicCameraPtr; // // Windows::Graphics::Holographic::IHolographicCamera
}
```

### Using HolographicDeviceStructure

> [!NOTE]
> Using native objects received via HolographicDeviceStructure may cause unpredictable behaviour and rendering artifacts. We don't recommend calling methods that may change state of these objects or change objects' properties directly, e.g. HolographicFrame.UpdateCurrentPrediction, HolographicCamera properties, etc. 

You can use object from HolographicDeviceStructure when access to native interfaces is required for rendering or debugging purposes, in your native plugins or C# code. 

Here is an example of how you can use HolographicDeviceStructure for 
getting current frame prediction time. 
```cs
public static bool GetCurrentFrameDateTime(out DateTime frameDateTime)
{
#if (!UNITY_EDITOR && UNITY_WSA) || ENABLE_WINMD_SUPPORT
    IntPtr nativeStruct = UnityEngine.XR.XRDevice.GetNativePtr();

    if (nativeStruct != IntPtr.Zero)
    {
        HolographicDeviceStructure xrs = System.Runtime.InteropServices.Marshal.PtrToStructure<HolographicDeviceStructure>(nativeStruct);

        if (xrs.IHolographicFramePtr != IntPtr.Zero)
        {
            var holographicFrame = (Windows.Graphics.Holographic.HolographicFrame)System.Runtime.InteropServices.Marshal.GetObjectForIUnknown(xrs.IHolographicFramePtr);
            frameDateTime = holographicFrame.CurrentPrediction.Timestamp.TargetTime.DateTime;
            return true;
        }
    }

#endif

    frameDateTime = DateTime.MinValue;
    return false;
}

```

## See Also
* [SpatialCoordinateSystem Class](https://docs.microsoft.com/en-us/uwp/api/windows.perception.spatial.spatialcoordinatesystem)
* [HolographicFrame Class](https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographicframe)  
* [HolographicCamera Class](https://docs.microsoft.com/en-us/uwp/api/windows.graphics.holographic.holographiccamera) 
* [Rendering in DirectX](https://docs.microsoft.com/en-us/windows/mixed-reality/rendering-in-directx)  

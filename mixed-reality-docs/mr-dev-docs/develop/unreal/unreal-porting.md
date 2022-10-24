---
title: Upgrading projects in Unreal
description: Keep up to date with version upgrade steps, API changes, and deprecations for your Unreal projects.
author: hferrone
ms.author: jacksonf
ms.date: 11/23/2020
ms.topic: article
ms.localizationpriority: high
keywords: Unreal, Unreal Engine 4, UE5, Unreal Engine 5, OpenXR, UE4, HoloLens, HoloLens 2, mixed reality, development, documentation, guides, features, mixed reality headset, windows mixed reality headset, virtual reality headset, porting, upgrading, changes
---

# Upgrading projects in Unreal

When updating to a new version of Unreal, deprecated functions show up as warnings when compiling blueprints or packaging the project.  Functions are deprecated when a new function has been added that should be used instead.

## 5.0 changes

In 5.0, the Windows Mixed Reality (WMR) plugin that ships with Unreal Engine is deprecated in favor of the OpenXR plugin (available on [Unreal Marketplace](https://www.unrealengine.com/marketplace/en-US/product/ef8930ca860148c498b46887da196239) or [GitHub](https://github.com/microsoft/Microsoft-OpenXR-Unreal)). The WMR plugin will be removed in future engine releases, so developers should move to OpenXR.

### OpenXR vs Microsoft OpenXR
The OpenXR plugin that ships with the engine can be used to create an application, but any MSFT-specific OpenXR features (including Holographic App Remoting) will only exist in the Microsoft OpenXR plugin, so it does need to be downloaded to create a full-featured experience.

### Updates

The Microsoft OpenXR plugin is shipped out-of-band to the Unreal engine, so that plugin should be monitored for new features. Updates will be available as they're developed. This is a shift from the WMR plugin, where each engine release had all new features baked in.

### HoloLensAR

The HoloLens AR plugin has been removed and should no longer be included as a plugin dependency in Unreal Engine 5.0.

## 5.0 warnings

Updated Unreal Engine 5.0 projects may see new compiler errors for FVectors and Shaders due to UE5's [Large World Coordinates](https://docs.unrealengine.com/5.0/en-US/large-world-coordinates-in-unreal-engine-5/) which increased precision from float to double.

## 4.26 changes

The significant change is that **Start in VR** from **Edit > Project Settings > Project > Description > Settings** is mandatory for starting Windows Mixed Reality plugin. Without that parameter, you will not see your holograms on the device.

## 4.26 warnings
 
In 4.26, all AR and VR platforms have been refactored to add common interfaces and keep application code platform agnostic, so you may see more warnings than usual.  Updating to the new APIs is recommended so the project can be more easily ported to other platforms.

Warning messages will show which function has been deprecated and indicate what function to use instead.  All deprecated functions will continue to work for this release but may not work in future releases.  Deprecated functions will also no longer be listed when searching for functions in a blueprint.

![Blueprint of the Create Named ARPin function](images/unreal-porting-img-01.png)

### 4.25 deprecations

| Deprecated function | New function |
| --- | --- |
| CreateNamedARPin | ![Blueprint of the Pin Component function](images/unreal-porting-img-02.png) |
| LoadWMRAnchorStoreARPins | ![Blueprint of the Load ARPins from Local Store function](images/unreal-porting-img-03.png) |
| LoadWMRAnchorSaveARPinToWMRAnchorStoreStoreARPins | ![Blueprint of the Save ARPin to Local Store function](images/unreal-porting-img-04.png) |
| RemoveARPinFromWMRAnchorStore | ![Blueprint of the Remove ARPin from Local Store function](images/unreal-porting-img-05.png) |
| SetEnabledMixedRealityCamera | ![Blueprint of the Set Enabled XRCamera function](images/unreal-porting-img-06.png) |
| ResizeMixedRealityCamera | ![Blueprint of the Resize XRCamera function](images/unreal-porting-img-07.png) |
| StartCameraCapture | ![Blueprint of the Toggle ARCapture function for starting camera capture](images/unreal-porting-img-08.png) |
| StopCameraCapture | ![Blueprint of the Toggle ARCapture function for stopping camera capture](images/unreal-porting-img-09.png) |
| StartQRCodeCapture | ![Blueprint of the Toggle ARCapture function for starting QR code capture](images/unreal-porting-img-10.png) |
| StopQRCodeCapture | ![Blueprint of the Toggle ARCapture function for stopping QR code capture](images/unreal-porting-img-11.png) |
| Spatial mapping previously automatically started in 4.25, but now needs to be toggled in 4.26. | ![Blueprint of the Toggle ARCapture function for enabling spatial mapping](images/unreal-porting-img-12.png) |
| ShowKeyboard | Removed in 4.26 since the keyboard automatically shows when a text widget is focused on. |
| HideKeyboard | Removed in 4.26 since the keyboard will automatically hide when a text widget is unfocused. |
| SupportsHandTracking | ![Blueprint of the Supports Hand Tracking property](images/unreal-porting-img-13.png) |
| IsDisplayOpaque | ![Blueprint of the IsDisplayOpaque property](images/unreal-porting-img-14.png) |
| GetHandJointTransform, GetPointerPoseInfo, GetControllerTrackingStatus | ![Blueprint of the Get Motion Controller Data function](images/unreal-porting-img-15.png) |
| GetVersionString | ![Blueprint of the Get Version String function](images/unreal-porting-img-16.png) |
| IsTrackingAvailable | ![Blueprint of the IsTrackingAvailable property](images/unreal-porting-img-17.png) |
| IsButtonClicked, IsButtonDown, IsGrasped, IsSelectPressed | Use Unreal’s input action system. |
| SetFocusPointForFrame | Removed in 4.26.  Previously used for reprojection when remoting, which now supports depth reprojection. |

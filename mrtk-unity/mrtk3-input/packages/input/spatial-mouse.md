---
title: Spatial Mouse
description: Documentation for the Spatial Mouse in MRTK3
author: marlenaklein-msft
ms.author: marlenaklein
ms.date: 7/5/2023
ms.localizationpriority: high
keywords: Unity, HoloLens, HoloLens 2, Mixed Reality, MRTK, MRTK3, Input, Spatial Mouse
---

# Spatial Mouse&#8212; MRTK3

The `MRTK Spatial Mouse Interactor` powers a spatial mouse, with similar behavior to the HoloLens 2 system mouse. The interactor is an implementation of [XRRayInteractor](https://docs.unity3d.com/Packages/com.unity.xr.interaction.toolkit@2.4/api/UnityEngine.XR.Interaction.Toolkit.XRRayInteractor.html) and [IRayInteractor](/dotnet/api/microsoft.mixedreality.toolkit.irayinteractor) that provides extra functionality to handle mouse movement, clicking, and scrolling. 

## How to use the spatial mouse

By default the `MRTK Spatial Mouse Interactor` isn't included on the `MRTK XR Rig`. In order to enable the spatial mouse, add the `MRTK Spatial Mouse Controller` prefab asset under MRTK XR Rig > Camera Offset. The action map for the MRTK Spatial Mouse is already included in `MRTK Default Input Actions`. Ensure that your mouse is paired with your device. Once the `MRTK Spatial Mouse Controller` has been added to the rig, the spatial mouse appears in the scene. 

Check out the `Spatial Mouse Sample` scene for an example.

>[!Note]
> In editor, you may need to use the Esc key to exit so that your mouse no longer controls the spatial mouse in the scene. 

>[!Important]
> This is an experimental feature. This class is early in the cycle, it has been labeled as experimental to indicate that it is still evolving, and subject to change over time. Parts of the MRTK, such as this class, appear to have a lot of value even if the details haven not fully been fleshed out. For these types of features, we want the community to see them and get value out of them early enough so to provide feedback. 


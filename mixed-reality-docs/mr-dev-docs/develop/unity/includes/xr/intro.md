# [OpenXR](#tab/openxr)

The Mixed Reality OpenXR plugin is **Microsoft's recommendation** for Unity 2020 LTS or later. As new features are developed, they will only be included in the Mixed Reality OpenXR plugin going forward.

The Mixed Reality OpenXR plugin fully supports AR Foundation 4.0, providing ARPlaneManager and ARRaycastManager implementations. This enables you to write raycasting code once that then spans HoloLens 2 and ARCore/ARKit phones and tablets.

# [Windows XR](#tab/windowsxr)

Microsoft don't recommend using the Windows XR plugin for any new projects in Unity 2020.

However, if you're using Unity 2019 and you need AR Foundation 2.0 for compatibility with ARCore/ARKit devices, this plugin enables that support.

> [!IMPORTANT]
> Using this plugin in Unity 2019 doesn't support Azure Spatial Anchors. 

# [Legacy XR](#tab/legacy)

If you're still on Unity 2019 or earlier, Microsoft recommends using the Legacy Built-in XR support. While the Windows XR plugin is functional on Unity 2019, it's not recommended because Azure Spatial Anchors isn't supported.
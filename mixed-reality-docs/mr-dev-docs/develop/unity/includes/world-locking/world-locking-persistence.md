# [World Locking Tools (Recommended)](#tab/wlt)

By default, World Locking Tools restore Unity's coordinate system relative to the physical world across sessions on devices that support persistence of local spatial anchors. To have a hologram appear in the same place in the physical world after quitting and rerunning the application, the application only needs to restore the same pose to the hologram.

![World locking context component in Unity inspector](../../images/world-locking-tools-img-02.png)

If the application needs finer control, you can disable **Auto-Save** and **Auto-Load** in the inspector, and manage persistence from a script. For more information, see [Persist spatial coordinate systems](/mixed-reality/world-locking-tools/documentation/concepts/advanced/persistence).

World Locking Tools supports local anchor persistence only on HoloLens devices. For Android, iOS, and HoloLens devices, integrate with Azure Spatial Anchors to support persistence and sharing of coordinate spaces across sessions and devices. For more information and samples using World Locking Tools with Azure Spatial Anchors, see [World Locking Tools (WLT) combined with Azure Spatial Anchors (ASA)](/mixed-reality/world-locking-tools/documentation/howtos/wlt_asa).

# [ARAnchorManager](#tab/anchorstore)

An API called the `XRAnchorStore` enables anchors to be persisted between sessions. The `XRAnchorStore` is a representation of the saved anchors on a device. You can persist anchors from `ARAnchors` in the Unity scene, load anchors from storage into new `ARAnchors`, or delete anchors from storage.

> [!NOTE]
> You save and load these anchors on the same device. Cross-device anchors are supported through [Azure Spatial Anchors](../../shared-experiences-in-unity.md#azure-spatial-anchors).

### Namespaces

For **Unity 2020 and OpenXR**:

```cs
using Microsoft.MixedReality.ARSubsystems.XRAnchorStore
```

or **Unity 2019/2020 + Windows XR Plugin**:

```cs
using UnityEngine.XR.WindowsMR.XRAnchorStore
```

### Public methods

```cs
{
    // A list of all persisted anchors, which can be loaded.
    public IReadOnlyList<string> PersistedAnchorNames { get; }

    // Clear all persisted anchors
    public void Clear();

    // Load a single persisted anchor by name. The ARAnchorManager will create this new anchor and report it in
    // the ARAnchorManager.anchorsChanged event. The TrackableId returned here is the same TrackableId the
    // ARAnchor will have when it is instantiated.
    public TrackableId LoadAnchor(string name);

    // Attempts to persist an existing ARAnchor with the given TrackableId to the local store. Returns true if
    // the storage is successful, false otherwise.
    public bool TryPersistAnchor(TrackableId id, string name);

    // Removes a single persisted anchor from the anchor store. This will not affect any ARAnchors in the Unity
    // scene, only the anchors in storage.
    public void UnpersistAnchor(string name);
}
```

### Get an anchor store reference

To load the XRAnchorStore with **Unity 2020 and OpenXR**, use extension method on the XRAnchorSubsystem, the subsystem of an ARAnchorManager:

``` cs
public static Task<XRAnchorStore> LoadAnchorStoreAsync(this XRAnchorSubsystem anchorSubsystem)
```

To load the XRAnchorStore with **Unity 2019/2020 and the Windows XR Plugin**, use the extension method on the XRReferencePointSubsystem (Unity 2019) or XRAnchorSubsystem (Unity 2020), the subsystem of an ARReferencePointManager/ARAnchorManager:

```cs
// Unity 2019 + Windows XR Plugin
public static Task<XRAnchorStore> TryGetAnchorStoreAsync(this XRReferencePointSubsystem anchorSubsystem);

// Unity 2020 + Windows XR Plugin
public static Task<XRAnchorStore> TryGetAnchorStoreAsync(this XRAnchorSubsystem anchorSubsystem);
```

### Load an anchor store

To load an anchor store in **Unity 2020 and OpenXR**, access it from an ARAnchorManager's subsystem as follows:

``` cs
ARAnchorManager arAnchorManager = GetComponent<ARAnchorManager>();
XRAnchorStore anchorStore = await arAnchorManager.subsystem.LoadAnchorStoreAsync();
```

or with **Unity 2019/2020 and the Windows XR Plugin**:

``` cs
// Unity 2019
ARReferencePointManager arReferencePointManager = GetComponent<ARReferencePointManager>();
XRAnchorStore anchorStore = await arReferencePointManager.subsystem.TryGetAnchorStoreAsync();

// Unity 2020
ARAnchorManager arAnchorManager = GetComponent<ARAnchorManager>();
XRAnchorStore anchorStore = await arAnchorManager.subsystem.TryGetAnchorStoreAsync();
```

To see a full example of persisting / unpersisting anchors, check out the Anchors -> Anchors Sample GameObject and AnchorsSample.cs script in the [Mixed Reality OpenXR Plugin Sample Scene]((https://github.com/microsoft/OpenXR-Unity-MixedReality-Samples):

![Screenshot of the hierarchy panel open in the Unity Editor with the anchors sample highlighted](../../images/openxr-features-img-04.png)

![Screenshot of the inspector panel open in the Unity Editor with the anchors sample script highlighted](../../images/openxr-features-img-05.png)

# [WorldAnchor](#tab/worldanchor)

For persistence in older Unity versions or WSA projects, use **WorldAnchor**.

**Namespace:** *UnityEngine.XR.WSA.Persistence*<br>
**Class:** *WorldAnchorStore*

The **WorldAnchorStore** creates holographic experiences where holograms stay in specific real world positions across instances of the application. Users can pin individual holograms wherever they want, and find them later in the same spot over app sessions.

For more information and instructions, see [Persistence in older Unity versions](../../persistence-in-unity.md).

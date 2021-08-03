# [MRTK](#tab/mrtk)

# [XR SDK](#tab/xr)

# [Legacy WSA](#tab/wsa)

## Getting started with Unity's built-in spatial mapping components

Unity offers two components for easily adding spatial mapping to your app, **Spatial Mapping Renderer** and **Spatial Mapping Collider**.

### Spatial Mapping Renderer

The Spatial Mapping Renderer allows for visualization of the spatial mapping mesh.

![Spatial Mapping Renderer in Unity](../images/spatialmappingrenderer.png)

### Spatial Mapping Collider

The Spatial Mapping Collider allows for holographic content (or character) interaction, such as physics, with the spatial mapping mesh.

![Spatial Mapping Collider in Unity](../images/spatialmappingcollider.png)

### Using the built-in spatial mapping components

You may add both components to your app if you'd like to both visualize and interact with physical surfaces.

To use these two components in your Unity app:

1. Select a GameObject at the center of the area in which you'd like to detect spatial surface meshes.
2. In the Inspector window, **Add Component** > **XR** > **Spatial Mapping Collider** or **Spatial Mapping Renderer**.

You can find more details on how to use these components at the <a href="https://docs.unity3d.com/2018.4/Documentation/Manual/SpatialMappingComponents.html" target="_blank">Unity documentation site</a>.

### Going beyond the built-in spatial mapping components

These components make it drag-and-drop easy to get started with Spatial Mapping.  When you want to go further, there are two main paths to explore:

* To do your own lower-level mesh processing, see the section below about the low-level Spatial Mapping script API.
* To do higher-level mesh analysis, see the section below about the SpatialUnderstanding library in [MixedRealityToolkit](https://github.com/microsoft/MixedRealityToolkit/tree/master/SpatialUnderstanding).

## Using the low-level Unity spatial mapping API

If you need more control than the Spatial Mapping Renderer and Spatial Mapping Collider components offer, use the low-level Spatial Mapping APIs.

**Namespace:** *UnityEngine.XR.WSA*<br>
**Types**: *SurfaceObserver*, *SurfaceChange*, *SurfaceData*, *SurfaceId*

We've outlined the suggested flow for an application that uses the spatial mapping APIs in the sections below.

### Set up the SurfaceObserver(s)

Instantiate one SurfaceObserver object for each application-defined region of space that you need spatial mapping data for.

```cs
SurfaceObserver surfaceObserver;

private void Start()
{
    surfaceObserver = new SurfaceObserver();
}
```

Specify the region of space that each SurfaceObserver object will provide data for by calling either SetVolumeAsSphere, SetVolumeAsAxisAlignedBox, SetVolumeAsOrientedBox, or SetVolumeAsFrustum. You can redefine the region of space in the future by simply calling one of these methods again.

```cs
private void Start()
{
    surfaceObserver.SetVolumeAsAxisAlignedBox(Vector3.zero, new Vector3(3, 3, 3));
}
```

When you call SurfaceObserver.Update(), you must provide a handler for each spatial surface in the SurfaceObserver's region of space that the spatial mapping system has new information for. The handler receives, for one spatial surface:

```cs
private void OnSurfaceChanged(SurfaceId surfaceId, SurfaceChange changeType, Bounds bounds, System.DateTime updateTime)
{
    // see Handling Surface Changes
}
```

### Handling surface changes

There are several main cases to handle - added and updated, which can use the same code path, and removed.

* In the added and updated cases, we add or get the GameObject representing this mesh from the dictionary, create a SurfaceData struct with the necessary components, then call RequestMeshDataAsync to populate the GameObject with the mesh data and position in the scene.
* In the removed case, we remove the GameObject representing this mesh from the dictionary and destroy it.

```cs
System.Collections.Generic.Dictionary<SurfaceId, GameObject> spatialMeshObjects =
    new System.Collections.Generic.Dictionary<SurfaceId, GameObject>();

private void OnSurfaceChanged(SurfaceId surfaceId, SurfaceChange changeType, Bounds bounds, System.DateTime updateTime)
{
    switch (changeType)
    {
        case SurfaceChange.Added:
        case SurfaceChange.Updated:
            if (!spatialMeshObjects.ContainsKey(surfaceId))
            {
                spatialMeshObjects[surfaceId] = new GameObject("spatial-mapping-" + surfaceId);
                spatialMeshObjects[surfaceId].transform.parent = this.transform;
                spatialMeshObjects[surfaceId].AddComponent<MeshRenderer>();
            }
            GameObject target = spatialMeshObjects[surfaceId];
            SurfaceData sd = new SurfaceData(
                // the surface id returned from the system
                surfaceId,
                // the mesh filter that is populated with the spatial mapping data for this mesh
                target.GetComponent<MeshFilter>() ?? target.AddComponent<MeshFilter>(),
                // the world anchor used to position the spatial mapping mesh in the world
                target.GetComponent<WorldAnchor>() ?? target.AddComponent<WorldAnchor>(),
                // the mesh collider that is populated with collider data for this mesh, if true is passed to bakeMeshes below
                target.GetComponent<MeshCollider>() ?? target.AddComponent<MeshCollider>(),
                // triangles per cubic meter requested for this mesh
                1000,
                // bakeMeshes - if true, the mesh collider is populated, if false, the mesh collider is empty.
                true
            );

            SurfaceObserver.RequestMeshAsync(sd, OnDataReady);
            break;
        case SurfaceChange.Removed:
            var obj = spatialMeshObjects[surfaceId];
            spatialMeshObjects.Remove(surfaceId);
            if (obj != null)
            {
                GameObject.Destroy(obj);
            }
            break;
        default:
            break;
    }
}
```

### Handling data ready

The OnDataReady handler receives a SurfaceData object. The WorldAnchor, MeshFilter, and (optionally) MeshCollider objects it contains reflect the latest state of the associated spatial surface. Optionally, analyze and/or [process](../../../design/spatial-mapping.md#mesh-processing) the mesh data by accessing the Mesh member of the MeshFilter object. Render the spatial surface with the latest mesh and (optionally) use it for physics collisions and raycasts. It's important to confirm that the contents of the SurfaceData aren't null.

### Start processing on updates

SurfaceObserver.Update() should be called on a delay, not every frame.

```cs
void Start ()
{
    StartCoroutine(UpdateLoop());
}

IEnumerator UpdateLoop()
{
    var wait = new WaitForSeconds(2.5f);
    while (true)
    {
        surfaceObserver.Update(OnSurfaceChanged);
        yield return wait;
    }
}
```

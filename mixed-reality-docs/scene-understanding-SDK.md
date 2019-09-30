---
title: Scene understanding SDK
description: Programming guide to the Scene Understanding SDK
author: szymons
ms.author: szymons
ms.date: 07/08/19
ms.topic: article
keywords: Scene Understanding, Spatial Mapping, Windows Mixed Reality, Unity
---

# Scene understanding SDK overview

The goal of Scene understanding is to transform the un-structured environment sensor data that your Mixed Reality device captures and to convert it into a powerful but abstracted representation that is intuitive and easy to develop for. The SDK acts as the communication layer between your application and the Scene Understanding runtime. It's aimed to mimic existing standard constructs such as 3d scene graphs for 3d representations and 2D rectangles/panels for 2d applications. While the constructs Scene Understanding mimics will map to concrete frameworks you may use, in general SceneUnderstanding is framework agnostic allowing for interop between varied frameworks that interact with it. As Scene Understanding evolves the role of the SDK is to ensure new representations and capabilities continue to be exposed within a unified framework. In this document we will first introduce high level concepts that will help you get familiar with the development environment/usage and then provide more detailed documentation for specific classes and constructs.

## Where do I get the SDK?

The SceneUnderstanding SDK is downloadable via NuGet.

[SceneUnderstanding SDK](https://www.nuget.org/packages/Microsoft.MixedReality.SceneUnderstanding/)

Before you begin please note that the SDK runs on top of the UWP, and requires Windows SDK version 18362 or higher. If you are using the SDK in a Unity project, please use [NuGet for Unity](https://github.com/GlitchEnzo/NuGetForUnity) to install the package into your project.

## Conceptual Overview

### The Scene

Your mixed reality device is constantly integrating information about what it sees in your environment. Scene Understanding funnels all of these data sources and produces one single cohesive abstraction. Scene Understanding generates Scenes which are a composition of [SceneObjects](scene-understanding-SDK.md#sceneobjects) that represent an instance of a single thing, (e.g. a wall/ceiling/floor.) Scene Objects themselves are a composition of [SceneComponents](scene-understanding-SDK.md#scenecomponents) which represent more granular pieces that make up this SceneObject. Examples of components are quads and meshes, but in the future could represent bounding boxes, collision mehses, metadata etc...

The process of converting the raw sensor data into a Scene is a potentially expensive operation that could take seconds for medium spaces (~10x10m) to minutes for very large spaces (~50x50m) and therefore it is not something that is being computed by the device without application request. Instead, Scene generation is triggered by your application on demand. The SceneObserver class has static methods that can Compute or Deserialize a scene, which you can then enumerate/interact with. The "Compute" action is executed on-demand and executes on the CPU but in a seperate process (the Mixed Reality Driver). However, while we do compute in another process the resulting Scene data is stored and maintained in your application in the Scene object. 

Below is a diagram that illustrates this process flow and shows examples of two applications interfacing with the Scene Understanding runtime. 

![Process Diagram](images/SU-ProcessFlow.png)

On the left hand side is a diagram of the mixed reality runtime which is always on and running in its own process. This runtime is responsible for performing device tracking, surface reconstruction, and other operations that Scene Understanding uses to understand and reason about the world around you. On the right side of the diagram, we show two theoretical applications that make use of Scene Understanding. The first application interfaces with MRTK which uses the Scene Understanding SDK internally, the second app computes and uses two sepereate scene instances. All 3 Scenes in this diagram generate distinct instances of the scenes, the driver is not tracking global state that is shared between applications and Scene Objects in one scene are not found in another. Scene Understanding does provide a mechanism to track over time, but this is done using the SDK and code the code that performs this tracking is running in the SDK in your app's process.

Because each Scene stores it's data in your application's memory space, you can assume that all function of the Scene object or it's internal data is always executed in your application's process.

### Layout

To work with Scene Understanding it may be valuable to know and understand how the runtime represents components logically and physically. The Scene represents data with a specific layout that was chosen to be simple while maintaining an underlying structure that is pliable to meet future requirements without needing major revisions. The Scene does this by storing all Components (building blocks for all Scene Objects) in a flat list and defining hierarchy and composition through references where specific components reference others.

Below we present an example of a structure in both its flat and logical form.

<table>
<tr><th>Logical Layout</th><th>Physical Layout</th></tr>
<tr>
<td>
<ul>
  Scene
  <ul>
  <li>SceneObject_1
    <ul>
      <li>Mesh_1</li>
      <li>Quad_1</li>
      <li>Quad_2</li>
    </ul>
  </li>
  <li>SceneObject_2
    <ul>
      <li>Quad_1</li>
      <li>Quad_3</li>
      </li></ul>
  </li>
  <li>SceneObject_3
    <ul>
      <li>Mesh_3</li>
    </ul>
  </ul>
</ul>
</td>
<td>
<ul>
  <li>SceneObject_1</li>
  <li>SceneObject_2</li>
  <li>SceneObject_3</li>
  <li>Quad_1</li>
  <li>Quad_2</li>
  <li>Quad_3</li>
  <li>Mesh_1</li>
  <li>Mesh_2</li>
</ul>
</td>
</tr>
</table>

This illustration highlights the difference between the physical and logical layout of the Scene. On the right we see the hierarchical layout of the data that your application sees when enumerating the scene. On the left we see that the scene is actually comprised of 12 distinct components that are accessible individually if necessary. When processing a new scene, we expect applications to walk this hierarchy logically, however when tracking between scene updates, some applications may only be interested in targeting specific components that are shared between two scenes.

## API overview

The following section provides a high-level overview of the constructs in Scene Understanding. Reading this section will give you an  understanding of how scenes are represented, and what the various components do/are used for. The next section will provide concrete code examples and additional details that are glossed over in this overview.

All of the types described below reside in the `Microsoft.MixedReality.SceneUnderstanding` namespace.

### SceneComponents

Now that you understand the logical layout of scenes we can now present the concept of SceneComponents and how they are used to compose hierarchy. SceneComponents are the most granular decompositions in SceneUnderstanding representing a single core thing, e.g. a mesh or a quad or a bounding box. SceneComponents are things that can update independently and can be referenced by other SceneComponents, hence they have a single global property a unique Id, that allow for this type of tracking/referencing mechanism. Ids are used for the logical composition of scene hierarchy as well as object persistence (the act of updating one scene relative to another.) 

If you are treating every newly computed scene as being distinct, and simply enumerating all data within it then Ids are largely transparent to you. However, if you are planning to track components over several updates you will use the Ids to index and find SceneComponents between Scene objects.

### SceneObjects

A SceneObject is a SceneComponent that represents an instance of a "thing" e.g. a wall, a floor, a ceiling, etc... expressed by their Kind property. SceneObjects are geometric, and therefore have functions and properties that represent their location in space, however they don't contain any geometric or logical structure. Instead, SceneObjects reference other SceneComponents, specifically SceneQuads and SceneMeshes which provide the varied representations that are supported by the system. When a new scene is computed, your application will most likely enumerate the Scene's SceneObjects to process what it's interested in.

SceneObjects can have any one of the following:

<table>
<tr>
<th>SceneObjectKind</th> <th>Description</th>
</tr>
<tr><td>Background</td><td>The SceneObject is known to be <b>not</b> one of the other recognized kinds of scene object. This class should not be confused with Unknown where Background is known not to be wall/floor/ceiling etc... while unknown is not yet categorized.</b></td></tr>
<tr><td>Wall</td><td>A physical wall. Walls are assumed to be immovable environmental structures.</td></tr>
<tr><td>Floor</td><td>Floors are any surfaces on which one can walk. Note: stairs are not floors. Also note, that floors assume any walkable surface and therefore there is no explicit assumption of a singular floor. Multi-level structures, ramps etc... should all classify as floor.</td></tr>
<tr><td>Ceiling</td><td>The upper surface of a room.</td></tr>
<tr><td>Platform</td><td>A large flat surface on which you could place holograms. These tend to represent tables, countertops and other large horizontal surfaces.</td></tr>
<tr><td>World</td><td>A reserved label for geometric data that is agnostic to labeling. The mesh generated by setting the EnableWorldMesh update flag would be classified as world.</td></tr>
<tr><td>Unknown</td><td>This scene object has yet to be classified and assigned a kind. This should not be confused with Background, as this object could be anything, the system has just not come up with a strong enough classification for it yet.</td></tr>
</tr>
</table>

### SceneMesh

A SceneMesh is a SceneComponent that approximates the geometry of arbitrary geometric objects using a triangle list. SceneMeshes are used in several different contexts, they can represent components of the watertight cell structure or as the WorldMesh which represents the unbounded Surface Reconstruction associated with the Scene. The index and vertex data provided with each mesh uses the same familiar layout as the [vertex and index buffers](https://msdn.microsoft.com/library/windows/desktop/bb147325%28v=vs.85%29.aspx) that are used for rendering triangle meshes in all modern rendering APIs. Note that in Scene Understanding, meshes use 32-bit indices and may need to be broken up into chunks for certain rendering engines.

### SceneQuad

A SceneQuad is a SceneComponent that represents 2d surfaces that occupy the 3d world. SceneQuads can be used similarly to ARKit ARPlaneAnchor or ARCore Planes but they offer more high level functionality as 2d canvases to be used by flat apps, or augmented UX. 2D specific APIs are provided for quads that make placement and layout simple to use, and developing (with the exception of rendering) with quads should feel more akin to working with 2d canvases than 3d meshes.

## Scene understanding SDK details and reference

The following section will help get you familiar with the basics of SceneUnderstanding. This section should provide you with the basics, at which point you should have enough context to browse through the sample applications to see how SceneUnderstanding is used holistically.

### Initialization

The first step to working with SceneUnderstanding is for your application to gain reference to a Scene object. This can be done in one of two ways, a Scene can either be computed by the driver, or an existing Scene that was computed in the past can be de-serialized. The latter is particularly useful for working with SceneUnderstanding during development, where applications and experiences can be prototyped quickly without a mixed reality device.

Scenes are computed using a SceneObserver. Before creating a Scene, your application should query your device to ensure that it supports SceneUnderstanding, as well as to request user access for information that SceneUnderstanding needs.

```cs
if (SceneObserver.IsSupported())
{
    // Handle the error
}

// This call should grant the access we need.
await SceneObserver.RequestAccessAsync();
```

If RequestAccessAsync() is not called, computing a new Scene will fail. Next we will compute a new scene that's rooted around the Mixed Reality headset and has a 10 meter radius.

```cs
// Create Query settings for the scene update
SceneQuerySettings querySettings;

querySettings.EnableSceneObjectQuads = true;                                       // Requests that the scene updates quads.
querySettings.EnableSceneObjectMeshes = true;                                      // Requests that the scene updates watertight mesh data.
querySettings.EnableOnlyObservedSceneObjects = false;                              // Do not explicitly turn off quad inference.
querySettings.EnableWorldMesh = true;                                              // Requests a static version of the spatial mapping mesh.
querySettings.RequestedMeshLevelOfDetail = SceneMeshLevelOfDetail.Fine;            // Requests the finest LOD of the static spatial mapping mesh.

// Initialize a new Scene
Scene myScene = SceneObserver.Compute(querySettings, 10.0f);
```

### Initialization from Data (aka. the PC Path)

While Scenes can be computed for direct consumption, they can also be computed in serialized form for later use. This has proven to be very useful for development as it allows developers to work in and test Scene Understanding without the need for a device. The act of serializing a scene is nearly identical to computing it, the data is returned to your application instead of being deserialized locally by the SDK. You may then deserialize it yourself or save it for future use.

```cs
// Create Query settings for the scene update
SceneUnderstanding.QuerySettings querySettings;

// Compute a scene but serialized as a byte array
SceneBuffer newSceneBuffer = SceneObserver.ComputeSerialized(querySettings, 10.0f);

// If we want to use it immediately we can de-serialize the scene ourselves
byte[] newSceneData = new byte[newSceneBuffer.Size];
newSceneBuffer.GetData(newSceneData);
Scene mySceneDeSerialized = Scene.Deserialize(newSceneData);

// Save newSceneBlob for later
```

### SceneObject Enumeration

Now that your application has a scene, your application will be looking at and interacting with SceneObjects. This is done by accessing the **SceneObjects** property:

```cs
SceneObject firstFloor = null;

// Find the first floor object
foreach (var sceneObject in myScene.SceneObjects)
{
    if (sceneObject.Kind == SceneObjectKind.Floor)
    {
        firstFloor = sceneObject;
        break;
    }
}
```

### Component update and re-finding components

There is another function that retrieves components in the Scene called ***FindComponent***. This function is useful when updating tracking objects and finding them in subsequent scenes. The following code will compute a new scene relative to a previous scene and then find the floor in the new scene.

```cs
// Compute a new scene, and tell the system that we want to compute relative to the previous scene
Scene myNextScene = SceneObserver.Compute(querySettings, 10.0f, myScene);

// Use the Id for the floor we found last time, and find it again
firstFloor = (SceneObject)myNextScene.FindComponent(firstFloor.Id);

if (firstFloor != null)
{
    // We found it again, we can now update the transforms of all objects we attatched to this floor transform
}
```

## Accessing Meshes and Quads from Scene Objects

Once SceneObjects have been found your application will most likely want to access the data that is contained in the quads/meshes that it is comprised of. This data is accessed with the ***Quads*** and ***Meshes*** properties. The following code will enumerate all quads and meshes of our floor object.

```cs

// Get the transform for the SceneObject
System.Numerics.Matrix4x4 objectToSceneOrigin = firstFloor.GetLocationAsMatrix();

// Enumerate quads
foreach (var quad in firstFloor.Quads)
{
    // Process quads
}

// Enumerate meshes
foreach (var mesh in firstFloor.Meshes)
{
    // Process meshes
}
```

Notice that it is the SceneObject that has the transform that is relative to the Scene origin. This is because the SceneObject represents an instance of a "thing" and is locatable in space, the quads and meshes represent geometry that is transformed relative to their parent. It is possible for separate SceneObjects to reference the same SceneMesh/SceneQuad SceneComponewnts, and it is also possible that a SceneObject has more than one SceneMesh/SceneQuad.

### Dealing with Transforms

Scene Understanding has made a deliberate attempt to align with traditional 3D scene representations when dealing with transforms. Each Scene is therefore confined to a single coordinate system much like most common 3D environmental representations. SceneObjects each provide their location as a position and orientation within that coordinate system. If your application is dealing with Scenes that stretch the limit of what a single origin provides it can anchor SceneObjects to SpatialAnchors, or generate several scenes and merge them together, but for simplicity we assume that watertight scenes exist in their own origin that's localized by one NodeId defined by Scene.OriginSpatialGraphNodeId.

The following Unity code, for example, shows how to use Windows Perception and Unity APIs to align coordinate systems together. See [SpatialCoordinateSystem](https://docs.microsoft.com/en-us/uwp/api/windows.perception.spatial.spatialcoordinatesystem) and [SpatialGraphInteropPreview](https://docs.microsoft.com/en-us/uwp/api/windows.perception.spatial.preview.spatialgraphinteroppreview) for details on the Windows Perception APIs, and [Mixed Reality native objects in Unity](https://docs.microsoft.com/en-us/windows/mixed-reality/unity-xrdevice-advanced) for details on obtaining a SpatialCoordinateSystem that corresponds to Unity's world origin, as well as the `.ToUnity()` extension method for converting between `System.Numerics.Matrix4x4` and `UnityEngine.Matrix4x4`.

```cs
public class SceneRootComponent : MonoBehavior
{
    public SpatialCoordinateSystem worldOrigin;
    public Scene scene;
    SpatialCoordinateSystem sceneOrigin;
    
    void Start()
    {
        // Initialize a SpatialCoordinateSystem for the scene's node in the system's Spatial Graph.
        scene.origin = SpatialGraphInteropPreview.CreateCoordinateSystemForNode(scene.OriginSpatialGraphNodeId);
    }
    
    void Update()
    {
        // Try to get the current transform of the scene's spatial graph node.
        // This may not be available, e.g. when tracking has been lost.
        var sceneToWorld = sceneOrigin.TryGetTransformTo(worldOrigin);
        if (sceneToWorld.HasValue)
        {
            // Convert the transform to Unity numerics and update the game object.
            var sceneToWorldUnity = sceneToWorld.Value.ToUnity();
            this.gameObject.transform.SetPositionAndRotation(sceneToWorldUnity.GetColumn(3), sceneToWorldUnity.rotation);
        }
    }
}
```

Each `SceneObject` has a `Position` and `Orientation` property which can be used to position corresponding content relative to the origin of the containing `Scene`. For example, the followig example assumes that the game is a child of the scene root, and assigns its local position and rotation to align to a given `SceneObject`:

```cs
void SetLocalTransformFromSceneObject(GameObject gameObject, SceneObject sceneObject)
{
    gameObject.transform.localPosition = sceneObject.Position.ToUnity();
    gameObject.transform.localRotation = sceneObject.Orientation.ToUnity());
}
```

### Quad

Quads were designed to facilitate 2D placement scenarios and should be thought of as extensions to 2D canvas UX elements. While Quads are components of SceneObjects and can be rendered in 3D, the Quad APIs themselves assume Quads are 2D structures. They offer information such as extent, shape, and provide APIs for placement.

Quads have rectangular extents, but they represent arbitrarily shaped 2D surfaces. To enable placement on these 2D surfaces that interact with the 3D environment quads offer utilities to make this interaction possible. Currently Scene Understanding provides two such functions, **FindCentermostPlacement** and **GetOcclusionMask**. FindCentermostPlacement is a high level API that locates a position on the quad where an object can be placed and will try to find the best location for your object guaranteeing that the bounding box you provide will reside on the underlying surface.

The following example shows how to find the centermost placeable location and anchor a hologram to the quad.

```cs
// This code assumes you already have a "Root" object that attaches the Scene's Origin.

// Find the first quad
foreach (var sceneObject in myScene.SceneObjects)
{
    // Find a wall
    if (sceneObject.Kind == SceneObjectKind.Wall)
    {
        // Get the quad
        var quads = sceneObject.Quads;
        if (quads.Count > 0)
        {
            // Find a good location for a 1mx1m object  
            System.Numerics.Vector2 location;
            if (quads[0].FindCentermostPlacement(new System.Numerics.Vector2(1.0f, 1.0f), out location))
            {
                // We found one, anchor something to the transform
                // Step 1: Create a new game object for the quad itself as a child of the scene root
                // Step 2: Set the local transform from quads[0].Position and quads[0].Orientation
                // Step 3: Create your hologram and set it as a child of the quad's game object
                // Step 4: Set the hologram's local tranform to a translation (location.x, location.y, 0)
            }
        }
    }
}
```

Steps 1-4 are highly dependent on your particular framework/implementation, but the themes should be similar. It is important to note that the Quad simply represents a bounded 2D plane that is localized in space. By having your engine/framework know where the quad is and rooting your objects relative to the quad, your holograms will be located correctly with repect to the real world. For more detailed information please see our samples on quads which show specific implementations.

### Mesh

Meshes represent geometric representations of objects or environments. Much like [spatial mapping](spatial-mapping.md), mesh index and vertex data provided with each spatial surface mesh uses the same familiar layout as the vertex and index buffers that are used for rendering triangle meshes in all modern rendering APIs. Vertex positions are provided in the coordinate system of the `Scene`. The specific APIs used to reference this data are as follows:

```cs
void GetTriangleIndices(int[] indices);
void GetVertices(System.Numerics.Vector3[] vertices);
```

The following code provides an example of generating a triangle list from the mesh structure:

```cs
uint[] indices = new uint[mesh.TriangleIndexCount];
System.Numerics.Vector3[] positions = new float[mesh.VertexCount];

mesh.GetTriangleIndices(indices);
mesh.GetVertexPositions(positions);
```

The index/vertex buffers must be >= the index/vertex counts, but otherwise can be arbitrarily sized allowing for efficient memory re-use.

## Developing with scene understandings

At this point you should understand the core building blocks of the scene understanding runtime and SDK. The bulk of the power and complexity lies in access patterns, interaction with 3D frameworks, and tools that can be written on top of these APIs to perform more advanced tasks like spatial planning, room analysis, navigation, physics etc. We hope to capture these in samples that should hopefully guide you in the proper direction to make your scenarios shine. If there are samples/scenarios we are not addressing, please let us know and we will try to document/prototype what you need.

## See also

* [Spatial mapping](spatial-mapping.md)
* [Scene understanding](scene-understanding.md)

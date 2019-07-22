---
title: Scene understanding SDK
description: Programming guide to the Scene Understanding SDK
author: szymons
ms.author: szymons
ms.date: 07/08/19
ms.topic: article
keywords: Scene Understanding, Spatial Mapping, Windows Mixed Reality, Unity
---

## Scene Understanding SDK Overview

The ultimate goal of Scene Understanding is to transform the un-structured environment sensor data that your Mixed Reality device captures and to convert it into a powerful but abstracted representation that is intuitive and easy to develop for. The SDK mimics several standard constructs such as 3d scene graphs and 2D windows, but in a framework agnostic way. It's expected that your application can convert sene or object representations into your native toolchain, and therefore should be fairly simple to map Scenes and/or objects to constructs in Unity or Unreal. For 2D applications, Scene Understanding aims to abstract away as much of the spatial/3d data allowing you to fous on ensuring your flat apps/holograms interact efficiently with 2d surfaces and can ignore 3d geometry/occlusion as much as possible. As Scene Understanding evolves the role of the SDK is to ensure new representations and capabilities continue to be exosed within a unified framework. In this document we will first introduce high level concepts that will help you get familiar with the development environment/usage and then provide more detailed documentation for specific classes and constructs.

### The Scene

Your mixed reality device is constantly integrating information about what it sees in your environent. Scene Understanding funnels all of these data sources and produces one single cohesive abstraction. Scene Understanding generates Scenes which are a composition of [SceneObjects](scene-understanding-SDK.md#SceneObjects) that represent an instance of a single thing, (e.g. a wall/ceiling/floor.) Scene Objects themselves are a composition of [Components](scene-understanding-SDK.md#Components) which represent more granular pieces that make up this SceneObject. Examples of components are quads and meshes, but in the future could represent bounding boxes, collision mehses, metadata etc... This kind of representation should be familiar as it is a common way that 3d engines represent environments/environmental objects. Scene Understanding object structures therefore support many of the same properties/capabilities found in existing engines, for example instancing of geometry, shared transforms, hirearchy etc...

The process of converting the raw sensor data into a Scene is a potentially expensive operation that could take seconds for medium spaces (~10x10m) to minutes for very large spaces (~50x50m) and therefore it is not something that is being computed by the device without application request. Instead, Scene generation is triggered by your application on demand. The process of Scene computation occurs when the application requests that a Scene is Computed. The "Compute" action is executed on the CPU in a seperate process, but the resulting data is stored and maintained in the application's process in the returned Scene object. Below is a diagram that shows theoretical data flow for applications interacting with Scene Understanding to help you understand the flow.

![Process Diagram](images/SU-ProcessFlow.png)

On the left hand side is a diagram of the mixed reality runtime, which is always on and running in its own process. This is the process that is performing device tracking, surface reconstruction, and other operations that Scene Understanding uses to understand and reason about the world around you. On the right side of the diagram, we show two theoretical applications that compute new Scenes. The process of computing the Scene is where the SDK communicates with the runtime. All 3 Scenes in this diagram generate distinct instances of the scenes they represent meaning that all objects in these scenes are different, and one cannot directly find an object from one scene in another, even if they scan the same space. However, as will be hilighted later, even though the system cannot maintain references between objects there are mechanisms to update one scene relative to another so that objects persist over space and time.

Each Scene stores it's data in your application's memory space and all subesquent calls to the Scene object are executed in your application's process.

#### Layout

To work with Scene Understanding it may be valuable to know and understand how the runtime represents components logically and physically. The Scene represents data with a specific layout that was chosen to be simple while maintaining an underlying structure that is pliable to meet future requirements without needing major revisions. The Scene does this by storing all Components (building blocks for all Scene Objects) in a flat list and defining hierarchy and composition through references where specific components reference others.

Below we present an example of a structure in both it's flat and logical form.

<table>
<tr><th>Physical Layout</th> <th>Logical Layout</th></tr>
<tr>

<td>
<ul>
  <li>SceneObject_1</li>
  <li>SceneObject_2</li>
  <li>Quad_1</li>
  <li>Quad_2</li>
  <li>Quad_3</li>
  <li>Mesh_1</li>
  <li>Mesh_2</li>
  <li>Transform_1</li>
  <li>Transform_2</li>
  <li>Transform_3</li>
  <li>Transform_4</li>
  <li>SpatialComponent_1</li>
</ul>
</td>

<td>
<ul>
  <li>SceneObject_1
    <ul>
      <li>
      Mesh_1
        <ul>Transform_1</ul>
        <ul>SpatialComponent_1</ul>
      </li>
      <li>
      Quad_1
        <ul>Transform_2</ul>
        <ul>SpatialComponent_1</ul>
      </li>
      <li>
      Quad_2
        <ul>Transform_3</ul>
        <ul>SpatialComponent_1</ul>
      </li>
    </ul>
  </li>
  <li>SceneObject_2
    <ul>
      <li>
      Quad_1
        <ul>Transform_3</ul>
        <ul>SpatialComponent_1</ul>
      </li>
      <li>
      Quad_3
        <ul>Transform_4</ul>
        <ul>SpatialComponent_1</ul>
      </li>
    </ul>
  </li>
</ul>
</td>

</tr>
</table>

This illustration highlights the difference between the physical and logical layout of the Scene. On the left we see that the scene is comprised of 12 distinct components, but on the right we see a hierarchical layout of the data that corresponds to two objects. Applications can walk the Scene Object hierarchy by first finding all Scene Objects, and then drilling down to child components, their transforms etc...

### High Level Overview

The following section provides a high level overview of the constructs in Scene Understanding. Reading this section you should have an understanding of how scenes are represented, and what the various components do/are used for. The next section will provide concrete code examples and additional details that are glossed over in this overview.

#### Components

Now that you have an understanding of the logical layout of scenes in the SceneProcessor it is important to understand Components and how they are used to compose hierarchy. Components represent any generic subset of a scene, and they have a single global property in that they have a unique Id. Ids are used for the logical composition of scene hierarchy as well as object persistence (the act of updating one scene relative to another.) If you are enumerating a scene, Ids are largely transparent to you, however if you are updating a scene relative to another one, you wil use Ids to "re-find" existing objects and determine which properties have changed.

#### SceneObjects

A SceneObject represents an instance of a "thing" e.g. a wall or a floor expressed by their Kind property. Beyond this simple definition SceneObjects are nothing more than compositions of other components that represent the whole. When working with a new scene, most applications will begin by enumerating all SceneObjects. Wether you are trying to represent everything in the environment, or you are trying to find a specific object, you will most likley begin by grabbing all SceneObjects and performing operations on them.

SceneObjects can have any one of the following SceneObjectKind's:

<table>
<tr>
<th>SceneObjectKind</th> <th>Description</th>
</tr>
<tr><td>Background</td><td>The SceneObject is known to be <b>not</b> one of the other recognized kinds of scene object. This class should not be confused with Unknown where Background is known not to be wall/floor/ceiling etc... while uknown is not yet categorized.</b></td></tr>
<tr><td>Wall</td><td>A physical wall. Walls are assumed to be immovable environmental structures.</td></tr>
<tr><td>Floor</td><td>Floors are any surfaces on which one can walk. Note stairs are not floors as stairs are steppable surfaces. Also note, that floors assume any walkable surface and therefore there is no explicit assumption of a singular floor. Multi-level structures, ramps etc... should all classify as floor.</td></tr>
<tr><td>Ceiling</td><td>The upper surface of a room.</td></tr>
<tr><td>Platform</td><td>A large flat surface on which you could place holograms. These tend to represent tables, countertops and other large horizontal surfaces.</td></tr>
<tr><td>World</td><td>A reserved label for geometric data that is agnostic to labeling. The mesh generated by setting the EnableWorldMesh update flag would be classified as world.</td></tr>
<tr><td>Unknown</td><td>This scene object has yet to be classified and assigned a kind. This should not be confused with Background, as this object could be anything, the system has just not come up with a strong enough classification for it yet.</td></tr>
</tr>
</table>

#### SpatialComponent

Any component that represents 3d geometry that could be rendered relative to the scene Origin will derive from the SpatialComponent class. SpatialComponents define a local transform from the scene orign.

#### Mesh

Meshes represent arbitrary geometric objects by approximating them using a list of triangles. They are used to represent a variety of SceneObject types, for example both the watertight mesh as well as surface reconstruction use mesh components to represent their geometries. The index and vertex data provided with each mesh uses the same familiar layout as the [vertex and index buffers](https://msdn.microsoft.com/library/windows/desktop/bb147325%28v=vs.85%29.aspx) that are used for rendering triangle meshes in all modern rendering APIs. Note that in Scene Understanding, meshes use 32-bit indices and may need to be broken up into chunks for certain rendering engines.

#### Quad

Quads are SceneUnderstanding's construct to represent 2d surfaces that occupy the 3d world. Quads can be used similarly to ARKit ARPlaneAnchor or ARCore Planes but they offer more high level functionality as 2d canvases to be used by flat apps, or augmented UX. 2D specific APIs are provided for quads that make placement and layout simple to use, and developing (with the exception of rendering) with quads should feel more akin to working with 2d canvases than 3d meshes.

### Scene Understanding SDK Details And Reference

#### SDK

To access complete documentation for the latest version of the Scene Understanding SDK, please visit the official SDK documentation which can be found [here](..\DocProject\help\index.html)

#### Initialization

The following code sample demonstrates computing a Scene within a 10 meter radius of the device.

```cs
// Create Query settings for the scene update
SceneUnderstanding.QuerySettings querySettings;

querySettings.EnableSceneObjectQuads = true;                // Requests that the scene updates quads.
querySettings.EnableSceneObjectMeshes = true;               // Requests that the scene updates watertight mesh data.
querySettings.EnableOnlyObservedSceneObjects = false;       // Do not explicitly turn off quad inference.
querySettings.EnablePersistentSceneObjects = true;          // The scene update call attempts to track objects from the previous update.
querySettings.EnableWorldMesh = true;                       // Requests a static version of the spatial mapping mesh.
querySettings.RequestedMeshLOD = MeshLOD.Fine;              // Requests the finest LOD of the static spatial mapping mesh.

// Initialize a new Scene
Scene myScene = Scene.Compute(querySettings, 10.0f);
```

#### Initialization from Data (aka. the PC Path)

Scenes may be computed and serialized instead of being returned directly. This has proven to be very useful for development as it allows developers to work in and test Scene Understanding without the need for a device. Serializing a scene still require it to be computed, but instead of generating a scene object a binary blob is returned that can be deserialized at any time. 

```cs
// Create Query settings for the scene update
SceneUnderstanding.QuerySettings querySettings;

// Initialize a new Scene
byte newSceneBlob = Scene.ComputeSerialized(querySettings, 10.0f);

// We want to use it right away and save it to disk
Scene mySceneDeSerialized = Scene.Deserialize(newSceneBlob);

// Save newSceneBlob for later
```

#### SceneObject Enumeration

Now that we have a scene, your application will be looking at and interacting with SceneObjects. This is done by accessing the **SceneObjects** property:

```cs
SceneObject firstFloor = nullptr;

// Find the first floor object
foreach (var sceneObject in myScene.SceneObjects)
{
    if (sceneObject.Kind == SceneObjectKind.Floor)
    {
        firstFloor = sceneObject;
    }
}
```

#### Component update and re-finding components

There is another function that retrives components in the Scene called ***FindComponent***. This function is useful when updating tracking objects and finding them in subesquent scenes. We will now compute a new scene, try and track all the objects given the previous scene and see if we can find the floor again.

```cs
// Compute a new scene
Scene myNextScene = Scene.Compute(querySettings, 10.0f);

// Update it given the previous state, this will ensure we re-use Ids when possible
myNextScene.UpdateFromPrevious(myScene);

// Use the Id for the floor we found last time, and find it again
firstFloor = (SceneObject)myNextScene.FindComponent(firstFloor.Id)

if (firstFloor != nullptr)
{
    // We found it again, we can now update the transforms of all objects we attatched to this floor transform
}
```

### Accessing Meshes and Quads from Scene Objects

As mentioned before, SceneObjects are just compositions of components. The real data is in the quads/meshes that they are comprised of. This data is accessed with the ***Quads*** and ***Meshes*** properties. The following code will enumerate all quads and meshes of our floor object.

```cs
foreach (var quad in firstFloor.Quads)
{
    // Process quads
}

foreach (var mesh in firstFloor.Meshes)
{
    // Process meshes
}
```

### SpatialComponent

Scene Understanding has made a deliberate attempt to simplify 3D transforms and spatial anchors. Each Scene is therefore confined to a single coordinate system much like most common 3D environmental representations. Naturally the Mixed Reality team crearted Anchors to solve for numerical instability and tracking error, and they can still be used, though it would be up to the developer to break up the scene and attatch objects to specific anchors manually. However, we believe that for many scenarios the advantages of having a singe coordinate system greatly outweight the percieved degredation in quality. 

**Note** The Scene Understanding team is working on technologies to automatically adjust/align the scene rigidly as the user moves through the space. The goal of this effort is to keep developers in a single rigid coordinate system. As long as scenarios do not require full precision far away from the user's current location this model should be both robust and attractive from the application standpoint due to its simplicity. You should expect to see various samples that explore the various options/solutions to the single coordinate/larger space problem.

The following unity code, for example, shows how to use windows perception and Unity APIs to align coordinate systems together:

**** TODO: UPDATE THIS ****

```cs
    public System.Numerics.Matrix4x4? GetSceneObjectToUnityTransform(
        SceneUnderstanding.SpatialCoordinateSystem sceneObjectSpatialCoordinateSystem, 
        SceneUnderstanding.Transform sceneObjectToSpatialCoordinateSystemTransform)
    {
        // The output
        System.Numerics.Matrix4x4? sceneObjectToUnityTransform;

        // The coordinate ID referenced by the SpatialComponent
        Guid spatialCoordinateGuid = sceneObjectSpatialCoordinateSystem.SpatialCoordinateGuid;

        // Get the spatial coordinate from the Windows.Perception API
        SpatialCoordinateSystem spatialCoordinateSystem = Windows.Perception.Spatial.Preview.SpatialGraphInteropPreview.CreateCoordinateSystemForNode(spatialCoordinateGuid);

        // Get the unity spatial coordinate system
        SpatialCoordinateSystem unitySpatialCoordinateSystem = (SpatialCoordinateSystem)System.Runtime.InteropServices.Marshal.GetObjectForIUnknown(UnityEngine.XR.WSA.WorldManager.GetNativeISpatialCoordinateSystemPtr());

        // Then, we need to get the transform between the two coordinate systems.
        System.Numerics.Matrix4x4? scsToUnity = spatialCoordinateSystem.TryGetTransformTo(cachedUnitySpatialCoordinateSystem);

        // If transform between the two coordinate systems is null, we are pretty much done.
        if (scsToUnity == null)
        {
            return null;
        }

        // This is the sceneObjectToUnity transform. 
        sceneObjectToUnityTransform = sceneObjectToSpatialCoordinateSystemTransform.TransformationMatrix * scsToUnity.Value;
        sceneObjectToUnityTransform = TransformUtils.ConvertRightHandedMatrix4x4ToLeftHanded(sceneObjectToUnityTransform.Value);

        return sceneObjectToUnityTransform;
    }

    // Converts from Right handed to left handed coordinates
    public System.Numerics.Matrix4x4 ConvertRightHandedMatrix4x4ToLeftHanded(System.Numerics.Matrix4x4 transformationMatrix)
    {
        transformationMatrix.M13 = -transformationMatrix.M13;
        transformationMatrix.M23 = -transformationMatrix.M23;
        transformationMatrix.M43 = -transformationMatrix.M43;

        transformationMatrix.M31 = -transformationMatrix.M31;
        transformationMatrix.M32 = -transformationMatrix.M32;
        transformationMatrix.M34 = -transformationMatrix.M34;

        return transformationMatrix;
    }

    // A utility that sets the unity transform given a SceneUnderstanding transform
    public static void SetUnityTransformFromMatrix4x4(System.Numerics.Matrix4x4 transformationMatrix, Transform unityTransform)
    {
        Vector3 t;
        Quaternion r;
        Vector3 s;

        System.Numerics.Matrix4x4.Decompose(transformationMatrix, out s, out r, out t);

        // NOTE: Scale is ignored.
        unityTransform.SetPositionAndRotation(new Vector3(t.X, t.Y, t.Z), Quaternion(r.X, r.Y, r.Z, r.W));
    }
```

And the following uses these utilities to transform a unity game object to the correct location.

```cs
    System.Numerics.Matrix4x4? sceneObjectToUnity = TransformUtils.GetSceneObjectToUnityTransform(quad.SpatialCoordinateSystem, quad.Transform, runOnPC);

    if (sceneObjectToUnity == null)
    {
        continue;
    }

    GameObject quadGO = new GameObject();
    quadGO.transform.parent = parentGO.transform;
    quadGO.name = "Quad";

    // Set the transform.
    TransformUtils.SetUnityTransformFromMatrix4x4(sceneObjectToUnity.Value, quadGO.transform);
```

**Note: These code snippets come from the Scene Understanding Unity Sample which is a great starting point for learning about how to move between SceneUnderstanding and Unity constructs.** 

### Quad

Quads were designed to facilitate 2D placement scenarios and should be thought of as extensions to 2D canvas UX elements. With the exceptionof 3D transforms from their SpatialComponent base class, the Quad APIs are all in the 2D domain of the quad itself. They offer information such as extent, shape, and provide APIs for placement.

Quads have rectangular extents but they represent arbitrarily shaped 2d surfaces. To enable placement on these 2D surfaces that interact with the 3D environment quads offer utilities to make this interaction possible. Currently Scene Understanding provides two such functions, **FindCentermostPlacement** and **GetOcclusionMask**. FindCentermostPlacement is a high level API that locates a position on the quad where an object can be placed and will try to find the best location for your object guaranteeing that the bounding box you provide will reside on the underlying surface.

The following example shows how to find the centermost placable location and anchor a hologram to the quad.

```cs
// This code assumes you already have a "Root" object that attatches the the Scene's Origin.

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
            Vector2 location;
            if (quads[0].FindCentermostPlacement(new Vector2(1.0f, 1.0f), out location))
            {
                // We found one, anchor something to the transform
                // Step 1: Create a new node QuadTransformNode as a child of Root, and set the transform from quad[0].Transform
                // Step 2: Create your hologram and set it as a child of QuadTransformNode
                // Step 3: Set the QuadTransformNode tranform to a translation (location.x, location.y, 0)
            }
        }
    }
}
```

Steps 1-3 are highly dependent on your particular framework/implementation but the themes should be similar. In this case the "Quad" is not actually rendered, is just represents a bounded 2D plane in space which is defined by "QuadTransformNode". Your hologram is now being placed relative to the quad, so you make it a child of that transform and translate to put it in the right place. For more detailed information please see our samples on quads which show specific implementations.

### Mesh

Meshes represent geometric representations of objects or environments. Much like [spatial mapping](spatial-mapping.md), mesh index and vertex data provided with each spatial surface mesh uses the same familiar layout as the vertex and index buffers that are used for rendering triangle meshes in all modern rendering APIs. The specific APIs used to reference this data are as follows:

```cs
void GetTriangleIndices(int[] indices);
void GetVertices(float[] vertices);
```

**Note: GetVertices returns a list of vertices where every 3-tuple of floating point values represents a single coordinate in cartesian x,y and z space.

The following code provides an example of generating a triangle list from the mesh structure:

```cs
 uint[] indices = new uint[mesh.TriangleIndexCount];
 System.Numerics.Vector3[] positions = new System.Numerics.Vector3[mesh.VertexCount];

mesh.GetTriangleIndices(indices);
mesh.GetVertexPositions(positions);
```

The index/vertex buffers must be >= the index/vertex counts, but otherwise can be arbitrarily sized allowing for efficient memory re-use.

### Developing with Scene Understandings

At this point you should understand the core building blocks of the Scene Understanding runtime and SDK. The bulk of the power and complexity lies in access paterns, interaction with 3d frameworks, and tools that can be written on top of these APIs to perform more advanced tasks like spatail planning, room analysis, navigation, physics etc... We hope to capture these in samples that should hopefully guide you in the proper direction to make your scenarios shine. If there are samples/scenarios we are not addressing please let us know and we will try to document/prototype what you need.

## See also

* [spatial mapping](spatial-mapping.md)

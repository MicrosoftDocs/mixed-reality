---
title: Scene understanding
description: Introduction to scene understanding capabilities for HoloLens
author: szymons
ms.author: szymons
ms.date: 02/06/19
ms.topic: article
keywords: Scene Understanding, Spatial Mapping, Windows Mixed Reality, Unity
---

# Scene understanding

Scene Understanding is the next generation of real-world surface representation in Mixed Reality. The role of Scene Understanding is to bridge the gap between the highly detailed but unstructured representation of [spatial mapping](spatial-mapping.md) and traditional representations of 3d environments that developers use for immersive headsets. [Spatial mapping](spatial-mapping.md) continues to focus on producing the most accurate real time model of the environment, Scene Understanding focuses on applications that want to understand the structure of the environment and interact with it at a high level.

## Device support

<table>
<tr>
<th>Feature</th><th style="width:150px"> <a href="hololens-hardware-details.md">HoloLens</a></th><th style="width:150px"> <a href="immersive-headset-hardware-details.md">Immersive headsets</a></th>
</tr><tr>
<td> Scene Understanding</td><td style="text-align: center;"> ✔️</td><td style="text-align: center;"></td>
</tr>
</table>

## How are environments represented in Scene Understanding?

### What is a Scene

Scene Understanding structures the environment into a scene, which is a container of objects which we call components that represent the environment at a specific time, within a specified region of space. Currently scenes are always rooted around the head of the HoloLens. The scene can be updated by the application and any components that remain visible within the specified bounding region persist, meaning they can still be referenced and have only updated their state.

### The Scene Understanding Update Model

Updating Scenes is an application-initiated process. Scene Understanding updates are configurable to tradeoff runtime performance with capability and quality. Applications can choose between detecting planar components called Quads at semi-interactive rates, to pre-scan scenarios where the runtime produces complete scenes, and uses intelligent inference capabilities to complete unseen areas of the environment completely. Scenes are owned by a SceneProcessor object that acts as a scene context, therefore applications are not currently capable of sharing scenes between each other.

### The Frozen Scene and its relationship to Spatial Coordinate Systems

Developing interactive applications that interact with environments on HoloLens requires developers to navigate the complexities of non-rigid geometry attatched to multiple [spatial anchors](spatial-anchors.md). Scene Understanding abstracts the complexity of having multiple coordinate systems by assuming that the subset of the environment exists in a single frozen coordinate system. Transforms in this space are handled by SpatialComponents which merge spatial anchors and transforms to localize objects. Utilities are provided to abstract transforms as much as possible to mimic standard fixed coordinate systems where possible.

### API toolkits and scalability

Scene Understanding has been developed to improve over time, with a long-term vision towards 1-1 parity with immersive headset development models. Because of these goals the API has been modeled to support growth and scalability. Specifically, the layout and structure of Components how they are organized and accessed is with this capability in mind. Therefore, the Scene Understanding API set is divided into high level toolkits that simplify common tasks, and lower level APIs that give your applications access to the underlying structure. It is recommended that you look through samples and toolkits first to see if your task is already implemented.

## Scene Understanding in Unity through MRTK

The fastest way to get started with Scene Understanding is through MRTK which include scripts that convert the internal representation of the SceneProcessor to a collection of unity GameObjects rooted in the Unity Scene. The unity samples make use of the [SceneUnderstandingManager.cs] script. Because Scene Understanding is closely modeled around existing development frameworks, there is a logical 1-1 mapping between Component and [UnityEngine.Object](https://docs.unity3d.com/ScriptReference/Object.html). The role of [SceneUnderstandingManager.cs] is to enumerate the SceneProcessor, create equivalent objects in Unity, and perform this association. The script then organizes the unity objects into a hierarchy of [UnityEngine.GameObject](https://docs.unity3d.com/ScriptReference/GameObject.html) rooted on a [UnityEngine.GameObject](https://docs.unity3d.com/ScriptReference/GameObject.html) provided by the application. The script will also properly handle update calls by updating the scene to reflect state.

Since the [SceneUnderstandingManager.cs] acts like a bridge between Scene Understanding and Unity, all future interaction (collision, physics, enumeration etc…) can be performed through the Unity engine.

## Developing with the Scene Understanding APIs

While we expect most applications to access Scene Understanding indirectly through MRTK scripts applications may want to modify or bypass these scripts to add more specific functionality. The following section breaks down the specifics of the Scene Understanding API, first reviewing the data structure and organization of Scenes, and diving deeper into the API itself and common patterns.

### Scene Understanding Overview

Before exploring the Scene Understanding API surface it is important to understand how and why the API is organized in the way that it is. As mentioned in the high-level overview, representing Environments requires a highly flexible API that must be simple, expressive and highly flexible. The following section will introduce you to the structure of the API but is not intended as a reference. The following sections will demonstrate how the concepts presented here are executed in code.

#### Components

The Api is structured around an environment context held by a SceneProcessor which houses all the raw Components that make up an environment and allows enumeration of Components in either a sequential or structured way. Components are objects whose methods and properties are solely self-contained. This means that any function or property that relies on other Components or on state of any kind, are defined externally. For example, Quads which represent a planar 2D surface have self-contained properties of width and height, but a query about which area of a quad is known to be un-obstructed by other objects (which we call invalidation) is a property of the Quad and other Components and is therefore a separate API found in the Quad toolkit.

#### Entities

While there are many types of Components which are described in more detail in future sections, Enties are very special and having basic understanding of Enties is beneficial. An entity describes the concept of an “Object” or “Thing” for example, a Chair, A wall, etc… It is has strong correlation to a Scene Graph Node and can be considered the root of a sub-hierarchy that composes a single concept. HoloLens uses artificial intelligence to classify Entites by label. Currently the HoloLens is pre-disposed to distinguishing architectural objects used to understand environment structure. It is expected that the capabilities will improve and evolved over time.
Currently the HoloLens supports the following Entity labels:

<table>
<tr>
<th>EntityLabel</th> <th>Description</th>
</tr>
<tr><td>Unrecognized</td><td>The entity is of an unrecognized type and should be any object <b>other than the other recognizable types.</b></td></tr>
<tr><td>Wall</td><td>A physical wall. Walls are assumed to be immovable structures.</td></tr>
<tr><td>Floor</td><td>A floor surface. Floors are any surfaces on which one can walk. There is no explicit assumption of a singular floor, any walkable surface should be identified as a floor.</td></tr>
<tr><td>Ceiling</td><td>The upper surface of a room.</td></tr>
<tr><td>Table</td><td>A flat surface on which a person could work. This does not include small surfaces like side tables.</td></tr>
<tr><td>Chair</td><td>A surface that belongs to a chair. This can include chair seats as well as backs. Currently the system is not capable of grouping or categorizing the specific functionality of every chair plane and assumptions need to made via heuristics (e.g. horizontal chair planes are seats.)</td></tr>
<tr><td>Window</td><td>A surface that contains a pane of glass separating one room from another, or the outside with the inside.</td></tr>
<tr><td>Door</td><td>A physical doorway that connects two rooms or spaces.</td></tr>
<tr><td>Monitor</td><td>A digital display, this can be a laptop display, computer monitor or a television.</td></tr>
<tr><td>World</td><td>Defines a subset of the environment itself. This label suggests that the entity describes geometry but is not decomposed by class. It is also possible that this entity can contain data <b>that could be classified by other labels.</b> For example this could be a mesh that has doors and walls and tables etc….</td></tr>
<tr><td>N/A</td><td>This entity resolves to an enum that is not understood by the API, and the API may not be equipped to support it. Unlike “Unrecognized” which is an entity that is found, generated but of an unrecognized type, this entity was most likely generated by an incompatible runtime and may not properly understood.</td></tr>
</tr>
</table>

<b>Note: While Scene Understanding aspires to correctly classify all entities like all computer vision systems it will make mistakes and not all classes are equally robust. When developing for Scene Understanding you should account for human disambiguation or robustness to classification error.</b>

#### Toolkits

Toolkits are logical groupings of APIs that act on a scene. Currently the only toolkit to exist is related to expose placement and invalidation APIs for Quads but as the capabilities of Scene Understanding expands and as common use cases appear, we expect this concept to grow.

#### Layout

To work with Scene Understanding it may be valuable to know and understand how Components are laid out in the SceneProcessor. It is common for 3d environments to be represented in a structured way following a specific hierarchy. While the goal of Scene Understanding is to produce structured representations of environments, the underlying structure must remain pliable to ensure it can support future requirements. Because of this, the physical layout for all Components within the SceneProcessor is a flat easily indexable list. Hierarch and association is achieved through references, for example a chair Entity could reference one Mesh and two Quads, both of which need to reference a Transform.

The following example illustrates the difference between the physical and logical layout of a scene with two Entities:

<table>
<tr><th>Physical Layout</th> <th>Logical Layout</th></tr>
<tr>

<td>
<ul>
  <li>Entity_1</li>
  <li>Entity_2</li>
  <li>Quad_1</li>
  <li>Quad_2</li>
  <li>Quad_3</li>
  <li>Mesh_1</li>
  <li>Mesh_2</li>
  <li>Transform_1</li>
  <li>Transform_2</li>
  <li>Transform_3</li>
  <li>Transform_4</li>
</ul>
</td>

<td>
<ul>
  <li>Entity_1
    <ul>
      <li>
      Mesh_1
        <ul>
        Transform_1
        </ul>
      </li>
      <li>
      Quad_1
        <ul>
        Transform_2
        </ul>
      </li>
      <li>
      Quad_2
        <ul>
        Transform_3
        </ul>
      </li>
    </ul>
  </li>
  <li>Entity_2
    <ul>
      <li>
      Quad_1
        <ul>
        Transform_3
        </ul>
      </li>
      <li>
      Quad_3
        <ul>
        Transform_4
        </ul>
      </li>
    </ul>
  </li>
</ul>
</td>

</tr>
</table>

This contrived illustration highlights the difference between the physical and logical layout of the scene. Of particular, it is important to note that Components can be referenced multiple times, and components may exist that are never referenced by an Entitiy.

Components are accessed via the SceneProcessor directly because it holds the physical list of objects, but the hierarchy is rooted by an entity. Therefore, the most common pattern for scene building and interpretation is the enumeration of all Entities, followed by direct access for all of their references. While the example above identifies Components via subscripts, reference is implemented by the Id class. The Id is treated as a reference to an object allowing retrieval from the SceneProcessor even spanning updates.

## Scene Understanding API reference

This section will take the concepts introduced in previous sections and show how they are executed in code. The code samples are explicitly brief and illustrate basic usage patterns and explain specific subsets of the API. For a more holistic view of the API we encourage developers to browse the [samples].

### Scene Processor

The SceneProcessor represents the context for the scene and is the first object you will want to construct. Through the SceneProcessor you will enumerate, access and update your scene.

<b>Note: While it is possible to instantiate multiple instances of the SceneProcessor but they will represent separate contexts with no shared Components between them.</b>

#### Initialization

The following code sample demonstrates initializing a SceneProcessor and updating with all scene data found within a 10 meter radius it.

```cs
// Initialize a new instance of the scene processor
SceneUnderstanding.SceneProcessor processor = new SceneProcessor();

// Initialize a bounding sphere of 10m to query against
SceneUnderstanding.SphereBounds bounds = new SphereBounds(10.0f);

// Update environment state.
processor.Update(bounds);
```

The act of updating the processor fills the environment processor with the current state of the environment. The act of “Updating” causes the API to query the HoloLens for its latest understanding of your environment. Depending on how big a radius you specify and what additional parameters you ask for (specifying no parameters returns everything) this may be a blocking operation. The Scene Understanding APIs do not provide Async methods, and we encourage calling this method in an Async manner if your application does not intend to block.

Once Update has completed, the SceneProcessor will have updated itself with all information about the environment that was asked for. This information resides in your application’s memory space and is accessible either via the processor or via toolkits which implicitly access the data through the SceneProcessor as well.

#### Initialization from Data (aka. the PC Path)

The SceneProcessor has a mechanism to bypass the HoloLens driver for Scene updates and can instead access data directly from a data buffer. This affords application developers to serialize state and prototype experiences for scenes that are not directly seen by the device, or potentially in development environments that do not have a HoloLens device. The SceneProcessor is not told or aware that the data source belongs to a Mixed Reality device or was de-serialized from disk, so the development experience is identical in both cases except for code that deals with https://docs.microsoft.com/en-us/windows/mixed-reality/spatial-anchors. It is not guaranteed that a serialized Spatial Anchor ID will persist, and any code that converts spatial anchors to local transforms needs to handle this case failing if dealing with serialized data.

The Scene Understanding runtime component that parses this buffer resides inside your own application, so while the operating system is secured from reading unknown data, however your application needs to handle exceptions.

Sample scenes are provided in MRTK <link>here</link> but can also be serialized and de-serialized manually using the UpdateAndGetData function.

```cs
// Update environment and save state for all components
var scene = processor.UpdateAndGetData(0xFFFFFFFF, bounds);

// De-serialize the state
Processor.UpdateFromData(scene)
```

It is highly encouraged to use of these APIs for prototyping, development and testing.

#### Component Enumeration

Once the environment processor is updated the application can start to enumerate components and perform environment understanding tasks. The simplest way to access all components is through the GetAllComponents method.

```cs
// Query for all components in the scene
Component[] components;
processor.GetAllComponents(out components);
 
Many applications will begin by enumerating over entities, for example we provide code that finds all Wall entities:
List<Id> wallIds;
foreach (var component in components)
{
    if (component is Entity)
    {
        var entity = (Entity)component;
        if (entity.Label == EntityLabel.Wall)
        {
            walls.push_back(entity.InstanceID);
        }
    }
}
```

Since all Components are referenceable via IDs handling updates is performed via direct access using the GetComponent function. The following code would update the scene and re-query all the walls.

```cs
// Update the scene processor to query the latest state
processor.Update(bounds);
foreach (var wallId in wallIds)
{
    var wallEntity = (Entity)processor.GetComponent(wallId);
    // Update the application state with the new data
}
```

### Component

This section describes the Component class in detail and explores the various components that derive from it. Component is the base class for everything in the SceneProcessor and is responsible for one thing, being indexable by ID. The Component base class has a single property:

```cs
SceneUnderstanding::Id InstanceID { get; }
```

which returns an Id that can be used to reference it.

### Entity

An Entity is a component that represents a single logical “thing.” For example, a chair, a table, a wall, etc… The structure of an Entity is fairly simple, it comprises of an EntityLabel and a list of references to other Components. It is this composition that gives the Entity it’s description. For example, a chair Entity could be represented by a Mesh, two Quads (seat and back) and a bounding box. The initial version of Scene Understanding is limited and such groups do not occur, but as the HoloLens runtimes improve you can expect these Entities to be richer and richer.

The following code will enumerate the wall Entity and find all of it’s Quads:

```cs
foreach (var wallId in wallIds)
{
    var wallEntity = (Entity)processor.GetComponent(wallId);
    foreach (var childID in wallEntity.GetAllAssociatedComponentIds())
    {
        var component = processor.GetComponent(entityChildID);   
        if (component is Quad)
        {
            var wallQuad = (Quad)component;
            // Quad logic goes here
        }
    }
}
```

### SpatialComponent

SpatialComponents represent any Component that represents geometry and must have some way of localizing to the coordinate systems understood by your mixed reality device. SpatialComponents are modeled after common geometric transform paradigms used for developing 3d applications for immersive headsets. In these cases, 3d objects share a single origin (most likely the Identity matrix), and each object has a local transformation from that matrix to describe it’s position. In HoloLens coordinate systems are more complex but the ideas remain the same, where the SpatialComponent references an explicit origin (SpatialCoordinateSystem) and a local Transform. The SpatialCoordinateSystem may be shared between many/all SpatialComponents serving as a common origin for more than one SpatialComponent.
The following unity code, for example, shows how these are used to compute a single rigid transform for rendering:

<TODO: Insert Unity Spatial Anchor Code Here>

### Quad

Quads represent planar 2D surfaces that are found in environments. Quads are intended to be used as 2D structures, they are modeled after 2D panel classes in UX frameworks and are the ideal surface for 2D interactions in the 3D world. Slate/hologram placement, room segmentation, floor plan generation are all ideal use cases for Quads. Quads inherit from the SpatialComponent class meaning they represent an object in 3D space.

The quad contains information to deduce the shape and position of the 2D planar region of the surface. There are many scenarios around holographic rendering and placement of quads that require understanding the quad and the environment around it, for example understanding extents and occlusion, to automatic placement of holograms. These APIs can be found in the Quad toolkit described in the toolkits section.

### Mesh

Meshes represent geometric representations of objects or environments. Much like [spatial mapping](spatial-mapping.md), mesh index and vertex data provided with each spatial surface mesh uses the same familiar layout as the vertex and index buffers that are used for rendering triangle meshes in all modern rendering APIs. The specific APIs used to reference this data are as follows:

```cs
void GetTriangleIndices(int[] indices);
void GetVertices(float[] vertices);
```

<b>Note: GetVertices returns a list of vertices where every 3-tuple of floating point values represents a single coordinate in cartesian x,y and z space. The API returns a flattened array to reduce expensive vertex conversion calls allowing for fast data copies to vertex buffers or other vertex formats. </b>

The following code provides an example of generating a triangle list from the mesh structure:

```cs
int[] origMeshIndices = mesh.Mesh.GetTriangleIndices();
var origMeshVertices = mesh.Mesh.GetVertexPositions();

List<Vector3> vertices = new List<Vector3>(origMeshVertices.Length);
for (int i = 0; i < origMeshVertices.Length; i++)
{
  vertices.Add(new Vector3(origMeshVertices[i].X, origMeshVertices[i].Y, -origMeshVertices[i].Z));
}
```

Mesh inherits from the SpatialComponent class meaning they represent an object in 3D space.

## Toolkits

Use cases for Scene Understanding are varied. For example, Quads can be used for 2D holographic placement just as easily as for simple room analysis. Providing helper methods for all manner of scenarios is over-convoluted, so instead Scene Understanding provides the concept of Toolkit APIs. A toolkit is a collection of APIs related to a common use case or scenario, and toolkits work with the SceneProcessor to abstract various common scenarios.

Because toolkits require the understanding of a Scene toolkits are always instantiated with reference to a SceneProcessor. Because toolkits require knowledge of specific Components of a scene, they dictate to SceneProcessor what data they require. It would be impossible for a toolkit that deals with meshes to interact with a scene that only produces quads, for example. Therefore, each toolkit provides a function:

```cs
UInt64 RequiredTypes{ get; };
```

Which specifies which settings are required for a SceneProcessor update otherwise it is not guaranteed to work. For example, this is how you would update the environment in order to satisfy a set of toolkits:

```cs
SceneUnderstanding.SceneProcessor processor = new SceneProcessor();
SceneUnderstanding.SphereBounds bounds = new SphereBounds(10.0f);

QuadToolkit quadToolkit = new QuadToolkit(processor);

processor.Update(quadToolkit.RequiredTypes, bounds);
```

Using RequiredTypes ensures that the update will serve all the toolkits that you are using, and ensures that no un-necessary data is computed.

### Quad Toolkit

The Quad Toolkit provides a set of APIs that treat quads as 2D slates. The APIs primarily deal with placement and rendering of quads. The Toolkit APIs are as follows:

```cs
void GetOcclusionMask(Quad quad, Int16 maskWidth, Int16 maskHeight, out UInt8[] mask);
```

Quads are 2D rectangular structures, but they represent 3D surfaces that are irregularly shaped. This API allows applications to better understand the surface and which parts of the surface are observed and inferred. The API rasterizes a buffer at the precision that the application desires.

<TODO: Picture>

Quad occlusion can be categorized into 3 categories, meaning that each element in the occlusion mask can be one of the following:

<table>
<tr>
<th>Value</th> <th>Type</th> <th>Description</th>
</tr>
<tr><td>0</td><td>Occluded</b></td><td>The area under this mask of the quad is not physically there. Any holograms that are rendered in this area are most likely not on the actual surface.</td></tr>
<tr><td>1</td><td>Visible</td><td>The area under this mask is observed to be on the surface. Any holograms that are rendered in this area are known to lie on the surface.</td></tr>
<tr><td>2</td><td>Inferred</td><td>The area under this mask is assumed to be valid. The device has never seen this surface, but has decided that given the environmental layout, that it is most likely valid. An example might be the area of the floor under a table, where the device assumes that the floor continues under the table.</td></tr>
</tr>
</table>

```cs
void NormalizedToMeters(float normalizedX, float normalizedY, Id quadId, out float xInMeters, out float yInMeters);
```

NormalizedToMeters provides a conversion from normalized coordinates (0.0f -> 1.0f) to real world coordinates. This primary use case for this API is used in conjunction with GetOcclusionMask allowing for easy conversion from the normalized space of the occlusion mask to real world coordinates.

```cs
bool FindCentermostPlacement(Quad quad, float objectWidthInMeters, float objectHeightInMeters, out ISpatialCoordinateSystem coordinate, out ITransform quadSpaceToSpatialCoordinateSpaceTransform);
```

When trying to place a Hologram on a surface, often an application will want to simply place the hologram in the centermost part of the quad so long that the hologram does not hang off the surface. For this, the FindCentermostPlacement API is the preferred way of performing this operation. The application simply provides the quad to place on and bounding box dimensions in x and y, and the system will try to find the ideal spot to fit the hologram.


<TODO: Insert untiy findCentermostPlacementCode>

## See also
* [spatial mapping](spatial-mapping.md)

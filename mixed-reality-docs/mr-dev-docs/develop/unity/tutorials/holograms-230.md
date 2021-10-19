---
title: HoloLens (1st gen) Spatial 230 - Spatial mapping
description: Follow this coding walkthrough using Unity, Visual Studio and HoloLens to learn the details of spatial mapping concepts.
author: keveleigh
ms.author: kurtie
ms.date: 10/22/2019
ms.topic: article
keywords: holotoolkit, mixedrealitytoolkit, mixedrealitytoolkit-unity, academy, tutorial, spatial mapping, surface reconstruction, mesh, HoloLens, Mixed Reality Academy, unity, mixed reality headset, windows mixed reality headset, virtual reality headset, Windows 10
---

# HoloLens (1st gen) Spatial 230: Spatial mapping

>[!IMPORTANT]
>The Mixed Reality Academy tutorials were designed with HoloLens (1st gen), Unity 2017, and Mixed Reality Immersive Headsets in mind.  As such, we feel it is important to leave these tutorials in place for developers who are still looking for guidance in developing for those devices. These tutorials will **_not_** be updated with the latest toolsets or interactions being used for HoloLens 2 and may not be compatible with newer versions of Unity.  They will be maintained to continue working on the supported devices. [A new series of tutorials](mrlearning-base.md) has been posted for HoloLens 2.

[Spatial mapping](../../../design/spatial-mapping.md) combines the real world and virtual world together by teaching holograms about the environment. In MR Spatial 230 (Project Planetarium) we'll learn how to:

* Scan the environment and transfer data from the HoloLens to your development machine.
* Explore shaders and learn how to use them for visualizing your space.
* Break down the room mesh into simple planes using mesh processing.
* Go beyond the placement techniques we learned in [MR Basics 101](../../../develop/unity/tutorials/holograms-101.md), and provide feedback about where a hologram can be placed in the environment.
* Explore occlusion effects, so when your hologram is behind a real-world object, you can still see it with x-ray vision!

>[!VIDEO https://www.youtube.com/embed/NSNYRkUX6Mw]

## Device support

<table>
<tr>
<th>Course</th><th style="width:150px"> <a href="/hololens/hololens1-hardware">HoloLens</a></th><th style="width:150px"> <a href="../../../discover/immersive-headset-hardware-details.md">Immersive headsets</a></th>
</tr><tr>
<td>MR Spatial 230: Spatial mapping</td><td style="text-align: center;"> ✔️</td><td style="text-align: center;"> </td>
</tr>
</table>

## Before you start

### Prerequisites

* A Windows 10 PC configured with the correct [tools installed](../../../develop/install-the-tools.md).
* Some basic C# programming ability.
* You should have completed [MR Basics 101](../../../develop/unity/tutorials/holograms-101.md).
* A HoloLens device [configured for development](../../../develop/advanced-concepts/using-visual-studio.md#enabling-developer-mode).

### Project files

* Download the [files](https://github.com/Microsoft/HolographicAcademy/archive/Holograms-230-SpatialMapping.zip) required by the project. Requires Unity 2017.2 or later.
  * If you still need Unity 5.6 support, please use [this release](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.6-230.zip).
  * If you still need Unity 5.5 support, please use [this release](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.5-230.zip).
  * If you still need Unity 5.4 support, please use [this release](https://github.com/Microsoft/HolographicAcademy/archive/v1.5.4-230.zip).
* Un-archive the files to your desktop or other easy to reach location.

>[!NOTE]
>If you want to look through the source code before downloading, it's [available on GitHub](https://github.com/Microsoft/HolographicAcademy/tree/Holograms-230-SpatialMapping).

### Notes

* "Enable Just My Code" in Visual Studio needs to be disabled (*unchecked*) under Tools > Options > Debugging in order to hit breakpoints in your code.

## Unity setup

>[!VIDEO https://www.youtube.com/embed/y2Y4LhK6TEM]

* Start **Unity**.
* Select **New** to create a new project.
* Name the project **Planetarium**.
* Verify that the **3D** setting is selected.
* Click **Create Project**.
* Once Unity launches, go to **Edit > Project Settings > Player**.
* In the **Inspector** panel, find and select the green **Windows Store** icon.
* Expand **Other Settings**.
* In the **Rendering** section, check the **Virtual Reality Supported** option.
* Verify that **Windows Holographic** appears in the list of **Virtual Reality SDKs**. If not, select the **+** button at the bottom of the list and choose **Windows Holographic**.
* Expand **Publishing Settings**.
* In the **Capabilities** section, check the following settings:
    * InternetClientServer
    * PrivateNetworkClientServer
    * Microphone
    * SpatialPerception
* Go to **Edit > Project Settings > Quality**
* In the **Inspector** panel, under the Windows Store icon, select the black drop-down arrow under the 'Default' row and change the default setting to **Very Low**.
* Go to **Assets > Import Package > Custom Package**.
* Navigate to the **...\HolographicAcademy-Holograms-230-SpatialMapping\Starting** folder.
* Click on **Planetarium.unitypackage**.
* Click **Open**.
* An **Import Unity Package** window should appear, click on the **Import** button.
* Wait for Unity to import all of the assets that we will need to complete this project.
* In the **Hierarchy** panel, delete the **Main Camera**.
* In the **Project** panel, **HoloToolkit-SpatialMapping-230\Utilities\Prefabs** folder, find the **Main Camera** object.
* Drag and drop the **Main Camera** prefab into the **Hierarchy** panel.
* In the **Hierarchy** panel, delete the **Directional Light** object.
* In the **Project** panel, **Holograms** folder, locate the **Cursor** object.
* Drag & drop the **Cursor** prefab into the **Hierarchy**.
* In the **Hierarchy** panel, select the **Cursor** object.
* In the **Inspector** panel, click the **Layer** drop-down and select **Edit Layers...**.
* Name **User Layer 31** as "**SpatialMapping**".
* Save the new scene: **File > Save Scene As...**
* Click **New Folder** and name the folder **Scenes**.
* Name the file "**Planetarium**" and save it in the **Scenes** folder.

## Chapter 1 - Scanning

>[!VIDEO https://www.youtube.com/embed/888oW51z_cE]

**Objectives**

* Learn about the SurfaceObserver and how its settings impact experience and performance.
* Create a room scanning experience to collect the meshes of your room.

**Instructions**

* In the **Project** panel **HoloToolkit-SpatialMapping-230\SpatialMapping\Prefabs** folder, find the **SpatialMapping** prefab.
* Drag & drop the **SpatialMapping** prefab into the **Hierarchy** panel.

**Build and Deploy (part 1)**

* In Unity, select **File > Build Settings**.
* Click **Add Open Scenes** to add the **Planetarium** scene to the build.
* Select **Universal Windows Platform** in the **Platform** list and click **Switch Platform**.
* Set **SDK** to **Universal 10** and **UWP Build Type** to **D3D**.
* Check **Unity C# Projects**.
* Click **Build**.
* Create a **New Folder** named "App".
* Single click the **App** folder.
* Press the **Select Folder** button.
* When Unity is done building, a File Explorer window will appear.
* Double-click on the **App** folder to open it.
* Double-click on **Planetarium.sln** to load the project in Visual Studio.
* In Visual Studio, use the top toolbar to change the Configuration to **Release**.
* Change the Platform to **x86**.
* Click on the drop-down arrow to the right of 'Local Machine', and select **Remote Machine**.
* Enter [your device's IP address](/hololens/hololens-network#identifying-the-ip-address-of-your-hololens-on-the-wi-fi-network) in the Address field and change Authentication Mode to **Universal (Unencrypted Protocol)**.
* Click **Debug -> Start Without debugging** or press **Ctrl + F5**.
* Watch the **Output** panel in Visual Studio for build and deploy status.
* Once your app has deployed, walk around the room. You will see the surrounding surfaces covered by black and white wireframe meshes.
* Scan your surroundings. Be sure to look at walls, ceilings, and floors.

**Build and Deploy (part 2)**

Now let's explore how Spatial Mapping can affect performance.

* In Unity, select **Window > Profiler**.
* Click **Add Profiler > GPU**.
* Click **Active Profiler > <Enter IP>**.
* Enter the **IP address** of your HoloLens.
* Click **Connect**.
* Observe the number of milliseconds it takes for the GPU to render a frame.
* Stop the application from running on the device.
* Return to Visual Studio and open **SpatialMappingObserver.cs**. You will find it in the HoloToolkit\SpatialMapping folder of the Assembly-CSharp (Universal Windows) project.
* Find the **Awake()** function, and add the following line of code: **TrianglesPerCubicMeter = 1200;**
* Re-deploy the project to your device, and then **reconnect the profiler**. Observe the change in the number of milliseconds to render a frame.
* Stop the application from running on the device.

**Save and load in Unity**

Finally, let's save our room mesh and load it into Unity.

* Return to Visual Studio and remove the **TrianglesPerCubicMeter** line that you added in the **Awake()** function during the previous section.
* Redeploy the project to your device. We should now be running with **500** triangles per cubic meter.
* Open a browser and enter in your HoloLens IPAddress to navigate to the **Windows Device Portal**.
* Select the **3D View** option in the left panel.
* Under **Surface reconstruction** select the **Update** button.
* Watch as the areas that you have scanned on your HoloLens appear in the display window.
* To save your room scan, press the **Save** button.
* Open your **Downloads** folder to find the saved room model **SRMesh.obj**.
* Copy **SRMesh.obj** to the **Assets** folder of your Unity project.
* In Unity, select the **SpatialMapping** object in the **Hierarchy** panel.
* Locate the **Object Surface Observer (Script)** component.
* Click the circle to the right of the **Room Model** property.
* Find and select the **SRMesh** object and then close the window.
* Verify that the **Room Model** property in the **Inspector** panel is now set to **SRMesh**.
* Press the **Play** button to enter Unity's preview mode.
* The SpatialMapping component will load the meshes from the saved room model so you can use them in Unity.
* Switch to **Scene** view to see all of your room model displayed with the wireframe shader.
* Press the **Play** button again to exit preview mode.

**NOTE:** The next time that you enter preview mode in Unity, it will load the saved room mesh by default.

## Chapter 2 - Visualization

>[!VIDEO https://www.youtube.com/embed/RnkvXl-aXD4]

**Objectives**

* Learn the basics of shaders.
* Visualize your surroundings.

**Instructions**

* In Unity's **Hierarchy** panel, select the **SpatialMapping** object.
* In the **Inspector** panel, find the **Spatial Mapping Manager (Script)** component.
* Click the circle to the right of the **Surface Material** property.
* Find and select the **BlueLinesOnWalls** material and close the window.
* In the **Project** panel **Shaders** folder, double-click on **BlueLinesOnWalls** to open the shader in Visual Studio.
* This is a simple pixel (vertex to fragment) shader, which accomplishes the following tasks:
    1. Converts a vertex's location to world space.
    2. Checks the vertex's normal to determine if a pixel is vertical.
    3. Sets the color of the pixel for rendering.

**Build and Deploy**

* Return to Unity and press **Play** to enter preview mode.
* Blue lines will be rendered on all vertical surfaces of the room mesh (which automatically loaded from our saved scanning data).
* Switch to the **Scene** tab to adjust your view of the room and see how the entire room mesh appears in Unity.
* In the **Project** panel, find the **Materials** folder and select the **BlueLinesOnWalls** material.
* Modify some properties and see how the changes appear in the Unity editor.
    * In the **Inspector** panel, adjust the **LineScale** value to make the lines appear thicker or thinner.
    * In the **Inspector** panel, adjust the **LinesPerMeter** value to change how many lines appear on each wall.
* Click **Play** again to exit preview mode.
* Build and deploy to the HoloLens and observe how the shader rendering appears on real surfaces.

Unity does a great job of previewing materials, but it's always a good idea to check-out rendering in the device.

## Chapter 3 - Processing

>[!VIDEO https://www.youtube.com/embed/kaUKiNiDxwY]

**Objectives**

* Learn techniques to process spatial mapping data for use in your application.
* Analyze spatial mapping data to find planes and remove triangles.
* Use planes for hologram placement.

**Instructions**

* In Unity's **Project** panel, **Holograms** folder, find the **SpatialProcessing** object.
* Drag & drop the **SpatialProcessing** object into the **Hierarchy** panel.

The SpatialProcessing prefab includes components for processing the spatial mapping data. **SurfaceMeshesToPlanes.cs** will find and generate planes based on the spatial mapping data. We will use planes in our application to represent walls, floors and ceilings. This prefab also includes **RemoveSurfaceVertices.cs** which can remove vertices from the spatial mapping mesh. This can be used to create holes in the mesh, or to remove excess triangles that are no longer needed (because planes can be used instead).

* In Unity's **Project** panel, **Holograms** folder, find the **SpaceCollection** object.
* Drag and drop the **SpaceCollection** object into the **Hierarchy** panel.
* In the **Hierarchy** panel, select the **SpatialProcessing** object.
* In the **Inspector** panel, find the **Play Space Manager (Script)** component.
* Double-click on **PlaySpaceManager.cs** to open it in Visual Studio.

PlaySpaceManager.cs contains application-specific code. We will add functionality to this script to enable the following behavior:

1. Stop collecting spatial mapping data after we exceed the scanning time limit (10 seconds).
2. Process the spatial mapping data:
    1. Use SurfaceMeshesToPlanes to create a simpler representation of the world as planes (walls, floors, ceilings, etc).
    2. Use RemoveSurfaceVertices to remove surface triangles that fall within plane boundaries.
3. Generate a collection of holograms in the world and place them on wall and floor planes near the user.

Complete the coding exercises marked in PlaySpaceManager.cs, or replace the script with the finished solution from below:

```cs
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Windows.Speech;
using Academy.HoloToolkit.Unity;

/// <summary>
/// The SurfaceManager class allows applications to scan the environment for a specified amount of time 
/// and then process the Spatial Mapping Mesh (find planes, remove vertices) after that time has expired.
/// </summary>
public class PlaySpaceManager : Singleton<PlaySpaceManager>
{
    [Tooltip("When checked, the SurfaceObserver will stop running after a specified amount of time.")]
    public bool limitScanningByTime = true;

    [Tooltip("How much time (in seconds) that the SurfaceObserver will run after being started; used when 'Limit Scanning By Time' is checked.")]
    public float scanTime = 30.0f;

    [Tooltip("Material to use when rendering Spatial Mapping meshes while the observer is running.")]
    public Material defaultMaterial;

    [Tooltip("Optional Material to use when rendering Spatial Mapping meshes after the observer has been stopped.")]
    public Material secondaryMaterial;

    [Tooltip("Minimum number of floor planes required in order to exit scanning/processing mode.")]
    public uint minimumFloors = 1;

    [Tooltip("Minimum number of wall planes required in order to exit scanning/processing mode.")]
    public uint minimumWalls = 1;

    /// <summary>
    /// Indicates if processing of the surface meshes is complete.
    /// </summary>
    private bool meshesProcessed = false;

    /// <summary>
    /// GameObject initialization.
    /// </summary>
    private void Start()
    {
        // Update surfaceObserver and storedMeshes to use the same material during scanning.
        SpatialMappingManager.Instance.SetSurfaceMaterial(defaultMaterial);

        // Register for the MakePlanesComplete event.
        SurfaceMeshesToPlanes.Instance.MakePlanesComplete += SurfaceMeshesToPlanes_MakePlanesComplete;
    }

    /// <summary>
    /// Called once per frame.
    /// </summary>
    private void Update()
    {
        // Check to see if the spatial mapping data has been processed
        // and if we are limiting how much time the user can spend scanning.
        if (!meshesProcessed && limitScanningByTime)
        {
            // If we have not processed the spatial mapping data
            // and scanning time is limited...

            // Check to see if enough scanning time has passed
            // since starting the observer.
            if (limitScanningByTime && ((Time.time - SpatialMappingManager.Instance.StartTime) < scanTime))
            {
                // If we have a limited scanning time, then we should wait until
                // enough time has passed before processing the mesh.
            }
            else
            {
                // The user should be done scanning their environment,
                // so start processing the spatial mapping data...

                /* TODO: 3.a DEVELOPER CODING EXERCISE 3.a */

                // 3.a: Check if IsObserverRunning() is true on the
                // SpatialMappingManager.Instance.
                if(SpatialMappingManager.Instance.IsObserverRunning())
                {
                    // 3.a: If running, Stop the observer by calling
                    // StopObserver() on the SpatialMappingManager.Instance.
                    SpatialMappingManager.Instance.StopObserver();
                }

                // 3.a: Call CreatePlanes() to generate planes.
                CreatePlanes();

                // 3.a: Set meshesProcessed to true.
                meshesProcessed = true;
            }
        }
    }

    /// <summary>
    /// Handler for the SurfaceMeshesToPlanes MakePlanesComplete event.
    /// </summary>
    /// <param name="source">Source of the event.</param>
    /// <param name="args">Args for the event.</param>
    private void SurfaceMeshesToPlanes_MakePlanesComplete(object source, System.EventArgs args)
    {
        /* TODO: 3.a DEVELOPER CODING EXERCISE 3.a */

        // Collection of floor and table planes that we can use to set horizontal items on.
        List<GameObject> horizontal = new List<GameObject>();

        // Collection of wall planes that we can use to set vertical items on.
        List<GameObject> vertical = new List<GameObject>();

        // 3.a: Get all floor and table planes by calling
        // SurfaceMeshesToPlanes.Instance.GetActivePlanes().
        // Assign the result to the 'horizontal' list.
        horizontal = SurfaceMeshesToPlanes.Instance.GetActivePlanes(PlaneTypes.Table | PlaneTypes.Floor);

        // 3.a: Get all wall planes by calling
        // SurfaceMeshesToPlanes.Instance.GetActivePlanes().
        // Assign the result to the 'vertical' list.
        vertical = SurfaceMeshesToPlanes.Instance.GetActivePlanes(PlaneTypes.Wall);

        // Check to see if we have enough horizontal planes (minimumFloors)
        // and vertical planes (minimumWalls), to set holograms on in the world.
        if (horizontal.Count >= minimumFloors && vertical.Count >= minimumWalls)
        {
            // We have enough floors and walls to place our holograms on...

            // 3.a: Let's reduce our triangle count by removing triangles
            // from SpatialMapping meshes that intersect with our active planes.
            // Call RemoveVertices().
            // Pass in all activePlanes found by SurfaceMeshesToPlanes.Instance.
            RemoveVertices(SurfaceMeshesToPlanes.Instance.ActivePlanes);

            // 3.a: We can indicate to the user that scanning is over by
            // changing the material applied to the Spatial Mapping meshes.
            // Call SpatialMappingManager.Instance.SetSurfaceMaterial().
            // Pass in the secondaryMaterial.
            SpatialMappingManager.Instance.SetSurfaceMaterial(secondaryMaterial);

            // 3.a: We are all done processing the mesh, so we can now
            // initialize a collection of Placeable holograms in the world
            // and use horizontal/vertical planes to set their starting positions.
            // Call SpaceCollectionManager.Instance.GenerateItemsInWorld().
            // Pass in the lists of horizontal and vertical planes that we found earlier.
            SpaceCollectionManager.Instance.GenerateItemsInWorld(horizontal, vertical);
        }
        else
        {
            // We do not have enough floors/walls to place our holograms on...

            // 3.a: Re-enter scanning mode so the user can find more surfaces by
            // calling StartObserver() on the SpatialMappingManager.Instance.
            SpatialMappingManager.Instance.StartObserver();

            // 3.a: Re-process spatial data after scanning completes by
            // re-setting meshesProcessed to false.
            meshesProcessed = false;
        }
    }

    /// <summary>
    /// Creates planes from the spatial mapping surfaces.
    /// </summary>
    private void CreatePlanes()
    {
        // Generate planes based on the spatial map.
        SurfaceMeshesToPlanes surfaceToPlanes = SurfaceMeshesToPlanes.Instance;
        if (surfaceToPlanes != null && surfaceToPlanes.enabled)
        {
            surfaceToPlanes.MakePlanes();
        }
    }

    /// <summary>
    /// Removes triangles from the spatial mapping surfaces.
    /// </summary>
    /// <param name="boundingObjects"></param>
    private void RemoveVertices(IEnumerable<GameObject> boundingObjects)
    {
        RemoveSurfaceVertices removeVerts = RemoveSurfaceVertices.Instance;
        if (removeVerts != null && removeVerts.enabled)
        {
            removeVerts.RemoveSurfaceVerticesWithinBounds(boundingObjects);
        }
    }

    /// <summary>
    /// Called when the GameObject is unloaded.
    /// </summary>
    private void OnDestroy()
    {
        if (SurfaceMeshesToPlanes.Instance != null)
        {
            SurfaceMeshesToPlanes.Instance.MakePlanesComplete -= SurfaceMeshesToPlanes_MakePlanesComplete;
        }
    }
}
```

**Build and Deploy**

* Before deploying to the HoloLens, press the **Play** button in Unity to enter play mode.
* After the room mesh is loaded from file, wait for 10 seconds before processing starts on the spatial mapping mesh.
* When processing is complete, planes will appear to represent the floor, walls, ceiling, etc.
* After all of the planes have been found, you should see a solar system appear on a table of floor near the camera.
* Two posters should appear on walls near the camera too. Switch to the **Scene** tab if you cannot see them in **Game** mode.
* Press the **Play** button again to exit play mode.
* Build and deploy to the HoloLens, as usual.
* Wait for scanning and processing of the spatial mapping data to complete.
* Once you see planes, try to find the solar system and posters in your world.

## Chapter 4 - Placement

>[!VIDEO https://www.youtube.com/embed/Srhtpid1uZc]

**Objectives**

* Determine if a hologram will fit on a surface.
* Provide feedback to the user when a hologram can/cannot fit on a surface.

**Instructions**

* In Unity's **Hierarchy** panel, select the **SpatialProcessing** object.
* In the **Inspector** panel, find the **Surface Meshes To Planes (Script)** component.
* Change the **Draw Planes** property to **Nothing** to clear the selection.
* Change the **Draw Planes** property to **Wall**, so that only wall planes will be rendered.
* In the **Project** panel, **Scripts** folder, double-click on **Placeable.cs** to open it in Visual Studio.

The **Placeable** script is already attached to the posters and projection box that are created after plane finding completes. All we need to do is uncomment some code, and this script will achieve the following:

1. Determine if a hologram will fit on a surface by raycasting from the center and four corners of the bounding cube.
2. Check the surface normal to determine if it is smooth enough for the hologram to sit flush on.
3. Render a bounding cube around the hologram to show its actual size while being placed.
4. Cast a shadow under/behind the hologram to show where it will be placed on the floor/wall.
5. Render the shadow as red, if the hologram cannot be placed on the surface, or green, if it can.
6. Re-orient the hologram to align with the surface type (vertical or horizontal) that it has affinity to.
7. Smoothly place the hologram on the selected surface to avoid jumping or snapping behavior.

Uncomment all code in the coding exercise below, or use this completed solution in **Placeable.cs**:

```cs
using System.Collections.Generic;
using UnityEngine;
using Academy.HoloToolkit.Unity;

/// <summary>
/// Enumeration containing the surfaces on which a GameObject
/// can be placed.  For simplicity of this sample, only one
/// surface type is allowed to be selected.
/// </summary>
public enum PlacementSurfaces
{
    // Horizontal surface with an upward pointing normal.
    Horizontal = 1,

    // Vertical surface with a normal facing the user.
    Vertical = 2,
}

/// <summary>
/// The Placeable class implements the logic used to determine if a GameObject
/// can be placed on a target surface. Constraints for placement include:
/// * No part of the GameObject's box collider impacts with another object in the scene
/// * The object lays flat (within specified tolerances) against the surface
/// * The object would not fall off of the surface if gravity were enabled.
/// This class also provides the following visualizations.
/// * A transparent cube representing the object's box collider.
/// * Shadow on the target surface indicating whether or not placement is valid.
/// </summary>
public class Placeable : MonoBehaviour
{
    [Tooltip("The base material used to render the bounds asset when placement is allowed.")]
    public Material PlaceableBoundsMaterial = null;

    [Tooltip("The base material used to render the bounds asset when placement is not allowed.")]
    public Material NotPlaceableBoundsMaterial = null;

    [Tooltip("The material used to render the placement shadow when placement it allowed.")]
    public Material PlaceableShadowMaterial = null;

    [Tooltip("The material used to render the placement shadow when placement it not allowed.")]
    public Material NotPlaceableShadowMaterial = null;

    [Tooltip("The type of surface on which the object can be placed.")]
    public PlacementSurfaces PlacementSurface = PlacementSurfaces.Horizontal;

    [Tooltip("The child object(s) to hide during placement.")]
    public List<GameObject> ChildrenToHide = new List<GameObject>();

    /// <summary>
    /// Indicates if the object is in the process of being placed.
    /// </summary>
    public bool IsPlacing { get; private set; }

    // The most recent distance to the surface.  This is used to 
    // locate the object when the user's gaze does not intersect
    // with the Spatial Mapping mesh.
    private float lastDistance = 2.0f;

    // The distance away from the target surface that the object should hover prior while being placed.
    private float hoverDistance = 0.15f;

    // Threshold (the closer to 0, the stricter the standard) used to determine if a surface is flat.
    private float distanceThreshold = 0.02f;

    // Threshold (the closer to 1, the stricter the standard) used to determine if a surface is vertical.
    private float upNormalThreshold = 0.9f;

    // Maximum distance, from the object, that placement is allowed.
    // This is used when raycasting to see if the object is near a placeable surface.
    private float maximumPlacementDistance = 5.0f;

    // Speed (1.0 being fastest) at which the object settles to the surface upon placement.
    private float placementVelocity = 0.06f;

    // Indicates whether or not this script manages the object's box collider.
    private bool managingBoxCollider = false;

    // The box collider used to determine of the object will fit in the desired location.
    // It is also used to size the bounding cube.
    private BoxCollider boxCollider = null;

    // Visible asset used to show the dimensions of the object. This asset is sized
    // using the box collider's bounds.
    private GameObject boundsAsset = null;

    // Visible asset used to show the where the object is attempting to be placed.
    // This asset is sized using the box collider's bounds.
    private GameObject shadowAsset = null;

    // The location at which the object will be placed.
    private Vector3 targetPosition;

    /// <summary>
    /// Called when the GameObject is created.
    /// </summary>
    private void Awake()
    {
        targetPosition = gameObject.transform.position;

        // Get the object's collider.
        boxCollider = gameObject.GetComponent<BoxCollider>();
        if (boxCollider == null)
        {
            // The object does not have a collider, create one and remember that
            // we are managing it.
            managingBoxCollider = true;
            boxCollider = gameObject.AddComponent<BoxCollider>();
            boxCollider.enabled = false;
        }

        // Create the object that will be used to indicate the bounds of the GameObject.
        boundsAsset = GameObject.CreatePrimitive(PrimitiveType.Cube);
        boundsAsset.transform.parent = gameObject.transform;
        boundsAsset.SetActive(false);

        // Create a object that will be used as a shadow.
        shadowAsset = GameObject.CreatePrimitive(PrimitiveType.Quad);
        shadowAsset.transform.parent = gameObject.transform;
        shadowAsset.SetActive(false);
    }

    /// <summary>
    /// Called when our object is selected.  Generally called by
    /// a gesture management component.
    /// </summary>
    public void OnSelect()
    {
        /* TODO: 4.a CODE ALONG 4.a */

        if (!IsPlacing)
        {
            OnPlacementStart();
        }
        else
        {
            OnPlacementStop();
        }
    }

    /// <summary>
    /// Called once per frame.
    /// </summary>
    private void Update()
    {
        /* TODO: 4.a CODE ALONG 4.a */

        if (IsPlacing)
        {
            // Move the object.
            Move();

            // Set the visual elements.
            Vector3 targetPosition;
            Vector3 surfaceNormal;
            bool canBePlaced = ValidatePlacement(out targetPosition, out surfaceNormal);
            DisplayBounds(canBePlaced);
            DisplayShadow(targetPosition, surfaceNormal, canBePlaced);
        }
        else
        {
            // Disable the visual elements.
            boundsAsset.SetActive(false);
            shadowAsset.SetActive(false);

            // Gracefully place the object on the target surface.
            float dist = (gameObject.transform.position - targetPosition).magnitude;
            if (dist > 0)
            {
                gameObject.transform.position = Vector3.Lerp(gameObject.transform.position, targetPosition, placementVelocity / dist);
            }
            else
            {
                // Unhide the child object(s) to make placement easier.
                for (int i = 0; i < ChildrenToHide.Count; i++)
                {
                    ChildrenToHide[i].SetActive(true);
                }
            }
        }
    }

    /// <summary>
    /// Verify whether or not the object can be placed.
    /// </summary>
    /// <param name="position">
    /// The target position on the surface.
    /// </param>
    /// <param name="surfaceNormal">
    /// The normal of the surface on which the object is to be placed.
    /// </param>
    /// <returns>
    /// True if the target position is valid for placing the object, otherwise false.
    /// </returns>
    private bool ValidatePlacement(out Vector3 position, out Vector3 surfaceNormal)
    {
        Vector3 raycastDirection = gameObject.transform.forward;

        if (PlacementSurface == PlacementSurfaces.Horizontal)
        {
            // Placing on horizontal surfaces.
            // Raycast from the bottom face of the box collider.
            raycastDirection = -(Vector3.up);
        }

        // Initialize out parameters.
        position = Vector3.zero;
        surfaceNormal = Vector3.zero;

        Vector3[] facePoints = GetColliderFacePoints();

        // The origin points we receive are in local space and we 
        // need to raycast in world space.
        for (int i = 0; i < facePoints.Length; i++)
        {
            facePoints[i] = gameObject.transform.TransformVector(facePoints[i]) + gameObject.transform.position;
        }

        // Cast a ray from the center of the box collider face to the surface.
        RaycastHit centerHit;
        if (!Physics.Raycast(facePoints[0],
                        raycastDirection,
                        out centerHit,
                        maximumPlacementDistance,
                        SpatialMappingManager.Instance.LayerMask))
        {
            // If the ray failed to hit the surface, we are done.
            return false;
        }

        // We have found a surface.  Set position and surfaceNormal.
        position = centerHit.point;
        surfaceNormal = centerHit.normal;

        // Cast a ray from the corners of the box collider face to the surface.
        for (int i = 1; i < facePoints.Length; i++)
        {
            RaycastHit hitInfo;
            if (Physics.Raycast(facePoints[i],
                                raycastDirection,
                                out hitInfo,
                                maximumPlacementDistance,
                                SpatialMappingManager.Instance.LayerMask))
            {
                // To be a valid placement location, each of the corners must have a similar
                // enough distance to the surface as the center point
                if (!IsEquivalentDistance(centerHit.distance, hitInfo.distance))
                {
                    return false;
                }
            }
            else
            {
                // The raycast failed to intersect with the target layer.
                return false;
            }
        }

        return true;
    }

    /// <summary>
    /// Determine the coordinates, in local space, of the box collider face that 
    /// will be placed against the target surface.
    /// </summary>
    /// <returns>
    /// Vector3 array with the center point of the face at index 0.
    /// </returns>
    private Vector3[] GetColliderFacePoints()
    {
        // Get the collider extents.  
        // The size values are twice the extents.
        Vector3 extents = boxCollider.size / 2;

        // Calculate the min and max values for each coordinate.
        float minX = boxCollider.center.x - extents.x;
        float maxX = boxCollider.center.x + extents.x;
        float minY = boxCollider.center.y - extents.y;
        float maxY = boxCollider.center.y + extents.y;
        float minZ = boxCollider.center.z - extents.z;
        float maxZ = boxCollider.center.z + extents.z;

        Vector3 center;
        Vector3 corner0;
        Vector3 corner1;
        Vector3 corner2;
        Vector3 corner3;

        if (PlacementSurface == PlacementSurfaces.Horizontal)
        {
            // Placing on horizontal surfaces.
            center = new Vector3(boxCollider.center.x, minY, boxCollider.center.z);
            corner0 = new Vector3(minX, minY, minZ);
            corner1 = new Vector3(minX, minY, maxZ);
            corner2 = new Vector3(maxX, minY, minZ);
            corner3 = new Vector3(maxX, minY, maxZ);
        }
        else
        {
            // Placing on vertical surfaces.
            center = new Vector3(boxCollider.center.x, boxCollider.center.y, maxZ);
            corner0 = new Vector3(minX, minY, maxZ);
            corner1 = new Vector3(minX, maxY, maxZ);
            corner2 = new Vector3(maxX, minY, maxZ);
            corner3 = new Vector3(maxX, maxY, maxZ);
        }

        return new Vector3[] { center, corner0, corner1, corner2, corner3 };
    }

    /// <summary>
    /// Put the object into placement mode.
    /// </summary>
    public void OnPlacementStart()
    {
        // If we are managing the collider, enable it. 
        if (managingBoxCollider)
        {
            boxCollider.enabled = true;
        }

        // Hide the child object(s) to make placement easier.
        for (int i = 0; i < ChildrenToHide.Count; i++)
        {
            ChildrenToHide[i].SetActive(false);
        }

        // Tell the gesture manager that it is to assume
        // all input is to be given to this object.
        GestureManager.Instance.OverrideFocusedObject = gameObject;

        // Enter placement mode.
        IsPlacing = true;
    }

    /// <summary>
    /// Take the object out of placement mode.
    /// </summary>
    /// <remarks>
    /// This method will leave the object in placement mode if called while
    /// the object is in an invalid location.  To determine whether or not
    /// the object has been placed, check the value of the IsPlacing property.
    /// </remarks>
    public void OnPlacementStop()
    {
        // ValidatePlacement requires a normal as an out parameter.
        Vector3 position;
        Vector3 surfaceNormal;

        // Check to see if we can exit placement mode.
        if (!ValidatePlacement(out position, out surfaceNormal))
        {
            return;
        }

        // The object is allowed to be placed.
        // We are placing at a small buffer away from the surface.
        targetPosition = position + (0.01f * surfaceNormal);

        OrientObject(true, surfaceNormal);

        // If we are managing the collider, disable it. 
        if (managingBoxCollider)
        {
            boxCollider.enabled = false;
        }

        // Tell the gesture manager that it is to resume
        // its normal behavior.
        GestureManager.Instance.OverrideFocusedObject = null;

        // Exit placement mode.
        IsPlacing = false;
    }

    /// <summary>
    /// Positions the object along the surface toward which the user is gazing.
    /// </summary>
    /// <remarks>
    /// If the user's gaze does not intersect with a surface, the object
    /// will remain at the most recently calculated distance.
    /// </remarks>
    private void Move()
    {
        Vector3 moveTo = gameObject.transform.position;
        Vector3 surfaceNormal = Vector3.zero;
        RaycastHit hitInfo;

        bool hit = Physics.Raycast(Camera.main.transform.position,
                                Camera.main.transform.forward,
                                out hitInfo,
                                20f,
                                SpatialMappingManager.Instance.LayerMask);

        if (hit)
        {
            float offsetDistance = hoverDistance;

            // Place the object a small distance away from the surface while keeping 
            // the object from going behind the user.
            if (hitInfo.distance <= hoverDistance)
            {
                offsetDistance = 0f;
            }

            moveTo = hitInfo.point + (offsetDistance * hitInfo.normal);

            lastDistance = hitInfo.distance;
            surfaceNormal = hitInfo.normal;
        }
        else
        {
            // The raycast failed to hit a surface.  In this case, keep the object at the distance of the last
            // intersected surface.
            moveTo = Camera.main.transform.position + (Camera.main.transform.forward * lastDistance);
        }

        // Follow the user's gaze.
        float dist = Mathf.Abs((gameObject.transform.position - moveTo).magnitude);
        gameObject.transform.position = Vector3.Lerp(gameObject.transform.position, moveTo, placementVelocity / dist);

        // Orient the object.
        // We are using the return value from Physics.Raycast to instruct
        // the OrientObject function to align to the vertical surface if appropriate.
        OrientObject(hit, surfaceNormal);
    }

    /// <summary>
    /// Orients the object so that it faces the user.
    /// </summary>
    /// <param name="alignToVerticalSurface">
    /// If true and the object is to be placed on a vertical surface, 
    /// orient parallel to the target surface.  If false, orient the object 
    /// to face the user.
    /// </param>
    /// <param name="surfaceNormal">
    /// The target surface's normal vector.
    /// </param>
    /// <remarks>
    /// The alignToVerticalSurface parameter is ignored if the object
    /// is to be placed on a horizontalSurface
    /// </remarks>
    private void OrientObject(bool alignToVerticalSurface, Vector3 surfaceNormal)
    {
        Quaternion rotation = Camera.main.transform.localRotation;

        // If the user's gaze does not intersect with the Spatial Mapping mesh,
        // orient the object towards the user.
        if (alignToVerticalSurface && (PlacementSurface == PlacementSurfaces.Vertical))
        {
            // We are placing on a vertical surface.
            // If the normal of the Spatial Mapping mesh indicates that the
            // surface is vertical, orient parallel to the surface.
            if (Mathf.Abs(surfaceNormal.y) <= (1 - upNormalThreshold))
            {
                rotation = Quaternion.LookRotation(-surfaceNormal, Vector3.up);
            }
        }
        else
        {
            rotation.x = 0f;
            rotation.z = 0f;
        }

        gameObject.transform.rotation = rotation;
    }

    /// <summary>
    /// Displays the bounds asset.
    /// </summary>
    /// <param name="canBePlaced">
    /// Specifies if the object is in a valid placement location.
    /// </param>
    private void DisplayBounds(bool canBePlaced)
    {
        // Ensure the bounds asset is sized and positioned correctly.
        boundsAsset.transform.localPosition = boxCollider.center;
        boundsAsset.transform.localScale = boxCollider.size;
        boundsAsset.transform.rotation = gameObject.transform.rotation;

        // Apply the appropriate material.
        if (canBePlaced)
        {
            boundsAsset.GetComponent<Renderer>().sharedMaterial = PlaceableBoundsMaterial;
        }
        else
        {
            boundsAsset.GetComponent<Renderer>().sharedMaterial = NotPlaceableBoundsMaterial;
        }

        // Show the bounds asset.
        boundsAsset.SetActive(true);
    }

    /// <summary>
    /// Displays the placement shadow asset.
    /// </summary>
    /// <param name="position">
    /// The position at which to place the shadow asset.
    /// </param>
    /// <param name="surfaceNormal">
    /// The normal of the surface on which the asset will be placed
    /// </param>
    /// <param name="canBePlaced">
    /// Specifies if the object is in a valid placement location.
    /// </param>
    private void DisplayShadow(Vector3 position,
                            Vector3 surfaceNormal,
                            bool canBePlaced)
    {
        // Rotate and scale the shadow so that it is displayed on the correct surface and matches the object.
        float rotationX = 0.0f;

        if (PlacementSurface == PlacementSurfaces.Horizontal)
        {
            rotationX = 90.0f;
            shadowAsset.transform.localScale = new Vector3(boxCollider.size.x, boxCollider.size.z, 1);
        }
        else
        {
            shadowAsset.transform.localScale = boxCollider.size;
        }

        Quaternion rotation = Quaternion.Euler(rotationX, gameObject.transform.rotation.eulerAngles.y, 0);
        shadowAsset.transform.rotation = rotation;

        // Apply the appropriate material.
        if (canBePlaced)
        {
            shadowAsset.GetComponent<Renderer>().sharedMaterial = PlaceableShadowMaterial;
        }
        else
        {
            shadowAsset.GetComponent<Renderer>().sharedMaterial = NotPlaceableShadowMaterial;
        }

        // Show the shadow asset as appropriate.
        if (position != Vector3.zero)
        {
            // Position the shadow a small distance from the target surface, along the normal.
            shadowAsset.transform.position = position + (0.01f * surfaceNormal);
            shadowAsset.SetActive(true);
        }
        else
        {
            shadowAsset.SetActive(false);
        }
    }

    /// <summary>
    /// Determines if two distance values should be considered equivalent. 
    /// </summary>
    /// <param name="d1">
    /// Distance to compare.
    /// </param>
    /// <param name="d2">
    /// Distance to compare.
    /// </param>
    /// <returns>
    /// True if the distances are within the desired tolerance, otherwise false.
    /// </returns>
    private bool IsEquivalentDistance(float d1, float d2)
    {
        float dist = Mathf.Abs(d1 - d2);
        return (dist <= distanceThreshold);
    }

    /// <summary>
    /// Called when the GameObject is unloaded.
    /// </summary>
    private void OnDestroy()
    {
        // Unload objects we have created.
        Destroy(boundsAsset);
        boundsAsset = null;
        Destroy(shadowAsset);
        shadowAsset = null;
    }
}
```

**Build and Deploy**

* As before, build the project and deploy to the HoloLens.
* Wait for scanning and processing of the spatial mapping data to complete.
* When you see the solar system, gaze at the projection box below and perform a select gesture to move it around. While the projection box is selected, a bounding cube will be visible around the projection box.
* Move you head to gaze at a different location in the room. The projection box should follow your gaze. When the shadow below the projection box turns red, you cannot place the hologram on that surface. When the shadow below the projection box turns green, you can place the hologram by performing another select gesture.
* Find and select one of the holographic posters on a wall to move it to a new location. Notice that you cannot place the poster on the floor or ceiling, and that it stays correctly oriented to each wall as you move around.

## Chapter 5 - Occlusion

>[!VIDEO https://www.youtube.com/embed/6Xrzh_w-7SE]

**Objectives**

* Determine if a hologram is occluded by the spatial mapping mesh.
* Apply different occlusion techniques to achieve a fun effect.

**Instructions**

First, we are going to allow the spatial mapping mesh to occlude other holograms without occluding the real world:

* In the **Hierarchy** panel, select the **SpatialProcessing** object.
* In the **Inspector** panel, find the **Play Space Manager (Script)** component.
* Click the circle to the right of the **Secondary Material** property.
* Find and select the **Occlusion** material and close the window.

Next, we are going to add a special behavior to Earth, so that it has a blue highlight whenever it becomes occluded by another hologram (like the sun), or by the spatial mapping mesh:

* In the **Project** panel, in the **Holograms** folder, expand the **SolarSystem** object.
* Click on **Earth**.
* In the **Inspector** panel, find the Earth's material (bottom component).
* In the **Shader drop-down**, change the shader to **Custom > OcclusionRim**. This will render a blue highlight around Earth whenever it is occluded by another object.

Finally, we are going to enable an x-ray vision effect for planets in our solar system. We will need to edit **PlanetOcclusion.cs** (found in the Scripts\SolarSystem folder) in order to achieve the following:

1. Determine if a planet is occluded by the SpatialMapping layer (room meshes and planes).
2. Show the wireframe representation of a planet whenever it is occluded by the SpatialMapping layer.
3. Hide the wireframe representation of a planet when it is not blocked by the SpatialMapping layer.

Follow the coding exercise in PlanetOcclusion.cs, or use the following solution:

```cs
using UnityEngine;
using Academy.HoloToolkit.Unity;

/// <summary>
/// Determines when the occluded version of the planet should be visible.
/// This script allows us to do selective occlusion, so the occlusionObject
/// will only be rendered when a Spatial Mapping surface is occluding the planet,
/// not when another hologram is responsible for the occlusion.
/// </summary>
public class PlanetOcclusion : MonoBehaviour
{
    [Tooltip("Object to display when the planet is occluded.")]
    public GameObject occlusionObject;

    /// <summary>
    /// Points to raycast to when checking for occlusion.
    /// </summary>
    private Vector3[] checkPoints;

    // Use this for initialization
    void Start()
    {
        occlusionObject.SetActive(false);

        // Set the check points to use when testing for occlusion.
        MeshFilter filter = gameObject.GetComponent<MeshFilter>();
        Vector3 extents = filter.mesh.bounds.extents;
        Vector3 center = filter.mesh.bounds.center;
        Vector3 top = new Vector3(center.x, center.y + extents.y, center.z);
        Vector3 left = new Vector3(center.x - extents.x, center.y, center.z);
        Vector3 right = new Vector3(center.x + extents.x, center.y, center.z);
        Vector3 bottom = new Vector3(center.x, center.y - extents.y, center.z);

        checkPoints = new Vector3[] { center, top, left, right, bottom };
    }

    // Update is called once per frame
    void Update()
    {
        /* TODO: 5.a DEVELOPER CODING EXERCISE 5.a */

        // Check to see if any of the planet's boundary points are occluded.
        for (int i = 0; i < checkPoints.Length; i++)
        {
            // 5.a: Convert the current checkPoint to world coordinates.
            // Call gameObject.transform.TransformPoint(checkPoints[i]).
            // Assign the result to a new Vector3 variable called 'checkPt'.
            Vector3 checkPt = gameObject.transform.TransformPoint(checkPoints[i]);

            // 5.a: Call Vector3.Distance() to calculate the distance
            // between the Main Camera's position and 'checkPt'.
            // Assign the result to a new float variable called 'distance'.
            float distance = Vector3.Distance(Camera.main.transform.position, checkPt);

            // 5.a: Take 'checkPt' and subtract the Main Camera's position from it.
            // Assign the result to a new Vector3 variable called 'direction'.
            Vector3 direction = checkPt - Camera.main.transform.position;

            // Used to indicate if the call to Physics.Raycast() was successful.
            bool raycastHit = false;

            // 5.a: Check if the planet is occluded by a spatial mapping surface.
            // Call Physics.Raycast() with the following arguments:
            // - Pass in the Main Camera's position as the origin.
            // - Pass in 'direction' for the direction.
            // - Pass in 'distance' for the maxDistance.
            // - Pass in SpatialMappingManager.Instance.LayerMask as layerMask.
            // Assign the result to 'raycastHit'.
            raycastHit = Physics.Raycast(Camera.main.transform.position, direction, distance, SpatialMappingManager.Instance.LayerMask);

            if (raycastHit)
            {
                // 5.a: Our raycast hit a surface, so the planet is occluded.
                // Set the occlusionObject to active.
                occlusionObject.SetActive(true);

                // At least one point is occluded, so break from the loop.
                break;
            }
            else
            {
                // 5.a: The Raycast did not hit, so the planet is not occluded.
                // Deactivate the occlusionObject.
                occlusionObject.SetActive(false);
            }
        }
    }
}
```

**Build and Deploy**

* Build and deploy the application to HoloLens, as usual.
* Wait for scanning and processing of the spatial mapping data to be complete (you should see blue lines appear on walls).
* Find and select the solar system's projection box and then set the box next to a wall or behind a counter.
* You can view basic occlusion by hiding behind surfaces to peer at the poster or projection box.
* Look for the Earth, there should be a blue highlight effect whenever it goes behind another hologram or surface.
* Watch as the planets move behind the wall or other surfaces in the room. You now have x-ray vision and can see their wireframe skeletons!

## The End

Congratulations! You have now completed **MR Spatial 230: Spatial mapping**.

* You know how to scan your environment and load spatial mapping data to Unity.
* You understand the basics of shaders and how materials can be used to re-visualize the world.
* You learned of new processing techniques for finding planes and removing triangles from a mesh.
* You were able to move and place holograms on surfaces that made sense.
* You experienced different occlusion techniques and harnessed the power of x-ray vision!
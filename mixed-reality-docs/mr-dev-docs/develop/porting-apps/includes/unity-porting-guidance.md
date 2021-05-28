# [Project settings](#tab/project)

### 1. Review the common porting steps listed above

Review the common steps listed above to make sure your development environment is set up correctly. In step #3, if you're using Visual Studio you should select the **Game Development with Unity** workload. You may deselect the "Unity Editor optional" component since you'll be installing a newer version of Unity in the next step.

### 2. Upgrade to the latest public build of Unity with Windows MR Support
1. Download the latest [recommended public build of Unity](../../install-the-tools.md) with mixed reality support.
2. Save a copy of your project before you get started
3. Review the [documentation](https://docs.unity3d.com/Manual/UpgradeGuides.html) available from Unity on upgrading if your project was built on an older version of Unity.
4. Follow the [instructions](https://docs.unity3d.com/Manual/APIUpdater.html) on Unity's site for using their automatic API updater
5. Check and see if there are additional changes that you need to make to get your project running, and work through any remaining errors and warnings. 

> [!Note] 
> If you have middleware that you depend on, check that you're using the latest release (more details in step 3 below).

### 3. Upgrade your middleware to the latest versions

With any Unity update, there's a good chance that you'll need to update one or more middleware packages that your game or application depends on. Additionally, being up to date with the latest middleware increases the likelihood of success throughout the rest of the porting process.

### 4. Target your application to run on Win32

From inside your Unity application:

* Navigate to File -> Build Settings
* Select "PC, Mac, Linux Standalone"
* Set target platform to "Windows"
* Set architecture to "x86"
Select "Switch Platform"

> [!NOTE] 
> If your application has any dependencies on device-specific services, such as match making from Steam, you'll need to disable them at this step. You can hook up to the equivalent services that Windows provides later on.

### 5. Setup your Windows Mixed Reality hardware
1. Review steps in [Immersive headset setup](/windows/mixed-reality/enthusiast-guide/before-you-start
)
2. Learn about [Using the Windows Mixed Reality simulator](../../platform-capabilities-and-apis/using-the-windows-mixed-reality-simulator.md) and [Navigating the Windows Mixed Reality home](../../../discover/navigating-the-windows-mixed-reality-home.md)

### 6. Target your application to run on Windows Mixed Reality
1. First, you must remove or conditionally compile out any other library support specific to a particular VR SDK. Those assets frequently change settings and properties on your project in ways that are incompatible with other VR SDKs, such as Windows Mixed Reality.
    * For example, if your project references the SteamVR SDK, you'll need to update your project to instead use Unity's common VR APIs that support both Windows Mixed Reality and SteamVR.
    * Specific steps for conditionally excluding other VR SDKs are coming soon.
2. In your Unity project, [target the Windows 10 SDK](../../unity/tutorials/holograms-100.md#target-windows-10-sdk)
3. For each scene, [setup the camera](../../unity/tutorials/holograms-100.md#chapter-2---setup-the-camera)

### 7. Use the stage to place content on the floor

You can build Mixed Reality experiences across a wide range of [experience scales](../../../design/coordinate-systems.md).

If you're porting a **seated-scale experience**, you must ensure Unity is set to the **Stationary** tracking space type:

```cs
XRDevice.SetTrackingSpaceType(TrackingSpaceType.Stationary);
```

This above code sets Unity's world coordinate system to track the [stationary frame of reference](../../../design/coordinate-systems.md#spatial-coordinate-systems). In the Stationary tracking mode, content placed in the editor just in front of the camera's default location (forward is -Z) appears in front of the user when the app launches. To recenter the user's seated origin, you can call Unity's [XR.InputTracking.Recenter](https://docs.unity3d.com/ScriptReference/XR.InputTracking.Recenter.html) method.

If you're porting a **standing-scale experience** or **room-scale experience**, you'll be placing content relative to the floor. You reason about the user's floor using the **[spatial stage](../../../design/coordinate-systems.md#spatial-coordinate-systems)**, which represents the user's defined floor-level origin and optional room boundary, set up during first run. For these experiences, you must ensure Unity is set to the **RoomScale** tracking space type. While RoomScale is the default, you'll want to set it explicitly and ensure you get back true, to catch situations where the user has moved their computer away from the room they calibrated:

```cs
if (XRDevice.SetTrackingSpaceType(TrackingSpaceType.RoomScale))
{
    // RoomScale mode was set successfully.  App can now assume that y=0 in Unity world coordinate represents the floor.
}
else
{
    // RoomScale mode was not set successfully.  App cannot make assumptions about where the floor plane is.
}
```

Once your app successfully sets the RoomScale tracking space type, content placed on the y=0 plane will appear on the floor. The origin at (0, 0, 0) will be the specific place on the floor where the user stood during room setup, with -Z representing the forward direction they were facing during setup.

In script code, you can then call the TryGetGeometry method on you're the UnityEngine.Experimental.XR.Boundary type to get a boundary polygon, specifying a boundary type of TrackedArea. If the user defined a boundary (you get back a list of vertices), it's safe to deliver a **room-scale experience** to the user, where they can walk around the scene you create.

The system will automatically render the boundary when the user approaches it. Your app does not need to use this polygon to render the boundary itself.

For more information, see the [Coordinate systems in Unity](../../unity/coordinate-systems-in-unity.md) page.

<!-- Some applications use a rectangle to constrain their interaction. Retrieving the largest inscribed rectangle is not directly supported in the UWP API or Unity. The example code linked to below shows how to find a rectangle within the traced bounds. It's heuristic-based so may not find the optimal solution, however, results are consistent with expectations. Parameters in the algorithm can be tuned to find more precise results at the cost of processing time. The algorithm is in a fork of the Mixed Reality Toolkit that uses the 5.6 preview MRTP version of Unity. This isn't publicly available. The code should be directly usable in 2017.2 and higher versions of Unity. The code will be ported to the current MRTK in the near future. -->

Example of results:

![Example of results](../../porting-apps/images/largestrectangle-400px.jpg)

Algorithm is based on a blog by Daniel Smilkov: [Largest rectangle in a polygon](https://d3plus.org/blog/behind-the-scenes/2014/07/08/largest-rect/)

### 8. Work through your input model

Each game or application targeting an existing HMD will have a set of inputs that it handles, types of inputs that it needs for the experience, and specific APIs that it calls to get those inputs. We've invested in trying to make it as simple and straightforward as possible to take advantage of the inputs available in Windows Mixed Reality.

Read through the [input porting guide for Unity](../porting-guides.md?tabs=input) in the adjacent tab for details of how Windows Mixed Reality exposes input, and how that maps to what your application may do today.

### 9. Performance testing and tuning

Windows Mixed Reality will be available on a broad class of devices, ranging from high end gaming PCs, down to broad market mainstream PCs. Depending on what market you're targeting, there's a significant difference in the available compute and graphics budgets for your application. During this porting exercise, you're likely leveraging a premium PC, and have had significant compute and graphics budgets available to your app. If you wish to make your app available to a broader audience, you should test and profile your app on [the representative hardware that you wish to target](/windows/mixed-reality/enthusiast-guide/windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines).

Both [Unity](https://docs.unity3d.com/Manual/Profiler.html) and [Visual Studio](/visualstudio/profiling/index) include performance profilers, and both [Microsoft](../../platform-capabilities-and-apis/understanding-performance-for-mixed-reality.md) and [Intel](https://software.intel.com/articles/vr-content-developer-guide) publish guidelines on performance profiling and optimization. There's an extensive discussion of performance available at [Understanding Performance for Mixed Reality](../../platform-capabilities-and-apis/understanding-performance-for-mixed-reality.md). Further, there are specific details for Unity under [Performance Recommendations for Unity](../../unity/performance-recommendations-for-unity.md).

# [Input mapping](#tab/input)

You can port your input logic to Windows Mixed Reality using one of two approaches, Unity's general Input.GetButton/GetAxis APIs that span across multiple platforms, or the Windows-specific XR.WSA.Input APIs that offer richer data specifically for motion controllers and HoloLens hands.

> [!IMPORTANT]
> If your using HP Reverb G2 controllers, please refer to [this article](../../unity/unity-reverb-g2-controllers.md) for additional input mapping instructions.

## Unity XR input APIs

For new projects, we recommend using the new XR input APIs from the beginning. 

You can find more information about the [XR APIs here](https://docs.unity3d.com/Manual/xr_input.html).

## Input.GetButton/GetAxis APIs

Unity currently uses its general Input.GetButton/Input.GetAxis APIs to expose input for [the Oculus SDK](https://docs.unity3d.com/Manual/OculusControllers.html) and [the OpenVR SDK](https://docs.unity3d.com/Manual/OpenVRControllers.html). If your apps are already using these APIs for input, this is the easiest path for supporting motion controllers in Windows Mixed Reality: you should just need to remap buttons and axes in the Input Manager.

For more information, see the [Unity button/axis mapping table](../../unity/motion-controllers-in-unity.md#unity-buttonaxis-mapping-table) and the [overview of the common Unity APIs](../../unity/motion-controllers-in-unity.md#common-unity-apis-inputgetbuttongetaxis).

## Windows-specific XR.WSA.Input APIs

> [!CAUTION]
> If your project is using any of the XR.WSA APIs, these are being phased out in favor of the XR SDK in future Unity releases. For new projects, we recommend using the XR SDK from the beginning. You can find more information about the [XR Input system and APIs here](https://docs.unity3d.com/Manual/xr_input.html).

If your app already builds custom input logic for each platform, you can choose to use the Windows-specific spatial input APIs under the **UnityEngine.XR.WSA.Input** namespace. This lets you access additional information, such as position accuracy or the source kind, letting you tell hands and controllers apart on HoloLens.

> [!NOTE]
> If you're using HP Reverb G2 controllers, all input APIs will continue to work except for **InteractionSource.supportsTouchpad**, which will return false with no touchpad data.

For more information, see the [overview of the UnityEngine.XR.WSA.Input APIs](../../unity/motion-controllers-in-unity.md#windows-specific-apis-xrwsainput).

## Grip pose vs. pointing pose

Windows Mixed Reality supports motion controllers in a variety of form factors, with each controller's design differing in its relationship between the user's hand position and the natural "forward" direction that apps should use for pointing when rendering the controller.

To better represent these controllers, there are two kinds of poses you can investigate for each interaction source:

* The **grip pose**, representing the location of either the palm of a hand detected by a HoloLens, or the palm holding a motion controller.
    * On immersive headsets, this pose is best used to render **the user's hand** or **an object held in the user's hand**, such as a sword or gun.
    * The **grip position**: The palm centroid when holding the controller naturally, adjusted left or right to center the position within the grip.
    * The **grip orientation's Right axis**: When you completely open your hand to form a flat 5-finger pose, the ray that is normal to your palm (forward from left palm, backward from right palm)
    * The **grip orientation's Forward axis**: When you close your hand partially (as if holding the controller), the ray that points "forward" through the tube formed by your non-thumb fingers.
    * The **grip orientation's Up axis**: The Up axis implied by the Right and Forward definitions.
    * You can access the grip pose through either Unity's cross-vendor input API (**[XR.InputTracking](https://docs.unity3d.com/ScriptReference/XR.InputTracking.html).GetLocalPosition/Rotation**) or through the Windows-specific API (**sourceState.sourcePose.TryGetPosition/Rotation**, requesting the Grip pose).
* The **pointer pose**, representing the tip of the controller pointing forward.
    * This pose is best used to raycast when **pointing at UI** when you are rendering the controller model itself.
    * Currently, the pointer pose is available only through the Windows-specific API (**sourceState.sourcePose.TryGetPosition/Rotation**, requesting the Pointer pose).

These pose coordinates are all expressed in Unity world coordinates.
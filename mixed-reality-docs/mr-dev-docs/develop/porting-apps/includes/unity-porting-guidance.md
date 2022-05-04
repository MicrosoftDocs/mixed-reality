Review the common steps to make sure your development environment is set up correctly. If you're using Visual Studio, select the **Game Development with Unity** workload. You can deselect the **Unity Editor optional** component, since you'll install a newer version of Unity.

To port existing Unity content, follow these steps:

### 1. Upgrade to the latest public build of Unity with Windows MR Support

1. Save a copy of your project before you get started.
1. [Download the latest recommended public build of Unity](../../install-the-tools.md) with mixed reality support.
1. If your project was built on an older version of Unity, review the [Unity Upgrade Guides](https://docs.unity3d.com/Manual/UpgradeGuides.html).
1. Follow the instructions for using Unity's [automatic API updater](https://docs.unity3d.com/Manual/APIUpdater.html).
1. See if you need to make any other changes to get your project running, and work through any remaining errors and warnings.

### 2. Upgrade your middleware to the latest versions

With any Unity update, you might need to update one or more middleware packages that your game or application depends on. Updating to the latest middleware increases the likelihood of success throughout the rest of the porting process.

### 3. Target your application to run on Win32

From inside your Unity application:

1. Navigate to **File** > **Build Settings**.
1. Select **PC, Mac, Linux Standalone**.
1. Set target platform to **Windows**.
1. Set architecture to **x86**.
1. Select **Switch Platform**.

> [!NOTE]
> If your application has any dependencies on device-specific services, such as match making from Steam, disable them at this step. You can hook up the Windows equivalent services later.

### 4. Target your application to run on Windows Mixed Reality

1. Remove or conditionally compile out any library support specific to another VR SDK. Those assets frequently change settings and properties on your project in ways that are incompatible with VR SDKs like Windows Mixed Reality.

   For example, if your project references the SteamVR SDK, update your project to instead use Unity's common VR APIs, which support both Windows Mixed Reality and SteamVR.
1. In your Unity project, [target the Windows 10 SDK](../../unity/tutorials/holograms-100.md#target-windows-10-sdk).
3. For each scene, [set up the camera](../../unity/tutorials/holograms-100.md#chapter-2---setup-the-camera).

### 5. Set up your Windows Mixed Reality hardware

1. Review steps in [Immersive headset setup](/windows/mixed-reality/enthusiast-guide/before-you-start).
1. Learn how to [Use the Windows Mixed Reality simulator](../../advanced-concepts/using-the-windows-mixed-reality-simulator.md) and [Navigate the Windows Mixed Reality home](../../../discover/navigating-the-windows-mixed-reality-home.md).

### 6. Use the stage to place content on the floor

You can build Mixed Reality experiences across a wide range of [experience scales](../../../design/coordinate-systems.md). If you're porting a *seated-scale experience*, make sure Unity is set to the **Stationary** tracking space type:

```cs
XRDevice.SetTrackingSpaceType(TrackingSpaceType.Stationary);
```

This code sets Unity's world coordinate system to track the [stationary frame of reference](../../../design/coordinate-systems.md#spatial-coordinate-systems). In the Stationary tracking mode, content you place in the editor just in front of the camera's default location (forward is -Z) appears in front of the user when the app launches. To recenter the user's seated origin, you can call Unity's [XR.InputTracking.Recenter](https://docs.unity3d.com/ScriptReference/XR.InputTracking.Recenter.html) method.

If you're porting a *standing-scale experience* or *room-scale experience*, you're placing content relative to the floor. You reason about the user's floor using the [spatial stage](../../../design/coordinate-systems.md#spatial-coordinate-systems), which represents the user's defined floor-level origin. The spatial stage can include an optional room boundary you set up during the first run.

For these experiences, make sure Unity is set to the **RoomScale** tracking space type. RoomScale is the default, but set it explicitly and ensure you get back `true`. This practice catches situations where the user has moved their computer away from the room they calibrated.

```cs
if (XRDevice.SetTrackingSpaceType(TrackingSpaceType.RoomScale))
{
    // RoomScale mode was set successfully.  App can now assume that y=0 in Unity world coordinate represents the floor.
}
else
{
    // RoomScale mode was not set successfully.  App can't make assumptions about where the floor plane is.
}
```

Once your app successfully sets the RoomScale tracking space type, content placed on the y=0 plane appears on the floor. The origin at (0, 0, 0) is the specific place on the floor where the user stood during room setup, with -Z representing the forward direction they faced during setup.

In script code, you can then call the `TryGetGeometry` method on the `UnityEngine.Experimental.XR.Boundary` type to get a boundary polygon, specifying a boundary type of `TrackedArea`. If the user defined a boundary, you get back a list of vertices. You can then deliver a *room-scale experience* to the user, where they can walk around the scene you create.

The system automatically renders the boundary when the user approaches it. Your app doesn't need to use this polygon to render the boundary itself.

For more information, see [Coordinate systems in Unity](../../unity/coordinate-systems-in-unity.md).

<!-- Some applications use a rectangle to constrain their interaction. Retrieving the largest inscribed rectangle is not directly supported in the UWP API or Unity. The example code linked to below shows how to find a rectangle within the traced bounds. It's heuristic-based so may not find the optimal solution, however, results are consistent with expectations. Parameters in the algorithm can be tuned to find more precise results at the cost of processing time. The algorithm is in a fork of the Mixed Reality Toolkit that uses the 5.6 preview MRTP version of Unity. This isn't publicly available. The code should be directly usable in 2017.2 and higher versions of Unity. The code will be ported to the current MRTK in the near future. -->

Example of results:

![Example of results](../../porting-apps/images/largestrectangle-400px.jpg)

### 7. Work through your input model

Each game or application that targets an existing head-mounted display (HMD) has a set of inputs that it handles, types of inputs that it needs for the experience, and specific APIs that it calls to get those inputs. It's simple and straightforward to take advantage of the inputs available in Windows Mixed Reality.

See the [input porting guide for Unity](../input-porting-guide-for-unity.md) for details about how Windows Mixed Reality exposes input, and how the input maps to what your application does now.

> [!IMPORTANT]
> If you use HP Reverb G2 controllers, see [HP Reverb G2 Controllers in Unity](../../unity/unity-reverb-g2-controllers.md) for further input mapping instructions.

### 8. Test and tune performance

Windows Mixed Reality is available on many devices, ranging from high end gaming PCs to broad market mainstream PCs. These devices have significantly different compute and graphics budgets available for your application. If you ported your app using a premium PC with significant compute and graphics budgets, be sure to test and profile your app on hardware that represents the market you want to target. For more information, see [Windows Mixed Reality minimum PC hardware compatibility guidelines](/windows/mixed-reality/enthusiast-guide/windows-mixed-reality-minimum-pc-hardware-compatibility-guidelines).

Both [Unity](https://docs.unity3d.com/Manual/Profiler.html) and [Visual Studio](/visualstudio/profiling/index) include performance profilers, and both [Microsoft](../../advanced-concepts/understanding-performance-for-mixed-reality.md) and [Intel](https://software.intel.com/articles/vr-content-developer-guide) publish guidelines on performance profiling and optimization.

For an extensive discussion of performance, see [Understand performance for Mixed Reality](../../advanced-concepts/understanding-performance-for-mixed-reality.md). For specific details about Unity, see [Performance recommendations for Unity](../../unity/performance-recommendations-for-unity.md).

## Input mapping

For information and instructions, see [Input porting guide for Unity](../input-porting-guide-for-unity.md).

> [!IMPORTANT]
> If you use HP Reverb G2 controllers, see [HP Reverb G2 Controllers in Unity](../../unity/unity-reverb-g2-controllers.md) for further input mapping instructions.


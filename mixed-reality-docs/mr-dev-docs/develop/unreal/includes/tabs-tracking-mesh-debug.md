# [4.25](#tab/425)

Unavailable in Unreal 4.25 or earlier.

# [4.26](#tab/426)

> [!IMPORTANT]
> Hand meshes are supported in OpenXR only, not in Windows Mixed Reality. 

The hand meshes can be used for various reasons, primarily in debug purposes. The recommended way to visualize hand mesh is to use Epic’s XRVisualization plugin together with Microsoft-OpenXR-Unreal. 

Then in the blueprint editor, you should use **Set Use Hand Mesh** function from Microsoft-OpenXR-Unreal with **Enabled XRVisualization** as a parameter:

![Blueprint of event begin play connected to set use hand mesh function with enabled xrvisualization mode](../images/unreal-hand-tracking-img-05.png)

To manage the rendering process, you should use **Render Motion Controller** from XRVisualization:

![Blueprint of get motion controller data function connected to render motion controller function](../images/unreal-hand-tracking-img-06.png)

The result:

![Image of digital hand overlayed on a real human hand](../images/unreal-hand-tracking-img-07.png)
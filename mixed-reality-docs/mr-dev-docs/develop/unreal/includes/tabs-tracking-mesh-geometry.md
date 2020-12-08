# [4.25](#tab/425)

Unavailable in Unreal 4.25 or earlier.

# [4.26](#tab/426)

The previous section describes a simple but not configurable way to show hand meshes. If you need anything more complicated, such as drawing a hand mesh with a custom shader, you need to get the meshes as a tracked geometry. 

To enable that mode you should call **Set Use Hand Mesh** with **Enabled Tracking Geometry**:

![Blueprint of event begin play connected to set use hand mesh function with enabled tracking geometry mode](../images/unreal-hand-tracking-img-08.png)

> [!NOTE]
> It’s not possible for both modes to be enabled at the same time. If you enable one, the other is automatically disabled. 
# [MRTK](#tab/mrtk)
<!-- NEVER CHANGE THE ABOVE LINE! -->

MRTK provides an in-box [teleport system](/windows/mixed-reality/mrtk-unity/features/teleport-system/teleport-system) which automatically works across articulated hands and controllers.

# [XR SDK](#tab/xr)
<!-- NEVER CHANGE THE ABOVE LINE! -->

We recommend using MRTK's teleportation implementation.
If you choose not to use MRTK, Unity provides a teleportation implementation in the [XR Interaction Toolkit](https://docs.unity3d.com/Packages/com.unity.xr.interaction.toolkit@1.0/manual/locomotion.html).
If you choose to implement your own, it's good to keep in mind that you can't move the camera directly. Due to Unity's control of the camera for head tracking, you'll need to give the camera a parent in the hierarchy and move that GameObject instead. This is the equivalent of MRTK's Playspace.

# [Legacy WSA](#tab/wsa)
<!-- NEVER CHANGE THE ABOVE LINE! -->

We recommend using MRTK's teleportation implementation.
If you choose to implement your own, it's good to keep in mind that you can't move the camera directly. Due to Unity's control of the camera for head tracking, you'll need to give the camera a parent in the hierarchy and move that GameObject instead. This is the equivalent of MRTK's Playspace.